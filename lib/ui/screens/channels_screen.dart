import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutterclaw/channels/channel_interface.dart';
import 'package:flutterclaw/channels/discord.dart';
import 'package:flutterclaw/channels/slack.dart';
import 'package:flutterclaw/channels/telegram.dart';
import 'package:flutterclaw/channels/whatsapp.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/ui/widgets/whatsapp_pairing_status_card.dart';

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
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      'Live Activity active',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: Colors.green),
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
                                .setModel(config.agents.defaults.modelName);
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
                                    if (gatewayState.isRunning) {
                                      print('🔵 Stopping gateway...');
                                      if (Platform.isIOS) {
                                        await IosGatewayService.stop();
                                      } else {
                                        await BackgroundService.stopService();
                                      }
                                      ref
                                          .read(gatewayStateProvider.notifier)
                                          .setRunning(false);
                                      print('✅ Gateway stopped');
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('Gateway stopped'),
                                          ),
                                        );
                                      }
                                    } else {
                                      print(
                                        '🔵 Starting gateway on ${Platform.operatingSystem}...',
                                      );
                                      if (Platform.isIOS) {
                                        print('🔵 Loading providers...');
                                        final configManager = ref.read(
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
                                        );
                                        print('🔵 All providers loaded');

                                        print(
                                          '🔵 Calling IosGatewayService.start...',
                                        );
                                        final success =
                                            await IosGatewayService.start(
                                              configManager: configManager,
                                              providerRouter: providerRouter,
                                              sessionManager: sessionManager,
                                              toolRegistry: toolRegistry,
                                              skillsService: skillsService,
                                            );
                                        print(
                                          '🔵 IosGatewayService.start returned: $success',
                                        );

                                        if (!success) {
                                          print(
                                            '❌ Gateway failed to start. Error: ${IosGatewayService.lastError}',
                                          );
                                          if (context.mounted) {
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
                                            .setRunning(success);
                                        print(
                                          '✅ Gateway state set to: $success',
                                        );
                                      } else {
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
                                            config.agents.defaults.modelName,
                                          );
                                    }
                                  } catch (e, st) {
                                    print('❌ Exception in gateway start/stop:');
                                    print('❌ Error: $e');
                                    print('❌ Stack: $st');
                                    if (context.mounted) {
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
                          tooltip: 'Restart Gateway',
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
                                .setModel(config.agents.defaults.modelName);
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
                                'Model: ${gatewayState.currentModel.isNotEmpty ? gatewayState.currentModel : config.agents.defaults.modelName}',
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
          Text('Channels', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),

          // Chat (always available)
          _ChannelTile(
            icon: Icons.chat,
            name: 'Chat',
            subtitle: 'Built-in chat interface',
            isConnected: true,
            isConfigured: true,
          ),

          // Telegram
          _ChannelTile(
            icon: Icons.telegram,
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

          // Discord
          _ChannelTile(
            icon: Icons.forum,
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

          // Slack
          _ChannelTile(
            icon: Icons.tag,
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

          // WhatsApp
          _ChannelTile(
            icon: Icons.chat,
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
        return 'Starting gateway...';
      case 'retrying':
        return 'Retrying gateway start...';
      case 'error':
        return gatewayState.lastError ?? 'Error starting gateway';
      case 'running':
        return 'Running';
      default:
        return 'Stopped';
    }
  }

  String _channelStatus(bool configured, bool running) {
    if (!configured) return 'Not configured';
    if (running) return 'Connected';
    return 'Configured (starting...)';
  }

  void _showTelegramConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _TelegramConfigScreen()),
    );
  }

  void _showDiscordConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _DiscordConfigScreen()),
    );
  }

  void _showSlackConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _SlackConfigScreen()),
    );
  }

  void _showWhatsAppConfig(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _WhatsAppConfigScreen()),
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
  final IconData icon;
  final String name;
  final String subtitle;
  final bool isConnected;
  final bool isConfigured;
  final VoidCallback? onTap;

  const _ChannelTile({
    required this.icon,
    required this.name,
    required this.subtitle,
    required this.isConnected,
    required this.isConfigured,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 28),
        title: Text(name),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isConnected
                    ? Colors.green
                    : isConfigured
                    ? Colors.orange
                    : Colors.grey,
              ),
            ),
            if (onTap != null) const SizedBox(width: 8),
            if (onTap != null) const Icon(Icons.chevron_right),
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
            Text('Pairing Requests', style: theme.textTheme.titleLarge),
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
                      'No pending pairing requests',
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
                      tooltip: 'Approve',
                      onPressed: () async {
                        await widget.pairingService.approve(r.channel, r.code);
                        await _loadRequests();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pairing request approved'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      tooltip: 'Reject',
                      onPressed: () async {
                        await widget.pairingService.reject(r.channel, r.code);
                        await _loadRequests();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pairing request rejected'),
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
    if (diff.isNegative) return 'Expired';
    return '${diff.inMinutes}m left';
  }
}

