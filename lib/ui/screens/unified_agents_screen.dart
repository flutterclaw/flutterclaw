import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'package:flutterclaw/ui/widgets/empty_state.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/utils/session_display.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(AppTokens.spacingLG),
          child: EmptyState.loading(),
        ),
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
                      label: context.l10n.workspaceFiles,
                      onPressed: () => _showWorkspaceSheet(context, colors),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _AgentQuickButton(
                      icon: Icons.schedule_outlined,
                      label: context.l10n.scheduledTasks,
                      onPressed: () => _showCronSheet(context, theme, colors),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _AgentQuickButton(
                      icon: Icons.extension_outlined,
                      label: context.l10n.skills,
                      onPressed: () => _showSkillsSheet(context, theme, colors),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Active sessions (limited to 5)
              _buildSectionHeader(context, context.l10n.activeSessions, Icons.chat_outlined),
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
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const CreateAgentScreen()),
        ),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.createAgent),
      ),
      body: EmptyState(
        icon: Icons.group_outlined,
        title: context.l10n.noAgentsYet,
        subtitle: context.l10n.createYourFirstAgent,
        actionLabel: context.l10n.createAgent,
        onAction: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const CreateAgentScreen()),
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
              // Agent emoji with gradient background + active badge
              Stack(
                children: [
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
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.surface,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Agent info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeAgent.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (activeAgent.isDefault) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              context.l10n.defaultBadge,
                              style: TextStyle(
                                color: colors.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        Flexible(
                          child: Text(
                            '${activeAgent.modelName} • ${activeAgent.vibe ?? "AI Assistant"}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.unfold_more,
                color: colors.onSurfaceVariant,
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
            context.l10n.noActiveSessions,
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
        ),
      );
    }

    final activeAgent = ref.watch(activeAgentProvider);
    final agents = ref.watch(agentProfilesProvider);
    final configManager = ref.read(configManagerProvider);
    final sessionManager = ref.read(sessionManagerProvider);

    return Card(
      child: Column(
        children: _sessions.take(5).map((session) {
          final label = SessionDisplay.title(
            context.l10n,
            session.key,
            meta: session,
            agents: agents,
            activeAgent: activeAgent,
          );
          final modelName = resolveSessionModelName(
            session.key,
            configManager,
            sessionManager,
          );
          return ListTile(
            dense: true,
            leading: Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: colors.onSurfaceVariant,
            ),
            title: Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '${SessionDisplay.subtitle(context.l10n, session, modelName)}\n${context.l10n.sessionDetailKey(session.key)}',
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
                      title: Text(context.l10n.resetSession),
                      content: Text(context.l10n.resetSessionConfirm(label)),
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
                        SnackBar(content: Text(context.l10n.sessionReset)),
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

  Widget _buildSkillsCardWithCallback(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
    void Function(void Function())? setSheetState,
  ) {
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
                if (skill.location == 'workspace')
                  IconButton(
                    icon: Icon(Icons.delete_outline, size: 20, color: colors.error),
                    onPressed: () async {
                      final removed = await _confirmRemoveSkill(context, skill.name);
                      if (removed && setSheetState != null) {
                        setSheetState(() {});
                      }
                    },
                    tooltip: context.l10n.delete,
                  ),
                Switch(
                  value: skill.enabled,
                  onChanged: (val) {
                    skillsService.toggleSkill(skill.name, val);
                    if (setSheetState != null) {
                      setSheetState(() {});
                    } else {
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            onTap: () => _showSkillContent(context, skill),
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
    // Reload workspace files from disk before showing the sheet
    _loadAgentData().then((_) {
      if (!context.mounted) return;
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
                child: Text(context.l10n.workspaceFiles,
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
    });
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
                    child: Text(context.l10n.scheduledTasks,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _showAddCronJob(context),
                    tooltip: context.l10n.addScheduledTasks,
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
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => DraggableScrollableSheet(
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
                      child: Text(context.l10n.skills,
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.pop(ctx);
                        _showClawHubBrowser(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.explore, size: 18),
                          SizedBox(width: 6),
                          Text(context.l10n.browseLabel),
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
                  children: [_buildSkillsCardWithCallback(context, theme, colors, setSheetState)],
                ),
              ),
            ],
          ),
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
            ...agents.indexed.map((entry) {
              final (i, agent) = entry;
              final isActive = agent.id == activeAgent.id;
              return ListTile(
                leading: Container(
                  width: AppTokens.touchTargetSM,
                  height: AppTokens.touchTargetSM,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppTokens.radiusMD),
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
                  if (!isActive) await _switchAgent(agent);
                },
              )
                  .animate()
                  .fadeIn(
                    delay: Duration(milliseconds: i * 40),
                    duration: AppTokens.durationFast,
                  )
                  .slideY(
                    begin: 0.06,
                    delay: Duration(milliseconds: i * 40),
                    duration: AppTokens.durationFast,
                    curve: Curves.easeOutCubic,
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

      // Update Live Activity with the new agent's model if gateway is running
      final gatewayState = ref.read(gatewayStateProvider);
      if (gatewayState.isRunning) {
        ref.read(gatewayStateProvider.notifier).setModel(agent.modelName);
      }

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
          SnackBar(content: Text(context.l10n.errorGeneric(e.toString()))),
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
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: context.l10n.editFileContentHint,
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
          SnackBar(content: Text(context.l10n.fileSaved(fileName))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorSavingFile(e.toString()))),
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
    ref.invalidate(activeAgentProvider);
    ref.invalidate(activeWorkspacePathProvider);
    ref.invalidate(activeModelSupportsVisionProvider);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.switchedToAgent(agent.name))),
      );
    }
  }

  Future<void> _confirmDeleteAgent(BuildContext context, AgentProfile agent) async {
    final agents = ref.read(agentProfilesProvider);
    if (agents.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.cannotDeleteLastAgent)),
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

  Future<bool> _confirmRemoveSkill(BuildContext context, String name) async {
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
    if (confirmed != true) return false;

    final skillsService = ref.read(skillsServiceProvider);
    await skillsService.removeSkill(name);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.skillRemoved(name))),
      );
    }

    if (mounted) {
      setState(() {});
    }
    return true;
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
                              context.l10n.clawHubLoginHint,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 8),
                          FilledButton.tonal(
                            onPressed: () => _showClawHubAuth(context),
                            child: Text(context.l10n.login),
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
          title: Text(context.l10n.clawHubAccount),
          content: Text(context.l10n.loggedInToClawHub),
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
                    SnackBar(content: Text(context.l10n.loggedOutFromClawHub)),
                  );
                }
                setState(() {});
              },
              child: Text(context.l10n.logout),
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
                context.l10n.connectToClawHub,
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: tokenCtl,
                decoration: InputDecoration(
                  labelText: context.l10n.apiTokenLabel,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  hintText: context.l10n.pasteClawHubToken,
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
                    : Text(context.l10n.connect),
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
                                  title: Text(ctx.l10n.incompatibleSkill),
                                  content: Text(
                                    ctx.l10n.incompatibleSkillDesc(compat.reason),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(dCtx),
                                      child: Text(ctx.l10n.ok),
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
                                title: Text(context.l10n.compatibilityWarning),
                                content: Text(
                                  context.l10n.compatibilityWarningDesc(compat.reason),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(dCtx, 'cancel'),
                                    child: Text(context.l10n.cancel),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(dCtx, 'original'),
                                    child: Text(context.l10n.installOriginal),
                                  ),
                                  FilledButton(
                                    onPressed: compat.adaptedContent != null
                                        ? () => Navigator.pop(dCtx, 'adapt')
                                        : null,
                                    child: Text(context.l10n.installAdapted),
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
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Text(context.l10n.installSkill),
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
