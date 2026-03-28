/// On-device LLM provider.
///
/// Bridges to native APIs via platform channels:
///   iOS 26+  — Apple Foundation Models (FoundationModels framework)
///   Android  — Gemini Nano via Google AI Edge SDK (AICore)
///
/// Tool calling is handled via prompt injection: the model is instructed to
/// emit a JSON blob when it wants to use a tool, and this provider parses
/// that blob back into [ToolCall] objects understood by the agent loop.
library;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'provider_interface.dart';

final _log = Logger('flutterclaw.on_device');

class OnDeviceProvider implements LlmProvider {
  static const _channel = MethodChannel('ai.flutterclaw/on_device_llm');
  static const _streamChannel = EventChannel('ai.flutterclaw/on_device_llm_stream');

  @override
  String get name => 'ondevice';

  @override
  String get defaultApiBase => 'on-device';

  /// Cached availability result — checked once and reused.
  static Map<String, dynamic>? _availability;

  /// Whether the on-device model is available on this device.
  static bool get isAvailable => _availability?['available'] == true;

  /// Checks on-device model availability. Caches the result.
  static Future<Map<String, dynamic>> checkAvailability() async {
    if (_availability != null) return _availability!;
    try {
      final result = await _channel.invokeMapMethod<String, dynamic>(
        'check_availability',
      );
      _availability = result ?? {'available': false, 'reason': 'No response from native'};
    } on PlatformException catch (e) {
      _availability = {'available': false, 'reason': e.message ?? 'Platform error'};
    } catch (e) {
      _availability = {'available': false, 'reason': e.toString()};
    }
    return _availability!;
  }

  /// Resets the cached availability (useful for testing or after OS updates).
  static void resetAvailabilityCache() => _availability = null;

  // ── LlmProvider ─────────────────────────────────────────────────────────

  @override
  Future<LlmResponse> chatCompletion(LlmRequest request) async {
    // Lazy availability check — no need to call checkAvailability() explicitly.
    if (_availability == null) await checkAvailability();
    if (!isAvailable) {
      throw Exception(
        'On-device model not available: '
        '${_availability?['reason'] ?? 'unknown'}',
      );
    }

    final simplifiedMessages = _simplifyMessages(request.messages);
    try {
      final result = await _channel.invokeMapMethod<String, dynamic>(
        'generate',
        {
          'messages': simplifiedMessages,
          'max_tokens': request.maxTokens,
          'temperature': request.temperature,
        },
      );

      if (result == null) {
        return const LlmResponse(
          content: 'No response from on-device model.',
          finishReason: 'stop',
        );
      }

      final rawResult = result['content'] as String? ?? '';
      _log.info('chatCompletion raw (${rawResult.length} chars): ${rawResult.length > 200 ? '${rawResult.substring(0, 200)}...' : rawResult}');
      final rawContent = _stripPromptEcho(rawResult);
      _log.info('chatCompletion after stripEcho (${rawContent.length} chars): ${rawContent.length > 200 ? '${rawContent.substring(0, 200)}...' : rawContent}');
      final toolCalls = _extractToolCalls(rawContent);
      final content = toolCalls != null ? _stripToolCallJson(rawContent) : rawContent;

      return LlmResponse(
        content: content.isNotEmpty ? content : null,
        toolCalls: toolCalls,
        finishReason: result['finish_reason'] as String? ?? 'stop',
        usage: _parseUsage(result['usage']),
      );
    } on PlatformException catch (e) {
      throw Exception('On-device generation failed: ${e.message}');
    }
  }

