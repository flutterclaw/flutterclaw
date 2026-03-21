/// OpenAI-compatible provider for OpenAI, Groq, DeepSeek, Zhipu, OpenRouter,
/// Gemini, Volcengine, Ollama, etc.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'provider_interface.dart';

final _log = Logger('OpenAiProvider');

/// OpenAI-compatible provider using /chat/completions endpoint.
class OpenAiProvider implements LlmProvider {
  OpenAiProvider({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  @override
  String get name => 'openai';

  @override
  String get defaultApiBase => 'https://api.openai.com/v1';

  @override
  Future<LlmResponse> chatCompletion(LlmRequest request) async {
    final url = _buildUrl(request.apiBase);
    final body = _buildBody(request, stream: false);
    _logChatRequest(operation: 'chatCompletion', url: url, apiBase: request.apiBase, body: body);

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: body,
        options: Options(
          headers: _headers(request.apiKey),
          responseType: ResponseType.json,
          receiveTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
          sendTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
        ),
      );

      return _parseNonStreamResponse(response.data!);
    } on DioException catch (e) {
      throw await _handleDioError(e);
    }
  }

  @override
  Stream<LlmStreamEvent> chatCompletionStream(LlmRequest request) async* {
    final url = _buildUrl(request.apiBase);
    final body = _buildBody(request, stream: true);
    _logChatRequest(operation: 'chatCompletionStream', url: url, apiBase: request.apiBase, body: body);

    Response<ResponseBody> response;
    try {
      response = await _dio.post<ResponseBody>(
        url,
        data: body,
        options: Options(
          headers: _headers(request.apiKey),
          responseType: ResponseType.stream,
          receiveTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
          sendTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
        ),
      );
    } on DioException catch (e) {
      throw await _handleDioError(e);
    }

    final bodyStream = response.data!.stream;
    String buffer = '';
    final toolCallBuffers = <int, _ToolCallAccumulator>{};

    await for (final chunk in bodyStream) {
      buffer += utf8.decode(chunk);
      final lines = buffer.split('\n');
      buffer = lines.removeLast();

      for (final line in lines) {
        if (!line.startsWith('data: ')) continue;
        final data = line.substring(6).trim();
        if (data == '[DONE]') {
          yield const LlmStreamEvent(isDone: true);
          return;
        }

        Map<String, dynamic>? json;
        try {
          json = jsonDecode(data) as Map<String, dynamic>?;
        } catch (_) {
          continue;
        }
        if (json == null) continue;

        final choices = json['choices'] as List<dynamic>?;
        if (choices == null || choices.isEmpty) continue;

        final choice = choices.first as Map<String, dynamic>?;
        if (choice == null) continue;

        final delta = choice['delta'] as Map<String, dynamic>?;
        if (delta == null) continue;

        final finishReason = choice['finish_reason'] as String?;

        // Content delta
        final content = delta['content'] as String?;
        if (content != null && content.isNotEmpty) {
          yield LlmStreamEvent(contentDelta: content);
        }

        // Tool call deltas (can be split across chunks)
        final toolCalls = delta['tool_calls'] as List<dynamic>?;
        if (toolCalls != null) {
          for (final tc in toolCalls) {
            final tcMap = tc as Map<String, dynamic>?;
            if (tcMap == null) continue;

            final index = tcMap['index'] as int? ?? 0;
            final acc = toolCallBuffers.putIfAbsent(
              index,
              () => _ToolCallAccumulator(),
            );

            acc.id ??= tcMap['id'] as String?;
            final fn = tcMap['function'] as Map<String, dynamic>?;
            if (fn != null) {
              acc.name ??= fn['name'] as String?;
              final args = fn['arguments'] as String?;
              if (args != null && args.isNotEmpty) {
                acc.arguments += args;
              }
            }
          }
        }

        if (finishReason != null && finishReason.isNotEmpty) {
          // Emit complete tool calls when message ends (in index order)
          if (finishReason == 'tool_calls' && toolCallBuffers.isNotEmpty) {
            for (final index in toolCallBuffers.keys.toList()..sort()) {
              final acc = toolCallBuffers[index]!;
              if (acc.id != null && acc.name != null) {
                yield LlmStreamEvent(
                  toolCallDelta: ToolCall(
                    id: acc.id!,
                    type: 'function',
                    function: ToolCallFunction(
                      name: acc.name!,
                      arguments: acc.arguments,
                    ),
                  ),
                );
              }
            }
          }

          final usage = json['usage'] as Map<String, dynamic>?;
          yield LlmStreamEvent(
            finishReason: finishReason,
            usage: usage != null ? UsageInfo.fromJson(usage) : null,
            isDone: true,
          );
          return;
        }
      }
    }

    if (buffer.isNotEmpty && buffer.startsWith('data: ')) {
      final data = buffer.substring(6).trim();
      if (data != '[DONE]') {
        try {
          final json = jsonDecode(data) as Map<String, dynamic>?;
          if (json != null) {
            final usage = json['usage'] as Map<String, dynamic>?;
            yield LlmStreamEvent(
              usage: usage != null ? UsageInfo.fromJson(usage) : null,
              isDone: true,
            );
          }
        } catch (_) {}
      }
    }
  }

