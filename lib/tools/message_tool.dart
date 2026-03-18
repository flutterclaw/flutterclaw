/// Message tool for FlutterClaw.
///
/// Sends messages to channels and discovers active channel sessions / paired
/// devices.
library;

import 'dart:convert';

import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'registry.dart';

/// Callback invoked when a message send is requested.
typedef MessageSendCallback =
    Future<void> Function({
      required String channel,
      required String target,
      required String text,
      String? action,
      String? targetMessageId,
      String? emoji,
      String? participantId,
      bool? fromMe,
    });

/// Sends a message to a channel.
///
/// Use `channel_sessions` first to discover the target chat_id if you don't
/// already know it.
class MessageTool extends Tool {
  final MessageSendCallback onSend;

  MessageTool(this.onSend);

  @override
  String get name => 'message';

  @override
  String get description =>
      'Send a message or reaction to a channel (telegram, discord, webchat, whatsapp).\n\n'
      'If you don\'t know the target chat_id, call channel_sessions first to '
      'discover active sessions and paired devices, then use the chat_id from '
      'the results. For WhatsApp reactions, set action="react" and include '
      'target_message_id plus emoji.';

  @override
  Map<String, dynamic> get parameters => {
    'type': 'object',
    'properties': {
      'channel': {
        'type': 'string',
        'description':
            'Channel type: "telegram", "discord", "webchat", or "whatsapp".',
      },
      'target': {
        'type': 'string',
        'description':
            'Target chat_id for the channel. Use channel_sessions to find it.',
      },
      'text': {
        'type': 'string',
        'description': 'Message text to send. Optional when action="react".',
      },
      'action': {
        'type': 'string',
        'description':
            'Optional action. Currently supports "react" for WhatsApp.',
        'enum': ['react'],
      },
      'target_message_id': {
        'type': 'string',
        'description':
            'Required for action="react": the message ID to react to.',
      },
      'emoji': {
        'type': 'string',
        'description':
            'Emoji to use for action="react". Use an empty string to remove a reaction.',
      },
      'participant_id': {
        'type': 'string',
        'description': 'Optional WhatsApp participant JID for group reactions.',
      },
      'from_me': {
        'type': 'boolean',
        'description':
            'Optional WhatsApp reaction flag indicating whether the target message was sent by the bot account.',
      },
    },
    'required': ['channel', 'target'],
  };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final channel = args['channel'] as String?;
    final target = args['target'] as String?;
    final text = (args['text'] as String?) ?? '';
    final action = args['action'] as String?;
    final targetMessageId = args['target_message_id'] as String?;
    final emoji = args['emoji'] as String?;
    final participantId = args['participant_id'] as String?;
    final fromMe = args['from_me'] as bool?;

    if (channel == null || channel.isEmpty) {
      return ToolResult.error('channel is required');
    }
    if (target == null || target.isEmpty) {
      return ToolResult.error('target is required');
    }

    if (action == 'react') {
      if (targetMessageId == null || targetMessageId.isEmpty) {
        return ToolResult.error(
          'target_message_id is required for action="react"',
        );
      }
      if (emoji == null) {
        return ToolResult.error('emoji is required for action="react"');
      }
    } else if (text.isEmpty) {
      return ToolResult.error('text is required');
    }

    try {
      await onSend(
        channel: channel,
        target: target,
        text: text,
        action: action,
        targetMessageId: targetMessageId,
        emoji: emoji,
        participantId: participantId,
        fromMe: fromMe,
      );
      return ToolResult.success(
        action == 'react'
            ? 'Reaction sent to $channel:$target'
            : 'Message sent to $channel:$target',
      );
    } catch (e) {
      return ToolResult.error('Message send failed: $e');
    }
  }
}

// ---------------------------------------------------------------------------
// channel_sessions — discover active channel sessions and paired devices
// ---------------------------------------------------------------------------

/// Lists active channel sessions and paired devices so the agent can find
/// the right chat_id for sending messages.
class ChannelSessionsTool extends Tool {
  final SessionManager sessionManager;
  final PairingService pairingService;

  ChannelSessionsTool({
    required this.sessionManager,
    required this.pairingService,
  });

  @override
  String get name => 'channel_sessions';

  @override
  String get description =>
      'List active channel sessions and paired devices. '
      'Use this to find the chat_id needed by the "message" tool.\n\n'
      'Returns sessions grouped by channel (telegram, discord, webchat, whatsapp) with '
      'chat_id, last activity, and paired device names.';

  @override
  Map<String, dynamic> get parameters => {
    'type': 'object',
    'properties': {
      'channel': {
        'type': 'string',
        'description':
            'Optional: filter by channel type (telegram, discord, webchat, whatsapp). '
            'Omit to list all channels.',
      },
    },
    'required': [],
  };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final filterChannel = (args['channel'] as String?)?.trim().toLowerCase();

    final sessions = sessionManager.listActiveSessions();
    final channelSessions = <String, List<Map<String, dynamic>>>{};

    for (final s in sessions) {
      if (filterChannel != null && s.channelType != filterChannel) continue;
      if (s.channelType == 'cron' ||
          s.key.startsWith('cron:') ||
          s.key.startsWith('subagent:') ||
          s.key.startsWith('heartbeat:')) {
        continue;
      }

      channelSessions.putIfAbsent(s.channelType, () => []).add({
        'session_key': s.key,
        'chat_id': s.chatId,
        'last_activity': s.lastActivity.toIso8601String(),
        'message_count': s.messageCount,
      });
    }

    final pairedDevices = <String, List<Map<String, String>>>{};
    for (final channel in ['telegram', 'discord', 'whatsapp']) {
      if (filterChannel != null && channel != filterChannel) continue;
      final approved = await pairingService.getApproved(channel);
      if (approved.isNotEmpty) {
        pairedDevices[channel] = approved.entries
            .map((e) => {'id': e.key, 'name': e.value})
            .toList();
      }
    }

    return ToolResult.success(
      jsonEncode({
        'ok': true,
        'sessions': channelSessions,
        'paired_devices': pairedDevices,
      }),
    );
  }
}