// ---------------------------------------------------------------------------
// Telegram Configuration Screen
// ---------------------------------------------------------------------------

class _TelegramConfigScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_TelegramConfigScreen> createState() =>
      _TelegramConfigScreenState();
}

class _TelegramConfigScreenState extends ConsumerState<_TelegramConfigScreen> {
  late TextEditingController _tokenCtl;
  late String _dmPolicy;

  /// id → display name
  Map<String, String> _approvedDevices = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(configManagerProvider).config.channels.telegram;
    _tokenCtl = TextEditingController(text: config.token ?? '');
    _dmPolicy = config.dmPolicy;
    _loadApprovedDevices();
  }

  @override
  void dispose() {
    _tokenCtl.dispose();
    super.dispose();
  }

  Future<void> _loadApprovedDevices() async {
    final pairingService = ref.read(pairingServiceProvider);
    final map = await pairingService.getApproved('telegram');
    if (mounted) setState(() => _approvedDevices = map);
  }

  Future<void> _removeDevice(String deviceId) async {
    setState(() => _approvedDevices.remove(deviceId));

    final pairingService = ref.read(pairingServiceProvider);
    pairingService.removeApproved('telegram', deviceId);
  }

  Future<void> _addDevice() async {
    final deviceId = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Device'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'User ID',
              hintText: 'Enter Telegram user ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text.trim()),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );

    if (deviceId != null &&
        deviceId.isNotEmpty &&
        !_approvedDevices.containsKey(deviceId)) {
      setState(() => _approvedDevices[deviceId] = '');
      final pairingService = ref.read(pairingServiceProvider);
      await pairingService.addApproved('telegram', deviceId, '');
    }
  }

  Future<void> _save() async {
    setState(() => _isLoading = true);

    try {
      final configManager = ref.read(configManagerProvider);
      final token = _tokenCtl.text.trim();

      configManager.update(
        configManager.config.copyWith(
          channels: ChannelsConfig(
            telegram: TelegramConfig(
              enabled: token.isNotEmpty,
              token: token.isNotEmpty ? token : null,
              allowFrom: _dmPolicy == 'allowlist'
                  ? _approvedDevices.keys.toList()
                  : [],
              dmPolicy: _dmPolicy,
            ),
            discord: configManager.config.channels.discord,
          ),
        ),
      );
      await configManager.save();

      if (token.isNotEmpty) {
        final router = ref.read(channelRouterProvider);
        final pairingService = ref.read(pairingServiceProvider);
        final cmdHandler = ref.read(chatCommandHandlerProvider);
        router.unregisterAdapter('telegram');

        final adapter = TelegramChannelAdapter(
          token: token,
          allowedUserIds: _dmPolicy == 'allowlist'
              ? _approvedDevices.keys.toList()
              : [],
          dmPolicy: _dmPolicy,
          pairingService: pairingService,
          chatCommandHandler: (sessionKey, command) async {
            final result = await cmdHandler.handle(sessionKey, command);
            return result.handled ? result.response : null;
          },
        );

        router.registerAdapter(adapter);
        final agentLoop = ref.read(agentLoopProvider);

        await adapter.start((msg) async {
          final response = await agentLoop.processMessage(
            msg.sessionKey,
            msg.text,
            channelType: msg.channelType,
            chatId: msg.chatId,
            contentBlocks: msg.contentBlocks,
          );
          await adapter.sendMessage(
            OutgoingMessage(
              channelType: msg.channelType,
              chatId: msg.chatId,
              text: response.content,
            ),
          );
        });
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Telegram configuration saved')),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Telegram Configuration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bot Token Section
          Text('Bot Token', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _tokenCtl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Bot Token',
              border: const OutlineInputBorder(),
              hintText: 'Get from @BotFather',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                icon: const Icon(Icons.paste),
                tooltip: 'Paste',
                onPressed: () async {
                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                  if (data?.text != null) _tokenCtl.text = data!.text!;
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Security Method Section
          Text('Security Method', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),

          _SecurityMethodCard(
            title: 'Pairing (Recommended)',
            description:
                'New users get a pairing code. You approve or reject them.',
            icon: Icons.link,
            isSelected: _dmPolicy == 'pairing',
            onTap: () => setState(() => _dmPolicy = 'pairing'),
            color: Colors.blue,
          ),

          _SecurityMethodCard(
            title: 'Allowlist',
            description: 'Only specific user IDs can access the bot.',
            icon: Icons.list_alt,
            isSelected: _dmPolicy == 'allowlist',
            onTap: () => setState(() => _dmPolicy = 'allowlist'),
            color: Colors.green,
          ),

          _SecurityMethodCard(
            title: 'Open',
            description:
                'Anyone can use the bot immediately (not recommended).',
            icon: Icons.public,
            isSelected: _dmPolicy == 'open',
            onTap: () => setState(() => _dmPolicy = 'open'),
            color: Colors.orange,
          ),

          _SecurityMethodCard(
            title: 'Disabled',
            description:
                'No DMs allowed. Bot will not respond to any messages.',
            icon: Icons.block,
            isSelected: _dmPolicy == 'disabled',
            onTap: () => setState(() => _dmPolicy = 'disabled'),
            color: Colors.red,
          ),

          const SizedBox(height: 24),

          // Devices Section (shown for pairing or allowlist)
          if (_dmPolicy == 'pairing' || _dmPolicy == 'allowlist') ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dmPolicy == 'pairing'
                        ? 'Approved Devices'
                        : 'Allowed User IDs',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (_dmPolicy == 'allowlist')
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add device',
                    onPressed: _addDevice,
                  ),
              ],
            ),
            const SizedBox(height: 8),

            if (_approvedDevices.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        _dmPolicy == 'pairing'
                            ? Icons.link_off
                            : Icons.info_outline,
                        size: 40,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'No approved devices yet'
                            : 'No allowed users configured',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'Devices will appear here after you approve their pairing requests'
                            : 'Add user IDs to allow them to use the bot',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              ..._approvedDevices.entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(Icons.person, color: colors.primary),
                    ),
                    title: Text(
                      entry.value.isNotEmpty ? entry.value : entry.key,
                    ),
                    subtitle: Text(
                      entry.value.isNotEmpty
                          ? 'ID: ${entry.key}'
                          : (_dmPolicy == 'pairing'
                                ? 'Approved device'
                                : 'Allowed user'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Remove',
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Remove device?'),
                            content: Text(
                              'Remove access for ${entry.value.isNotEmpty ? entry.value : entry.key}?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          await _removeDevice(entry.key);
                        }
                      },
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),
          ],

          // Save Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(_isLoading ? 'Saving...' : 'Save & Connect'),
            ),
          ),

          const SizedBox(height: 16),

          // Help Card
          Card(
            color: colors.primaryContainer.withValues(alpha: 0.3),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.help_outline, size: 20, color: colors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'How to get your bot token',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. Open Telegram and search for @BotFather\n'
                    '2. Send /newbot and follow the instructions\n'
                    '3. Copy the token and paste it above',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SecurityMethodCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _SecurityMethodCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isSelected
            ? color.withValues(alpha: 0.15)
            : colors.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: color, width: 2) : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withValues(alpha: 0.2)
                        : colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? color : colors.onSurfaceVariant,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? color : null,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle, color: color, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Discord Configuration Screen