  String _buildUrl(String apiBase) {
    final base = apiBase.endsWith('/') ? apiBase : '$apiBase/';
    return '${base}chat/completions';
  }

  Map<String, String> _headers(String apiKey) => {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
    'HTTP-Referer': 'https://flutterclaw.ai',
    'X-OpenRouter-Title': 'FlutterClaw',
  };

  /// Whether this model is an OpenAI o-series reasoning model.
  /// These models don't support `temperature` and require
  /// `max_completion_tokens` instead of `max_tokens`.
  static bool _isReasoningModel(String model) {
    final m = model.toLowerCase();
    // o1, o1-mini, o1-preview, o3, o3-mini, o4-mini, etc.
    return RegExp(r'^o\d').hasMatch(m);
  }

  /// OpenRouter expects upstream ids like `minimax/minimax-m2.5:free`.
  /// Model discovery used to prefix every id with `openrouter/`, producing
  /// invalid ids such as `openrouter/minimax/minimax-m2.5:free` (404).
  /// Genuine OpenRouter slugs like `openrouter/auto` have only two segments
  /// and must be sent unchanged.
  static String _openRouterUpstreamModelId(String apiBase, String model) {
    if (!apiBase.toLowerCase().contains('openrouter.ai')) return model;
    if (!model.startsWith('openrouter/')) return model;
    final segments = model.split('/');
    if (segments.length >= 3) {
      return segments.skip(1).join('/');
    }
    return model;
  }

  Map<String, dynamic> _buildBody(LlmRequest request, {required bool stream}) {
    // Build message list with consecutive-role protection.
    // If a previous request failed mid-stream, the session JSONL may contain a
    // dangling user message without an assistant reply. Sending two consecutive
    // user messages causes OpenAI-compatible APIs to reject the request.
    // Insert a placeholder assistant message between them to keep the alternation valid.
    //
    // Additionally, tool results that contain images (e.g. ui_screenshot) are
    // split: the tool message gets text-only content, and the image is injected
    // as a follow-up user message. This is necessary because OpenAI-compatible
    // APIs don't support content arrays in tool role messages.
    final messages = <Map<String, dynamic>>[];
    for (final m in request.messages) {
      final converted = _messageToJson(
        m,
        apiBase: request.apiBase,
        stripImages: !request.supportsVision,
      );
      if (messages.isNotEmpty && messages.last['role'] == converted['role']) {
        final placeholderRole = converted['role'] == 'user' ? 'assistant' : 'user';
        messages.add({'role': placeholderRole, 'content': '...'});
      }
      messages.add(converted);
    }

    final modelForApi = _openRouterUpstreamModelId(request.apiBase, request.model);
    final reasoning = _isReasoningModel(modelForApi);

    final body = <String, dynamic>{
      'model': modelForApi,
      'messages': messages,
      'stream': stream,
    };

    // o-series reasoning models use max_completion_tokens and don't support temperature.
    if (reasoning) {
      body['max_completion_tokens'] = request.maxTokens;
    } else {
      body['max_tokens'] = request.maxTokens;
      body['temperature'] = request.temperature;
    }

    if (request.tools != null && request.tools!.isNotEmpty) {
      body['tools'] = request.tools;
    }

    return body;
  }

