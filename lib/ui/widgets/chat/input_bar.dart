import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'slash_commands.dart';
import 'slash_command_picker.dart';
import 'voice_mic_button.dart';
import 'live_voice_button.dart';

/// The chat input bar — text field, attach button, send/stop/mic, slash command autocomplete.
class ChatInputBar extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isProcessing;
  final VoidCallback onSend;
  final VoidCallback? onCancel;
  final VoidCallback? onAttach;
  final VoidCallback? onAttachDocument;
  /// Called when the Live voice button is tapped. If null, no Live button shown.
  final VoidCallback? onLiveVoice;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isProcessing,
    required this.onSend,
    this.onCancel,
    this.onAttach,
    this.onAttachDocument,
    this.onLiveVoice,
  });

  @override
  ConsumerState<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends ConsumerState<ChatInputBar> {
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

  void _openSlashCommands() {
    widget.controller.text = '/';
    widget.controller.selection = const TextSelection.collapsed(offset: 1);
    widget.focusNode.requestFocus();
    setState(() {});
  }

  bool _liveVoiceFeatureAvailable(WidgetRef ref) =>
      ref.watch(activeModelSupportsLiveProvider);

  bool _chatModelIsLiveOnly(WidgetRef ref) =>
      ref.watch(activeAgentChatModelIsLiveOnlyProvider);

  Widget _buildVoiceButton(WidgetRef ref) {
    if (_liveVoiceFeatureAvailable(ref) && widget.onLiveVoice != null) {
      return LiveVoiceButton(onPressed: widget.onLiveVoice!);
    }
    return const VoiceMicButton();
  }

  /// Send + optional Live when chat supports REST and voice call is available.
  Widget _buildSendAndOptionalLive(WidgetRef ref) {
    final showLive =
        _liveVoiceFeatureAvailable(ref) && widget.onLiveVoice != null;
    if (!showLive) {
      return IconButton.filled(
        onPressed: widget.onSend,
        icon: const Icon(Icons.send),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LiveVoiceButton(onPressed: widget.onLiveVoice!),
        const SizedBox(width: 2),
        IconButton.filled(
          onPressed: widget.onSend,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  List<SlashCommandDef> get _suggestions {
    final text = widget.controller.text;
    if (!text.startsWith('/') || text.contains(' ')) return [];
    final query = text.toLowerCase();
    return kSlashCommands.where((c) => c.command.startsWith(query)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final suggestions = _suggestions;

    final contextUsage = ref.watch(contextUsageProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Context usage bar — visible from 10% onwards (system prompt alone
        // puts most agents at ~12% on the first message)
        if (contextUsage >= 0.10)
          _ContextUsageBar(usage: contextUsage),
        if (suggestions.isNotEmpty)
          SlashCommandPicker(
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
            if (event.delta.dy > 2 && widget.focusNode.hasFocus) {
              widget.focusNode.unfocus();
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: 4,
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
                // Slash commands button
                IconButton(
                  onPressed: widget.isProcessing ? null : _openSlashCommands,
                  icon: const Icon(Icons.terminal, size: 20),
                  tooltip: context.l10n.commandsTooltip,
                  visualDensity: VisualDensity.compact,
                ),
                if (widget.onAttach != null || widget.onAttachDocument != null)
                  IconButton(
                    onPressed: widget.isProcessing
                        ? null
                        : () => _showAttachMenu(context),
                    icon: const Icon(Icons.attach_file),
                    tooltip: context.l10n.attachImage,
                    visualDensity: VisualDensity.compact,
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
                if (widget.isProcessing)
                  IconButton.filled(
                    onPressed: widget.onCancel,
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                    icon: const Icon(Icons.stop_rounded),
                  )
                else if (widget.controller.text.trim().isEmpty)
                  _buildVoiceButton(ref)
                else if (_chatModelIsLiveOnly(ref))
                  _buildVoiceButton(ref)
                else
                  _buildSendAndOptionalLive(ref),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A slim context-usage progress bar shown above the input area when the
/// context window is 50%+ full.  Color shifts green → amber → red as usage
/// approaches the auto-compact threshold.
class _ContextUsageBar extends StatelessWidget {
  final double usage; // 0.0 – 1.0

  const _ContextUsageBar({required this.usage});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final Color barColor;
    if (usage < 0.60) {
      barColor = Colors.green.shade400;
    } else if (usage < 0.85) {
      barColor = Colors.amber.shade600;
    } else {
      barColor = colors.error;
    }

    final pct = (usage * 100).round();
    final label = usage >= 0.85
        ? '$pct% — compacting soon'
        : '$pct% context';

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: usage,
                minHeight: 3,
                backgroundColor: colors.outlineVariant.withValues(alpha: 0.3),
                valueColor: AlwaysStoppedAnimation<Color>(barColor),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: barColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
