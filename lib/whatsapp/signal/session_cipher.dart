import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart'
    show generateX25519KeyPair, hkdfExpand, x25519SharedKey;
import 'double_ratchet.dart';
import 'signal_keys.dart' show PreKeyBundle;
import 'signal_store.dart';
import 'x3dh.dart';

// ---------------------------------------------------------------------------
// Ciphertext message types
// ---------------------------------------------------------------------------

enum CiphertextType { preKey, whisper }

class CiphertextMessage {
  final CiphertextType type;

  /// Serialised header + ciphertext.
  final Uint8List serialized;

  const CiphertextMessage({required this.type, required this.serialized});
}

// ---------------------------------------------------------------------------
// Session cipher (1-to-1 messages)
// ---------------------------------------------------------------------------

/// Encrypt and decrypt individual Signal Protocol messages for a single
/// [recipientAddress] (JID + device ID, e.g. "5511999@s.whatsapp.net:0").
///
/// On first contact this performs X3DH + Double Ratchet initialisation
/// (producing a PreKeyMessage). Subsequent messages use the ratchet directly.
class SessionCipher {
  final SignalProtocolStore store;
  final String recipientAddress;

  SessionCipher({required this.store, required this.recipientAddress});

  // ---------------------------------------------------------------------------
  // Encrypt
  // ---------------------------------------------------------------------------

  Future<CiphertextMessage> encrypt(Uint8List plaintext) async {
    var session = await store.loadSession(recipientAddress);

    if (session == null) {
      // No session yet — we need a pre-key bundle to do X3DH.
      // The bundle is fetched externally and passed to [initSession].
      throw StateError(
          'No session for $recipientAddress. Call initSession() first.');
    }

    final state = _deserialiseState(session.serialized);
    final (header, ciphertext) = await ratchetEncrypt(state, plaintext);

    // Persist updated state.
    await store.storeSession(
        recipientAddress, SessionRecord(serialized: _serialiseState(state)));

    final headerBytes = header.encode();
    final msg = Uint8List(1 + headerBytes.length + ciphertext.length);
    msg[0] = CiphertextType.whisper.index;
    msg.setAll(1, headerBytes);
    msg.setAll(1 + headerBytes.length, ciphertext);

    return CiphertextMessage(type: CiphertextType.whisper, serialized: msg);
  }

  // ---------------------------------------------------------------------------
  // Decrypt
  // ---------------------------------------------------------------------------

  Future<Uint8List> decrypt(CiphertextMessage message) async {
    if (message.type == CiphertextType.preKey) {
      return _decryptPreKey(message.serialized);
    }
    return _decryptWhisper(message.serialized);
  }

  Future<Uint8List> _decryptWhisper(Uint8List serialized) async {
    final session = await store.loadSession(recipientAddress);
    if (session == null) throw StateError('No session for $recipientAddress');

    final state = _deserialiseState(session.serialized);
    final headerBytes = serialized.sublist(1, 41); // 40-byte header
    final ciphertext = serialized.sublist(41);

    final header = RatchetHeader.decode(headerBytes);
    final plaintext = await ratchetDecrypt(state, header, ciphertext);

    await store.storeSession(
        recipientAddress, SessionRecord(serialized: _serialiseState(state)));
    return plaintext;
  }

  Future<Uint8List> _decryptPreKey(Uint8List serialized) async {
    // PreKeyMessage layout (simplified):
    // [1 type] [4 regId] [4 preKeyId] [4 spkId] [32 ephemeral] [32 identityKey]
    // [40 header] [n ciphertext]
    final offset = 1;
    final regId = _readUint32(serialized, offset);
    final preKeyId = _readUint32(serialized, offset + 4);
    final spkId = _readUint32(serialized, offset + 8);
    final ephemeralKey = serialized.sublist(offset + 12, offset + 44);
    final senderIdentityKey = serialized.sublist(offset + 44, offset + 76);
    final headerBytes = serialized.sublist(offset + 76, offset + 116);
    final ciphertext = serialized.sublist(offset + 116);

    // Load our keys.
    final identityKP = await store.getIdentityKeyPair();
    final spk = await _loadSpkOrThrow(spkId);
    final otpk = preKeyId != 0 ? await store.loadPreKey(preKeyId) : null;

    // X3DH recipient-side.
    final sharedSecret = await x3dhRespond(
      identityKey: identityKP,
      signedPreKey: spk.keyPair,
      oneTimePreKey: otpk?.keyPair,
      aliceIdentityKey: senderIdentityKey,
      aliceEphemeralKey: ephemeralKey,
    );

    // Initialise Double Ratchet as receiver.
    final state = await initReceiver(
      sharedSecret: sharedSecret,
      ourRatchetKey: spk.keyPair,
    );

    // Trust sender identity (TOFU).
    await store.saveIdentity(recipientAddress, senderIdentityKey);

    // Decrypt with the ratchet.
    final header = RatchetHeader.decode(headerBytes);

    // For the first message we need to perform the DH ratchet step manually
    // since Bob hasn't yet received any DH key from Alice.
    state.dhRemotePublicKey = header.dhPublicKey;
    final remotePub =
        SimplePublicKey(header.dhPublicKey, type: KeyPairType.x25519);
    final dh = await x25519SharedKey(spk.keyPair, remotePub);
    final rkKeys = await _kdfRootKey(sharedSecret, dh);
    state.rootKey = rkKeys[0];
    state.receivingChainKey = rkKeys[1];
    state.dhSendingKeyPair = await _newSendingKey(state, remotePub);

    final plaintext = await ratchetDecrypt(state, header, ciphertext);

    // Persist session.
    await store.storeSession(
        recipientAddress, SessionRecord(serialized: _serialiseState(state)));

    // Remove consumed one-time pre-key.
    if (preKeyId != 0) await store.removePreKey(preKeyId);

    // Suppress unused variable warning.
    regId;

    return plaintext;
  }

