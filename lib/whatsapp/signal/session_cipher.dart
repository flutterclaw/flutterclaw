import 'dart:convert';
import 'dart:typed_data';

import '../noise/noise_crypto.dart' show hmacSha256;
import '../proto/wa_proto.pb.dart' as wa_proto;
import 'double_ratchet.dart';
import 'signal_keys.dart' show PreKeyBundle, keyPairToJson, keyPairFromJson;
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

const _currentSignalVersion = 3;
const _macLength = 8;

int _signalVersionByte() =>
    ((_currentSignalVersion & 0x0f) << 4) | (_currentSignalVersion & 0x0f);

int _signalMessageVersion(int versionByte) => (versionByte >> 4) & 0x0f;

class _ParsedSignalMessage {
  final int version;
  final RatchetHeader header;
  final Uint8List ciphertext;
  final Uint8List mac;
  final Uint8List serializedNoMac;

  const _ParsedSignalMessage({
    required this.version,
    required this.header,
    required this.ciphertext,
    required this.mac,
    required this.serializedNoMac,
  });
}

class _ParsedPreKeySignalMessage {
  final int version;
  final int registrationId;
  final int preKeyId;
  final int signedPreKeyId;
  final Uint8List baseKey;
  final Uint8List identityKey;
  final Uint8List signalMessageBytes;

  const _ParsedPreKeySignalMessage({
    required this.version,
    required this.registrationId,
    required this.preKeyId,
    required this.signedPreKeyId,
    required this.baseKey,
    required this.identityKey,
    required this.signalMessageBytes,
  });
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

    final state = await _deserialiseState(session.serialized);
    final (header, ciphertext, msgKeys) =
        await ratchetEncrypt(state, plaintext);

    final ourIdentity = await store.getIdentityKeyPair();
    final ourIdentityPub =
        Uint8List.fromList((await ourIdentity.extractPublicKey()).bytes);
    final theirIdentity = await store.loadIdentityKey(recipientAddress);
    if (theirIdentity == null) {
      throw StateError('Missing identity for $recipientAddress');
    }

    final signalMsg = await _buildSignalMessage(
      header: header,
      ciphertext: ciphertext,
      msgKeys: msgKeys,
      senderIdentityKey: ourIdentityPub,
      receiverIdentityKey: theirIdentity,
    );

    // Persist updated state.
    await store.storeSession(
      recipientAddress,
      SessionRecord(serialized: await _serialiseState(state)),
    );

    return CiphertextMessage(type: CiphertextType.whisper, serialized: signalMsg);
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

    final state = await _deserialiseState(session.serialized);
    final parsed = _parseSignalMessage(serialized);

    final (plaintext, msgKeys) =
        await ratchetDecrypt(state, parsed.header, parsed.ciphertext);

    final senderIdentity = await store.loadIdentityKey(recipientAddress);
    if (senderIdentity == null) {
      throw StateError('Missing identity for $recipientAddress');
    }
    final ourIdentity = await store.getIdentityKeyPair();
    final ourIdentityPub =
        Uint8List.fromList((await ourIdentity.extractPublicKey()).bytes);

    final mac = await _calculateMac(
      macKey: msgKeys.macKey,
      senderIdentityKey: senderIdentity,
      receiverIdentityKey: ourIdentityPub,
      message: parsed.serializedNoMac,
    );

    if (!_bytesEqual(mac, parsed.mac)) {
      throw StateError('Bad MAC for $recipientAddress');
    }

