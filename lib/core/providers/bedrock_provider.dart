/// AWS Bedrock provider for Anthropic Claude models.
///
/// Uses the Bedrock InvokeModel API which accepts the same request/response
/// body as the Anthropic Messages API, but with AWS SigV4 authentication
/// and a different URL structure.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'anthropic_provider.dart';
import 'openai_provider.dart';
import 'provider_interface.dart';

final _log = Logger('flutterclaw.bedrock');

/// AWS Bedrock provider that routes Claude model invocations through
/// the Bedrock Runtime InvokeModel / InvokeModelWithResponseStream APIs.
class BedrockProvider implements LlmProvider {
  BedrockProvider({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  /// Reuse AnthropicProvider for body building and response parsing.
  late final _anthropic = AnthropicProvider();

  @override
  String get name => 'bedrock';

  @override
  String get defaultApiBase => '';

  @override
  Future<LlmResponse> chatCompletion(LlmRequest request) async {
    final region = request.awsRegion ?? _extractRegion(request.apiBase);
    final modelId = request.model;
    final host = 'bedrock-runtime.$region.amazonaws.com';
    final path = '/model/$modelId/invoke';
    final url = 'https://$host$path';

    final body = _bedrockBody(request, stream: false);
    final payload = utf8.encode(jsonEncode(body));
    final headers = _buildHeaders(request, host, path, payload);

    _log.info('chatCompletion: POST $url | model=${request.model} '
        'authMode=${request.awsAuthMode ?? "sigv4"} region=$region');

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: body,
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
          receiveTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
          sendTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
        ),
      );

      return _anthropic.parseNonStreamResponse(response.data!);
    } on DioException catch (e) {
      _log.severe('chatCompletion error: $url → ${e.response?.statusCode} '
          '${e.response?.data}');
      throw _handleDioError(e);
    }
  }

  @override
  Stream<LlmStreamEvent> chatCompletionStream(LlmRequest request) async* {
    final region = request.awsRegion ?? _extractRegion(request.apiBase);
    final modelId = request.model;
    final host = 'bedrock-runtime.$region.amazonaws.com';
    final path = '/model/$modelId/invoke-with-response-stream';
    final url = 'https://$host$path';

    final body = _bedrockBody(request, stream: true);
    final payload = utf8.encode(jsonEncode(body));
    final headers = _buildHeaders(request, host, path, payload);

    _log.info('chatCompletionStream: POST $url | model=${request.model} '
        'authMode=${request.awsAuthMode ?? "sigv4"} region=$region');

    Response<ResponseBody> response;
    try {
      response = await _dio.post<ResponseBody>(
        url,
        data: body,
        options: Options(
          headers: headers,
          responseType: ResponseType.stream,
          receiveTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
          sendTimeout: Duration(seconds: request.timeoutSeconds ?? 120),
        ),
      );
    } on DioException catch (e) {
      // For stream responses, read the body to get the error message.
      String? errorBody;
      if (e.response?.data is ResponseBody) {
        try {
          final bytes = await (e.response!.data as ResponseBody)
              .stream
              .fold<List<int>>([], (prev, chunk) => prev..addAll(chunk));
          errorBody = utf8.decode(bytes);
        } catch (_) {}
      } else {
        errorBody = '${e.response?.data}';
      }
      _log.severe('chatCompletionStream error: $url → ${e.response?.statusCode} '
          '$errorBody');
      throw _handleDioError(e);
    }

    // Parse AWS EventStream binary protocol.
    // Each message contains an Anthropic-format JSON event in its payload.
    final byteStream = response.data!.stream;
    final eventBuffer = BytesBuilder(copy: false);
    final toolUseBuffers = <int, _ToolUseAccumulator>{};

    await for (final chunk in byteStream) {
      eventBuffer.add(chunk);

      // Process complete EventStream messages from the buffer.
      while (true) {
        final bytes = eventBuffer.toBytes();
        if (bytes.length < 12) break; // need at least prelude (12 bytes)

        final view = ByteData.sublistView(Uint8List.fromList(bytes));
        final totalLength = view.getUint32(0);
        if (bytes.length < totalLength) break; // incomplete message

        // Extract payload: skip prelude (12) + headers
        final headersLength = view.getUint32(4);
        final payloadOffset = 12 + headersLength;
        final payloadLength = totalLength - payloadOffset - 4; // minus message CRC

        if (payloadLength > 0) {
          final payloadBytes = bytes.sublist(payloadOffset, payloadOffset + payloadLength);
          final payloadStr = utf8.decode(payloadBytes, allowMalformed: true);

          // The payload may contain Anthropic-format JSON events.
          // Bedrock wraps them: {"bytes":"<base64-encoded JSON>"}
          Map<String, dynamic>? eventJson;
          try {
            final wrapper = jsonDecode(payloadStr) as Map<String, dynamic>?;
            if (wrapper != null && wrapper.containsKey('bytes')) {
              final decoded = base64Decode(wrapper['bytes'] as String);
              eventJson = jsonDecode(utf8.decode(decoded)) as Map<String, dynamic>?;
            } else {
              eventJson = wrapper;
            }
          } catch (_) {
            // Try direct JSON parse (some responses aren't base64-wrapped)
            try {
              eventJson = jsonDecode(payloadStr) as Map<String, dynamic>?;
            } catch (_) {}
          }

          if (eventJson != null) {
            final events = _processAnthropicEvent(eventJson, toolUseBuffers);
            for (final event in events) {
              yield event;
              if (event.isDone) return;
            }
          }
        }

        // Remove processed message from buffer
        final remaining = bytes.sublist(totalLength);
        eventBuffer.clear();
        if (remaining.isNotEmpty) eventBuffer.add(remaining);
      }
    }
  }

  /// Process a single Anthropic-format event JSON and yield stream events.
  List<LlmStreamEvent> _processAnthropicEvent(
    Map<String, dynamic> json,
    Map<int, _ToolUseAccumulator> toolUseBuffers,
  ) {
    final events = <LlmStreamEvent>[];
    final eventType = json['type'] as String?;
    if (eventType == null || eventType == 'ping') return events;

    switch (eventType) {
      case 'content_block_delta':
        final index = json['index'] as int? ?? 0;
        final delta = json['delta'] as Map<String, dynamic>?;
        if (delta == null) break;

        final deltaType = delta['type'] as String?;
        if (deltaType == 'text_delta') {
          final text = delta['text'] as String?;
          if (text != null && text.isNotEmpty) {
            events.add(LlmStreamEvent(contentDelta: text));
          }
        } else if (deltaType == 'input_json_delta') {
          final partialJson = delta['partial_json'] as String?;
          if (partialJson != null && partialJson.isNotEmpty) {
            final acc = toolUseBuffers.putIfAbsent(
              index,
              () => _ToolUseAccumulator(),
            );
            acc.partialJson += partialJson;
          }
        }

      case 'content_block_stop':
        final index = json['index'] as int? ?? 0;
        final acc = toolUseBuffers[index];
        if (acc != null && acc.id != null && acc.name != null) {
          final args =
              acc.partialJson.trim().isEmpty ? '{}' : acc.partialJson;
          events.add(LlmStreamEvent(
            toolCallDelta: ToolCall(
              id: acc.id!,
              type: 'function',
              function: ToolCallFunction(name: acc.name!, arguments: args),
            ),
          ));
          toolUseBuffers.remove(index);
        }

      case 'content_block_start':
        final contentBlock =
            json['content_block'] as Map<String, dynamic>?;
        if (contentBlock != null && contentBlock['type'] == 'tool_use') {
          final index = json['index'] as int? ?? 0;
          final acc = toolUseBuffers.putIfAbsent(
            index,
            () => _ToolUseAccumulator(),
          );
          acc.id = contentBlock['id'] as String?;
          acc.name = contentBlock['name'] as String?;
          acc.partialJson = '';
        }

      case 'message_delta':
        final delta = json['delta'] as Map<String, dynamic>?;
        final stopReason = delta?['stop_reason'] as String?;
        final usage = json['usage'] as Map<String, dynamic>?;

        if (stopReason != null && stopReason.isNotEmpty) {
          final finishReason = _mapStopReason(stopReason);
          events.add(LlmStreamEvent(
            finishReason: finishReason,
            usage: usage != null ? _parseUsage(usage) : null,
            isDone: true,
          ));
        }

      case 'message_stop':
        events.add(const LlmStreamEvent(isDone: true));

      case 'error':
        final error = json['error'] as Map<String, dynamic>?;
        final msg = error?['message'] as String? ?? 'Bedrock API error';
        throw LlmProviderException(message: msg);
    }

    return events;
  }

  // ---------------------------------------------------------------------------
  // Auth: Bearer token or SigV4
  // ---------------------------------------------------------------------------

  /// Returns auth headers based on the request's auth mode.
  /// Bearer mode: simple `Authorization: Bearer <token>` header.
  /// SigV4 mode: full AWS Signature V4 signed headers.
  Map<String, String> _buildHeaders(
    LlmRequest request,
    String host,
    String path,
    List<int> payload,
  ) {
    final region = request.awsRegion ?? _extractRegion(request.apiBase);

    if (request.awsAuthMode == 'bearer') {
      return {
        'Authorization': 'Bearer ${request.apiKey}',
        'Content-Type': 'application/json',
      };
    }

    // Default: SigV4 signing
    return _signRequest(
      method: 'POST',
      host: host,
      path: path,
      payload: payload,
      accessKeyId: request.apiKey,
      secretKey: request.awsSecretKey ?? '',
      region: region,
      contentType: 'application/json',
    );
  }

  static const _service = 'bedrock';

  Map<String, String> _signRequest({
    required String method,
    required String host,
    required String path,
    required List<int> payload,
    required String accessKeyId,
    required String secretKey,
    required String region,
    required String contentType,
  }) {
    final now = DateTime.now().toUtc();
    final dateStamp = _dateStamp(now);
    final amzDate = _amzDate(now);
    final payloadHash = sha256.convert(payload).toString();

    final headers = <String, String>{
      'host': host,
      'x-amz-date': amzDate,
      'x-amz-content-sha256': payloadHash,
      'content-type': contentType,
    };

    final signedHeaders = (headers.keys.toList()..sort()).join(';');

    // Canonical request
    final canonicalHeaders = (headers.keys.toList()..sort())
        .map((k) => '$k:${headers[k]!.trim()}')
        .join('\n');
    final canonicalRequest = [
      method,
      Uri.encodeFull(path),
      '', // query string (empty)
      '$canonicalHeaders\n',
      signedHeaders,
      payloadHash,
    ].join('\n');

    // String to sign
    final scope = '$dateStamp/$region/$_service/aws4_request';
    final stringToSign = [
      'AWS4-HMAC-SHA256',
      amzDate,
      scope,
      sha256.convert(utf8.encode(canonicalRequest)).toString(),
    ].join('\n');

    // Signing key
    final kDate = _hmacSha256(utf8.encode('AWS4$secretKey'), utf8.encode(dateStamp));
    final kRegion = _hmacSha256(kDate, utf8.encode(region));
    final kService = _hmacSha256(kRegion, utf8.encode(_service));
    final kSigning = _hmacSha256(kService, utf8.encode('aws4_request'));

    final signature = Hmac(sha256, kSigning)
        .convert(utf8.encode(stringToSign))
        .toString();

    return {
      'Authorization':
          'AWS4-HMAC-SHA256 Credential=$accessKeyId/$scope, '
          'SignedHeaders=$signedHeaders, Signature=$signature',
      'x-amz-date': amzDate,
      'x-amz-content-sha256': payloadHash,
      'Content-Type': contentType,
    };
  }

  static List<int> _hmacSha256(List<int> key, List<int> data) =>
      Hmac(sha256, key).convert(data).bytes;

  static String _dateStamp(DateTime dt) =>
      '${dt.year}${dt.month.toString().padLeft(2, '0')}${dt.day.toString().padLeft(2, '0')}';

  static String _amzDate(DateTime dt) =>
      '${_dateStamp(dt)}T${dt.hour.toString().padLeft(2, '0')}'
      '${dt.minute.toString().padLeft(2, '0')}'
      '${dt.second.toString().padLeft(2, '0')}Z';

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Builds the request body for Bedrock.
  /// Reuses AnthropicProvider for message conversion, then strips `model` and
  /// `stream` (Bedrock uses URL path/endpoint for those) and injects
  /// `anthropic_version` which Bedrock expects in the body (not as a header).
  Map<String, dynamic> _bedrockBody(LlmRequest request, {required bool stream}) {
    final body = _anthropic.buildBody(request, stream: stream);
    body.remove('model');  // model is in the URL path
    body.remove('stream'); // streaming is determined by URL endpoint
    body['anthropic_version'] = 'bedrock-2023-05-31';
    return body;
  }

  String _extractRegion(String apiBase) {
    // Extract region from URL like https://bedrock-runtime.us-east-1.amazonaws.com
    final match = RegExp(r'bedrock-runtime\.([a-z0-9-]+)\.amazonaws\.com')
        .firstMatch(apiBase);
    return match?.group(1) ?? 'us-east-1';
  }

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

  UsageInfo _parseUsage(Map<String, dynamic> json) => UsageInfo(
        promptTokens: json['input_tokens'] as int? ?? 0,
        completionTokens: json['output_tokens'] as int? ?? 0,
        totalTokens:
            (json['input_tokens'] as int? ?? 0) + (json['output_tokens'] as int? ?? 0),
      );

  LlmProviderException _handleDioError(DioException e) {
    String message = e.message ?? 'Unknown error';
    int? statusCode = e.response?.statusCode;

    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data as Map<String, dynamic>;
      message = data['message'] as String? ?? message;
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

class _ToolUseAccumulator {
  String? id;
  String? name;
  String partialJson = '';
}
