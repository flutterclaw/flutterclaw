import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'package:flutterclaw/ui/widgets/channel_brand_icon.dart';
import 'package:flutterclaw/ui/widgets/status_dot.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/ui/screens/channels/telegram_config.dart';
import 'package:flutterclaw/ui/screens/channels/discord_config.dart';
import 'package:flutterclaw/ui/screens/channels/whatsapp_config.dart';
import 'package:flutterclaw/ui/screens/channels/slack_config.dart';
import 'package:flutterclaw/ui/screens/channels/signal_config.dart';
import 'package:flutterclaw/ui/screens/settings/gateway_screen.dart';

class ChannelsScreen extends ConsumerStatefulWidget {
  const ChannelsScreen({super.key});

  @override
  ConsumerState<ChannelsScreen> createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends ConsumerState<ChannelsScreen>
    with WidgetsBindingObserver {
  bool _gatewayLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshHealth());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshHealth();
    }
  }

  void _refreshHealth() {
    final router = ref.read(channelRouterProvider);
    final connected = <String, bool>{};
    for (final type in [
      'telegram',
      'discord',
      'slack',
      'signal',
      'whatsapp',
    ]) {
      final adapter = router.adapterFor(type);
      connected[type] = adapter?.isConnected ?? false;
    }
    ref.read(healthCheckResultsProvider.notifier).refresh(
          channelConnected: connected,
        );
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configManagerProvider).config;
    final gatewayState = ref.watch(gatewayStateProvider);
    final theme = Theme.of(context);
    final router = ref.watch(channelRouterProvider);
    final adapters = router.adapters;
    final health = ref.watch(healthCheckResultsProvider).asData?.value;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.channelsAndGateway)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Gateway card
          _GatewayCard(
            gatewayState: gatewayState,
            config: config,
            loading: _gatewayLoading,
            onToggle: _toggleGateway,
            onRestart: _restartGateway,
          ),
          const SizedBox(height: 16),
          Text(context.l10n.channelsLabel, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),

          // Chat (always available) — app primary color
          _ChannelTile(
            channelType: 'webchat',
            iconColor: theme.colorScheme.primary,
            name: context.l10n.webChat,
            subtitle: context.l10n.webChatBuiltIn,
            isConnected: true,
            isConfigured: true,
          ),

          // Telegram — brand blue #24A1DE
          _ChannelTile(
            channelType: 'telegram',
            iconColor: const Color(0xFF24A1DE),
            name: 'Telegram',
            subtitle: _channelSubtitle(
              'telegram',
              config.channels.telegram.enabled,
              healthIssue: health?.channelErrors['telegram'],
            ),
            isConnected: adapters.any(
              (a) => a.type == 'telegram' && a.isConnected,
            ),
            isConfigured: config.channels.telegram.enabled,
            onTap: () => _showTelegramConfig(context, ref),
          ),

          // Discord — brand purple #5865F2
          _ChannelTile(
            channelType: 'discord',
            iconColor: const Color(0xFF5865F2),
            name: 'Discord',
            subtitle: _channelSubtitle(
              'discord',
              config.channels.discord.enabled,
              healthIssue: health?.channelErrors['discord'],
            ),
            isConnected: adapters.any(
              (a) => a.type == 'discord' && a.isConnected,
            ),
            isConfigured: config.channels.discord.enabled,
            onTap: () => _showDiscordConfig(context, ref),
          ),

          // Slack — brand aubergine #4A154B
          _ChannelTile(
            channelType: 'slack',
            iconColor: const Color(0xFF4A154B),
            name: 'Slack',
            subtitle: _channelSubtitle(
              'slack',
              config.channels.slack.enabled,
              healthIssue: health?.channelErrors['slack'],
            ),
            isConnected: adapters.any(
              (a) => a.type == 'slack' && a.isConnected,
            ),
            isConfigured: config.channels.slack.enabled,
            onTap: () => _showSlackConfig(context, ref),
          ),

          // Signal — brand navy #3A76F0
          _ChannelTile(
            channelType: 'signal',
            iconColor: const Color(0xFF3A76F0),
            name: 'Signal',
            subtitle: _channelSubtitle(
              'signal',
              config.channels.signal.enabled,
              healthIssue: health?.channelErrors['signal'],
            ),
            isConnected: adapters.any(
              (a) => a.type == 'signal' && a.isConnected,
            ),
            isConfigured: config.channels.signal.enabled,
            onTap: () => _showSignalConfig(context, ref),
          ),

          // WhatsApp — brand green #25D366
          _ChannelTile(
            channelType: 'whatsapp',
            iconColor: const Color(0xFF25D366),
            name: 'WhatsApp',
            subtitle: _channelSubtitle(
              'whatsapp',
              config.channels.whatsapp.enabled,
              healthIssue: health?.channelErrors['whatsapp'],
            ),
            isConnected: adapters.any(
              (a) => a.type == 'whatsapp' && a.isConnected,
            ),
            isConfigured: config.channels.whatsapp.enabled,
            onTap: () => _showWhatsAppConfig(context, ref),
          ),

          const SizedBox(height: 16),

          // Pending pairing requests
          _PairingSection(pairingService: ref.read(pairingServiceProvider)),
        ],
      ),
    );
  }

  Future<void> _toggleGateway() async {
    final gatewayState = ref.read(gatewayStateProvider);
    final config = ref.read(configManagerProvider).config;
    try {
      setState(() => _gatewayLoading = true);
      if (gatewayState.isRunning) {
        if (Platform.isIOS) {
          await IosGatewayService.stop();
        } else {
          await BackgroundService.stopService();
        }
        ref.read(gatewayStateProvider.notifier).setRunning(false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.gatewayStopped)),
          );
        }
      } else {
        if (Platform.isIOS) {
          final success = await IosGatewayService.start(
            configManager: ref.read(configManagerProvider),
            providerRouter: ref.read(providerRouterProvider),
            sessionManager: ref.read(sessionManagerProvider),
            toolRegistry: ref.read(toolRegistryProvider),
            skillsService: ref.read(skillsServiceProvider),
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(success
                  ? context.l10n.gatewayStarted
                  : context.l10n.gatewayFailed(IosGatewayService.lastError ?? '')),
              backgroundColor: success ? null : Theme.of(context).colorScheme.error,
            ));
          }
          ref.read(gatewayStateProvider.notifier).setRunning(success);
        } else {
          if (Platform.isAndroid) {
            await ref.read(notificationServiceProvider).ensureAndroidNotificationPermission();
          }
          await BackgroundService.startService();
          ref.read(gatewayStateProvider.notifier).setRunning(true);
        }
        ref.read(gatewayStateProvider.notifier).setModel(
          config.activeAgent?.modelName ?? config.agents.defaults.modelName,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.l10n.exceptionError(e.toString())),
          backgroundColor: Theme.of(context).colorScheme.error,
        ));
      }
    } finally {
      if (mounted) setState(() => _gatewayLoading = false);
    }
  }

  Future<void> _restartGateway() async {
    final config = ref.read(configManagerProvider).config;
    ref.read(gatewayStateProvider.notifier).clearError();
    if (Platform.isIOS) {
      await IosGatewayService.stop();
      await Future.delayed(const Duration(milliseconds: 500));
      final success = await IosGatewayService.start(
        configManager: ref.read(configManagerProvider),
        providerRouter: ref.read(providerRouterProvider),
        sessionManager: ref.read(sessionManagerProvider),
        toolRegistry: ref.read(toolRegistryProvider),
        skillsService: ref.read(skillsServiceProvider),
      );
      ref.read(gatewayStateProvider.notifier).setRunning(success);
    } else {
      await BackgroundService.stopService();
      await Future.delayed(const Duration(milliseconds: 500));
      if (Platform.isAndroid) {
        await ref.read(notificationServiceProvider).ensureAndroidNotificationPermission();
      }
      await BackgroundService.startService();
      ref.read(gatewayStateProvider.notifier).setRunning(true);
    }
    ref.read(gatewayStateProvider.notifier).setModel(
      config.activeAgent?.modelName ?? config.agents.defaults.modelName,
    );
  }

  /// Subtitle for a channel tile, consistent with the status badge:
  /// shows the last connection error if any, otherwise the real
  /// connected/configured/not-set-up state based on `adapter.isConnected`.
  String _channelSubtitle(String type, bool configured, {String? healthIssue}) {
    if (healthIssue != null) {
      return context.l10n.channelHealthIssue;
    }
    final router = ref.read(channelRouterProvider);
    final error = router.lastErrorFor(type);
    if (error != null) return context.l10n.channelErrorLabel(error);
    if (!configured) return context.l10n.notSetUpStatus;
    final adapter = router.adapterFor(type);
    if (adapter != null && adapter.isConnected) return context.l10n.connected;
    return context.l10n.savedNotConnectedHint;
  }

  void _showTelegramConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TelegramConfigScreen()),
    );
  }

  void _showDiscordConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DiscordConfigScreen()),
    );
  }

  void _showSlackConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SlackConfigScreen()),
    );
  }

  void _showSignalConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SignalConfigScreen()),
    );
  }

  void _showWhatsAppConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => WhatsAppConfigScreen()),
    );
  }

}

