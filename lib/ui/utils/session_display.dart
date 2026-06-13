import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/generated/app_localizations.dart';

/// Human-readable labels for session keys (e.g. `telegram:12345` → "Telegram chat").
class SessionDisplay {
  SessionDisplay._();

  static String channelLabel(AppLocalizations l10n, String channelType) {
    return switch (channelType) {
      'webchat' => l10n.channelApp,
      'telegram' => l10n.telegram,
      'discord' => l10n.discord,
      'slack' => 'Slack',
      'signal' => 'Signal',
      'whatsapp' => 'WhatsApp',
      'heartbeat' => l10n.channelHeartbeat,
      'cron' => l10n.channelCron,
      'subagent' => l10n.channelSubagent,
      'system' => l10n.channelSystem,
      _ => channelType,
    };
  }

  static String title(
    AppLocalizations l10n,
    String key, {
    SessionMeta? meta,
    List<AgentProfile> agents = const [],
    AgentProfile? activeAgent,
  }) {
    if (meta?.displayName != null && meta!.displayName!.trim().isNotEmpty) {
      return meta.displayName!.trim();
    }

    final parts = key.split(':');
    final channelType = parts.isNotEmpty ? parts[0] : key;
    final chatId = parts.length > 1 ? parts.sublist(1).join(':') : '';

    final AgentProfile? agent = channelType == 'webchat'
        ? agents.where((a) => a.id == chatId).firstOrNull
        : activeAgent;
    final agentName = agent?.name ?? '';

    final channel = channelLabel(l10n, channelType);
    if (agentName.isNotEmpty) return '$agentName · $channel';
    if (channelType == 'webchat') return channel;
    if (chatId.isNotEmpty) {
      return '$channel · ${l10n.sessionChatLabel}';
    }
    return channel;
  }

  static String subtitle(
    AppLocalizations l10n,
    SessionMeta meta,
    String modelName,
  ) {
    final diff = DateTime.now().difference(meta.lastActivity);
    final ago = diff.inSeconds < 60
        ? l10n.secondsAgo(diff.inSeconds)
        : diff.inMinutes < 60
            ? l10n.minutesAgo(diff.inMinutes)
            : diff.inHours < 24
                ? l10n.hoursAgo(diff.inHours)
                : l10n.daysAgo(diff.inDays);
    return '$modelName · ${meta.messageCount} ${l10n.messagesAbbrev} · $ago';
  }

  /// Raw session key for detail/debug views.
  static String detailKey(String key) => key;
}