  @override
  Stream<LlmStreamEvent> chatCompletionStream(LlmRequest request) async* {
    if (_availability == null) await checkAvailability();
    if (!isAvailable) {
      throw Exception(
        'On-device model not available: '
        '${_availability?['reason'] ?? 'unknown'}',
      );
    }

    final simplifiedMessages = _simplifyMessages(request.messages);
    final stream = _streamChannel.receiveBroadcastStream({
      'messages': simplifiedMessages,
      'max_tokens': request.maxTokens,
      'temperature': request.temperature,
    });

    // Accumulate streaming content for tool call extraction and echo
    // detection at the end.
    final buffer = StringBuffer();
    bool foundToolCall = false;
    // Track whether we've already started yielding deltas. We buffer the
    // first few chunks to detect prompt echo before emitting anything.
    bool echoChecked = false;
    bool isEchoing = false;
    final earlyBuffer = StringBuffer();
    // Once we have this many chars we decide whether the stream is echoing.
    const echoDetectThreshold = 80;

    await for (final event in stream) {
      if (event is! Map) continue;
      final map = Map<String, dynamic>.from(event);
      final type = map['type'] as String?;

      switch (type) {
        case 'delta':
          final delta = map['content'] as String? ?? '';
          buffer.write(delta);

          if (!foundToolCall && buffer.toString().contains('{"tool_call"')) {
            foundToolCall = true;
          }

          if (foundToolCall) break; // buffer silently

          if (!echoChecked) {
            earlyBuffer.write(delta);
            if (earlyBuffer.length >= echoDetectThreshold) {
              echoChecked = true;
              final soFar = earlyBuffer.toString();
              isEchoing = (soFar.contains('User:') && soFar.contains('AI:')) ||
                  soFar.contains('[System]');
              if (!isEchoing) {
                // Flush buffered deltas as one chunk.
                yield LlmStreamEvent(contentDelta: soFar);
              }
              // If echoing, we suppress deltas and will emit cleaned at 'done'.
            }
          } else if (!isEchoing) {
            yield LlmStreamEvent(contentDelta: delta);
          }

        case 'done':
          final fullContent = buffer.toString();
          _log.info('stream done: ${fullContent.length} chars, echoChecked=$echoChecked, isEchoing=$isEchoing, foundToolCall=$foundToolCall');
          _log.fine('stream full content: ${fullContent.length > 300 ? '${fullContent.substring(0, 300)}...' : fullContent}');

          // If we never hit the threshold, check now.
          if (!echoChecked) {
            echoChecked = true;
            final soFar = earlyBuffer.toString();
            isEchoing = (soFar.contains('User:') && soFar.contains('AI:')) ||
                soFar.contains('[System]');
            _log.info('stream late echo check: isEchoing=$isEchoing soFar=${soFar.length} chars');
            if (!isEchoing && !foundToolCall) {
              yield LlmStreamEvent(contentDelta: soFar);
            }
          }

          // Emit cleaned content if we detected echo.
          if (isEchoing && !foundToolCall) {
            final cleaned = _stripPromptEcho(fullContent);
            _log.info('stream echo cleaned: ${cleaned.length} chars');
            if (cleaned.isNotEmpty) {
              yield LlmStreamEvent(contentDelta: cleaned);
            }
          }

          // If we buffered a tool call, emit it now.
          if (foundToolCall) {
            final toolCalls = _extractToolCalls(fullContent);
            if (toolCalls != null) {
              for (final tc in toolCalls) {
                yield LlmStreamEvent(toolCallDelta: tc);
              }
            }
          }
          yield LlmStreamEvent(
            finishReason: map['finish_reason'] as String? ?? 'stop',
            usage: _parseUsage(map['usage']),
            isDone: true,
          );
        case 'error':
          throw Exception(map['message'] ?? 'Stream error from on-device model');
      }
    }
  }

  // ── Message simplification ───────────────────────────────────────────────

  /// Converts [LlmMessage] list to a simple [{role, content}] list.
  /// - Strips multimodal content (images) since on-device models are text-only.
  /// - Converts tool call/result messages to plain text.
  /// - Keeps only the last [_maxHistoryMessages] user/assistant turns.
  static const _maxHistoryMessages = 4;

