import 'package:flutter/material.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';

class CompletionSummary {
  final String providerName;
  final String modelName;
  final bool isFreeModel;
  final String gatewayHost;
  final int gatewayPort;
  final bool telegramEnabled;
  final bool discordEnabled;
  final bool whatsappEnabled;

  const CompletionSummary({
    required this.providerName,
    required this.modelName,
    this.isFreeModel = false,
    this.gatewayHost = '127.0.0.1',
    this.gatewayPort = 18789,
    this.telegramEnabled = false,
    this.discordEnabled = false,
    this.whatsappEnabled = false,
  });
}

class CompletionPage extends StatelessWidget {
  final CompletionSummary summary;
  final VoidCallback onStart;
  final bool isStarting;

  const CompletionPage({
    super.key,
    required this.summary,
    required this.onStart,
    this.isStarting = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.readyToGo,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.reviewConfiguration,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          // Summary cards
          _SummaryCard(
            icon: Icons.smart_toy,
            title: context.l10n.model,
            children: [
              Row(
                children: [
                  Text(
                    summary.modelName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (summary.isFreeModel) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 1,
                      ),
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
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Text(
                context.l10n.viaProvider(summary.providerName),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _SummaryCard(
            icon: Icons.hub,
            title: context.l10n.gateway,
            children: [
              Text(
                'ws://${summary.gatewayHost}:${summary.gatewayPort}',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _SummaryCard(
            icon: Icons.chat,
            title: context.l10n.channelsPageTitle,
            children: [
              if (!summary.telegramEnabled &&
                  !summary.discordEnabled &&
                  !summary.whatsappEnabled)
                Text(
                  context.l10n.webChatOnly,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                )
              else ...[
                if (summary.telegramEnabled)
                  _ChannelChip(label: context.l10n.telegram, icon: Icons.send),
                if (summary.discordEnabled)
                  _ChannelChip(label: context.l10n.discord, icon: Icons.forum),
                if (summary.whatsappEnabled)
                  const _ChannelChip(label: 'WhatsApp', icon: Icons.chat),
              ],
              _ChannelChip(label: context.l10n.webChat, icon: Icons.web),
            ],
          ),

          const SizedBox(height: 20),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton.icon(
              onPressed: isStarting ? null : onStart,
              icon: isStarting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.rocket_launch),
              label: Text(
                isStarting
                    ? context.l10n.starting
                    : context.l10n.startFlutterClaw,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const _SummaryCard({
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: colors.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ChannelChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _ChannelChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
