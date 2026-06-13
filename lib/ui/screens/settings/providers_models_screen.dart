import 'package:flutter/material.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/analytics_service.dart';
import 'package:flutterclaw/services/model_discovery_service.dart';
import 'package:flutterclaw/services/provider_key_validator.dart';
import 'package:flutterclaw/ui/widgets/key_rotation_section.dart';
import 'package:flutterclaw/ui/widgets/provider_brand_icon.dart';

/// Gemini Live prebuilt voices with their personality descriptions.
const Map<String, String> kLiveVoices = {
  'Puck': 'Upbeat',
  'Charon': 'Informational',
  'Kore': 'Firm',
  'Fenrir': 'Excitable',
  'Aoede': 'Breezy',
  'Leda': 'Youthful',
  'Orus': 'Firm',
  'Autonoe': 'Bright',
  'Enceladus': 'Breathy',
  'Iapetus': 'Clear',
  'Umbriel': 'Easy-going',
  'Algieba': 'Smooth',
  'Despina': 'Smooth',
  'Erinome': 'Clear',
  'Algenib': 'Gravelly',
  'Rasalgethi': 'Informational',
  'Laomedeia': 'Upbeat',
  'Achernar': 'Soft',
  'Alnilam': 'Firm',
  'Schedar': 'Even',
  'Gacrux': 'Mature',
  'Pulcherrima': 'Forward',
  'Achird': 'Friendly',
  'Zubenelgenubi': 'Casual',
  'Vindemiatrix': 'Gentle',
  'Sadachbia': 'Lively',
  'Sadaltager': 'Knowledgeable',
  'Sulafat': 'Warm',
  'Zephyr': 'Bright',
  'Shimmer': 'Clear',
};

/// Providers & Models settings sub-screen.
class ProvidersModelsScreen extends ConsumerStatefulWidget {
  const ProvidersModelsScreen({super.key});

  @override
  ConsumerState<ProvidersModelsScreen> createState() => _ProvidersModelsScreenState();
}

class _ProvidersModelsScreenState extends ConsumerState<ProvidersModelsScreen> {
  /// Invalidate providers that depend on config (model/credential) changes so
  /// the UI reacts immediately without an app restart.
  void _invalidateModelProviders() {
    ref.invalidate(activeAgentProvider);
    ref.invalidate(activeModelSupportsLiveProvider);
    ref.invalidate(activeModelSupportsVisionProvider);
  }

