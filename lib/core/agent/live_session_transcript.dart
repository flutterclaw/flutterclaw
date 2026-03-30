import 'dart:convert';

import 'package:flutterclaw/core/providers/provider_interface.dart';

/// Serializes [messages] from [SessionManager.getContextMessages] into a single
/// block for Gemini Live [systemInstruction], matching chat transcript semantics.
///
/// When over [maxChars], **oldest** turns are dropped first so recent context
/// is preserved (same order as REST chat, tail-priority truncation).
String formatContextMessagesForLiveSystemInstruction(
  List<LlmMessage> messages, {
  required int maxChars,
}) {
  if (maxChars <= 0 || messages.isEmpty) return '';

  final blocks = <String>[];
  for (final m in messages) {
    final b = _formatOne(m);
    if (b != null && b.isNotEmpty) {
      blocks.add(b);
    }
  }
  if (blocks.isEmpty) return '';

  const sep = '\n\n';
  const header = '# Conversation transcript (continuity)\n\n';
  const omitted = '[... earlier transcript truncated for size ...]\n\n';

  var start = 0;
  while (start < blocks.length) {
    final prefix = start > 0 ? omitted : '';
    final joined = blocks.sublist(start).join(sep);
    if (header.length + prefix.length + joined.length <= maxChars) {
      return '$header$prefix$joined';
    }
    start++;
  }

  final last = blocks.last;
  final prefix = omitted;
  var room = maxChars - header.length - prefix.length;
  if (room < 1) {
    room = maxChars - header.length;
    if (room < 1) {
      return header.substring(0, maxChars.clamp(0, header.length));
    }
    if (last.length <= room) {
      return '$header$last';
    }
    return '$header${last.substring(last.length - room)}';
  }
  if (last.length <= room) {
    return '$header$prefix$last';
  }
  return '$header$prefix${last.substring(last.length - room)}';
}

String? _formatOne(LlmMessage m) {
  switch (m.role) {
    case 'system':
      final t = _textualContent(m.content);
      if (t == null || t.isEmpty) return null;
      return 'System:\n$t';
    case 'user':
      final t = _textualContent(m.content);
      if (t == null || t.isEmpty) return null;
      return 'User:\n$t';
    case 'assistant':
      return _formatAssistant(m);
    case 'tool':
      return _formatTool(m);
    default:
      final t = _textualContent(m.content);
      if (t == null || t.isEmpty) return null;
      return '${m.role}:\n$t';
  }
}

String? _formatAssistant(LlmMessage m) {
  final buf = StringBuffer();
  final text = _textualContent(m.content);
  if (text != null && text.isNotEmpty) {
    buf.writeln(text);
  }
  final calls = m.toolCalls;
  if (calls != null && calls.isNotEmpty) {
    for (final tc in calls) {
      final args = tc.function.arguments;
      final argsSnippet =
          args.length > 800 ? '${args.substring(0, 800)}…' : args;
      buf.writeln('[calling ${tc.function.name}: $argsSnippet]');
    }
  }
  if (buf.isEmpty) return null;
  return 'Assistant:\n${buf.toString().trim()}';
}

String? _formatTool(LlmMessage m) {
  final t = _textualContent(m.content);
  if (t == null || t.isEmpty) return null;
  final label = m.name ?? m.toolCallId ?? 'tool';
  final capped = t.length > 12000
      ? '${t.substring(0, 12000)}\n[...tool output truncated...]'
      : t;
  return 'Tool ($label):\n$capped';
}

String? _textualContent(dynamic content) {
  if (content == null) return null;
  if (content is String) {
    final s = content.trim();
    return s.isEmpty ? null : s;
  }
  if (content is List) {
    final parts = <String>[];
    for (final item in content) {
      if (item is Map) {
        final type = item['type'];
        if (type == 'text') {
          final text = item['text']?.toString().trim();
          if (text != null && text.isNotEmpty) parts.add(text);
        } else if (type == 'image') {
          parts.add('[image]');
        } else {
          parts.add(jsonEncode(item));
        }
      } else {
        parts.add(item.toString());
      }
    }
    if (parts.isEmpty) return null;
    return parts.join('\n');
  }
  return content.toString().trim().isEmpty ? null : content.toString();
}
