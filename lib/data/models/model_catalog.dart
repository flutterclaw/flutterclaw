import 'package:flutter/material.dart';

class CatalogProvider {
  final String id;
  final String displayName;
  final String description;
  final IconData icon;
  final String signupUrl;
  final String? apiBase;
  final bool hasFreeModels;

  const CatalogProvider({
    required this.id,
    required this.displayName,
    required this.description,
    required this.icon,
    required this.signupUrl,
    this.apiBase,
    this.hasFreeModels = false,
  });
}

class CatalogModel {
  final String id;
  final String displayName;
  final String providerId;
  final bool isFree;
  final int contextWindow;
  final String? description;
  /// Input modalities: 'text', 'image', 'audio'.
  final List<String> input;

  const CatalogModel({
    required this.id,
    required this.displayName,
    required this.providerId,
    required this.isFree,
    required this.contextWindow,
    this.description,
    this.input = const ['text'],
  });

  bool get supportsVision => input.contains('image');
  bool get supportsAudio => input.contains('audio');
}

class ModelCatalog {
  static const providers = <CatalogProvider>[
    CatalogProvider(
      id: 'openrouter',
      displayName: 'OpenRouter',
      description: 'Access 300+ models with one API key. Free models available.',
      icon: Icons.route,
      signupUrl: 'https://openrouter.ai/keys',
      apiBase: 'https://openrouter.ai/api/v1',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'openai',
      displayName: 'OpenAI',
      description: 'GPT-4.1, GPT-4o, o4-mini and more.',
      icon: Icons.auto_awesome,
      signupUrl: 'https://platform.openai.com/api-keys',
      apiBase: 'https://api.openai.com/v1',
    ),
    CatalogProvider(
      id: 'anthropic',
      displayName: 'Anthropic',
      description: 'Claude Haiku 4.5, Sonnet 4.5/4.6, Opus 4.6.',
      icon: Icons.psychology,
      signupUrl: 'https://console.anthropic.com/settings/keys',
      apiBase: 'https://api.anthropic.com',
    ),
    CatalogProvider(
      id: 'xai',
      displayName: 'xAI',
      description: 'Grok-3 and Grok-4-fast.',
      icon: Icons.bolt,
      signupUrl: 'https://console.x.ai/',
      apiBase: 'https://api.x.ai/v1',
    ),
    CatalogProvider(
      id: 'google',
      displayName: 'Google',
      description: 'Gemini 2.5 Flash and Pro — free tier available.',
      icon: Icons.star_outline,
      signupUrl: 'https://aistudio.google.com/app/apikey',
      // Google exposes an OpenAI-compatible endpoint under /v1beta/openai.
      // OpenAiProvider appends /chat/completions to this base.
      apiBase: 'https://generativelanguage.googleapis.com/v1beta/openai',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'deepseek',
      displayName: 'DeepSeek',
      description: 'DeepSeek-V3 and R1 — excellent reasoning at low cost.',
      icon: Icons.explore,
      signupUrl: 'https://platform.deepseek.com/api_keys',
      apiBase: 'https://api.deepseek.com/v1',
    ),
    CatalogProvider(
      id: 'groq',
      displayName: 'Groq',
      description: 'Groq.com — ultra-fast inference for Llama, Mixtral. Not related to xAI Grok.',
      icon: Icons.flash_on,
      signupUrl: 'https://console.groq.com/keys',
      apiBase: 'https://api.groq.com/openai/v1',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'ollama',
      displayName: 'Ollama',
      description: 'Run models locally on your machine.',
      icon: Icons.computer,
      signupUrl: 'https://ollama.com/download',
      apiBase: 'http://localhost:11434/v1',
    ),
    CatalogProvider(
      id: 'custom',
      displayName: 'Custom',
      description: 'Any OpenAI-compatible endpoint.',
      icon: Icons.tune,
      signupUrl: '',
    ),
  ];