  static List<Map<String, dynamic>> _simplifyMessages(List<LlmMessage> messages) {
    final simplified = <Map<String, dynamic>>[];

    for (final msg in messages) {
      final role = msg.role;
      String content;

      if (msg.content is String) {
        content = msg.content as String;
      } else if (msg.content is List) {
        // Extract text blocks only — drop images/audio.
        final blocks = msg.content as List;
        final textParts = <String>[];
        for (final block in blocks) {
          if (block is Map) {
            if (block['type'] == 'text') {
              textParts.add(block['text']?.toString() ?? '');
            }
            // Explicitly skip image/audio blocks.
          } else if (block is String) {
            textParts.add(block);
          }
        }
        content = textParts.join('\n').trim();
      } else {
        content = msg.content?.toString() ?? '';
      }

      // Convert tool result messages to plain assistant context.
      final effectiveRole = role == 'tool' ? 'user' : role;
      if (role == 'tool') {
        content = 'Tool result: $content';
      }

      // Convert tool calls in assistant messages to text.
      if (role == 'assistant' && (msg.toolCalls?.isNotEmpty ?? false)) {
        final calls = msg.toolCalls!
            .map((tc) => '${tc.function.name}(${tc.function.arguments})')
            .join(', ');
        content = content.isNotEmpty
            ? '$content\n[Calling tools: $calls]'
            : '[Calling tools: $calls]';
      }

      if (content.isNotEmpty) {
        simplified.add({'role': effectiveRole, 'content': content});
      }
    }

    // Keep system message + last N messages to fit context window.
    if (simplified.length <= _maxHistoryMessages + 1) return simplified;

    final systemMessages = simplified.where((m) => m['role'] == 'system').toList();
    final nonSystem = simplified.where((m) => m['role'] != 'system').toList();
    final recent = nonSystem.length > _maxHistoryMessages
        ? nonSystem.sublist(nonSystem.length - _maxHistoryMessages)
        : nonSystem;

    final result = [...systemMessages, ...recent];

    // Safety net: truncate system messages to prevent context overflow.
    // On-device models have ~4K tokens (~16K chars). Cap system content
    // to leave room for conversation history and response generation.
    const maxSystemChars = 3200;
    for (final msg in result) {
      if (msg['role'] == 'system') {
        final content = msg['content'] as String;
        if (content.length > maxSystemChars) {
          msg['content'] = '${content.substring(0, maxSystemChars)}\n[truncated]';
        }
      }
    }

    return result;
  }

  // ── Tool call extraction ─────────────────────────────────────────────────

  /// Extracts tool calls from model output that follows the prompted format:
  ///   {"tool_call": {"name": "tool_name", "arguments": {"arg": "val"}}}
  static List<ToolCall>? _extractToolCalls(String content) {
    final regex = RegExp(
      r'\{"tool_call"\s*:\s*\{[^}]*"name"\s*:[^}]*\}[^}]*\}',
      dotAll: true,
    );
    final matches = regex.allMatches(content);
    if (matches.isEmpty) return null;

    final calls = <ToolCall>[];
    for (final match in matches) {
      try {
        final json = jsonDecode(match.group(0)!) as Map<String, dynamic>;
        final tc = json['tool_call'] as Map<String, dynamic>;
        final name = tc['name'] as String?;
        if (name == null || name.isEmpty) continue;
        final arguments = tc['arguments'];
        final argsJson = arguments is String
            ? arguments
            : jsonEncode(arguments ?? <String, dynamic>{});
        calls.add(ToolCall(
          id: 'ondevice_${calls.length}_${DateTime.now().millisecondsSinceEpoch}',
          function: ToolCallFunction(name: name, arguments: argsJson),
        ));
      } catch (_) {
        // Skip malformed tool call blocks.
      }
    }
    return calls.isEmpty ? null : calls;
  }

  /// Strips the tool call JSON block from the content, leaving any surrounding text.
  static String _stripToolCallJson(String content) {
    return content
        .replaceAll(
          RegExp(r'\{"tool_call"\s*:\s*\{[^}]*"name"\s*:[^}]*\}[^}]*\}', dotAll: true),
          '',
        )
        .trim();
  }

  // ── Prompt echo stripping ────────────────────────────────────────────────

  /// Strips echoed prompt content from the model response.
  /// On-device models sometimes reproduce the conversation instead of answering.
  static String _stripPromptEcho(String response) {
    var cleaned = response.trim();
    // Remove leading "AI:" prefix the model may echo from the prompt template.
    if (cleaned.startsWith('AI:')) {
      cleaned = cleaned.substring(3).trim();
    }
    // Detect full echo: multiple role markers indicate the model reproduced
    // the conversation history.
    final hasMultipleRoles = cleaned.contains('User:') && cleaned.contains('AI:');
    final hasSystemEcho = cleaned.contains('[System]');
    if (hasMultipleRoles || hasSystemEcho) {
      final lastAI = cleaned.lastIndexOf('AI:');
      if (lastAI >= 0) {
        cleaned = cleaned.substring(lastAI + 3).trim();
      }
    }
    return cleaned;
  }

  // ── Utilities ────────────────────────────────────────────────────────────

  static UsageInfo? _parseUsage(dynamic raw) {
    if (raw is! Map) return null;
    return UsageInfo(
      promptTokens: (raw['prompt_tokens'] as num?)?.toInt() ?? 0,
      completionTokens: (raw['completion_tokens'] as num?)?.toInt() ?? 0,
      totalTokens: (raw['total_tokens'] as num?)?.toInt() ?? 0,
    );
  }
}
