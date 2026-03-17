import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart';
import 'signal_keys.dart';

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const _maxSkipKeys = 1000;
const _messageKeyInfo = 'WhisperMessageKeys';
const _rootKeyInfo = 'WhisperText';

// ---------------------------------------------------------------------------
// Message key
// ---------------------------------------------------------------------------

/// Keys derived for a single message.
class MessageKeys {
  final Uint8List cipherKey;
  final Uint8List macKey;
  final Uint8List iv;

  const MessageKeys({
    required this.cipherKey,
    required this.macKey,
    required this.iv,
  });
}

// ---------------------------------------------------------------------------
// Ratchet header
// ---------------------------------------------------------------------------

/// Double Ratchet message header (sent alongside ciphertext).
class RatchetHeader {
  /// Sender's current DH ratchet public key.
  final Uint8List dhPublicKey;

  /// Number of messages sent in the previous sending chain.
  final int prevChainLength;

  /// Message index in the current sending chain.
  final int messageIndex;

  const RatchetHeader({
    required this.dhPublicKey,
    required this.prevChainLength,
    required this.messageIndex,
  });

  Uint8List encode() {
    // Format: [32 dhPub] [4 prevChainLength big-endian] [4 messageIndex big-endian]
    final out = Uint8List(40);
    out.setAll(0, dhPublicKey);
    final bd = ByteData.view(out.buffer);
    bd.setUint32(32, prevChainLength, Endian.big);
    bd.setUint32(36, messageIndex, Endian.big);
    return out;
  }

  static RatchetHeader decode(Uint8List bytes) {
    final bd = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length);
    return RatchetHeader(
      dhPublicKey: bytes.sublist(0, 32),
      prevChainLength: bd.getUint32(32, Endian.big),
      messageIndex: bd.getUint32(36, Endian.big),
    );
  }
}

// ---------------------------------------------------------------------------
// Ratchet state
// ---------------------------------------------------------------------------

/// Full Double Ratchet state for one session.
class RatchetState {
  /// Root key (32 bytes).
  Uint8List rootKey;

  /// Sending chain key (32 bytes).
  Uint8List? sendingChainKey;

  /// Receiving chain key (32 bytes, null until first DH ratchet step).
  Uint8List? receivingChainKey;

  /// Our current DH ratchet key pair.
  SimpleKeyPair dhSendingKeyPair;

  /// Remote party's current DH ratchet public key.
  Uint8List? dhRemotePublicKey;

  /// Number of messages sent in the current sending chain.
  int sendingChainMsgCount = 0;

  /// Number of messages received in the current receiving chain.
  int receivingChainMsgCount = 0;

  /// Number of messages sent in the previous sending chain.
  int prevSendingChainMsgCount = 0;

  /// Skipped message keys: (dhPub+index) → MessageKeys.
  final Map<String, MessageKeys> skippedKeys = {};

  RatchetState({
    required this.rootKey,
    required this.dhSendingKeyPair,
    this.sendingChainKey,
    this.receivingChainKey,
    this.dhRemotePublicKey,
  });
}

// ---------------------------------------------------------------------------
// Initialisation
// ---------------------------------------------------------------------------

/// Initialise as the sender (Alice) after X3DH.
///
/// [sharedSecret]         — output of x3dhInitiate().
/// [recipientRatchetKey]  — Bob's signed pre-key public (used as initial DH key).
Future<RatchetState> initSender({
  required Uint8List sharedSecret,
  required Uint8List recipientRatchetKey,
}) async {
  final sendingKP = await generateX25519KeyPair();
  final bobRatchetPub =
      SimplePublicKey(recipientRatchetKey, type: KeyPairType.x25519);

  // Root key derivation: RK, CK_s = KDF_RK(SK, DH(sending_kp, Bob_ratchet))
  final dh = await x25519SharedKey(sendingKP, bobRatchetPub);
  final keys = await _kdfRootKey(sharedSecret, dh);

  return RatchetState(
    rootKey: keys[0],
    dhSendingKeyPair: sendingKP,
    sendingChainKey: keys[1],
    dhRemotePublicKey: recipientRatchetKey,
  );
}

