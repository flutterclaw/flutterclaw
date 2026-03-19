import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutterclaw/services/analytics_service.dart';

/// Tools exposed as user-togglable switches in the Tool policies section.
/// Ordered from most to least sensitive.
const _kToggleableTools = [
  'sandbox_exec',
  'camera_take_photo',
  'camera_record_video',
  'get_location',
  'get_health_data',
  'contacts_search',
  'ui_screenshot',
  'web_fetch',
  'web_search',
  'http_request',
  'image_generate',
];

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final configManager = ref.watch(configManagerProvider);
    final config = configManager.config;
    final analytics = ref.read(analyticsServiceProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -- Providers section --
          _SectionHeader(title: 'Providers'),
          if (config.providerCredentials.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'No providers configured.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
            )
          else
            ...config.providerCredentials.entries.map((entry) {
              final provId = entry.key;
              final cred = entry.value;
              final catalogProv = ModelCatalog.getProvider(provId);
              return Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      catalogProv?.icon ?? Icons.key,
                      color: colors.primary,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    catalogProv?.displayName ?? provId,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    cred.apiBase ?? catalogProv?.apiBase ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 18),
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, size: 20),
                        tooltip: 'Edit credentials',
                        onPressed: () => _showEditProviderCredential(context, provId, cred),
                      ),
                    ],
                  ),
                ),
              );
            }),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: OutlinedButton.icon(
              onPressed: () => _showAddProviderFlow(context),
              icon: const Icon(Icons.add),
              label: const Text('Add provider'),
            ),
          ),

          const SizedBox(height: 24),

          // -- Models section --
          _SectionHeader(title: context.l10n.models),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'The default model is used by agents that don\'t specify their own.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
          if (config.modelList.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 40, color: Colors.orange.shade700),
                    const SizedBox(height: 12),
                    Text(context.l10n.noModelsConfigured),
                    const SizedBox(height: 4),
                    Text(
                      context.l10n.addModelToStartChatting,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: () => _showAddModelFlow(context),
                      icon: const Icon(Icons.add),
                      label: Text(context.l10n.addModel),
                    ),
                  ],
                ),
              ),
            )
          else
            ...config.modelList.asMap().entries.map((entry) {
              final index = entry.key;
              final m = entry.value;
              final isDefault =
                  m.modelName == config.agents.defaults.modelName;
              final provider = ModelCatalog.getProvider(m.provider);

              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => _showEditModel(context, index, m),
                  onLongPress: isDefault
                      ? null
                      : () => _setDefaultModel(context, m.modelName),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isDefault
                                ? colors.primaryContainer
                                : colors.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            provider?.icon ?? Icons.smart_toy,
                            color: isDefault
                                ? colors.primary
                                : colors.onSurfaceVariant,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      m.modelName,
                                      style:
                                          theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (m.isFree) ...[
                                    const SizedBox(width: 8),
                                    _FreeBadge(),
                                  ],
                                  if (isDefault) ...[
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: colors.primaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        context.l10n.default_,
                                        style: TextStyle(
                                          color: colors.primary,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${provider?.displayName ?? m.provider} / ${m.model}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        if (!isDefault)
                          Tooltip(
                            message: 'Hold to set as default',
                            child: Icon(
                              Icons.star_outline,
                              color: colors.onSurfaceVariant.withValues(alpha: 0.5),
                              size: 18,
                            ),
                          ),
                        const SizedBox(width: 4),
                        Icon(
                          config.isProviderAuthenticated(m.provider) ||
                                  (m.apiKey != null && m.apiKey!.isNotEmpty)
                              ? Icons.check_circle
                              : Icons.error_outline,
                          color: config.isProviderAuthenticated(m.provider) ||
                                  (m.apiKey != null && m.apiKey!.isNotEmpty)
                              ? Colors.green
                              : Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.chevron_right, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            }),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: OutlinedButton.icon(
              onPressed: () {
                analytics.logTap(name: 'settings_add_model');
                _showAddModelFlow(context);
              },
              icon: const Icon(Icons.add),
              label: Text(context.l10n.addModel),
            ),
          ),

          const SizedBox(height: 24),

          // -- Gateway section --
          _SectionHeader(title: context.l10n.gateway),
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
                  subtitle:
                      Text(context.l10n.startGatewayWhenLaunches),
                  value: config.gateway.autoStart,
                  onChanged: (val) async {
                    configManager.update(config.copyWith(
                      gateway: GatewayConfig(
                        host: config.gateway.host,
                        port: config.gateway.port,
                        autoStart: val,
                        token: config.gateway.token,
                      ),
                    ));
                    await configManager.save();
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text('Access token'),
                  subtitle: Text(
                    config.gateway.token.isEmpty
                        ? 'Not set — open access (loopback only)'
                        : '••••••••',
                    style: TextStyle(
                      color: config.gateway.token.isEmpty
                          ? Theme.of(context).colorScheme.error
                          : null,
                    ),
                  ),
                  trailing: const Icon(Icons.edit_outlined),
                  onTap: () async {
                    final current = config.gateway.token;
                    final controller = TextEditingController(text: current);
                    final result = await showDialog<String>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Gateway access token'),
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: 'Token',
                            hintText: 'Leave empty to disable auth',
                          ),
                          obscureText: false,
                          autofocus: true,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () =>
                                Navigator.pop(ctx, controller.text.trim()),
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                    if (result == null) return;
                    configManager.update(config.copyWith(
                      gateway: GatewayConfig(
                        host: config.gateway.host,
                        port: config.gateway.port,
                        autoStart: config.gateway.autoStart,
                        token: result,
                      ),
                    ));
                    await configManager.save();
                    if (mounted) setState(() {});
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // -- Heartbeat section --
          _SectionHeader(title: context.l10n.heartbeat),
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
                  trailing: Text(context.l10n.intervalMinutes(config.heartbeat.interval)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // -- Tool policies section --
          _SectionHeader(title: 'Tool policies'),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Text(
                    'Disable tools to restrict what the agent can access. '
                    'Disabled tools are hidden from the LLM and blocked at runtime.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
                ..._kToggleableTools.map((toolName) {
                  final disabled = config.tools.disabled.contains(toolName);
                  return SwitchListTile(
                    secondary: const Icon(Icons.build_outlined),
                    title: Text(toolName),
                    value: !disabled,
                    onChanged: (enabled) async {
                      final updated = List<String>.from(config.tools.disabled);
                      if (enabled) {
                        updated.remove(toolName);
                      } else {
                        if (!updated.contains(toolName)) updated.add(toolName);
                      }
                      configManager.update(config.copyWith(
                        tools: ToolsConfig(
                          web: config.tools.web,
                          disabled: updated,
                        ),
                      ));
                      await configManager.save();
                      ref.invalidate(toolRegistryProvider);
                      if (mounted) setState(() {});
                    },
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // -- About section --
          _SectionHeader(title: context.l10n.about),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.auto_awesome),
                  title: Text(context.l10n.appTitle),
                  subtitle: Text(context.l10n.personalAIAssistantForIOS),
                ),
                ListTile(
                  leading: const Icon(Icons.tag),
                  title: Text(context.l10n.version),
                  trailing: const Text('0.1.0'),
                ),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(context.l10n.basedOnOpenClaw),
                  subtitle: const Text('openclaw.ai'),
                  onTap: () => launchUrl(
                    Uri.parse('https://openclaw.ai'),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // -- Danger zone --
          _SectionHeader(title: 'Danger zone'),
          Card(
            color: colors.error,
            child: ListTile(
              leading: Icon(Icons.restart_alt, color: colors.onError),
              title: Text(
                context.l10n.resetOnboarding,
                style: TextStyle(
                  color: colors.onError,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                context.l10n.resetOnboardingDesc,
                style: TextStyle(color: colors.onError.withValues(alpha: 0.9)),
              ),
              onTap: () => _confirmReset(context),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _confirmReset(BuildContext context) async {
    final cancelLabel = context.l10n.cancel;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: const Text('Reset all configuration?'),
        content: const Text(
          'This will delete your API keys, models, and all settings. '
          'The app will return to the setup wizard.\n\n'
          'Your conversation history is not deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(d, false),
            child: Text(cancelLabel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(d).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(d, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final configManager = ref.read(configManagerProvider);

    // Delete config file from disk
    final configPath = await configManager.configPath;
    final configFile = File(configPath);
    if (await configFile.exists()) {
      await configFile.delete();
    }

    // Reset in-memory config to defaults
    configManager.update(const FlutterClawConfig());

    // Invalidate all providers that depend on the config
    ref.invalidate(providerRouterProvider);
    ref.invalidate(agentLoopProvider);
    ref.invalidate(toolRegistryProvider);
    ref.invalidate(agentProfilesProvider);
    ref.invalidate(activeAgentProvider);
    ref.invalidate(activeWorkspacePathProvider);
    ref.invalidate(sessionManagerProvider);
    ref.invalidate(chatProvider);

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      (route) => false,
    );
  }

  // -- Set default model with optional agent update --

  Future<void> _setDefaultModel(BuildContext context, String modelName) async {
    final configManager = ref.read(configManagerProvider);
    final config = configManager.config;
    final agents = config.agentProfiles;

    // Agents that use a different model than the new default.
    final agentsToUpdate = agents.where((a) => a.modelName != modelName).toList();

    bool updateAgents = false;
    bool startNewSessions = false;

    if (agentsToUpdate.isNotEmpty) {
      final result = await showDialog<_DefaultModelAction>(
        context: context,
        builder: (ctx) {
          bool agents = true;
          bool sessions = true;
          return StatefulBuilder(
            builder: (ctx, setDialogState) => AlertDialog(
              title: const Text('Change default model'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Set $modelName as the default model.'),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Also update ${agentsToUpdate.length} agent${agentsToUpdate.length > 1 ? 's' : ''}',
                    ),
                    subtitle: Text(
                      agentsToUpdate.map((a) => '${a.emoji} ${a.name}').join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: agents,
                    onChanged: (v) => setDialogState(() => agents = v ?? false),
                  ),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Start new sessions'),
                    subtitle: const Text('Current conversations will be archived'),
                    value: sessions,
                    onChanged: (v) => setDialogState(() => sessions = v ?? false),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(
                    ctx,
                    _DefaultModelAction(updateAgents: agents, startNewSessions: sessions),
                  ),
                  child: const Text('Apply'),
                ),
              ],
            ),
          );
        },
      );

      if (result == null) return; // cancelled
      updateAgents = result.updateAgents;
      startNewSessions = result.startNewSessions;
    }

    // 1. Update default model
    configManager.update(config.copyWith(
      agents: AgentsConfig(
        defaults: AgentsDefaults(modelName: modelName),
      ),
    ));

    // 2. Update agent profiles if requested
    if (updateAgents && agentsToUpdate.isNotEmpty) {
      final updatedProfiles = config.agentProfiles.map((a) {
        return a.copyWith(modelName: modelName);
      }).toList();
      configManager.update(configManager.config.copyWith(
        agentProfiles: updatedProfiles,
      ));
    }

    await configManager.save();

    // 3. Start new sessions if requested
    if (startNewSessions) {
      ref.read(chatProvider.notifier).clear();
    }

    setState(() {});
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$modelName set as default model'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // -- Add provider credential flow --

  void _showAddProviderFlow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _AddProviderScreen(onSaved: () => setState(() {})),
      ),
    );
  }

  // -- Edit existing provider credential --

  void _showEditProviderCredential(
      BuildContext context, String providerId, ProviderCredential cred) {
    final configManager = ref.read(configManagerProvider);
    final catalogProv = ModelCatalog.getProvider(providerId);
    final keyCtl = TextEditingController(text: cred.apiKey);
    final baseCtl = TextEditingController(text: cred.apiBase ?? catalogProv?.apiBase ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(catalogProv?.icon ?? Icons.key,
                    color: Theme.of(ctx).colorScheme.primary),
                const SizedBox(width: 10),
                Text(catalogProv?.displayName ?? providerId,
                    style: Theme.of(ctx).textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: keyCtl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'API Key',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  onPressed: () async {
                    final data = await Clipboard.getData(Clipboard.kTextPlain);
                    if (data?.text != null) keyCtl.text = data!.text!;
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: baseCtl,
              decoration: const InputDecoration(
                labelText: 'API Base URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: ctx,
                      builder: (d) => AlertDialog(
                        title: const Text('Remove provider'),
                        content: Text(
                            'Remove credentials for ${catalogProv?.displayName ?? providerId}?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(d, false),
                              child: Text(context.l10n.cancel)),
                          FilledButton(
                              onPressed: () => Navigator.pop(d, true),
                              child: Text(context.l10n.remove)),
                        ],
                      ),
                    );
                    if (confirmed != true || !ctx.mounted) return;
                    final updated = Map<String, ProviderCredential>.from(
                        configManager.config.providerCredentials)
                      ..remove(providerId);
                    configManager.update(
                        configManager.config.copyWith(providerCredentials: updated));
                    await configManager.save();
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  label: Text(context.l10n.remove,
                      style: const TextStyle(color: Colors.red)),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(context.l10n.cancel)),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () async {
                    final newCred = ProviderCredential(
                      apiKey: keyCtl.text.trim(),
                      apiBase: baseCtl.text.trim().isNotEmpty
                          ? baseCtl.text.trim()
                          : null,
                    );
                    configManager.update(configManager.config
                        .withProviderCredential(providerId, newCred));
                    await configManager.save();
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  child: Text(context.l10n.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -- Add model flow (provider -> model -> key) --

  void _showAddModelFlow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => _AddModelScreen(
        onModelAdded: () => setState(() {}),
      )),
    );
  }

  // -- Edit existing model --

  void _showEditModel(BuildContext context, int index, ModelEntry model) {
    final configManager = ref.read(configManagerProvider);
    final provider = ModelCatalog.getProvider(model.provider);
    final keyCtl = TextEditingController(text: model.apiKey ?? '');
    final isDefault =
        model.modelName == configManager.config.agents.defaults.modelName;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(provider?.icon ?? Icons.smart_toy,
                    color: Theme.of(ctx).colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(model.modelName,
                      style: Theme.of(ctx).textTheme.titleLarge),
                ),
                if (model.isFree) _FreeBadge(),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${provider?.displayName ?? model.provider} / ${model.model}',
              style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                    color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: keyCtl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.l10n.apiKey,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  tooltip: context.l10n.paste,
                  onPressed: () async {
                    final data =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    if (data?.text != null) keyCtl.text = data!.text!;
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            if (!isDefault)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    configManager.update(configManager.config.copyWith(
                      agents: AgentsConfig(
                        defaults: AgentsDefaults(
                            modelName: model.modelName),
                      ),
                    ));
                    await configManager.save();
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  icon: const Icon(Icons.star_outline),
                  label: Text(context.l10n.setAsDefault),
                ),
              ),

            const SizedBox(height: 12),

            Row(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: ctx,
                      builder: (d) => AlertDialog(
                        title: Text(context.l10n.removeModel),
                        content: Text(
                            context.l10n.removeModelConfirm(model.modelName)),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(d, false),
                            child: Text(context.l10n.cancel),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.pop(d, true),
                            child: Text(context.l10n.remove),
                          ),
                        ],
                      ),
                    );
                    if (confirmed != true || !ctx.mounted) return;

                    final updated =
                        List<ModelEntry>.from(configManager.config.modelList);
                    updated.removeAt(index);
                    configManager.update(
                        configManager.config.copyWith(modelList: updated));
                    await configManager.save();
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  icon:
                      const Icon(Icons.delete_outline, color: Colors.red),
                  label: Text(context.l10n.remove,
                      style: const TextStyle(color: Colors.red)),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(context.l10n.cancel),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () async {
                    final updated =
                        List<ModelEntry>.from(configManager.config.modelList);
                    updated[index] = ModelEntry(
                      modelName: model.modelName,
                      model: model.model,
                      apiKey: keyCtl.text.trim().isNotEmpty
                          ? keyCtl.text.trim()
                          : null,
                      apiBase: model.apiBase,
                      provider: model.provider,
                      isFree: model.isFree,
                      requestTimeout: model.requestTimeout,
                    );
                    configManager.update(
                        configManager.config.copyWith(modelList: updated));
                    await configManager.save();
                    if (ctx.mounted) Navigator.pop(ctx);
                    setState(() {});
                  },
                  child: Text(context.l10n.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _DefaultModelAction {
  final bool updateAgents;
  final bool startNewSessions;
  const _DefaultModelAction({required this.updateAgents, required this.startNewSessions});
}

// Full-screen Add Provider flow
// ---------------------------------------------------------------------------

class _AddProviderScreen extends StatefulWidget {
  final VoidCallback onSaved;

  const _AddProviderScreen({required this.onSaved});

  @override
  State<_AddProviderScreen> createState() => _AddProviderScreenState();
}

class _AddProviderScreenState extends State<_AddProviderScreen> {
  String? _selectedProviderId;
  final _apiKeyCtl = TextEditingController();
  final _apiBaseCtl = TextEditingController();

  @override
  void dispose() {
    _apiKeyCtl.dispose();
    _apiBaseCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final showBaseUrl = _selectedProviderId == 'ollama' ||
        _selectedProviderId == 'custom';

    return Scaffold(
      appBar: AppBar(title: const Text('Add provider')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Choose provider',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ModelCatalog.providers.map((p) => _ProviderChip(
                provider: p,
                isSelected: _selectedProviderId == p.id,
                onTap: () => setState(() {
                  _selectedProviderId = p.id;
                  _apiBaseCtl.text = p.apiBase ?? '';
                }),
              )),

          if (_selectedProviderId != null) ...[
            const SizedBox(height: 24),
            Text('API Key',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Builder(builder: (ctx) {
              final p = ModelCatalog.getProvider(_selectedProviderId!);
              if (p == null || p.signupUrl.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => launchUrl(Uri.parse(p.signupUrl),
                      mode: LaunchMode.externalApplication),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.open_in_new, size: 18, color: colors.primary),
                        const SizedBox(width: 10),
                        Text(
                          context.l10n.getApiKeyAt(p.displayName),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            TextField(
              controller: _apiKeyCtl,
              obscureText: true,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: context.l10n.apiKey,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  tooltip: context.l10n.paste,
                  onPressed: () async {
                    final data = await Clipboard.getData(Clipboard.kTextPlain);
                    if (data?.text != null) {
                      _apiKeyCtl.text = data!.text!;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),

            if (showBaseUrl) ...[
              const SizedBox(height: 12),
              TextField(
                controller: _apiBaseCtl,
                decoration: InputDecoration(
                  labelText: context.l10n.apiBaseUrl,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.link),
                ),
              ),
            ],

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: Consumer(builder: (ctx, ref, _) {
                return FilledButton.icon(
                  onPressed: _apiKeyCtl.text.trim().isEmpty
                      ? null
                      : () => _save(ref),
                  icon: const Icon(Icons.check),
                  label: const Text('Save'),
                );
              }),
            ),
          ],
        ],
      ),
    );
  }

  void _save(WidgetRef ref) async {
    final configManager = ref.read(configManagerProvider);
    final catalogProv = ModelCatalog.getProvider(_selectedProviderId!);
    final credential = ProviderCredential(
      apiKey: _apiKeyCtl.text.trim(),
      apiBase: _apiBaseCtl.text.trim().isNotEmpty
          ? _apiBaseCtl.text.trim()
          : catalogProv?.apiBase,
    );
    configManager.update(
        configManager.config.withProviderCredential(_selectedProviderId!, credential));
    await configManager.save();
    widget.onSaved();
    if (mounted) Navigator.pop(context);
  }
}

// ---------------------------------------------------------------------------
// Full-screen Add Model flow (reuses catalog like onboarding)
// ---------------------------------------------------------------------------

class _AddModelScreen extends ConsumerStatefulWidget {
  final VoidCallback onModelAdded;

  const _AddModelScreen({required this.onModelAdded});

  @override
  ConsumerState<_AddModelScreen> createState() => _AddModelScreenState();
}

class _AddModelScreenState extends ConsumerState<_AddModelScreen> {
  String? _selectedProviderId;
  String? _selectedModelId;
  bool _useCustomModel = false;
  final _apiKeyCtl = TextEditingController();
  final _apiBaseCtl = TextEditingController();
  final _customModelCtl = TextEditingController();

  @override
  void dispose() {
    _apiKeyCtl.dispose();
    _apiBaseCtl.dispose();
    _customModelCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final config = ref.watch(configManagerProvider).config;
    final alreadyAuthenticated = _selectedProviderId != null &&
        config.isProviderAuthenticated(_selectedProviderId!);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.addModel)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Step 1: Provider
          Text(context.l10n.chooseProviderStep,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ModelCatalog.providers.map((p) => _ProviderChip(
                provider: p,
                isSelected: _selectedProviderId == p.id,
                isAuthenticated: config.isProviderAuthenticated(p.id),
                onTap: () => setState(() {
                  _selectedProviderId = p.id;
                  _selectedModelId = null;
                  _useCustomModel = false;
                  _customModelCtl.clear();
                  _apiBaseCtl.text = p.apiBase ?? '';
                }),
              )),

          if (_selectedProviderId != null) ...[
            const SizedBox(height: 24),

            // Step 2: Model
            Text(context.l10n.selectModelStep,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...ModelCatalog.modelsForProvider(_selectedProviderId!)
                .map((m) => _ModelChip(
                      model: m,
                      isSelected: !_useCustomModel && _selectedModelId == m.id,
                      onTap: () => setState(() {
                        _selectedModelId = m.id;
                        _useCustomModel = false;
                        _customModelCtl.clear();
                      }),
                    )),
            const SizedBox(height: 8),
            TextButton.icon(
              icon: Icon(
                _useCustomModel ? Icons.close : Icons.edit_outlined,
                size: 16,
              ),
              label: Text(
                _useCustomModel ? 'Select from list' : 'Enter a custom model ID',
              ),
              onPressed: () => setState(() {
                _useCustomModel = !_useCustomModel;
                if (!_useCustomModel) _customModelCtl.clear();
              }),
            ),
            if (_useCustomModel) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _customModelCtl,
                decoration: const InputDecoration(
                  labelText: 'Model ID',
                  border: OutlineInputBorder(),
                  hintText: 'e.g. openrouter/google/gemini-2.5-flash',
                ),
                onChanged: (val) => setState(() => _selectedModelId = val.trim().isNotEmpty ? val.trim() : null),
              ),
            ],

            const SizedBox(height: 24),

            // Step 3: API Key (skipped if provider is already authenticated)
            if (alreadyAuthenticated)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: Colors.green.shade700, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Provider already authenticated — no API key needed.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.green.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              Text(context.l10n.apiKeyStep,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              Builder(builder: (ctx) {
                final provider =
                    ModelCatalog.getProvider(_selectedProviderId!);
                if (provider == null || provider.signupUrl.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => launchUrl(
                      Uri.parse(provider.signupUrl),
                      mode: LaunchMode.externalApplication,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.open_in_new,
                              size: 18, color: colors.primary),
                          const SizedBox(width: 10),
                          Text(
                            context.l10n.getApiKeyAt(provider.displayName),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              TextField(
                controller: _apiKeyCtl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.l10n.apiKey,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.paste),
                    tooltip: context.l10n.paste,
                    onPressed: () async {
                      final data =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      if (data?.text != null) _apiKeyCtl.text = data!.text!;
                    },
                  ),
                ),
              ),

              if (_selectedProviderId == 'ollama' ||
                  _selectedProviderId == 'custom') ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _apiBaseCtl,
                  decoration: InputDecoration(
                    labelText: context.l10n.apiBaseUrl,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.link),
                  ),
                ),
              ],
            ],

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                onPressed: _selectedModelId == null ||
                        (!alreadyAuthenticated &&
                            _apiKeyCtl.text.trim().isEmpty)
                    ? null
                    : _addModel,
                icon: const Icon(Icons.add),
                label: Text(context.l10n.addModel),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _addModel() async {
    final configManager = ref.read(configManagerProvider);
    final provider = ModelCatalog.getProvider(_selectedProviderId!);
    final catalogModel =
        ModelCatalog.models.where((m) => m.id == _selectedModelId).firstOrNull;
    final config = configManager.config;
    final alreadyAuthenticated = config.isProviderAuthenticated(_selectedProviderId!);

    // Save new provider credential if entering a key for a new provider
    var updatedConfig = config;
    if (!alreadyAuthenticated && _apiKeyCtl.text.trim().isNotEmpty) {
      final credential = ProviderCredential(
        apiKey: _apiKeyCtl.text.trim(),
        apiBase: _apiBaseCtl.text.trim().isNotEmpty
            ? _apiBaseCtl.text.trim()
            : provider?.apiBase,
      );
      updatedConfig = updatedConfig.withProviderCredential(_selectedProviderId!, credential);
    }

    // Model entry does not store apiKey — it's resolved from providerCredentials
    final modelEntry = ModelEntry(
      modelName: catalogModel?.displayName ?? _selectedModelId!,
      model: _selectedModelId!,
      apiBase: _apiBaseCtl.text.trim().isNotEmpty
          ? _apiBaseCtl.text.trim()
          : provider?.apiBase,
      provider: _selectedProviderId!,
      isFree: catalogModel?.isFree ?? false,
      input: catalogModel?.input,
    );

    updatedConfig = updatedConfig.copyWith(
      modelList: [...updatedConfig.modelList, modelEntry],
    );
    configManager.update(updatedConfig);
    await configManager.save();

    widget.onModelAdded();
    if (mounted) Navigator.pop(context);
  }
}

// ---------------------------------------------------------------------------
// Shared widgets
// ---------------------------------------------------------------------------

class _ProviderChip extends StatelessWidget {
  final CatalogProvider provider;
  final bool isSelected;
  final bool isAuthenticated;
  final VoidCallback onTap;

  const _ProviderChip({
    required this.provider,
    required this.isSelected,
    this.isAuthenticated = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: isSelected
            ? colors.primaryContainer
            : colors.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(
              children: [
                Icon(provider.icon,
                    size: 20,
                    color: isSelected
                        ? colors.primary
                        : colors.onSurfaceVariant),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(provider.displayName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w600)),
                          if (provider.hasFreeModels) ...[
                            const SizedBox(width: 8),
                            _FreeBadge(),
                          ],
                          if (isAuthenticated) ...[
                            const SizedBox(width: 6),
                            Icon(Icons.check_circle,
                                color: Colors.green.shade600, size: 14),
                          ],
                        ],
                      ),
                      Text(provider.description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              )),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle, color: colors.primary, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModelChip extends StatelessWidget {
  final CatalogModel model;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModelChip({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Material(
        color: isSelected
            ? colors.primaryContainer
            : colors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(model.displayName,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  )),
                          if (model.isFree) ...[
                            const SizedBox(width: 8),
                            _FreeBadge(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      _ModelCapabilityIcons(model: model),
                    ],
                  ),
                ),
                Text(ModelCatalog.formatContext(model.contextWindow),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        )),
                if (isSelected) ...[
                  const SizedBox(width: 6),
                  Icon(Icons.check_circle, color: colors.primary, size: 18),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FreeBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        context.l10n.free,
        style: TextStyle(
          color: Colors.green.shade800,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _ModelCapabilityIcons extends StatelessWidget {
  final CatalogModel model;

  const _ModelCapabilityIcons({required this.model});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(Icons.text_fields, size: 13, color: colors.onSurfaceVariant),
        if (model.supportsVision) ...[
          const SizedBox(width: 5),
          Icon(Icons.image_outlined, size: 13, color: Colors.blue.shade400),
        ],
        if (model.supportsAudio) ...[
          const SizedBox(width: 5),
          Icon(Icons.mic_outlined, size: 13, color: Colors.orange.shade400),
        ],
      ],
    );
  }
}
