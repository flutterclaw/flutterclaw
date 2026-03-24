import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/widgets/channel_brand_icon.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/ui/screens/channels/telegram_config.dart';
import 'package:flutterclaw/ui/screens/channels/discord_config.dart';
import 'package:flutterclaw/ui/screens/channels/whatsapp_config.dart';
import 'package:flutterclaw/ui/screens/channels/slack_config.dart';
import 'package:flutterclaw/ui/screens/channels/signal_config.dart';

class ChannelsScreen extends ConsumerStatefulWidget {
  const ChannelsScreen({super.key});

  @override
  ConsumerState<ChannelsScreen> createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends ConsumerState<ChannelsScreen> {
  bool _gatewayLoading = false;

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configManagerProvider).config;
    final gatewayState = ref.watch(gatewayStateProvider);
    final theme = Theme.of(context);
    final router = ref.watch(channelRouterProvider);
    final adapters = router.adapters;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.channelsAndGateway)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Gateway card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        gatewayState.state == 'error'
                            ? Icons.cloud_off
                            : gatewayState.state == 'starting' ||
                                  gatewayState.state == 'retrying'
                            ? Icons.cloud_sync
                            : gatewayState.isRunning
                            ? Icons.cloud_done
                            : Icons.cloud_off,
                        color: gatewayState.state == 'error'
                            ? theme.colorScheme.error
                            : gatewayState.state == 'starting' ||
                                  gatewayState.state == 'retrying'
                            ? Colors.orange
                            : gatewayState.isRunning
                            ? Colors.green
                            : theme.colorScheme.error,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.gateway,
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              _getGatewayStatusText(gatewayState, context),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: gatewayState.state == 'error'
                                    ? theme.colorScheme.error
                                    : gatewayState.state == 'starting' ||
                                          gatewayState.state == 'retrying'
                                    ? Colors.orange
                                    : theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (Platform.isIOS && gatewayState.isRunning)
                              Row(
                                children: [
                                  Icon(
                                    Icons.live_tv,
                                    size: 14,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      'Live Activity active',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: Theme.of(context).colorScheme.primary),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      if (gatewayState.state == 'error')
                        FilledButton.tonal(
                          onPressed: () async {
                            ref
                                .read(gatewayStateProvider.notifier)
                                .clearError();
                            if (Platform.isIOS) {
                              await IosGatewayService.stop();
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              final success = await IosGatewayService.start(
                                configManager: ref.read(configManagerProvider),
                                providerRouter: ref.read(
                                  providerRouterProvider,
                                ),
                                sessionManager: ref.read(
                                  sessionManagerProvider,
                                ),
                                toolRegistry: ref.read(toolRegistryProvider),
                                skillsService: ref.read(skillsServiceProvider),
                              );
                              ref
                                  .read(gatewayStateProvider.notifier)
                                  .setRunning(success);
                            } else {
                              await BackgroundService.stopService();
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              if (Platform.isAndroid) {
                                await ref
                                    .read(notificationServiceProvider)
                                    .ensureAndroidNotificationPermission();
                              }
                              await BackgroundService.startService();
                            }
                            ref
                                .read(gatewayStateProvider.notifier)
                                .setModel(config.activeAgent?.modelName ?? config.agents.defaults.modelName);
                          },
                          child: Text('Retry'),
                        )
                      else
                        FilledButton.tonal(
                          onPressed: _gatewayLoading
                              ? null
                              : () async {
                                  try {
                                    setState(() => _gatewayLoading = true);
                                    if (gatewayState.isRunning) {                                      if (Platform.isIOS) {
                                        await IosGatewayService.stop();
                                      } else {
                                        await BackgroundService.stopService();
                                      }
                                      ref
                                          .read(gatewayStateProvider.notifier)
                                          .setRunning(false);                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('Gateway stopped'),
                                          ),
                                        );
                                      }
                                    } else {                                      if (Platform.isIOS) {                                        final configManager = ref.read(
                                          configManagerProvider,
                                        );
                                        final providerRouter = ref.read(
                                          providerRouterProvider,
                                        );
                                        final sessionManager = ref.read(
                                          sessionManagerProvider,
                                        );
                                        final toolRegistry = ref.read(
                                          toolRegistryProvider,
                                        );
                                        final skillsService = ref.read(
                                          skillsServiceProvider,
                                        );                                        final success =
                                            await IosGatewayService.start(
                                              configManager: configManager,
                                              providerRouter: providerRouter,
                                              sessionManager: sessionManager,
                                              toolRegistry: toolRegistry,
                                              skillsService: skillsService,
                                            );
                                        if (!success) {                                          if (context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Gateway failed: ${IosGatewayService.lastError}',
                                                ),
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 5),
                                              ),
                                            );
                                          }
                                        } else {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Gateway started successfully!',
                                                ),
                                              ),
                                            );
                                          }
                                        }

                                        ref
                                            .read(gatewayStateProvider.notifier)
                                            .setRunning(success);                                      } else {
                                        if (Platform.isAndroid) {
                                          await ref
                                              .read(notificationServiceProvider)
                                              .ensureAndroidNotificationPermission();
                                        }
                                        await BackgroundService.startService();
                                        ref
                                            .read(gatewayStateProvider.notifier)
                                            .setRunning(true);
                                      }
                                      ref
                                          .read(gatewayStateProvider.notifier)
                                          .setModel(
                                            config.activeAgent?.modelName ?? config.agents.defaults.modelName,
                                          );
                                    }
                                  } catch (e) {                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('Exception: $e'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 5),
                                        ),
                                      );
                                    }
                                  } finally {
                                    if (mounted) {
                                      setState(() => _gatewayLoading = false);
                                    }
                                  }
                                },
                          child: _gatewayLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  gatewayState.isRunning
                                      ? context.l10n.stop
                                      : context.l10n.start,
                                ),
                        ),
                      if (gatewayState.isRunning) ...[
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          icon: const Icon(Icons.restart_alt),
                          tooltip: context.l10n.restartGateway,
                          onPressed: () async {
                            if (Platform.isIOS) {
                              await IosGatewayService.stop();
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              final success = await IosGatewayService.start(
                                configManager: ref.read(configManagerProvider),
                                providerRouter: ref.read(
                                  providerRouterProvider,
                                ),
                                sessionManager: ref.read(
                                  sessionManagerProvider,
                                ),
                                toolRegistry: ref.read(toolRegistryProvider),
                                skillsService: ref.read(skillsServiceProvider),
                              );
                              ref
                                  .read(gatewayStateProvider.notifier)
                                  .setRunning(success);
                            } else {
                              await BackgroundService.stopService();
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              if (Platform.isAndroid) {
                                await ref
                                    .read(notificationServiceProvider)
                                    .ensureAndroidNotificationPermission();
                              }
                              await BackgroundService.startService();
                            }
                            ref
                                .read(gatewayStateProvider.notifier)
                                .setModel(config.activeAgent?.modelName ?? config.agents.defaults.modelName);
                          },
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.router,
                              size: 16,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'ws://${config.gateway.host}:${config.gateway.port}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        if (gatewayState.isRunning) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.model_training,
                                size: 16,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Model: ${gatewayState.currentModel.isNotEmpty ? gatewayState.currentModel : config.activeAgent?.modelName ?? config.agents.defaults.modelName}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                size: 16,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Uptime: ${_formatUptime(gatewayState.uptimeSeconds)}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (gatewayState.lastError != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.error.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 16,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              gatewayState.lastError!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (Platform.isIOS && gatewayState.isRunning) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.blue.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.mobile_friendly, size: 16, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'iOS: Background support enabled - gateway can continue responding',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
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
            subtitle: _channelStatus(
              config.channels.telegram.enabled,
              adapters.any((a) => a.type == 'telegram'),
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
            subtitle: _channelStatus(
              config.channels.discord.enabled,
              adapters.any((a) => a.type == 'discord'),
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
            subtitle: _channelStatus(
              config.channels.slack.enabled,
              adapters.any((a) => a.type == 'slack'),
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
            subtitle: _channelStatus(
              config.channels.signal.enabled,
              adapters.any((a) => a.type == 'signal'),
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
            subtitle: _channelStatus(
              config.channels.whatsapp.enabled,
              adapters.any((a) => a.type == 'whatsapp'),
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

  String _getGatewayStatusText(
    GatewayState gatewayState,
    BuildContext context,
  ) {
    switch (gatewayState.state) {
      case 'starting':
        return context.l10n.gatewayStartingStatus;
      case 'retrying':
        return context.l10n.gatewayRetryingStatus;
      case 'error':
        return gatewayState.lastError ?? context.l10n.errorStartingGateway;
      case 'running':
        return context.l10n.runningStatus;
      default:
        return context.l10n.stoppedStatus;
    }
  }

  String _channelStatus(bool configured, bool running) {
    if (!configured) return context.l10n.notSetUpStatus;
    if (running) return context.l10n.connected;
    return context.l10n.configuredStatus;
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

  String _formatUptime(int seconds) {
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) return '${seconds ~/ 60}m ${seconds % 60}s';
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
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
            ? (context.l10n.configuredStatus, const Color(0xFFE65100))
            : (context.l10n.notSetUpStatus, theme.colorScheme.onSurfaceVariant);

    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (iconColor ?? theme.colorScheme.primary).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ChannelBrandIcon(
            channelType: channelType,
            size: 20,
            iconColor: iconColor ?? theme.colorScheme.primary,
          ),
        ),
        title: Text(name),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: statusColor.withValues(alpha: 0.4), width: 0.8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: statusColor, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    statusLabel,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 4),
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

