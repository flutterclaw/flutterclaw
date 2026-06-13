import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/utils/session_display.dart';
import 'package:flutterclaw/ui/widgets/channel_brand_icon.dart';

/// Combined agent + session switcher for the chat app bar.
class AgentSessionSwitcherChip extends ConsumerWidget {
  const AgentSessionSwitcherChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeKey = ref.watch(activeSessionKeyProvider);
    final sessionsAsync = ref.watch(activeSessionsProvider);
    final agents = ref.watch(agentProfilesProvider);
    final activeAgent = ref.watch(activeAgentProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final sessions = sessionsAsync.asData?.value ?? [];
    final activeSession =
        sessions.where((s) => s.key == activeKey).firstOrNull;
    final isLive = activeSession != null &&
        DateTime.now().difference(activeSession.lastActivity).inSeconds < 60;

    final agentLabel = activeAgent != null
        ? '${activeAgent.emoji} ${activeAgent.name}'
        : context.l10n.agentsSection;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => _showPicker(
            context,
            ref,
            sessions,
            agents,
            activeAgent,
            activeKey,
          ),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (activeAgent != null)
                  Text(
                    activeAgent.emoji,
                    style: const TextStyle(fontSize: 16),
                  )
                else
                  ChannelBrandIcon(
                    channelType: activeKey.split(':').first,
                    size: 18,
                    iconColor: colors.onSecondaryContainer,
                  ),
                const SizedBox(width: 6),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    agentLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.onSecondaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isLive) ...[
                  const SizedBox(width: 6),
                  _LiveDot(color: colors.primary),
                ],
                const SizedBox(width: 4),
                Icon(
                  Icons.unfold_more,
                  size: 16,
                  color: colors.onSecondaryContainer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(
    BuildContext context,
    WidgetRef ref,
    List<SessionMeta> sessions,
    List<AgentProfile> agents,
    AgentProfile? activeAgent,
    String activeKey,
  ) {
    final configManager = ref.read(configManagerProvider);
    final sessionManager = ref.read(sessionManagerProvider);
    String resolveModel(SessionMeta s) =>
        resolveSessionModelName(s.key, configManager, sessionManager);

    final visible = sessions
        .where((s) => !s.key.startsWith('agent:'))
        .toList()
      ..sort((a, b) => b.lastActivity.compareTo(a.lastActivity));

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(ctx).size.height * 0.75,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  context.l10n.switchAgentOrSession,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Divider(height: 1),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                      child: Text(
                        context.l10n.agentsSection,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    for (final agent in agents)
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(agent.emoji),
                        ),
                        title: Text(agent.name),
                        subtitle: Text(agent.modelName),
                        trailing: agent.id == activeAgent?.id
                            ? Icon(
                                Icons.check_circle,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : null,
                        onTap: () async {
                          Navigator.pop(ctx);
                          if (agent.id == activeAgent?.id) return;
                          final cm = ref.read(configManagerProvider);
                          await cm.switchAgent(agent.id);
                          ref.invalidate(activeAgentProvider);
                          ref.invalidate(agentProfilesProvider);
                          await ref.read(chatProvider.notifier).switchToAgent();
                        },
                      ),
                    const Divider(height: 24),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                      child: Text(
                        context.l10n.sessions,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    if (visible.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          context.l10n.noActiveSessions,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        ),
                      )
                    else
                      for (final session in visible)
                        _SessionTile(
                          session: session,
                          isActive: session.key == activeKey,
                          label: SessionDisplay.title(
                            context.l10n,
                            session.key,
                            meta: session,
                            agents: agents,
                            activeAgent: activeAgent,
                          ),
                          subtitle: SessionDisplay.subtitle(
                            context.l10n,
                            session,
                            resolveModel(session),
                          ),
                          detailKey: context.l10n.sessionDetailKey(session.key),
                          onTap: () async {
                            Navigator.pop(ctx);
                            if (session.key != activeKey) {
                              await ref
                                  .read(chatProvider.notifier)
                                  .switchToSession(session.key);
                            }
                          },
                          onAction: (action) => _handleSessionAction(
                            ctx,
                            ref,
                            session,
                            session.key == activeKey,
                            action,
                          ),
                        ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSessionAction(
    BuildContext sheetCtx,
    WidgetRef ref,
    SessionMeta session,
    bool isActive,
    String action,
  ) async {
    final sessionManager = ref.read(sessionManagerProvider);
    final l10n = sheetCtx.l10n;
    final messenger = ScaffoldMessenger.of(sheetCtx);

    switch (action) {
      case 'rename':
        final controller =
            TextEditingController(text: session.displayName ?? '');
        final name = await showDialog<String>(
          context: sheetCtx,
          builder: (dCtx) => AlertDialog(
            title: Text(l10n.renameSession),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: l10n.myConversationName),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dCtx),
                child: Text(l10n.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dCtx, controller.text),
                child: Text(l10n.save),
              ),
            ],
          ),
        );
        if (name != null) {
          await sessionManager.renameSession(session.key, name);
        }
        if (sheetCtx.mounted) Navigator.pop(sheetCtx);
      case 'compact':
        if (sheetCtx.mounted) Navigator.pop(sheetCtx);
        final summary =
            await ref.read(agentLoopProvider).compactSession(session.key);
        messenger.showSnackBar(SnackBar(
          content: Text(
              summary != null ? l10n.contextCompacted : l10n.compactionFailed),
        ));
        if (summary != null && isActive) {
          await ref.read(chatProvider.notifier).switchToSession(session.key);
        }
      case 'reset':
        if (sheetCtx.mounted) Navigator.pop(sheetCtx);
        if (isActive) {
          await ref.read(chatProvider.notifier).startNewSession();
        } else {
          await sessionManager.reset(session.key);
        }
    }
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.session,
    required this.isActive,
    required this.label,
    required this.subtitle,
    required this.detailKey,
    required this.onTap,
    required this.onAction,
  });

  final SessionMeta session;
  final bool isActive;
  final String label;
  final String subtitle;
  final String detailKey;
  final VoidCallback onTap;
  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    final channel = session.key.split(':').first;
    final scheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive
              ? scheme.primaryContainer
              : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ChannelBrandIcon(
            channelType: channel,
            size: 22,
            iconColor:
                isActive ? scheme.primary : scheme.onSurfaceVariant,
          ),
        ),
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: isActive ? FontWeight.w600 : null,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          Text(
            detailKey,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Icon(Icons.check_circle, color: scheme.primary),
          PopupMenuButton<String>(
            onSelected: onAction,
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'rename',
                child: ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: Text(context.l10n.renameAction),
                  dense: true,
                ),
              ),
              PopupMenuItem(
                value: 'compact',
                child: ListTile(
                  leading: const Icon(Icons.compress),
                  title: Text(context.l10n.compact),
                  dense: true,
                ),
              ),
              PopupMenuItem(
                value: 'reset',
                child: ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: Text(context.l10n.reset),
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class _LiveDot extends StatefulWidget {
  final Color color;
  const _LiveDot({required this.color});

  @override
  State<_LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<_LiveDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color
              .withValues(alpha: 0.4 + _controller.value * 0.6),
        ),
      ),
    );
  }
}

/// Back-compat alias — this chip switches agents and sessions.
typedef SessionSwitcherChip = AgentSessionSwitcherChip;