  @override
  Widget build(BuildContext context) {
    final configManager = ref.watch(configManagerProvider);
    final config = configManager.config;
    final analytics = ref.read(analyticsServiceProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.providersAndModels)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -- API Keys compact row --
          Card(
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: config.providerCredentials.isNotEmpty
                      ? colors.primaryContainer
                      : colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                ),
                child: Icon(
                  Icons.key,
                  size: 18,
                  color: config.providerCredentials.isNotEmpty
                      ? colors.primary
                      : colors.onSurfaceVariant,
                ),
              ),
              title: Text(
                context.l10n.providers,
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                config.providerCredentials.isEmpty
                    ? context.l10n.noProvidersConfigured
                    : config.providerCredentials.keys
                        .map((pid) => ModelCatalog.getProvider(pid.split(':').first)?.displayName ?? pid)
                        .toSet()
                        .join(' · '),
                style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _CredentialsScreen(onChanged: () {
                    _invalidateModelProviders();
                    setState(() {});
                  }),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // -- Models section --
          _SectionLabel(title: context.l10n.models),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              context.l10n.defaultModelHint,
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
            ...config.modelList
                .where((m) => !m.isLiveOnly)
                .map((m) {
              final index = config.modelList.indexWhere(
                (e) =>
                    e.modelName == m.modelName &&
                    e.model == m.model &&
                    e.provider == m.provider,
              );
              final isDefault = m.modelName == config.agents.defaults.modelName;
              final provider = ModelCatalog.getProvider(m.provider);
              final isAuth = config.isProviderAuthenticated(m.provider) ||
                  (m.apiKey != null && m.apiKey!.isNotEmpty);

              return Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  leading: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDefault
                          ? colors.primaryContainer
                          : colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                    ),
                    child: ProviderBrandIcon(
                      provider: provider,
                      size: 20,
                      iconColor: isDefault
                          ? colors.primary
                          : colors.onSurfaceVariant,
                    ),
                  ),
                  title: Row(
                    children: [
                      Flexible(
                        child: Text(
                          m.modelName,
                          style: theme.textTheme.titleSmall?.copyWith(
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
                            borderRadius: BorderRadius.circular(AppTokens.radiusPill),
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
                  subtitle: Text(
                    '${provider?.displayName ?? m.provider} / ${m.model}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isAuth ? Icons.check_circle : Icons.error_outline,
                        color: isAuth ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      // Popup menu replaces the old long-press to set default
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert, size: 20),
                        onSelected: (action) {
                          if (action == 'default') {
                            _setDefaultModel(context, m.modelName);
                          } else if (action == 'edit') {
                            _showEditModel(context, index, m);
                          }
                        },
                        itemBuilder: (_) => [
                          if (!isDefault)
                            PopupMenuItem(
                              value: 'default',
                              child: ListTile(
                                leading: const Icon(Icons.star_outline),
                                title: Text(context.l10n.setAsDefaultAction),
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                              ),
                            ),
                          PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: const Icon(Icons.edit_outlined),
                              title: Text(context.l10n.editAction),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => _showEditModel(context, index, m),
                ),
              );
            }),

          if (_liveVoiceOptions(config).isNotEmpty)
            ExpansionTile(
              title: Text(
                context.l10n.advancedSettings,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                context.l10n.voiceCallModelSection,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    context.l10n.voiceCallModelDescription,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: DropdownButtonFormField<String?>(
                      initialValue: _resolvedLiveVoiceSelection(config),
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: context.l10n.voiceCallModelLabel,
                      ),
                      items: [
                        DropdownMenuItem<String?>(
                          value: null,
                          child: Text(context.l10n.voiceCallModelAutomatic),
                        ),
                        ..._liveVoiceOptions(config).map(
                          (cm) => DropdownMenuItem<String?>(
                            value: cm.id,
                            child: Text(
                              '${ModelCatalog.getProvider(cm.providerId)?.displayName ?? cm.providerId} — ${cm.displayName}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (v) async {
                        final cm = ref.read(configManagerProvider);
                        final d = cm.config.agents.defaults;
                        final next = v == null
                            ? d.copyWith(clearLiveVoiceModelId: true)
                            : d.copyWith(liveVoiceModelId: v);
                        cm.update(cm.config.copyWith(
                          agents: cm.config.agents.copyWith(defaults: next),
                        ));
                        await cm.save();
                        setState(() {});
                      },
                    ),
                  ),
                ),
                SwitchListTile(
                  title: Text(context.l10n.preferLiveVoiceBootstrapTitle),
                  subtitle: Text(
                    context.l10n.preferLiveVoiceBootstrapSubtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  value: config.agents.defaults.preferLiveVoiceBootstrap,
                  onChanged: (v) async {
                    final cm = ref.read(configManagerProvider);
                    final next = cm.config.agents.defaults
                        .copyWith(preferLiveVoiceBootstrap: v);
                    cm.update(cm.config.copyWith(
                      agents: cm.config.agents.copyWith(defaults: next),
                    ));
                    await cm.save();
                    setState(() {});
                  },
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: DropdownButtonFormField<String>(
                      initialValue: kLiveVoices.containsKey(
                              config.agents.defaults.liveVoiceName)
                          ? config.agents.defaults.liveVoiceName
                          : 'Puck',
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: context.l10n.liveVoiceNameLabel,
                      ),
                      items: kLiveVoices.entries
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e.key,
                              child: Text('${e.key} — ${e.value}'),
                            ),
                          )
                          .toList(),
                      onChanged: (v) async {
                        if (v == null) return;
                        final cm = ref.read(configManagerProvider);
                        final next = cm.config.agents.defaults
                            .copyWith(liveVoiceName: v);
                        cm.update(cm.config.copyWith(
                          agents: cm.config.agents.copyWith(defaults: next),
                        ));
                        await cm.save();
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),

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

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Dropdown value: null, or stored id only if still among [ _liveVoiceOptions ].
  String? _resolvedLiveVoiceSelection(FlutterClawConfig config) {
    final cur = config.agents.defaults.liveVoiceModelId;
    if (cur == null || cur.isEmpty) return null;
    final ids = _liveVoiceOptions(config).map((m) => m.id).toSet();
    return ids.contains(cur) ? cur : null;
  }

  /// Live catalog models for providers the user has authenticated (deduped by id).
  List<CatalogModel> _liveVoiceOptions(FlutterClawConfig config) {
    final seen = <String>{};
    final out = <CatalogModel>[];
    for (final pid in config.providerCredentials.keys) {
      if (!config.isProviderAuthenticated(pid)) continue;
      for (final m in ModelCatalog.liveCatalogModelsForProvider(pid)) {
        if (seen.add(m.id)) out.add(m);
      }
    }
    return out;
  }


  void _showAddModelFlow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) =>
              _AddModelScreen(onModelAdded: () {
                _invalidateModelProviders();
                setState(() {});
              })),
    );
  }

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
            Row(children: [
              ProviderBrandIcon(
                provider: provider,
                size: 24,
                iconColor: Theme.of(ctx).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(model.modelName,
                      style: Theme.of(ctx).textTheme.titleLarge)),
              if (model.isFree) _FreeBadge(),
            ]),
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
                  onPressed: () {
                    Navigator.pop(ctx);
                    _setDefaultModel(context, model.modelName);
                  },
                  icon: const Icon(Icons.star_outline),
                  label: Text(context.l10n.setAsDefault),
                ),
              ),
            const SizedBox(height: 12),
            Row(children: [
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
                            child: Text(context.l10n.cancel)),
                        FilledButton(
                            onPressed: () => Navigator.pop(d, true),
                            child: Text(context.l10n.remove)),
                      ],
                    ),
                  );
                  if (confirmed != true || !ctx.mounted) return;
                  final updated = List<ModelEntry>.from(
                      configManager.config.modelList);
                  updated.removeAt(index);
                  configManager.update(
                      configManager.config.copyWith(modelList: updated));
                  await configManager.save();
                  _invalidateModelProviders();
                  if (ctx.mounted) Navigator.pop(ctx);
                  setState(() {});
                },
                icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                label: Text(context.l10n.remove,
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(context.l10n.cancel)),
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
                  _invalidateModelProviders();
                  if (ctx.mounted) Navigator.pop(ctx);
                  setState(() {});
                },
                child: Text(context.l10n.save),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Future<void> _setDefaultModel(BuildContext context, String modelName) async {
    final configManager = ref.read(configManagerProvider);
    final config = configManager.config;
    final agentsToUpdate =
        config.agentProfiles.where((a) => a.modelName != modelName).toList();

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
              title: Text(context.l10n.changeDefaultModel),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.setModelAsDefault(modelName)),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                        context.l10n.alsoUpdateAgents(agentsToUpdate.length)),
                    subtitle: Text(
                      agentsToUpdate
                          .map((a) => '${a.emoji} ${a.name}')
                          .join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: agents,
                    onChanged: (v) =>
                        setDialogState(() => agents = v ?? false),
                  ),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(context.l10n.startNewSessions),
                    subtitle:
                        Text(context.l10n.currentConversationsArchived),
                    value: sessions,
                    onChanged: (v) =>
                        setDialogState(() => sessions = v ?? false),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(context.l10n.cancel)),
                FilledButton(
                  onPressed: () => Navigator.pop(
                    ctx,
                    _DefaultModelAction(
                        updateAgents: agents,
                        startNewSessions: sessions),
                  ),
                  child: Text(context.l10n.applyAction),
                ),
              ],
            ),
          );
        },
      );
      if (result == null) return;
      updateAgents = result.updateAgents;
      startNewSessions = result.startNewSessions;
    }

    configManager.update(config.copyWith(
      agents: config.agents.copyWith(
        defaults: config.agents.defaults.copyWith(modelName: modelName),
      ),
    ));

    if (updateAgents && agentsToUpdate.isNotEmpty) {
      final updatedProfiles =
          config.agentProfiles.map((a) => a.copyWith(modelName: modelName)).toList();
      configManager.update(
          configManager.config.copyWith(agentProfiles: updatedProfiles));
    }

    await configManager.save();
    _invalidateModelProviders();

    // Sync Live Activity model if gateway is running and agents were updated
    if (updateAgents) {
      final gatewayState = ref.read(gatewayStateProvider);
      if (gatewayState.isRunning) {
        ref.read(gatewayStateProvider.notifier).setModel(modelName);
      }
    }

    if (startNewSessions) {
      ref.read(chatProvider.notifier).clear();
    }

    setState(() {});
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.modelSetAsDefault(modelName)),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

class _DefaultModelAction {
  final bool updateAgents;
  final bool startNewSessions;
  final bool setAsDefault;
  const _DefaultModelAction({
    required this.updateAgents,
    required this.startNewSessions,
    this.setAsDefault = true,
  });
}

// ---------------------------------------------------------------------------
// Section label
// ---------------------------------------------------------------------------

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8, left: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Credentials management screen
// ---------------------------------------------------------------------------

class _CredentialsScreen extends ConsumerStatefulWidget {
  final VoidCallback onChanged;
  const _CredentialsScreen({required this.onChanged});

