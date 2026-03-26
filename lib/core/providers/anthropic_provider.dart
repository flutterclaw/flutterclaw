/// Anthropic Messages API provider.
library;

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'provider_interface.dart';
import 'openai_provider.dart';

/// Anthropic Messages API provider using /v1/messages endpoint.
class AnthropicProvider implements LlmProvider {
  static const _apiVersion = '2023-06-01';

  AnthropicProvider({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  @override
  String get name => 'anthropic';

  @override
  String get defaultApiBase => 'https://api.anthropic.com';

  @override
  Future<LlmResponse> chatCompletion(LlmRequest request) async {
    final url = _buildUrl(request.apiBase);
    final body = buildBody(request, stream: false);

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: body,
        options: Options(
          headers: _headers(request.apiKey, pdfsBeta: _hasDocumentBlocks(request)),
          responseType: ResponseType.json,
          receiveTimeout: Duration(
            seconds: request.timeoutSeconds ?? 120,
          ),
          sendTimeout: Duration(
            seconds: request.timeoutSeconds ?? 120,
          ),
        ),
      );

      return parseNonStreamResponse(response.data!);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Stream<LlmStreamEvent> chatCompletionStream(LlmRequest request) async* {
    final url = _buildUrl(request.apiBase);
    final body = buildBody(request, stream: true);

    Response<ResponseBody> response;
    try {
      response = await _dio.post<ResponseBody>(
        url,
        data: body,
        options: Options(
          headers: _headers(request.apiKey, pdfsBeta: _hasDocumentBlocks(request)),
          responseType: ResponseType.stream,
          receiveTimeout: Duration(
            seconds: request.timeoutSeconds ?? 120,
          ),
          sendTimeout: Duration(
            seconds: request.timeoutSeconds ?? 120,
          ),
        ),
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }

    final bodyStream = response.data!.stream;
    String buffer = '';
    final toolUseBuffers = <int, _AnthropicToolUseAccumulator>{};

    await for (final chunk in bodyStream) {
      buffer += utf8.decode(chunk);
      final lines = buffer.split('\n');
      buffer = lines.removeLast();

      for (final line in lines) {
        if (!line.startsWith('data: ')) continue;
        final data = line.substring(6).trim();
        if (data.isEmpty) continue;

        Map<String, dynamic>? json;
        try {
          json = jsonDecode(data) as Map<String, dynamic>?;
        } catch (_) {
          continue;
        }
        if (json == null) continue;

        final eventType = json['type'] as String?;
        if (eventType == null || eventType == 'ping') continue;

        switch (eventType) {
          case 'content_block_delta':
            final index = json['index'] as int? ?? 0;
            final delta = json['delta'] as Map<String, dynamic>?;
            if (delta == null) break;

            final deltaType = delta['type'] as String?;
            if (deltaType == 'text_delta') {
              final text = delta['text'] as String?;
              if (text != null && text.isNotEmpty) {
                yield LlmStreamEvent(contentDelta: text);
              }
            } else if (deltaType == 'input_json_delta') {
              final partialJson = delta['partial_json'] as String?;
              if (partialJson != null && partialJson.isNotEmpty) {
                final acc = toolUseBuffers.putIfAbsent(
                  index,
                  () => _AnthropicToolUseAccumulator(),
                );
                acc.partialJson += partialJson;
              }
            }
            break;

          case 'content_block_stop':
            final index = json['index'] as int? ?? 0;
            final acc = toolUseBuffers[index];
            if (acc != null && acc.id != null && acc.name != null) {
              try {
                final args = acc.partialJson.trim().isEmpty
                    ? '{}'
                    : acc.partialJson;
                yield LlmStreamEvent(
                  toolCallDelta: ToolCall(
                    id: acc.id!,
                    type: 'function',
                    function: ToolCallFunction(
                      name: acc.name!,
                      arguments: args,
                    ),
                  ),
                );
              } catch (_) {}
              toolUseBuffers.remove(index);
            }
            break;

          case 'content_block_start':
            final contentBlock = json['content_block'] as Map<String, dynamic>?;
            if (contentBlock != null) {
              final blockType = contentBlock['type'] as String?;
              if (blockType == 'tool_use') {
                final index = json['index'] as int? ?? 0;
                final acc = toolUseBuffers.putIfAbsent(
                  index,
                  () => _AnthropicToolUseAccumulator(),
                );
                acc.id = contentBlock['id'] as String?;
                acc.name = contentBlock['name'] as String?;
                acc.partialJson = '';
              }
            }
            break;

          case 'message_delta':
            final delta = json['delta'] as Map<String, dynamic>?;
            final stopReason = delta?['stop_reason'] as String?;
            final usage = json['usage'] as Map<String, dynamic>?;

            if (stopReason != null && stopReason.isNotEmpty) {
              final finishReason = _mapStopReason(stopReason);
              yield LlmStreamEvent(
                finishReason: finishReason,
                usage: usage != null ? _parseUsage(usage) : null,
                isDone: true,
              );
              return;
            }
            break;

          case 'message_stop':
            yield const LlmStreamEvent(isDone: true);
            return;

          case 'error':
            final error = json['error'] as Map<String, dynamic>?;
            final msg = error?['message'] as String? ?? 'Anthropic API error';
            throw LlmProviderException(message: msg);
        }
      }
    }

    // Flush remaining buffer
    if (buffer.isNotEmpty && buffer.startsWith('data: ')) {
      final data = buffer.substring(6).trim();
      if (data.isNotEmpty && data != '[DONE]') {
        try {
          final json = jsonDecode(data) as Map<String, dynamic>?;
          if (json != null && json['type'] == 'message_stop') {
            yield const LlmStreamEvent(isDone: true);
          }
        } catch (_) {}
      }
    }
  }

  String _buildUrl(String apiBase) {
    final trimmed = apiBase.endsWith('/')
        ? apiBase.substring(0, apiBase.length - 1)
        : apiBase;
    // Guard against double /v1/ for configs saved with 'https://api.anthropic.com/v1'
    if (trimmed.endsWith('/v1')) {
      return '$trimmed/messages';
    }
    return '$trimmed/v1/messages';
  }

  Map<String, String> _headers(String apiKey, {bool pdfsBeta = false}) => {
        'x-api-key': apiKey,
        'anthropic-version': _apiVersion,
        'Content-Type': 'application/json',
        if (pdfsBeta) 'anthropic-beta': 'pdfs-2024-09-25',
      };

  /// Returns true if the request contains any document content blocks,
  /// which requires the pdfs-2024-09-25 beta header.
  bool _hasDocumentBlocks(LlmRequest request) {
    for (final m in request.messages) {
      final content = m.content;
      if (content is List) {
        for (final item in content) {
          if (item is Map && item['type'] == 'document') return true;
        }
      }
    }
    return false;
  }

  /// Builds the Anthropic Messages API request body.
  /// Exposed for reuse by [BedrockProvider].
  Map<String, dynamic> buildBody(LlmRequest request, {required bool stream}) {
    String? system;
    final messages = <Map<String, dynamic>>[];

    for (final m in request.messages) {
      if (m.role == 'system') {
        system = m.content is String
            ? m.content as String
            : m.content.toString();
      } else {
        // Consecutive tool results from a parallel tool call must be merged into
        // a single user message. The Anthropic API requires ALL tool_result blocks
        // for a given assistant turn to appear together in the immediately following
        // user message — inserting a placeholder assistant between them breaks the
        // pairing and causes a 400 "tool_use ids found without tool_result" error.
        if (m.role == 'tool' && m.toolCallId != null && messages.isNotEmpty) {
          final last = messages.last;
          if (last['role'] == 'user' && _isToolResultMessage(last)) {
            (last['content'] as List<dynamic>).add({
              'type': 'tool_result',
              'tool_use_id': m.toolCallId,
              'content': _toolResultContent(m.content),
            });
            continue;
          }
        }

        final converted = _messageToAnthropic(m);
        // Anthropic requires strict user/assistant alternation.
        // If the previous message has the same role (e.g. a dangling user message
        // left by a previous failed request), insert a placeholder so the
        // conversation remains valid.
        if (messages.isNotEmpty &&
            messages.last['role'] == converted['role']) {
          final placeholderRole =
              converted['role'] == 'user' ? 'assistant' : 'user';
          messages.add({
            'role': placeholderRole,
            'content': [{'type': 'text', 'text': '...'}],
          });
        }
        messages.add(converted);
      }
    }

    final body = <String, dynamic>{
      'model': request.model,
      'messages': messages,
      'max_tokens': request.maxTokens,
      'stream': stream,
    };

    if (system != null && system.isNotEmpty) {
      body['system'] = system;
    }

    if (request.tools != null && request.tools!.isNotEmpty) {
      body['tools'] = _convertToolsToAnthropic(request.tools!);
      body['tool_choice'] = {'type': 'auto'};
    }

    return body;
  }

  bool _isToolResultMessage(Map<String, dynamic> m) {
    if (m['role'] != 'user') return false;
    final content = m['content'];
    if (content is! List) return false;
    return content.any((b) => b is Map && b['type'] == 'tool_result');
  }

  Map<String, dynamic> _messageToAnthropic(LlmMessage m) {
    // Anthropic uses "user" role with tool_result content for tool responses
    if (m.role == 'tool' && m.toolCallId != null) {
      return {
        'role': 'user',
        'content': [
          {
            'type': 'tool_result',
            'tool_use_id': m.toolCallId,
            'content': _toolResultContent(m.content),
          }
        ],
      };
    }

    // Assistant with tool_calls: content blocks for text + tool_use
    if (m.role == 'assistant' &&
        m.toolCalls != null &&
        m.toolCalls!.isNotEmpty) {
      final blocks = <Map<String, dynamic>>[];

      final content = m.content;
      if (content is String && content.isNotEmpty) {
        blocks.add({'type': 'text', 'text': content});
      } else if (content is List && content.isNotEmpty) {
        for (final item in content) {
          if (item is Map<String, dynamic> &&
              (item['type'] == 'text' || item['type'] == 'image')) {
            blocks.add(item);
          }
        }
      }

      for (final tc in m.toolCalls!) {
        Map<String, dynamic> input = {};
        try {
          input = jsonDecode(tc.function.arguments) as Map<String, dynamic>? ?? {};
        } catch (_) {}
        blocks.add({
          'type': 'tool_use',
          'id': tc.id,
          'name': tc.function.name,
          'input': input,
        });
      }

      return {'role': 'assistant', 'content': blocks};
    }

    // User or assistant with text content
    final content = m.content;
    List<Map<String, dynamic>> blocks;

    if (content is String) {
      blocks = [{'type': 'text', 'text': content}];
    } else if (content is List) {
      blocks = [];
      for (final item in content) {
        final map = item is Map<String, dynamic>
            ? item
            : item is Map
                ? Map<String, dynamic>.from(item)
                : null;
        if (map == null) continue;
        blocks.add(_convertBlockToAnthropic(map));
      }
      if (blocks.isEmpty) blocks = [{'type': 'text', 'text': ''}];
    } else {
      blocks = [{'type': 'text', 'text': content?.toString() ?? ''}];
    }

    return {
      'role': m.role,
      'content': blocks,
    };
  }

  /// Converts tool result content to the correct Anthropic format.
  ///
  /// If the content is a JSON-encoded image block (produced by ui_screenshot),
  /// it is parsed and returned as an array of Anthropic content blocks so the
  /// vision model can actually see the image. Otherwise returns a plain string.
  dynamic _toolResultContent(dynamic content) {
    if (content is! String) return content?.toString() ?? '';

    if (content.contains('"type":"image"') ||
        content.contains('"type": "image"')) {
      try {
        final parsed = jsonDecode(content);
        if (parsed is Map<String, dynamic> &&
            parsed['type'] == 'image' &&
            parsed.containsKey('data') &&
            parsed.containsKey('mimeType')) {
          final blocks = <Map<String, dynamic>>[
            _convertBlockToAnthropic(Map<String, dynamic>.from(parsed)),
          ];
          if (parsed['note'] != null) {
            blocks.add({'type': 'text', 'text': parsed['note'] as String});
          }
          return blocks;
        }
      } catch (_) {}
    }

    return content;
  }

  /// Converts a neutral content block to Anthropic's format.
  ///
  /// Neutral image: `{type:"image", data:"...", mimeType:"image/jpeg"}`
  /// converts to Anthropic `{type:"image", source:{type:"base64", ...}}`.
  ///
  /// OpenAI `image_url` blocks with a `data:` URL are also accepted for
  /// backwards compat and converted to the same Anthropic format.
  Map<String, dynamic> _convertBlockToAnthropic(Map<String, dynamic> block) {
    final type = block['type'] as String?;

    // Neutral format produced by FlutterClaw
    if (type == 'image' && block.containsKey('data') && block.containsKey('mimeType')) {
      return {
        'type': 'image',
        'source': {
          'type': 'base64',
          'media_type': block['mimeType'] as String,
          'data': block['data'] as String,
        },
      };
    }

    // Neutral document block → Anthropic document (PDF or plain text)
    if (type == 'document' && block.containsKey('data') && block.containsKey('mimeType')) {
      return {
        'type': 'document',
        'source': {
          'type': 'base64',
          'media_type': block['mimeType'] as String,
          'data': block['data'] as String,
        },
        if (block['fileName'] != null) 'title': block['fileName'] as String,
      };
    }

    // OpenAI image_url format → convert to Anthropic base64
    if (type == 'image_url') {
      final imageUrl = block['image_url'];
      final url = imageUrl is Map ? imageUrl['url'] as String? : null;
      if (url != null && url.startsWith('data:')) {
        // data:<mimeType>;base64,<data>
        final comma = url.indexOf(',');
        final meta = url.substring(5, comma > 0 ? comma : url.length);
        final mediaType = meta.split(';').first;
        final data = comma > 0 ? url.substring(comma + 1) : '';
        return {
          'type': 'image',
          'source': {
            'type': 'base64',
            'media_type': mediaType,
            'data': data,
          },
        };
      }
    }

    // All other blocks (text, tool_result, etc.) pass through unchanged
    return block;
  }

  List<Map<String, dynamic>> _convertToolsToAnthropic(
    List<Map<String, dynamic>> tools,
  ) {
    return tools.map((t) {
      final schema = t['function'] as Map<String, dynamic>?;
      if (schema == null) return <String, dynamic>{};

      return <String, dynamic>{
        'name': schema['name'] as String? ?? '',
        'description': schema['description'] as String? ?? '',
        'input_schema': schema['parameters'] as Map<String, dynamic>? ??
            schema['parameters_schema'] as Map<String, dynamic>? ??
            {'type': 'object', 'properties': {}},
      };
    }).toList();
  }

  /// Parses a non-streaming Anthropic Messages API response.
  /// Exposed for reuse by [BedrockProvider].
  LlmResponse parseNonStreamResponse(Map<String, dynamic> json) {
    final contentList = json['content'] as List<dynamic>?;
    String? content;
    List<ToolCall>? toolCalls;
    final finishReason =
        _mapStopReason(json['stop_reason'] as String? ?? 'end_turn');

    if (contentList != null) {
      for (final block in contentList) {
        final b = block as Map<String, dynamic>?;
        if (b == null) continue;

        final type = b['type'] as String?;
        if (type == 'text') {
          content = (content ?? '') + (b['text'] as String? ?? '');
        } else if (type == 'tool_use') {
          toolCalls ??= [];
          final input = b['input'] as Map<String, dynamic>? ?? {};
          toolCalls.add(ToolCall(
            id: b['id'] as String? ?? '',
            type: 'function',
            function: ToolCallFunction(
              name: b['name'] as String? ?? '',
              arguments: jsonEncode(input),
            ),
          ));
        }
      }
    }

    final usageJson = json['usage'] as Map<String, dynamic>?;
    final usage = usageJson != null ? _parseUsage(usageJson) : null;

    return LlmResponse(
      content: content,
      toolCalls: toolCalls,
      finishReason: finishReason,
      usage: usage,
    );
  }

  UsageInfo _parseUsage(Map<String, dynamic> json) => UsageInfo(
        promptTokens: json['input_tokens'] as int? ?? 0,
        completionTokens: json['output_tokens'] as int? ?? 0,
        totalTokens: (json['input_tokens'] as int? ?? 0) +
            (json['output_tokens'] as int? ?? 0),
      );

  String _mapStopReason(String stopReason) {
    switch (stopReason) {
      case 'end_turn':
        return 'stop';
      case 'max_tokens':
        return 'length';
      case 'tool_use':
        return 'tool_calls';
      default:
        return stopReason.isNotEmpty ? stopReason : 'stop';
    }
  }

  LlmProviderException _handleDioError(DioException e) {
    String message = e.message ?? 'Unknown error';
    int? statusCode = e.response?.statusCode;

    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data as Map<String, dynamic>;
      final error = data['error'] as Map<String, dynamic>?;
      if (error != null) {
        message = error['message'] as String? ?? message;
      }
    } else if (e.response?.data is String) {
      message = e.response!.data as String;
    }

    // Detect token overflow errors and provide actionable guidance
    if (statusCode == 400 &&
        (message.contains('prompt is too long') ||
            message.contains('context_length_exceeded') ||
            message.contains('maximum context length'))) {
      message = 'Context too large for model.\n\n'
          'Your conversation has exceeded the model\'s context window. '
          'Try one of these options:\n\n'
          '1. Use the /compact command to summarize old messages\n'
          '2. Start a new chat for a fresh context\n'
          '3. Request less data from tools (e.g., smaller date ranges)\n\n'
          'Original error: $message';
    }

    return LlmProviderException(
      message: message,
      statusCode: statusCode,
      cause: e,
    );
  }
}

class _AnthropicToolUseAccumulator {
  String? id;
  String? name;
  String partialJson = '';
}
