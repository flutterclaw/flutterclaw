import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/widgets/agent_switcher_chip.dart';

// ---------------------------------------------------------------------------
// Slash command definitions (mirrors chat_commands.dart)
// ---------------------------------------------------------------------------

class _SlashCommandDef {
  final String command;
  final String description;
  const _SlashCommandDef(this.command, this.description);
}

const _kSlashCommands = [
  _SlashCommandDef('/help', 'Show available commands'),
  _SlashCommandDef('/status', 'Session info (model, tokens, cost)'),
  _SlashCommandDef('/new', 'Start a new session'),
  _SlashCommandDef('/reset', 'Reset the current session'),
  _SlashCommandDef('/compact', 'Compress session context with AI summary'),
  _SlashCommandDef('/model', 'View or switch model  /model [name]'),
  _SlashCommandDef('/think', 'Set thinking level  off | low | medium | high'),
  _SlashCommandDef('/verbose', 'Toggle verbose mode  on | off'),
  _SlashCommandDef('/usage', 'Usage footer mode  off | tokens | full'),
];

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
      // Auto-scroll when messages change (instead of inside build)
      ref.listenManual(chatProvider, (_, __) => _scrollToBottom());
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _programmaticScroll) return;
    final pos = _scrollController.position;
    _isNearBottom = pos.pixels >= pos.maxScrollExtent - 80;
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

    // Then check if we need to trigger the bootstrap hatch
    if (_hatchChecked) return;
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
      final mimeType =
          image.path.endsWith('.png') ? 'image/png' : 'image/jpeg';

      final caption = _controller.text.trim();
      _controller.clear();

      await ref.read(chatProvider.notifier).sendImageMessage(
            base64Image: base64Image,
            mimeType: mimeType,
            caption: caption.isNotEmpty
                ? caption
                : defaultCaption,
            fileName: image.name,
          );
    } catch (e) {
      if (!mounted) return;
      final isSimulator = e.toString().contains('channel-error') ||
          e.toString().contains('Unable to establish connection');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isSimulator
              ? errorSimulator
              : errorGeneric),
        ),
      );
    }
  }

  void _scrollToBottom({bool force = false}) {
    if (!force && !_isNearBottom) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _programmaticScroll = true;
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
        _programmaticScroll = false;
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    _isNearBottom = true;
    _focusNode.requestFocus();

    await ref.read(chatProvider.notifier).sendMessage(text);
  }

  Future<void> _sendDocumentMessage(String base64Data, String mimeType, String fileName) async {
    await ref.read(chatProvider.notifier).sendDocumentMessage(
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
        SnackBar(content: Text(context.l10n.couldNotOpenDocument(e.toString()))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);
    final theme = Theme.of(context);
    final isProcessing = ref.read(chatProvider.notifier).isProcessing;
    final modelSupportsVision = ref.watch(activeModelSupportsVisionProvider);

    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          const SessionSwitcherChip(),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: context.l10n.newSession,
            onPressed: () => ref.read(chatProvider.notifier).clear(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.smart_toy_outlined,
                            size: 64, color: theme.colorScheme.primary.withAlpha(128)),
                        const SizedBox(height: 16),
                        Text(
                          context.l10n.appTitle,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.yourPersonalAssistant,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return _MessageBubble(
                        message: msg,
                        onCopy: () {
                          Clipboard.setData(ClipboardData(text: msg.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(context.l10n.copiedToClipboard),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
          _InputBar(
            controller: _controller,
            focusNode: _focusNode,
            isProcessing: isProcessing,
            onSend: _sendMessage,
            onAttach: modelSupportsVision ? _pickAndSendImage : null,
            onAttachDocument: _pickAndSendDocument,
          ),
        ],
      ),
      ),
    );
  }
}

class _MessageBubble extends ConsumerStatefulWidget {
  final ChatMessage message;
  final VoidCallback onCopy;

  const _MessageBubble({required this.message, required this.onCopy});

  @override
  ConsumerState<_MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends ConsumerState<_MessageBubble> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isUser = widget.message.isUser;

    if (widget.message.isToolStatus) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.build_circle, size: 14, color: colors.primary),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  widget.message.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.check, size: 12, color: Colors.green.shade600),
            ],
          ),
        ),
      );
    }

    // Check if this is an image message
    if (isUser && widget.message.imageData != null) {
      return _buildImageBubble(context, theme);
    }

    // Check if this is a document message
    if (widget.message.isDocumentMessage) {
      return _buildDocumentBubble(context, theme);
    }

    // Slash command bubbles get a distinct terminal-style look
    if (isUser && widget.message.text.startsWith('/')) {
      return _buildSlashCommandBubble(context, theme);
    }

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: widget.onCopy,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isUser
                ? theme.colorScheme.primary
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(isUser ? 16 : 4),
              bottomRight: Radius.circular(isUser ? 4 : 16),
            ),
          ),
          child: widget.message.isStreaming && widget.message.text.isEmpty
              ? _TypingIndicator()
              : isUser
                  ? SelectableText(
                      widget.message.text,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 15,
                      ),
                    )
                  : MarkdownBody(
                      data: widget.message.text,
                      selectable: true,
                      onTapLink: (text, href, title) {
                        if (href != null) {
                          launchUrl(Uri.parse(href),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      sizedImageBuilder: (config) =>
                          _buildMarkdownImage(config, theme),
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 15,
                          height: 1.4,
                        ),
                        h1: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        h2: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        h3: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        strong: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                        em: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontStyle: FontStyle.italic,
                        ),
                        code: TextStyle(
                          color: theme.colorScheme.primary,
                          backgroundColor:
                              theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                          fontFamily: 'monospace',
                          fontSize: 13.5,
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        codeblockPadding: const EdgeInsets.all(12),
                        blockquoteDecoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: theme.colorScheme.primary,
                              width: 3,
                            ),
                          ),
                        ),
                        blockquotePadding:
                            const EdgeInsets.only(left: 12, top: 4, bottom: 4),
                        listBullet: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 15,
                        ),
                        a: TextStyle(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _buildSlashCommandBubble(BuildContext context, ThemeData theme) {
    final colors = theme.colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onLongPress: widget.onCopy,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(4),
            ),
            border: Border.all(
              color: colors.secondary.withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.terminal, size: 14, color: colors.secondary),
              const SizedBox(width: 6),
              Flexible(
                child: SelectableText(
                  widget.message.text,
                  style: TextStyle(
                    color: colors.onSecondaryContainer,
                    fontSize: 14,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarkdownImage(MarkdownImageConfig config, ThemeData theme) {
    final uri = config.uri;
    const borderRadius = BorderRadius.all(Radius.circular(12));

    Widget imageWidget;

    if (uri.scheme == 'data') {
      // data:image/png;base64,AAAA...
      final dataUri = UriData.fromUri(uri);
      imageWidget = Image.memory(
        dataUri.contentAsBytes(),
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, _, _) => const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.broken_image, color: Colors.grey),
        ),
      );
    } else {
      // Network URL (http/https) — supports GIFs natively
      imageWidget = Image.network(
        uri.toString(),
        fit: BoxFit.cover,
        width: double.infinity,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: CircularProgressIndicator(
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
              ),
            ),
          );
        },
        errorBuilder: (_, _, _) => const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.broken_image, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: imageWidget,
      ),
    );
  }

  Widget _buildImageBubble(BuildContext context, ThemeData theme) {
    final imageBytes = base64Decode(widget.message.imageData!);
    final caption = widget.message.text.trim();
    const radius = BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(4),
    );

    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onLongPress: widget.onCopy,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: radius,
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.memory(
                  imageBytes,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, _, _) => const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.broken_image, color: Colors.white54),
                  ),
                ),
                if (caption.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      caption,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 15,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentBubble(BuildContext context, ThemeData theme) {
    final isUser = widget.message.isUser;
    final fileName = widget.message.documentFileName ?? 'Document';
    final mimeType = widget.message.documentMimeType ?? 'application/pdf';
    final isPdf = mimeType == 'application/pdf';
    final caption = widget.message.text.trim();
    final displayCaption = caption.isNotEmpty && caption != fileName ? caption : null;

    // Estimate file size from base64 data
    final base64Data = widget.message.documentData;
    final fileSizeLabel = base64Data != null
        ? _formatFileSize((base64Data.length * 3 / 4).round())
        : null;

    final ext = fileName.contains('.')
        ? fileName.split('.').last.toUpperCase()
        : 'FILE';

    final bubbleColor = isUser
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceContainerHighest;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: widget.onCopy,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.72,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(isUser ? 16 : 4),
              bottomRight: Radius.circular(isUser ? 4 : 16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Document preview card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: isUser
                      ? theme.colorScheme.onPrimary.withValues(alpha: 0.12)
                      : theme.colorScheme.surfaceContainerHigh,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    // File type icon badge
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isPdf
                            ? const Color(0xFFE53935)
                            : theme.colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isPdf ? Icons.picture_as_pdf : Icons.description,
                            color: Colors.white,
                            size: 22,
                          ),
                          const SizedBox(height: 1),
                          Text(
                            ext,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // File info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isUser
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            [
                              ?fileSizeLabel,
                              ext,
                            ].nonNulls.join(' · '),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isUser
                                  ? theme.colorScheme.onPrimary.withValues(alpha: 0.7)
                                  : theme.colorScheme.onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Caption below the card
              if (displayCaption != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
                  child: Text(
                    displayCaption,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isUser
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              if (displayCaption == null) const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final delay = index * 0.15;
            final value = (_controller.value - delay) % 1.0;
            final opacity = (value < 0.5 ? value * 2 : (1 - value) * 2).clamp(0.3, 1.0);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: opacity),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class _InputBar extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isProcessing;
  final VoidCallback onSend;
  final VoidCallback? onAttach;
  final VoidCallback? onAttachDocument;
  const _InputBar({
    required this.controller,
    required this.focusNode,
    required this.isProcessing,
    required this.onSend,
    this.onAttach,
    this.onAttachDocument,
  });

  @override
  ConsumerState<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<_InputBar> {
  void _showAttachMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.onAttach != null)
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(context.l10n.photoImage),
                onTap: () {
                  Navigator.pop(ctx);
                  widget.onAttach!();
                },
              ),
            if (widget.onAttachDocument != null)
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: Text(context.l10n.documentPdfTxt),
                onTap: () {
                  Navigator.pop(ctx);
                  widget.onAttachDocument!();
                },
              ),
          ],
        ),
      ),
    );
  }

  List<_SlashCommandDef> get _suggestions {
    final text = widget.controller.text;
    if (!text.startsWith('/') || text.contains(' ')) return [];
    final query = text.toLowerCase();
    return _kSlashCommands
        .where((c) => c.command.startsWith(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final suggestions = _suggestions;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (suggestions.isNotEmpty)
          _SlashCommandPicker(
            suggestions: suggestions,
            onSelect: (cmd) {
              widget.controller.text = cmd;
              widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: cmd.length),
              );
              setState(() {});
              widget.focusNode.requestFocus();
            },
          ),
        Listener(
      onPointerMove: (event) {
        // Close keyboard when swiping input bar down
        if (event.delta.dy > 2 && widget.focusNode.hasFocus) {
          widget.focusNode.unfocus();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 12,
          right: 8,
          top: 8,
          bottom: MediaQuery.of(context).padding.bottom + 8,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(color: theme.colorScheme.outlineVariant, width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (widget.onAttach != null || widget.onAttachDocument != null)
              IconButton(
                onPressed: widget.isProcessing
                    ? null
                    : () => _showAttachMenu(context),
                icon: const Icon(Icons.attach_file),
                tooltip: context.l10n.attachImage,
              ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                maxLines: 5,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: widget.isProcessing ? null : (_) => widget.onSend(),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: context.l10n.messageFlutterClaw,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 4),
            IconButton.filled(
              onPressed: widget.isProcessing ? null : widget.onSend,
              icon: widget.isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
            ),
          ],
        ),
      ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Slash command autocomplete picker
// ---------------------------------------------------------------------------

class _SlashCommandPicker extends StatelessWidget {
  final List<_SlashCommandDef> suggestions;
  final ValueChanged<String> onSelect;

  const _SlashCommandPicker({
    required this.suggestions,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      constraints: const BoxConstraints(maxHeight: 260),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        border: Border(
          top: BorderSide(color: colors.outlineVariant, width: 0.5),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final cmd = suggestions[index];
          return InkWell(
            onTap: () => onSelect(cmd.command),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      cmd.command,
                      style: TextStyle(
                        color: colors.onSecondaryContainer,
                        fontSize: 13,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      cmd.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.keyboard_return, size: 14, color: colors.outlineVariant),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
