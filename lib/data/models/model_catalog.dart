import 'package:flutter/material.dart';
import 'package:flutterclaw/services/region_service.dart';

class CatalogProvider {
  final String id;
  final String displayName;
  final String description;
  final IconData icon;
  /// Bundled brand mark (SVG under [assets/providers/]); null uses [icon].
  final String? logoAsset;
  final String signupUrl;
  final String? apiBase;
  final bool hasFreeModels;

  const CatalogProvider({
    required this.id,
    required this.displayName,
    required this.description,
    required this.icon,
    this.logoAsset,
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

  /// Price per million INPUT tokens in USD (0 = free or unknown).
  final double inputPriceUsdPerMillion;
  /// Price per million OUTPUT tokens in USD (0 = free or unknown).
  final double outputPriceUsdPerMillion;
  /// Price per million cache-READ tokens in USD (Anthropic only).
  final double cacheReadPriceUsdPerMillion;
  /// Price per million cache-WRITE tokens in USD (Anthropic only).
  final double cacheWritePriceUsdPerMillion;

  /// True when this model supports the Anthropic **effort API**
  /// (`output_config.effort` + beta `effort-2025-11-24`).
  ///
  /// These models implement *adaptive thinking*: the model decides its own
  /// thinking allocation based on task complexity within the effort envelope.
  /// Available on Claude Haiku/Sonnet/Opus 4.5+ and 4.6+.
  final bool supportsAdaptiveThinking;

  /// True when this model supports classic **extended thinking** with an
  /// explicit budget (`thinking.budget_tokens` + beta
  /// `interleaved-thinking-2025-05-14`).
  ///
  /// For models that also have [supportsAdaptiveThinking], the effort API is
  /// preferred — this flag is kept for explicit-budget use cases only.
  final bool supportsExtendedThinking;

  /// Default effort level when [supportsAdaptiveThinking] is true and the user
  /// hasn't set an explicit level. 'medium' is a good default per Anthropic.
  final String defaultEffort;

  /// True when this model uses the Gemini Live API (real-time WebSocket audio).
  final bool supportsLive;

  const CatalogModel({
    required this.id,
    required this.displayName,
    required this.providerId,
    required this.isFree,
    required this.contextWindow,
    this.description,
    this.input = const ['text'],
    this.inputPriceUsdPerMillion = 0,
    this.outputPriceUsdPerMillion = 0,
    this.cacheReadPriceUsdPerMillion = 0,
    this.cacheWritePriceUsdPerMillion = 0,
    this.supportsAdaptiveThinking = false,
    this.supportsExtendedThinking = false,
    this.defaultEffort = 'medium',
    this.supportsLive = false,
  });

  bool get supportsVision => input.contains('image');
  bool get supportsAudio => input.contains('audio');
  bool get hasPricing => inputPriceUsdPerMillion > 0 || outputPriceUsdPerMillion > 0;
  bool get isLiveModel => supportsLive;

  /// Compute USD cost for a set of token counts.
  double computeCostUsd({
    required int inputTokens,
    required int outputTokens,
    int cacheReadTokens = 0,
    int cacheWriteTokens = 0,
  }) {
    return (inputTokens / 1e6) * inputPriceUsdPerMillion
        + (outputTokens / 1e6) * outputPriceUsdPerMillion
        + (cacheReadTokens / 1e6) * cacheReadPriceUsdPerMillion
        + (cacheWriteTokens / 1e6) * cacheWritePriceUsdPerMillion;
  }
}

class ModelCatalog {
  static const providers = <CatalogProvider>[
    CatalogProvider(
      id: 'openrouter',
      displayName: 'OpenRouter',
      description: 'Access 300+ models with one API key. Free models available.',
      icon: Icons.route,
      logoAsset: 'assets/providers/openrouter.svg',
      signupUrl: 'https://openrouter.ai/keys',
      apiBase: 'https://openrouter.ai/api/v1',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'openai',
      displayName: 'OpenAI',
      description: 'GPT-4.1, GPT-4o, o4-mini and more.',
      icon: Icons.auto_awesome,
      logoAsset: 'assets/providers/openai.svg',
      signupUrl: 'https://platform.openai.com/api-keys',
      apiBase: 'https://api.openai.com/v1',
    ),
    CatalogProvider(
      id: 'anthropic',
      displayName: 'Anthropic',
      description: 'Claude Haiku 4.5, Sonnet 4.5/4.6, Opus 4.6.',
      icon: Icons.psychology,
      logoAsset: 'assets/providers/anthropic.svg',
      signupUrl: 'https://console.anthropic.com/settings/keys',
      apiBase: 'https://api.anthropic.com',
    ),
    CatalogProvider(
      id: 'xai',
      displayName: 'xAI',
      description: 'Grok 4 and Grok 4 Fast — multimodal chat (docs.x.ai).',
      icon: Icons.bolt,
      logoAsset: 'assets/providers/xai.svg',
      signupUrl: 'https://console.x.ai/',
      apiBase: 'https://api.x.ai/v1',
    ),
    CatalogProvider(
      id: 'google',
      displayName: 'Google',
      description: 'Gemini 3.x (preview) and 2.5 Flash/Pro — free tier on select models.',
      icon: Icons.star_outline,
      logoAsset: 'assets/providers/google.svg',
      signupUrl: 'https://aistudio.google.com/app/apikey',
      // Google exposes an OpenAI-compatible endpoint under /v1beta/openai.
      // OpenAiProvider appends /chat/completions to this base.
      apiBase: 'https://generativelanguage.googleapis.com/v1beta/openai',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'deepseek',
      displayName: 'DeepSeek',
      description: 'DeepSeek-V3.2 (chat + reasoner) — 128K context (api-docs.deepseek.com).',
      icon: Icons.explore,
      logoAsset: 'assets/providers/deepseek.svg',
      signupUrl: 'https://platform.deepseek.com/api_keys',
      apiBase: 'https://api.deepseek.com/v1',
    ),
    CatalogProvider(
      id: 'groq',
      displayName: 'Groq',
      description:
          'GroqCloud — fast Llama inference. Model IDs: console.groq.com/docs/models. Not xAI Grok.',
      icon: Icons.flash_on,
      logoAsset: 'assets/providers/groq.svg',
      signupUrl: 'https://console.groq.com/keys',
      apiBase: 'https://api.groq.com/openai/v1',
    ),
    CatalogProvider(
      id: 'ollama',
      displayName: 'Ollama',
      description: 'Ollama Cloud or a local instance. Change the URL to use local.',
      icon: Icons.computer,
      logoAsset: 'assets/providers/ollama.svg',
      signupUrl: 'https://ollama.com/settings/keys',
      apiBase: 'https://ollama.com/v1',
      hasFreeModels: true,
    ),
    CatalogProvider(
      id: 'bedrock',
      displayName: 'AWS Bedrock',
      description: 'Claude models via AWS Bedrock (SigV4 auth).',
      icon: Icons.cloud,
      logoAsset: 'assets/providers/bedrock.svg',
      signupUrl: 'https://console.aws.amazon.com/bedrock/',
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

    // Ollama Cloud — popular models (API key required for cloud; change URL for local)
    CatalogModel(
      id: 'qwen3.5:35b',
      displayName: 'Qwen 3.5 35B',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'Alibaba Qwen 3.5 35B — agentic, coding, multilingual',
      input: ['text'],
    ),
    CatalogModel(
      id: 'deepseek-v3.2',
      displayName: 'DeepSeek V3.2',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'DeepSeek V3.2 — strong reasoning and coding',
      input: ['text'],
    ),
    CatalogModel(
      id: 'nemotron-3-super:120b',
      displayName: 'Nemotron 3 Super 120B',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'NVIDIA MoE — 120B total, 12B active',
      input: ['text'],
    ),
    CatalogModel(
      id: 'devstral-2:123b',
      displayName: 'Devstral 2 123B',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'Mistral coding agent — tool use, codebase exploration',
      input: ['text'],
    ),
    CatalogModel(
      id: 'qwen3-coder-next',
      displayName: 'Qwen3 Coder Next',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'Qwen3 coding-focused, agentic coding',
      input: ['text'],
    ),
    CatalogModel(
      id: 'gemini-3-flash-preview',
      displayName: 'Gemini 3 Flash Preview',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'Google Gemini 3 Flash — fast, multimodal',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'minimax-m2.7',
      displayName: 'MiniMax M2.7',
      providerId: 'ollama',
      isFree: true,
      contextWindow: 131072,
      description: 'MiniMax M2.7 — coding, agentic, productivity',
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
      inputPriceUsdPerMillion: 2.00,
      outputPriceUsdPerMillion: 8.00,
    ),
    CatalogModel(
      id: 'gpt-4o',
      displayName: 'GPT-4o',
      providerId: 'openai',
      isFree: false,
      contextWindow: 128000,
      input: ['text', 'image'],
      inputPriceUsdPerMillion: 2.50,
      outputPriceUsdPerMillion: 10.00,
    ),
    CatalogModel(
      id: 'o4-mini',
      displayName: 'o4-mini',
      providerId: 'openai',
      isFree: false,
      contextWindow: 200000,
      description: 'Fast reasoning model',
      input: ['text', 'image'],
      inputPriceUsdPerMillion: 1.10,
      outputPriceUsdPerMillion: 4.40,
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
      inputPriceUsdPerMillion: 0.80,
      outputPriceUsdPerMillion: 4.00,
      cacheReadPriceUsdPerMillion: 0.08,
      cacheWritePriceUsdPerMillion: 1.00,
      supportsAdaptiveThinking: true,
      defaultEffort: 'low',
    ),
    CatalogModel(
      id: 'claude-sonnet-4-5-20250514',
      displayName: 'Claude Sonnet 4.5',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 200000,
      input: ['text', 'image'],
      inputPriceUsdPerMillion: 3.00,
      outputPriceUsdPerMillion: 15.00,
      cacheReadPriceUsdPerMillion: 0.30,
      cacheWritePriceUsdPerMillion: 3.75,
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),
    CatalogModel(
      id: 'claude-sonnet-4-6',
      displayName: 'Claude Sonnet 4.6',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 1000000,
      description: 'Latest Sonnet — 1M context, balanced (Claude API ID per Anthropic docs)',
      input: ['text', 'image'],
      inputPriceUsdPerMillion: 3.00,
      outputPriceUsdPerMillion: 15.00,
      cacheReadPriceUsdPerMillion: 0.30,
      cacheWritePriceUsdPerMillion: 3.75,
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),
    CatalogModel(
      id: 'claude-opus-4-6',
      displayName: 'Claude Opus 4.6',
      providerId: 'anthropic',
      isFree: false,
      contextWindow: 1000000,
      description: 'Most capable Claude — 1M context (Claude API ID per Anthropic docs)',
      input: ['text', 'image'],
      inputPriceUsdPerMillion: 15.00,
      outputPriceUsdPerMillion: 75.00,
      cacheReadPriceUsdPerMillion: 1.50,
      cacheWritePriceUsdPerMillion: 18.75,
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),

    // AWS Bedrock (Anthropic Claude)
    CatalogModel(
      id: 'us.anthropic.claude-opus-4-6-v1',
      displayName: 'Claude Opus 4.6',
      providerId: 'bedrock',
      isFree: false,
      contextWindow: 200000,
      description: 'Most capable Claude via Bedrock',
      input: ['text', 'image'],
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),
    CatalogModel(
      id: 'us.anthropic.claude-sonnet-4-6',
      displayName: 'Claude Sonnet 4.6',
      providerId: 'bedrock',
      isFree: false,
      contextWindow: 200000,
      description: 'Sonnet 4.6 via Bedrock — balanced speed and capability',
      input: ['text', 'image'],
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),
    CatalogModel(
      id: 'us.anthropic.claude-opus-4-5-20251101-v1:0',
      displayName: 'Claude Opus 4.5',
      providerId: 'bedrock',
      isFree: false,
      contextWindow: 200000,
      description: 'Opus 4.5 via Bedrock — advanced reasoning',
      input: ['text', 'image'],
      supportsAdaptiveThinking: true,
      defaultEffort: 'high',
    ),
    CatalogModel(
      id: 'us.anthropic.claude-sonnet-4-5-20250929-v1:0',
      displayName: 'Claude Sonnet 4.5',
      providerId: 'bedrock',
      isFree: false,
      contextWindow: 200000,
      description: 'Sonnet 4.5 via Bedrock — balanced speed and capability',
      input: ['text', 'image'],
      supportsAdaptiveThinking: true,
      defaultEffort: 'medium',
    ),
    CatalogModel(
      id: 'us.anthropic.claude-haiku-4-5-20251001-v1:0',
      displayName: 'Claude Haiku 4.5',
      providerId: 'bedrock',
      isFree: false,
      contextWindow: 200000,
      description: 'Fastest Claude via Bedrock — low cost',
      input: ['text', 'image'],
      supportsAdaptiveThinking: true,
      defaultEffort: 'low',
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
    CatalogModel(
      id: 'gemini-3.1-pro-preview',
      displayName: 'Gemini 3.1 Pro (Preview)',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Latest Pro — reasoning, coding, agentic workflows',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'gemini-3.1-pro-preview-customtools',
      displayName: 'Gemini 3.1 Pro (Preview, custom tools)',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Same as 3.1 Pro — optimized for custom tools and bash',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'gemini-3-flash-preview',
      displayName: 'Gemini 3 Flash (Preview)',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Gemini 3 — strong multimodal and agentic, lower cost than Pro',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'gemini-3.1-flash-lite-preview',
      displayName: 'Gemini 3.1 Flash-Lite (Preview)',
      providerId: 'google',
      isFree: false,
      contextWindow: 1048576,
      description: 'Fastest, most cost-efficient Gemini 3 multimodal',
      input: ['text', 'image', 'audio'],
    ),
    CatalogModel(
      id: 'gemini-3.1-flash-live-preview',
      displayName: 'Gemini 3.1 Flash Live',
      providerId: 'google',
      isFree: false,
      contextWindow: 128000,
      description: 'Real-time voice — Live API (preview, may require allowlist)',
      input: ['text', 'audio', 'image'],
      supportsLive: true,
    ),
    CatalogModel(
      id: 'gemini-2.5-flash-preview-native-audio-dialog',
      displayName: 'Gemini 2.5 Flash Live',
      providerId: 'google',
      isFree: false,
      contextWindow: 1000000,
      description: 'Real-time voice — Live API (stable preview)',
      input: ['text', 'audio', 'image'],
      supportsLive: true,
    ),

    // DeepSeek (OpenAI-compatible)
    CatalogModel(
      id: 'deepseek-chat',
      displayName: 'DeepSeek-V3.2',
      providerId: 'deepseek',
      isFree: false,
      contextWindow: 128000,
      description: 'Flagship chat (DeepSeek-V3.2 non-thinking, api-docs.deepseek.com)',
      input: ['text'],
    ),
    CatalogModel(
      id: 'deepseek-reasoner',
      displayName: 'DeepSeek-R1',
      providerId: 'deepseek',
      isFree: false,
      contextWindow: 128000,
      description: 'Thinking mode (DeepSeek-V3.2, api-docs.deepseek.com)',
      input: ['text'],
    ),

    // Groq (OpenAI-compatible, ultra-fast) — model IDs: console.groq.com/docs/models
    CatalogModel(
      id: 'llama-3.3-70b-versatile',
      displayName: 'Llama 3.3 70B',
      providerId: 'groq',
      isFree: false,
      contextWindow: 131072,
      description: 'Meta Llama — production (Groq production table)',
      input: ['text'],
    ),
    CatalogModel(
      id: 'llama-3.1-8b-instant',
      displayName: 'Llama 3.1 8B (instant)',
      providerId: 'groq',
      isFree: false,
      contextWindow: 131072,
      description: 'Meta Llama — smaller & faster production tier (Groq docs)',
      input: ['text'],
    ),
    CatalogModel(
      id: 'moonshotai/kimi-k2',
      displayName: 'Kimi K2',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 131072,
      description: 'MoonshotAI — OpenRouter id moonshotai/kimi-k2',
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
    CatalogModel(
      id: 'google/gemini-3.1-pro-preview',
      displayName: 'Gemini 3.1 Pro (OR)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Google Gemini 3.1 Pro via OpenRouter',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'google/gemini-3.1-pro-preview-customtools',
      displayName: 'Gemini 3.1 Pro custom tools (OR)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Google Gemini 3.1 Pro (custom tools) via OpenRouter',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'google/gemini-3-flash-preview',
      displayName: 'Gemini 3 Flash (OR)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Google Gemini 3 Flash via OpenRouter',
      input: ['text', 'image'],
    ),
    CatalogModel(
      id: 'google/gemini-3.1-flash-lite-preview',
      displayName: 'Gemini 3.1 Flash-Lite (OR)',
      providerId: 'openrouter',
      isFree: false,
      contextWindow: 1048576,
      description: 'Google Gemini 3.1 Flash-Lite via OpenRouter',
      input: ['text', 'image'],
    ),
  ];

  /// Providers available in the current region (hides restricted ones in China).
  static List<CatalogProvider> get availableProviders => RegionService.isChina
      ? providers
          .where((p) => !RegionService.isProviderRestricted(p.id))
          .toList()
      : providers;

  /// Models available in the current region (hides restricted ones in China).
  static List<CatalogModel> get availableModels => RegionService.isChina
      ? models
          .where((m) => !RegionService.isProviderRestricted(m.providerId))
          .toList()
      : models;

  /// Models for a specific provider, filtered by region.
  static List<CatalogModel> availableModelsForProvider(String providerId) =>
      availableModels.where((m) => m.providerId == providerId).toList();

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
