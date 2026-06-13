// ignore_for_file: unused_import
import "package:flutter/material.dart";
import "package:flutterclaw/ui/theme/tokens.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutterclaw/channels/signal.dart";
import "package:flutterclaw/core/app_providers.dart";
import "package:flutterclaw/l10n/l10n_extension.dart";
import "package:flutterclaw/services/pairing_service.dart";
import "package:flutterclaw/services/channel_validation.dart";
import "package:flutterclaw/data/models/config.dart";
import "package:flutterclaw/ui/widgets/allowlist_editor.dart";
class SignalConfigScreen extends ConsumerStatefulWidget {
  const SignalConfigScreen({super.key});
  @override
  ConsumerState<SignalConfigScreen> createState() => _SignalConfigScreenState();
}

class _SignalConfigScreenState extends ConsumerState<SignalConfigScreen> {
  late TextEditingController _apiUrlCtrl;
  late TextEditingController _accountCtrl;
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

  Future<void> _testApi() async {
    final apiUrl = _apiUrlCtrl.text.trim();
    if (apiUrl.isEmpty) return;
    setState(() => _testing = true);
    try {
      final error = await ChannelValidation.signalApi(apiUrl);
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
    final signal = ref.read(configManagerProvider).config.channels.signal;
    _apiUrlCtrl  = TextEditingController(text: signal.apiUrl ?? '');
    _accountCtrl = TextEditingController(text: signal.account ?? '');
    _allowFrom = List.of(signal.allowFrom);
  }

  @override
  void dispose() {
    _apiUrlCtrl.dispose();
    _accountCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final apiUrl  = _apiUrlCtrl.text.trim();
    final account = _accountCtrl.text.trim();
    if (apiUrl.isEmpty || account.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.apiUrlPhoneRequired)),
      );
      return;
    }
    if (!await _confirmOpenAllowlist()) return;
    setState(() => _saving = true);
    try {
      final validationError = await ChannelValidation.signalApi(apiUrl);
      if (validationError != null &&
          !await _confirmSaveDespiteError(validationError)) {
        return;
      }

      final configManager = ref.read(configManagerProvider);
      final config = configManager.config;
      configManager.update(config.copyWith(
        channels: config.channels.copyWith(
          signal: SignalConfig(
            enabled:   true,
            apiUrl:    apiUrl,
            account:   account,
            allowFrom: _allowFrom,
          ),
        ),
      ));
      await configManager.save();

      String? connectError;
      try {
        await ref.read(channelControlProvider).reload('signal');
      } catch (e) {
        connectError = e.toString();
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            connectError == null
                ? context.l10n.signalConfigSaved
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

  Future<void> _disconnect() async {
    setState(() => _saving = true);
    try {
      final configManager = ref.read(configManagerProvider);
      final current = configManager.config.channels.signal;
      configManager.update(configManager.config.copyWith(
        channels: configManager.config.channels.copyWith(
          signal: SignalConfig(
            enabled: false,
            apiUrl: current.apiUrl,
            account: current.account,
            allowFrom: current.allowFrom,
          ),
        ),
      ));
      await configManager.save();
      await ref.read(channelControlProvider).disconnect('signal');

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
        ref.read(configManagerProvider).config.channels.signal.enabled;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signalConfiguration),
        actions: [
          if (channelEnabled)
            TextButton.icon(
              onPressed: _saving ? null : _disconnect,
              icon: const Icon(Icons.logout),
              label: Text(context.l10n.disconnect),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.requirementsTitle, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.signalRequirements,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _apiUrlCtrl,
            decoration: InputDecoration(
              labelText: context.l10n.signalApiUrl,
              border: const OutlineInputBorder(),
              hintText: 'http://192.168.1.100:8080',
              prefixIcon: const Icon(Icons.link),
            ),
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _accountCtrl,
            decoration: InputDecoration(
              labelText: context.l10n.signalPhoneNumber,
              border: const OutlineInputBorder(),
              hintText: '+12025551234',
              prefixIcon: const Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 24),
          AllowlistEditor(
            entries: _allowFrom,
            onChanged: (entries) => setState(() => _allowFrom = entries),
            hintText: '+12025551234',
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _testing ? null : _testApi,
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
          FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox(
                    width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.check),
            label: Text(context.l10n.save),
          ),
        ],
      ),
    );
  }
}