    await store.storeSession(
      recipientAddress,
      SessionRecord(serialized: await _serialiseState(state)),
    );
    return plaintext;
  }

  Future<Uint8List> _decryptPreKey(Uint8List serialized) async {
    final parsed = _parsePreKeySignalMessage(serialized);
    final inner = _parseSignalMessage(parsed.signalMessageBytes);

    // Load our keys.
    final identityKP = await store.getIdentityKeyPair();
    final spk = await _loadSpkOrThrow(parsed.signedPreKeyId);
    final otpk =
        parsed.preKeyId != 0 ? await store.loadPreKey(parsed.preKeyId) : null;

    // X3DH recipient-side.
    final sharedSecret = await x3dhRespond(
      identityKey: identityKP,
      signedPreKey: spk.keyPair,
      oneTimePreKey: otpk?.keyPair,
      aliceIdentityKey: parsed.identityKey,
      aliceEphemeralKey: parsed.baseKey,
    );

    // Initialise Double Ratchet as receiver.
    final state = await initReceiver(
      sharedSecret: sharedSecret,
      ourRatchetKey: spk.keyPair,
    );

    final (plaintext, msgKeys) =
        await ratchetDecrypt(state, inner.header, inner.ciphertext);

    final ourIdentityPub =
        Uint8List.fromList((await identityKP.extractPublicKey()).bytes);

    final mac = await _calculateMac(
      macKey: msgKeys.macKey,
      senderIdentityKey: parsed.identityKey,
      receiverIdentityKey: ourIdentityPub,
      message: inner.serializedNoMac,
    );
    if (!_bytesEqual(mac, inner.mac)) {
      throw StateError('Bad MAC for $recipientAddress');
    }

    // Trust sender identity (TOFU).
    await store.saveIdentity(recipientAddress, parsed.identityKey);

    // Persist session.
    await store.storeSession(
      recipientAddress,
      SessionRecord(serialized: await _serialiseState(state)),
    );

    // Remove consumed one-time pre-key.
    if (parsed.preKeyId != 0) await store.removePreKey(parsed.preKeyId);

    // Suppress unused variable warning.
    parsed.registrationId;

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

    final (header, ciphertext, msgKeys) =
        await ratchetEncrypt(state, plaintext);

    final ourIdentityPub = Uint8List.fromList(
        (await identityKP.extractPublicKey()).bytes);

    final signalMsg = await _buildSignalMessage(
      header: header,
      ciphertext: ciphertext,
      msgKeys: msgKeys,
      senderIdentityKey: ourIdentityPub,
      receiverIdentityKey: bundle.identityKey,
    );

    await store.storeSession(
      recipientAddress,
      SessionRecord(serialized: await _serialiseState(state)),
    );

    // Trust recipient identity.
    await store.saveIdentity(recipientAddress, bundle.identityKey);

    final preKey = wa_proto.PreKeySignalMessage(
      registrationId: bundle.registrationId,
      signedPreKeyId: bundle.signedPreKeyId,
      preKeyId: x3dhResult.usedOneTimePreKeyId ?? 0,
      baseKey: _signalPubKey(x3dhResult.ephemeralPublic),
      identityKey: _signalPubKey(ourIdentityPub),
      message: signalMsg,
    );
    if (x3dhResult.usedOneTimePreKeyId == null) {
      preKey.clearPreKeyId();
    }

    final preKeyBytes = preKey.writeToBuffer();
    final serialized = Uint8List(1 + preKeyBytes.length);
    serialized[0] = _signalVersionByte();
    serialized.setAll(1, preKeyBytes);

    return CiphertextMessage(
      type: CiphertextType.preKey,
      serialized: serialized,
    );
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

  Future<Uint8List> _serialiseState(RatchetState state) async {
    final skipped = <String, Map<String, String>>{};
    state.skippedKeys.forEach((key, value) {
      skipped[key] = {
        'cipherKey': base64Encode(value.cipherKey),
        'macKey': base64Encode(value.macKey),
        'iv': base64Encode(value.iv),
      };
    });

    final jsonMap = <String, dynamic>{
      'rootKey': base64Encode(state.rootKey),
      'sendingChainKey': state.sendingChainKey != null
          ? base64Encode(state.sendingChainKey!)
          : null,
      'receivingChainKey': state.receivingChainKey != null
          ? base64Encode(state.receivingChainKey!)
          : null,
      'dhSendingKeyPair': await keyPairToJson(state.dhSendingKeyPair),
      'dhRemotePublicKey': state.dhRemotePublicKey != null
          ? base64Encode(state.dhRemotePublicKey!)
          : null,
      'sendingChainMsgCount': state.sendingChainMsgCount,
      'receivingChainMsgCount': state.receivingChainMsgCount,
      'prevSendingChainMsgCount': state.prevSendingChainMsgCount,
      'skippedKeys': skipped,
    };

    return Uint8List.fromList(utf8.encode(jsonEncode(jsonMap)));
  }

  Future<RatchetState> _deserialiseState(Uint8List bytes) async {
    Map<String, dynamic> jsonMap;
    try {
      jsonMap =
          jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
    } catch (_) {
      throw StateError('Unsupported session format for $recipientAddress');
    }

    final rootKey = base64Decode(jsonMap['rootKey'] as String);
    final dhSendingKeyPair =
        await keyPairFromJson(jsonMap['dhSendingKeyPair']
            as Map<String, dynamic>);

    final state = RatchetState(
      rootKey: rootKey,
      dhSendingKeyPair: dhSendingKeyPair,
      sendingChainKey: jsonMap['sendingChainKey'] != null
          ? base64Decode(jsonMap['sendingChainKey'] as String)
          : null,
      receivingChainKey: jsonMap['receivingChainKey'] != null
          ? base64Decode(jsonMap['receivingChainKey'] as String)
          : null,
      dhRemotePublicKey: jsonMap['dhRemotePublicKey'] != null
          ? base64Decode(jsonMap['dhRemotePublicKey'] as String)
          : null,
    );

    state.sendingChainMsgCount =
        (jsonMap['sendingChainMsgCount'] as int?) ?? 0;
    state.receivingChainMsgCount =
        (jsonMap['receivingChainMsgCount'] as int?) ?? 0;
    state.prevSendingChainMsgCount =
        (jsonMap['prevSendingChainMsgCount'] as int?) ?? 0;

    final skipped = jsonMap['skippedKeys'];
    if (skipped is Map<String, dynamic>) {
      skipped.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          state.skippedKeys[key] = MessageKeys(
            cipherKey: base64Decode(value['cipherKey'] as String),
            macKey: base64Decode(value['macKey'] as String),
            iv: base64Decode(value['iv'] as String),
          );
        }
      });
    }

    return state;
  }

  Future<Uint8List> _buildSignalMessage({
    required RatchetHeader header,
    required Uint8List ciphertext,
    required MessageKeys msgKeys,
    required Uint8List senderIdentityKey,
    required Uint8List receiverIdentityKey,
  }) async {
    final proto = wa_proto.SignalMessage(
      ratchetKey: _signalPubKey(header.dhPublicKey),
      counter: header.messageIndex,
      previousCounter: header.prevChainLength,
      ciphertext: ciphertext,
    );

    final messageBytes = proto.writeToBuffer();
    final serializedNoMac = Uint8List(1 + messageBytes.length);
    serializedNoMac[0] = _signalVersionByte();
    serializedNoMac.setAll(1, messageBytes);

    final mac = await _calculateMac(
      macKey: msgKeys.macKey,
      senderIdentityKey: senderIdentityKey,
      receiverIdentityKey: receiverIdentityKey,
      message: serializedNoMac,
    );

    final serialized = Uint8List(serializedNoMac.length + _macLength);
    serialized.setAll(0, serializedNoMac);
    serialized.setAll(serializedNoMac.length, mac);
    return serialized;
  }

  _ParsedSignalMessage _parseSignalMessage(Uint8List serialized) {
    if (serialized.length < 1 + _macLength) {
      throw StateError('Signal message too short');
    }
    final versionByte = serialized[0];
    final version = _signalMessageVersion(versionByte);
    if (version != _currentSignalVersion) {
      throw StateError('Unsupported Signal version $version');
    }

    final mac = serialized.sublist(serialized.length - _macLength);
    final messageBytes = serialized.sublist(1, serialized.length - _macLength);
    final proto = wa_proto.SignalMessage.fromBuffer(messageBytes);
    if (!proto.hasRatchetKey() ||
        !proto.hasCiphertext() ||
        !proto.hasCounter()) {
      throw StateError('Incomplete SignalMessage');
    }

    final header = RatchetHeader(
      dhPublicKey: _stripSignalPubKey(
          Uint8List.fromList(proto.ratchetKey)),
      prevChainLength: proto.previousCounter,
      messageIndex: proto.counter,
    );

    return _ParsedSignalMessage(
      version: version,
      header: header,
      ciphertext: Uint8List.fromList(proto.ciphertext),
      mac: mac,
      serializedNoMac: serialized.sublist(0, serialized.length - _macLength),
    );
  }

  _ParsedPreKeySignalMessage _parsePreKeySignalMessage(Uint8List serialized) {
    if (serialized.isEmpty) {
      throw StateError('Empty pre-key message');
    }
    final versionByte = serialized[0];
    final version = _signalMessageVersion(versionByte);
    if (version != _currentSignalVersion) {
      throw StateError('Unsupported pre-key version $version');
    }

    final proto =
        wa_proto.PreKeySignalMessage.fromBuffer(serialized.sublist(1));
    if (!proto.hasSignedPreKeyId() ||
        !proto.hasBaseKey() ||
        !proto.hasIdentityKey() ||
        !proto.hasMessage()) {
      throw StateError('Incomplete PreKeySignalMessage');
    }

    return _ParsedPreKeySignalMessage(
      version: version,
      registrationId: proto.registrationId,
      preKeyId: proto.hasPreKeyId() ? proto.preKeyId : 0,
      signedPreKeyId: proto.signedPreKeyId,
      baseKey: _stripSignalPubKey(Uint8List.fromList(proto.baseKey)),
      identityKey:
          _stripSignalPubKey(Uint8List.fromList(proto.identityKey)),
      signalMessageBytes: Uint8List.fromList(proto.message),
    );
  }

  Future<Uint8List> _calculateMac({
    required Uint8List macKey,
    required Uint8List senderIdentityKey,
    required Uint8List receiverIdentityKey,
    required Uint8List message,
  }) async {
    final sender = _signalPubKey(senderIdentityKey);
    final receiver = _signalPubKey(receiverIdentityKey);
    final data =
        Uint8List(sender.length + receiver.length + message.length);
    data.setAll(0, sender);
    data.setAll(sender.length, receiver);
    data.setAll(sender.length + receiver.length, message);
    final full = await hmacSha256(data, macKey);
    return full.sublist(0, _macLength);
  }

  Uint8List _signalPubKey(Uint8List key) {
    if (key.length == 33) return key;
    if (key.length == 32) {
      return Uint8List.fromList([0x05, ...key]);
    }
    return key;
  }

  Uint8List _stripSignalPubKey(Uint8List key) {
    if (key.length == 33 && key[0] == 0x05) {
      return key.sublist(1);
    }
    return key;
  }

  bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