  static const models = <CatalogModel>[
    // OpenRouter free models (featured) — Free Models Router first (default)
    CatalogModel(
      id: 'openrouter/auto',
      displayName: 'Free Models Router',
      providerId: 'openrouter',
      isFree: true,
      contextWindow: 200000,
      description: 'Auto-selects from available free models',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'minimax/minimax-m2.5:free',
      displayName: 'MiniMax M2.5',
      providerId: 'openrouter',
      isFree: true,
      contextWindow: 196608,
      description: 'MiniMax reasoning model — free',
      input: ['text'],
    ),
    CatalogModel(
      id: 'nvidia/nemotron-3-super-120b-a12b:free',
      displayName: 'Nemotron 3 Super 120B',
      providerId: 'openrouter',
      isFree: true,
      contextWindow: 262144,
      description: 'NVIDIA MoE — 120B params, 12B active, free',
      input: ['text'],
    ),
    CatalogModel(
      id: 'xiaomi/mimo-v2-omni',
      displayName: 'MiMo-V2-Omni',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 262144,
      description: 'Omni-modal: vision, audio, reasoning',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'xiaomi/mimo-v2-pro',
      displayName: 'MiMo-V2-Pro',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Agentic, long-horizon planning',
      input: ['text'],
    ),

    // OpenAI
    CatalogModel(
      id: 'gpt-4.1',
      displayName: 'GPT-4.1',
      providerId: 'openai',
      isFree: false,
      contextWindow: 1048576,
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'gpt-4o',
      displayName: 'GPT-4o',
      providerId: 'openai',
      isFree: false,
      contextWindow: 128000,
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'o4-mini',
      displayName: 'o4-mini',
      providerId: 'openai',
      isFree: false,
      contextWindow: 200000,
      description: 'Fast reasoning model',
      input: ['text', 'image'],
    ),

    // Anthropic
    CatalogModel(
      id: 'claude-haiku-4-5-20251001',
      displayName: 'Claude Haiku 4.5',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 200000,
      description: 'Fastest Claude — low cost',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'claude-sonnet-4-5-20250514',
      displayName: 'Claude Sonnet 4.5',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 200000,
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'claude-sonnet-4-6-20260301',
      displayName: 'Claude Sonnet 4.6',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 1000000,
      description: 'Latest Sonnet — 1M context, balanced',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'claude-opus-4-6-20260301',
      displayName: 'Claude Opus 4.6',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 200000,
      input: ['text', 'image'],
    ),

    // xAI
    CatalogModel(
      id: 'grok-4.20-0309-non-reasoning',
      displayName: 'Grok 4',
      providerId: 'xai',
      isFree: false,
      contextWindow: 2000000,
      description: 'xAI flagship — 2M context',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'grok-4-1-fast-non-reasoning',
      displayName: 'Grok 4 Fast',
      providerId: 'xai',
      isFree: false,
      contextWindow: 2000000,
      description: 'xAI fast inference — 2M context',
      input: ['text', 'image'],
    ),

    // Google Gemini
    CatalogModel(
      id: 'gemini-2.5-flash',
      displayName: 'Gemini 2.5 Flash',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Fast, multimodal, 1M context',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'gemini-2.5-flash-lite',
      displayName: 'Gemini 2.5 Flash Lite',
      providerId: 'google',
      isFree: true,
      contextWindow: 1048576,
      description: 'Free tier — fast and lightweight',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'gemini-2.5-pro',
      displayName: 'Gemini 2.5 Pro',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Most capable Gemini — complex tasks',
      input: ['text', 'image', 'audio'],
    ),

    // DeepSeek (OpenAI-compatible)
    CatalogModel(
      id: 'deepseek-chat',
      displayName: 'DeepSeek-V3',
      providerId: 'deepseek',
      isFree: false,
      contextWindow: 128000,
      description: 'Flagship chat model',
      input: ['text'],
    ),
    CatalogModel(
      id: 'deepseek-reasoner',
      displayName: 'DeepSeek-R1',
      providerId: 'deepseek',
      isFree: false,
      contextWindow: 128000,
      description: 'Chain-of-thought reasoning',
      input: ['text'],
    ),

    // Groq (OpenAI-compatible, ultra-fast)
    CatalogModel(
      id: 'llama-3.3-70b-versatile',
      displayName: 'Llama 3.3 70B',
      providerId: 'groq',
      isFree: true,
      contextWindow: 128000,
      description: 'Meta Llama — free, very fast',
      input: ['text'],
    ),
    CatalogModel(
      id: 'llama-3.1-8b-instant',
      displayName: 'Llama 3.1 8B (instant)',
      providerId: 'groq',
      isFree: true,
      contextWindow: 128000,
      description: 'Smallest Llama — near-instant',
      input: ['text'],
    ),
    CatalogModel(
      id: 'moonshotai/kimi-k2-instruct',
      displayName: 'Kimi K2',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 131072,
      description: 'MoonshotAI agentic model',
      input: ['text'],
    ),
    CatalogModel(
      id: 'deepseek/deepseek-r1-0528',
      displayName: 'DeepSeek R1 (via OpenRouter)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 163840,
      description: 'CoT reasoning via OpenRouter',
      input: ['text'],
    ),
    CatalogModel(
      id: 'meta-llama/llama-4-maverick',
      displayName: 'Llama 4 Maverick',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Meta multimodal flagship',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'qwen/qwen3-235b-a22b',
      displayName: 'Qwen3 235B',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 40960,
      description: 'Alibaba flagship reasoning model',
      input: ['text'],
    ),
    CatalogModel(
      id: 'mistralai/mistral-large',
      displayName: 'Mistral Large',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 131072,
      description: 'Mistral flagship',
      input: ['text'],
    ),
    CatalogModel(
      id: 'google/gemini-2.5-flash',
      displayName: 'Gemini 2.5 Flash (OR)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Google Gemini via OpenRouter',
      input: ['text', 'image'],
    ),
  ];

  static CatalogProvider? getProvider(String id) {
    for (final p in providers) {
      if (p.id == id) return p;
    }
    return null;
  }

  static List<CatalogModel> modelsForProvider(String providerId) {
    return models.where((m) => m.providerId == providerId).toList();
  }

  static List<CatalogModel> get freeModels {
    return models.where((m) => m.isFree).toList();
  }

  /// Returns the known input capabilities for a model ID, or null if unknown.
  static List<String>? inputFor(String modelId) {
    for (final m in models) {
      if (m.id == modelId) return m.input;
    }
    return null;
  }

  static String formatContext(int tokens) {
    if (tokens >= 1000000) {
      return '${(tokens / 1000000).toStringAsFixed(0)}M';
    }
    return '${(tokens / 1000).toStringAsFixed(0)}K';
  }
}