  Map<String, dynamic> _messageToJson(
    LlmMessage m, {
    String apiBase = '',
    bool stripImages = false,
  }) {
    final map = <String, dynamic>{
      'role': m.role,
      'content': m.role == 'tool' && m.content is String
          ? _convertToolContent(m.content as String, stripImages: stripImages)
          : _convertContent(m.content, apiBase: apiBase, stripImages: stripImages),
    };
    if (m.name != null) map['name'] = m.name;
    if (m.toolCalls != null) {
      map['tool_calls'] = m.toolCalls!.map((e) => e.toJson()).toList();
    }
    if (m.toolCallId != null) map['tool_call_id'] = m.toolCallId;
    return map;
  }

  /// Converts tool result content for OpenAI format.
  ///
  /// OpenAI-compatible APIs require tool message `content` to be a **string**
  /// (content arrays are not supported for the tool role). When the tool result
  /// contains a JSON-encoded image block (from ui_screenshot), this returns a
  /// text-only string with the element summary from the `note` field.
  String _convertToolContent(String content, {bool stripImages = false}) {
    if (content.contains('"type":"image"') ||
        content.contains('"type": "image"')) {
      try {
        final parsed = jsonDecode(content);
        if (parsed is Map<String, dynamic> &&
            parsed['type'] == 'image' &&
            parsed.containsKey('data') &&
            parsed.containsKey('mimeType')) {
          final note = parsed['note'] as String?;
          return '[Screenshot captured successfully]${note != null ? ' $note' : ''}';
        }
      } catch (_) {}
    }
    return content;
  }


  /// Converts content to OpenAI format.
  /// Neutral image blocks `{type:"image", data, mimeType}` become
  /// `{type:"image_url", image_url:{url:"data:mimeType;base64,data"}}`.
  /// Neutral document blocks: on OpenRouter, sent as `{type:"file", file:{…}}`
  /// for native PDF support; on other endpoints, extracted to text.
  /// Neutral audio blocks `{type:"audio", data, format}` become `input_audio` blocks.
  dynamic _convertContent(dynamic content, {String apiBase = '', bool stripImages = false}) {
    if (content is! List) return content;
    final items = stripImages
        ? content.where((item) {
            final map = item is Map ? item : null;
            if (map == null) return true;
            final type = map['type'] as String?;
            return type != 'image' && type != 'image_url';
          }).toList()
        : content;
    return items.map((item) {
      final map = item is Map<String, dynamic>
          ? item
          : item is Map
              ? Map<String, dynamic>.from(item)
              : null;
      if (map == null) return item;

      if (map['type'] == 'image' &&
          map.containsKey('data') &&
          map.containsKey('mimeType')) {
        return {
          'type': 'image_url',
          'image_url': {
            'url': 'data:${map['mimeType']};base64,${map['data']}',
          },
        };
      }

      // Document block handling
      if (map['type'] == 'document' && map.containsKey('data')) {
        final fileName = map['fileName'] as String? ?? 'document';
        final mimeType = map['mimeType'] as String? ?? 'application/pdf';

        // OpenRouter: send as native file block for server-side processing
        if (apiBase.contains('openrouter.ai')) {
          return {
            'type': 'file',
            'file': {
              'filename': fileName,
              'file_data': 'data:$mimeType;base64,${map['data']}',
            },
          };
        }

        // Other OpenAI-compatible endpoints: extract text client-side
        if (mimeType == 'text/plain') {
          try {
            final bytes = base64Decode(map['data'] as String);
            final text = utf8.decode(bytes);
            return {'type': 'text', 'text': text};
          } catch (_) {
            return {'type': 'text', 'text': '[Document: $fileName]'};
          }
        }
        // PDF: extract readable text from the binary structure.
        final extracted = _extractPdfText(map['data'] as String);
        if (extracted.isNotEmpty) {
          return {
            'type': 'text',
            'text': '=== $fileName ===\n$extracted',
          };
        }
        // Fallback: scanned / encrypted PDF — content cannot be extracted
        return {
          'type': 'text',
          'text': '[PDF "$fileName" — content could not be extracted. '
              'Use an Anthropic model for native PDF support.]',
        };
      }

      // Audio direct input for OpenAI-compatible models that support it
      if (map['type'] == 'audio' && map.containsKey('data')) {
        return {
          'type': 'input_audio',
          'input_audio': {
            'data': map['data'] as String,
            'format': map['format'] as String? ?? 'm4a',
          },
        };
      }

      return map;
    }).toList();
  }

