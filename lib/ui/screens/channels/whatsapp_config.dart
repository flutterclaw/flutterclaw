// ignore_for_file: unused_import
import "dart:async";
import "package:flutter/material.dart";
import "package:flutterclaw/ui/theme/tokens.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutterclaw/channels/whatsapp.dart";
import "package:flutterclaw/channels/channel_interface.dart";
import "package:flutterclaw/core/app_providers.dart";
import "package:flutterclaw/l10n/l10n_extension.dart";
import "package:flutterclaw/services/channel_validation.dart";
import "package:flutterclaw/services/pairing_service.dart";
import "package:flutterclaw/data/models/config.dart";
import "package:flutterclaw/ui/widgets/security_method_card.dart";
import "package:flutterclaw/ui/widgets/whatsapp_pairing_status_card.dart";
class WhatsAppConfigScreen extends ConsumerStatefulWidget {
  const WhatsAppConfigScreen({super.key});
  @override
  ConsumerState<WhatsAppConfigScreen> createState() =>
      _WhatsAppConfigScreenState();
}

class _WhatsAppConfigScreenState extends ConsumerState<WhatsAppConfigScreen> {
  late String _dmPolicy;
  late bool _selfChatMode;
  Map<String, String> _approvedDevices = {};
  bool _isLoading = false;
  bool _testing = false;
  String? _qrCode;
  StreamSubscription<String>? _qrSub;
  StreamSubscription<WAConnectionStatus>? _connSub;
  WAConnectionStatus _connStatus = WAConnectionStatus.disconnected;
  WhatsAppChannelAdapter? _adapter;
  bool _restartPending = false;
  bool _requiresRelink = false;

