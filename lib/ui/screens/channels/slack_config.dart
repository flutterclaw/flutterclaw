// ignore_for_file: unused_import
import "package:flutter/material.dart";
import "package:flutterclaw/ui/theme/tokens.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutterclaw/channels/slack.dart";
import "package:flutterclaw/core/app_providers.dart";
import "package:flutterclaw/l10n/l10n_extension.dart";
import "package:flutterclaw/services/pairing_service.dart";
import "package:flutterclaw/services/channel_validation.dart";
import "package:flutterclaw/data/models/config.dart";
import "package:flutterclaw/ui/widgets/allowlist_editor.dart";
import "package:flutterclaw/ui/widgets/setup_wizard_scaffold.dart";
class SlackConfigScreen extends ConsumerStatefulWidget {
  const SlackConfigScreen({super.key});
  @override
  ConsumerState<SlackConfigScreen> createState() => _SlackConfigScreenState();
}

class _SlackConfigScreenState extends ConsumerState<SlackConfigScreen> {
  late TextEditingController _botTokenCtrl;
  late TextEditingController _appTokenCtrl;
  late List<String> _allowFrom;
  bool _saving = false;
  bool _testing = false;

  Future<bool> _confirmOpenAllowlist() async {
    if (_allowFrom.isNotEmpty) return true;
    if (!mounted) return false;
    final proceed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(ctx.l10n.allowedUsersTitle),
        content: Text(ctx.l10n.allowlistEmptyWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(ctx.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(ctx.l10n.saveAnyway),
          ),
        ],
      ),
    );
    return proceed == true;
  }

  Future<void> _testTokens() async {
    final botToken = _botTokenCtrl.text.trim();
    final appToken = _appTokenCtrl.text.trim();
    if (botToken.isEmpty || appToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.bothTokensRequired)),
      );
      return;
    }
    setState(() => _testing = true);
    try {
      final error = await ChannelValidation.slackTokens(botToken, appToken);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error == null
              ? context.l10n.connectedStatus
              : context.l10n.connectionFailed(error)),
        ),
      );
    } finally {
      if (mounted) setState(() => _testing = false);
    }
  }

  @override
  void initState() {
    super.initState();
    final slack = ref.read(configManagerProvider).config.channels.slack;
    _botTokenCtrl = TextEditingController(text: slack.botToken ?? '');
    _appTokenCtrl = TextEditingController(text: slack.appToken ?? '');
    _allowFrom = List.of(slack.allowFrom);
  }

  @override
  void dispose() {
    _botTokenCtrl.dispose();
    _appTokenCtrl.dispose();
    super.dispose();
  }

  /// Validates [validationError] with the user; returns true to proceed.
  Future<bool> _confirmSaveDespiteError(String validationError) async {
    if (!mounted) return false;
    final proceed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(ctx.l10n.tokenValidationFailed(validationError)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(ctx.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(ctx.l10n.saveAnyway),
          ),
        ],
      ),
    );
    return proceed == true;
  }

  Future<void> _save() async {
    final botToken = _botTokenCtrl.text.trim();
    final appToken = _appTokenCtrl.text.trim();
    if (botToken.isEmpty || appToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.bothTokensRequired)),
      );
      return;
    }
    if (!await _confirmOpenAllowlist()) return;
    setState(() => _saving = true);
    try {
      final validationError =
          await ChannelValidation.slackTokens(botToken, appToken);
      if (validationError != null &&
          !await _confirmSaveDespiteError(validationError)) {
        return;
      }

      final configManager = ref.read(configManagerProvider);
      final config = configManager.config;
      configManager.update(config.copyWith(
        channels: config.channels.copyWith(
          slack: SlackConfig(
            enabled: true,
            botToken: botToken,
            appToken: appToken,
            allowFrom: _allowFrom,
          ),
        ),
      ));
      await configManager.save();

      String? connectError;
      try {
        await ref.read(channelControlProvider).reload('slack');
      } catch (e) {
        connectError = e.toString();
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            connectError == null
                ? context.l10n.slackConfigSaved
                : context.l10n.channelConnectFailed(connectError),
          ),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(context.l10n.errorGeneric(e.toString()))));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _disconnect() async {
    setState(() => _saving = true);
    try {
      final configManager = ref.read(configManagerProvider);
      final current = configManager.config.channels.slack;
      configManager.update(configManager.config.copyWith(
        channels: configManager.config.channels.copyWith(
          slack: SlackConfig(
            enabled: false,
            botToken: current.botToken,
            appToken: current.appToken,
            allowFrom: current.allowFrom,
          ),
        ),
      ));
      await configManager.save();
      await ref.read(channelControlProvider).disconnect('slack');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.channelDisconnected)),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final channelEnabled =
        ref.read(configManagerProvider).config.channels.slack.enabled;

    return SetupWizardScaffold(
      title: context.l10n.slackConfiguration,
      appBarActions: channelEnabled
          ? [
              TextButton.icon(
                onPressed: _saving ? null : _disconnect,
                icon: const Icon(Icons.logout),
                label: Text(context.l10n.disconnect),
              ),
            ]
          : const [],
      steps: [
        SetupWizardStep(
          title: context.l10n.setupTitle,
          subtitle: context.l10n.slackSetupInstructions.split('\n').first,
          isValid: true,
          optional: true,
          body: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.l10n.slackSetupInstructions,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
        SetupWizardStep(
          title: context.l10n.botTokenXoxb,
          subtitle: context.l10n.apiKeyTitle,
          isValid: _botTokenCtrl.text.trim().isNotEmpty,
          body: TextField(
            controller: _botTokenCtrl,
            obscureText: true,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: context.l10n.botTokenXoxb,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.key),
            ),
          ),
        ),
        SetupWizardStep(
          title: context.l10n.appLevelToken,
          subtitle: context.l10n.allowedUsersTitle,
          isValid: _appTokenCtrl.text.trim().isNotEmpty,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _appTokenCtrl,
                obscureText: true,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: context.l10n.appLevelToken,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.vpn_key_outlined),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _testing ? null : _testTokens,
                icon: _testing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check_circle_outline),
                label: Text(context.l10n.testConnection),
              ),
              const SizedBox(height: 24),
              AllowlistEditor(
                entries: _allowFrom,
                onChanged: (entries) => setState(() => _allowFrom = entries),
                hintText: 'U0123456789',
              ),
            ],
          ),
        ),
      ],
      onComplete: _save,
      completeLabel: context.l10n.saveAndConnect,
    );
  }
}
