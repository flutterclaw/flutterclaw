import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';

class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.watch(sessionManagerProvider);
    final sessions = sessionManager.listSessions();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.sessions)),
      body: sessions.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.forum_outlined,
                      size: 64, color: theme.colorScheme.primary.withAlpha(128)),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.noActiveSessions,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.startConversationToSee,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(_channelIcon(session.channelType)),
                    title: Text(
                      session.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (session.lastPreview != null)
                          Text(
                            session.lastPreview!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        Text(
                          '${context.l10n.messagesCount(session.messageCount)} · '
                          '${context.l10n.tokensCount(session.totalTokens)} · '
                          '${_timeAgo(session.lastActivity, context)}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    isThreeLine: session.lastPreview != null,
                    trailing: PopupMenuButton<String>(
                      onSelected: (action) async {
                        if (action == 'rename') {
                          final controller = TextEditingController(
                              text: session.displayName ?? '');
                          final name = await showDialog<String>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Rename session'),
                              content: TextField(
                                controller: controller,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'My conversation name',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: const Text('Cancel'),
                                ),
                                FilledButton(
                                  onPressed: () =>
                                      Navigator.pop(ctx, controller.text),
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          );
                          if (name != null) {
                            await sessionManager.renameSession(
                                session.key, name);
                          }
                        } else if (action == 'reset') {
                          await sessionManager.reset(session.key);
                        } else if (action == 'compact') {
                          await sessionManager.compact(session.key);
                        }
                      },
                      itemBuilder: (ctx) => [
                        const PopupMenuItem(
                          value: 'rename',
                          child: ListTile(
                            leading: Icon(Icons.edit_outlined),
                            title: Text('Rename'),
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
                  ),
                );
              },
            ),
    );
  }

  IconData _channelIcon(String channelType) => switch (channelType) {
        'telegram' => Icons.telegram,
        'discord' => Icons.discord,
        'webchat' => Icons.chat,
        _ => Icons.message,
      };

  String _timeAgo(DateTime dt, BuildContext context) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return context.l10n.justNow;
    if (diff.inMinutes < 60) return context.l10n.minutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return context.l10n.hoursAgo(diff.inHours);
    return context.l10n.daysAgo(diff.inDays);
  }
}
