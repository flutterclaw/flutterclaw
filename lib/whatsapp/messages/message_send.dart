import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';

import '../binary/generic_utils.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../noise/noise_crypto.dart';
import '../proto/wa_proto.pb.dart';
import '../signal/session_cipher.dart';
import '../signal/signal_auth.dart' as signal_auth;
import '../signal/sender_key.dart';
import '../signal/signal_store.dart';
import '../socket/wa_socket.dart';
import '../types.dart';

// ---------------------------------------------------------------------------
// Message sending
// ---------------------------------------------------------------------------

class RecentSentProtoMessage {
  final String jid;
  final Message proto;
  final Map<String, String>? additionalAttributes;
  final List<BinaryNode>? additionalNodes;
  final int timestampMs;

  const RecentSentProtoMessage({
    required this.jid,
    required this.proto,
    this.additionalAttributes,
    this.additionalNodes,
    required this.timestampMs,
  });

  RecentSentProtoMessage copy() => RecentSentProtoMessage(
    jid: jid,
    proto: Message.fromBuffer(proto.writeToBuffer()),
    additionalAttributes: additionalAttributes == null
        ? null
        : Map<String, String>.from(additionalAttributes!),
    additionalNodes: additionalNodes
        ?.map(_cloneBinaryNode)
        .toList(growable: false),
    timestampMs: timestampMs,
  );
}

const _recentSentProtoTtl = Duration(hours: 1);
const _maxRecentSentProtoEntries = 512;
final _recentSentProtoCache = <String, RecentSentProtoMessage>{};

RecentSentProtoMessage? getRecentSentProtoMessage(String msgId) {
  _pruneRecentSentProtoCache();
  return _recentSentProtoCache[msgId]?.copy();
}

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
  final normalizedJid = jidNormalizedUser(jid);

  final proto = await _buildProtoMessage(content, quoted: quoted);
  await sendProtoMessage(
    socket: socket,
    store: store,
    jid: normalizedJid,
    msgId: msgId,
    proto: proto,
  );

  final reaction = content is ReactionContent
      ? WAReactionInfo(
          targetMessageId: content.targetId,
          emoji: content.emoji,
          remoteJid: content.remoteJid,
          participant: content.participant,
          fromMe: content.fromMe,
        )
      : null;

  return WAMessage(
    id: msgId,
    remoteJid: normalizedJid,
    fromMe: true,
    timestamp: timestamp,
    status: WAMessageStatus.sent,
    body: content is TextContent ? content.text : null,
    reaction: reaction,
  );
}

Future<void> sendProtoMessage({
  required WASocket socket,
  required SignalProtocolStore store,
  required String jid,
  required Message proto,
  String? msgId,
  Map<String, String>? additionalAttributes,
  List<BinaryNode>? additionalNodes,
}) async {
  final normalizedJid = jidNormalizedUser(jid);
  final plaintext = writeRandomPadMax16(
    Uint8List.fromList(proto.writeToBuffer()),
  );
  final outgoingId = msgId ?? _generateMsgId();

  if (isJidGroup(normalizedJid)) {
    await _relayGroup(
      socket: socket,
      store: store,
      jid: normalizedJid,
      msgId: outgoingId,
      plaintext: plaintext,
    );
  } else {
    await _relayDirect(
      socket: socket,
      store: store,
      jid: normalizedJid,
      msgId: outgoingId,
      plaintext: plaintext,
      additionalAttributes: additionalAttributes,
      additionalNodes: additionalNodes,
    );
  }

  _storeRecentSentProtoMessage(
    msgId: outgoingId,
    jid: normalizedJid,
    proto: proto,
    additionalAttributes: additionalAttributes,
    additionalNodes: additionalNodes,
  );
}

