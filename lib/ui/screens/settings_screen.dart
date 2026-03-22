import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/core/package_info_provider.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/screens/settings/about_screen.dart';
import 'package:flutterclaw/ui/screens/settings/gateway_screen.dart';
import 'package:flutterclaw/ui/screens/settings/providers_models_screen.dart';
import 'package:flutterclaw/ui/screens/settings/tool_policies_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configManagerProvider).config;
    final hasModels = config.modelList.isNotEmpty;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: ListView(
        children: [
          _SettingsTile(
            icon: Icons.hub_outlined,
            title: context.l10n.providersAndModels,
            subtitle: hasModels
                ? context.l10n.modelsConfiguredCount(config.modelList.length)
                : context.l10n.noModelsConfigured,
            subtitleColor: hasModels ? null : colors.error,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const ProvidersModelsScreen()),
            ),
          ),
          _SettingsTile(
            icon: Icons.router_outlined,
            title: context.l10n.gateway,
            subtitle: config.gateway.autoStart
                ? context.l10n.autoStartEnabledLabel
                : context.l10n.autoStartOffLabel,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GatewayScreen()),
            ),
          ),
          _SettingsTile(
            icon: Icons.shield_outlined,
            title: context.l10n.toolPolicies,
            subtitle: config.tools.disabled.isEmpty
                ? context.l10n.allToolsEnabled
                : context.l10n.toolsDisabledCount(config.tools.disabled.length),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const ToolPoliciesScreen()),
            ),
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: context.l10n.about,
            subtitle: ref.watch(packageInfoProvider).when(
                  data: (info) => context.l10n.appVersionSubtitle(
                        context.l10n.appTitle,
                        info.version,
                        info.buildNumber,
                      ),
                  loading: () => context.l10n.appTitle,
                  error: (_, _) => context.l10n.appTitle,
                ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.subtitleColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: 20),
      ),
      title: Text(title,
          style: theme.textTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: subtitleColor ?? theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