  /// PDF text extraction without external libraries.
  ///
  /// Pass 1: decompress any FlateDecode content streams (modern PDFs).
  /// Pass 2: extract text from BT…ET blocks using Tj/TJ operators.
  /// Works for most generated/digital PDFs; returns empty for scanned/encrypted.
  String _extractPdfText(String base64Data) {
    try {
      final bytes = base64Decode(base64Data);
      final raw = latin1.decode(bytes, allowInvalid: true);

      // Collect all content to search: start with the raw file, then append
      // any successfully decompressed FlateDecode streams.
      final sources = <String>[raw];

      // FlateDecode stream pattern: find stream…endstream regions preceded by
      // a /FlateDecode (or /Fl ) filter in the same object dictionary.
      final streamRe = RegExp(r'stream\r?\n([\s\S]*?)\r?\nendstream',
          dotAll: true);
      final flatRe = RegExp(r'/FlateDecode|/Fl\b');

      for (final m in streamRe.allMatches(raw)) {
        // Only attempt decompress when the preceding ~200 chars hint FlateDecode
        final before = raw.substring(
            (m.start - 200).clamp(0, m.start), m.start);
        if (!flatRe.hasMatch(before)) continue;
        try {
          final compressed = m.group(1)!
              .codeUnits
              .map((c) => c & 0xFF)
              .toList();
          final inflated = ZLibDecoder().convert(compressed);
          final decoded = latin1.decode(inflated, allowInvalid: true);
          if (decoded.length > 20) sources.add(decoded);
        } catch (_) {
          // Skip non-decompressible streams silently
        }
      }

      // Extract text from all sources
      final buffer = StringBuffer();
      final btEt = RegExp(r'BT\b(.*?)\bET', dotAll: true);
      final tjSingle = RegExp(r'\(([^)]{1,500})\)\s*Tj');
      final tjArray = RegExp(r'\[([^\]]*)\]\s*TJ');
      final tjItem = RegExp(r'\(([^)]{1,500})\)');

      for (final source in sources) {
        for (final block in btEt.allMatches(source)) {
          final blockText = block.group(1)!;
          for (final m in tjSingle.allMatches(blockText)) {
            final t = _decodePdfString(m.group(1)!);
            if (t.isNotEmpty) buffer..write(t)..write(' ');
          }
          for (final m in tjArray.allMatches(blockText)) {
            for (final item in tjItem.allMatches(m.group(1)!)) {
              final t = _decodePdfString(item.group(1)!);
              if (t.isNotEmpty) buffer..write(t)..write(' ');
            }
          }
        }
      }

      final result = buffer
          .toString()
          .replaceAll(RegExp(r'[^\x20-\x7E\n]'), '')
          .replaceAll(RegExp(r' {2,}'), ' ')
          .trim();

      return result.length > 20 ? result : '';
    } catch (_) {
      return '';
    }
  }

