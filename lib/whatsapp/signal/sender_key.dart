import 'dart:typed_data';

import '../noise/noise_crypto.dart'
    show aesEncryptCBC, aesDecryptCBC, curve25519Sign, curve25519Verify, hkdfExpand, hmacSha256;
import '../proto/wa_proto.pb.dart' as wa_proto;
import 'signal_keys.dart';
import 'signal_store.dart';

const _signalVersion = 3;
const _senderKeySignatureLength = 64;

int _signalVersionByte() =>
    ((_signalVersion & 0x0f) << 4) | (_signalVersion & 0x0f);

int _signalMessageVersion(int versionByte) => (versionByte >> 4) & 0x0f;

// ---------------------------------------------------------------------------
// Sender Key Distribution Message (Signal)
// ---------------------------------------------------------------------------

class SenderKeyDistributionMessage {
  final int senderKeyId;
  final int iteration;
  final Uint8List chainKey;
  final Uint8List signingPublicKey;

  const SenderKeyDistributionMessage({
    required this.senderKeyId,
    required this.iteration,
    required this.chainKey,
    required this.signingPublicKey,
  });

  Uint8List serialize() {
    final proto = wa_proto.SenderKeyDistributionMessage(
      id: senderKeyId,
      iteration: iteration,
      chainKey: chainKey,
      signingKey: _signalPubKey(signingPublicKey),
    );
    final messageBytes = proto.writeToBuffer();
    final serialized = Uint8List(1 + messageBytes.length);
    serialized[0] = _signalVersionByte();
    serialized.setAll(1, messageBytes);
    return serialized;
  }

  static SenderKeyDistributionMessage parse(Uint8List serialized) {
    if (serialized.isEmpty) {
      throw StateError('Empty sender key distribution message');
    }
    final version = _signalMessageVersion(serialized[0]);
    if (version != _signalVersion) {
      throw StateError('Unsupported sender key version $version');
    }
    final proto =
        wa_proto.SenderKeyDistributionMessage.fromBuffer(serialized.sublist(1));
    if (!proto.hasId() ||
        !proto.hasIteration() ||
        !proto.hasChainKey() ||
        !proto.hasSigningKey()) {
      throw StateError('Incomplete sender key distribution message');
    }
    return SenderKeyDistributionMessage(
      senderKeyId: proto.id,
      iteration: proto.iteration,
      chainKey: Uint8List.fromList(proto.chainKey),
      signingPublicKey:
          _stripSignalPubKey(Uint8List.fromList(proto.signingKey)),
    );
  }
}

// ---------------------------------------------------------------------------
// Sender Key manager
// ---------------------------------------------------------------------------

class SenderKeyManager {
  final SignalProtocolStore store;

  const SenderKeyManager({required this.store});

