import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xterm/xterm.dart';

enum _TerminalHeightMode { compact, standard, expanded }

/// Renders shell command output using the xterm terminal emulator.
/// Supports ANSI colors, cursor positioning, alternate screen buffer,
/// live streaming output, and interactive keyboard input.
class TerminalOutput extends StatefulWidget {
  /// Raw output text (may contain ANSI escape codes).
  /// During streaming: accumulated raw text lines.
  /// After completion: JSON string with {exit_code, stdout, stderr}.
  final String? output;

  /// Whether the command is still running (live streaming).
  final bool isStreaming;

  /// Called when the user taps the kill button.
  final VoidCallback? onKill;

  /// Called when the user types in the terminal during streaming.
  /// Sends raw character data to the VM's stdin.
  final void Function(String data)? onStdinWrite;

  /// Command string shown in header (e.g. "python3 demo.py").
  final String command;

  const TerminalOutput({
    super.key,
    this.output,
    this.isStreaming = false,
    this.onKill,
    this.onStdinWrite,
    required this.command,
  });

  @override
  State<TerminalOutput> createState() => _TerminalOutputState();
}

class _TerminalOutputState extends State<TerminalOutput> {
  late Terminal _terminal;
  String _lastOutput = '';
  int? _exitCode;
  _TerminalHeightMode _heightMode = _TerminalHeightMode.compact;

  @override
  void initState() {
    super.initState();
    _terminal = Terminal(maxLines: 1000, onOutput: _handleTerminalOutput);
    final initial = widget.output ?? '';
    if (initial.isEmpty && widget.isStreaming) {
      // Show a dim placeholder so the terminal isn't blank while waiting
      // for the first output (common with slow ops like apk/network).
      _terminal.write('\x1b[2mRunning...\x1b[0m');
    }
    _applyOutput(initial);
  }

  /// Forwards user keystrokes to the VM's stdin when streaming.
  void _handleTerminalOutput(String data) {
    if (widget.isStreaming && widget.onStdinWrite != null) {
      widget.onStdinWrite!(data);
    }
  }

  @override
  void didUpdateWidget(TerminalOutput old) {
    super.didUpdateWidget(old);
    final newOutput = widget.output ?? '';
    if (newOutput != _lastOutput) {
      _applyOutput(newOutput);
    }
  }

  /// Normalize line endings for xterm: bare `\n` only moves the cursor down
  /// without returning to column 0, causing a "staircase" effect. Ensure every
  /// `\n` is preceded by `\r` so the cursor resets to the left margin.
  static String _normalizeForXterm(String s) =>
      s.replaceAll('\r\n', '\n').replaceAll('\n', '\r\n');

  void _applyOutput(String text) {
    if (text.isEmpty) {
      debugPrint('[TermOut] _applyOutput: empty text, skip');
      _lastOutput = text;
      return;
    }

    // Check if this is the final JSON result (after CLEAR)
    final trimmed = text.trim();
    if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
      try {
        final json = jsonDecode(trimmed);
        if (json is Map &&
            json.containsKey('exit_code') &&
            json.containsKey('stdout')) {
          // Final structured result.
          final stdout = (json['stdout'] as String?) ?? '';
          final stderr = (json['stderr'] as String?) ?? '';
          final newExitCode = (json['exit_code'] as int?) ?? 0;
          final timedOut = json['timed_out'] == true;

          final stdoutTrimmed = stdout.trim();
          final stderrTrimmed = stderr.trim();
          debugPrint('[TermOut] JSON: heightMode=$_heightMode stdoutLen=${stdout.length} stdoutTrimLen=${stdoutTrimmed.length} stderr=${stderr.length} exit=$newExitCode timedOut=$timedOut');
          debugPrint('[TermOut] JSON stdout preview: "${stdoutTrimmed.substring(0, stdoutTrimmed.length.clamp(0, 80))}"');

          // Always replace xterm content with the authoritative clean output
          // from the CLEAR JSON. This eliminates shell noise (prompt echoes,
          // cd wrapper lines, boot probe tail) that leaked into streaming view.
          _terminal.buffer.clear();
          _terminal.setCursor(0, 0);
          if (stdoutTrimmed.isNotEmpty || stderrTrimmed.isNotEmpty) {
            if (stdoutTrimmed.isNotEmpty) _terminal.write(_normalizeForXterm(stdoutTrimmed));
            if (stderrTrimmed.isNotEmpty) _terminal.write('\x1b[31m${_normalizeForXterm(stderrTrimmed)}\x1b[0m');
            _setHeightMode(_TerminalHeightMode.standard);
          } else if (timedOut) {
            _terminal.write(
                '\x1b[33mCommand timed out (>${(json['timeout_ms'] ?? 30000) ~/ 1000}s).\r\n'
                'Try using a longer timeout for network operations.\x1b[0m');
            _setHeightMode(_TerminalHeightMode.standard);
          } else {
            debugPrint('[TermOut] JSON: truly no output, exitCode=$newExitCode');
            if (newExitCode == 0) {
              _terminal.write('\x1b[2m(no output)\x1b[0m');
            } else {
              _terminal.write('\x1b[31m(exit code: $newExitCode)\x1b[0m');
            }
            _setHeightMode(_TerminalHeightMode.standard);
          }

          if (newExitCode != _exitCode) {
            setState(() => _exitCode = newExitCode);
          } else {
            _exitCode = newExitCode;
          }
          _lastOutput = text;
          return;
        }
      } catch (_) {
        // Not valid JSON, treat as raw text
      }
    }

