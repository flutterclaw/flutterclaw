/// Credentials settings screen — manage multiple API keys per provider
/// with round-robin rotation and cooldown status display.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/auth_profile.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/auth_profile_service.dart';

class CredentialsScreen extends ConsumerStatefulWidget {
  const CredentialsScreen({super.key});

  @override
  ConsumerState<CredentialsScreen> createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends ConsumerState<CredentialsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profilesAsync = ref.watch(authProfileServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.credentialsScreenTitle)),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(context.l10n.errorGeneric('$e'))),
        data: (svc) => _buildBody(context, theme, colors, svc),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
    AuthProfileService svc,
  ) {
    final configManager = ref.read(configManagerProvider);
    final providers = configManager.config.providerCredentials.keys.toList()..sort();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          context.l10n.credentialsIntroBody,
          style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        for (final provider in providers) ...[
          _ProviderSection(
            provider: provider,
            svc: svc,
            onChanged: () => setState(() {}),
          ),
          const SizedBox(height: 8),
        ],
        if (providers.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                context.l10n.credentialsNoProvidersBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProviderSection extends StatelessWidget {
  final String provider;
  final AuthProfileService svc;
  final VoidCallback onChanged;

  const _ProviderSection({
    required this.provider,
    required this.svc,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profiles = svc.profilesFor(provider);

    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              provider.toUpperCase(),
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.primary,
                letterSpacing: 1,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              tooltip: context.l10n.credentialsAddKeyTooltip,
              onPressed: () => _showAddDialog(context),
            ),
          ),
          if (profiles.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                context.l10n.credentialsNoExtraKeysMessage,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          else
            for (final profile in profiles)
              _ProfileTile(
                profile: profile,
                svc: svc,
                onChanged: onChanged,
              ),
        ],
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    final nameCtrl = TextEditingController();
    final keyCtrl = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final l10n = ctx.l10n;
        return AlertDialog(
          title: Text(l10n.credentialsAddProviderKeyTitle(provider)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: l10n.credentialsKeyLabelHint,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: keyCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.credentialsApiKeyFieldLabel,
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.add),
            ),
          ],
        );
      },
    );
    if (result == true && keyCtrl.text.trim().isNotEmpty) {
      await svc.addProfile(
        provider: provider,
        apiKey: keyCtrl.text.trim(),
        displayName: nameCtrl.text.trim().isNotEmpty ? nameCtrl.text.trim() : provider,
      );
      onChanged();
    }
  }
}

class _ProfileTile extends StatelessWidget {
  final AuthProfile profile;
  final AuthProfileService svc;
  final VoidCallback onChanged;

  const _ProfileTile({
    required this.profile,
    required this.svc,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final onCooldown = profile.isOnCooldown;

    return ListTile(
      leading: Icon(
        onCooldown ? Icons.pause_circle_outline : Icons.key,
        color: onCooldown ? colors.error : colors.onSurface,
      ),
      title: Text(profile.displayName),
      subtitle: onCooldown
          ? Text(
              'Cooling down (${profile.cooldownReason?.name ?? 'error'})',
              style: TextStyle(color: colors.error, fontSize: 12),
            )
          : profile.errorCount > 0
              ? Text(
                  '${profile.errorCount} error(s)',
                  style: TextStyle(color: colors.tertiary, fontSize: 12),
                )
              : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: profile.enabled,
            onChanged: (v) async {
              await svc.setEnabled(profile.id, enabled: v);
              onChanged();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Remove',
            onPressed: () async {
              await svc.removeProfile(profile.id);
              onChanged();
            },
          ),
        ],
      ),
    );
  }
}
