import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/analytics_service.dart';
import 'package:flutterclaw/ui/widgets/agent_switcher_chip.dart';
import 'package:flutterclaw/ui/widgets/chat/message_bubble.dart';
import 'package:flutterclaw/ui/widgets/chat/date_separator.dart';
import 'package:flutterclaw/ui/widgets/chat/input_bar.dart';
import 'package:flutterclaw/ui/widgets/chat/live_voice_overlay.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with WidgetsBindingObserver {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();
  bool _hatchChecked = false;
  bool _isNearBottom = true;
  bool _programmaticScroll = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);
    _focusNode.addListener(_onFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
      // Auto-scroll when messages change (instead of inside build).
      // Also fire a light haptic when a tool pill transitions to done.
      ref.listenManual(chatProvider, (prev, next) {
        final liveStatus = ref.read(liveSessionProvider).status;
        final liveActive =
            liveStatus == LiveSessionStatus.connecting ||
            liveStatus == LiveSessionStatus.ready;
        if (liveActive && prev != null) {
          var listChanged = next.length != prev.length;
          if (!listChanged) {
            final n = next.length;
            for (var i = 0; i < n; i++) {
              final pl = prev[i];
              final nl = next[i];
              if (pl.text != nl.text ||
                  pl.isStreaming != nl.isStreaming ||
                  pl.toolResultText != nl.toolResultText ||
                  pl.isToolStatus != nl.isToolStatus) {
                listChanged = true;
                break;
              }
            }
          }
          _scrollToBottom(force: listChanged);
        } else {
          _scrollToBottom();
        }
        if (prev != null) {
          final prevRunning = prev
              .where((m) => m.isToolStatus && m.isStreaming == true)
              .length;
          final nextRunning = next
              .where((m) => m.isToolStatus && m.isStreaming == true)
              .length;
          if (nextRunning < prevRunning) HapticFeedback.selectionClick();
        }
      });
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _programmaticScroll) return;
    final pos = _scrollController.position;
    final nearBottom = pos.pixels >= pos.maxScrollExtent - 80;
    if (nearBottom != _isNearBottom) {
      setState(() => _isNearBottom = nearBottom);
    }
  }

  void _onFocusChange() {
    // When keyboard opens, scroll to bottom after it animates in
    if (_focusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _scrollToBottom(force: true);
      });
    }
  }

  Future<void> _init() async {
    // Get user's locale to pass to the agent (before any async operations)
    final locale = Localizations.maybeLocaleOf(context);
    final languageCode = locale?.languageCode;

    // Load previous messages from persisted session
    await ref.read(chatProvider.notifier).loadHistory();

    if (_hatchChecked) return;

    final configManager = ref.read(configManagerProvider);
    final cfg = configManager.config;
    final pending = cfg.pendingFirstHatchModePrompt;
    final liveOk = ref.read(activeModelSupportsLiveProvider);

    if (pending) {
      if (!liveOk) {
        configManager.update(cfg.copyWith(pendingFirstHatchModePrompt: false));
        await configManager.save();
      } else if (!mounted) {
        return;
      } else {
        final useVoice = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            final l10n = ctx.l10n;
            return AlertDialog(
              title: Text(l10n.firstHatchModeChoiceTitle),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.firstHatchModeChoiceBody),
                  const SizedBox(height: 20),
                  FilledButton.tonal(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(l10n.firstHatchModeChoiceChatButton),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(l10n.firstHatchModeChoiceVoiceButton),
                  ),
                ],
              ),
            );
          },
        );
        if (!mounted) return;
        final preferVoice = useVoice ?? false;
        final nextDefaults = cfg.agents.defaults.copyWith(
          preferLiveVoiceBootstrap: preferVoice,
        );
        configManager.update(
          cfg.copyWith(
            agents: cfg.agents.copyWith(defaults: nextDefaults),
            pendingFirstHatchModePrompt: false,
          ),
        );
        await configManager.save();
      }
    }

    _hatchChecked = true;
    ref.read(chatProvider.notifier).triggerHatch(userLanguage: languageCode);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notifier = ref.read(chatProvider.notifier);
    if (state == AppLifecycleState.paused) {
      notifier.onAppBackgrounded();
    } else if (state == AppLifecycleState.resumed) {
      notifier.onAppResumed();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _pickAndSendImage() async {
    final defaultCaption = context.l10n.whatDoYouSeeInImage;
    final errorSimulator = context.l10n.imagePickerNotAvailable;
    final errorGeneric = context.l10n.couldNotOpenImagePicker;

    try {
      final source = await showModalBottomSheet<ImageSource>(
        context: context,
        builder: (ctx) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(context.l10n.photoLibrary),
                onTap: () => Navigator.pop(ctx, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(context.l10n.camera),
                onTap: () => Navigator.pop(ctx, ImageSource.camera),
              ),
            ],
          ),
        ),
      );
      if (source == null) return;

      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (image == null) return;

      final bytes = await File(image.path).readAsBytes();
      final base64Image = base64Encode(bytes);
      final mimeType = image.path.endsWith('.png') ? 'image/png' : 'image/jpeg';

      final caption = _controller.text.trim();
      _controller.clear();

      await ref
          .read(chatProvider.notifier)
          .sendImageMessage(
            base64Image: base64Image,
            mimeType: mimeType,
            caption: caption.isNotEmpty ? caption : defaultCaption,
            fileName: image.name,
          );
    } catch (e) {
      if (!mounted) return;
      final isSimulator =
          e.toString().contains('channel-error') ||
          e.toString().contains('Unable to establish connection');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isSimulator ? errorSimulator : errorGeneric)),
      );
    }
  }

  void _scrollToBottom({bool force = false}) {
    if (!force && !_isNearBottom) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _programmaticScroll = true;
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        _programmaticScroll = false;
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    HapticFeedback.lightImpact();
    _controller.clear();
    _isNearBottom = true;
    _focusNode.requestFocus();

    await ref
        .read(analyticsServiceProvider)
        .logAction(name: 'send_message', parameters: {'length': text.length});

    await ref.read(chatProvider.notifier).sendMessage(text);
  }

  Future<void> _sendDocumentMessage(
    String base64Data,
    String mimeType,
    String fileName,
  ) async {
    await ref
        .read(chatProvider.notifier)
        .sendDocumentMessage(
          base64Data: base64Data,
          mimeType: mimeType,
          fileName: fileName,
        );
  }

  Future<void> _pickAndSendDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'txt', 'md'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      if (file.bytes == null) return;

      final base64Data = base64Encode(file.bytes!);
      final ext = (file.extension ?? 'pdf').toLowerCase();
      final mimeType = ext == 'pdf' ? 'application/pdf' : 'text/plain';
      final fileName = file.name;

      await _sendDocumentMessage(base64Data, mimeType, fileName);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.couldNotOpenDocument(e.toString())),
        ),
      );
    }
  }

  void _toggleLiveSession() {
    unawaited(_toggleLiveSessionAsync());
  }

  Future<void> _toggleLiveSessionAsync() async {
    final notifier = ref.read(liveSessionProvider.notifier);
    final status = ref.read(liveSessionProvider).status;
    if (status == LiveSessionStatus.idle || status == LiveSessionStatus.error) {
      final locale = Localizations.maybeLocaleOf(context);
      notifier.startSession(userLanguage: locale?.languageCode);
      return;
    }
    await notifier.stopSession();
    if (mounted) {
      await ref.read(chatProvider.notifier).reloadHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);
    final isProcessing = ref.read(chatProvider.notifier).isProcessing;
    final modelSupportsVision = ref.watch(activeModelSupportsVisionProvider);
    final activeAgent = ref.watch(activeAgentProvider);
    final liveStatus = ref.watch(liveSessionProvider).status;
    final showLiveOverlay =
        liveStatus == LiveSessionStatus.connecting ||
        liveStatus == LiveSessionStatus.ready;

    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
          actions: [
            const _ThinkingLevelChip(),
            const SessionSwitcherChip(),
            IconButton(
              icon: const Icon(Icons.add_comment_outlined),
              tooltip: context.l10n.newSession,
              onPressed: () => ref.read(chatProvider.notifier).clear(),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  messages.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: showLiveOverlay
                                ? LiveVoiceOverlay.listTopPaddingWhenLive
                                : 0,
                          ),
                          child: _ChatEmptyState(agent: activeAgent),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          padding: EdgeInsets.fromLTRB(
                            12,
                            showLiveOverlay
                                ? LiveVoiceOverlay.listTopPaddingWhenLive
                                : 8,
                            12,
                            8,
                          ),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final prev = index > 0 ? messages[index - 1] : null;
                            final showSeparator = _shouldShowDateSeparator(
                              prev,
                              msg,
                            );
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (showSeparator)
                                  ChatDateSeparator(timestamp: msg.timestamp),
                                MessageBubble(
                                  message: msg,
                                  onCopy: () {
                                    Clipboard.setData(
                                      ClipboardData(text: msg.text),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.l10n.copiedToClipboard,
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  onKillProcess: () => ref
                                      .read(chatProvider.notifier)
                                      .killCurrentProcess(),
                                  onStdinWrite: (data) => ref
                                      .read(sandboxServiceProvider)
                                      .writeStdin(data),
                                ),
                              ],
                            );
                          },
                        ),
                  // Scroll-to-bottom FAB
                  if (!_isNearBottom && messages.isNotEmpty)
                    Positioned(
                      bottom: 8,
                      right: 12,
                      child: FloatingActionButton.small(
                        heroTag: 'scroll_to_bottom',
                        onPressed: () => _scrollToBottom(force: true),
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  // Live voice overlay
                  if (showLiveOverlay) const LiveVoiceOverlay(),
                ],
              ),
            ),
            ChatInputBar(
              controller: _controller,
              focusNode: _focusNode,
              isProcessing: isProcessing,
              onSend: _sendMessage,
              onCancel: () =>
                  ref.read(chatProvider.notifier).cancelProcessing(),
              onAttach: modelSupportsVision ? _pickAndSendImage : null,
              onAttachDocument: _pickAndSendDocument,
              onLiveVoice: _toggleLiveSession,
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldShowDateSeparator(ChatMessage? prev, ChatMessage current) {
    if (prev == null) return true;
    final p = prev.timestamp;
    final c = current.timestamp;
    return p.year != c.year || p.month != c.month || p.day != c.day;
  }
}

