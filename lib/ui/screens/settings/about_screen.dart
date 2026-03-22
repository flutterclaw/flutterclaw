import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/core/package_info_provider.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/screens/onboarding/onboarding_screen.dart';

/// About & Danger Zone settings sub-screen.
class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.about)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.auto_awesome),
                  title: Text(context.l10n.appTitle),
                  subtitle: Text(context.l10n.personalAIAssistantForIOS),
                ),
                ListTile(
                  leading: const Icon(Icons.tag),
                  title: Text(context.l10n.version),
                  trailing: ref.watch(packageInfoProvider).when(
                        data: (info) => Text(
                          '${info.version} (${info.buildNumber})',
                        ),
                        loading: () => const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        error: (_, _) => const Text('—'),
                      ),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(context.l10n.officialWebsite),
                  subtitle: const Text('flutterclaw.ai'),
                  trailing: const Icon(Icons.open_in_new, size: 16),
                  onTap: () => launchUrl(
                    Uri.parse('https://flutterclaw.ai'),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(context.l10n.basedOnOpenClaw),
                  subtitle: const Text('openclaw.ai'),
                  trailing: const Icon(Icons.open_in_new, size: 16),
                  onTap: () => launchUrl(
                    Uri.parse('https://openclaw.ai'),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Text(
            context.l10n.dangerZone,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colors.error,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
          ),
          const SizedBox(height: 8),
          Card(
            color: colors.errorContainer,
            child: ListTile(
              leading: Icon(Icons.restart_alt, color: colors.onErrorContainer),
              title: Text(
                context.l10n.resetOnboarding,
                style: TextStyle(
                  color: colors.onErrorContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                context.l10n.resetOnboardingDesc,
                style: TextStyle(
                  color: colors.onErrorContainer.withValues(alpha: 0.8),
                ),
              ),
              onTap: () => _confirmReset(context, ref),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(context.l10n.resetAllConfiguration),
        content: Text(
          context.l10n.resetAllConfigurationDesc,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(d, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(d).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(d, true),
            child: Text(context.l10n.reset),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final configManager = ref.read(configManagerProvider);
    final configPath = await configManager.configPath;
    final configFile = File(configPath);
    if (await configFile.exists()) await configFile.delete();

    configManager.update(const FlutterClawConfig());
    ref.invalidate(providerRouterProvider);
    ref.invalidate(agentLoopProvider);
    ref.invalidate(toolRegistryProvider);
    ref.invalidate(agentProfilesProvider);
    ref.invalidate(activeAgentProvider);
    ref.invalidate(activeWorkspacePathProvider);
    ref.invalidate(sessionManagerProvider);
    ref.invalidate(chatProvider);

    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      (route) => false,
    );
  }
}
