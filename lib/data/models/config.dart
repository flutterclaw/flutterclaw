import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';

/// Stores authentication credentials for a provider (API key + optional base URL).
/// Credentials are stored at the provider level so all models from the same
/// provider can share them without re-authentication.
class ProviderCredential {
  final String apiKey;
  final String? apiBase;

  const ProviderCredential({required this.apiKey, this.apiBase});

  factory ProviderCredential.fromJson(Map<String, dynamic> json) =>
      ProviderCredential(
        apiKey: json['api_key'] as String,
        apiBase: json['api_base'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'api_key': apiKey,
        if (apiBase != null) 'api_base': apiBase,
      };
}

class ModelEntry {
  final String modelName;
  final String model;
  final String? apiKey;
  final String? apiBase;
  final int? requestTimeout;
  final String provider;
  final bool isFree;
  /// Input modalities supported by this model.
  /// Common values: 'text', 'image', 'audio'.
  /// null means unknown — treated as text-only.
  final List<String>? input;

  const ModelEntry({
    required this.modelName,
    required this.model,
    this.apiKey,
    this.apiBase,
    this.requestTimeout,
    this.provider = 'openai',
    this.isFree = false,
    this.input,
  });

  bool get supportsVision => input?.contains('image') ?? false;
  bool get supportsAudio => input?.contains('audio') ?? false;

  String get vendor => model.contains('/') ? model.split('/').first : 'openai';
  String get modelId => model.contains('/') ? model.split('/').skip(1).join('/') : model;