// ---------------------------------------------------------------------------

class _DiscordConfigScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_DiscordConfigScreen> createState() =>
      _DiscordConfigScreenState();
}

class _DiscordConfigScreenState extends ConsumerState<_DiscordConfigScreen> {
  late TextEditingController _tokenCtl;
  late String _dmPolicy;

  /// id → display name
  Map<String, String> _approvedDevices = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(configManagerProvider).config.channels.discord;
    _tokenCtl = TextEditingController(text: config.token ?? '');
    _dmPolicy = config.dmPolicy;
    _loadApprovedDevices();
  }

  @override
  void dispose() {
    _tokenCtl.dispose();
    super.dispose();
  }

  Future<void> _loadApprovedDevices() async {
    final pairingService = ref.read(pairingServiceProvider);
    final map = await pairingService.getApproved('discord');
    if (mounted) setState(() => _approvedDevices = map);
  }

  Future<void> _removeDevice(String deviceId) async {
    setState(() => _approvedDevices.remove(deviceId));
    final pairingService = ref.read(pairingServiceProvider);
    pairingService.removeApproved('discord', deviceId);
  }

  Future<void> _addDevice() async {
    final deviceId = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Device'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'User ID',
              hintText: 'Enter Discord user ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text.trim()),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );

    if (deviceId != null &&
        deviceId.isNotEmpty &&
        !_approvedDevices.containsKey(deviceId)) {
      setState(() => _approvedDevices[deviceId] = '');
      final pairingService = ref.read(pairingServiceProvider);
      await pairingService.addApproved('discord', deviceId, '');
    }
  }

  Future<void> _save() async {
    setState(() => _isLoading = true);

    try {
      final configManager = ref.read(configManagerProvider);
      final token = _tokenCtl.text.trim();

      configManager.update(
        configManager.config.copyWith(
          channels: ChannelsConfig(
            telegram: configManager.config.channels.telegram,
            discord: DiscordConfig(
              enabled: token.isNotEmpty,
              token: token.isNotEmpty ? token : null,
              allowFrom: _dmPolicy == 'allowlist'
                  ? _approvedDevices.keys.toList()
                  : [],
              dmPolicy: _dmPolicy,
            ),
          ),
        ),
      );
      await configManager.save();

      if (token.isNotEmpty) {
        final router = ref.read(channelRouterProvider);
        final pairingService = ref.read(pairingServiceProvider);
        final cmdHandler = ref.read(chatCommandHandlerProvider);
        router.unregisterAdapter('discord');

        final adapter = DiscordChannelAdapter(
          token: token,
          allowedUserIds: _dmPolicy == 'allowlist'
              ? _approvedDevices.keys.toList()
              : [],
          dmPolicy: _dmPolicy,
          pairingService: pairingService,
          chatCommandHandler: (sessionKey, command) async {
            final result = await cmdHandler.handle(sessionKey, command);
            return result.handled ? result.response : null;
          },
        );

        router.registerAdapter(adapter);
        final agentLoop = ref.read(agentLoopProvider);

        await adapter.start((msg) async {
          final response = await agentLoop.processMessage(
            msg.sessionKey,
            msg.text,
            channelType: msg.channelType,
            chatId: msg.chatId,
            contentBlocks: msg.contentBlocks,
          );
          await adapter.sendMessage(
            OutgoingMessage(
              channelType: msg.channelType,
              chatId: msg.chatId,
              text: response.content,
            ),
          );
        });
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Discord configuration saved')),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Discord Configuration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bot Token Section
          Text('Bot Token', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _tokenCtl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Bot Token',
              border: const OutlineInputBorder(),
              hintText: 'From Discord Developer Portal',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                icon: const Icon(Icons.paste),
                tooltip: 'Paste',
                onPressed: () async {
                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                  if (data?.text != null) _tokenCtl.text = data!.text!;
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Security Method Section
          Text('Security Method', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),

          _SecurityMethodCard(
            title: 'Pairing (Recommended)',
            description:
                'New users get a pairing code. You approve or reject them.',
            icon: Icons.link,
            isSelected: _dmPolicy == 'pairing',
            onTap: () => setState(() => _dmPolicy = 'pairing'),
            color: Colors.blue,
          ),

          _SecurityMethodCard(
            title: 'Allowlist',
            description: 'Only specific user IDs can access the bot.',
            icon: Icons.list_alt,
            isSelected: _dmPolicy == 'allowlist',
            onTap: () => setState(() => _dmPolicy = 'allowlist'),
            color: Colors.green,
          ),

          _SecurityMethodCard(
            title: 'Open',
            description:
                'Anyone can use the bot immediately (not recommended).',
            icon: Icons.public,
            isSelected: _dmPolicy == 'open',
            onTap: () => setState(() => _dmPolicy = 'open'),
            color: Colors.orange,
          ),

          _SecurityMethodCard(
            title: 'Disabled',
            description:
                'No DMs allowed. Bot will not respond to any messages.',
            icon: Icons.block,
            isSelected: _dmPolicy == 'disabled',
            onTap: () => setState(() => _dmPolicy = 'disabled'),
            color: Colors.red,
          ),

          const SizedBox(height: 24),

          // Devices Section (shown for pairing or allowlist)
          if (_dmPolicy == 'pairing' || _dmPolicy == 'allowlist') ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dmPolicy == 'pairing'
                        ? 'Approved Devices'
                        : 'Allowed User IDs',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (_dmPolicy == 'allowlist')
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add device',
                    onPressed: _addDevice,
                  ),
              ],
            ),
            const SizedBox(height: 8),

            if (_approvedDevices.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        _dmPolicy == 'pairing'
                            ? Icons.link_off
                            : Icons.info_outline,
                        size: 40,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'No approved devices yet'
                            : 'No allowed users configured',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'Devices will appear here after you approve their pairing requests'
                            : 'Add user IDs to allow them to use the bot',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              ..._approvedDevices.entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(Icons.person, color: colors.primary),
                    ),
                    title: Text(
                      entry.value.isNotEmpty ? entry.value : entry.key,
                    ),
                    subtitle: Text(
                      entry.value.isNotEmpty
                          ? 'ID: ${entry.key}'
                          : (_dmPolicy == 'pairing'
                                ? 'Approved device'
                                : 'Allowed user'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Remove',
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Remove device?'),
                            content: Text(
                              'Remove access for ${entry.value.isNotEmpty ? entry.value : entry.key}?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          await _removeDevice(entry.key);
                        }
                      },
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),
          ],

          // Save Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(_isLoading ? 'Saving...' : 'Save & Connect'),
            ),
          ),

          const SizedBox(height: 16),

          // Help Card
          Card(
            color: colors.primaryContainer.withValues(alpha: 0.3),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.help_outline, size: 20, color: colors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'How to get your bot token',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. Go to Discord Developer Portal\n'
                    '2. Create a new application and bot\n'
                    '3. Copy the token and paste it above\n'
                    '4. Enable Message Content Intent',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// WhatsApp Configuration Screen
// ---------------------------------------------------------------------------

class _WhatsAppConfigScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_WhatsAppConfigScreen> createState() =>
      _WhatsAppConfigScreenState();
}