// ---------------------------------------------------------------------------
// Personalized empty state — shows active agent emoji and name
// ---------------------------------------------------------------------------

class _ChatEmptyState extends StatelessWidget {
  const _ChatEmptyState({this.agent});
  final dynamic agent; // AgentProfile?

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emoji = agent?.emoji as String? ?? '🤖';
    final name = agent?.name as String? ?? context.l10n.appTitle;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(emoji, style: const TextStyle(fontSize: 64)),
                    const SizedBox(height: 12),
                    Text(
                      name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      context.l10n.yourPersonalAssistant,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _SuggestionChip(label: 'What can you do?'),
                        _SuggestionChip(label: '/help'),
                        _SuggestionChip(label: '/status'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Thinking level chip — AppBar quick control
// ---------------------------------------------------------------------------

class _ThinkingLevelChip extends ConsumerWidget {
  const _ThinkingLevelChip();

  static const _levels = ['auto', 'off', 'low', 'medium', 'high'];

  static const _labels = {
    'auto': 'Auto',
    'off': 'Off',
    'low': 'Low',
    'medium': 'Med',
    'high': 'High',
  };

  static const _descriptions = {
    'auto': 'Model decides thinking depth (adaptive)',
    'off': 'No thinking — fastest, lowest cost',
    'low': 'Light thinking — ~1k tokens',
    'medium': 'Balanced thinking — ~5k tokens',
    'high': 'Deep thinking — ~16k tokens (ultrathink)',
  };

  String _currentLabel(String? level) => _labels[level ?? 'auto'] ?? 'Auto';

  bool _isActive(String? level) => level != null && level != 'off';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meta = ref.watch(activeSessionMetaProvider);
    final level = meta?.thinkingLevel; // null = auto
    final active = _isActive(level);
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: ActionChip(
        avatar: Icon(
          Icons.psychology_outlined,
          size: 16,
          color: active ? colors.onPrimary : colors.onSurfaceVariant,
        ),
        label: Text(
          _currentLabel(level),
          style: TextStyle(
            fontSize: 12,
            color: active ? colors.onPrimary : colors.onSurfaceVariant,
          ),
        ),
        backgroundColor: active
            ? colors.primary
            : colors.surfaceContainerHighest,
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
        tooltip: 'Thinking level',
        onPressed: () => _showSheet(context, ref, level),
      ),
    );
  }

  void _showSheet(BuildContext context, WidgetRef ref, String? current) {
    final sm = ref.read(sessionManagerProvider);
    final key = ref.read(activeSessionKeyProvider);

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final colors = theme.colorScheme;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colors.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.psychology_outlined,
                      size: 20,
                      color: colors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Thinking Level',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Controls how much the model reasons before responding. '
                  'Say "ultrathink" in chat for one-turn high thinking.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ..._levels.map((lvl) {
                  final selected = (current ?? 'auto') == lvl;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 0,
                    ),
                    leading: Icon(
                      selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selected ? colors.primary : colors.outlineVariant,
                      size: 20,
                    ),
                    title: Text(
                      _labels[lvl]!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: selected ? colors.primary : null,
                      ),
                    ),
                    subtitle: Text(
                      _descriptions[lvl]!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    onTap: () {
                      final stored = lvl == 'auto' ? null : lvl;
                      sm.setThinkingLevel(key, stored);
                      Navigator.pop(ctx);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SuggestionChip extends ConsumerWidget {
  const _SuggestionChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionChip(
      label: Text(label),
      onPressed: () => ref.read(chatProvider.notifier).sendMessage(label),
    );
  }
}
