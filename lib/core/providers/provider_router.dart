/// Routes LLM requests to the correct provider based on vendor prefix.
library;

import 'package:dio/dio.dart';

import '../../data/models/config.dart';
import 'anthropic_provider.dart';
import 'openai_provider.dart';
import 'provider_interface.dart';

/// Vendor configuration: provider instance and default API base.
class VendorConfig {
  final LlmProvider provider;
  final String defaultApiBase;

  const VendorConfig({required this.provider, required this.defaultApiBase});
}

/// Routes model requests to the correct provider based on vendor prefix.
/// Uses round-robin load balancing when multiple entries exist for the same
/// model name in [FlutterClawConfig.modelList].
class ProviderRouter {
  ProviderRouter({FlutterClawConfig? config, Dio? dio})
    : _config = config ?? const FlutterClawConfig(),
      _dio = dio ?? Dio() {
    _openAiProvider = OpenAiProvider(dio: _dio);
    _anthropicProvider = AnthropicProvider(dio: _dio);

    _vendorMap = {
      'openai': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://api.openai.com/v1',
      ),
      'anthropic': VendorConfig(
        provider: _anthropicProvider,
        defaultApiBase: 'https://api.anthropic.com',
      ),
      'google': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://generativelanguage.googleapis.com/v1beta/openai',
      ),
      'groq': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://api.groq.com/openai/v1',
      ),
      'deepseek': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://api.deepseek.com/v1',
      ),
      'gemini': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://generativelanguage.googleapis.com/v1beta',
      ),
      'zhipu': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://open.bigmodel.cn/api/paas/v4',
      ),
      'openrouter': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://openrouter.ai/api/v1',
      ),
      'volcengine': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://ark.cn-beijing.volces.com/api/v3',
      ),
      'ollama': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'http://localhost:11434/v1',
      ),
      'qwen': VendorConfig(
        provider: _openAiProvider,
        defaultApiBase: 'https://dashscope.aliyuncs.com/compatible-mode/v1',
      ),
    };
  }

  FlutterClawConfig _config;
  final Dio _dio;
  late final OpenAiProvider _openAiProvider;
  late final AnthropicProvider _anthropicProvider;
  late final Map<String, VendorConfig> _vendorMap;

  /// Round-robin index per model name.
  final Map<String, int> _roundRobinIndex = {};

  /// Resolves a [modelName] to a [ModelEntry] using round-robin when multiple
  /// entries exist in the config's model list.
  ModelEntry? resolveModelEntry(String modelName) {
    final entries = _config.getModels(modelName);
    if (entries.isEmpty) return null;

    final index = _roundRobinIndex[modelName] ?? 0;
    final entry = entries[index % entries.length];
    _roundRobinIndex[modelName] = index + 1;

    return entry;
  }

  /// Gets the [VendorConfig] for a vendor string.
  VendorConfig? getVendorConfig(String vendor) =>
      _vendorMap[vendor.toLowerCase()];

  /// Builds an [LlmRequest] from a [ModelEntry] and optional overrides.
  LlmRequest buildRequest({
    required ModelEntry modelEntry,
    required List<LlmMessage> messages,
    List<Map<String, dynamic>>? tools,
    int maxTokens = 4096,
    double temperature = 0.7,
  }) {
    final vendorConfig = getVendorConfig(modelEntry.vendor);
    final apiBase =
        modelEntry.apiBase ??
        vendorConfig?.defaultApiBase ??
        'https://api.openai.com/v1';
    final apiKey = modelEntry.apiKey ?? '';

    // OpenRouter model IDs always include the org prefix (e.g.
    // "openrouter/xiaomi/mimo-v2-pro", "google/gemini-2.5-flash"), so we must NOT
    // strip the vendor segment.  For all other vendors the first segment is
    // our internal routing prefix and should be removed.
    final modelForApi = modelEntry.vendor == 'openrouter'
        ? modelEntry.model  // keep full ID
        : modelEntry.modelId;

    return LlmRequest(
      model: modelForApi,
      apiKey: apiKey,
      apiBase: apiBase,
      messages: messages,
      tools: tools,
      maxTokens: maxTokens,
      temperature: temperature,
      timeoutSeconds: modelEntry.requestTimeout,
    );
  }

  /// Resolves the model and returns the provider plus request, or null if
  /// the model cannot be resolved.
  ({LlmProvider provider, LlmRequest request})? resolve(
    String modelName, {
    required List<LlmMessage> messages,
    List<Map<String, dynamic>>? tools,
    int maxTokens = 4096,
    double temperature = 0.7,
  }) {
    final entry = resolveModelEntry(modelName);
    if (entry == null) return null;

    final vendorConfig = getVendorConfig(entry.vendor);
    if (vendorConfig == null) return null;

    final request = buildRequest(
      modelEntry: entry,
      messages: messages,
      tools: tools,
      maxTokens: maxTokens,
      temperature: temperature,
    );

    return (provider: vendorConfig.provider, request: request);
  }

  /// Performs a chat completion for the given [modelName].
  /// Returns null if the model cannot be resolved.
  Future<LlmResponse?> chatCompletion(
    String modelName, {
    required List<LlmMessage> messages,
    List<Map<String, dynamic>>? tools,
    int maxTokens = 4096,
    double temperature = 0.7,
  }) async {
    final resolved = resolve(
      modelName,
      messages: messages,
      tools: tools,
      maxTokens: maxTokens,
      temperature: temperature,
    );
    if (resolved == null) return null;

    return resolved.provider.chatCompletion(resolved.request);
  }

  /// Streams a chat completion for the given [modelName].
  /// Returns null if the model cannot be resolved.
  Stream<LlmStreamEvent>? chatCompletionStream(
    String modelName, {
    required List<LlmMessage> messages,
    List<Map<String, dynamic>>? tools,
    int maxTokens = 4096,
    double temperature = 0.7,
  }) {
    final resolved = resolve(
      modelName,
      messages: messages,
      tools: tools,
      maxTokens: maxTokens,
      temperature: temperature,
    );
    if (resolved == null) return null;

    return resolved.provider.chatCompletionStream(resolved.request);
  }

  /// Updates the configuration.
  void updateConfig(FlutterClawConfig config) {
    _config = config;
  }

  /// Current configuration.
  FlutterClawConfig get config => _config;
}