  factory ModelEntry.fromJson(Map<String, dynamic> json) => ModelEntry(
        modelName: json['model_name'] as String,
        model: json['model'] as String,
        apiKey: json['api_key'] as String?,
        apiBase: json['api_base'] as String?,
        requestTimeout: json['request_timeout'] as int?,
        provider: json['provider'] as String? ?? 'openai',
        isFree: json['is_free'] as bool? ?? false,
        input: (json['input'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'model_name': modelName,
        'model': model,
        if (apiKey != null) 'api_key': apiKey,
        if (apiBase != null) 'api_base': apiBase,
        if (requestTimeout != null) 'request_timeout': requestTimeout,
        'provider': provider,
        'is_free': isFree,
        if (input != null) 'input': input,
      };
}

class AgentsDefaults {
  final String workspace;
  final String modelName;
  final int maxTokens;
  final double temperature;
  final int maxToolIterations;
  final bool restrictToWorkspace;

  const AgentsDefaults({
    this.workspace = '~/.flutterclaw/workspace',
    this.modelName = 'gpt-4o',
    this.maxTokens = 8192,
    this.temperature = 0.7,
    this.maxToolIterations = 20,
    this.restrictToWorkspace = true,
  });

  factory AgentsDefaults.fromJson(Map<String, dynamic> json) => AgentsDefaults(
        workspace: json['workspace'] as String? ?? '~/.flutterclaw/workspace',
        modelName: json['model_name'] as String? ?? json['model'] as String? ?? 'gpt-4o',
        maxTokens: json['max_tokens'] as int? ?? 8192,
        temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
        maxToolIterations: json['max_tool_iterations'] as int? ?? 20,
        restrictToWorkspace: json['restrict_to_workspace'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'workspace': workspace,
        'model_name': modelName,
        'max_tokens': maxTokens,
        'temperature': temperature,
        'max_tool_iterations': maxToolIterations,
        'restrict_to_workspace': restrictToWorkspace,
      };
}

class AgentsConfig {
  final AgentsDefaults defaults;

  const AgentsConfig({this.defaults = const AgentsDefaults()});

  factory AgentsConfig.fromJson(Map<String, dynamic> json) => AgentsConfig(
        defaults: json['defaults'] != null
            ? AgentsDefaults.fromJson(json['defaults'] as Map<String, dynamic>)
            : const AgentsDefaults(),
      );

  Map<String, dynamic> toJson() => {'defaults': defaults.toJson()};
}

class TelegramConfig {
  final bool enabled;
  final String? token;
  final List<String> allowFrom;
  final String dmPolicy; // 'pairing' (default), 'open', 'allowlist', 'disabled'

  const TelegramConfig({
    this.enabled = false,
    this.token,
    this.allowFrom = const [],
    this.dmPolicy = 'pairing',
  });

  factory TelegramConfig.fromJson(Map<String, dynamic> json) => TelegramConfig(
        enabled: json['enabled'] as bool? ?? false,
        token: json['token'] as String?,
        allowFrom: (json['allow_from'] as List<dynamic>?)?.cast<String>() ?? [],
        dmPolicy: json['dm_policy'] as String? ?? 'pairing',
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        if (token != null) 'token': token,
        'allow_from': allowFrom,
        'dm_policy': dmPolicy,
      };
}

class DiscordConfig {
  final bool enabled;
  final String? token;
  final List<String> allowFrom;
  final String dmPolicy;

  const DiscordConfig({
    this.enabled = false,
    this.token,
    this.allowFrom = const [],
    this.dmPolicy = 'pairing',
  });

  factory DiscordConfig.fromJson(Map<String, dynamic> json) => DiscordConfig(
        enabled: json['enabled'] as bool? ?? false,
        token: json['token'] as String?,
        allowFrom: (json['allow_from'] as List<dynamic>?)?.cast<String>() ?? [],
        dmPolicy: json['dm_policy'] as String? ?? 'pairing',
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        if (token != null) 'token': token,
        'allow_from': allowFrom,
        'dm_policy': dmPolicy,
      };
}

class WhatsAppConfig {
  final bool enabled;
  final String? authDir;
  final List<String> allowFrom;
  final String dmPolicy;

  const WhatsAppConfig({
    this.enabled = false,
    this.authDir,
    this.allowFrom = const [],
    this.dmPolicy = 'pairing',
  });

  factory WhatsAppConfig.fromJson(Map<String, dynamic> json) => WhatsAppConfig(
        enabled: json['enabled'] as bool? ?? false,
        authDir: json['auth_dir'] as String?,
        allowFrom: (json['allow_from'] as List<dynamic>?)?.cast<String>() ?? [],
        dmPolicy: json['dm_policy'] as String? ?? 'pairing',
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        if (authDir != null) 'auth_dir': authDir,
        'allow_from': allowFrom,
        'dm_policy': dmPolicy,
      };
}

class ChannelsConfig {
  final TelegramConfig telegram;
  final DiscordConfig discord;
  final WhatsAppConfig whatsapp;

  const ChannelsConfig({
    this.telegram = const TelegramConfig(),
    this.discord = const DiscordConfig(),
    this.whatsapp = const WhatsAppConfig(),
  });

  factory ChannelsConfig.fromJson(Map<String, dynamic> json) => ChannelsConfig(
        telegram: json['telegram'] != null
            ? TelegramConfig.fromJson(json['telegram'] as Map<String, dynamic>)
            : const TelegramConfig(),
        discord: json['discord'] != null
            ? DiscordConfig.fromJson(json['discord'] as Map<String, dynamic>)
            : const DiscordConfig(),
        whatsapp: json['whatsapp'] != null
            ? WhatsAppConfig.fromJson(json['whatsapp'] as Map<String, dynamic>)
            : const WhatsAppConfig(),
      );

  Map<String, dynamic> toJson() => {
        'telegram': telegram.toJson(),
        'discord': discord.toJson(),
        'whatsapp': whatsapp.toJson(),
      };
}

class WebSearchProviderConfig {
  final bool enabled;
  final String? apiKey;
  final int maxResults;

  const WebSearchProviderConfig({
    this.enabled = false,
    this.apiKey,
    this.maxResults = 5,
  });

  factory WebSearchProviderConfig.fromJson(Map<String, dynamic> json) =>
      WebSearchProviderConfig(
        enabled: json['enabled'] as bool? ?? false,
        apiKey: json['api_key'] as String?,
        maxResults: json['max_results'] as int? ?? 5,
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        if (apiKey != null) 'api_key': apiKey,
        'max_results': maxResults,
      };
}

class WebToolsConfig {
  final WebSearchProviderConfig brave;
  final WebSearchProviderConfig tavily;
  final WebSearchProviderConfig duckduckgo;
  final WebSearchProviderConfig perplexity;

  const WebToolsConfig({
    this.brave = const WebSearchProviderConfig(),
    this.tavily = const WebSearchProviderConfig(),
    this.duckduckgo = const WebSearchProviderConfig(enabled: true),
    this.perplexity = const WebSearchProviderConfig(),
  });

  factory WebToolsConfig.fromJson(Map<String, dynamic> json) => WebToolsConfig(
        brave: json['brave'] != null
            ? WebSearchProviderConfig.fromJson(json['brave'] as Map<String, dynamic>)
            : const WebSearchProviderConfig(),
        tavily: json['tavily'] != null
            ? WebSearchProviderConfig.fromJson(json['tavily'] as Map<String, dynamic>)
            : const WebSearchProviderConfig(),
        duckduckgo: json['duckduckgo'] != null
            ? WebSearchProviderConfig.fromJson(json['duckduckgo'] as Map<String, dynamic>)
            : const WebSearchProviderConfig(enabled: true),
        perplexity: json['perplexity'] != null
            ? WebSearchProviderConfig.fromJson(json['perplexity'] as Map<String, dynamic>)
            : const WebSearchProviderConfig(),
      );

  Map<String, dynamic> toJson() => {
        'brave': brave.toJson(),
        'tavily': tavily.toJson(),
        'duckduckgo': duckduckgo.toJson(),
        'perplexity': perplexity.toJson(),
      };
}

class ToolsConfig {
  final WebToolsConfig web;

  const ToolsConfig({this.web = const WebToolsConfig()});

  factory ToolsConfig.fromJson(Map<String, dynamic> json) => ToolsConfig(
        web: json['web'] != null
            ? WebToolsConfig.fromJson(json['web'] as Map<String, dynamic>)
            : const WebToolsConfig(),
      );

  Map<String, dynamic> toJson() => {'web': web.toJson()};
}

class HeartbeatConfig {
  final bool enabled;
  final int interval;

  const HeartbeatConfig({this.enabled = true, this.interval = 30});

  factory HeartbeatConfig.fromJson(Map<String, dynamic> json) => HeartbeatConfig(
        enabled: json['enabled'] as bool? ?? true,
        interval: json['interval'] as int? ?? 30,
      );

  Map<String, dynamic> toJson() => {'enabled': enabled, 'interval': interval};
}

class GatewayConfig {
  final String host;
  final int port;
  final bool autoStart;

  const GatewayConfig({
    this.host = '127.0.0.1',
    this.port = 18789,
    this.autoStart = true,
  });

  factory GatewayConfig.fromJson(Map<String, dynamic> json) => GatewayConfig(
        host: json['host'] as String? ?? '127.0.0.1',
        port: json['port'] as int? ?? 18789,
        autoStart: json['auto_start'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'host': host,
        'port': port,
        'auto_start': autoStart,
      };
}

class FlutterClawConfig {
  final AgentsConfig agents;
  final List<ModelEntry> modelList;
  final ChannelsConfig channels;
  final ToolsConfig tools;
  final HeartbeatConfig heartbeat;
  final GatewayConfig gateway;
  final bool onboardingCompleted;

  // Multi-agent support
  final List<AgentProfile> agentProfiles;
  final String? activeAgentId;

  /// Provider-level credentials. Keyed by provider ID (e.g. 'openai', 'anthropic').
  /// All models belonging to a provider share these credentials unless a model
  /// has an explicit per-model apiKey override.
  final Map<String, ProviderCredential> providerCredentials;

  const FlutterClawConfig({
    this.agents = const AgentsConfig(),
    this.modelList = const [],
    this.channels = const ChannelsConfig(),
    this.tools = const ToolsConfig(),
    this.heartbeat = const HeartbeatConfig(),
    this.gateway = const GatewayConfig(),
    this.onboardingCompleted = false,
    this.agentProfiles = const [],
    this.activeAgentId,
    this.providerCredentials = const {},
  });

  ModelEntry? getModel(String name) {
    final matches = modelList.where((m) => m.modelName == name);
    return matches.isEmpty ? null : matches.first;
  }

  List<ModelEntry> getModels(String name) =>
      modelList.where((m) => m.modelName == name).toList();

  /// Resolves the effective API key for a model entry.
  /// Checks (in order): per-model override → provider credential.
  String resolveApiKey(ModelEntry entry) {
    if (entry.apiKey != null && entry.apiKey!.isNotEmpty) return entry.apiKey!;
    return providerCredentials[entry.provider]?.apiKey ?? '';
  }

  /// Resolves the effective API base URL for a model entry.
  /// Checks (in order): per-model override → provider credential → catalog default.
  String resolveApiBase(ModelEntry entry) {
    if (entry.apiBase != null && entry.apiBase!.isNotEmpty) return entry.apiBase!;
    final credBase = providerCredentials[entry.provider]?.apiBase;
    if (credBase != null && credBase.isNotEmpty) return credBase;
    return ModelCatalog.getProvider(entry.provider)?.apiBase ?? 'https://api.openai.com/v1';
  }

  /// Returns true if the given provider has a non-empty API key stored.
  bool isProviderAuthenticated(String providerId) {
    final cred = providerCredentials[providerId];
    return cred != null && cred.apiKey.isNotEmpty;
  }

  /// Returns a new config with the given provider credential saved (or replaced).
  FlutterClawConfig withProviderCredential(String providerId, ProviderCredential credential) {
    return copyWith(
      providerCredentials: {...providerCredentials, providerId: credential},
    );
  }

  /// Get the currently active agent profile
  AgentProfile? get activeAgent {
    if (agentProfiles.isEmpty) return null;
    if (activeAgentId != null) {
      try {
        return agentProfiles.firstWhere((a) => a.id == activeAgentId);
      } catch (_) {
        // Active agent not found, fall through to default
      }
    }
    // Fallback: return default agent or first agent
    try {
      return agentProfiles.firstWhere((a) => a.isDefault);
    } catch (_) {
      return agentProfiles.first;
    }
  }

  factory FlutterClawConfig.fromJson(Map<String, dynamic> json) => FlutterClawConfig(
        agents: json['agents'] != null
            ? AgentsConfig.fromJson(json['agents'] as Map<String, dynamic>)
            : const AgentsConfig(),
        modelList: (json['model_list'] as List<dynamic>?)
                ?.map((e) => ModelEntry.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        channels: json['channels'] != null
            ? ChannelsConfig.fromJson(json['channels'] as Map<String, dynamic>)
            : const ChannelsConfig(),
        tools: json['tools'] != null
            ? ToolsConfig.fromJson(json['tools'] as Map<String, dynamic>)
            : const ToolsConfig(),
        heartbeat: json['heartbeat'] != null
            ? HeartbeatConfig.fromJson(json['heartbeat'] as Map<String, dynamic>)
            : const HeartbeatConfig(),
        gateway: json['gateway'] != null
            ? GatewayConfig.fromJson(json['gateway'] as Map<String, dynamic>)
            : const GatewayConfig(),
        onboardingCompleted: json['onboarding_completed'] as bool? ?? false,
        agentProfiles: (json['agent_profiles'] as List<dynamic>?)
                ?.map((e) => AgentProfile.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        activeAgentId: json['active_agent_id'] as String?,
        providerCredentials: (json['provider_credentials'] as Map<String, dynamic>?)
                ?.map((k, v) => MapEntry(
                      k,
                      ProviderCredential.fromJson(v as Map<String, dynamic>),
                    )) ??
            {},
      );

  Map<String, dynamic> toJson() => {
        'agents': agents.toJson(),
        'model_list': modelList.map((e) => e.toJson()).toList(),
        'channels': channels.toJson(),
        'tools': tools.toJson(),
        'heartbeat': heartbeat.toJson(),
        'gateway': gateway.toJson(),
        'onboarding_completed': onboardingCompleted,
        'agent_profiles': agentProfiles.map((e) => e.toJson()).toList(),
        if (activeAgentId != null) 'active_agent_id': activeAgentId,
        if (providerCredentials.isNotEmpty)
          'provider_credentials':
              providerCredentials.map((k, v) => MapEntry(k, v.toJson())),
      };

  FlutterClawConfig copyWith({
    AgentsConfig? agents,
    List<ModelEntry>? modelList,
    ChannelsConfig? channels,
    ToolsConfig? tools,
    HeartbeatConfig? heartbeat,
    GatewayConfig? gateway,
    bool? onboardingCompleted,
    List<AgentProfile>? agentProfiles,
    String? activeAgentId,
    Map<String, ProviderCredential>? providerCredentials,
  }) =>
      FlutterClawConfig(
        agents: agents ?? this.agents,
        modelList: modelList ?? this.modelList,
        channels: channels ?? this.channels,
        tools: tools ?? this.tools,
        heartbeat: heartbeat ?? this.heartbeat,
        gateway: gateway ?? this.gateway,
        onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
        agentProfiles: agentProfiles ?? this.agentProfiles,
        activeAgentId: activeAgentId ?? this.activeAgentId,
        providerCredentials: providerCredentials ?? this.providerCredentials,
      );
}

class ConfigManager {
  FlutterClawConfig _config;
  String? _configPath;

  ConfigManager([this._config = const FlutterClawConfig()]);

  FlutterClawConfig get config => _config;

  Future<String> get configDir async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/flutterclaw';
  }

  Future<String> get configPath async {
    if (_configPath != null) return _configPath!;
    _configPath = '${await configDir}/config.json';
    return _configPath!;
  }

  Future<String> get workspacePath async {
    final agent = _config.activeAgent;
    if (agent == null) {
      // Fallback for backward compatibility or when no agents exist
      final base = await configDir;
      return '$base/workspace';
    }
    final base = await configDir;
    return '$base/${agent.workspacePath}';
  }

  /// Get workspace path for a specific agent
  Future<String> getAgentWorkspace(String agentId) async {
    final agent = _config.agentProfiles.where((a) => a.id == agentId).firstOrNull;
    if (agent == null) {
      throw Exception('Agent $agentId not found');
    }
    final base = await configDir;
    return '$base/${agent.workspacePath}';
  }

  Future<void> ensureDirectories() async {
    final base = await configDir;
    final ws = await workspacePath;

    for (final dir in [
      base,
      ws,
      '$ws/sessions',
      '$ws/memory',
      '$ws/state',
      '$ws/cron',
      '$ws/skills',
    ]) {
      await Directory(dir).create(recursive: true);
    }

    final defaultFiles = {
      '$ws/AGENTS.md': _defaultAgentsMd,
      '$ws/IDENTITY.md': '# Identity\n\n*(Not yet defined — BOOTSTRAP will guide setup)*\n',
      '$ws/SOUL.md': '# Soul\n\n*(Not yet defined — BOOTSTRAP will guide setup)*\n',
      '$ws/USER.md': '# User\n\n*(Not yet defined — BOOTSTRAP will guide setup)*\n',
      '$ws/TOOLS.md': _defaultToolsMd,
      '$ws/HEARTBEAT.md': '# Periodic Tasks\n\n- Check connectivity status\n',
      '$ws/BOOTSTRAP.md': _defaultBootstrapMd,
      '$ws/memory/MEMORY.md': '# Memory\n\n',
    };

    for (final entry in defaultFiles.entries) {
      final file = File(entry.key);
      if (!await file.exists()) {
        await file.writeAsString(entry.value);
      }
    }
  }

  /// Create workspace for a new agent
  Future<void> createAgentWorkspace(AgentProfile agent) async {
    final base = await configDir;
    final ws = '$base/${agent.workspacePath}';

    // Create directory structure
    for (final dir in [
      ws,
      '$ws/sessions',
      '$ws/memory',
      '$ws/state',
      '$ws/cron',
      '$ws/skills',
    ]) {
      await Directory(dir).create(recursive: true);
    }

    // Generate IDENTITY.md with agent-specific content
    final identityMd = '''# Identity

Name: ${agent.name}
Emoji: ${agent.emoji}
Vibe: ${agent.vibe ?? 'helpful and friendly'}
Type: Personal AI Assistant
Model: ${agent.modelName}
''';

    // Generate SOUL.md with agent-specific personality
    final vibe = agent.vibe ?? 'helpful and friendly';
    final soulMd = '''# Soul

I am ${agent.name}, a $vibe personal AI assistant.
I value: helpfulness, honesty, and being proactive.
My tone is $vibe.
I use ${agent.emoji} as my signature.
''';

    // Bootstrap message for first interaction
    final bootstrapMd = '''# Bootstrap

Welcome! This is your first interaction with ${agent.name}.

Introduce yourself warmly using your emoji ${agent.emoji} and explain briefly what you can help with. Keep it friendly and concise (2-3 sentences). Then mention that I can start chatting right away.

After this introduction, this file will be automatically deleted.
''';

    // Initialize workspace files
    final defaultFiles = {
      '$ws/AGENTS.md': _defaultAgentsMd,
      '$ws/IDENTITY.md': identityMd,
      '$ws/SOUL.md': soulMd,
      '$ws/USER.md': '# User\n\n*(Define your preferences)*\n',
      '$ws/TOOLS.md': _defaultToolsMd,
      '$ws/HEARTBEAT.md': '# Periodic Tasks\n\n- Check connectivity status\n',
      '$ws/memory/MEMORY.md': '# Memory\n\n',
      '$ws/BOOTSTRAP.md': bootstrapMd,
    };

    for (final entry in defaultFiles.entries) {
      final file = File(entry.key);
      if (!await file.exists()) {
        await file.writeAsString(entry.value);
      }
    }
  }

  /// Switch to a different agent
  Future<void> switchAgent(String agentId) async {
    final agent = _config.agentProfiles.where((a) => a.id == agentId).firstOrNull;
    if (agent == null) {
      throw Exception('Agent $agentId not found');
    }

    // Update last used timestamp
    final updatedProfiles = _config.agentProfiles.map((a) {
      if (a.id == agentId) {
        return a.copyWith(lastUsedAt: DateTime.now());
      }
      return a;
    }).toList();

    _config = _config.copyWith(
      agentProfiles: updatedProfiles,
      activeAgentId: agentId,
    );

    await save();
  }

  /// Migrate from single-agent (old format) to multi-agent (new format)
  Future<void> _migrateToMultiAgent() async {
    // Check if migration is needed
    if (_config.agentProfiles.isNotEmpty) {
      debugPrint('[ConfigManager] Migration not needed - already have ${_config.agentProfiles.length} agents');
      return; // Already migrated
    }

    // Create default agent from old defaults
    final defaults = _config.agents.defaults;
    debugPrint('[ConfigManager] Migrating to multi-agent: model=${defaults.modelName}, modelList has ${_config.modelList.length} models');
    final defaultAgent = AgentProfile.create(
      name: 'Assistant',
      emoji: '🤖',
      modelName: defaults.modelName,
      temperature: defaults.temperature,
      maxTokens: defaults.maxTokens,
      maxToolIterations: defaults.maxToolIterations,
      restrictToWorkspace: defaults.restrictToWorkspace,
      isDefault: true,
    );

    // Create workspace for default agent
    await createAgentWorkspace(defaultAgent);

    // Copy old workspace to new agent workspace
    final base = await configDir;
    final oldWorkspace = Directory('$base/workspace');
    final newWorkspace = '$base/${defaultAgent.workspacePath}';

    if (await oldWorkspace.exists()) {
      // Copy all files from old workspace to new one
      await for (final entity in oldWorkspace.list(recursive: true)) {
        if (entity is File) {
          final relativePath = entity.path.replaceFirst(oldWorkspace.path, '');
          final newPath = '$newWorkspace$relativePath';
          final newFile = File(newPath);
          await newFile.parent.create(recursive: true);
          await entity.copy(newPath);
        }
      }
    }

    // Update config
    _config = _config.copyWith(
      agentProfiles: [defaultAgent],
      activeAgentId: defaultAgent.id,
    );

    await save();
  }

  Future<void> load() async {
    final path = await configPath;
    final file = File(path);
    if (await file.exists()) {
      final content = await file.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      _config = FlutterClawConfig.fromJson(json);
      debugPrint('[ConfigManager] Loaded config: ${_config.modelList.length} models, ${_config.agentProfiles.length} agents');
    }
    // Run migrations after loading
    await _migrateToMultiAgent();
    _migrateApiKeysToProviderCredentials();
    // IDENTITY.md is the authoritative source — sync name/emoji into AgentProfile
    await syncAgentIdentitiesFromWorkspace();
    debugPrint('[ConfigManager] After migration: ${_config.agentProfiles.length} agents, activeAgent=${_config.activeAgent?.name}');
  }

  /// Reads each agent's IDENTITY.md and updates AgentProfile.name/emoji to match.
  /// IDENTITY.md is the canonical identity source (the agent itself writes it).
  Future<void> syncAgentIdentitiesFromWorkspace() async {
    if (_config.agentProfiles.isEmpty) return;
    final base = await configDir;
    bool changed = false;
    final updatedProfiles = <AgentProfile>[];

    for (final agent in _config.agentProfiles) {
      final ws = '$base/${agent.workspacePath}';
      final identityFile = File('$ws/IDENTITY.md');

      if (await identityFile.exists()) {
        final identity = await identityFile.readAsString();
        final parsedName = _parseIdentityField(identity, 'Name');
        final rawEmoji = _parseIdentityField(identity, 'Emoji');
        final parsedEmoji =
            rawEmoji?.replaceAll('*', '').replaceAll('_', '').trim();

        AgentProfile updated = agent;
        if (parsedName != null &&
            parsedName.isNotEmpty &&
            parsedName != agent.name) {
          updated = updated.copyWith(name: parsedName);
          changed = true;
        }
        if (parsedEmoji != null &&
            parsedEmoji.isNotEmpty &&
            parsedEmoji != agent.emoji) {
          updated = updated.copyWith(emoji: parsedEmoji);
          changed = true;
        }
        updatedProfiles.add(updated);
      } else {
        updatedProfiles.add(agent);
      }
    }

    if (changed) {
      _config = _config.copyWith(agentProfiles: updatedProfiles);
      await save();
    }
  }

  static String? _parseIdentityField(String identity, String field) {
    final match =
        RegExp('(?:$field|${field.toLowerCase()})[:\\s]+(.+)').firstMatch(identity);
    return match?.group(1)?.trim();
  }

  /// Updates a specific field in IDENTITY.md content, preserving the rest.
  static String updateIdentityField(String content, String field, String value) {
    final pattern =
        RegExp('(?:$field|${field.toLowerCase()})[:\\s]+.+', multiLine: true);
    if (pattern.hasMatch(content)) {
      return content.replaceFirst(pattern, '$field: $value');
    }
    return content;
  }

  /// Migrates per-model apiKeys to provider-level credentials for existing configs.
  /// This is a one-time migration that runs on load when providerCredentials is empty.
  void _migrateApiKeysToProviderCredentials() {
    if (_config.providerCredentials.isNotEmpty) return;
    if (_config.modelList.isEmpty) return;

    final migrated = <String, ProviderCredential>{};
    for (final model in _config.modelList) {
      if (model.apiKey == null || model.apiKey!.isEmpty) continue;
      if (migrated.containsKey(model.provider)) continue;
      migrated[model.provider] = ProviderCredential(
        apiKey: model.apiKey!,
        apiBase: model.apiBase,
      );
    }

    if (migrated.isNotEmpty) {
      _config = _config.copyWith(providerCredentials: migrated);
      debugPrint('[ConfigManager] Migrated ${migrated.length} provider credentials from per-model keys');
    }
  }

  Future<void> save() async {
    final path = await configPath;
    final file = File(path);
    await file.parent.create(recursive: true);
    final encoder = const JsonEncoder.withIndent('  ');
    final json = _config.toJson();
    debugPrint('[ConfigManager] Saving config: modelList=${_config.modelList.length}, agents.defaults.modelName=${_config.agents.defaults.modelName}');
    await file.writeAsString(encoder.convert(json));
  }

  void update(FlutterClawConfig config) {
    _config = config;
  }

  Future<bool> hasBootstrap() async {
    final ws = await workspacePath;
    return File('$ws/BOOTSTRAP.md').exists();
  }

  Future<void> removeBootstrap() async {
    final ws = await workspacePath;
    final f = File('$ws/BOOTSTRAP.md');
    if (await f.exists()) await f.delete();
  }

  static const _defaultAgentsMd = '''# Agent Behavior Guide

You are a personal AI assistant running on a mobile device via FlutterClaw.

## Core behavior
- Be helpful, concise, and proactive.
- Use tools when they help answer the user's question.
- Remember context from the conversation.
- When writing or editing files in the workspace, confirm with the user first.
- Respect the user's preferences defined in USER.md.
- Follow the personality and values defined in SOUL.md.
- Present yourself as defined in IDENTITY.md.

## Workspace
- Your workspace files (AGENTS.md, SOUL.md, IDENTITY.md, USER.md, TOOLS.md) define who you are and how you behave.
- You can read and update these files using your tools to evolve over time.
- Memory is stored in the memory/ directory — use it to remember important facts across sessions.
''';

  static const _defaultToolsMd = '''# Tools

You have access to the following tool categories:

## File tools
- read_file, write_file, edit_file, list_dir, append_file — manage workspace files

## Memory tools
- memory_search, memory_get, memory_write — persistent key-value memory across sessions

## Web tools
- web_search — search the web for current information
- web_fetch — fetch content from a URL

## Session tools
- session_status — check current session info
- sessions_list — list all active sessions

## Device tools
- device_status — get device info (battery, network, platform)
- notify — send a push notification to the user's device (use for reminders, cron results, alerts)

## Message tools
- message — send a message to a channel
''';

  static const _defaultBootstrapMd = r'''# Bootstrap — First Run Setup

**CRITICAL: This file guides your first-run identity setup. You MUST use the write_file tool to save files. After setup, delete this file with write_file.**

You just came online for the first time. The user completed the technical setup and now it's time for *you* to come alive.

## Your mission

Introduce yourself and ask the user to define who you are. Then IMMEDIATELY use your tools to save the configuration.

### Step 1: Greet and ask (all at once, in one message)

Say something like:
> "Hey! I just came online — I'm your new personal AI assistant, but I don't have a name or personality yet. Let's fix that! Tell me:
> 1. What should I call you?
> 2. What's my name?
> 3. What's my vibe? (casual, formal, snarky, warm, playful...)
> 4. Pick an emoji for me"

### Step 2: IMMEDIATELY save files after the user responds

As soon as the user answers, you MUST call the write_file tool for EACH of these files. Do not just acknowledge — actually call the tools:

**Call write_file with path "USER.md":**
```
# User

Name: [their name]
Language: [their language if mentioned]
Preferences: [anything they mentioned]
```

**Call write_file with path "IDENTITY.md":**
```
# Identity

Name: [the name they chose for you]
Emoji: [the emoji they picked]
Vibe: [the vibe they described]
Type: Personal AI Assistant
```

**Call write_file with path "SOUL.md":**
```
# Soul

I am [name], a [vibe] personal AI assistant.
I value: helpfulness, honesty, and being proactive.
My tone is [vibe description based on what they chose].
I use [emoji] as my signature.
```

**Call write_file with path "BOOTSTRAP.md" and content "":**
This deletes the bootstrap file so this setup doesn't run again.

### Step 3: Confirm

After ALL write_file calls complete, tell the user: "All set! I've saved my identity. You can see and edit my files in the Agent tab."

## Rules
- Ask ALL questions in ONE message (don't ask one at a time).
- After the user responds, call write_file for ALL files in the SAME turn.
- If the user gives partial answers, use sensible defaults for the rest.
- Be warm and brief. This is your first impression.
''';
}
