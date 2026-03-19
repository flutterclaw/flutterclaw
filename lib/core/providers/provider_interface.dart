/// Base interface and model classes for LLM providers.
library;

/// Base interface for LLM providers.
abstract class LlmProvider {
  String get name;
  String get defaultApiBase;

  Future<LlmResponse> chatCompletion(LlmRequest request);
  Stream<LlmStreamEvent> chatCompletionStream(LlmRequest request);
}

/// Request payload for chat completion.
class LlmRequest {
  final String model;
  final String apiKey;
  final String apiBase;
  final List<LlmMessage> messages;
  final List<Map<String, dynamic>>? tools;
  final int maxTokens;
  final double temperature;
  final int? timeoutSeconds;

  const LlmRequest({
    required this.model,
    required this.apiKey,
    required this.apiBase,
    required this.messages,
    this.tools,
    this.maxTokens = 4096,
    this.temperature = 0.7,
    this.timeoutSeconds,
  });

  Map<String, dynamic> toJson() => {
    'model': model,
    'api_key': apiKey,
    'api_base': apiBase,
    'messages': messages.map((e) => e.toJson()).toList(),
    if (tools != null) 'tools': tools,
    'max_tokens': maxTokens,
    'temperature': temperature,
    if (timeoutSeconds != null) 'timeout_seconds': timeoutSeconds,
  };

  factory LlmRequest.fromJson(Map<String, dynamic> json) => LlmRequest(
    model: json['model'] as String,
    apiKey: json['api_key'] as String,
    apiBase: json['api_base'] as String,
    messages: (json['messages'] as List<dynamic>)
        .map((e) => LlmMessage.fromJson(e as Map<String, dynamic>))
        .toList(),
    tools: (json['tools'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    maxTokens: json['max_tokens'] as int? ?? 4096,
    temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
    timeoutSeconds: json['timeout_seconds'] as int?,
  );

  LlmRequest copyWith({
    String? model,
    String? apiKey,
    String? apiBase,
    List<LlmMessage>? messages,
    List<Map<String, dynamic>>? tools,
    int? maxTokens,
    double? temperature,
    int? timeoutSeconds,
  }) => LlmRequest(
    model: model ?? this.model,
    apiKey: apiKey ?? this.apiKey,
    apiBase: apiBase ?? this.apiBase,
    messages: messages ?? this.messages,
    tools: tools ?? this.tools,
    maxTokens: maxTokens ?? this.maxTokens,
    temperature: temperature ?? this.temperature,
    timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
  );
}

/// A single message in the conversation.
class LlmMessage {
  /// Role: system, user, assistant, tool
  final String role;

  /// Content: String for text, or List for multimodal (e.g. text + image parts)
  final dynamic content;

  final String? name;
  final List<ToolCall>? toolCalls;
  final String? toolCallId;

  /// Optional metadata (e.g. error info). Persisted in JSONL but ignored by LLM APIs.
  final Map<String, dynamic>? metadata;

  const LlmMessage({
    required this.role,
    required this.content,
    this.name,
    this.toolCalls,
    this.toolCallId,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
    'role': role,
    'content': content,
    if (name != null) 'name': name,
    if (toolCalls != null)
      'tool_calls': toolCalls!.map((e) => e.toJson()).toList(),
    if (toolCallId != null) 'tool_call_id': toolCallId,
    if (metadata != null) '_metadata': metadata,
  };

  factory LlmMessage.fromJson(Map<String, dynamic> json) => LlmMessage(
    role: json['role'] as String,
    content: json['content'],
    name: json['name'] as String?,
    toolCalls: (json['tool_calls'] as List<dynamic>?)
        ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
        .toList(),
    toolCallId: json['tool_call_id'] as String?,
    metadata: json['_metadata'] as Map<String, dynamic>?,
  );
}

/// Represents a tool/function call from the model.
class ToolCall {
  final String id;
  final String type; // always "function"
  final ToolCallFunction function;

  const ToolCall({
    required this.id,
    this.type = 'function',
    required this.function,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'function': function.toJson(),
  };

  factory ToolCall.fromJson(Map<String, dynamic> json) => ToolCall(
    id: json['id'] as String,
    type: json['type'] as String? ?? 'function',
    function: ToolCallFunction.fromJson(
      json['function'] as Map<String, dynamic>,
    ),
  );
}

/// Function details within a tool call.
class ToolCallFunction {
  final String name;
  final String arguments; // JSON string

  const ToolCallFunction({required this.name, required this.arguments});

  Map<String, dynamic> toJson() => {'name': name, 'arguments': arguments};

  factory ToolCallFunction.fromJson(Map<String, dynamic> json) =>
      ToolCallFunction(
        name: json['name'] as String,
        arguments: json['arguments'] as String? ?? '{}',
      );
}

/// Response from a non-streaming chat completion.
class LlmResponse {
  final String? content;
  final List<ToolCall>? toolCalls;
  final String finishReason; // stop, tool_calls, length
  final UsageInfo? usage;

  const LlmResponse({
    this.content,
    this.toolCalls,
    this.finishReason = 'stop',
    this.usage,
  });

  Map<String, dynamic> toJson() => {
    if (content != null) 'content': content,
    if (toolCalls != null)
      'tool_calls': toolCalls!.map((e) => e.toJson()).toList(),
    'finish_reason': finishReason,
    if (usage != null) 'usage': usage!.toJson(),
  };

  factory LlmResponse.fromJson(Map<String, dynamic> json) => LlmResponse(
    content: json['content'] as String?,
    toolCalls: (json['tool_calls'] as List<dynamic>?)
        ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
        .toList(),
    finishReason: json['finish_reason'] as String? ?? 'stop',
    usage: json['usage'] != null
        ? UsageInfo.fromJson(json['usage'] as Map<String, dynamic>)
        : null,
  );
}

/// Token usage information.
class UsageInfo {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  const UsageInfo({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  Map<String, dynamic> toJson() => {
    'prompt_tokens': promptTokens,
    'completion_tokens': completionTokens,
    'total_tokens': totalTokens,
  };

  factory UsageInfo.fromJson(Map<String, dynamic> json) => UsageInfo(
    promptTokens: json['prompt_tokens'] as int? ?? 0,
    completionTokens: json['completion_tokens'] as int? ?? 0,
    totalTokens: json['total_tokens'] as int? ?? 0,
  );
}

/// A single event in a streaming chat completion.
class LlmStreamEvent {
  final String? contentDelta;
  final ToolCall? toolCallDelta;
  final String? finishReason;
  final UsageInfo? usage;
  final bool isDone;

  const LlmStreamEvent({
    this.contentDelta,
    this.toolCallDelta,
    this.finishReason,
    this.usage,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
    if (contentDelta != null) 'content_delta': contentDelta,
    if (toolCallDelta != null) 'tool_call_delta': toolCallDelta!.toJson(),
    if (finishReason != null) 'finish_reason': finishReason,
    if (usage != null) 'usage': usage!.toJson(),
    'is_done': isDone,
  };

  factory LlmStreamEvent.fromJson(Map<String, dynamic> json) => LlmStreamEvent(
    contentDelta: json['content_delta'] as String?,
    toolCallDelta: json['tool_call_delta'] != null
        ? ToolCall.fromJson(json['tool_call_delta'] as Map<String, dynamic>)
        : null,
    finishReason: json['finish_reason'] as String?,
    usage: json['usage'] != null
        ? UsageInfo.fromJson(json['usage'] as Map<String, dynamic>)
        : null,
    isDone: json['is_done'] as bool? ?? false,
  );
}
