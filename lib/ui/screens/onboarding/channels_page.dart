import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterclaw/channels/whatsapp.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/widgets/whatsapp_pairing_status_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ChannelsPageResult {
  final bool telegramEnabled;
  final String? telegramToken;
  final bool discordEnabled;
  final String? discordToken;
  final bool whatsappEnabled;
  final bool whatsappLinked;
  final bool whatsappSelfChatMode;

  const ChannelsPageResult({
    this.telegramEnabled = false,
    this.telegramToken,
    this.discordEnabled = false,
    this.discordToken,
    this.whatsappEnabled = false,
    this.whatsappLinked = false,
    this.whatsappSelfChatMode = true,
  });
}

class ChannelsPage extends StatefulWidget {
  final ValueChanged<ChannelsPageResult> onChanged;

  const ChannelsPage({super.key, required this.onChanged});

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  bool _telegramEnabled = false;
  bool _discordEnabled = false;
  bool _whatsappEnabled = false;
  bool _whatsappLinked = false;
  bool _whatsappSelfChatMode = true;
  bool _startingWhatsApp = false;
  final _telegramTokenCtl = TextEditingController();
  final _discordTokenCtl = TextEditingController();
  WhatsAppChannelAdapter? _whatsAppAdapter;
  StreamSubscription<String>? _waQrSub;
  StreamSubscription<WAConnectionStatus>? _waStateSub;
  String? _whatsAppQrCode;
  WAConnectionStatus _whatsAppStatus = WAConnectionStatus.disconnected;
  bool _waRestartPending = false;

  @override
  void dispose() {
    _telegramTokenCtl.dispose();
    _discordTokenCtl.dispose();
    _waQrSub?.cancel();
    _waStateSub?.cancel();
    final adapter = _whatsAppAdapter;
    if (adapter != null) {
      unawaited(adapter.stop());
      adapter.dispose();
    }
    super.dispose();
  }

  void _emitChange() {
    widget.onChanged(
      ChannelsPageResult(
        telegramEnabled: _telegramEnabled,
        telegramToken: _telegramTokenCtl.text.trim().isNotEmpty
            ? _telegramTokenCtl.text.trim()
            : null,
        discordEnabled: _discordEnabled,
        discordToken: _discordTokenCtl.text.trim().isNotEmpty
            ? _discordTokenCtl.text.trim()
            : null,
        whatsappEnabled: _whatsappEnabled,
        whatsappLinked: _whatsappLinked,
        whatsappSelfChatMode: _whatsappSelfChatMode,
      ),
    );
  }

