import 'dart:typed_data';

import 'proto/wa_proto.pb.dart';

// ---------------------------------------------------------------------------
// Connection
// ---------------------------------------------------------------------------

enum WAConnectionStatus { disconnected, connecting, connected, closing }

enum WADisconnectReason {
  loggedOut,
  connectionClosed,
  connectionLost,
  connectionReplaced,
  timedOut,
  badSession,
  restartRequired,
  multideviceMismatch,
}

// ---------------------------------------------------------------------------
// JID / contact
// ---------------------------------------------------------------------------

class WAContact {
  final String id;
  final String? name;
  final String? notify;
  final String? imgUrl;

  const WAContact({
    required this.id,
    this.name,
    this.notify,
    this.imgUrl,
  });

  String get displayName => name ?? notify ?? id;
}

// ---------------------------------------------------------------------------
// Chat
// ---------------------------------------------------------------------------

class WAChat {
  final String id;
  final String? name;
  final int unreadCount;
  final int? lastMessageTimestamp;

  const WAChat({
    required this.id,
    this.name,
    this.unreadCount = 0,
    this.lastMessageTimestamp,
  });
}

// ---------------------------------------------------------------------------
// Message
// ---------------------------------------------------------------------------

enum WAMessageStatus { pending, sent, delivered, read, played, failed }

class WAMessage {
  final String id;
  final String remoteJid;
  final bool fromMe;
  final int timestamp;
  final WAMessageStatus status;

  /// The decoded protobuf message.
  final Message? message;

  /// Quoted / context message info.
  final ContextInfo? contextInfo;

  /// Plain text body (extracted for convenience).
  final String? body;

  /// Media info (set for image/video/audio/doc).
  final WAMediaInfo? media;

  const WAMessage({
    required this.id,
    required this.remoteJid,
    required this.fromMe,
    required this.timestamp,
    this.status = WAMessageStatus.pending,
    this.message,
    this.contextInfo,
    this.body,
    this.media,
  });
}

// ---------------------------------------------------------------------------
// Media
// ---------------------------------------------------------------------------

class WAMediaInfo {
  final String? url;
  final String? directPath;
  final Uint8List? mediaKey;
  final String? mimetype;
  final String? caption;
  final int? fileLength;

  const WAMediaInfo({
    this.url,
    this.directPath,
    this.mediaKey,
    this.mimetype,
    this.caption,
    this.fileLength,
  });
}

// ---------------------------------------------------------------------------
// Outgoing message content
// ---------------------------------------------------------------------------

/// Content for an outgoing message.
sealed class WAMessageContent {}

class TextContent extends WAMessageContent {
  final String text;
  TextContent(this.text);
}

class ImageContent extends WAMessageContent {
  final Uint8List bytes;
  final String mimetype;
  final String? caption;
  ImageContent({required this.bytes, this.mimetype = 'image/jpeg', this.caption});
}

class VideoContent extends WAMessageContent {
  final Uint8List bytes;
  final String mimetype;
  final String? caption;
  VideoContent({required this.bytes, this.mimetype = 'video/mp4', this.caption});
}

class AudioContent extends WAMessageContent {
  final Uint8List bytes;
  final String mimetype;
  final bool ptt; // push-to-talk (voice note)
  AudioContent({required this.bytes, this.mimetype = 'audio/ogg; codecs=opus', this.ptt = false});
}

class DocumentContent extends WAMessageContent {
  final Uint8List bytes;
  final String filename;
  final String mimetype;
  DocumentContent({required this.bytes, required this.filename, this.mimetype = 'application/octet-stream'});
}

class ReactionContent extends WAMessageContent {
  final String targetId;
  final String emoji; // empty string to remove reaction
  ReactionContent({required this.targetId, required this.emoji});
}

// ---------------------------------------------------------------------------
// Group
// ---------------------------------------------------------------------------

class WAGroup {
  final String id;
  final String subject;
  final String? description;
  final String? owner;
  final List<WAGroupParticipant> participants;
  final int? creation;

  const WAGroup({
    required this.id,
    required this.subject,
    this.description,
    this.owner,
    this.participants = const [],
    this.creation,
  });
}

class WAGroupParticipant {
  final String id;
  final bool isAdmin;
  final bool isSuperAdmin;

  const WAGroupParticipant({
    required this.id,
    this.isAdmin = false,
    this.isSuperAdmin = false,
  });
}