/// Initialise as the receiver (Bob) after X3DH.
///
/// [sharedSecret]  — output of x3dhRespond().
/// [ourRatchetKey] — Bob's signed pre-key pair (used for the first DH step).
Future<RatchetState> initReceiver({
  required Uint8List sharedSecret,
  required SimpleKeyPair ourRatchetKey,
}) async {
  return RatchetState(
    rootKey: sharedSecret,
    dhSendingKeyPair: ourRatchetKey,
    // No sending chain yet — Bob hasn't sent anything.
    // receivingChainKey is null until we see Alice's first message.
  );
}

// ---------------------------------------------------------------------------
// Encrypt
// ---------------------------------------------------------------------------

/// Encrypt [plaintext] and advance the sending chain.
///
/// Returns [header] (to be sent with the message) and [ciphertext].
Future<(RatchetHeader, Uint8List, MessageKeys)> ratchetEncrypt(
    RatchetState state, Uint8List plaintext) async {
  final ck = state.sendingChainKey;
  if (ck == null) throw StateError('Sending chain not initialised');

  // Derive message key and advance chain.
  final msgKeys = await _deriveMessageKeys(ck);
  state.sendingChainKey = await _advanceChainKey(ck);

  final header = RatchetHeader(
    dhPublicKey: await publicKeyBytes(state.dhSendingKeyPair),
    prevChainLength: state.prevSendingChainMsgCount,
    messageIndex: state.sendingChainMsgCount,
  );
  state.sendingChainMsgCount++;

  final ciphertext = await _aesEncrypt(plaintext, msgKeys);
  return (header, ciphertext, msgKeys);
}

// ---------------------------------------------------------------------------
// Decrypt
// ---------------------------------------------------------------------------

/// Decrypt [ciphertext] using [header] and advance the receiving chain.
Future<(Uint8List, MessageKeys)> ratchetDecrypt(
    RatchetState state, RatchetHeader header, Uint8List ciphertext) async {
  // Check skipped keys first.
  final skipKey = _skippedKeyId(header);
  final cached = state.skippedKeys.remove(skipKey);
  if (cached != null) {
    final plaintext = await _aesDecrypt(ciphertext, cached);
    return (plaintext, cached);
  }

  // DH ratchet step if sender used a new key.
  final remoteKey = state.dhRemotePublicKey;
  if (remoteKey == null ||
      !_bytesEqual(header.dhPublicKey, remoteKey)) {
    await _skipMessageKeys(state, header.prevChainLength);
    await _dhRatchetStep(state, header.dhPublicKey);
  }

  // Advance receiving chain to the target message.
  await _skipMessageKeys(state, header.messageIndex);

  final ck = state.receivingChainKey;
  if (ck == null) throw StateError('Receiving chain not initialised');

  final msgKeys = await _deriveMessageKeys(ck);
  state.receivingChainKey = await _advanceChainKey(ck);
  state.receivingChainMsgCount++;

  final plaintext = await _aesDecrypt(ciphertext, msgKeys);
  return (plaintext, msgKeys);
}

// ---------------------------------------------------------------------------
// DH ratchet step
// ---------------------------------------------------------------------------