  @override
  ConsumerState<_CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends ConsumerState<_CredentialsScreen> {
  final Set<String> _testing = {};
  final Map<String, bool> _testResults = {};
  final Set<String> _expandedRotation = {};

  /// Runs a live "Test connection" check for a stored credential.
  Future<void> _testCredential(String provId, ProviderCredential cred) async {
    final baseId = provId.split(':').first;
    if (baseId == 'bedrock' && cred.awsAuthMode == 'sigv4') {
      // SigV4 signing not supported by the lightweight validator.
      return;
    }
    final catalogProv = ModelCatalog.getProvider(baseId);
    setState(() => _testing.add(provId));
    try {
      final error = await ProviderKeyValidator.validate(
        providerId: baseId,
        apiKey: cred.apiKey,
        apiBase: cred.apiBase ?? catalogProv?.apiBase,
        awsRegion: cred.awsRegion,
        awsAuthMode: cred.awsAuthMode,
      );
      if (!mounted) return;
      setState(() => _testResults[provId] = error == null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error == null
              ? context.l10n.connectedStatus
              : context.l10n.connectionFailed(error)),
        ),
      );
    } finally {
      if (mounted) setState(() => _testing.remove(provId));
    }
  }

  void _showEditSheet(BuildContext context, String providerId, ProviderCredential cred) {
    final configManager = ref.read(configManagerProvider);
    final catalogProv = ModelCatalog.getProvider(providerId.split(':').first);
    final isBedrock = providerId.split(':').first == 'bedrock';
    final keyCtl = TextEditingController(text: cred.apiKey);
    final baseCtl = TextEditingController(text: cred.apiBase ?? catalogProv?.apiBase ?? '');
    final secretCtl = TextEditingController(text: cred.awsSecretKey ?? '');
    final regionCtl = TextEditingController(text: cred.awsRegion ?? 'us-east-1');
    var editAuthMode = cred.awsAuthMode ?? 'bearer';
    bool showAdvanced = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setSheet) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              ProviderBrandIcon(
                provider: catalogProv, size: 24,
                iconColor: Theme.of(ctx).colorScheme.primary,
                fallbackIcon: Icons.key,
              ),
              const SizedBox(width: 10),
              Text(catalogProv?.displayName ?? providerId, style: Theme.of(ctx).textTheme.titleLarge),
            ]),
            const SizedBox(height: 20),
            if (isBedrock) ...[
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: 'bearer', label: Text(context.l10n.authBearerTokenLabel)),
                  ButtonSegment(value: 'sigv4', label: Text(context.l10n.authAccessKeysLabel)),
                ],
                selected: {editAuthMode},
                onSelectionChanged: (v) => setSheet(() {
                  editAuthMode = v.first;
                  keyCtl.clear(); secretCtl.clear();
                }),
              ),
              const SizedBox(height: 12),
            ],
            TextField(
              controller: keyCtl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: isBedrock
                    ? (editAuthMode == 'bearer' ? context.l10n.authBearerTokenLabel : 'AWS Access Key ID')
                    : context.l10n.apiKey,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  tooltip: context.l10n.paste,
                  onPressed: () async {
                    final d = await Clipboard.getData(Clipboard.kTextPlain);
                    if (d?.text != null) keyCtl.text = d!.text!;
                  },
                ),
              ),
            ),
            if (isBedrock && editAuthMode == 'sigv4') ...[
              const SizedBox(height: 12),
              TextField(
                controller: secretCtl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'AWS Secret Access Key',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.paste),
                    tooltip: context.l10n.paste,
                    onPressed: () async {
                      final d = await Clipboard.getData(Clipboard.kTextPlain);
                      if (d?.text != null) secretCtl.text = d!.text!;
                    },
                  ),
                ),
              ),
            ],
            if (isBedrock) ...[
              const SizedBox(height: 12),
              TextField(
                controller: regionCtl,
                decoration: const InputDecoration(
                  labelText: 'AWS Region', hintText: 'us-east-1',
                  border: OutlineInputBorder(), prefixIcon: Icon(Icons.public),
                ),
              ),
            ] else ...[
              const SizedBox(height: 8),
              InkWell(
                onTap: () => setSheet(() => showAdvanced = !showAdvanced),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    Icon(showAdvanced ? Icons.expand_less : Icons.expand_more, size: 18,
                        color: Theme.of(ctx).colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text('Advanced', style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                        color: Theme.of(ctx).colorScheme.onSurfaceVariant)),
                  ]),
                ),
              ),
              if (showAdvanced) ...[
                const SizedBox(height: 4),
                TextField(
                  controller: baseCtl,
                  decoration: InputDecoration(
                    labelText: context.l10n.apiBaseUrl,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.link),
                  ),
                ),
              ],
            ],
            const SizedBox(height: 20),
            Row(children: [
              TextButton.icon(
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: ctx,
                    builder: (d) => AlertDialog(
                      title: Text(context.l10n.removeProvider),
                      content: Text(context.l10n.removeProviderConfirm(
                          catalogProv?.displayName ?? providerId)),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(d, false), child: Text(context.l10n.cancel)),
                        FilledButton(onPressed: () => Navigator.pop(d, true), child: Text(context.l10n.remove)),
                      ],
                    ),
                  );
                  if (confirmed != true || !ctx.mounted) return;
                  final updated = Map<String, ProviderCredential>.from(
                      configManager.config.providerCredentials)..remove(providerId);
                  configManager.update(configManager.config.copyWith(providerCredentials: updated));
                  await configManager.save();
                  widget.onChanged();
                  if (ctx.mounted) Navigator.pop(ctx);
                  setState(() {});
                },
                icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                label: Text(context.l10n.remove,
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
              const Spacer(),
              TextButton(onPressed: () => Navigator.pop(ctx), child: Text(context.l10n.cancel)),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () async {
                  final newCred = ProviderCredential(
                    apiKey: keyCtl.text.trim(),
                    apiBase: isBedrock
                        ? 'https://bedrock-runtime.${regionCtl.text.trim()}.amazonaws.com'
                        : baseCtl.text.trim().isNotEmpty ? baseCtl.text.trim() : null,
                    awsSecretKey: isBedrock && editAuthMode == 'sigv4' ? secretCtl.text.trim() : null,
                    awsRegion: isBedrock ? regionCtl.text.trim() : null,
                    awsAuthMode: isBedrock ? editAuthMode : null,
                  );
                  configManager.update(configManager.config.withProviderCredential(providerId, newCred));
                  await configManager.save();
                  widget.onChanged();
                  if (ctx.mounted) Navigator.pop(ctx);
                  setState(() {});
                },
                child: Text(context.l10n.save),
              ),
            ]),
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final configManager = ref.watch(configManagerProvider);
    final config = configManager.config;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profilesAsync = ref.watch(authProfileServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.providers)),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(context.l10n.errorGeneric('$e'))),
        data: (authSvc) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (config.providerCredentials.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  context.l10n.noProvidersConfigured,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: colors.onSurfaceVariant),
                ),
              )
            else
              ...config.providerCredentials.entries.map((entry) {
                final provId = entry.key;
                final cred = entry.value;
                final baseId = provId.split(':').first;
                final catalogProv = ModelCatalog.getProvider(baseId);
                final displayLabel = cred.label != null && cred.label!.isNotEmpty
                    ? '${catalogProv?.displayName ?? baseId} (${cred.label})'
                    : catalogProv?.displayName ?? provId;
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors.primaryContainer,
                            borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                          ),
                          child: ProviderBrandIcon(
                            provider: catalogProv,
                            size: 18,
                            iconColor: colors.primary,
                            fallbackIcon: Icons.key,
                          ),
                        ),
                        title: Text(
                          displayLabel,
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          baseId == 'bedrock' && cred.awsRegion != null
                              ? 'Region: ${cred.awsRegion}'
                              : cred.apiBase ?? catalogProv?.apiBase ?? '',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: colors.onSurfaceVariant),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_testing.contains(provId))
                              const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            else
                              IconButton(
                                icon: Icon(
                                  _testResults[provId] == false
                                      ? Icons.error_outline
                                      : Icons.check_circle,
                                  color: _testResults[provId] == null
                                      ? colors.onSurfaceVariant
                                      : _testResults[provId]!
                                          ? Colors.green
                                          : colors.error,
                                  size: 18,
                                ),
                                tooltip: context.l10n.testConnection,
                                onPressed: () => _testCredential(provId, cred),
                              ),
                            const SizedBox(width: 4),
                            IconButton(
                              icon: const Icon(Icons.edit_outlined, size: 20),
                              tooltip: context.l10n.editCredentials,
                              onPressed: () =>
                                  _showEditSheet(context, provId, cred),
                            ),
                          ],
                        ),
                      ),
                      ExpansionTile(
                        initiallyExpanded: _expandedRotation.contains(baseId),
                        onExpansionChanged: (open) {
                          setState(() {
                            if (open) {
                              _expandedRotation.add(baseId);
                            } else {
                              _expandedRotation.remove(baseId);
                            }
                          });
                        },
                        title: Text(
                          context.l10n.keyRotationAdvanced,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          KeyRotationSection(
                            provider: baseId,
                            svc: authSvc,
                            onChanged: () {
                              widget.onChanged();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: OutlinedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => _AddProviderScreen(onSaved: () {
                      widget.onChanged();
                      setState(() {});
                    }),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: Text(context.l10n.addProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Full-screen Add Provider flow
// ---------------------------------------------------------------------------

class _AddProviderScreen extends ConsumerStatefulWidget {
  final VoidCallback onSaved;
  const _AddProviderScreen({required this.onSaved});

  @override
  ConsumerState<_AddProviderScreen> createState() => _AddProviderScreenState();
}

class _AddProviderScreenState extends ConsumerState<_AddProviderScreen> {
  String? _selectedProviderId;
  final _apiKeyCtl = TextEditingController();
  final _apiBaseCtl = TextEditingController();
  final _labelCtl = TextEditingController();
  final _awsSecretKeyCtl = TextEditingController();
  final _awsRegionCtl = TextEditingController(text: 'us-east-1');
  String _awsAuthMode = 'bearer';
  bool _showAdvanced = false;
  bool _testing = false;
  String? _testError;

  @override
  void dispose() {
    _apiKeyCtl.dispose();
    _apiBaseCtl.dispose();
    _labelCtl.dispose();
    _awsSecretKeyCtl.dispose();
    _awsRegionCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final needsBaseUrl =
        _selectedProviderId == 'ollama' || _selectedProviderId == 'custom';
    final isBedrock = _selectedProviderId == 'bedrock';

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.addProvider)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(context.l10n.chooseProviderTitle,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ModelCatalog.availableProviders.map((p) => _ProviderChip(
                provider: p,
                isSelected: _selectedProviderId == p.id,
                onTap: () => setState(() {
                  _selectedProviderId = p.id;
                  _apiBaseCtl.text = p.apiBase ?? '';
                }),
              )),
          if (_selectedProviderId != null) ...[
            const SizedBox(height: 24),
            Text(context.l10n.apiKeyTitle,
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
                  borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                    ),
                    child: Row(children: [
                      Icon(Icons.open_in_new, size: 18, color: colors.primary),
                      const SizedBox(width: 10),
                      Text(
                        context.l10n.getApiKeyAt(p.displayName),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            }),
            if (isBedrock) ...[
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: 'bearer',
                    label: Text(context.l10n.authBearerTokenLabel),
                  ),
                  ButtonSegment(
                    value: 'sigv4',
                    label: Text(context.l10n.authAccessKeysLabel),
                  ),
                ],
                selected: {_awsAuthMode},
                onSelectionChanged: (v) => setState(() {
                  _awsAuthMode = v.first;
                  _apiKeyCtl.clear();
                  _awsSecretKeyCtl.clear();
                }),
              ),
              const SizedBox(height: 12),
            ],
            TextField(
              controller: _apiKeyCtl,
              obscureText: true,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: isBedrock
                    ? (_awsAuthMode == 'bearer'
                        ? context.l10n.authBearerTokenLabel
                        : 'AWS Access Key ID')
                    : context.l10n.apiKey,
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
            if (isBedrock && _awsAuthMode == 'sigv4') ...[
              const SizedBox(height: 12),
              TextField(
                controller: _awsSecretKeyCtl,
                obscureText: true,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: 'AWS Secret Access Key',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.paste),
                    tooltip: context.l10n.paste,
                    onPressed: () async {
                      final data = await Clipboard.getData(Clipboard.kTextPlain);
                      if (data?.text != null) {
                        _awsSecretKeyCtl.text = data!.text!;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
            ],
            if (isBedrock) ...[
              const SizedBox(height: 12),
              TextField(
                controller: _awsRegionCtl,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'AWS Region',
                  hintText: 'us-east-1',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.public),
                ),
              ),
            ],
            if (needsBaseUrl) ...[
              const SizedBox(height: 8),
              InkWell(
                onTap: () => setState(() => _showAdvanced = !_showAdvanced),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    Icon(
                      _showAdvanced ? Icons.expand_less : Icons.expand_more,
                      size: 18, color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text('Advanced', style: theme.textTheme.bodySmall
                        ?.copyWith(color: colors.onSurfaceVariant)),
                  ]),
                ),
              ),
              if (_showAdvanced) ...[
                TextField(
                  controller: _apiBaseCtl,
                  decoration: InputDecoration(
                    labelText: context.l10n.apiBaseUrl,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.link),
                    hintText: _selectedProviderId == 'ollama' ? 'https://ollama.com/v1' : null,
                    helperText: _selectedProviderId == 'ollama' ? 'For local: http://localhost:11434/v1' : null,
                  ),
                ),
              ],
            ],
            Consumer(builder: (ctx, ref, _) {
              final cfg = ref.watch(configManagerProvider).config;
              final alreadyHasKey = cfg.providerCredentials
                  .containsKey(_selectedProviderId);
              if (!alreadyHasKey && !isBedrock) {
                return const SizedBox.shrink();
              }
              if (alreadyHasKey && !isBedrock) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TextField(
                    controller: _labelCtl,
                    decoration: InputDecoration(
                      labelText: context.l10n.credentialLabel,
                      hintText: context.l10n.credentialLabelHint,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.label_outline),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            if (_selectedProviderId != null &&
                !(_selectedProviderId == 'bedrock' && _awsAuthMode == 'sigv4')) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _testing ? null : _testConnection,
                icon: _testing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
                        _testError == null
                            ? Icons.check_circle_outline
                            : Icons.error_outline,
                        color: _testError == null ? null : colors.error,
                      ),
                label: Text(context.l10n.testConnection),
              ),
              if (_testError != null) ...[
                const SizedBox(height: 8),
                Text(
                  context.l10n.testConnectionFirst,
                  style: theme.textTheme.bodySmall?.copyWith(color: colors.error),
                ),
              ],
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: Consumer(builder: (ctx, ref, _) {
                bool canSave;
                if (isBedrock) {
                  canSave = _apiKeyCtl.text.trim().isNotEmpty &&
                      _awsRegionCtl.text.trim().isNotEmpty;
                  if (_awsAuthMode == 'sigv4') {
                    canSave = canSave && _awsSecretKeyCtl.text.trim().isNotEmpty;
                  }
                } else {
                  canSave = _apiKeyCtl.text.trim().isNotEmpty;
                }
                return FilledButton.icon(
                  onPressed: canSave ? () => _save(ref) : null,
                  icon: const Icon(Icons.check),
                  label: Text(context.l10n.save),
                );
              }),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _testConnection() async {
    if (_selectedProviderId == null) return;
    final baseId = _selectedProviderId!;
    if (baseId == 'bedrock' && _awsAuthMode == 'sigv4') return;
    setState(() {
      _testing = true;
      _testError = null;
    });
    try {
      final catalogProv = ModelCatalog.getProvider(baseId);
      final error = await ProviderKeyValidator.validate(
        providerId: baseId,
        apiKey: _apiKeyCtl.text.trim(),
        apiBase: _apiBaseCtl.text.trim().isNotEmpty
            ? _apiBaseCtl.text.trim()
            : catalogProv?.apiBase,
        awsRegion: _awsRegionCtl.text.trim(),
        awsAuthMode: _awsAuthMode,
      );
      if (!mounted) return;
      setState(() => _testError = error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error == null
              ? context.l10n.connectedStatus
              : context.l10n.connectionFailed(error)),
        ),
      );
    } finally {
      if (mounted) setState(() => _testing = false);
    }
  }

  void _save(WidgetRef ref) async {
    final configManager = ref.read(configManagerProvider);
    final catalogProv = ModelCatalog.getProvider(_selectedProviderId!);
    final isBedrock = _selectedProviderId == 'bedrock';
    final label = _labelCtl.text.trim();
    final credential = ProviderCredential(
      apiKey: _apiKeyCtl.text.trim(),
      apiBase: isBedrock
          ? 'https://bedrock-runtime.${_awsRegionCtl.text.trim()}.amazonaws.com'
          : _apiBaseCtl.text.trim().isNotEmpty
              ? _apiBaseCtl.text.trim()
              : catalogProv?.apiBase,
      awsSecretKey: isBedrock && _awsAuthMode == 'sigv4'
          ? _awsSecretKeyCtl.text.trim()
          : null,
      awsRegion: isBedrock ? _awsRegionCtl.text.trim() : null,
      awsAuthMode: isBedrock ? _awsAuthMode : null,
      label: label.isNotEmpty ? label : null,
    );
    // Use suffixed key if this provider already has a credential and a label is set.
    final alreadyHasKey =
        configManager.config.providerCredentials.containsKey(_selectedProviderId!);
    final credKey = (alreadyHasKey && label.isNotEmpty)
        ? '$_selectedProviderId:$label'
        : _selectedProviderId!;
    configManager.update(configManager.config
        .withProviderCredential(credKey, credential));
    await configManager.save();
    widget.onSaved();
    if (mounted) Navigator.pop(context);
  }
}

// ---------------------------------------------------------------------------
// Full-screen Add Model flow
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
  String? _selectedModelDisplayName;
  bool _useCustomModel = false;
  String? _selectedCredentialId;
  final _apiKeyCtl = TextEditingController();
  final _apiBaseCtl = TextEditingController();
  final _customModelCtl = TextEditingController();
  final _awsSecretKeyCtl = TextEditingController();
  final _awsRegionCtl = TextEditingController(text: 'us-east-1');
  String _modelAwsAuthMode = 'bearer';
  bool _showAdvanced = false;
  List<DiscoveredModel> _discoveredModels = [];
  bool _discovering = false;

  /// Providers whose `/models` endpoint can be queried from settings.
  static const _discoverableProviders = {
    'ollama',
    'custom',
    'anthropic',
    'openai',
    'xai',
    'groq',
    'deepseek',
    'google',
  };

  /// Fetches the provider's live model list and merges it with the static
  /// catalog (catalog entries take precedence; duplicates are skipped).
  Future<void> _discoverModels() async {
    final providerId = _selectedProviderId;
    if (providerId == null) return;
    setState(() => _discovering = true);
    try {
      final config = ref.read(configManagerProvider).config;
      final cred = config.providerCredentials[providerId];
      final apiKey = (cred?.apiKey.isNotEmpty ?? false)
          ? cred!.apiKey
          : _apiKeyCtl.text.trim();
      final apiBase = _apiBaseCtl.text.trim().isNotEmpty
          ? _apiBaseCtl.text.trim()
          : cred?.apiBase;
      final svc = ref.read(modelDiscoveryServiceProvider);
      final models = await svc.discoverModels(
        providerId: providerId,
        apiKey: apiKey,
        apiBase: apiBase,
      );
      if (!mounted) return;
      final catalogIds = ModelCatalog.chatCatalogModelsForProvider(providerId)
          .map((m) => m.id)
          .toSet();
      setState(() {
        _discoveredModels =
            models.where((m) => !catalogIds.contains(m.id)).toList();
      });
      if (models.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.noModelsFound)),
        );
      }
    } finally {
      if (mounted) setState(() => _discovering = false);
    }
  }

  @override
  void dispose() {
    _apiKeyCtl.dispose();
    _apiBaseCtl.dispose();
    _customModelCtl.dispose();
    _awsSecretKeyCtl.dispose();
    _awsRegionCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final config = ref.watch(configManagerProvider).config;
    final alreadyAuthenticated = _selectedProviderId != null &&
        config.isProviderAuthenticated(_selectedProviderId!);
    final isModelBedrock = _selectedProviderId == 'bedrock';

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.addModel)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(context.l10n.chooseProviderStep,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ModelCatalog.availableProviders.map((p) => _ProviderChip(
                provider: p,
                isSelected: _selectedProviderId == p.id,
                isAuthenticated: config.isProviderAuthenticated(p.id),
                onTap: () => setState(() {
                  _selectedProviderId = p.id;
                  _selectedModelId = null;
                  _useCustomModel = false;
                  _customModelCtl.clear();
                  _apiBaseCtl.text = p.apiBase ?? '';
                  _discoveredModels = [];
                }),
              )),
          if (_selectedProviderId != null) ...[
            const SizedBox(height: 24),
            Text(context.l10n.selectModelStep,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (_selectedProviderId == 'openrouter')
              _OpenRouterModelSearch(
                onModelSelected: (id, displayName) => setState(() {
                  _selectedModelId = id;
                  _selectedModelDisplayName = displayName;
                  _useCustomModel = false;
                  _customModelCtl.clear();
                }),
                selectedModelId: _selectedModelId,
              )
            else ...[
              ...ModelCatalog.chatCatalogModelsForProvider(_selectedProviderId!)
                  .map((m) => _ModelChip(
                        model: m,
                        isSelected:
                            !_useCustomModel && _selectedModelId == m.id,
                        onTap: () => setState(() {
                          _selectedModelId = m.id;
                          _useCustomModel = false;
                          _customModelCtl.clear();
                        }),
                      )),
              // Live model list from the provider API, merged below the
              // static catalog (catalog entries take precedence).
              ..._discoveredModels.map((m) => _ModelChip(
                    model: m.toCatalogModel(),
                    isSelected: !_useCustomModel && _selectedModelId == m.id,
                    onTap: () => setState(() {
                      _selectedModelId = m.id;
                      _selectedModelDisplayName = m.displayName;
                      _useCustomModel = false;
                      _customModelCtl.clear();
                    }),
                  )),
              if (_discoverableProviders.contains(_selectedProviderId)) ...[
                const SizedBox(height: 4),
                TextButton.icon(
                  icon: _discovering
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.travel_explore, size: 16),
                  label: Text(context.l10n.discoverModels),
                  onPressed: _discovering ? null : _discoverModels,
                ),
              ],
              const SizedBox(height: 8),
              TextButton.icon(
                icon: Icon(
                  _useCustomModel ? Icons.close : Icons.edit_outlined,
                  size: 16,
                ),
                label: Text(_useCustomModel
                    ? context.l10n.selectFromList
                    : context.l10n.enterCustomModelId),
                onPressed: () => setState(() {
                  _useCustomModel = !_useCustomModel;
                  if (!_useCustomModel) _customModelCtl.clear();
                }),
              ),
              if (_useCustomModel) ...[
                const SizedBox(height: 8),
                TextField(
                  controller: _customModelCtl,
                  decoration: InputDecoration(
                    labelText: context.l10n.modelId,
                    border: const OutlineInputBorder(),
                    hintText: 'e.g. google/gemini-3-flash-preview',
                  ),
                  onChanged: (val) => setState(() =>
                      _selectedModelId =
                          val.trim().isNotEmpty ? val.trim() : null),
                ),
              ],
            ],
            const SizedBox(height: 24),
            if (alreadyAuthenticated) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(children: [
                  Icon(Icons.check_circle,
                      color: Colors.green.shade700, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      context.l10n.providerAlreadyAuth,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ]),
              ),
              // Show credential picker if multiple keys exist
              Builder(builder: (_) {
                final creds =
                    config.credentialsForProvider(_selectedProviderId!);
                if (creds.length <= 1) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: DropdownButtonFormField<String?>(
                    initialValue: _selectedCredentialId,
                    decoration: InputDecoration(
                      labelText: context.l10n.selectCredential,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.key),
                    ),
                    items: [
                      DropdownMenuItem<String?>(
                        value: null,
                        child: Text(context.l10n.default_),
                      ),
                      ...creds.entries.map((e) => DropdownMenuItem<String?>(
                            value: e.key,
                            child: Text(e.value.label ?? e.key),
                          )),
                    ],
                    onChanged: (v) => setState(() {
                      _selectedCredentialId = v;
                    }),
                  ),
                );
              }),
            ] else ...[
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
                        mode: LaunchMode.externalApplication),
                    borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(AppTokens.radiusSM),
                      ),
                      child: Row(children: [
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
                      ]),
                    ),
                  ),
                );
              }),
              if (isModelBedrock) ...[
                SegmentedButton<String>(
                  segments: [
                    ButtonSegment(
                      value: 'bearer',
                      label: Text(context.l10n.authBearerTokenLabel),
                    ),
                    ButtonSegment(
                      value: 'sigv4',
                      label: Text(context.l10n.authAccessKeysLabel),
                    ),
                  ],
                  selected: {_modelAwsAuthMode},
                  onSelectionChanged: (v) => setState(() {
                    _modelAwsAuthMode = v.first;
                    _apiKeyCtl.clear();
                    _awsSecretKeyCtl.clear();
                  }),
                ),
                const SizedBox(height: 12),
              ],
              TextField(
                controller: _apiKeyCtl,
                obscureText: true,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: isModelBedrock
                      ? (_modelAwsAuthMode == 'bearer'
                          ? context.l10n.authBearerTokenLabel
                          : 'AWS Access Key ID')
                      : context.l10n.apiKey,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.paste),
                    tooltip: context.l10n.paste,
                    onPressed: () async {
                      final data =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      if (data?.text != null) {
                        _apiKeyCtl.text = data!.text!;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              if (isModelBedrock && _modelAwsAuthMode == 'sigv4') ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _awsSecretKeyCtl,
                  obscureText: true,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: 'AWS Secret Access Key',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.paste),
                      tooltip: context.l10n.paste,
                      onPressed: () async {
                        final data =
                            await Clipboard.getData(Clipboard.kTextPlain);
                        if (data?.text != null) {
                          _awsSecretKeyCtl.text = data!.text!;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              ],
              if (isModelBedrock) ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _awsRegionCtl,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(
                    labelText: 'AWS Region',
                    hintText: 'us-east-1',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.public),
                  ),
                ),
              ],
              if (_selectedProviderId == 'ollama' ||
                  _selectedProviderId == 'custom') ...[
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => setState(() => _showAdvanced = !_showAdvanced),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(children: [
                      Icon(
                        _showAdvanced ? Icons.expand_less : Icons.expand_more,
                        size: 18, color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text('Advanced', style: theme.textTheme.bodySmall
                          ?.copyWith(color: colors.onSurfaceVariant)),
                    ]),
                  ),
                ),
                if (_showAdvanced) ...[
                  TextField(
                    controller: _apiBaseCtl,
                    decoration: InputDecoration(
                      labelText: context.l10n.apiBaseUrl,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.link),
                      hintText: _selectedProviderId == 'ollama' ? 'https://ollama.com/v1' : null,
                      helperText: _selectedProviderId == 'ollama' ? 'For local: http://localhost:11434/v1' : null,
                    ),
                  ),
                ],
              ],
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                onPressed: _canAddModel(alreadyAuthenticated)
                    ? _addModel
                    : null,
                icon: const Icon(Icons.add),
                label: Text(context.l10n.addModel),
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool _canAddModel(bool alreadyAuthenticated) {
    if (_selectedModelId == null) return false;
    if (alreadyAuthenticated) return true;
    if (_apiKeyCtl.text.trim().isEmpty) return false;
    if (_selectedProviderId == 'bedrock') {
      if (_awsRegionCtl.text.trim().isEmpty) return false;
      if (_modelAwsAuthMode == 'sigv4' &&
          _awsSecretKeyCtl.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _addModel() async {
    final configManager = ref.read(configManagerProvider);
    final provider = ModelCatalog.getProvider(_selectedProviderId!);
    final catalogModel =
        ModelCatalog.tryGetModelFlexible(_selectedModelId ?? '');
    final config = configManager.config;

    if (ModelCatalog.isLiveCatalogId(_selectedModelId ?? '')) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.cannotAddLiveModelAsChat)),
        );
      }
      return;
    }

    if (config.modelList.any((m) => m.model == _selectedModelId)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.modelAlreadyAdded)),
        );
      }
      return;
    }

    // Best-effort validation: warn (without blocking) when the chosen ID is
    // neither in the static catalog nor in the provider's live model list.
    if (catalogModel == null) {
      List<DiscoveredModel> known = _discoveredModels;
      if (_selectedProviderId == 'openrouter') {
        known = await ref.read(modelDiscoveryServiceProvider).getOpenRouterModels(
              apiKey: config.providerCredentials['openrouter']?.apiKey,
            );
      }
      if (known.isNotEmpty &&
          !known.any((m) => m.id == _selectedModelId) &&
          mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.modelNotInProviderList)),
        );
      }
    }

    final alreadyAuthenticated =
        config.isProviderAuthenticated(_selectedProviderId!);

    var updatedConfig = config;
    final isBedrock = _selectedProviderId == 'bedrock';
    if (!alreadyAuthenticated && _apiKeyCtl.text.trim().isNotEmpty) {
      final credential = ProviderCredential(
        apiKey: _apiKeyCtl.text.trim(),
        apiBase: isBedrock
            ? 'https://bedrock-runtime.${_awsRegionCtl.text.trim()}.amazonaws.com'
            : _apiBaseCtl.text.trim().isNotEmpty
                ? _apiBaseCtl.text.trim()
                : provider?.apiBase,
        awsSecretKey: isBedrock && _modelAwsAuthMode == 'sigv4'
            ? _awsSecretKeyCtl.text.trim()
            : null,
        awsRegion: isBedrock ? _awsRegionCtl.text.trim() : null,
        awsAuthMode: isBedrock ? _modelAwsAuthMode : null,
      );
      updatedConfig = updatedConfig.withProviderCredential(
          _selectedProviderId!, credential);
    }

    final bedrockApiBase = isBedrock
        ? 'https://bedrock-runtime.${(updatedConfig.providerCredentials[_selectedProviderId!]?.awsRegion ?? _awsRegionCtl.text.trim())}.amazonaws.com'
        : null;

    final modelEntry = ModelEntry(
      modelName: catalogModel?.displayName ??
          _selectedModelDisplayName ??
          _selectedModelId!,
      model: _selectedModelId!,
      apiBase: isBedrock
          ? bedrockApiBase
          : _apiBaseCtl.text.trim().isNotEmpty
              ? _apiBaseCtl.text.trim()
              : provider?.apiBase,
      provider: _selectedProviderId!,
      isFree: catalogModel?.isFree ?? false,
      input: catalogModel?.input,
      credentialId: _selectedCredentialId,
    );

    final wasFirstModel = updatedConfig.modelList.isEmpty;

    updatedConfig = updatedConfig.copyWith(
      modelList: [...updatedConfig.modelList, modelEntry],
    );
    configManager.update(updatedConfig);
    await configManager.save();

    if (!mounted) return;

    if (wasFirstModel) {
      // First model ever — auto-set as default and apply to all agents silently.
      final profiles = configManager.config.agentProfiles
          .map((a) => a.copyWith(modelName: modelEntry.modelName))
          .toList();
      configManager.update(configManager.config.copyWith(
        agents: configManager.config.agents.copyWith(
          defaults: configManager.config.agents.defaults
              .copyWith(modelName: modelEntry.modelName),
        ),
        agentProfiles: profiles,
      ));
      await configManager.save();
      widget.onModelAdded();
      if (mounted) Navigator.pop(context);
      return;
    }

    // Ask user whether to apply the new model to agents / restart sessions.
    final agentProfiles = configManager.config.agentProfiles;
    final result = await showDialog<_DefaultModelAction>(
      context: context,
      builder: (ctx) {
        bool setDefault = true;
        bool updateAgents = agentProfiles.isNotEmpty;
        bool newSessions = false;
        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            title: Text(context.l10n.applyModelQuestion(modelEntry.modelName)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(context.l10n.setAsDefaultModel),
                  subtitle: Text(context.l10n.usedByAgentsWithout),
                  value: setDefault,
                  onChanged: (v) => setDialogState(() {
                    setDefault = v ?? false;
                    if (!setDefault) updateAgents = false;
                  }),
                ),
                if (agentProfiles.isNotEmpty)
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                        context.l10n.applyToAgents(agentProfiles.length)),
                    subtitle: Text(
                      agentProfiles.map((a) => '${a.emoji} ${a.name}').join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: updateAgents,
                    onChanged: setDefault
                        ? (v) => setDialogState(() => updateAgents = v ?? false)
                        : null,
                  ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(context.l10n.startNewSessions),
                  subtitle: Text(context.l10n.currentConversationsArchived),
                  value: newSessions,
                  onChanged: (v) => setDialogState(() => newSessions = v ?? false),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(context.l10n.skip)),
              FilledButton(
                onPressed: () => Navigator.pop(
                  ctx,
                  _DefaultModelAction(
                      updateAgents: setDefault && updateAgents,
                      startNewSessions: newSessions,
                      setAsDefault: setDefault),
                ),
                child: Text(context.l10n.applyAction),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      var cfg = configManager.config;
      if (result.setAsDefault) {
        cfg = cfg.copyWith(
          agents: cfg.agents.copyWith(
            defaults: cfg.agents.defaults
                .copyWith(modelName: modelEntry.modelName),
          ),
        );
      }
      if (result.updateAgents) {
        cfg = cfg.copyWith(
          agentProfiles: cfg.agentProfiles
              .map((a) => a.copyWith(modelName: modelEntry.modelName))
              .toList(),
        );
      }
      if (result.setAsDefault || result.updateAgents) {
        configManager.update(cfg);
        await configManager.save();
      }
      if (result.startNewSessions && mounted) {
        ref.read(chatProvider.notifier).clear();
      }
    }

    widget.onModelAdded();
    if (mounted) Navigator.pop(context);
  }
}

