/// Queries provider APIs to discover available models dynamically.
///
/// Supported providers:
/// - **Ollama** — GET /api/tags (local endpoint)
/// - **OpenRouter** — GET /api/v1/models (public, no auth needed)
/// - **OpenAI-compatible** — GET /v1/models (requires API key)
///
/// Results are merged with the static catalog; duplicates (matching id) are
/// skipped so the catalog's display names and metadata take precedence.
library;

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../data/models/model_catalog.dart';

final _log = Logger('ModelDiscoveryService');

/// A discovered model from a provider API.
class DiscoveredModel {
  final String id;
  final String displayName;
  final String providerId;
  final bool isFree;

  const DiscoveredModel({
    required this.id,
    required this.displayName,
    required this.providerId,
    this.isFree = false,
  });

  /// Convert to a [CatalogModel] for display alongside static entries.
  CatalogModel toCatalogModel() => CatalogModel(
        id: id,
        displayName: displayName,
        providerId: providerId,
        isFree: isFree,
        contextWindow: 0, // unknown
        input: const ['text'],
      );
}

class ModelDiscoveryService {
  final Dio _dio;

  ModelDiscoveryService({Dio? dio}) : _dio = dio ?? Dio();

  /// Discover available models for the given [providerId].
  ///
  /// [apiKey] — the user's API key (may be empty for Ollama).
  /// [apiBase] — override the default base URL (used for custom providers).
  ///
  /// Returns an empty list on any network or parse error (non-throwing).
  Future<List<DiscoveredModel>> discoverModels({
    required String providerId,
    required String apiKey,
    String? apiBase,
  }) async {
    try {
      switch (providerId) {
        case 'ollama':
          return await _discoverOllama(apiBase ?? 'http://localhost:11434');
        case 'openrouter':
          return await _discoverOpenRouter(apiKey);
        case 'openai':
        case 'xai':
        case 'groq':
        case 'deepseek':
        case 'google':
        case 'custom':
          final base = apiBase ??
              ModelCatalog.getProvider(providerId)?.apiBase ??
              'https://api.openai.com/v1';
          return await _discoverOpenAiCompat(
            providerId: providerId,
            apiKey: apiKey,
            apiBase: base,
          );
        default:
          return [];
      }
    } catch (e) {
      _log.warning('Model discovery failed for $providerId: $e');
      return [];
    }
  }

  // -----------------------------------------------------------------------
  // Ollama — GET /api/tags  (no auth)
  // -----------------------------------------------------------------------
  Future<List<DiscoveredModel>> _discoverOllama(String base) async {
    final url = base.endsWith('/') ? '${base}api/tags' : '$base/api/tags';
    final response = await _dio.get(
      url,
      options: Options(
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        validateStatus: (_) => true,
      ),
    );
    if ((response.statusCode ?? 0) != 200) return [];

    final models = response.data?['models'] as List? ?? [];
    return models.map((m) {
      final name = (m['name'] as String?) ?? '';
      return DiscoveredModel(
        id: name,
        displayName: name,
        providerId: 'ollama',
        isFree: true,
      );
    }).toList();
  }

  // -----------------------------------------------------------------------
  // OpenRouter — GET /api/v1/models  (no auth required for public list)
  // -----------------------------------------------------------------------
  Future<List<DiscoveredModel>> _discoverOpenRouter(String apiKey) async {
    final headers = <String, dynamic>{
      'HTTP-Referer': 'https://flutterclaw.ai',
    };
    if (apiKey.isNotEmpty) headers['Authorization'] = 'Bearer $apiKey';

    final response = await _dio.get(
      'https://openrouter.ai/api/v1/models',
      options: Options(
        headers: headers,
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (_) => true,
      ),
    );
    if ((response.statusCode ?? 0) != 200) return [];

    final data = response.data?['data'] as List? ?? [];
    return data.map((m) {
      final id = (m['id'] as String?) ?? '';
      final name = (m['name'] as String?) ?? id;
      // pricing: prompt price per token; 0 = free
      final pricing = m['pricing'] as Map?;
      final promptPrice = double.tryParse('${pricing?['prompt'] ?? '1'}') ?? 1.0;
      return DiscoveredModel(
        id: 'openrouter/$id',
        displayName: name,
        providerId: 'openrouter',
        isFree: promptPrice == 0.0,
      );
    }).toList();
  }

  // -----------------------------------------------------------------------
  // OpenAI-compatible GET /v1/models
  // -----------------------------------------------------------------------
  Future<List<DiscoveredModel>> _discoverOpenAiCompat({
    required String providerId,
    required String apiKey,
    required String apiBase,
  }) async {
    if (apiKey.isEmpty) return [];

    // Normalise base: remove trailing /openai suffix added for Gemini compat
    final normalised = apiBase.endsWith('/openai')
        ? apiBase.substring(0, apiBase.length - 7)
        : apiBase;
    final base = normalised.endsWith('/') ? normalised : '$normalised/';

    final response = await _dio.get(
      '${base}models',
      options: Options(
        headers: {'Authorization': 'Bearer $apiKey'},
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (_) => true,
      ),
    );
    if ((response.statusCode ?? 0) != 200) return [];

    final data = response.data?['data'] as List? ?? [];
    return data.map((m) {
      final id = (m['id'] as String?) ?? '';
      return DiscoveredModel(
        id: id,
        displayName: id,
        providerId: providerId,
      );
    }).toList();
  }
}
