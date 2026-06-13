import 'package:flutter/material.dart';
import 'package:flutterclaw/data/models/auth_profile.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/auth_profile_service.dart';

/// Extra API keys for round-robin rotation (advanced), shown per provider.
class KeyRotationSection extends StatelessWidget {
  const KeyRotationSection({
    super.key,
    required this.provider,
    required this.svc,
    required this.onChanged,
  });

  final String provider;
  final AuthProfileService svc;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profiles = svc.profilesFor(provider);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.credentialsIntroBody,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          if (profiles.isEmpty)
            Text(
              l10n.credentialsNoExtraKeysMessage,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            )
          else
            for (final profile in profiles)
              _ProfileTile(
                profile: profile,
                svc: svc,
                onChanged: onChanged,
              ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => _showAddDialog(context),
              icon: const Icon(Icons.add),
              label: Text(l10n.credentialsAddKeyTooltip),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    final nameCtrl = TextEditingController();
    final keyCtrl = TextEditingController();
    final l10n = context.l10n;
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
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
      ),
    );
    if (result == true && keyCtrl.text.trim().isNotEmpty) {
      await svc.addProfile(
        provider: provider,
        apiKey: keyCtrl.text.trim(),
        displayName: nameCtrl.text.trim().isNotEmpty
            ? nameCtrl.text.trim()
            : provider,
      );
      onChanged();
    }
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.profile,
    required this.svc,
    required this.onChanged,
  });

  final AuthProfile profile;
  final AuthProfileService svc;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = context.l10n;
    final onCooldown = profile.isOnCooldown;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        onCooldown ? Icons.pause_circle_outline : Icons.key,
        color: onCooldown ? colors.error : colors.onSurface,
      ),
      title: Text(profile.displayName),
      subtitle: onCooldown
          ? Text(
              l10n.credentialsCoolingDown(
                profile.cooldownReason?.name ?? 'error',
              ),
              style: TextStyle(color: colors.error, fontSize: 12),
            )
          : profile.errorCount > 0
              ? Text(
                  l10n.credentialsErrorCount(profile.errorCount),
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
            tooltip: l10n.remove,
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