class _ChannelTile extends StatelessWidget {
  final String channelType;
  final Color? iconColor;
  final String name;
  final String subtitle;
  final bool isConnected;
  final bool isConfigured;
  final VoidCallback? onTap;

  const _ChannelTile({
    required this.channelType,
    this.iconColor,
    required this.name,
    required this.subtitle,
    required this.isConnected,
    required this.isConfigured,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (statusLabel, statusColor) = isConnected
        ? (context.l10n.connected, const Color(0xFF2E7D32))
        : isConfigured
            ? (context.l10n.savedNotConnectedStatus, const Color(0xFFE65100))
            : (context.l10n.notSetUpStatus, theme.colorScheme.onSurfaceVariant);

    final dotState = isConnected
        ? StatusDotState.success
        : isConfigured
            ? StatusDotState.warning
            : StatusDotState.inactive;

    return Card(
      margin: const EdgeInsets.only(bottom: AppTokens.spacingXS),
      child: ListTile(
        leading: Container(
          width: AppTokens.touchTargetSM,
          height: AppTokens.touchTargetSM,
          padding: const EdgeInsets.all(AppTokens.spacingSM),
          decoration: BoxDecoration(
            color: (iconColor ?? theme.colorScheme.primary).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppTokens.radiusMD),
          ),
          child: ChannelBrandIcon(
            channelType: channelType,
            size: AppTokens.iconMD,
            iconColor: iconColor ?? theme.colorScheme.primary,
            semanticLabel: name,
          ),
        ),
        title: Text(name),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatusDot(
              state: dotState,
              size: 8,
              semanticLabel: statusLabel,
            ),
            const SizedBox(width: AppTokens.spacingXS),
            Text(
              statusLabel,
              style: theme.textTheme.labelSmall?.copyWith(color: statusColor),
            ),
            if (onTap != null) ...[
              const SizedBox(width: AppTokens.spacingXS),
              const Icon(Icons.chevron_right),
            ],
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class _PairingSection extends StatefulWidget {
  final PairingService pairingService;

  const _PairingSection({required this.pairingService});

  @override
  State<_PairingSection> createState() => _PairingSectionState();
}

class _PairingSectionState extends State<_PairingSection> {
  List<PairingRequest> _requests = [];
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _loadRequests();
    // Auto-refresh every 10 seconds to detect new pairing requests
    _refreshTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      _loadRequests();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadRequests() async {
    final requests = await widget.pairingService.getAllPending();
    if (mounted) setState(() => _requests = requests);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(context.l10n.pairingRequestsTitle, style: theme.textTheme.titleLarge),
            const SizedBox(width: 8),
            if (_requests.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_requests.length}',
                  style: TextStyle(
                    color: Colors.orange.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (_requests.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      context.l10n.noPendingPairingRequests,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ..._requests.map(
            (r) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  child: Icon(
                    Icons.person_add,
                    color: Colors.orange.shade900,
                    size: 20,
                  ),
                ),
                title: Text(
                  r.senderName.isNotEmpty ? r.senderName : r.senderId,
                ),
                subtitle: Text(
                  '${r.channel} | Code: ${r.code}\n'
                  'Expires: ${_timeLeft(r.createdAt)}',
                ),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                      tooltip: context.l10n.approve,
                      onPressed: () async {
                        await widget.pairingService.approve(r.channel, r.code);
                        await _loadRequests();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(context.l10n.pairingRequestApproved),
                            ),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      tooltip: context.l10n.reject,
                      onPressed: () async {
                        await widget.pairingService.reject(r.channel, r.code);
                        await _loadRequests();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(context.l10n.pairingRequestRejected),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _timeLeft(DateTime createdAt) {
    final expires = createdAt.add(const Duration(hours: 1));
    final diff = expires.difference(DateTime.now());
    if (diff.isNegative) return context.l10n.expired;
    return context.l10n.minutesLeft(diff.inMinutes);
  }
}

// ---------------------------------------------------------------------------
// Gateway card — clean single-status-dot design
// ---------------------------------------------------------------------------

class _GatewayCard extends StatelessWidget {
  const _GatewayCard({
    required this.gatewayState,
    required this.config,
    required this.loading,
    required this.onToggle,
    required this.onRestart,
  });

  final GatewayState gatewayState;
  final dynamic config;
  final bool loading;
  final VoidCallback onToggle;
  final VoidCallback onRestart;

  StatusDotState get _dotState {
    return switch (gatewayState.state) {
      'starting' || 'retrying' => StatusDotState.connecting,
      'error' => StatusDotState.error,
      'running' => StatusDotState.success,
      _ => StatusDotState.inactive,
    };
  }

  String _statusText(BuildContext context) {
    return switch (gatewayState.state) {
      'starting' => context.l10n.gatewayStartingStatus,
      'retrying' => context.l10n.gatewayRetryingStatus,
      'error' => _humanizeError(gatewayState.lastError) ?? context.l10n.errorStartingGateway,
      'running' => context.l10n.runningStatus,
      _ => context.l10n.stoppedStatus,
    };
  }

  String? _humanizeError(String? raw) {
    if (raw == null) return null;
    if (raw.contains('address already in use') || raw.contains('EADDRINUSE')) {
      return 'Port already in use — try restarting';
    }
    if (raw.contains('permission denied') || raw.contains('EACCES')) {
      return 'Permission denied — check system settings';
    }
    if (raw.contains('network') || raw.contains('socket')) {
      return 'Network error — check connection and retry';
    }
    // Truncate very long raw errors
    return raw.length > 80 ? '${raw.substring(0, 80)}…' : raw;
  }

  static String _formatUptime(int seconds) {
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) return '${seconds ~/ 60}m ${seconds % 60}s';
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    return '${h}h ${m}m';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isTransient = gatewayState.state == 'starting' || gatewayState.state == 'retrying';
    final address = 'ws://${config.gateway.host}:${config.gateway.port}';
    final model = gatewayState.currentModel.isNotEmpty
        ? gatewayState.currentModel
        : (config.activeAgent?.modelName ?? config.agents.defaults.modelName) as String;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.spacingLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: dot + title + status text + action buttons
            Row(
              children: [
                isTransient
                    ? StatusDot.pulsing(
                        size: 10,
                        semanticLabel: _statusText(context),
                      )
                    : StatusDot(
                        state: _dotState,
                        size: 10,
                        semanticLabel: _statusText(context),
                      ),
                const SizedBox(width: AppTokens.spacingSM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.l10n.gateway, style: theme.textTheme.titleMedium),
                      Text(
                        _statusText(context),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: gatewayState.state == 'error'
                              ? cs.error
                              : cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                // Restart — always visible
                IconButton(
                  icon: const Icon(Icons.restart_alt),
                  tooltip: context.l10n.restartGateway,
                  onPressed: loading ? null : onRestart,
                ),
                // Start / Stop
                FilledButton.tonal(
                  onPressed: loading ? null : onToggle,
                  child: loading
                      ? const SizedBox(
                          width: AppTokens.iconSM,
                          height: AppTokens.iconSM,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(gatewayState.isRunning ? context.l10n.stop : context.l10n.start),
                ),
              ],
            ),

            // Error message with copy button
            if (gatewayState.lastError != null) ...[
              const SizedBox(height: AppTokens.spacingSM),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTokens.spacingMD,
                  vertical: AppTokens.spacingSM,
                ),
                decoration: BoxDecoration(
                  color: cs.errorContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppTokens.radiusMD),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline_rounded, size: AppTokens.iconSM, color: cs.error),
                    const SizedBox(width: AppTokens.spacingSM),
                    Expanded(
                      child: Text(
                        _humanizeError(gatewayState.lastError) ?? gatewayState.lastError!,
                        style: theme.textTheme.bodySmall?.copyWith(color: cs.onErrorContainer),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy_outlined),
                      iconSize: AppTokens.iconSM,
                      tooltip: 'Copy error',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: AppTokens.touchTargetSM, minHeight: AppTokens.touchTargetSM),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: gatewayState.lastError!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error copied'), duration: Duration(seconds: 1)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],

            // Collapsible details
            const SizedBox(height: AppTokens.spacingXS),
            Theme(
              data: theme.copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                title: Text(
                  address,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    color: cs.onSurfaceVariant,
                  ),
                ),
                trailing: Icon(Icons.expand_more, size: AppTokens.iconMD, color: cs.onSurfaceVariant),
                children: [
                  const SizedBox(height: AppTokens.spacingXS),
                  if (gatewayState.isRunning) ...[
                    _InfoRow(icon: Icons.model_training, label: 'Model: $model'),
                    _InfoRow(icon: Icons.timer, label: 'Uptime: ${_formatUptime(gatewayState.uptimeSeconds)}'),
                  ],
                  if (Platform.isIOS && gatewayState.isRunning)
                    _InfoRow(icon: Icons.mobile_friendly, label: 'Live Activity active'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GatewayScreen()),
                      ),
                      icon: const Icon(Icons.settings_outlined, size: AppTokens.iconSM),
                      label: Text(context.l10n.gatewaySettingsLink),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTokens.spacingXS),
      child: Row(
        children: [
          Icon(icon, size: AppTokens.iconSM, color: cs.onSurfaceVariant),
          const SizedBox(width: AppTokens.spacingSM),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}

