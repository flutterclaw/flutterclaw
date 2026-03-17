import 'dart:typed_data';

import '../noise/noise_crypto.dart';
import 'signal_keys.dart';
import 'signal_store.dart';

// ---------------------------------------------------------------------------
// Sender Key Distribution Message
// ---------------------------------------------------------------------------

/// A sender key distribution message sent to group members so they can
/// decrypt future group messages from this sender.
class SenderKeyDistributionMessage {
  final String groupId;
  final String senderId;
  final int iteration;
  final Uint8List chainKey;
  final Uint8List signingPublicKey;

  const SenderKeyDistributionMessage({
    required this.groupId,
    required this.senderId,
    required this.iteration,
    required this.chainKey,
    required this.signingPublicKey,
  });

  Uint8List encode() {
    // Layout: [4 iteration] [32 chainKey] [32 signingPub]
    final out = Uint8List(68);
    final bd = ByteData.view(out.buffer);
    bd.setUint32(0, iteration, Endian.big);
    out.setAll(4, chainKey);
    out.setAll(36, signingPublicKey);
    return out;
  }

  static SenderKeyDistributionMessage decode({
    required String groupId,
    required String senderId,
    required Uint8List bytes,
  }) {
    final bd = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length);
    return SenderKeyDistributionMessage(
      groupId: groupId,
      senderId: senderId,
      iteration: bd.getUint32(0, Endian.big),
      chainKey: bytes.sublist(4, 36),
      signingPublicKey: bytes.sublist(36, 68),
    );
  }
}

// ---------------------------------------------------------------------------
// Sender Key manager
// ---------------------------------------------------------------------------

/// Manages sender keys for group messaging.
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

    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        chainKey: record.chainKey,
        signingPublicKey: signingPub,
        iteration: record.iteration,
        messageKeyIndex: 0,
      ),
    );

    return SenderKeyDistributionMessage(
      groupId: groupId,
      senderId: senderId,
      iteration: record.iteration,
      chainKey: record.chainKey,
      signingPublicKey: signingPub,
    );
  }

  /// Process an incoming distribution message and store the sender's key.
  Future<void> processDistributionMessage(
      SenderKeyDistributionMessage msg) async {
    await store.storeSenderKey(
      msg.groupId,
      msg.senderId,
      SenderKeyData(
        chainKey: msg.chainKey,
        signingPublicKey: msg.signingPublicKey,
        iteration: msg.iteration,
        messageKeyIndex: 0,
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

    // Derive message key from chain key.
    final msgKey = await _deriveSenderMessageKey(data.chainKey, data.iteration);

    // Encrypt with AES-256-GCM.
    final iv = generateNoiseIV(data.messageKeyIndex);
    final ciphertext =
        await aesEncryptGCM(plaintext, msgKey.cipherKey, iv, Uint8List(0));

    // Advance chain key.
    final nextChainKey = await _advanceSenderChainKey(data.chainKey);
    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        chainKey: nextChainKey,
        signingPublicKey: data.signingPublicKey,
        iteration: data.iteration + 1,
        messageKeyIndex: data.messageKeyIndex + 1,
      ),
    );

    // Build output: [4 iteration big-endian] [ciphertext]
    final out = Uint8List(4 + ciphertext.length);
    final bd = ByteData.view(out.buffer);
    bd.setUint32(0, data.iteration, Endian.big);
    out.setAll(4, ciphertext);
    return out;
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

    final bd = ByteData.view(message.buffer, message.offsetInBytes, message.length);
    final iteration = bd.getUint32(0, Endian.big);
    final ciphertext = message.sublist(4);

    // Fast-forward chain to the correct iteration if needed.
    Uint8List chainKey = data.chainKey;
    var currentIteration = data.iteration;

    while (currentIteration < iteration) {
      chainKey = await _advanceSenderChainKey(chainKey);
      currentIteration++;
    }

    final msgKey = await _deriveSenderMessageKey(chainKey, currentIteration);
    final iv = generateNoiseIV(data.messageKeyIndex);

    final plaintext =
        await aesDecryptGCM(ciphertext, msgKey.cipherKey, iv, Uint8List(0));

    // Store updated chain (advance one past the used key).
    final nextChainKey = await _advanceSenderChainKey(chainKey);
    await store.storeSenderKey(
      groupId,
      senderId,
      SenderKeyData(
        chainKey: nextChainKey,
        signingPublicKey: data.signingPublicKey,
        iteration: currentIteration + 1,
        messageKeyIndex: data.messageKeyIndex + 1,
      ),
    );

    return plaintext;
  }
}

// ---------------------------------------------------------------------------
// KDF helpers for sender key chain
// ---------------------------------------------------------------------------

class _SenderMsgKey {
  final Uint8List cipherKey;
  _SenderMsgKey(this.cipherKey);
}

Future<_SenderMsgKey> _deriveSenderMessageKey(
    Uint8List chainKey, int iteration) async {
  // Derive message key: HMAC-SHA256(chainKey, 0x01)
  final msgKey = await hmacSha256(Uint8List.fromList([0x01]), chainKey);
  return _SenderMsgKey(msgKey);
}

/// Advance chain key: HMAC-SHA256(chainKey, 0x02)
Future<Uint8List> _advanceSenderChainKey(Uint8List chainKey) async {
  return hmacSha256(Uint8List.fromList([0x02]), chainKey);
}
