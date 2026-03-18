/// Base types for the channel adapter system.
///
/// All channel adapters (Telegram, Discord, WebChat) implement [ChannelAdapter]
/// and exchange [IncomingMessage] / [OutgoingMessage] through a [MessageHandler].
library;

typedef MessageHandler = Future<void> Function(IncomingMessage message);

/// Represents a message received from any channel.
class IncomingMessage {
  final String channelType; // 'telegram', 'discord', 'webchat', 'whatsapp'
  final String senderId;
  final String senderName;
  final String chatId;
  final String text;
  final bool isGroup;
  final String? messageId;
  final String? participantId;
  final String? replyToMessageId;
  final DateTime timestamp;
  final List<String>? photoUrls;
  final String? action;
  final String? emoji;
  final String? targetMessageId;
  final bool? fromMe;
  final Map<String, dynamic>? channelContext;
  final List<Map<String, dynamic>>? contentBlocks;

  const IncomingMessage({
    required this.channelType,
    required this.senderId,
    required this.senderName,
    required this.chatId,
    required this.text,
    this.isGroup = false,
    this.messageId,
    this.participantId,
    this.replyToMessageId,
    required this.timestamp,
    this.photoUrls,
    this.action,
    this.emoji,
    this.targetMessageId,
    this.fromMe,
    this.channelContext,
    this.contentBlocks,
  });

  /// Session key for per-channel isolation (channel + chatId).
  String get sessionKey => '$channelType:$chatId';
}

/// Represents a message to be sent to any channel.
class OutgoingMessage {
  final String channelType;
  final String chatId;
  final String text;
  final String? replyToMessageId;
  final List<String>? photoUrls;
  final String? action;
  final String? targetMessageId;
  final String? emoji;
  final String? participantId;
  final bool? fromMe;

  const OutgoingMessage({
    required this.channelType,
    required this.chatId,
    required this.text,
    this.replyToMessageId,
    this.photoUrls,
    this.action,
    this.targetMessageId,
    this.emoji,
    this.participantId,
    this.fromMe,
  });
}

/// Abstract base for channel adapters.
abstract class ChannelAdapter {
  String get type;
  bool get isConnected;

  Future<void> start(MessageHandler handler);
  Future<void> stop();
  Future<void> sendMessage(OutgoingMessage message);
}
