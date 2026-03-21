import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/ui/theme/semantic_colors.dart';
import 'typing_indicator.dart';

/// A single chat message bubble (user, assistant, tool status, image, or document).
class MessageBubble extends ConsumerStatefulWidget {
  final ChatMessage message;
  final VoidCallback onCopy;

  const MessageBubble({super.key, required this.message, required this.onCopy});

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
            child: GestureDetector(
              onLongPress: widget.onCopy,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isUser
                      ? colors.primary
                      : colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: Radius.circular(isUser ? 16 : 4),
                    bottomRight: Radius.circular(isUser ? 4 : 16),
                  ),
                ),
                child: widget.message.isStreaming && widget.message.text.isEmpty
                    ? const TypingIndicator()
                    : isUser
                        ? SelectableText(
                            widget.message.text,
                            style: TextStyle(
                              color: colors.onPrimary,
                              fontSize: 15,
                            ),
                          )
                        : _buildAssistantText(context, theme, colors),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 6),
          ],
        ],
      ),
    );
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
          // Render as terminal output
          return _buildTerminalOutputFromJson(context, theme, jsonEncode(json));
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

    // Only use markdown for complete messages (not streaming)
    // flutter_markdown crashes during streaming updates (assertion error in MarkdownBuilder.build)
    if (widget.message.isStreaming) {
      return SelectableText(
        text,
        style: TextStyle(
          color: colors.onSurface,
          fontSize: 15,
          height: 1.4,
        ),
      );
    }

    // Use markdown for complete messages
    return MarkdownBody(
      data: text,
      selectable: true,
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

    // Shell commands always show terminal output directly (no pill)
    if (isShellTool && !running && hasResult) {
      return _buildTerminalOutput(context, theme);
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
                    isShellTool ? Icons.terminal : Icons.build_circle,
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

  String _stripAnsiCodes(String text) {
    // Remove ANSI escape codes (color codes, cursor movements, etc)
    var cleaned = text;

    // Handle actual ESC character (0x1B / \u001B)
    cleaned = cleaned.replaceAll(RegExp(r'[\x1B\u001B]\[[0-9;]*[a-zA-Z]'), '');
    cleaned = cleaned.replaceAll(RegExp(r'[\x1B\u001B]\([0-9;]*[a-zA-Z]'), '');
    cleaned = cleaned.replaceAll(RegExp(r'[\x1B\u001B]\[[0-9;]*m'), '');

    // Handle literal string "\u001b" (if double-escaped in JSON)
    cleaned = cleaned.replaceAll(RegExp(r'\\u001[bB]\[[0-9;]*[a-zA-Z]'), '');
    cleaned = cleaned.replaceAll(RegExp(r'\\u001[bB]\[[0-9;]*m'), '');

    return cleaned;
  }

  Widget _buildTerminalOutputFromJson(BuildContext context, ThemeData theme, String jsonResult) {
    final isDark = theme.brightness == Brightness.dark;
    final terminalBg = isDark ? const Color(0xFF1E1E1E) : const Color(0xFF2D2D2D);
    final terminalHeaderBg = isDark ? const Color(0xFF2D2D2D) : const Color(0xFF1E1E1E);
    final terminalText = const Color(0xFF00FF00);
    final terminalHeaderText = const Color(0xFFCCCCCC);
    final errorText = const Color(0xFFFF5F56);

    String output = '';
    int exitCode = -1;

    try {
      var jsonText = jsonResult;

      // Fix malformed JSON if it's missing the opening brace
      if (!jsonText.trim().startsWith('{')) {
        jsonText = '{$jsonText';
      }

      final result = jsonDecode(jsonText);
      final stdout = (result['stdout'] as String?) ?? '';
      final stderr = (result['stderr'] as String?) ?? '';
      exitCode = (result['exit_code'] as int?) ?? -1;

      output = _stripAnsiCodes(stdout);
      if (stderr.isNotEmpty) {
        if (output.isNotEmpty) output += '\n';
        output += _stripAnsiCodes(stderr);
      }

      if (output.isEmpty && exitCode == 0) {
        output = '(command completed successfully)';
      }
    } catch (e) {
      // If JSON parsing fails, try to extract stdout with regex
      final stdoutMatch = RegExp(r'"stdout"\s*:\s*"([^"]*)"').firstMatch(jsonResult);
      final stderrMatch = RegExp(r'"stderr"\s*:\s*"([^"]*)"').firstMatch(jsonResult);

      if (stdoutMatch != null || stderrMatch != null) {
        output = _stripAnsiCodes((stdoutMatch?.group(1) ?? '') + (stderrMatch?.group(1) ?? ''));
      } else {
        // Last resort: show raw text but make it look like terminal output
        output = jsonResult;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
          maxHeight: 300,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: terminalBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: terminalHeaderBg,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Terminal header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: terminalHeaderBg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.terminal, size: 14, color: terminalHeaderText),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exitCode == 0 ? 'exit $exitCode' : 'exit $exitCode (error)',
                      style: TextStyle(
                        color: terminalHeaderText,
                        fontSize: 12,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // macOS control dots
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF5F56),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFBD2E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF27C93F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            // Terminal output
            Flexible(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onLongPress: widget.onCopy,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: SelectableText(
                      output.trim(),
                      style: TextStyle(
                        color: exitCode != 0 ? errorText : terminalText,
                        fontSize: 13,
                        fontFamily: 'monospace',
                        height: 1.4,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTerminalOutput(BuildContext context, ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    final terminalBg = isDark ? const Color(0xFF1E1E1E) : const Color(0xFF2D2D2D);
    final terminalHeaderBg = isDark ? const Color(0xFF2D2D2D) : const Color(0xFF1E1E1E);
    final terminalText = const Color(0xFF00FF00);
    final terminalHeaderText = const Color(0xFFCCCCCC);
    final errorText = const Color(0xFFFF5F56);

    // Extract command from message text (format: "run_shell_command: <cmd>")
    String command = 'shell';
    if (widget.message.text.contains(': ')) {
      command = widget.message.text.split(': ').skip(1).join(': ');
    }

    String output = '';
    int exitCode = -1;

    try {
      var jsonText = widget.message.toolResultText!;

      // Fix malformed JSON if it's missing the opening brace
      if (!jsonText.trim().startsWith('{')) {
        jsonText = '{$jsonText';
      }

      final result = jsonDecode(jsonText);
      final stdout = (result['stdout'] as String?) ?? '';
      final stderr = (result['stderr'] as String?) ?? '';
      exitCode = (result['exit_code'] as int?) ?? -1;

      // Combine and clean stdout and stderr (remove ANSI color codes)
      output = _stripAnsiCodes(stdout);
      if (stderr.isNotEmpty) {
        if (output.isNotEmpty) output += '\n';
        output += _stripAnsiCodes(stderr);
      }

      // Handle empty output cases
      if (output.trim().isEmpty) {
        if (exitCode == 0) {
          output = '(command completed successfully)';
        } else if (result['timed_out'] == true) {
          output = 'Command timed out (>30s).\nTry using a longer timeout for network operations like "apk add".';
          exitCode = 124; // Standard timeout exit code
        } else {
          output = '(no output, exit code: $exitCode)';
        }
      }
    } catch (e) {
      // If JSON parsing fails, try to extract stdout with regex
      final text = widget.message.toolResultText!;
      final stdoutMatch = RegExp(r'"stdout"\s*:\s*"([^"]*)"').firstMatch(text);
      final stderrMatch = RegExp(r'"stderr"\s*:\s*"([^"]*)"').firstMatch(text);
      final timedOutMatch = RegExp(r'"timed_out"\s*:\s*true').hasMatch(text);

      if (timedOutMatch) {
        output = 'Command timed out (>30s).\nTry using a longer timeout for network operations like "apk add".';
        exitCode = 124;
      } else if (stdoutMatch != null || stderrMatch != null) {
        output = _stripAnsiCodes((stdoutMatch?.group(1) ?? '') + (stderrMatch?.group(1) ?? ''));
        if (output.trim().isEmpty) {
          output = '(no output)';
        }
      } else {
        // Last resort: show raw text but make it look like terminal output
        output = text.isNotEmpty ? text : '(empty result)';
      }
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.85,
        maxHeight: 300,
      ),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: terminalBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: terminalHeaderBg,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Terminal header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: terminalHeaderBg,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.terminal, size: 14, color: terminalHeaderText),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '\$ $command',
                    style: TextStyle(
                      color: terminalHeaderText,
                      fontSize: 12,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // macOS control dots
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5F56),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFBD2E),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF27C93F),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          // Terminal output
          Flexible(
            child: SingleChildScrollView(
              child: GestureDetector(
                onLongPress: widget.onCopy,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: SelectableText(
                    output.trim(),
                    style: TextStyle(
                      color: exitCode != 0 ? errorText : terminalText,
                      fontSize: 13,
                      fontFamily: 'monospace',
                      height: 1.4,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
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

  Widget _buildShellCommandBubble(BuildContext context, ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;

    // Parse the command output - extract from markdown code block if present
    String outputText = widget.message.text;
    String? command;

    // Extract command from markdown: ```\n$ command\noutput\n```
    final codeBlockMatch = RegExp(r'```\n\$ (.+?)\n([\s\S]*?)```').firstMatch(outputText);
    if (codeBlockMatch != null) {
      command = codeBlockMatch.group(1);
      outputText = codeBlockMatch.group(2) ?? '';
    }

    // Terminal colors
    final terminalBg = isDark ? const Color(0xFF1E1E1E) : const Color(0xFF2D2D2D);
    final terminalHeaderBg = isDark ? const Color(0xFF2D2D2D) : const Color(0xFF1E1E1E);
    final terminalText = const Color(0xFF00FF00); // Classic green terminal text
    final terminalHeaderText = const Color(0xFFCCCCCC);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: terminalBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: terminalHeaderBg,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Terminal header bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: terminalHeaderBg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.terminal, size: 14, color: terminalHeaderText),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      command ?? 'alpine-shell',
                      style: TextStyle(
                        color: terminalHeaderText,
                        fontSize: 12,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Terminal control dots
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF5F56),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFBD2E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF27C93F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            // Terminal output content
            GestureDetector(
              onLongPress: widget.onCopy,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SelectableText(
                  outputText.trim(),
                  style: TextStyle(
                    color: terminalText,
                    fontSize: 13,
                    fontFamily: 'monospace',
                    height: 1.4,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
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
      switch (statusCode) {
        case 401:
          icon = Icons.key_off;
          title = 'Clave API inválida';
        case 402:
          icon = Icons.account_balance_wallet_outlined;
          title = 'Sin saldo';
        case 403:
          icon = Icons.block;
          title = 'Acceso denegado';
        case 404:
          icon = Icons.search_off;
          title = 'Modelo no encontrado';
        case 429:
          icon = Icons.speed;
          title = 'Límite de uso alcanzado';
        case 500 || 502 || 503 || 529:
          icon = Icons.cloud_off;
          title = 'Servicio no disponible';
        default:
          icon = Icons.error_outline;
          title = 'Error de conexión';
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
                  if (widget.message.errorCtaUrl != null &&
                      widget.message.errorCtaUrl!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FilledButton.tonal(
                        onPressed: () async {
                          final uri = Uri.tryParse(widget.message.errorCtaUrl!);
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
                    ),
                  ],
                ],
              ),
            ),
          ],
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