  /// Create a new sender key for [groupId] / [senderId] and return a
  /// distribution message to send to all group members.
  Future<SenderKeyDistributionMessage> createDistributionMessage({
    required String groupId,
    required String senderId,
  }) async {
    final record = await SenderKeyRecord.generate();
    final signingPub = await publicKeyBytes(record.signingKey);
    final signingPriv = await record.signingKey.extractPrivateKeyBytes();

    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        senderKeyId: record.senderKeyId,
        iteration: record.iteration,
        chainKey: record.chainKey,
        signingPublicKey: signingPub,
        signingPrivateKey: Uint8List.fromList(signingPriv),
        messageKeys: const [],
      ),
    );

    return SenderKeyDistributionMessage(
      senderKeyId: record.senderKeyId,
      iteration: record.iteration,
      chainKey: record.chainKey,
      signingPublicKey: signingPub,
    );
  }

  /// Process an incoming distribution message and store the sender's key.
  Future<void> processDistributionMessage({
    required String groupId,
    required String senderId,
    required Uint8List message,
  }) async {
    final msg = SenderKeyDistributionMessage.parse(message);
    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        senderKeyId: msg.senderKeyId,
        iteration: msg.iteration,
        chainKey: msg.chainKey,
        signingPublicKey: msg.signingPublicKey,
        signingPrivateKey: null,
        messageKeys: const [],
      ),
    );
  }

  /// Encrypt [plaintext] as [senderId] in [groupId].
  Future<Uint8List> encrypt({
    required String groupId,
    required String senderId,
    required Uint8List plaintext,
  }) async {
    final data = await store.loadSenderKey(groupId, senderId);
    if (data == null) {
      throw StateError('No sender key for $senderId in $groupId');
    }
    if (data.signingPrivateKey == null) {
      throw StateError('Missing signing key for $senderId in $groupId');
    }

    final chainKey = _SenderChainKey(data.iteration, data.chainKey);
    final messageKey = await chainKey.senderMessageKey();
    final ciphertext =
        aesEncryptCBC(plaintext, messageKey.cipherKey, messageKey.iv);

    final senderKeyMessage = await _buildSenderKeyMessage(
      senderKeyId: data.senderKeyId,
      iteration: chainKey.iteration,
      ciphertext: ciphertext,
      signingPrivateKey: data.signingPrivateKey!,
    );

    final nextChain = await chainKey.next();
    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        senderKeyId: data.senderKeyId,
        iteration: nextChain.iteration,
        chainKey: nextChain.chainKey,
        signingPublicKey: data.signingPublicKey,
        signingPrivateKey: data.signingPrivateKey,
        messageKeys: data.messageKeys,
      ),
    );

    return senderKeyMessage;
  }

  /// Decrypt a group message from [senderId] in [groupId].
  Future<Uint8List> decrypt({
    required String groupId,
    required String senderId,
    required Uint8List message,
  }) async {
    final data = await store.loadSenderKey(groupId, senderId);
    if (data == null) {
      throw StateError('No sender key for $senderId in $groupId');
    }

    final parsed = _parseSenderKeyMessage(message);
    if (parsed.senderKeyId != data.senderKeyId) {
      throw StateError('Sender key ID mismatch for $senderId in $groupId');
    }

    final ok = await curve25519Verify(
      data.signingPublicKey,
      parsed.serializedNoSig,
      parsed.signature,
    );
    if (!ok) {
      throw StateError('Invalid sender key signature');
    }

    final (messageKey, updated) = await _getMessageKey(
      data: data,
      targetIteration: parsed.iteration,
    );

    final plaintext =
        aesDecryptCBC(parsed.ciphertext, messageKey.cipherKey, messageKey.iv);

    await store.storeSenderKey(groupId, senderId, updated);
    return plaintext;
  }
}

// ---------------------------------------------------------------------------
// SenderKeyMessage handling
// ---------------------------------------------------------------------------

class _ParsedSenderKeyMessage {
  final int senderKeyId;
  final int iteration;
  final Uint8List ciphertext;
  final Uint8List signature;
  final Uint8List serializedNoSig;

  const _ParsedSenderKeyMessage({
    required this.senderKeyId,
    required this.iteration,
    required this.ciphertext,
    required this.signature,
    required this.serializedNoSig,
  });
}

Future<Uint8List> _buildSenderKeyMessage({
  required int senderKeyId,
  required int iteration,
  required Uint8List ciphertext,
  required Uint8List signingPrivateKey,
}) async {
  final proto = wa_proto.SenderKeyMessage(
    id: senderKeyId,
    iteration: iteration,
    ciphertext: ciphertext,
  );
  final messageBytes = proto.writeToBuffer();
  final serializedNoSig = Uint8List(1 + messageBytes.length);
  serializedNoSig[0] = _signalVersionByte();
  serializedNoSig.setAll(1, messageBytes);

  final signature = await curve25519Sign(signingPrivateKey, serializedNoSig);
  final serialized = Uint8List(serializedNoSig.length + signature.length);
  serialized.setAll(0, serializedNoSig);
  serialized.setAll(serializedNoSig.length, signature);
  return serialized;
}