  // ---------------------------------------------------------------------------
  // Session initialisation (sender side)
  // ---------------------------------------------------------------------------

  /// Establish a new session using a pre-key bundle fetched from the server.
  Future<CiphertextMessage> initSession({
    required PreKeyBundle bundle,
    required Uint8List plaintext,
  }) async {
    final identityKP = await store.getIdentityKeyPair();

    final x3dhResult = await x3dhInitiate(
      identityKey: identityKP,
      bundle: bundle,
    );

    final state = await initSender(
      sharedSecret: x3dhResult.sharedSecret,
      recipientRatchetKey: bundle.signedPreKeyPublic,
    );

    final (header, ciphertext) = await ratchetEncrypt(state, plaintext);

    await store.storeSession(
        recipientAddress, SessionRecord(serialized: _serialiseState(state)));

    // Trust recipient identity.
    await store.saveIdentity(recipientAddress, bundle.identityKey);

    final regId = bundle.registrationId;
    final spkId = bundle.signedPreKeyId;
    final otpkId = x3dhResult.usedOneTimePreKeyId ?? 0;

    final senderIdentity = await identityKP.extractPublicKey();
    final senderIdentityBytes =
        Uint8List.fromList(senderIdentity.bytes);

    // Build PreKeyMessage.
    final headerBytes = header.encode();
    final msg = Uint8List(1 + 4 + 4 + 4 + 32 + 32 + headerBytes.length +
        ciphertext.length);
    var off = 0;
    msg[off++] = CiphertextType.preKey.index;
    _writeUint32(msg, off, regId);
    off += 4;
    _writeUint32(msg, off, otpkId);
    off += 4;
    _writeUint32(msg, off, spkId);
    off += 4;
    msg.setAll(off, x3dhResult.ephemeralPublic);
    off += 32;
    msg.setAll(off, senderIdentityBytes);
    off += 32;
    msg.setAll(off, headerBytes);
    off += headerBytes.length;
    msg.setAll(off, ciphertext);

    return CiphertextMessage(type: CiphertextType.preKey, serialized: msg);
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Future<PreKeyRecord> _loadSpkOrThrow(int id) async {
    // Signed pre-keys are stored alongside regular pre-keys in the store
    // under a special ID range; load by ID.
    // For simplicity, we use a convention: signed pre-keys have IDs >= 0x80000000.
    final spk = await store.loadPreKey(0x80000000 | id);
    if (spk == null) throw StateError('Signed pre-key $id not found');
    return spk;
  }

  Future<SimpleKeyPair> _newSendingKey(
      RatchetState state, SimplePublicKey remotePub) async {
    // Already done in _dhRatchetStep — but for the very first decrypt we need
    // to generate a fresh sending key manually.
    final newKP = await generateX25519KeyPair();
    return newKP;
  }

  // Placeholder serialisation — in production, use a proper binary format.
  Uint8List _serialiseState(RatchetState state) {
    // Minimal: just store root key + chain keys for now.
    // Full serialisation implemented in signal_store.dart when sessions are persisted.
    return state.rootKey;
  }

  RatchetState _deserialiseState(Uint8List bytes) {
    // This stub is replaced by the full implementation once sessions are
    // loaded from disk with the complete serialised state.
    throw UnimplementedError(
        'Full session deserialisation not yet implemented — '
        'this will be completed in Phase 5 (message send/receive).');
  }

  static int _readUint32(Uint8List b, int offset) =>
      (b[offset] << 24) | (b[offset + 1] << 16) | (b[offset + 2] << 8) | b[offset + 3];

  static void _writeUint32(Uint8List b, int offset, int value) {
    b[offset] = (value >> 24) & 0xff;
    b[offset + 1] = (value >> 16) & 0xff;
    b[offset + 2] = (value >> 8) & 0xff;
    b[offset + 3] = value & 0xff;
  }
}

// Re-export needed by _decryptPreKey.
Future<List<Uint8List>> _kdfRootKey(
    Uint8List rootKey, Uint8List dhOutput) async {
  return hkdfExpand(dhOutput, 64, salt: rootKey)
      .then((out) => [out.sublist(0, 32), out.sublist(32)]);
}