Future<String> sendPeerDataOperationMessage({
  required WASocket socket,
  required SignalProtocolStore store,
  required String jid,
  required Message_PeerDataOperationRequestMessage request,
  String? msgId,
}) async {
  final outgoingId = msgId ?? _generateMsgId();
  final protocol = Message(
    protocolMessage: Message_ProtocolMessage(
      type: Message_ProtocolMessage_Type.PEER_DATA_OPERATION_REQUEST_MESSAGE,
      peerDataOperationRequestMessage: request,
    ),
  );

  await sendProtoMessage(
    socket: socket,
    store: store,
    jid: jid,
    msgId: outgoingId,
    proto: protocol,
    additionalAttributes: const {
      'category': 'peer',
      'push_priority': 'high_force',
    },
    additionalNodes: const [
      BinaryNode(
        tag: 'meta',
        attrs: {'appdata': 'default'},
      ),
    ],
  );

  return outgoingId;
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
  Map<String, String>? additionalAttributes,
  List<BinaryNode>? additionalNodes,
}) async {
  final cipher = SessionCipher(store: store, recipientAddress: jid);
  CiphertextMessage cipherMsg;
  final existing = await store.loadSession(jid);
  if (existing == null) {
    final bundle = await signal_auth.fetchPreKeyBundle(
      socket: socket,
      jid: jid,
    );
    cipherMsg = await cipher.initSession(bundle: bundle, plaintext: plaintext);
  } else {
    try {
      cipherMsg = await cipher.encrypt(plaintext);
    } on StateError {
      await store.deleteSession(jid);
      final bundle = await signal_auth.fetchPreKeyBundle(
        socket: socket,
        jid: jid,
      );
      cipherMsg = await cipher.initSession(
        bundle: bundle,
        plaintext: plaintext,
      );
    }
  }

  final encNode = BinaryNode(
    tag: 'enc',
    attrs: {
      'v': '2',
      'type': cipherMsg.type == CiphertextType.preKey ? 'pkmsg' : 'msg',
    },
    content: cipherMsg.serialized,
  );

  final content = <BinaryNode>[encNode];
  if (cipherMsg.type == CiphertextType.preKey &&
      socket.creds?.account != null) {
    content.add(
      BinaryNode(
        tag: 'device-identity',
        attrs: const {},
        content: socket.creds!.account!.writeToBuffer(),
      ),
    );
  }
  if (additionalNodes != null && additionalNodes.isNotEmpty) {
    content.addAll(additionalNodes);
  }

  final msgNode = BinaryNode(
    tag: 'message',
    attrs: {
      'id': msgId,
      'to': jid,
      'type': 'text',
      ...?additionalAttributes,
    },
    content: content,
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
  final senderId = socket.creds?.me?.id;
  if (senderId == null || senderId.isEmpty) {
    throw StateError('Missing sender id for group message');
  }

  final senderKeyMgr = SenderKeyManager(store: store);
  final ciphertext = await senderKeyMgr.encrypt(
    groupId: jid,
    senderId: senderId,
    plaintext: plaintext,
  );

  final encNode = BinaryNode(
    tag: 'enc',
    attrs: {'v': '2', 'type': 'skmsg'},
    content: ciphertext,
  );

  final msgNode = BinaryNode(
    tag: 'message',
    attrs: {'id': msgId, 'to': jid, 'type': 'text'},
    content: [encNode],
  );

  await socket.sendNode(msgNode);
}

// ---------------------------------------------------------------------------
// Proto message builders
// ---------------------------------------------------------------------------

Future<Message> _buildProtoMessage(
  WAMessageContent content, {
  WAMessage? quoted,
}) async {
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
          ? Message_ExtendedTextMessage(text: content.text, contextInfo: ctx)
          : null,
    );
  }

  if (content is ImageContent) {
    return Message(
      imageMessage: Message_ImageMessage(
        caption: content.caption,
        mimetype: content.mimetype,
        contextInfo: ctx,
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
        key: MessageKey(
          id: content.targetId,
          remoteJid: jidNormalizedUser(content.remoteJid),
          participant: content.participant != null
              ? jidNormalizedUser(content.participant)
              : null,
          fromMe: content.fromMe,
        ),
        text: content.emoji,
        senderTimestampMs: Int64(DateTime.now().millisecondsSinceEpoch),
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

void _storeRecentSentProtoMessage({
  required String msgId,
  required String jid,
  required Message proto,
  Map<String, String>? additionalAttributes,
  List<BinaryNode>? additionalNodes,
}) {
  _pruneRecentSentProtoCache();
  _recentSentProtoCache[msgId] = RecentSentProtoMessage(
    jid: jid,
    proto: Message.fromBuffer(proto.writeToBuffer()),
    additionalAttributes: additionalAttributes == null
        ? null
        : Map<String, String>.from(additionalAttributes),
    additionalNodes: additionalNodes
        ?.map(_cloneBinaryNode)
        .toList(growable: false),
    timestampMs: DateTime.now().millisecondsSinceEpoch,
  );

  while (_recentSentProtoCache.length > _maxRecentSentProtoEntries) {
    final oldestKey = _recentSentProtoCache.keys.first;
    _recentSentProtoCache.remove(oldestKey);
  }
}

void _pruneRecentSentProtoCache() {
  final cutoff =
      DateTime.now().millisecondsSinceEpoch - _recentSentProtoTtl.inMilliseconds;
  final expired = _recentSentProtoCache.entries
      .where((entry) => entry.value.timestampMs < cutoff)
      .map((entry) => entry.key)
      .toList(growable: false);
  for (final key in expired) {
    _recentSentProtoCache.remove(key);
  }
}

BinaryNode _cloneBinaryNode(BinaryNode node) {
  final content = node.content;
  Object? clonedContent;
  if (content is Uint8List) {
    clonedContent = Uint8List.fromList(content);
  } else if (content is List<BinaryNode>) {
    clonedContent = content.map(_cloneBinaryNode).toList(growable: false);
  } else {
    clonedContent = content;
  }

  return BinaryNode(
    tag: node.tag,
    attrs: Map<String, String>.from(node.attrs),
    content: clonedContent,
  );
}
