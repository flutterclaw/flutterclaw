import 'dart:typed_data';

import '../binary/types.dart';
import '../socket/wa_socket.dart';
import 'signal_keys.dart';
import 'signal_store.dart';

/// Number of pre-keys to upload in a single batch.
const _preKeyBatchSize = 30;

/// Minimum pre-keys remaining on server before we upload more.
const _preKeyLowWatermark = 5;

// ---------------------------------------------------------------------------
// Pre-key upload
// ---------------------------------------------------------------------------

/// Upload a batch of pre-keys and the signed pre-key to WhatsApp servers.
Future<void> uploadPreKeys({
  required WASocket socket,
  required List<PreKeyRecord> preKeys,
  required PreKeyRecord signedPreKey,
  required Uint8List signedPreKeySignature,
  required Uint8List identityPublicKey,
}) async {
  final preKeyNodes = await Future.wait(
    preKeys.map((pk) async {
      final pub = await publicKeyBytes(pk.keyPair);
      return BinaryNode(
        tag: 'key',
        attrs: {},
        content: [
          BinaryNode(
              tag: 'id',
              attrs: {},
              content: _encodePreKeyId(pk.id)),
          BinaryNode(
              tag: 'value',
              attrs: {},
              content: pub),
        ],
      );
    }),
  );

  final spkPub = await publicKeyBytes(signedPreKey.keyPair);

  final iq = BinaryNode(
    tag: 'iq',
    attrs: {
      'id': 'prekeys-${DateTime.now().millisecondsSinceEpoch}',
      'xmlns': 'encrypt',
      'type': 'set',
      'to': '@s.whatsapp.net',
    },
    content: [
      BinaryNode(
        tag: 'registration',
        attrs: {},
        content: _encodeUint32(
            socket.config.logger.name.hashCode & 0x7fffffff),
      ),
      BinaryNode(
        tag: 'type',
        attrs: {},
        content: Uint8List.fromList([0x05]), // Curve25519
      ),
      BinaryNode(
        tag: 'identity',
        attrs: {},
        content: identityPublicKey,
      ),
      BinaryNode(
        tag: 'list',
        attrs: {},
        content: preKeyNodes,
      ),
      BinaryNode(
        tag: 'skey',
        attrs: {},
        content: [
          BinaryNode(
              tag: 'id',
              attrs: {},
              content: _encodePreKeyId(signedPreKey.id)),
          BinaryNode(
              tag: 'value',
              attrs: {},
              content: spkPub),
          BinaryNode(
              tag: 'signature',
              attrs: {},
              content: signedPreKeySignature),
        ],
      ),
    ],
  );

  await socket.query(iq);
}

/// Query how many pre-keys are remaining on the server.
/// Returns the count, or -1 if the query fails.
Future<int> getAvailablePreKeyCount(WASocket socket) async {
  final iq = BinaryNode(
    tag: 'iq',
    attrs: {
      'id': 'prekey-count-${DateTime.now().millisecondsSinceEpoch}',
      'xmlns': 'encrypt',
      'type': 'get',
      'to': '@s.whatsapp.net',
    },
    content: [
      BinaryNode(tag: 'count', attrs: {}),
    ],
  );

  try {
    final response = await socket.query(iq);
    final countNode = _findChild(response, 'count');
    final countStr = countNode?.attrs['value'];
    return int.tryParse(countStr ?? '') ?? -1;
  } catch (_) {
    return -1;
  }
}

/// Generate and upload pre-keys if the server count is below the watermark.
Future<void> maybeRefillPreKeys({
  required WASocket socket,
  required SignalProtocolStore store,
  required Uint8List identityPublicKey,
  required PreKeyRecord signedPreKey,
  required Uint8List signedPreKeySignature,
  required int nextPreKeyId,
}) async {
  final count = await getAvailablePreKeyCount(socket);
  if (count >= _preKeyLowWatermark) return;

  final newKeys = await generatePreKeys(nextPreKeyId, _preKeyBatchSize);
  for (final k in newKeys) {
    await store.storePreKey(k.id, k);
  }

  await uploadPreKeys(
    socket: socket,
    preKeys: newKeys,
    signedPreKey: signedPreKey,
    signedPreKeySignature: signedPreKeySignature,
    identityPublicKey: identityPublicKey,
  );
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

Uint8List _encodePreKeyId(int id) {
  final b = Uint8List(3);
  b[0] = (id >> 16) & 0xff;
  b[1] = (id >> 8) & 0xff;
  b[2] = id & 0xff;
  return b;
}

Uint8List _encodeUint32(int value) {
  final b = Uint8List(4);
  b[0] = (value >> 24) & 0xff;
  b[1] = (value >> 16) & 0xff;
  b[2] = (value >> 8) & 0xff;
  b[3] = value & 0xff;
  return b;
}

BinaryNode? _findChild(BinaryNode node, String tag) {
  final content = node.content;
  if (content is List) {
    for (final child in content) {
      if (child is BinaryNode && child.tag == tag) return child;
    }
  }
  return null;
}
