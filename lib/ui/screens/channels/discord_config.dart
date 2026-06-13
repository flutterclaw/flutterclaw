// ignore_for_file: unused_import
import "package:flutter/material.dart";
import "package:flutterclaw/ui/theme/tokens.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutterclaw/channels/discord.dart";
import "package:flutterclaw/channels/channel_interface.dart";
import "package:flutterclaw/core/app_providers.dart";
import "package:flutterclaw/l10n/l10n_extension.dart";
import "package:flutterclaw/services/pairing_service.dart";
import "package:flutterclaw/services/channel_validation.dart";
import "package:flutterclaw/data/models/config.dart";
import "package:flutterclaw/ui/widgets/security_method_card.dart";
import "package:flutterclaw/ui/widgets/setup_wizard_scaffold.dart";
class DiscordConfigScreen extends ConsumerStatefulWidget {
  const DiscordConfigScreen({super.key});
  @override
  ConsumerState<DiscordConfigScreen> createState() =>
      _DiscordConfigScreenState();
}

class _DiscordConfigScreenState extends ConsumerState<DiscordConfigScreen> {
  late TextEditingController _tokenCtl;
  late String _dmPolicy;

  /// id → display name
  Map<String, String> _approvedDevices = {};
  bool _isLoading = false;
  bool _testingToken = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(configManagerProvider).config.channels.discord;
    _tokenCtl = TextEditingController(text: config.token ?? '');
    _dmPolicy = config.dmPolicy;
    _loadApprovedDevices();
  }

  @override
  void dispose() {
    _tokenCtl.dispose();
    super.dispose();
  }

  Future<void> _loadApprovedDevices() async {
    final pairingService = ref.read(pairingServiceProvider);
    final map = await pairingService.getApproved('discord');
    if (mounted) setState(() => _approvedDevices = map);
  }

  Future<void> _removeDevice(String deviceId) async {
    setState(() => _approvedDevices.remove(deviceId));
    final pairingService = ref.read(pairingServiceProvider);
    pairingService.removeApproved('discord', deviceId);
  }

  Future<void> _addDevice() async {
    final deviceId = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text(context.l10n.addDevice),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: context.l10n.userIdLabel,
              hintText: context.l10n.enterDiscordUserId,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(context.l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text.trim()),
              child: Text(context.l10n.add),
            ),
          ],
        );
      },
    );

    if (deviceId != null &&
        deviceId.isNotEmpty &&
        !_approvedDevices.containsKey(deviceId)) {
      setState(() => _approvedDevices[deviceId] = '');
      final pairingService = ref.read(pairingServiceProvider);
      await pairingService.addApproved('discord', deviceId, '');
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

  Future<void> _testToken() async {
    final token = _tokenCtl.text.trim();
    if (token.isEmpty) return;
    setState(() => _testingToken = true);
    try {
      final error = await ChannelValidation.discordToken(token);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error == null
              ? context.l10n.connectedStatus
              : context.l10n.connectionFailed(error)),
        ),
      );
    } finally {
      if (mounted) setState(() => _testingToken = false);
    }
  }

  Future<void> _save() async {
    setState(() => _isLoading = true);

    try {
      final configManager = ref.read(configManagerProvider);
      final token = _tokenCtl.text.trim();

      if (token.isNotEmpty) {
        final validationError = await ChannelValidation.discordToken(token);
        if (validationError != null &&
            !await _confirmSaveDespiteError(validationError)) {
          return;
        }
      }

      configManager.update(
        configManager.config.copyWith(
          channels: configManager.config.channels.copyWith(
            discord: DiscordConfig(
              enabled: token.isNotEmpty,
              token: token.isNotEmpty ? token : null,
              allowFrom: _dmPolicy == 'allowlist'
                  ? _approvedDevices.keys.toList()
                  : [],
              dmPolicy: _dmPolicy,
            ),
          ),
        ),
      );
      await configManager.save();

      final control = ref.read(channelControlProvider);
      String? connectError;
      if (token.isNotEmpty) {
        try {
          await control.reload('discord');
        } catch (e) {
          connectError = e.toString();
        }
      } else {
        await control.disconnect('discord');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              connectError == null
                  ? context.l10n.discordConfigSaved
                  : context.l10n.channelConnectFailed(connectError),
            ),
          ),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _disconnect() async {
    setState(() => _isLoading = true);
    try {
      final configManager = ref.read(configManagerProvider);
      final current = configManager.config.channels.discord;
      configManager.update(
        configManager.config.copyWith(
          channels: configManager.config.channels.copyWith(
            discord: DiscordConfig(
              enabled: false,
              token: current.token,
              allowFrom: current.allowFrom,
              dmPolicy: current.dmPolicy,
            ),
          ),
        ),
      );
      await configManager.save();
      await ref.read(channelControlProvider).disconnect('discord');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.channelDisconnected)),
        );
        Navigator.pop(context);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final channelEnabled =
        ref.read(configManagerProvider).config.channels.discord.enabled;

    return SetupWizardScaffold(
      title: context.l10n.discordConfiguration,
      appBarActions: channelEnabled
          ? [
              TextButton.icon(
                onPressed: _isLoading ? null : _disconnect,
                icon: const Icon(Icons.logout),
                label: Text(context.l10n.disconnect),
              ),
            ]
          : const [],
      steps: [
        SetupWizardStep(
          title: context.l10n.botToken,
          subtitle: context.l10n.fromBotFatherHint,
          isValid: _tokenCtl.text.trim().isNotEmpty,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _tokenCtl,
                obscureText: true,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: context.l10n.botToken,
                  border: const OutlineInputBorder(),
                  hintText: context.l10n.fromBotFatherHint,
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.paste),
                    tooltip: context.l10n.paste,
                    onPressed: () async {
                      final data = await Clipboard.getData(Clipboard.kTextPlain);
                      if (data?.text != null) {
                        setState(() => _tokenCtl.text = data!.text!);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _testingToken ? null : _testToken,
                icon: _testingToken
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check_circle_outline),
                label: Text(context.l10n.testConnection),
              ),
              const SizedBox(height: 16),
              Card(
                color: colors.primaryContainer.withValues(alpha: 0.3),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    context.l10n.discordTokenInstructions,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SetupWizardStep(
          title: context.l10n.securityMethod,
          subtitle: context.l10n.pairingRecommended,
          isValid: _dmPolicy != 'allowlist' || _approvedDevices.isNotEmpty,
          body: _buildSecurityStep(context, theme, colors),
        ),
      ],
      onComplete: _save,
      completeLabel: context.l10n.saveAndConnect,
    );
  }

  Widget _buildSecurityStep(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SecurityMethodCard(
          title: context.l10n.pairingRecommended,
          description: context.l10n.pairingDescription,
          icon: Icons.link,
          isSelected: _dmPolicy == 'pairing',
          onTap: () => setState(() => _dmPolicy = 'pairing'),
          color: Colors.blue,
        ),
        SecurityMethodCard(
          title: context.l10n.allowlistTitle,
          description: context.l10n.allowlistDescription,
          icon: Icons.list_alt,
          isSelected: _dmPolicy == 'allowlist',
          onTap: () => setState(() => _dmPolicy = 'allowlist'),
          color: Colors.green,
        ),
        SecurityMethodCard(
          title: context.l10n.openAccess,
          description: context.l10n.openAccessDescription,
          icon: Icons.public,
          isSelected: _dmPolicy == 'open',
          onTap: () => setState(() => _dmPolicy = 'open'),
          color: Colors.orange,
        ),
        SecurityMethodCard(
          title: context.l10n.disabledAccess,
          description: context.l10n.disabledAccessDescription,
          icon: Icons.block,
          isSelected: _dmPolicy == 'disabled',
          onTap: () => setState(() => _dmPolicy = 'disabled'),
          color: Colors.red,
        ),
        if (_dmPolicy == 'pairing' || _dmPolicy == 'allowlist') ...[
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  _dmPolicy == 'pairing'
                      ? context.l10n.approvedDevices
                      : context.l10n.allowedUserIdsTitle,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              if (_dmPolicy == 'allowlist')
                IconButton.filledTonal(
                  icon: const Icon(Icons.add),
                  tooltip: context.l10n.addDeviceTooltip,
                  onPressed: _addDevice,
                ),
            ],
          ),
          if (_approvedDevices.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                _dmPolicy == 'pairing'
                    ? context.l10n.noApprovedDevicesYet
                    : context.l10n.allowlistEmptyWarning,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          else
            ..._approvedDevices.entries.map(
              (entry) => ListTile(
                title: Text(entry.value.isNotEmpty ? entry.value : entry.key),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _removeDevice(entry.key),
                ),
              ),
            ),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// WhatsApp Configuration Screen
// ---------------------------------------------------------------------------