  /// True when the adapter was started by this screen (not already running).
  /// Used to stop it on dispose if the user exits without connecting.
  bool _startedByScreen = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(configManagerProvider).config.channels.whatsapp;
    _dmPolicy = config.dmPolicy;
    _selfChatMode = config.selfChatMode ?? true;
    _loadApprovedDevices();
    _attachToAdapter();
    // If no adapter is running, auto-start to show QR immediately.
    if (_adapter == null) {
      _startedByScreen = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _startAdapter());
    }
  }

  @override
  void dispose() {
    // If we started the adapter just for QR and user left without connecting,
    // clean it up so it doesn't consume resources in the background.
    if (_startedByScreen && _connStatus != WAConnectionStatus.connected) {
      _stopActiveAdapter(); // fire-and-forget
    }
    _qrSub?.cancel();
    _connSub?.cancel();
    super.dispose();
  }

  void _attachToAdapter() {
    final router = ref.read(channelRouterProvider);
    final adapter = router.adapters
        .whereType<WhatsAppChannelAdapter>()
        .firstOrNull;
    if (adapter == null) return;
    _adapter = adapter;
    _connStatus = adapter.connectionStatus;
    _restartPending = adapter.isRestartPending;
    _requiresRelink = adapter.requiresRelink;
    if (adapter.lastQrCode != null) {
      _qrCode = adapter.lastQrCode;
    }
    _listenToAdapter(adapter);
  }

  void _listenToAdapter(WhatsAppChannelAdapter adapter) {
    _qrSub?.cancel();
    _connSub?.cancel();
    _qrSub = adapter.qrStream.listen((qr) {
      if (mounted) setState(() => _qrCode = qr);
    });
    _connSub = adapter.connectionStateStream.listen((s) {
      if (mounted) {
        setState(() {
          _connStatus = s;
          _restartPending = adapter.isRestartPending;
          _requiresRelink = adapter.requiresRelink;
          if (s == WAConnectionStatus.connected) {
            _qrCode = null;
            _requiresRelink = false;
            // Auto-save config when QR is scanned for the first time.
            if (_startedByScreen) _saveConfig();
          }
        });
      }
    });
  }

  /// Starts the WhatsApp adapter (creates it + registers + starts).
  /// Does NOT save config — call _saveConfig() separately when needed.
  Future<void> _startAdapter({bool clearAuth = false}) async {
    if (!mounted) return;
    final configManager = ref.read(configManagerProvider);
    final currentConfig = configManager.config.channels.whatsapp;
    final router = ref.read(channelRouterProvider);
    final pairingService = ref.read(pairingServiceProvider);
    final cmdHandler = ref.read(chatCommandHandlerProvider);
    final agentLoop = ref.read(agentLoopProvider);

    await _stopActiveAdapter(clearAuth: clearAuth);
    if (!mounted) return;

    final adapter = WhatsAppChannelAdapter(
      authDir: currentConfig.authDir,
      allowedUserIds: _dmPolicy == 'allowlist'
          ? _approvedDevices.keys.toList()
          : [],
      dmPolicy: _dmPolicy,
      selfChatMode: _selfChatMode,
      pairingService: pairingService,
      chatCommandHandler: (sessionKey, command) async {
        final result = await cmdHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
    );

    router.registerAdapter(adapter);
    _adapter = adapter;
    _listenToAdapter(adapter);

    await adapter.start((msg) async {
      final response = await agentLoop.processMessage(
        msg.sessionKey,
        msg.text,
        channelType: msg.channelType,
        chatId: msg.chatId,
        contentBlocks: msg.contentBlocks,
        channelContext: msg.channelContext,
        onIntermediateMessage: (text) => adapter.sendMessage(
          OutgoingMessage(
            channelType: msg.channelType,
            chatId: msg.chatId,
            text: text,
          ),
        ),
      );
      await adapter.sendMessage(
        OutgoingMessage(
          channelType: msg.channelType,
          chatId: msg.chatId,
          text: response.content,
        ),
      );
    });
  }

  /// Saves config only (marks WhatsApp as enabled with current settings).
  Future<void> _saveConfig() async {
    final configManager = ref.read(configManagerProvider);
    final currentConfig = configManager.config.channels.whatsapp;
    configManager.update(
      configManager.config.copyWith(
        channels: configManager.config.channels.copyWith(
          whatsapp: WhatsAppConfig(
            enabled: true,
            authDir: currentConfig.authDir,
            dmPolicy: _dmPolicy,
            allowFrom: _dmPolicy == 'allowlist'
                ? _approvedDevices.keys.toList()
                : [],
            selfChatMode: _selfChatMode,
          ),
        ),
      ),
    );
    await configManager.save();
  }

  Future<void> _stopActiveAdapter({bool clearAuth = false}) async {
    final router = ref.read(channelRouterProvider);
    final adapter =
        _adapter ??
        router.adapters.whereType<WhatsAppChannelAdapter>().firstOrNull;

    router.unregisterAdapter('whatsapp');
    await _qrSub?.cancel();
    await _connSub?.cancel();
    _qrSub = null;
    _connSub = null;

    if (adapter != null) {
      await adapter.stop();
      adapter.dispose();
    }

    if (clearAuth) {
      final authDir = ref
          .read(configManagerProvider)
          .config
          .channels
          .whatsapp
          .authDir;
      await WhatsAppChannelAdapter.clearAuth(authDir);
    }

    _adapter = null;
  }

  Future<void> _loadApprovedDevices() async {
    final map = await ref.read(pairingServiceProvider).getApproved('whatsapp');
    if (mounted) setState(() => _approvedDevices = map);
  }

  Future<void> _removeDevice(String id) async {
    setState(() => _approvedDevices.remove(id));
    ref.read(pairingServiceProvider).removeApproved('whatsapp', id);
  }

  Future<void> _addDevice() async {
    final id = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final ctl = TextEditingController();
        return AlertDialog(
          title: Text(context.l10n.addNumberTitle),
          content: TextField(
            controller: ctl,
            decoration: InputDecoration(
              labelText: context.l10n.phoneNumberJid,
              hintText: 'e.g. 5511999123456',
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(context.l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, ctl.text.trim()),
              child: Text(context.l10n.add),
            ),
          ],
        );
      },
    );
    if (id != null && id.isNotEmpty && !_approvedDevices.containsKey(id)) {
      setState(() => _approvedDevices[id] = '');
      await ref.read(pairingServiceProvider).addApproved('whatsapp', id, '');
    }
  }

  /// Save settings and restart the adapter with the updated config.
  Future<void> _save() async {
    setState(() => _isLoading = true);
    try {
      await _saveConfig();
      _startedByScreen = false; // Adapter is now intentionally kept running.
      await _startAdapter(clearAuth: _requiresRelink);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.whatsAppConfigSaved)),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _disconnect() async {
    await _stopActiveAdapter(clearAuth: true);
    final configManager = ref.read(configManagerProvider);
    final currentConfig = configManager.config.channels.whatsapp;
    configManager.update(
      configManager.config.copyWith(
        channels: configManager.config.channels.copyWith(
          whatsapp: WhatsAppConfig(
            enabled: false,
            authDir: currentConfig.authDir,
            allowFrom: currentConfig.allowFrom,
            dmPolicy: currentConfig.dmPolicy,
            selfChatMode: _selfChatMode,
          ),
        ),
      ),
    );
    await configManager.save();
    setState(() {
      _qrCode = null;
      _connStatus = WAConnectionStatus.disconnected;
      _adapter = null;
      _restartPending = false;
      _requiresRelink = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.whatsAppDisconnected)));
      Navigator.pop(context);
    }
  }

  Future<void> _testConnection() async {
    setState(() => _testing = true);
    try {
      final adapter = ref.read(channelRouterProvider).adapterFor('whatsapp');
      final isConnected = adapter?.isConnected ?? false;
      final error = await ChannelValidation.whatsappConnection(
        isConnected: isConnected,
      );
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isConnected = _connStatus == WAConnectionStatus.connected;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.whatsAppTitle),
        actions: [
          if (_adapter != null && isConnected)
            TextButton.icon(
              onPressed: _disconnect,
              icon: const Icon(Icons.logout),
              label: Text(context.l10n.disconnect),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Status + QR card always at top
          WhatsAppPairingStatusCard(
            status: _connStatus,
            qrCode: _qrCode,
            isRestartPending: _restartPending,
            idleDescription: _requiresRelink
                ? context.l10n.sessionExpiredRelink
                : context.l10n.connectWhatsAppBelow,
            connectingDescription: _restartPending
                ? context.l10n.whatsAppAcceptedQr
                : context.l10n.waitingForWhatsApp,
          ),
          const SizedBox(height: 12),

          // Primary action button — always visible near top.
          // When QR is showing (auto-started), the button applies settings
          // and restarts the adapter. Once connected, it just saves settings.
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(isConnected ? Icons.save_outlined : Icons.refresh),
              label: Text(
                _isLoading
                    ? context.l10n.applyingSettings
                    : _requiresRelink
                    ? context.l10n.reconnectWhatsApp
                    : isConnected
                    ? context.l10n.saveSettingsLabel
                    : context.l10n.applySettingsRestart,
              ),
            ),
          ),

          const SizedBox(height: 24),
          Text(context.l10n.whatsAppMode, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SecurityMethodCard(
            title: context.l10n.myPersonalNumber,
            description: context.l10n.myPersonalNumberDesc,
            icon: Icons.person,
            isSelected: _selfChatMode,
            onTap: () => setState(() => _selfChatMode = true),
            color: Colors.teal,
          ),
          SecurityMethodCard(
            title: context.l10n.dedicatedBotAccount,
            description: context.l10n.dedicatedBotAccountDesc,
            icon: Icons.smart_toy,
            isSelected: !_selfChatMode,
            onTap: () => setState(() => _selfChatMode = false),
            color: Colors.indigo,
          ),
          const SizedBox(height: 24),

          Text(context.l10n.securityMethod, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SecurityMethodCard(
            title: context.l10n.pairingRecommended,
            description: context.l10n.whatsAppPairingDesc,
            icon: Icons.link,
            isSelected: _dmPolicy == 'pairing',
            onTap: () => setState(() => _dmPolicy = 'pairing'),
            color: Colors.blue,
          ),
          SecurityMethodCard(
            title: context.l10n.allowlistTitle,
            description: context.l10n.whatsAppAllowlistDesc,
            icon: Icons.list_alt,
            isSelected: _dmPolicy == 'allowlist',
            onTap: () => setState(() => _dmPolicy = 'allowlist'),
            color: Colors.green,
          ),
          SecurityMethodCard(
            title: context.l10n.openAccess,
            description: context.l10n.whatsAppOpenDesc,
            icon: Icons.public,
            isSelected: _dmPolicy == 'open',
            onTap: () => setState(() => _dmPolicy = 'open'),
            color: Colors.orange,
          ),
          SecurityMethodCard(
            title: context.l10n.disabledAccess,
            description: context.l10n.whatsAppDisabledDesc,
            icon: Icons.block,
            isSelected: _dmPolicy == 'disabled',
            onTap: () => setState(() => _dmPolicy = 'disabled'),
            color: Colors.red,
          ),
          const SizedBox(height: 24),

          if (_dmPolicy == 'pairing' || _dmPolicy == 'allowlist') ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dmPolicy == 'pairing'
                        ? context.l10n.approvedDevices
                        : context.l10n.allowedNumbers,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (_dmPolicy == 'allowlist')
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    tooltip: context.l10n.addNumberTooltip,
                    onPressed: _addDevice,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (_approvedDevices.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        _dmPolicy == 'pairing'
                            ? Icons.link_off
                            : Icons.info_outline,
                        size: 40,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _dmPolicy == 'pairing'
                            ? context.l10n.noApprovedDevicesYet
                            : context.l10n.noAllowedNumbersConfigured,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _dmPolicy == 'pairing'
                            ? context.l10n.devicesAppearAfterPairing
                            : context.l10n.addPhoneNumbersHint,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (_dmPolicy == 'allowlist') ...[
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.allowlistEmptyWarning,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.error,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              )
            else
              ..._approvedDevices.entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(Icons.person, color: colors.primary),
                    ),
                    title: Text(
                      entry.value.isNotEmpty ? entry.value : entry.key,
                    ),
                    subtitle: Text(
                      entry.value.isNotEmpty
                          ? entry.key
                          : (_dmPolicy == 'pairing'
                                ? context.l10n.approvedDevice
                                : context.l10n.allowedNumber),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: context.l10n.remove,
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(context.l10n.removeDevice),
                            content: Text(
                              context.l10n.removeAccessFor(entry.value.isNotEmpty ? entry.value : entry.key),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: Text(context.l10n.cancel),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: Text(context.l10n.remove),
                              ),
                            ],
                          ),
                        );
                        if (ok == true) await _removeDevice(entry.key);
                      },
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 24),
          ],

          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: _testing ? null : _testConnection,
            icon: _testing
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.help_outline, size: 20, color: colors.primary),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.howToConnect,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.whatsAppConnectInstructions,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Slack Configuration Screen
// ---------------------------------------------------------------------------

