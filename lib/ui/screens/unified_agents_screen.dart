import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/cron_service.dart';
import 'package:flutterclaw/services/skills_service.dart';
import 'package:flutterclaw/ui/screens/create_agent_screen.dart';

/// Unified agents screen combining agent list, switcher, and workspace view
class UnifiedAgentsScreen extends ConsumerStatefulWidget {
  const UnifiedAgentsScreen({super.key});

  @override
  ConsumerState<UnifiedAgentsScreen> createState() => _UnifiedAgentsScreenState();
}

class _UnifiedAgentsScreenState extends ConsumerState<UnifiedAgentsScreen> {
  Map<String, String> _files = {};
  bool _loading = true;
  List<SessionMeta> _sessions = [];

  @override
  void initState() {
    super.initState();
    _loadAgentData();
  }

  Future<void> _loadAgentData() async {
    setState(() {
      _loading = true;
    });

    final configManager = ref.read(configManagerProvider);
    final ws = await configManager.workspacePath;
    // Root workspace files
    final fileNames = [
      'IDENTITY.md',
      'SOUL.md',
      'USER.md',
      'AGENTS.md',
      'TOOLS.md',
      'HEARTBEAT.md',
    ];

    // Files in subdirectories (shown with relative path as key)
    final subFiles = [
      'memory/MEMORY.md',
    ];

    final loaded = <String, String>{};
    for (final name in fileNames) {
      try {
        final file = File('$ws/$name');
        if (await file.exists()) {
          loaded[name] = await file.readAsString();
        }
      } catch (_) {}
    }
    for (final path in subFiles) {
      try {
        final file = File('$ws/$path');
        if (await file.exists()) {
          loaded[path] = await file.readAsString();
        }
      } catch (_) {}
    }

    if (mounted) {
      final sessionManager = ref.read(sessionManagerProvider);
      setState(() {
        _files = loaded;
        _sessions = sessionManager.listSessions();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final agents = ref.watch(agentProfilesProvider);
    final activeAgent = ref.watch(activeAgentProvider);

    if (agents.isEmpty) {
      return _buildEmptyState(context, colors);
    }

    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(context.l10n.agents)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.agents),
        actions: [
          if (activeAgent != null)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    _editAgent(context, activeAgent);
                    break;
                  case 'delete':
                    _confirmDeleteAgent(context, activeAgent);
                    break;
                  case 'set_default':
                    _setAsDefault(activeAgent);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      const Icon(Icons.edit_outlined),
                      const SizedBox(width: 12),
                      Text(context.l10n.editAgent),
                    ],
                  ),
                ),
                if (!activeAgent.isDefault)
                  PopupMenuItem(
                    value: 'set_default',
                    child: Row(
                      children: [
                        const Icon(Icons.star_outline),
                        const SizedBox(width: 12),
                        Text(context.l10n.setAsDefault),
                      ],
                    ),
                  ),
                if (agents.length > 1)
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                        const SizedBox(width: 12),
                        Text(
                          context.l10n.delete,
                          style: TextStyle(color: Theme.of(context).colorScheme.error),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadAgentData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Agent switcher hero card
            _buildAgentSwitcher(context, theme, colors, agents, activeAgent),

            if (activeAgent != null) ...[
              const SizedBox(height: 12),

              // Quick-access buttons: Workspace, Tasks, Skills
              Row(
                children: [
                  Expanded(
                    child: _AgentQuickButton(
                      icon: Icons.folder_outlined,
                      label: 'Files',
                      onPressed: () => _showWorkspaceSheet(context, colors),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _AgentQuickButton(
                      icon: Icons.schedule_outlined,
                      label: 'Tasks',
                      onPressed: () => _showCronSheet(context, theme, colors),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _AgentQuickButton(
                      icon: Icons.extension_outlined,
                      label: 'Skills',
                      onPressed: () => _showSkillsSheet(context, theme, colors),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Active sessions (limited to 5)
              _buildSectionHeader(context, 'Active Sessions', Icons.chat_outlined),
              const SizedBox(height: 8),
              _buildSessionsCard(context, theme, colors),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme colors) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.agents)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const CreateAgentScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: Text(context.l10n.createAgent),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.group_outlined,
                size: 80,
                color: colors.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 24),
              Text(
                context.l10n.noAgentsYet,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.createYourFirstAgent,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgentSwitcher(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
    List<AgentProfile> agents,
    AgentProfile? activeAgent,
  ) {
    if (activeAgent == null) return const SizedBox.shrink();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showAgentPicker(context, agents, activeAgent),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Agent emoji with gradient background
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colors.primary, colors.tertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    activeAgent.emoji,
                    style: const TextStyle(fontSize: 36),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Agent info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Constrain the agent name so it cannot overflow the row
                        // when the available width is tight.
                        Flexible(
                          child: Text(
                            activeAgent.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (activeAgent.isDefault) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Default',
                              style: TextStyle(
                                color: colors.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${activeAgent.modelName} • ${activeAgent.vibe ?? "AI Assistant"}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Indicator
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.green.shade600,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          context.l10n.active,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.unfold_more,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Row(
      children: [
        Icon(icon, size: 20, color: colors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWorkspaceFiles(BuildContext context, ColorScheme colors) {
    if (_files.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'No workspace files found',
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
        ),
      ];
    }

    return _files.entries.map((entry) {
      return ListTile(
        leading: Icon(Icons.description_outlined, color: colors.primary, size: 20),
        title: Text(entry.key),
        subtitle: Text(
          '${entry.value.split('\n').length} lines',
          style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
        ),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: () => _showFileEditor(context, entry.key),
        dense: true,
      );
    }).toList();
  }

  Widget _buildSessionsCard(BuildContext context, ThemeData theme, ColorScheme colors) {
    if (_sessions.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'No active sessions',
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
        ),
      );
    }

    return Card(
      child: Column(
        children: _sessions.take(5).map((session) {
          return ListTile(
            dense: true,
            leading: Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: colors.onSurfaceVariant,
            ),
            title: Text(
              session.key,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '${session.messageCount} messages • ${session.totalTokens} tokens • ${_timeAgo(session.lastActivity)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 20),
              onSelected: (action) async {
                if (action == 'reset') {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Reset Session'),
                      content: Text('Reset session "${session.key}"? This will clear all messages.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: Text(context.l10n.cancel),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: Text(context.l10n.reset),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    final sm = ref.read(sessionManagerProvider);
                    await sm.reset(session.key);
                    await _loadAgentData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Session reset')),
                      );
                    }
                  }
                }
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  value: 'reset',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline, size: 20),
                      const SizedBox(width: 8),
                      Text(context.l10n.reset),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCronCard(BuildContext context, ThemeData theme, ColorScheme colors) {
    final cronService = ref.read(cronServiceProvider);
    final jobs = cronService.jobs;

    if (jobs.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            context.l10n.noCronJobs,
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
        ),
      );
    }

    return Card(
      child: Column(
        children: jobs.map((job) {
          final statusColor = switch (job.lastStatus.name) {
            'success' => Colors.green,
            'failed'  => Colors.red,
            'running' => Colors.orange,
            _         => colors.onSurfaceVariant,
          };
          return ListTile(
            dense: true,
            onTap: () => _showCronJobDetail(context, job),
            leading: Icon(
              job.enabled ? Icons.timer : Icons.timer_off,
              size: 20,
              color: job.enabled ? Colors.green : Colors.grey,
            ),
            title: Text(job.name, style: theme.textTheme.bodyMedium),
            subtitle: Text(
              '${job.scheduleDisplay} • ${job.lastStatus.name} • '
              'Next: ${job.nextRunAt != null ? _timeAgo(job.nextRunAt!) : "N/A"}',
              style: theme.textTheme.bodySmall?.copyWith(color: statusColor),
            ),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 20),
              onSelected: (action) async {
                if (action == 'run') {
                  await cronService.runJob(job.id);
                  setState(() {});
                } else if (action == 'toggle') {
                  await cronService.updateJob(job.id, enabled: !job.enabled);
                  setState(() {});
                } else if (action == 'delete') {
                  await cronService.removeJob(job.id);
                  setState(() {});
                }
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  value: 'run',
                  child: Row(
                    children: [
                      const Icon(Icons.play_arrow, size: 20),
                      const SizedBox(width: 8),
                      Text(context.l10n.runNow),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'toggle',
                  child: Row(
                    children: [
                      Icon(
                        job.enabled ? Icons.pause : Icons.play_arrow,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(job.enabled ? context.l10n.disable : context.l10n.enable),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.delete,
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSkillsCard(BuildContext context, ThemeData theme, ColorScheme colors) {
    final skillsService = ref.read(skillsServiceProvider);
    final skills = skillsService.skills;

    if (skills.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.extension_outlined,
                size: 40,
                color: colors.onSurfaceVariant,
              ),
              const SizedBox(height: 12),
              Text(
                context.l10n.noSkillsInstalled,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                context.l10n.browseClawHubToAdd,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => _showClawHubBrowser(context),
                icon: const Icon(Icons.explore),
                label: Text(context.l10n.browseClawHub),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: skills.map((skill) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: Text(
              skill.emoji ?? '🔧',
              style: const TextStyle(fontSize: 22),
            ),
            title: Text(skill.name),
            subtitle: Text(
              skill.description.isNotEmpty ? skill.description : skill.location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    skill.location,
                    style: theme.textTheme.labelSmall,
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: skill.enabled,
                  onChanged: (val) {
                    skillsService.toggleSkill(skill.name, val);
                    setState(() {});
                  },
                ),
              ],
            ),
            onTap: () => _showSkillContent(context, skill),
            onLongPress: skill.location == 'workspace'
                ? () => _confirmRemoveSkill(context, skill.name)
                : null,
          ),
        );
      }).toList(),
    );
  }

  void _showSkillContent(BuildContext context, Skill skill) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text('${skill.emoji ?? '🔧'} ${skill.name}'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              skill.instructions,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  void _showWorkspaceSheet(BuildContext context, ColorScheme colors) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (ctx, sc) => Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colors.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Workspace Files',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: ListView(
                controller: sc,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _buildWorkspaceFiles(context, colors),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCronSheet(BuildContext context, ThemeData theme, ColorScheme colors) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (ctx, sc) => Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colors.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Scheduled Tasks',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _showAddCronJob(context),
                    tooltip: 'Add scheduled task',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: sc,
                padding: const EdgeInsets.all(16),
                children: [_buildCronCard(context, theme, colors)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSkillsSheet(BuildContext context, ThemeData theme, ColorScheme colors) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (ctx, sc) => Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colors.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Skills',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _showClawHubBrowser(context);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.explore, size: 18),
                        SizedBox(width: 6),
                        Text('Browse'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: sc,
                padding: const EdgeInsets.all(16),
                children: [_buildSkillsCard(context, theme, colors)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAgentPicker(
    BuildContext context,
    List<AgentProfile> agents,
    AgentProfile activeAgent,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Switch Agent',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(height: 1),
            ...agents.map((agent) {
              final isActive = agent.id == activeAgent.id;
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(agent.emoji, style: const TextStyle(fontSize: 20)),
                  ),
                ),
                title: Text(agent.name),
                subtitle: Text(agent.modelName),
                trailing: isActive ? const Icon(Icons.check_circle) : null,
                onTap: () async {
                  Navigator.pop(ctx);
                  if (!isActive) {
                    await _switchAgent(agent);
                  }
                },
              );
            }),
            const Divider(height: 1),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              title: Text(context.l10n.createAgent),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.of(context)
                    .push(MaterialPageRoute<void>(
                      builder: (_) => const CreateAgentScreen(),
                    ))
                    .then((_) => _loadAgentData());
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _switchAgent(AgentProfile agent) async {
    final configManager = ref.read(configManagerProvider);
    try {
      await configManager.switchAgent(agent.id);
      ref.invalidate(activeAgentProvider);
      ref.invalidate(agentProfilesProvider);

      // Load the new agent's persisted session history in the chat tab
      await ref.read(chatProvider.notifier).switchToAgent();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.switchedToAgent(agent.name)),
          ),
        );
        await _loadAgentData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _showFileEditor(BuildContext context, String fileName) {
    final content = _files[fileName] ?? '';
    final controller = TextEditingController(text: content);

    showModalBottomSheet<void>(
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
            Text(
              fileName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLines: 15,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Edit file content...',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(context.l10n.cancel),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () async {
                    await _saveFile(fileName, controller.text);
                    if (context.mounted) {
                      Navigator.pop(ctx);
                    }
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

  Future<void> _saveFile(String fileName, String content) async {
    final configManager = ref.read(configManagerProvider);
    final ws = await configManager.workspacePath;
    try {
      final file = File('$ws/$fileName');
      await file.writeAsString(content);
      // If IDENTITY.md changed, sync name/emoji back into AgentProfile
      if (fileName == 'IDENTITY.md') {
        await configManager.syncAgentIdentitiesFromWorkspace();
        ref.invalidate(activeAgentProvider);
        ref.invalidate(agentProfilesProvider);
      }
      await _loadAgentData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$fileName saved')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving file: $e')),
        );
      }
    }
  }

  void _editAgent(BuildContext context, AgentProfile agent) {
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (_) => CreateAgentScreen(agent: agent),
          ),
        )
        .then((_) => _loadAgentData());
  }

  Future<void> _setAsDefault(AgentProfile agent) async {
    final configManager = ref.read(configManagerProvider);
    final config = configManager.config;
    final updatedProfiles = config.agentProfiles.map((a) {
      return a.copyWith(isDefault: a.id == agent.id);
    }).toList();

    configManager.update(config.copyWith(agentProfiles: updatedProfiles));
    await configManager.save();
    ref.invalidate(agentProfilesProvider);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${agent.name} set as default')),
      );
    }
  }

  Future<void> _confirmDeleteAgent(BuildContext context, AgentProfile agent) async {
    final agents = ref.read(agentProfilesProvider);
    if (agents.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot delete the last agent')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.delete),
        content: Text(context.l10n.deleteAgentConfirm(agent.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await _deleteAgent(agent);
    }
  }

  Future<void> _deleteAgent(AgentProfile agent) async {
    final configManager = ref.read(configManagerProvider);
    final config = configManager.config;

    // Remove from profiles
    final updatedProfiles =
        config.agentProfiles.where((a) => a.id != agent.id).toList();

    // Switch to first remaining agent
    final newActiveAgent = updatedProfiles.first;

    configManager.update(config.copyWith(
      agentProfiles: updatedProfiles,
      activeAgentId: newActiveAgent.id,
    ));
    await configManager.save();

    // Delete workspace directory
    try {
      final workspacePath = await configManager.getAgentWorkspace(agent.id);
      await Directory(workspacePath).delete(recursive: true);
    } catch (e) {
      // Workspace might not exist
    }

    ref.invalidate(agentProfilesProvider);
    ref.invalidate(activeAgentProvider);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.agentDeleted)),
      );
      await _loadAgentData();
    }
  }

  Future<void> _confirmRemoveSkill(BuildContext context, String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.delete),
        content: Text(context.l10n.removeSkillConfirm(name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(context.l10n.remove),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final skillsService = ref.read(skillsServiceProvider);
    await skillsService.removeSkill(name);
    setState(() {});
  }

  void _showClawHubBrowser(BuildContext context) {
    final searchCtl = TextEditingController();
    final skillsService = ref.read(skillsServiceProvider);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.clawHubSkills),
            actions: [
              IconButton(
                icon: Icon(
                  skillsService.isClawHubAuthenticated
                      ? Icons.account_circle
                      : Icons.login,
                ),
                tooltip: skillsService.isClawHubAuthenticated
                    ? 'Account'
                    : 'Login to ClawHub',
                onPressed: () => _showClawHubAuth(context),
              ),
            ],
          ),
          body: StatefulBuilder(
            builder: (ctx, setSheetState) {
              return Column(
                children: [
                  if (!skillsService.isClawHubAuthenticated)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Login to ClawHub to access premium skills',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 8),
                          FilledButton.tonal(
                            onPressed: () => _showClawHubAuth(context),
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: searchCtl,
                      decoration: InputDecoration(
                        hintText: context.l10n.searchSkills,
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => setSheetState(() {}),
                        ),
                      ),
                      onSubmitted: (_) => setSheetState(() {}),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: skillsService.searchClawHub(
                        searchCtl.text.trim().isEmpty
                            ? 'popular'
                            : searchCtl.text.trim(),
                      ),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final results = snapshot.data ?? [];
                        if (results.isEmpty) {
                          return Center(
                            child: Text(context.l10n.noSkillsFound),
                          );
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: results.length,
                          itemBuilder: (ctx, i) {
                            final skill = results[i];
                            return Card(
                              child: ListTile(
                                leading: Text(
                                  skill.emoji ?? '🔧',
                                  style: const TextStyle(fontSize: 22),
                                ),
                                title: Text(
                                  skill.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    skill.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () => _showSkillInstall(context, skill),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _showClawHubAuth(BuildContext context) {
    final skillsService = ref.read(skillsServiceProvider);

    if (skillsService.isClawHubAuthenticated) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('ClawHub Account'),
          content: const Text('You are currently logged in to ClawHub.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(context.l10n.cancel),
            ),
            FilledButton(
              onPressed: () async {
                await skillsService.logoutClawHub();
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Logged out from ClawHub')),
                  );
                }
                setState(() {});
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
      return;
    }

    final tokenCtl = TextEditingController();
    bool isLoading = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Connect to ClawHub',
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: tokenCtl,
                decoration: const InputDecoration(
                  labelText: 'API Token',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  hintText: 'Paste your ClawHub API token',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (tokenCtl.text.trim().isEmpty) return;
                        setSheetState(() => isLoading = true);
                        final result = await skillsService.authenticateClawHub(
                          token: tokenCtl.text.trim(),
                        );
                        if (ctx.mounted) {
                          setSheetState(() => isLoading = false);
                          if (result.success) {
                            Navigator.pop(ctx);
                            setState(() {});
                          }
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Connect'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSkillInstall(BuildContext context, ClawHubSkill skill) {
    bool isInstalling = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      skill.emoji ?? '🔧',
                      style: const TextStyle(fontSize: 36),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            skill.name,
                            style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (skill.author != null)
                            Text(
                              'by ${skill.author}',
                              style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                                color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (skill.description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(skill.description),
                ],
                if (skill.downloads > 0 || skill.stars > 0) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (skill.downloads > 0) ...[
                        const Icon(Icons.download, size: 14),
                        const SizedBox(width: 4),
                        Text('${skill.downloads}', style: Theme.of(ctx).textTheme.bodySmall),
                        const SizedBox(width: 12),
                      ],
                      if (skill.stars > 0) ...[
                        const Icon(Icons.star, size: 14),
                        const SizedBox(width: 4),
                        Text('${skill.stars}', style: Theme.of(ctx).textTheme.bodySmall),
                      ],
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: isInstalling
                      ? null
                      : () async {
                          setSheetState(() => isInstalling = true);
                          final skillsService = ref.read(skillsServiceProvider);

                          // Download content first for compatibility check
                          final content = await skillsService.downloadSkillContent(skill.name);
                          if (content == null) {
                            if (ctx.mounted) Navigator.pop(ctx);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(context.l10n.failedToInstallSkill(skill.name))),
                              );
                            }
                            return;
                          }

                          // Check compatibility with mobile
                          final compat = await skillsService.checkSkillCompatibility(content);

                          if (!ctx.mounted) return;

                          if (compat.verdict == SkillCompatibility.incompatible) {
                            // Block installation
                            setSheetState(() => isInstalling = false);
                            if (ctx.mounted) {
                              showDialog(
                                context: ctx,
                                builder: (dCtx) => AlertDialog(
                                  icon: const Icon(Icons.block, color: Colors.red, size: 32),
                                  title: const Text('Incompatible Skill'),
                                  content: Text(
                                    'This skill cannot run on mobile (iOS/Android).\n\n${compat.reason}',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(dCtx),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return;
                          }

                          if (compat.verdict == SkillCompatibility.adaptable) {
                            // Ask user whether to adapt or discard
                            final userChoice = await showDialog<String>(
                              context: ctx,
                              builder: (dCtx) => AlertDialog(
                                icon: const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 32),
                                title: const Text('Compatibility Warning'),
                                content: Text(
                                  'This skill was designed for desktop and may not work as-is on mobile.\n\n${compat.reason}\n\nWould you like to install an adapted version optimized for mobile?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(dCtx, 'cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(dCtx, 'original'),
                                    child: const Text('Install Original'),
                                  ),
                                  FilledButton(
                                    onPressed: compat.adaptedContent != null
                                        ? () => Navigator.pop(dCtx, 'adapt')
                                        : null,
                                    child: const Text('Install Adapted'),
                                  ),
                                ],
                              ),
                            );

                            if (userChoice == null || userChoice == 'cancel') {
                              setSheetState(() => isInstalling = false);
                              return;
                            }

                            bool ok;
                            if (userChoice == 'adapt' && compat.adaptedContent != null) {
                              ok = await skillsService.installSkillFromContent(
                                  skill.name, compat.adaptedContent!);
                            } else {
                              ok = await skillsService.installSkillFromContent(
                                  skill.name, content);
                            }

                            if (ctx.mounted) Navigator.pop(ctx);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(ok
                                      ? context.l10n.installedSkill(skill.name)
                                      : context.l10n.failedToInstallSkill(skill.name)),
                                ),
                              );
                              if (ok) setState(() {});
                            }
                            return;
                          }

                          // Compatible — install directly
                          final ok = await skillsService.installSkillFromContent(
                              skill.name, content);
                          if (ctx.mounted) Navigator.pop(ctx);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(ok
                                    ? context.l10n.installedSkill(skill.name)
                                    : context.l10n.failedToInstallSkill(skill.name)),
                              ),
                            );
                            if (ok) setState(() {});
                          }
                        },
                  child: isInstalling
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.download),
                            const SizedBox(width: 8),
                            const Text('Install'),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.isNegative) {
      final abs = diff.abs();
      if (abs.inMinutes < 60) return 'in ${abs.inMinutes}m';
      if (abs.inHours < 24) return 'in ${abs.inHours}h';
      return 'in ${abs.inDays}d';
    }
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  void _showCronJobDetail(BuildContext context, dynamic job) {
    final taskCtl = TextEditingController(text: job.task as String);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) {
          final dirty = taskCtl.text.trim() != (job.task as String).trim();
          final statusColor = switch ((job.lastStatus as dynamic).name as String) {
            'success' => Colors.green,
            'failed'  => colors.error,
            'running' => Colors.orange,
            _         => colors.onSurfaceVariant,
          };

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                    children: [
                      Expanded(
                        child: Text(
                          job.name as String,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Schedule + status chips
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        avatar: const Icon(Icons.schedule, size: 14),
                        label: Text(
                          job.scheduleDisplay as String,
                          style: theme.textTheme.labelSmall,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                      ),
                      Chip(
                        label: Text(
                          (job.lastStatus as dynamic).name as String,
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: statusColor),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                      ),
                      if ((job.runCount as int) > 0)
                        Chip(
                          avatar: const Icon(Icons.replay, size: 14),
                          label: Text(
                            '${job.runCount} runs',
                            style: theme.textTheme.labelSmall,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                    ],
                  ),
                  // Next run
                  if (job.nextRunAt != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Next run: ${_timeAgo(job.nextRunAt!)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  // Last error
                  if (job.lastError != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colors.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Last error: ${job.lastError}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  // Task prompt editor
                  Text('Task prompt', style: theme.textTheme.labelLarge),
                  const SizedBox(height: 6),
                  TextField(
                    controller: taskCtl,
                    maxLines: 8,
                    minLines: 4,
                    onChanged: (_) => setSheetState(() {}),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Instructions for the agent when this job fires…',
                      filled: true,
                      fillColor: colors.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text(context.l10n.cancel),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: dirty
                            ? () async {
                                final cronService =
                                    ref.read(cronServiceProvider);
                                await cronService.updateJob(
                                  job.id as String,
                                  task: taskCtl.text.trim(),
                                );
                                if (ctx.mounted) Navigator.pop(ctx);
                                setState(() {});
                              }
                            : null,
                        child: Text(context.l10n.save),
                      ),
                    ],
                  ),
                ],
              ),
          );
        },
      ),
    );
  }

  void _showAddCronJob(BuildContext context) {
    final nameCtl = TextEditingController();
    final taskCtl = TextEditingController();
    int intervalMinutes = 60;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.addCronJob,
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameCtl,
                decoration: InputDecoration(
                  labelText: context.l10n.jobName,
                  border: const OutlineInputBorder(),
                  hintText: context.l10n.dailySummaryExample,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: taskCtl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: context.l10n.taskPrompt,
                  border: const OutlineInputBorder(),
                  hintText: context.l10n.whatShouldAgentDo,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: intervalMinutes,
                decoration: InputDecoration(
                  labelText: context.l10n.interval,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(value: 5, child: Text(context.l10n.every5Minutes)),
                  DropdownMenuItem(value: 15, child: Text(context.l10n.every15Minutes)),
                  DropdownMenuItem(value: 30, child: Text(context.l10n.every30Minutes)),
                  DropdownMenuItem(value: 60, child: Text(context.l10n.everyHour)),
                  DropdownMenuItem(value: 360, child: Text(context.l10n.every6Hours)),
                  DropdownMenuItem(value: 720, child: Text(context.l10n.every12Hours)),
                  DropdownMenuItem(value: 1440, child: Text(context.l10n.every24Hours)),
                ],
                onChanged: (v) {
                  if (v != null) {
                    setSheetState(() => intervalMinutes = v);
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(context.l10n.cancel),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () async {
                      if (nameCtl.text.trim().isEmpty ||
                          taskCtl.text.trim().isEmpty) {
                        return;
                      }
                      final cronService = ref.read(cronServiceProvider);
                      await cronService.addJob(CronJob(
                        name: nameCtl.text.trim(),
                        task: taskCtl.text.trim(),
                        interval: Duration(minutes: intervalMinutes),
                      ));
                      if (ctx.mounted) {
                        Navigator.pop(ctx);
                      }
                      setState(() {});
                    },
                    child: Text(context.l10n.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgentQuickButton extends StatelessWidget {
  const _AgentQuickButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