Future<void> _dhRatchetStep(
    RatchetState state, Uint8List newRemoteKey) async {
  state.prevSendingChainMsgCount = state.sendingChainMsgCount;
  state.sendingChainMsgCount = 0;
  state.receivingChainMsgCount = 0;
  state.dhRemotePublicKey = newRemoteKey;

  final remotePub =
      SimplePublicKey(newRemoteKey, type: KeyPairType.x25519);

  // Receiving chain: RK, CK_r = KDF_RK(RK, DH(current_send_kp, new_remote))
  final dh1 = await x25519SharedKey(state.dhSendingKeyPair, remotePub);
  final keys1 = await _kdfRootKey(state.rootKey, dh1);
  state.rootKey = keys1[0];
  state.receivingChainKey = keys1[1];

  // New sending key pair.
  state.dhSendingKeyPair = await generateX25519KeyPair();

  // Sending chain: RK, CK_s = KDF_RK(RK, DH(new_send_kp, remote))
  final dh2 = await x25519SharedKey(state.dhSendingKeyPair, remotePub);
  final keys2 = await _kdfRootKey(state.rootKey, dh2);
  state.rootKey = keys2[0];
  state.sendingChainKey = keys2[1];
}

// ---------------------------------------------------------------------------
// Skip message keys (for out-of-order delivery)
// ---------------------------------------------------------------------------

Future<void> _skipMessageKeys(RatchetState state, int untilIndex) async {
  var ck = state.receivingChainKey;
  if (ck == null) return;

  while (state.receivingChainMsgCount < untilIndex) {
    if (state.skippedKeys.length >= _maxSkipKeys) {
      throw StateError('Too many skipped message keys');
    }
    final msgKeys = await _deriveMessageKeys(ck!);
    final id = _skippedKeyIdFrom(
        state.dhRemotePublicKey!, state.receivingChainMsgCount);
    state.skippedKeys[id] = msgKeys;
    ck = await _advanceChainKey(ck);
    state.receivingChainMsgCount++;
  }
  state.receivingChainKey = ck;
}

// ---------------------------------------------------------------------------
// KDF helpers (Double Ratchet spec)
// ---------------------------------------------------------------------------

/// KDF_RK: HKDF-SHA256 with root key as salt, DH output as IKM.
/// Returns [new_root_key, new_chain_key].
Future<List<Uint8List>> _kdfRootKey(
    Uint8List rootKey, Uint8List dhOutput) async {
  final out = await hkdfExpand(
    dhOutput,
    64,
    salt: rootKey,
    info: Uint8List.fromList(_rootKeyInfo.codeUnits),
  );
  return [out.sublist(0, 32), out.sublist(32)];
}

/// Derive message keys from a chain key using HMAC-SHA256.
Future<MessageKeys> _deriveMessageKeys(Uint8List chainKey) async {
  final material = await hkdfExpand(
    chainKey,
    80,
    salt: Uint8List(32),
    info: Uint8List.fromList(_messageKeyInfo.codeUnits),
  );
  return MessageKeys(
    cipherKey: material.sublist(0, 32),
    macKey: material.sublist(32, 64),
    iv: material.sublist(64, 80),
  );
}

/// Advance chain key: new_ck = HMAC-SHA256(ck, 0x02).
Future<Uint8List> _advanceChainKey(Uint8List ck) async {
  return hmacSha256(Uint8List.fromList([0x02]), ck);
}

// ---------------------------------------------------------------------------
// AES-256-CBC encryption for ratchet messages
// ---------------------------------------------------------------------------

Future<Uint8List> _aesEncrypt(Uint8List plaintext, MessageKeys keys) async {
  return aesEncryptCBC(plaintext, keys.cipherKey, keys.iv);
}

Future<Uint8List> _aesDecrypt(Uint8List ciphertext, MessageKeys keys) async {
  return aesDecryptCBC(ciphertext, keys.cipherKey, keys.iv);
}

// ---------------------------------------------------------------------------
// Misc helpers
// ---------------------------------------------------------------------------

String _skippedKeyId(RatchetHeader header) =>
    _skippedKeyIdFrom(header.dhPublicKey, header.messageIndex);

String _skippedKeyIdFrom(Uint8List dhPub, int index) =>
    '${dhPub.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}:$index';

bool _bytesEqual(Uint8List a, Uint8List b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