    // Raw streaming text — write only the delta.
    // Skip whitespace-only content to avoid expanding the terminal height
    // before real output arrives (e.g. when noise stripping leaves only \n\n).
    if (text.startsWith(_lastOutput) && _lastOutput.isNotEmpty) {
      final delta = text.substring(_lastOutput.length);
      if (delta.isNotEmpty && delta.trim().isNotEmpty) {
        debugPrint('[TermOut] streaming delta len=${delta.length} (total=${text.length})');
        // First real content after compact (waiting) state: clear the
        // "Running..." placeholder before writing actual output.
        if (_heightMode == _TerminalHeightMode.compact) {
          _terminal.buffer.clear();
          _terminal.setCursor(0, 0);
        }
        _terminal.write(_normalizeForXterm(delta));
        _setHeightMode(_TerminalHeightMode.standard);
      }
    } else {
      final hasVisibleContent = text.trim().isNotEmpty;
      debugPrint('[TermOut] full replacement len=${text.length} visible=$hasVisibleContent');
      if (hasVisibleContent) {
        // Full replacement — only render and expand if there's real content.
        _terminal.buffer.clear();
        _terminal.setCursor(0, 0);
        _terminal.write(_normalizeForXterm(text));
        _setHeightMode(_TerminalHeightMode.standard);
      }
    }
    _lastOutput = text;
  }

  void _setHeightMode(_TerminalHeightMode mode) {
    if (mode != _heightMode) {
      setState(() => _heightMode = mode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final terminalBg = isDark ? const Color(0xFF1E1E1E) : const Color(0xFF2D2D2D);
    final terminalHeaderBg =
        isDark ? const Color(0xFF2D2D2D) : const Color(0xFF1E1E1E);
    const terminalHeaderText = Color(0xFFCCCCCC);

    final double terminalHeight;
    switch (_heightMode) {
      case _TerminalHeightMode.compact:
        terminalHeight = 60;
      case _TerminalHeightMode.standard:
        terminalHeight = 160;
      case _TerminalHeightMode.expanded:
        terminalHeight = MediaQuery.of(context).size.height * 0.65;
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.85,
      ),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: terminalBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: terminalHeaderBg, width: 1),
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
                const Icon(Icons.terminal, size: 14, color: terminalHeaderText),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '\$ ${widget.command}',
                    style: const TextStyle(
                      color: terminalHeaderText,
                      fontSize: 12,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.isStreaming) ...[
                  // Ctrl+C button (iOS has no physical Ctrl key)
                  GestureDetector(
                    onTap: () => widget.onStdinWrite?.call('\x03'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF444444),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '^C',
                        style: TextStyle(
                          color: Color(0xFFFFBD2E),
                          fontSize: 10,
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Running indicator
                  const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Color(0xFF27C93F),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Kill button
                  GestureDetector(
                    onTap: widget.onKill,
                    child: const Icon(
                      Icons.stop_circle,
                      size: 16,
                      color: Color(0xFFFF5F56),
                    ),
                  ),
                ] else ...[
                  // Expand/collapse button (only when has content)
                  if (_heightMode != _TerminalHeightMode.compact) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _heightMode = _heightMode == _TerminalHeightMode.expanded
                              ? _TerminalHeightMode.standard
                              : _TerminalHeightMode.expanded;
                        });
                      },
                      child: Icon(
                        _heightMode == _TerminalHeightMode.expanded
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen,
                        size: 16,
                        color: terminalHeaderText,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // Exit code indicator + macOS dots
                  if (_exitCode != null && _exitCode != 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        'exit $_exitCode',
                        style: const TextStyle(
                          color: Color(0xFFFF5F56),
                          fontSize: 10,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
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
              ],
            ),
          ),
          // Terminal body — loading placeholder or xterm emulator.
          // When streaming with no output yet, show a prominent waiting state
          // so the user can see the agent is actively working.
          if (widget.isStreaming && _heightMode == _TerminalHeightMode.compact)
            _WaitingBody(bg: terminalBg)
          else
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: terminalHeight,
              child: TerminalView(
                _terminal,
                readOnly: !widget.isStreaming,
                autofocus: false,
                theme: TerminalTheme(
                  cursor: terminalBg,
                  selection: const Color(0x40FFFFFF),
                  foreground: const Color(0xFFCCCCCC),
                  background: terminalBg,
                  black: const Color(0xFF000000),
                  red: const Color(0xFFFF5F56),
                  green: const Color(0xFF27C93F),
                  yellow: const Color(0xFFFFBD2E),
                  blue: const Color(0xFF6CA0DC),
                  magenta: const Color(0xFFC678DD),
                  cyan: const Color(0xFF56B6C2),
                  white: const Color(0xFFCCCCCC),
                  brightBlack: const Color(0xFF666666),
                  brightRed: const Color(0xFFFF6E67),
                  brightGreen: const Color(0xFF5AF78E),
                  brightYellow: const Color(0xFFF4F99D),
                  brightBlue: const Color(0xFFCAA9FA),
                  brightMagenta: const Color(0xFFFF92D0),
                  brightCyan: const Color(0xFF9AEDFE),
                  brightWhite: const Color(0xFFFFFFFF),
                  searchHitBackground: const Color(0x40FFFF00),
                  searchHitBackgroundCurrent: const Color(0x80FFFF00),
                  searchHitForeground: const Color(0xFFFFFFFF),
                ),
                textStyle: const TerminalStyle(fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
}

/// Animated "waiting for output" body shown inside TerminalOutput while a
/// command is running but hasn't produced any output yet.
class _WaitingBody extends StatefulWidget {
  final Color bg;
  const _WaitingBody({required this.bg});

  @override
  State<_WaitingBody> createState() => _WaitingBodyState();
}

class _WaitingBodyState extends State<_WaitingBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: widget.bg,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          FadeTransition(
            opacity: _fade,
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Color(0xFF27C93F),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Running…',
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}
