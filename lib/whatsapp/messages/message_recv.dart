import 'dart:typed_data';

import '../binary/generic_utils.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../proto/wa_proto.pb.dart';
import '../signal/sender_key.dart';
import '../signal/session_cipher.dart';
import '../signal/signal_store.dart';
import '../socket/wa_socket.dart';
import '../types.dart';
import '../utils/event_emitter.dart';

// ---------------------------------------------------------------------------
// Message receive handler
// ---------------------------------------------------------------------------

/// Processes incoming `message` nodes from the WhatsApp WebSocket,
/// decrypts them via Signal Protocol, and emits typed [WAMessage] events.
class MessageReceiver {
  final SignalProtocolStore store;
  final SenderKeyManager senderKeyManager;
  final WAEventEmitter ev;
  final String myJid;
  final WASocket socket;

  MessageReceiver({
    required this.store,
    required this.senderKeyManager,
    required this.ev,
    required this.myJid,
    required this.socket,
  });

  Future<void> handleNode(BinaryNode node) async {
    if (node.tag != 'message') return;

    final msgId = node.attrs['id'] ?? '';
    final from = node.attrs['from'] ?? '';
    final participant = node.attrs['participant']; // set for group messages
    final timestamp = int.tryParse(node.attrs['t'] ?? '') ??
        DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final remoteJid = isJidGroup(from) ? from : (participant ?? from);
    final senderId = participant ?? from;

    // Decrypt the enc node.
    final encNode = getBinaryNodeChild(node, 'enc');
    if (encNode == null) {
      // Plaintext protocol message (e.g. key exchange) — ignore.
      return;
    }

    Uint8List? plaintext;
    try {
      plaintext = await _decrypt(
        encNode: encNode,
        senderId: senderId,
        remoteJid: from,
      );
    } catch (e) {
      // Emit a decryption failure so message_retry.dart can handle it.
      ev.emit('messages.decrypt-error', {
        'id': msgId,
        'from': from,
        'participant': participant,
        'recipient': node.attrs['recipient'],
        'senderId': senderId,
        'error': e.toString(),
      });
      return;
    }

    // Parse WAProto message.
    Message proto;
    try {
      proto = Message.fromBuffer(plaintext);
    } catch (_) {
      return;
    }

    if (proto.hasSenderKeyDistributionMessage()) {
      final dist = proto.senderKeyDistributionMessage;
      final groupId = dist.groupId;
      final bytes = Uint8List.fromList(dist.axolotlSenderKeyDistributionMessage);
      if (groupId.isNotEmpty && bytes.isNotEmpty) {
        await senderKeyManager.processDistributionMessage(
          groupId: groupId,
          senderId: senderId,
          message: bytes,
        );
      }
      await _sendDeliveryReceipt(
        msgId: msgId,
        to: from,
        participant: participant,
        recipient: node.attrs['recipient'],
      );
      return;
    }

    final body = _extractBody(proto);
    final media = _extractMedia(proto);

    final msg = WAMessage(
      id: msgId,
      remoteJid: remoteJid,
      fromMe: false,
      timestamp: timestamp,
      status: WAMessageStatus.delivered,
      message: proto,
      body: body,
      media: media,
    );

    ev.emit('messages.upsert', {'messages': [msg], 'type': 'notify'});

    await _sendDeliveryReceipt(
      msgId: msgId,
      to: from,
      participant: participant,
      recipient: node.attrs['recipient'],
    );
  }

  // ---------------------------------------------------------------------------
  // Decryption dispatch
  // ---------------------------------------------------------------------------

  Future<Uint8List> _decrypt({
    required BinaryNode encNode,
    required String senderId,
    required String remoteJid,
  }) async {
    final type = encNode.attrs['type'];
    final cipherBytes = encNode.contentBytes;
    if (cipherBytes == null) throw StateError('enc node has no content');

    if (type == 'skmsg') {
      // Group message — sender key.
      return senderKeyManager.decrypt(
        groupId: remoteJid,
        senderId: senderId,
        message: cipherBytes,
      );
    }

    // 1-to-1: whisper or pre-key message.
    final cipher = SessionCipher(
        store: store, recipientAddress: _deviceAddress(senderId));
    final ciphertextType =
        type == 'pkmsg' ? CiphertextType.preKey : CiphertextType.whisper;

    return cipher.decrypt(
        CiphertextMessage(type: ciphertextType, serialized: cipherBytes));
  }

  // ---------------------------------------------------------------------------
  // Body / media extraction
  // ---------------------------------------------------------------------------

  String? _extractBody(Message proto) {
    if (proto.hasConversation()) return proto.conversation;
    if (proto.hasExtendedTextMessage()) {
      return proto.extendedTextMessage.text;
    }
    if (proto.hasImageMessage()) return proto.imageMessage.caption;
    if (proto.hasVideoMessage()) return proto.videoMessage.caption;
    if (proto.hasDocumentMessage()) return proto.documentMessage.fileName;
    return null;
  }

  WAMediaInfo? _extractMedia(Message proto) {
    if (proto.hasImageMessage()) {
      final m = proto.imageMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        caption: m.caption,
        fileLength: m.fileLength.toInt(),
      );
    }
    if (proto.hasVideoMessage()) {
      final m = proto.videoMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        caption: m.caption,
        fileLength: m.fileLength.toInt(),
      );
    }
    if (proto.hasAudioMessage()) {
      final m = proto.audioMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
      );
    }
    if (proto.hasDocumentMessage()) {
      final m = proto.documentMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        fileLength: m.fileLength.toInt(),
      );
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Build a Signal Protocol address for [jid].
  /// Format: "number@s.whatsapp.net:deviceId" or just the JID for device 0.
  static String _deviceAddress(String jid) => jid;

  Future<void> _sendDeliveryReceipt({
    required String msgId,
    required String to,
    String? participant,
    String? recipient,
  }) async {
    if (msgId.isEmpty || to.isEmpty) return;
    final attrs = <String, String>{
      'id': msgId,
      'to': to,
    };
    if (participant != null && participant.isNotEmpty) {
      attrs['participant'] = participant;
    }
    if (recipient != null && recipient.isNotEmpty) {
      attrs['recipient'] = recipient;
    }

    final receipt = BinaryNode(tag: 'receipt', attrs: attrs);
    await socket.sendNode(receipt);
  }
}
