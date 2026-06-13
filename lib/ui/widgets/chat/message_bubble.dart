import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/data/models/interactive_reply.dart';
import 'package:flutterclaw/ui/theme/semantic_colors.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'copyable_code_block.dart';
import 'terminal_output.dart';
import 'typing_indicator.dart';

/// A single chat message bubble (user, assistant, tool status, image, or document).
class MessageBubble extends ConsumerStatefulWidget {
  final ChatMessage message;
  final VoidCallback onCopy;
  final VoidCallback? onKillProcess;
  final void Function(String data)? onStdinWrite;

  const MessageBubble({super.key, required this.message, required this.onCopy, this.onKillProcess, this.onStdinWrite});

  @override
  ConsumerState<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends ConsumerState<MessageBubble> {
  bool _toolExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isUser = widget.message.isUser;

    if (widget.message.isError) {
      return _buildErrorBubble(context, theme);
    }

    if (widget.message.isToolStatus) {
      return _buildToolPill(context, theme, colors);
    }

    if (isUser && widget.message.imageData != null) {
      return _buildImageBubble(context, theme);
    }

    if (widget.message.isDocumentMessage) {
      return _buildDocumentBubble(context, theme);
    }

    if (isUser && widget.message.text.startsWith('/')) {
      return _buildSlashCommandBubble(context, theme);
    }

    if (!isUser && widget.message.isShellCommand) {
      return _buildShellCommandBubble(context, theme);
    }

    if (!isUser && widget.message.isBtw) {
      return _buildBtwBubble(context, theme);
    }

    if (!isUser && widget.message.interactiveReply != null) {
      return _buildInteractiveBubble(context, theme, colors);
    }

    final agentEmoji = isUser
        ? null
        : (ref.watch(activeAgentProvider)?.emoji ?? '🤖');

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 6, bottom: 4),
              alignment: Alignment.center,
              child: Text(agentEmoji!, style: const TextStyle(fontSize: 18)),
            ),
          ],
          Flexible(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onLongPress: () => _showMessageContextMenu(context),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTokens.spacingLG,
                      vertical: AppTokens.spacingMD,
                    ),
                    decoration: BoxDecoration(
                      color: isUser
                          ? colors.primary
                          : colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(AppTokens.radiusLG),
                        topRight: const Radius.circular(AppTokens.radiusLG),
                        bottomLeft: Radius.circular(isUser ? AppTokens.radiusLG : 4),
                        bottomRight: Radius.circular(isUser ? 4 : AppTokens.radiusLG),
                      ),
                    ),
                    child: widget.message.isStreaming && widget.message.text.isEmpty
                        ? const TypingIndicator()
                        : isUser
                            ? Text(
                                widget.message.text,
                                style: TextStyle(
                                  color: colors.onPrimary,
                                  fontSize: 15,
                                ),
                              )
                            : _buildAssistantText(context, theme, colors),
                  ),
                ),
                // TTS speaking indicator — shown while this message is being read
                Consumer(
                  builder: (ctx, ref2, _) {
                    final speaking = ref2.watch(ttsSpeakingMsgProvider);
                    if (speaking != widget.message.text) return const SizedBox.shrink();
                    return Positioned(
                      top: 0,
                      right: isUser ? null : -10,
                      left: isUser ? -10 : null,
                      child: GestureDetector(
                        onTap: () async {
                          await ref2.read(textToSpeechServiceProvider).stop();
                          ref2.read(ttsSpeakingMsgProvider.notifier).set(null);
                        },
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.stop_rounded,
                            size: 13,
                            color: colors.onPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }

  void _showMessageContextMenu(BuildContext context) {
    final msg = widget.message;
    final colors = Theme.of(context).colorScheme;

    final bool canSpeak = !msg.isToolStatus &&
        !msg.isError &&
        !msg.isDocumentMessage &&
        msg.imageData == null &&
        msg.text.trim().isNotEmpty;

    final bool canSelectText = !msg.isToolStatus &&
        !msg.isDocumentMessage &&
        msg.imageData == null &&
        msg.text.trim().isNotEmpty;

    showModalBottomSheet<void>(
      context: context,
      builder: (sheetCtx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Copy
              ListTile(
                leading: const Icon(Icons.copy_rounded),
                title: Text(context.l10n.copyTooltip),
                onTap: () {
                  Navigator.pop(sheetCtx);
                  widget.onCopy();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.messageCopied),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),

              // Speak (text messages only)
              if (canSpeak)
                Consumer(
                  builder: (ctx2, ref2, _) {
                    final speakingMsg = ref2.watch(ttsSpeakingMsgProvider);
                    final isThisMsg = speakingMsg == msg.text;
                    return ListTile(
                      leading: Icon(
                        isThisMsg
                            ? Icons.stop_circle_outlined
                            : Icons.volume_up_rounded,
                      ),
                      title: Text(
                        isThisMsg
                            ? context.l10n.stopSpeaking
                            : context.l10n.speakMessage,
                      ),
                      onTap: () async {
                        // Capture ref values BEFORE pop — pop disposes the sheet's ref2
                        final tts = ref2.read(textToSpeechServiceProvider);
                        final notifier = ref2.read(ttsSpeakingMsgProvider.notifier);
                        Navigator.pop(sheetCtx);
                        if (isThisMsg) {
                          await tts.stop();
                          notifier.set(null);
                        } else {
                          await tts.stop();
                          notifier.set(msg.text);
                          await tts.speak(
                            _stripMarkdown(msg.text),
                            onDone: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                notifier.set(null);
                              });
                            },
                          );
                        }
                      },
                    );
                  },
                ),

              // Select text
              if (canSelectText)
                ListTile(
                  leading: const Icon(Icons.text_fields_rounded),
                  title: Text(context.l10n.selectText),
                  onTap: () {
                    Navigator.pop(sheetCtx);
                    showDialog<void>(
                      context: context,
                      builder: (dCtx) => AlertDialog(
                        content: SingleChildScrollView(
                          child: SelectableText(
                            msg.text,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dCtx),
                            child: Text(context.l10n.close),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  /// Strip markdown syntax from [text] before passing to TTS.
  static String _stripMarkdown(String text) {
    var s = text;
    // Fenced code blocks → '[code block]'
    s = s.replaceAll(RegExp(r'```[\s\S]*?```'), '[code block]');
    // Inline code → unwrapped content
    s = s.replaceAll(RegExp(r'`([^`]+)`'), r'$1');
    // Headers
    s = s.replaceAll(RegExp(r'^#{1,6}\s+', multiLine: true), '');
    // Bold / italic
    s = s.replaceAll(RegExp(r'\*{1,2}([^*\n]+)\*{1,2}'), r'$1');
    s = s.replaceAll(RegExp(r'_{1,2}([^_\n]+)_{1,2}'), r'$1');
    // Links [text](url) → text
    s = s.replaceAll(RegExp(r'\[([^\]]+)\]\([^)]*\)'), r'$1');
    // Bare URLs
    s = s.replaceAll(RegExp(r'https?://\S+'), 'link');
    // List markers
    s = s.replaceAll(RegExp(r'^\s*[-*]\s+', multiLine: true), '');
    s = s.replaceAll(RegExp(r'^\s*\d+\.\s+', multiLine: true), '');
    // Blockquotes
    s = s.replaceAll(RegExp(r'^>\s*', multiLine: true), '');
    // Collapse whitespace
    s = s.replaceAll(RegExp(r'\n{2,}'), '. ');
    s = s.replaceAll('\n', ' ');
    return s.trim();
  }

  Widget _buildAssistantText(BuildContext context, ThemeData theme, ColorScheme colors) {
    final text = widget.message.text;

    // Check if the text is pure JSON from shell command (contains exit_code, stdout, stderr)
    final trimmed = text.trim();
    if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
      try {
        final json = jsonDecode(trimmed);
        // Check if it's a sandbox result (has exit_code, stdout, stderr fields)
        if (json is Map &&
            json.containsKey('exit_code') &&
            json.containsKey('stdout') &&
            json.containsKey('stderr')) {
          // Render as xterm terminal output
          return TerminalOutput(
            command: 'shell',
            output: jsonEncode(json),
          );
        }
        // It's valid JSON but not a shell result - show as plain text
        return SelectableText(
          text,
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: 13,
            color: colors.onSurfaceVariant,
            height: 1.4,
          ),
        );
      } catch (_) {
        // Not valid JSON, continue with markdown
      }
    }

    // Use markdown for all messages. ValueKey forces full rebuild during
    // streaming to avoid flutter_markdown assertion error in MarkdownBuilder.build.
    // Sanitize mid-stream text to close any unclosed inline/block elements
    // before the parser sees them (prevents _inlines.isEmpty assertion).
    return MarkdownBody(
      key: ValueKey(text.length),
      data: widget.message.isStreaming ? _sanitizeStreamingMarkdown(text) : text,
      selectable: false,
      builders: {
        'pre': CopyableCodeBlockBuilder(context),
      },
      sizedImageBuilder: (config) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              config.uri.toString(),
              width: config.width,
              height: config.height,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.broken_image, size: 18, color: colors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        config.alt ?? 'Image failed to load',
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onTapLink: (text, href, title) {
        if (href != null) {
          launchUrl(Uri.parse(href));
        }
      },
      styleSheet: MarkdownStyleSheet(
        p: TextStyle(color: colors.onSurface, fontSize: 15, height: 1.4),
        h1: TextStyle(
          color: colors.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 1.3,
        ),
        h2: TextStyle(
          color: colors.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          height: 1.3,
        ),
        h3: TextStyle(
          color: colors.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        strong: TextStyle(
          color: colors.onSurface,
          fontWeight: FontWeight.bold,
        ),
        em: TextStyle(
          color: colors.onSurface,
          fontStyle: FontStyle.italic,
        ),
        code: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          color: colors.primary,
          backgroundColor: colors.surfaceContainerHighest,
        ),
        codeblockDecoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        codeblockPadding: const EdgeInsets.all(12),
        blockquote: TextStyle(
          color: colors.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
        blockquoteDecoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          border: Border(
            left: BorderSide(color: colors.primary, width: 3),
          ),
        ),
        blockquotePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        a: TextStyle(color: colors.primary, decoration: TextDecoration.underline),
        listBullet: TextStyle(color: colors.onSurface),
      ),
    );
  }

  Widget _buildToolPill(BuildContext context, ThemeData theme, ColorScheme colors) {
    final running = widget.message.isStreaming == true;
    final hasResult = widget.message.toolResultText != null;
    final isShellTool = widget.message.text.startsWith('run_shell_command');

    // Shell commands show xterm terminal output directly (both streaming and completed)
    if (isShellTool && (hasResult || running)) {
      String command = 'shell';
      if (widget.message.text.contains(': ')) {
        command = widget.message.text.split(': ').skip(1).join(': ');
      }
      return TerminalOutput(
        command: command,
        output: widget.message.toolResultText,
        isStreaming: running,
        onKill: widget.onKillProcess,
        onStdinWrite: running ? widget.onStdinWrite : null,
      );
    }

    // Shell tool with no result yet and not streaming — show a minimal pill
    if (isShellTool && !hasResult && !running) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (!running && hasResult)
                ? () => setState(() => _toolExpanded = !_toolExpanded)
                : null,
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
                  Icon(
                    Icons.build_circle,
                    size: 14,
                    color: colors.primary,
                  ),
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
                  const SizedBox(width: 6),
                  if (running)
                    SizedBox(
                      width: 11,
                      height: 11,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: colors.primary,
                      ),
                    )
                  else ...[
                    Icon(Icons.check, size: 12, color: Colors.green.shade600),
                    if (hasResult) ...[
                      const SizedBox(width: 4),
                      Icon(
                        _toolExpanded ? Icons.expand_less : Icons.expand_more,
                        size: 12,
                        color: colors.onSurfaceVariant,
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          if (_toolExpanded && hasResult)
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
                maxHeight: 200,
              ),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  widget.message.toolResultText!,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }


  /// Renders a `/btw` ephemeral response with a dashed border and flash icon
  /// to make it visually distinct from regular assistant messages.
  Widget _buildBtwBubble(BuildContext context, ThemeData theme) {
    final colors = theme.colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 6, bottom: 4),
            alignment: Alignment.center,
            child: Icon(
              Icons.bolt_outlined,
              size: 18,
              color: colors.tertiary,
            ),
          ),
          Flexible(
            child: GestureDetector(
              onLongPress: () => _showMessageContextMenu(context),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: colors.tertiaryContainer.withValues(alpha: 0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: colors.tertiary.withValues(alpha: 0.5),
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.bolt, size: 12, color: colors.tertiary),
                        const SizedBox(width: 4),
                        Text(
                          'btw',
                          style: TextStyle(
                            fontSize: 11,
                            color: colors.tertiary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    MarkdownBody(
                      data: widget.message.text,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                        p: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onTertiaryContainer,
                        ),
                        code: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          color: colors.onTertiaryContainer,
                          backgroundColor: colors.tertiary.withValues(alpha: 0.1),
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: colors.tertiary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      builders: {'pre': CopyableCodeBlockBuilder(context)},
                      onTapLink: (_, href, _) async {
                        if (href != null) {
                          final uri = Uri.tryParse(href);
                          if (uri != null) await launchUrl(uri);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Renders interactive reply blocks (buttons, selects, text) from a tool result.
  Widget _buildInteractiveBubble(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
  ) {
    final reply = widget.message.interactiveReply!;
    final agentEmoji = ref.watch(activeAgentProvider)?.emoji ?? '🤖';

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 6, bottom: 4),
            alignment: Alignment.center,
            child: Text(agentEmoji, style: const TextStyle(fontSize: 18)),
          ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
              ),
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: reply.blocks.map((block) {
                  if (block is InteractiveTextBlock) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        block.text,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    );
                  }
                  if (block is InteractiveButtonsBlock) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: block.buttons.map((btn) {
                          final (bgColor, fgColor) = switch (btn.style) {
                            InteractiveButtonStyle.success => (
                                colors.tertiary,
                                colors.onTertiary,
                              ),
                            InteractiveButtonStyle.danger => (
                                colors.error,
                                colors.onError,
                              ),
                            InteractiveButtonStyle.secondary => (
                                colors.surfaceContainerHigh,
                                colors.onSurface,
                              ),
                            _ => (colors.primary, colors.onPrimary),
                          };
                          return FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: bgColor,
                              foregroundColor: fgColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => ref
                                .read(chatProvider.notifier)
                                .sendMessage(btn.value),
                            child: Text(btn.label),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  if (block is InteractiveSelectBlock) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: _InteractiveSelect(
                        block: block,
                        onSelected: (value) => ref
                            .read(chatProvider.notifier)
                            .sendMessage(value),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlashCommandBubble(BuildContext context, ThemeData theme) {
    final colors = theme.colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onLongPress: () => _showMessageContextMenu(context),
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

  Widget _buildShellCommandBubble(BuildContext context, ThemeData theme) {
    // Parse the command output - extract from markdown code block if present
    String outputText = widget.message.text;
    String command = 'alpine-shell';

    // Extract command from markdown: ```\n$ command\noutput\n```
    final codeBlockMatch = RegExp(r'```\n\$ (.+?)\n([\s\S]*?)```').firstMatch(outputText);
    if (codeBlockMatch != null) {
      command = codeBlockMatch.group(1) ?? command;
      outputText = codeBlockMatch.group(2) ?? '';
    }

    return TerminalOutput(
      command: command,
      output: outputText.trim(),
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
        onLongPress: () => _showMessageContextMenu(context),
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
        onLongPress: () => _showMessageContextMenu(context),
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

  Widget _buildErrorBubble(BuildContext context, ThemeData theme) {
    final semantic = context.semantic;
    final errorColor = semantic.statusError;
    final statusCode = widget.message.errorStatusCode;

    IconData icon;
    String title;
    if (widget.message.errorTitle != null &&
        widget.message.errorTitle!.isNotEmpty) {
      icon = widget.message.errorTitle!.contains('demasiado grande')
          ? Icons.compress
          : Icons.policy_outlined;
      title = widget.message.errorTitle!;
    } else {
      final l10n = context.l10n;
      switch (statusCode) {
        case 401:
          icon = Icons.key_off;
          title = l10n.invalidApiKey;
        case 402:
          icon = Icons.account_balance_wallet_outlined;
          title = l10n.errorNoBalance;
        case 403:
          icon = Icons.block;
          title = l10n.errorAccessDenied;
        case 404:
          icon = Icons.search_off;
          title = l10n.errorModelNotFound;
        case 429:
          icon = Icons.speed;
          title = l10n.errorRateLimitReached;
        case 500 || 502 || 503 || 529:
          icon = Icons.cloud_off;
          title = l10n.errorServiceUnavailable;
        default:
          icon = Icons.error_outline;
          title = l10n.errorConnection;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: errorColor.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: errorColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: errorColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18, color: errorColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: errorColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.message.text,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton.tonalIcon(
                        onPressed: () =>
                            ref.read(chatProvider.notifier).retryLastTurn(),
                        icon: const Icon(Icons.refresh, size: 16),
                        label: Text(context.l10n.retry),
                      ),
                      if (widget.message.errorCtaUrl != null &&
                          widget.message.errorCtaUrl!.isNotEmpty)
                        FilledButton.tonal(
                          onPressed: () async {
                            final uri =
                                Uri.tryParse(widget.message.errorCtaUrl!);
                            if (uri != null && await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Text(
                            widget.message.errorCtaLabel ?? 'Abrir enlace',
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Closes any unclosed markdown fences/inline-code spans so that
  /// flutter_markdown never sees structurally incomplete content mid-stream.
  static String _sanitizeStreamingMarkdown(String text) {
    if (text.isEmpty) return text;

    // Fenced code blocks (``` at line start)
    final fences = RegExp(r'^```', multiLine: true).allMatches(text).length;
    if (fences.isOdd) {
      // Unclosed code block: close it. Content inside is not inline-parsed.
      return '$text\n```';
    }

    // Inline code (single backticks, skipping ``` sequences)
    int backticks = 0;
    for (int i = 0; i < text.length; i++) {
      if (text[i] == '`') {
        if (i + 2 < text.length && text[i + 1] == '`' && text[i + 2] == '`') {
          i += 2;
          continue;
        }
        backticks++;
      }
    }
    if (backticks.isOdd) {
      return '$text`';
    }

    return text;
  }

  static String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

// ---------------------------------------------------------------------------
// Interactive select widget
// ---------------------------------------------------------------------------

class _InteractiveSelect extends StatefulWidget {
  final InteractiveSelectBlock block;
  final void Function(String value) onSelected;

  const _InteractiveSelect({required this.block, required this.onSelected});

  @override
  State<_InteractiveSelect> createState() => _InteractiveSelectState();
}

class _InteractiveSelectState extends State<_InteractiveSelect> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DropdownButtonFormField<String>(
      initialValue: _selected,
      hint: Text(
        widget.block.placeholder ?? 'Select an option…',
        style: TextStyle(color: colors.onSurface.withValues(alpha: 0.6)),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
      ),
      items: widget.block.options
          .map(
            (opt) => DropdownMenuItem(
              value: opt.value,
              child: Text(opt.label),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() => _selected = value);
        widget.onSelected(value);
      },
    );
  }
}

// ---------------------------------------------------------------------------


