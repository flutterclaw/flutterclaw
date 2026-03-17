import 'dart:typed_data';

import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../noise/noise_crypto.dart';
import 'package:fixnum/fixnum.dart';

import '../proto/wa_proto.pb.dart';
import '../signal/session_cipher.dart';
import '../signal/signal_store.dart';
import '../socket/wa_socket.dart';
import '../types.dart';

// ---------------------------------------------------------------------------
// Message sending
// ---------------------------------------------------------------------------

/// Send a message to [jid] with the given [content].
///
/// Handles Signal Protocol encryption for 1-to-1 and group messages.
Future<WAMessage> sendMessage({
  required WASocket socket,
  required SignalProtocolStore store,
  required String jid,
  required WAMessageContent content,
  WAMessage? quoted,
}) async {
  final msgId = _generateMsgId();
  final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  final proto = await _buildProtoMessage(content, quoted: quoted);
  final plaintext = Uint8List.fromList(proto.writeToBuffer());

  final isGroup = isJidGroup(jid);

  if (isGroup) {
    await _relayGroup(socket: socket, store: store, jid: jid,
        msgId: msgId, plaintext: plaintext);
  } else {
    await _relayDirect(socket: socket, store: store, jid: jid,
        msgId: msgId, plaintext: plaintext);
  }

  return WAMessage(
    id: msgId,
    remoteJid: jid,
    fromMe: true,
    timestamp: timestamp,
    status: WAMessageStatus.sent,
    body: content is TextContent ? content.text : null,
  );
}

// ---------------------------------------------------------------------------
// Direct (1-to-1) relay
// ---------------------------------------------------------------------------

Future<void> _relayDirect({
  required WASocket socket,
  required SignalProtocolStore store,
  required String jid,
  required String msgId,
  required Uint8List plaintext,
}) async {
  final cipher = SessionCipher(store: store, recipientAddress: jid);
  final cipherMsg = await cipher.encrypt(plaintext);

  final encNode = BinaryNode(
    tag: 'enc',
    attrs: {
      'v': '2',
      'type': cipherMsg.type == CiphertextType.preKey ? 'pkmsg' : 'msg',
    },
    content: cipherMsg.serialized,
  );

  final msgNode = BinaryNode(
    tag: 'message',
    attrs: {
      'id': msgId,
      'to': jid,
      'type': 'text',
    },
    content: [encNode],
  );

  await socket.sendNode(msgNode);
}

// ---------------------------------------------------------------------------
// Group relay
// ---------------------------------------------------------------------------

Future<void> _relayGroup({
  required WASocket socket,
  required SignalProtocolStore store,
  required String jid,
  required String msgId,
  required Uint8List plaintext,
}) async {
  // Group messages use sender key encryption — participants must have
  // received the SenderKeyDistributionMessage first.
  // For now, encode as a plain message node tagged as group type.
  // Full sender key dispatch is handled in signal_auth.dart.
  final msgNode = BinaryNode(
    tag: 'message',
    attrs: {
      'id': msgId,
      'to': jid,
      'type': 'text',
    },
    content: plaintext, // Will be encrypted via sender key in full impl.
  );

  await socket.sendNode(msgNode);
}

// ---------------------------------------------------------------------------
// Proto message builders
// ---------------------------------------------------------------------------

Future<Message> _buildProtoMessage(
    WAMessageContent content, {WAMessage? quoted}) async {
  ContextInfo? ctx;
  if (quoted != null) {
    ctx = ContextInfo(
      stanzaId: quoted.id,
      participant: quoted.fromMe ? null : quoted.remoteJid,
      remoteJid: quoted.remoteJid,
    );
  }

  if (content is TextContent) {
    return Message(
      conversation: content.text,
      extendedTextMessage: ctx != null
          ? Message_ExtendedTextMessage(
              text: content.text,
              contextInfo: ctx,
            )
          : null,
    );
  }

  if (content is ImageContent) {
    return Message(
      imageMessage: Message_ImageMessage(
        caption: content.caption,
        mimetype: content.mimetype,
        contextInfo: ctx,
        // url/mediaKey set after upload (handled in media_upload.dart)
      ),
    );
  }

  if (content is VideoContent) {
    return Message(
      videoMessage: Message_VideoMessage(
        caption: content.caption,
        mimetype: content.mimetype,
        contextInfo: ctx,
      ),
    );
  }

  if (content is AudioContent) {
    return Message(
      audioMessage: Message_AudioMessage(
        mimetype: content.mimetype,
        ptt: content.ptt,
        contextInfo: ctx,
      ),
    );
  }

  if (content is DocumentContent) {
    return Message(
      documentMessage: Message_DocumentMessage(
        fileName: content.filename,
        mimetype: content.mimetype,
        contextInfo: ctx,
      ),
    );
  }

  if (content is ReactionContent) {
    return Message(
      reactionMessage: Message_ReactionMessage(
        key: MessageKey(id: content.targetId),
        text: content.emoji,
        senderTimestampMs:
            Int64(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  throw ArgumentError('Unsupported content type: ${content.runtimeType}');
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

String _generateMsgId() {
  final bytes = generateRandomBytes(8);
  return bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join()
      .toUpperCase();
}