// ---------------------------------------------------------------------------
// Shared sub-widgets
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
        borderRadius: BorderRadius.circular(AppTokens.radiusSM),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTokens.radiusSM),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTokens.radiusSM),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(children: [
              ProviderBrandIcon(
                provider: provider,
                size: 20,
                iconColor:
                    isSelected ? colors.primary : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
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
                    ]),
                    Text(provider.description,
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: colors.onSurfaceVariant,
                                )),
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check_circle, color: colors.primary, size: 20),
            ]),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(model.displayName,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  )),
                      if (model.isFree) ...[
                        const SizedBox(width: 8),
                        _FreeBadge(),
                      ],
                      if (model.supportsLive) ...[
                        const SizedBox(width: 6),
                        _LiveBadge(),
                      ],
                    ]),
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
            ]),
          ),
        ),
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(AppTokens.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.spatial_audio, size: 9, color: Colors.deepPurple.shade800),
          const SizedBox(width: 3),
          Text(
            'LIVE',
            style: TextStyle(
              color: Colors.deepPurple.shade800,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
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
        borderRadius: BorderRadius.circular(AppTokens.radiusPill),
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

class _ModelCapabilityIcons extends StatelessWidget {
  final CatalogModel model;
  const _ModelCapabilityIcons({required this.model});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(children: [
      Icon(Icons.text_fields, size: 13, color: colors.onSurfaceVariant),
      if (model.supportsVision) ...[
        const SizedBox(width: 5),
        Icon(Icons.image_outlined, size: 13, color: Colors.blue.shade400),
      ],
      if (model.supportsAudio) ...[
        const SizedBox(width: 5),
        Icon(Icons.mic_outlined, size: 13, color: Colors.orange.shade400),
      ],
      if (model.supportsLive) ...[
        const SizedBox(width: 5),
        Icon(Icons.spatial_audio, size: 13, color: Colors.deepPurple.shade400),
      ],
    ]);
  }
}

// ---------------------------------------------------------------------------
// OpenRouter model search with autocomplete
// ---------------------------------------------------------------------------

class _OpenRouterModelSearch extends ConsumerStatefulWidget {
  final void Function(String id, String displayName) onModelSelected;
  final String? selectedModelId;

  const _OpenRouterModelSearch({
    required this.onModelSelected,
    this.selectedModelId,
  });

  @override
  ConsumerState<_OpenRouterModelSearch> createState() =>
      _OpenRouterModelSearchState();
}

class _OpenRouterModelSearchState
    extends ConsumerState<_OpenRouterModelSearch> {
  List<DiscoveredModel> _allModels = [];
  List<DiscoveredModel> _filtered = [];
  bool _loading = true;
  String _query = '';
  final _searchCtl = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadModels();
  }

  @override
  void dispose() {
    _searchCtl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadModels({bool forceRefresh = false}) async {
    if (forceRefresh) setState(() => _loading = true);
    final svc = ref.read(modelDiscoveryServiceProvider);
    final config = ref.read(configManagerProvider).config;
    final apiKey =
        config.providerCredentials['openrouter']?.apiKey ?? '';
    final models =
        await svc.getOpenRouterModels(apiKey: apiKey, forceRefresh: forceRefresh);
    if (!mounted) return;
    setState(() {
      _allModels = models;
      _loading = false;
    });
    _filter(_query);
  }

  void _filter(String query) {
    final q = query.toLowerCase();
    setState(() {
      _query = query;
      if (q.isEmpty) {
        _filtered = _allModels;
      } else {
        _filtered = _allModels
            .where((m) =>
                m.id.toLowerCase().contains(q) ||
                m.displayName.toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Featured routers
        ...ModelCatalog.chatCatalogModelsForProvider('openrouter')
            .map((m) => _ModelChip(
                  model: m,
                  isSelected: widget.selectedModelId == m.id,
                  onTap: () =>
                      widget.onModelSelected(m.id, m.displayName),
                )),
        const SizedBox(height: 12),
        // Search field + manual cache refresh
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _searchCtl,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: context.l10n.searchModels,
                  hintText: 'anthropic/claude, deepseek, llama...',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchCtl.clear();
                            _filter('');
                          },
                        )
                      : null,
                ),
                onChanged: _filter,
              ),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: context.l10n.refreshModels,
              onPressed:
                  _loading ? null : () => _loadModels(forceRefresh: true),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_loading)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (_filtered.isEmpty && _query.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  context.l10n.noModelsFound,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.useCustomIdHint,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => widget.onModelSelected(
                    _query.trim(),
                    _query.trim(),
                  ),
                  child: Text(
                      '${context.l10n.useModelId}: ${_query.trim()}'),
                ),
              ],
            ),
          )
        else
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filtered.length > 50 ? 50 : _filtered.length,
              itemBuilder: (ctx, i) {
                final m = _filtered[i];
                final isSelected = widget.selectedModelId == m.id;
                return _OpenRouterModelTile(
                  model: m,
                  isSelected: isSelected,
                  onTap: () =>
                      widget.onModelSelected(m.id, m.displayName),
                );
              },
            ),
          ),
        if (!_loading && _query.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '${_allModels.length} ${context.l10n.modelsAvailable}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}

class _OpenRouterModelTile extends StatelessWidget {
  final DiscoveredModel model;
  final bool isSelected;
  final VoidCallback onTap;

  const _OpenRouterModelTile({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: isSelected
            ? colors.primaryContainer
            : colors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Flexible(
                        child: Text(
                          model.displayName,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (model.isFree) ...[
                        const SizedBox(width: 6),
                        _FreeBadge(),
                      ],
                    ]),
                    const SizedBox(height: 2),
                    Row(children: [
                      Icon(Icons.text_fields,
                          size: 11, color: colors.onSurfaceVariant),
                      if (model.inputModalities.contains('image')) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.image_outlined,
                            size: 11, color: Colors.blue.shade400),
                      ],
                      if (model.inputModalities.contains('audio')) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.mic_outlined,
                            size: 11, color: Colors.orange.shade400),
                      ],
                      const SizedBox(width: 8),
                      Text(
                        model.id,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (model.contextWindow > 0)
                    Text(
                      ModelCatalog.formatContext(model.contextWindow),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  if (model.pricingPrompt > 0)
                    Text(
                      '\$${model.pricingPrompt.toStringAsFixed(2)}/M',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontSize: 9,
                      ),
                    ),
                ],
              ),
              if (isSelected) ...[
                const SizedBox(width: 6),
                Icon(Icons.check_circle, color: colors.primary, size: 18),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}