  Future<void> _startWhatsAppLinking() async {
    if (_startingWhatsApp) return;
    if (_whatsAppAdapter != null) return;

    setState(() {
      _startingWhatsApp = true;
      _whatsAppStatus = WAConnectionStatus.connecting;
    });
    _emitChange();

    try {
      final adapter = WhatsAppChannelAdapter(
        selfChatMode: _whatsappSelfChatMode,
      );
      _whatsAppAdapter = adapter;

      if (adapter.lastQrCode != null) {
        _whatsAppQrCode = adapter.lastQrCode;
      }
      _waQrSub = adapter.qrStream.listen((qr) {
        if (!mounted) return;
        setState(() => _whatsAppQrCode = qr);
      });
      _waStateSub = adapter.connectionStateStream.listen((status) {
        if (!mounted) return;
        setState(() {
          _whatsAppStatus = status;
          _waRestartPending = adapter.isRestartPending;
          if (status == WAConnectionStatus.connected) {
            _whatsappLinked = true;
            _whatsAppQrCode = null;
          }
        });
        _emitChange();
      });

      await adapter.start((_) async {});
      if (!mounted) return;
      setState(() {
        _waRestartPending = adapter.isRestartPending;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _whatsAppStatus = WAConnectionStatus.disconnected);
    } finally {
      if (mounted) {
        setState(() => _startingWhatsApp = false);
      }
    }
  }

  Future<void> _stopWhatsAppLinking() async {
    final adapter = _whatsAppAdapter;
    _whatsAppAdapter = null;
    await _waQrSub?.cancel();
    await _waStateSub?.cancel();
    _waQrSub = null;
    _waStateSub = null;
    if (adapter != null) {
      await adapter.stop();
      adapter.dispose();
    }
    if (!mounted) return;
    setState(() {
      _whatsAppQrCode = null;
      _whatsAppStatus = WAConnectionStatus.disconnected;
      _waRestartPending = false;
      _startingWhatsApp = false;
      _whatsappLinked = false;
    });
    _emitChange();
  }

  Future<void> _retryWhatsAppLinking() async {
    await _stopWhatsAppLinking();
    if (!_whatsappEnabled || !mounted) return;
    await _startWhatsAppLinking();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      children: [
        Text(
          context.l10n.channelsPageTitle,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.channelsPageDesc,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        _ChannelCard(
          icon: Icons.send,
          name: context.l10n.telegram,
          description: context.l10n.connectTelegramBot,
          enabled: _telegramEnabled,
          onToggle: (val) {
            setState(() => _telegramEnabled = val);
            _emitChange();
          },
          signupUrl: 'https://t.me/BotFather',
          signupLabel: context.l10n.openBotFather,
          tokenController: _telegramTokenCtl,
          onTokenChanged: (_) => _emitChange(),
        ),
        const SizedBox(height: 12),
        _ChannelCard(
          icon: Icons.forum,
          name: context.l10n.discord,
          description: context.l10n.connectDiscordBot,
          enabled: _discordEnabled,
          onToggle: (val) {
            setState(() => _discordEnabled = val);
            _emitChange();
          },
          signupUrl: 'https://discord.com/developers/applications',
          signupLabel: context.l10n.developerPortal,
          tokenController: _discordTokenCtl,
          onTokenChanged: (_) => _emitChange(),
        ),
        const SizedBox(height: 12),
        Card(
          margin: EdgeInsets.zero,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.chat),
                  title: const Text('WhatsApp'),
                  subtitle: const Text(
                    'Pair your personal WhatsApp account with a QR code',
                  ),
                  value: _whatsappEnabled,
                  onChanged: (value) async {
                    setState(() => _whatsappEnabled = value);
                    _emitChange();
                    if (value) {
                      await _startWhatsAppLinking();
                    } else {
                      await _stopWhatsAppLinking();
                    }
                  },
                ),
                if (_whatsappEnabled)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pairing is optional. You can finish onboarding now and complete the link later.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                        WhatsAppPairingStatusCard(
                          status: _whatsAppStatus,
                          qrCode: _whatsAppQrCode,
                          isRestartPending: _waRestartPending,
                          idleDescription:
                              'Enable WhatsApp to start linking this device.',
                          connectingDescription: _waRestartPending
                              ? 'WhatsApp accepted the QR. Finalizing the link...'
                              : 'Waiting for WhatsApp to complete the link...',
                          connectedDescription:
                              'WhatsApp is linked. FlutterClaw will be able to respond after onboarding.',
                          footer: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _startingWhatsApp
                                      ? null
                                      : _retryWhatsAppLinking,
                                  icon: const Icon(Icons.refresh),
                                  label: Text(
                                    _startingWhatsApp ? 'Starting...' : 'Retry',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextButton(
                                  onPressed: _stopWhatsAppLinking,
                                  child: const Text('Cancel Link'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'WhatsApp mode',
                          style: theme.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        _WhatsAppModeOption(
                          title: 'My personal number',
                          description:
                              'Messages you send to yourself on this WhatsApp account will wake the agent.',
                          icon: Icons.person,
                          selected: _whatsappSelfChatMode,
                          onTap: () {
                            setState(() => _whatsappSelfChatMode = true);
                            _emitChange();
                          },
                        ),
                        _WhatsAppModeOption(
                          title: 'Dedicated bot account',
                          description:
                              'Self-messages from the linked account are treated as outbound and ignored.',
                          icon: Icons.smart_toy,
                          selected: !_whatsappSelfChatMode,
                          onTap: () {
                            setState(() => _whatsappSelfChatMode = false);
                            _emitChange();
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WhatsAppModeOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _WhatsAppModeOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected
            ? colors.primaryContainer.withValues(alpha: 0.45)
            : colors.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected ? colors.primary : colors.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selected ? colors.primary : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: selected ? colors.primary : colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChannelCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;
  final bool enabled;
  final ValueChanged<bool> onToggle;
  final String signupUrl;
  final String signupLabel;
  final TextEditingController tokenController;
  final ValueChanged<String> onTokenChanged;

  const _ChannelCard({
    required this.icon,
    required this.name,
    required this.description,
    required this.enabled,
    required this.onToggle,
    required this.signupUrl,
    required this.signupLabel,
    required this.tokenController,
    required this.onTokenChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            SwitchListTile(
              secondary: Icon(icon),
              title: Text(name),
              subtitle: Text(description),
              value: enabled,
              onChanged: onToggle,
            ),
            if (enabled)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        final uri = Uri.parse(signupUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.open_in_new,
                            size: 14,
                            color: colors.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            signupLabel,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: tokenController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: context.l10n.telegramBotToken(name),
                        border: const OutlineInputBorder(),
                        isDense: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.paste),
                          tooltip: 'Paste',
                          onPressed: () async {
                            final data = await Clipboard.getData(
                              Clipboard.kTextPlain,
                            );
                            if (data?.text != null) {
                              tokenController.text = data!.text!;
                              onTokenChanged(data.text!);
                            }
                          },
                        ),
                      ),
                      onChanged: onTokenChanged,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