  /// Decodes common PDF string escapes (\n, \r, \t, \\, \( , \) ).
  String _decodePdfString(String s) => s
      .replaceAll(r'\n', '\n')
      .replaceAll(r'\r', '\r')
      .replaceAll(r'\t', ' ')
      .replaceAll(r'\\', r'\')
      .replaceAll(r'\(', '(')
      .replaceAll(r'\)', ')');

  LlmResponse _parseNonStreamResponse(Map<String, dynamic> json) {
    final choices = json['choices'] as List<dynamic>?;
    if (choices == null || choices.isEmpty) {
      return const LlmResponse(finishReason: 'stop', content: '');
    }

    final choice = choices.first as Map<String, dynamic>;
    final message = choice['message'] as Map<String, dynamic>?;
    final finishReason = choice['finish_reason'] as String? ?? 'stop';

    String? content;
    List<ToolCall>? toolCalls;

    if (message != null) {
      content = message['content'] as String?;
      final tcList = message['tool_calls'] as List<dynamic>?;
      if (tcList != null && tcList.isNotEmpty) {
        toolCalls = tcList
            .map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    }

    final usageJson = json['usage'] as Map<String, dynamic>?;
    final usage = usageJson != null ? UsageInfo.fromJson(usageJson) : null;

    return LlmResponse(
      content: content,
      toolCalls: toolCalls,
      finishReason: finishReason,
      usage: usage,
    );
  }

  /// One-line summary of the outgoing request (no API keys).
  void _logChatRequest({
    required String operation,
    required String url,
    required String apiBase,
    required Map<String, dynamic> body,
  }) {
    try {
      final encoded = jsonEncode(body);
      final bytes = utf8.encode(encoded).length;
      final msgs = body['messages'] as List<dynamic>?;
      final model = body['model'];
      final stream = body['stream'];
      final toolCount = (body['tools'] as List<dynamic>?)?.length ?? 0;
      _log.info(
        '$operation: POST $url | model=$model | stream=$stream | '
        'messages=${msgs?.length ?? 0} | tools=$toolCount | approxBodyBytes=$bytes | apiBase=$apiBase',
      );
    } catch (err, st) {
      _log.warning('Failed to log request summary: $err', err, st);
    }
  }

  static Map<String, dynamic>? _tryDecodeErrorMap(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) {
      try {
        final j = jsonDecode(data);
        if (j is Map) return Map<String, dynamic>.from(j);
      } catch (_) {}
    }
    return null;
  }

  static String? _extractProviderErrorMessage(Map<String, dynamic>? data) {
    if (data == null) return null;
    final err = data['error'];
    if (err is Map) {
      final m = err['message'];
      if (m is String && m.isNotEmpty) return m;
      // Some APIs nest { "error": { "code": "", "message": "" } }
      final inner = err['error'];
      if (inner is Map && inner['message'] is String) {
        return inner['message'] as String;
      }
    }
    final top = data['message'];
    if (top is String && top.isNotEmpty) return top;
    return null;
  }

  static String _truncateForLog(String s, [int max = 6000]) =>
      s.length <= max ? s : '${s.substring(0, max)}… [+${s.length - max} chars]';

  /// With [ResponseType.stream], failed responses expose [ResponseBody]; Dio does
  /// not decode it to JSON/string, so we must drain the stream for logs and parsing.
  static const _maxErrorBodyBytes = 65536;

  Future<dynamic> _normalizeDioErrorResponseData(Response? response) async {
    if (response == null) return null;
    final data = response.data;
    if (data is ResponseBody) {
      try {
        final bytes = <int>[];
        await for (final chunk in data.stream) {
          bytes.addAll(chunk);
          if (bytes.length >= _maxErrorBodyBytes) {
            bytes.length = _maxErrorBodyBytes;
            break;
          }
        }
        return utf8.decode(Uint8List.fromList(bytes), allowMalformed: true);
      } catch (err, st) {
        _log.warning('Failed to read error ResponseBody: $err', err, st);
        return null;
      }
    }
    if (data is Uint8List) {
      return utf8.decode(data, allowMalformed: true);
    }
    return data;
  }

  Future<LlmProviderException> _handleDioError(DioException e) async {
    final statusCode = e.response?.statusCode;
    final uri = e.requestOptions.uri;
    final method = e.requestOptions.method;

    final rawData = await _normalizeDioErrorResponseData(e.response);
    final map = _tryDecodeErrorMap(rawData);
    String? providerMsg = _extractProviderErrorMessage(map);

    // Dio often puts a long generic explanation in e.message; prefer API body.
    String message = providerMsg ??
        (rawData is String && rawData.length < 4000 ? rawData : null) ??
        e.message ??
        'Unknown error';

    // If we still only have Dio's boilerplate, try to log raw payload for debugging.
    if (providerMsg == null &&
        message.contains('validateStatus was configured to throw')) {
      message = 'HTTP $statusCode from provider (see log for response body)';
    }

    _log.severe(
      'API error: $method $uri → HTTP $statusCode | dioType=${e.type.name} | '
      'providerMessage=${providerMsg ?? "(none parsed)"}',
    );
    if (map != null) {
      _log.severe('error.json (truncated): ${_truncateForLog(jsonEncode(map))}');
    } else if (rawData != null) {
      final s = rawData.toString();
      _log.severe('error.body (truncated): ${_truncateForLog(s)}');
    } else {
      _log.severe('error.body: <empty — network/CORS/timeout?>');
    }

    final forUser = providerMsg ??
        (rawData is String && rawData.length < 4000 ? rawData : null) ??
        message;
    return LlmProviderException(
      message: forUser,
      statusCode: statusCode,
      cause: e,
    );
  }
}

class _ToolCallAccumulator {
  String? id;
  String? name;
  String arguments = '';
}

/// Exception thrown by LLM providers.
class LlmProviderException implements Exception {
  final String message;
  final int? statusCode;
  final Object? cause;

  LlmProviderException({required this.message, this.statusCode, this.cause});

  @override
  String toString() =>
      'LlmProviderException: $message${statusCode != null ? ' (status: $statusCode)' : ''}';
}
