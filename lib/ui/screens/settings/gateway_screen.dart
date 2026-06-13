import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';

/// Gateway & Heartbeat settings sub-screen.
class GatewayScreen extends ConsumerStatefulWidget {
  const GatewayScreen({super.key});

  @override
  ConsumerState<GatewayScreen> createState() => _GatewayScreenState();
}

class _GatewayScreenState extends ConsumerState<GatewayScreen> {
  bool _loading = false;

  String _statusText(GatewayState state) {
    final l10n = context.l10n;
    switch (state.state) {
      case 'starting':
        return l10n.gatewayStartingStatus;
      case 'retrying':
        return l10n.gatewayRetryingStatus;
      case 'error':
        return state.lastError ?? l10n.errorStartingGateway;
      case 'running':
        return l10n.runningStatus;
      default:
        return l10n.stoppedStatus;
    }
  }

  Future<void> _toggleGateway(bool running) async {
    setState(() => _loading = true);
    try {
      if (running) {
        if (Platform.isIOS) {
          await IosGatewayService.stop();
        } else {
          await BackgroundService.stopService();
        }
        ref.read(gatewayStateProvider.notifier).setRunning(false);
      } else {
        if (Platform.isIOS) {
          final success = await IosGatewayService.start(
            configManager: ref.read(configManagerProvider),
            providerRouter: ref.read(providerRouterProvider),
            sessionManager: ref.read(sessionManagerProvider),
            toolRegistry: ref.read(toolRegistryProvider),
            skillsService: ref.read(skillsServiceProvider),
          );
          ref.read(gatewayStateProvider.notifier).setRunning(success);
        } else {
          await BackgroundService.startService();
          ref.read(gatewayStateProvider.notifier).setRunning(true);
        }
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final configManager = ref.watch(configManagerProvider);
    final config = configManager.config;
    final gatewayState = ref.watch(gatewayStateProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final statusColor = gatewayState.state == 'error'
        ? colors.error
        : gatewayState.isRunning
            ? Colors.green
            : colors.onSurfaceVariant;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.gateway)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: gatewayState.state == 'error'
                ? colors.errorContainer.withValues(alpha: 0.3)
                : null,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        gatewayState.isRunning
                            ? Icons.cloud_done
                            : Icons.cloud_off,
                        color: statusColor,
                        size: 28,
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
                              _statusText(gatewayState),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FilledButton.tonal(
                        onPressed: _loading
                            ? null
                            : () => _toggleGateway(gatewayState.isRunning),
                        child: _loading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(
                                gatewayState.isRunning
                                    ? context.l10n.stop
                                    : context.l10n.start,
                              ),
                      ),
                    ],
                  ),
                  if (gatewayState.isRunning) ...[
                    const SizedBox(height: 12),
                    Text(
                      context.l10n.gatewayRunsLocally,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    if (gatewayState.uptimeSeconds > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          context.l10n.uptimeLabel(_formatUptime(gatewayState.uptimeSeconds)),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dns),
                  title: Text(context.l10n.host),
                  trailing: Text(
                    config.gateway.host,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Text(context.l10n.port),
                  trailing: Text(
                    '${config.gateway.port}',
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
                SwitchListTile(
                  secondary: const Icon(Icons.play_circle_outline),
                  title: Text(context.l10n.autoStart),
                  subtitle: Text(context.l10n.startGatewayWhenLaunches),
                  value: config.gateway.autoStart,
                  onChanged: (val) async {
                    configManager.update(config.copyWith(
                      gateway: GatewayConfig(
                        host: config.gateway.host,
                        port: config.gateway.port,
                        autoStart: val,
                        token: config.gateway.token,
                        webhookEnabled: config.gateway.webhookEnabled,
                        webhookDefaultSessionKey:
                            config.gateway.webhookDefaultSessionKey,
                      ),
                    ));
                    await configManager.save();
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: Text(context.l10n.accessTokenLabel),
                  subtitle: Text(
                    config.gateway.token.isEmpty
                        ? context.l10n.notSetOpenAccess
                        : '••••••••',
                    style: TextStyle(
                      color: config.gateway.token.isEmpty
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : null,
                    ),
                  ),
                  trailing: const Icon(Icons.edit_outlined),
                  onTap: () => _editToken(context, config, configManager),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Text(
            context.l10n.heartbeat,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.favorite_outline),
                  title: Text(context.l10n.enabled),
                  subtitle: Text(context.l10n.periodicAgentTasks),
                  value: config.heartbeat.enabled,
                  onChanged: (val) async {
                    configManager.update(config.copyWith(
                      heartbeat: HeartbeatConfig(
                        enabled: val,
                        interval: config.heartbeat.interval,
                      ),
                    ));
                    await configManager.save();
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.timer),
                  title: Text(context.l10n.interval),
                  trailing:
                      Text(context.l10n.intervalMinutes(config.heartbeat.interval)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatUptime(int seconds) {
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) return '${seconds ~/ 60}m ${seconds % 60}s';
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
  }

  Future<void> _editToken(
    BuildContext context,
    FlutterClawConfig config,
    dynamic configManager,
  ) async {
    final controller = TextEditingController(text: config.gateway.token);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.gatewayAccessToken),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: context.l10n.tokenFieldLabel,
            hintText: context.l10n.leaveEmptyDisableAuth,
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(context.l10n.save),
          ),
        ],
      ),
    );
    if (result == null || !mounted) return;
    configManager.update(config.copyWith(
      gateway: GatewayConfig(
        host: config.gateway.host,
        port: config.gateway.port,
        autoStart: config.gateway.autoStart,
        token: result,
        webhookEnabled: config.gateway.webhookEnabled,
        webhookDefaultSessionKey: config.gateway.webhookDefaultSessionKey,
      ),
    ));
    await configManager.save();
    if (mounted) setState(() {});
  }
}