_ParsedSenderKeyMessage _parseSenderKeyMessage(Uint8List serialized) {
  if (serialized.length < 1 + _senderKeySignatureLength) {
    throw StateError('Invalid sender key message length');
  }
  final version = _signalMessageVersion(serialized[0]);
  if (version != _signalVersion) {
    throw StateError('Unsupported sender key version $version');
  }

  final sigStart = serialized.length - _senderKeySignatureLength;
  final serializedNoSig = serialized.sublist(0, sigStart);
  final signature = serialized.sublist(sigStart);
  final proto = wa_proto.SenderKeyMessage.fromBuffer(
      serialized.sublist(1, sigStart));

  if (!proto.hasId() || !proto.hasIteration() || !proto.hasCiphertext()) {
    throw StateError('Incomplete sender key message');
  }

  return _ParsedSenderKeyMessage(
    senderKeyId: proto.id,
    iteration: proto.iteration,
    ciphertext: Uint8List.fromList(proto.ciphertext),
    signature: signature,
    serializedNoSig: serializedNoSig,
  );
}

// ---------------------------------------------------------------------------
// Chain key / message key
// ---------------------------------------------------------------------------

class _SenderChainKey {
  final int iteration;
  final Uint8List chainKey;

  const _SenderChainKey(this.iteration, this.chainKey);

  Future<_SenderMessageKey> senderMessageKey() async {
    final seed = await _deriveChainKey(chainKey, _messageKeySeed);
    return _SenderMessageKey.derive(iteration, seed);
  }

  Future<_SenderChainKey> next() async {
    final nextSeed = await _deriveChainKey(chainKey, _chainKeySeed);
    return _SenderChainKey(iteration + 1, nextSeed);
  }
}

class _SenderMessageKey {
  final int iteration;
  final Uint8List seed;
  final Uint8List iv;
  final Uint8List cipherKey;

  const _SenderMessageKey({
    required this.iteration,
    required this.seed,
    required this.iv,
    required this.cipherKey,
  });

  static Future<_SenderMessageKey> derive(
      int iteration, Uint8List seed) async {
    final derived = await hkdfExpand(
      seed,
      48,
      salt: Uint8List(32),
      info: Uint8List.fromList('WhisperGroup'.codeUnits),
    );
    final iv = derived.sublist(0, 16);
    final cipherKey = derived.sublist(16);
    return _SenderMessageKey(
      iteration: iteration,
      seed: seed,
      iv: iv,
      cipherKey: cipherKey,
    );
  }
}

const _messageKeySeed = [0x01];
const _chainKeySeed = [0x02];

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

Future<Uint8List> _deriveChainKey(Uint8List chainKey, List<int> seed) async {
  return hmacSha256(Uint8List.fromList(seed), chainKey);
}

Future<(_SenderMessageKey, SenderKeyData)> _getMessageKey({
  required SenderKeyData data,
  required int targetIteration,
}) async {
  var chain = _SenderChainKey(data.iteration, data.chainKey);
  final messageKeys = [...data.messageKeys];

  if (targetIteration < chain.iteration) {
    final idx = messageKeys.indexWhere((m) => m.iteration == targetIteration);
    if (idx == -1) {
      throw StateError('Duplicate or old sender key message');
    }
    final stored = messageKeys.removeAt(idx);
    final msgKey =
        await _SenderMessageKey.derive(stored.iteration, stored.seed);
    final updated = SenderKeyData(
      senderKeyId: data.senderKeyId,
      iteration: data.iteration,
      chainKey: data.chainKey,
      signingPublicKey: data.signingPublicKey,
      signingPrivateKey: data.signingPrivateKey,
      messageKeys: messageKeys,
    );
    return (msgKey, updated);
  }

  if (targetIteration - chain.iteration > 2000) {
    throw StateError('Sender key too far in future');
  }

  while (chain.iteration < targetIteration) {
    final mk = await chain.senderMessageKey();
    messageKeys.add(SenderMessageKeyData(
      iteration: mk.iteration,
      seed: mk.seed,
    ));
    if (messageKeys.length > 2000) {
      messageKeys.removeAt(0);
    }
    chain = await chain.next();
  }

  final msgKey = await chain.senderMessageKey();
  final nextChain = await chain.next();

  final updated = SenderKeyData(
    senderKeyId: data.senderKeyId,
    iteration: nextChain.iteration,
    chainKey: nextChain.chainKey,
    signingPublicKey: data.signingPublicKey,
    signingPrivateKey: data.signingPrivateKey,
    messageKeys: messageKeys,
  );

  return (msgKey, updated);
}
