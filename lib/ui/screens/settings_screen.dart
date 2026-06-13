import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/core/package_info_provider.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/screens/settings/about_screen.dart';
import 'package:flutterclaw/ui/screens/settings/gateway_screen.dart';
import 'package:flutterclaw/ui/screens/settings/mcp_servers_screen.dart';
import 'package:flutterclaw/ui/screens/settings/providers_models_screen.dart';
import 'package:flutterclaw/ui/screens/settings/security_settings_screen.dart';
import 'package:flutterclaw/ui/screens/settings/tool_policies_screen.dart';
import 'package:flutterclaw/ui/widgets/persistent_banner.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configManagerProvider).config;
    final hasModels = config.modelList.isNotEmpty;
    final colors = Theme.of(context).colorScheme;
    final health = ref.watch(healthCheckResultsProvider).asData?.value;
    final providerHealthIssue = health?.providerErrors.isNotEmpty ?? false;

    final gatewayDown = ref.watch(gatewayStateProvider).state == 'error';
    final showBanner = providerHealthIssue || gatewayDown;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: Column(
        children: [
          if (showBanner)
            PersistentBanner(
              message: providerHealthIssue
                  ? context.l10n.providerKeyInvalidTapToFix
                  : context.l10n.errorStartingGateway,
              type: PersistentBannerType.error,
              actionLabel: providerHealthIssue ? context.l10n.configure : context.l10n.retry,
              onAction: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => providerHealthIssue
                      ? const ProvidersModelsScreen()
                      : const GatewayScreen(),
                ),
              ),
            ),
          Expanded(
            child: ListView(
              children: [
          _SettingsTile(
            index: 0,
            icon: Icons.hub_outlined,
            title: context.l10n.providersAndModels,
            subtitle: providerHealthIssue
                ? context.l10n.providerKeyInvalidTapToFix
                : hasModels
                    ? context.l10n.modelsConfiguredCount(config.modelList.length)
                    : context.l10n.noModelsConfigured,
            subtitleColor: providerHealthIssue
                ? colors.error
                : hasModels
                    ? null
                    : colors.error,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProvidersModelsScreen()),
            ),
          ),
          _SettingsTile(
            index: 1,
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
            index: 2,
            icon: Icons.extension_outlined,
            title: context.l10n.mcpServersTitle,
            subtitle: () {
              final servers = config.mcpServers;
              if (servers.isEmpty) return context.l10n.mcpServersSubtitleEmpty;
              final enabled = servers.where((s) => s.enabled).length;
              return context.l10n.mcpServersSubtitleActive(enabled, servers.length);
            }(),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const McpServersScreen()),
            ),
          ),
          _SettingsTile(
            index: 3,
            icon: Icons.shield_outlined,
            title: context.l10n.toolPolicies,
            subtitle: config.tools.disabled.isEmpty
                ? context.l10n.allToolsEnabled
                : context.l10n.toolsDisabledCount(config.tools.disabled.length),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ToolPoliciesScreen()),
            ),
          ),
          _SettingsTile(
            index: 4,
            icon: Icons.lock_outlined,
            title: context.l10n.securitySettingsTitle,
            subtitle: ref.watch(unsafeModeProvider)
                ? context.l10n.securityChecksDisabled
                : context.l10n.securityChecksActive,
            subtitleColor: ref.watch(unsafeModeProvider) ? colors.error : null,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SecuritySettingsScreen()),
            ),
          ),
          _SettingsTile(
            index: 5,
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
    this.index = 0,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? subtitleColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppTokens.spacingXL,
        vertical: AppTokens.spacingXS,
      ),
      leading: Container(
        width: AppTokens.touchTargetSM,
        height: AppTokens.touchTargetSM,
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(AppTokens.radiusMD),
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: AppTokens.iconMD),
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
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: index * 50),
          duration: AppTokens.durationNormal,
          curve: Curves.easeOutCubic,
        )
        .slideY(
          begin: 0.06,
          delay: Duration(milliseconds: index * 50),
          duration: AppTokens.durationNormal,
          curve: Curves.easeOutCubic,
        );
  }
}
