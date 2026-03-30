import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/screens/settings/providers_models_screen.dart';

class CreateAgentScreen extends ConsumerStatefulWidget {
  final AgentProfile? agent;

  const CreateAgentScreen({super.key, this.agent});

  @override
  ConsumerState<CreateAgentScreen> createState() => _CreateAgentScreenState();
}

class _CreateAgentScreenState extends ConsumerState<CreateAgentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _vibeController;
  late TextEditingController _temperatureController;
  late TextEditingController _maxTokensController;
  late TextEditingController _maxIterationsController;

  String _selectedEmoji = '🤖';
  String? _selectedModel;
  double _temperature = 0.7;
  int _maxTokens = 8192;
  int _maxIterations = 20;
  bool _restrictToWorkspace = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final agent = widget.agent;

    _nameController = TextEditingController(text: agent?.name ?? '');
    _vibeController = TextEditingController(text: agent?.vibe ?? '');
    _temperatureController = TextEditingController(
      text: (agent?.temperature ?? 0.7).toStringAsFixed(1),
    );
    _maxTokensController = TextEditingController(
      text: (agent?.maxTokens ?? 8192).toString(),
    );
    _maxIterationsController = TextEditingController(
      text: (agent?.maxToolIterations ?? 20).toString(),
    );

    if (agent != null) {
      _selectedEmoji = agent.emoji;
      _selectedModel = agent.modelName;
      _temperature = agent.temperature;
      _maxTokens = agent.maxTokens;
      _maxIterations = agent.maxToolIterations;
      _restrictToWorkspace = agent.restrictToWorkspace;

      // If vibe wasn't stored in config, try to read it from IDENTITY.md
      if (agent.vibe == null) {
        _loadVibeFromIdentityFile(agent);
      }
    }
  }

  Future<void> _loadVibeFromIdentityFile(AgentProfile agent) async {
    try {
      final configManager = ref.read(configManagerProvider);
      final ws = await configManager.getAgentWorkspace(agent.id);
      final identityFile = File('$ws/IDENTITY.md');
      if (!await identityFile.exists()) return;
      final content = await identityFile.readAsString();
      final match = RegExp(r'^Vibe:\s*(.+)$', multiLine: true).firstMatch(content);
      final vibe = match?.group(1)?.trim();
      if (vibe != null && vibe.isNotEmpty && mounted) {
        setState(() => _vibeController.text = vibe);
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _nameController.dispose();
    _vibeController.dispose();
    _temperatureController.dispose();
    _maxTokensController.dispose();
    _maxIterationsController.dispose();
    super.dispose();
  }

  bool get _isEditMode => widget.agent != null;

  bool _fixedLiveModelSelection = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fixedLiveModelSelection) return;
    _fixedLiveModelSelection = true;
    final config = ref.read(configManagerProvider).config;
    final chat =
        config.modelList.where((m) => !m.isLiveOnly).toList();
    if (_selectedModel != null &&
        chat.isNotEmpty &&
        !chat.any((m) => m.modelName == _selectedModel)) {
      setState(() => _selectedModel = chat.first.modelName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final configManager = ref.read(configManagerProvider);
    final models = configManager.config.modelList
        .where((m) => !m.isLiveOnly)
        .toList();

    // Set default model if not already set
    if (_selectedModel == null && models.isNotEmpty) {
      _selectedModel = models.first.modelName;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? context.l10n.editAgent : context.l10n.createAgent),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            TextButton(
              onPressed: _saveAgent,
              child: Text(context.l10n.save),
            ),
        ],
      ),
      body: models.isEmpty
          ? _buildNoModelsState(context, colors)
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildBasicInfoSection(context, theme, colors),
                  const SizedBox(height: 24),
                  _buildModelSection(context, theme, colors, models),
                  const SizedBox(height: 24),
                  _buildAdvancedSection(context, theme, colors),
                ],
              ),
            ),
    );
  }

  Widget _buildNoModelsState(BuildContext context, ColorScheme colors) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 64,
              color: Colors.orange.shade700,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.noModelsConfigured,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.noModelsConfiguredLong,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const ProvidersModelsScreen()),
              ),
              icon: const Icon(Icons.add),
              label: Text(context.l10n.addModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.basicInformation,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: context.l10n.agentName,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.badge_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.nameIsRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _selectedEmoji,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              title: Text(context.l10n.emoji),
              subtitle: Text(context.l10n.selectEmoji),
              trailing: const Icon(Icons.chevron_right),
              onTap: _showEmojiPicker,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _vibeController,
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(
                labelText: context.l10n.vibe,
                hintText: context.l10n.vibeHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Icon(Icons.mood_outlined),
                ),
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModelSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
    List models,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.modelConfiguration,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedModel,
              decoration: InputDecoration(
                labelText: context.l10n.model,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.psychology_outlined),
              ),
              items: models.map((model) {
                final input = ModelCatalog.inputFor(model.modelName);
                final supportsVision = input?.contains('image') ?? false;
                final supportsAudio = input?.contains('audio') ?? false;
                return DropdownMenuItem<String>(
                  value: model.modelName,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(model.modelName, overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.text_fields, size: 14, color: Colors.grey.shade500),
                      if (supportsVision) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.image_outlined, size: 14, color: Colors.blue.shade400),
                      ],
                      if (supportsAudio) ...[
                        const SizedBox(width: 4),
                        Icon(Icons.mic_outlined, size: 14, color: Colors.orange.shade400),
                      ],
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedModel = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return context.l10n.pleaseSelectModel;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.temperatureLabel(_temperature.toStringAsFixed(1)),
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  _temperatureDescription(_temperature),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Slider(
              value: _temperature.clamp(0.0, 1.0),
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: _temperature.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _temperature = value;
                  _temperatureController.text = value.toStringAsFixed(1);
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.focusedLabel, style: theme.textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant)),
                Text(context.l10n.balancedLabel, style: theme.textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant)),
                Text(context.l10n.creativeLabel, style: theme.textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant)),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _maxTokensController,
              decoration: InputDecoration(
                labelText: context.l10n.maxTokens,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.data_usage_outlined),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.maxTokensRequired;
                }
                final tokens = int.tryParse(value);
                if (tokens == null || tokens < 1) {
                  return context.l10n.mustBePositiveNumber;
                }
                return null;
              },
              onChanged: (value) {
                final tokens = int.tryParse(value);
                if (tokens != null) {
                  _maxTokens = tokens;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
  ) {
    return Card(
      child: ExpansionTile(
        title: Text(
          context.l10n.advancedSettings,
          style: theme.textTheme.titleMedium?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _maxIterationsController,
                  decoration: InputDecoration(
                    labelText: context.l10n.maxToolIterations,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.repeat_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.maxIterationsRequired;
                    }
                    final iter = int.tryParse(value);
                    if (iter == null || iter < 1) {
                      return context.l10n.mustBePositiveNumber;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final iter = int.tryParse(value);
                    if (iter != null) {
                      _maxIterations = iter;
                    }
                  },
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: Text(context.l10n.restrictToWorkspace),
                  subtitle: Text(context.l10n.restrictToWorkspaceDesc),
                  value: _restrictToWorkspace,
                  onChanged: (value) {
                    setState(() {
                      _restrictToWorkspace = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _temperatureDescription(double t) {
    if (t <= 0.2) return context.l10n.focusedLabel;
    if (t <= 0.5) return context.l10n.preciseLabel;
    if (t <= 0.7) return context.l10n.balancedLabel;
    if (t <= 0.9) return context.l10n.expressiveLabel;
    return context.l10n.creativeLabel;
  }

  void _showEmojiPicker() {
    const emojis = [
      // People & Roles
      '🤖', '💻', '✍️', '🎨', '🔬', '📚', '🎭', '🎵', '🏃', '💼',
      '👨‍💻', '👩‍💻', '🧑‍🔬', '🧑‍🎨', '🧑‍🏫', '🧑‍⚕️', '🧑‍🍳', '🧑‍🚀', '🕵️', '🦸',
      // Objects & Tools
      '🌟', '🔥', '💡', '🚀', '🎯', '🧠', '💬', '📱', '⚡', '🌈',
      '🎓', '🏆', '💪', '🔧', '📊', '🗂️', '📝', '🔍', '💰', '🛡️',
      // Nature
      '🌿', '🦋', '🐉', '🦁', '🐺', '🦊', '🐘', '🦅', '🐬', '🌸',
      // Activities
      '🎪', '🎬', '📷', '🎮', '🏀', '⚽', '🎸', '🎲', '🎯', '🏄',
      // Symbols
      '💎', '🔮', '⚗️', '🧬', '🌍', '☀️', '🌙', '⭐', '🎭', '🃏',
    ];

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.selectEmoji,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1.1,
                ),
                itemCount: emojis.length,
                itemBuilder: (context, index) {
                  final emoji = emojis[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedEmoji = emoji;
                      });
                      Navigator.pop(ctx);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedEmoji == emoji
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedEmoji == emoji
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveAgent() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final configManager = ref.read(configManagerProvider);
      final config = configManager.config;

      if (_isEditMode) {
        final newName = _nameController.text.trim();
        final newVibe = _vibeController.text.trim().isEmpty
            ? null
            : _vibeController.text.trim();

        // Update existing agent
        final updatedProfiles = config.agentProfiles.map((a) {
          if (a.id == widget.agent!.id) {
            return a.copyWith(
              name: newName,
              emoji: _selectedEmoji,
              modelName: _selectedModel!,
              temperature: _temperature,
              maxTokens: _maxTokens,
              maxToolIterations: _maxIterations,
              restrictToWorkspace: _restrictToWorkspace,
              vibe: newVibe,
            );
          }
          return a;
        }).toList();

        configManager.update(config.copyWith(agentProfiles: updatedProfiles));
        await configManager.save();
        ref.invalidate(agentProfilesProvider);
        ref.invalidate(activeAgentProvider);
        ref.invalidate(activeWorkspacePathProvider);
        ref.invalidate(activeModelSupportsVisionProvider);

        // Sync Live Activity if this is the active agent and gateway is running
        final activeAgent = ref.read(activeAgentProvider);
        final gatewayState = ref.read(gatewayStateProvider);
        if (activeAgent?.id == widget.agent!.id && gatewayState.isRunning) {
          ref.read(gatewayStateProvider.notifier).setModel(_selectedModel!);
        }

        // Keep IDENTITY.md in sync so the agent's self-identity matches the profile
        try {
          final ws = await configManager.getAgentWorkspace(widget.agent!.id);
          final identityFile = File('$ws/IDENTITY.md');
          if (await identityFile.exists()) {
            var content = await identityFile.readAsString();
            content = ConfigManager.updateIdentityField(content, 'Name', newName);
            content = ConfigManager.updateIdentityField(content, 'Emoji', _selectedEmoji);
            content = ConfigManager.updateIdentityField(content, 'Model', _selectedModel!);
            if (newVibe != null) {
              content = ConfigManager.updateIdentityField(content, 'Vibe', newVibe);
            }
            await identityFile.writeAsString(content);
          }
        } catch (_) {}

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.agentUpdated)),
          );
          Navigator.pop(context);
        }
      } else {
        // Create new agent
        final newAgent = AgentProfile.create(
          name: _nameController.text.trim(),
          emoji: _selectedEmoji,
          modelName: _selectedModel!,
          temperature: _temperature,
          maxTokens: _maxTokens,
          maxToolIterations: _maxIterations,
          restrictToWorkspace: _restrictToWorkspace,
          vibe: _vibeController.text.trim().isEmpty
              ? null
              : _vibeController.text.trim(),
        );

        // Create workspace
        await configManager.createAgentWorkspace(newAgent);

        // Add to config and set as active
        final updatedProfiles = [...config.agentProfiles, newAgent];
        configManager.update(config.copyWith(
          agentProfiles: updatedProfiles,
          // Always set new agent as active
          activeAgentId: newAgent.id,
        ));
        await configManager.save();
        ref.invalidate(agentProfilesProvider);
        ref.invalidate(activeAgentProvider);
        ref.invalidate(activeWorkspacePathProvider);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.agentCreated)),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorGeneric(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