class _WhatsAppConfigScreenState extends ConsumerState<_WhatsAppConfigScreen> {
  late String _dmPolicy;
  late bool _selfChatMode;
  Map<String, String> _approvedDevices = {};
  bool _isLoading = false;
  String? _qrCode;
  StreamSubscription<String>? _qrSub;
  StreamSubscription<WAConnectionStatus>? _connSub;
  WAConnectionStatus _connStatus = WAConnectionStatus.disconnected;
  WhatsAppChannelAdapter? _adapter;
  bool _restartPending = false;
  bool _requiresRelink = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(configManagerProvider).config.channels.whatsapp;
    _dmPolicy = config.dmPolicy;
    _selfChatMode = config.selfChatMode ?? true;
    _loadApprovedDevices();
    _attachToAdapter();
  }

  @override
  void dispose() {
    _qrSub?.cancel();
    _connSub?.cancel();
    super.dispose();
  }

  void _attachToAdapter() {
    final router = ref.read(channelRouterProvider);
    final adapter = router.adapters
        .whereType<WhatsAppChannelAdapter>()
        .firstOrNull;
    if (adapter == null) return;
    _adapter = adapter;
    _connStatus = adapter.connectionStatus;
    _restartPending = adapter.isRestartPending;
    _requiresRelink = adapter.requiresRelink;
    // Show the cached QR immediately if it was emitted before this screen opened.
    if (adapter.lastQrCode != null) {
      _qrCode = adapter.lastQrCode;
    }
    _qrSub = adapter.qrStream.listen((qr) {
      if (mounted) setState(() => _qrCode = qr);
    });
    _connSub = adapter.connectionStateStream.listen((s) {
      if (mounted) {
        setState(() {
          _connStatus = s;
          _restartPending = adapter.isRestartPending;
          _requiresRelink = adapter.requiresRelink;
          if (s == WAConnectionStatus.connected) {
            _qrCode = null;
            _requiresRelink = false;
          }
        });
      }
    });
  }

  Future<void> _stopActiveAdapter({bool clearAuth = false}) async {
    final router = ref.read(channelRouterProvider);
    final adapter =
        _adapter ??
        router.adapters.whereType<WhatsAppChannelAdapter>().firstOrNull;

    router.unregisterAdapter('whatsapp');
    await _qrSub?.cancel();
    await _connSub?.cancel();
    _qrSub = null;
    _connSub = null;

    if (adapter != null) {
      await adapter.stop();
      adapter.dispose();
    }

    if (clearAuth) {
      final authDir = ref
          .read(configManagerProvider)
          .config
          .channels
          .whatsapp
          .authDir;
      await WhatsAppChannelAdapter.clearAuth(authDir);
    }

    _adapter = null;
  }

  Future<void> _loadApprovedDevices() async {
    final map = await ref.read(pairingServiceProvider).getApproved('whatsapp');
    if (mounted) setState(() => _approvedDevices = map);
  }

  Future<void> _removeDevice(String id) async {
    setState(() => _approvedDevices.remove(id));
    ref.read(pairingServiceProvider).removeApproved('whatsapp', id);
  }

  Future<void> _addDevice() async {
    final id = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final ctl = TextEditingController();
        return AlertDialog(
          title: const Text('Add Number'),
          content: TextField(
            controller: ctl,
            decoration: const InputDecoration(
              labelText: 'Phone number / JID',
              hintText: 'e.g. 5511999123456',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, ctl.text.trim()),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    if (id != null && id.isNotEmpty && !_approvedDevices.containsKey(id)) {
      setState(() => _approvedDevices[id] = '');
      await ref.read(pairingServiceProvider).addApproved('whatsapp', id, '');
    }
  }

  Future<void> _save() async {
    setState(() => _isLoading = true);
    try {
      final configManager = ref.read(configManagerProvider);
      final currentConfig = configManager.config.channels.whatsapp;
      configManager.update(
        configManager.config.copyWith(
          channels: ChannelsConfig(
            telegram: configManager.config.channels.telegram,
            discord: configManager.config.channels.discord,
            whatsapp: WhatsAppConfig(
              enabled: true,
              authDir: currentConfig.authDir,
              dmPolicy: _dmPolicy,
              allowFrom: _dmPolicy == 'allowlist'
                  ? _approvedDevices.keys.toList()
                  : [],
              selfChatMode: _selfChatMode,
            ),
          ),
        ),
      );
      await configManager.save();

      final router = ref.read(channelRouterProvider);
      final forceRelink = _requiresRelink;
      await _stopActiveAdapter(clearAuth: forceRelink);

      final pairingService = ref.read(pairingServiceProvider);
      final cmdHandler = ref.read(chatCommandHandlerProvider);
      final agentLoop = ref.read(agentLoopProvider);

      final adapter = WhatsAppChannelAdapter(
        authDir: currentConfig.authDir,
        allowedUserIds: _dmPolicy == 'allowlist'
            ? _approvedDevices.keys.toList()
            : [],
        dmPolicy: _dmPolicy,
        selfChatMode: _selfChatMode,
        pairingService: pairingService,
        chatCommandHandler: (sessionKey, command) async {
          final result = await cmdHandler.handle(sessionKey, command);
          return result.handled ? result.response : null;
        },
      );

      router.registerAdapter(adapter);
      _adapter = adapter;
      _qrSub?.cancel();
      _connSub?.cancel();
      _qrSub = adapter.qrStream.listen((qr) {
        if (mounted) setState(() => _qrCode = qr);
      });
      _connSub = adapter.connectionStateStream.listen((s) {
        if (mounted) {
          setState(() {
            _connStatus = s;
            _restartPending = adapter.isRestartPending;
            _requiresRelink = adapter.requiresRelink;
            if (s == WAConnectionStatus.connected) {
              _qrCode = null;
              _requiresRelink = false;
            }
          });
        }
      });

      await adapter.start((msg) async {
        final response = await agentLoop.processMessage(
          msg.sessionKey,
          msg.text,
          channelType: msg.channelType,
          chatId: msg.chatId,
          contentBlocks: msg.contentBlocks,
          channelContext: msg.channelContext,
        );
        await adapter.sendMessage(
          OutgoingMessage(
            channelType: msg.channelType,
            chatId: msg.chatId,
            text: response.content,
          ),
        );
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('WhatsApp configuration saved')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _disconnect() async {
    await _stopActiveAdapter(clearAuth: true);
    final configManager = ref.read(configManagerProvider);
    final currentConfig = configManager.config.channels.whatsapp;
    configManager.update(
      configManager.config.copyWith(
        channels: ChannelsConfig(
          telegram: configManager.config.channels.telegram,
          discord: configManager.config.channels.discord,
          whatsapp: WhatsAppConfig(
            enabled: false,
            authDir: currentConfig.authDir,
            allowFrom: currentConfig.allowFrom,
            dmPolicy: currentConfig.dmPolicy,
            selfChatMode: _selfChatMode,
          ),
        ),
      ),
    );
    await configManager.save();
    setState(() {
      _qrCode = null;
      _connStatus = WAConnectionStatus.disconnected;
      _adapter = null;
      _restartPending = false;
      _requiresRelink = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('WhatsApp disconnected')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isConnected = _connStatus == WAConnectionStatus.connected;

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          if (_adapter != null)
            TextButton.icon(
              onPressed: _disconnect,
              icon: const Icon(Icons.logout),
              label: const Text('Disconnect'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          WhatsAppPairingStatusCard(
            status: _connStatus,
            qrCode: _qrCode,
            isRestartPending: _restartPending,
            idleDescription: _requiresRelink
                ? 'The previous WhatsApp session is no longer valid. Tap "Reconnect WhatsApp" to generate a fresh QR.'
                : 'Tap "Connect WhatsApp" to link your account.',
            connectingDescription: _restartPending
                ? 'WhatsApp accepted the QR. Finalizing the link...'
                : 'Waiting for WhatsApp to complete the link...',
          ),
          const SizedBox(height: 16),

          Text('WhatsApp Mode', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _SecurityMethodCard(
            title: 'My personal number',
            description:
                'Messages you send to your own WhatsApp chat wake the agent.',
            icon: Icons.person,
            isSelected: _selfChatMode,
            onTap: () => setState(() => _selfChatMode = true),
            color: Colors.teal,
          ),
          _SecurityMethodCard(
            title: 'Dedicated bot account',
            description:
                'Messages sent from the linked account itself are ignored as outbound.',
            icon: Icons.smart_toy,
            isSelected: !_selfChatMode,
            onTap: () => setState(() => _selfChatMode = false),
            color: Colors.indigo,
          ),
          const SizedBox(height: 24),

          Text('Security Method', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _SecurityMethodCard(
            title: 'Pairing (Recommended)',
            description: 'New senders get a pairing code. You approve them.',
            icon: Icons.link,
            isSelected: _dmPolicy == 'pairing',
            onTap: () => setState(() => _dmPolicy = 'pairing'),
            color: Colors.blue,
          ),
          _SecurityMethodCard(
            title: 'Allowlist',
            description: 'Only specific phone numbers can message the bot.',
            icon: Icons.list_alt,
            isSelected: _dmPolicy == 'allowlist',
            onTap: () => setState(() => _dmPolicy = 'allowlist'),
            color: Colors.green,
          ),
          _SecurityMethodCard(
            title: 'Open',
            description: 'Anyone who messages you can use the bot.',
            icon: Icons.public,
            isSelected: _dmPolicy == 'open',
            onTap: () => setState(() => _dmPolicy = 'open'),
            color: Colors.orange,
          ),
          _SecurityMethodCard(
            title: 'Disabled',
            description: 'Bot will not respond to any incoming messages.',
            icon: Icons.block,
            isSelected: _dmPolicy == 'disabled',
            onTap: () => setState(() => _dmPolicy = 'disabled'),
            color: Colors.red,
          ),
          const SizedBox(height: 24),

          if (_dmPolicy == 'pairing' || _dmPolicy == 'allowlist') ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dmPolicy == 'pairing'
                        ? 'Approved Devices'
                        : 'Allowed Numbers',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (_dmPolicy == 'allowlist')
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add number',
                    onPressed: _addDevice,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (_approvedDevices.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        _dmPolicy == 'pairing'
                            ? Icons.link_off
                            : Icons.info_outline,
                        size: 40,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'No approved devices yet'
                            : 'No allowed numbers configured',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dmPolicy == 'pairing'
                            ? 'Devices appear here after you approve pairing requests'
                            : 'Add phone numbers to allow them to use the bot',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              ..._approvedDevices.entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(Icons.person, color: colors.primary),
                    ),
                    title: Text(
                      entry.value.isNotEmpty ? entry.value : entry.key,
                    ),
                    subtitle: Text(
                      entry.value.isNotEmpty
                          ? entry.key
                          : (_dmPolicy == 'pairing'
                                ? 'Approved device'
                                : 'Allowed number'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Remove',
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Remove device?'),
                            content: Text(
                              'Remove access for ${entry.value.isNotEmpty ? entry.value : entry.key}?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                        );
                        if (ok == true) await _removeDevice(entry.key);
                      },
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 24),
          ],

          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chat),
              label: Text(
                _isLoading
                    ? 'Connecting...'
                    : _requiresRelink
                    ? 'Reconnect WhatsApp'
                    : isConnected
                    ? 'Save Settings'
                    : 'Connect WhatsApp',
              ),
            ),
          ),
          const SizedBox(height: 16),

          Card(
            color: colors.primaryContainer.withValues(alpha: 0.3),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.help_outline, size: 20, color: colors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'How to connect',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. Tap "Connect WhatsApp" above\n'
                    '2. A QR code will appear — scan it with WhatsApp\n'
                    '   (Settings → Linked Devices → Link a Device)\n'
                    '3. Once connected, incoming messages are routed\n'
                    '   to your active AI agent automatically',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Slack Configuration Screen
// ---------------------------------------------------------------------------

class _SlackConfigScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_SlackConfigScreen> createState() => _SlackConfigScreenState();
}

class _SlackConfigScreenState extends ConsumerState<_SlackConfigScreen> {
  late TextEditingController _botTokenCtrl;
  late TextEditingController _appTokenCtrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final slack = ref.read(configManagerProvider).config.channels.slack;
    _botTokenCtrl = TextEditingController(text: slack.botToken ?? '');
    _appTokenCtrl = TextEditingController(text: slack.appToken ?? '');
  }

  @override
  void dispose() {
    _botTokenCtrl.dispose();
    _appTokenCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final botToken = _botTokenCtrl.text.trim();
    final appToken = _appTokenCtrl.text.trim();
    if (botToken.isEmpty || appToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Both tokens are required')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final configManager = ref.read(configManagerProvider);
      final config = configManager.config;
      configManager.update(config.copyWith(
        channels: ChannelsConfig(
          telegram: config.channels.telegram,
          discord: config.channels.discord,
          whatsapp: config.channels.whatsapp,
          slack: SlackConfig(
            enabled: true,
            botToken: botToken,
            appToken: appToken,
            allowFrom: config.channels.slack.allowFrom,
          ),
        ),
      ));
      await configManager.save();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slack saved — restart the gateway to connect'),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Slack Configuration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Setup', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    '1. Create a Slack App at api.slack.com/apps\n'
                    '2. Enable Socket Mode → generate App-Level Token (xapp-…)\n'
                    '   with scope: connections:write\n'
                    '3. Add Bot Token Scopes: chat:write, channels:history,\n'
                    '   groups:history, im:history, mpim:history\n'
                    '4. Install app to workspace → copy Bot Token (xoxb-…)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _botTokenCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Bot Token (xoxb-…)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.key),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _appTokenCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'App-Level Token (xapp-…)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.vpn_key_outlined),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.check),
            label: const Text('Save & Connect'),
          ),
        ],
      ),
    );
  }
}
