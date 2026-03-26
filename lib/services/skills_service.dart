/// Skills platform compatible with OpenClaw's AgentSkills format.
///
/// Skills are directories containing SKILL.md with YAML frontmatter.
/// Loaded from workspace/skills/ (per-agent) and bundled assets.
/// ClawHub integration for browsing and installing skills.
library;

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/secure_key_store.dart';
import 'package:logging/logging.dart';

/// Result of a skill compatibility check against mobile (iOS/Android).
enum SkillCompatibility { compatible, adaptable, incompatible }

class SkillCompatibilityResult {
  final SkillCompatibility verdict;
  final String reason;
  final String? adaptedContent;

  const SkillCompatibilityResult({
    required this.verdict,
    required this.reason,
    this.adaptedContent,
  });

  factory SkillCompatibilityResult.unknown() => const SkillCompatibilityResult(
        verdict: SkillCompatibility.compatible,
        reason: 'Could not check compatibility — installing as-is.',
      );
}

/// Callback type for making LLM calls from SkillsService.
typedef SkillLlmCall = Future<String?> Function(
    String systemPrompt, String userPrompt);

final _log = Logger('flutterclaw.skills');

class Skill {
  final String name;
  final String description;
  final String instructions;
  final String location; // 'workspace', 'bundled'
  final String? homepage;
  final String? emoji;
  final bool userInvocable;
  bool enabled;

  Skill({
    required this.name,
    required this.description,
    required this.instructions,
    required this.location,
    this.homepage,
    this.emoji,
    this.userInvocable = true,
    this.enabled = true,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'location': location,
        if (homepage != null) 'homepage': homepage,
        if (emoji != null) 'emoji': emoji,
        'userInvocable': userInvocable,
        'enabled': enabled,
      };
}

class ClawHubSkill {
  final String name;
  final String description;
  final String? author;
  final String? emoji;
  final String? version;
  final int downloads;
  final int stars;
  final bool suspicious;

  ClawHubSkill({
    required this.name,
    required this.description,
    this.author,
    this.emoji,
    this.version,
    this.downloads = 0,
    this.stars = 0,
    this.suspicious = false,
  });
}

class ClawHubAuthResult {
  final bool success;
  final String? token;
  final String? error;

  const ClawHubAuthResult({
    required this.success,
    this.token,
    this.error,
  });
}

class SkillsService {
  final ConfigManager configManager;
  final SkillLlmCall? llmCall;
  final List<Skill> _skills = [];
  final Dio _dio = Dio();
  String? _clawHubToken;

  SkillsService({required this.configManager, this.llmCall});

  List<Skill> get skills => List.unmodifiable(_skills);

  bool get isClawHubAuthenticated => _clawHubToken != null;

  List<Skill> get enabledSkills =>
      _skills.where((s) => s.enabled).toList();

  /// Load all skills from workspace and bundled assets.
  Future<void> loadSkills() async {
    _skills.clear();

    // 1. Bundled skills (from assets)
    await _loadBundledSkills();

    // 2. Workspace skills (per-agent, highest precedence)
    await _loadWorkspaceSkills();

    // 3. Load ClawHub token from secure storage
    await _loadClawHubToken();

    _log.info('Loaded ${_skills.length} skills');
  }

  /// Load ClawHub authentication token from secure storage.
  Future<void> _loadClawHubToken() async {
    try {
      _clawHubToken = await SecureKeyStore.getApiKey('clawhub');
      if (_clawHubToken != null) {
        _log.info('ClawHub token loaded');
      }
    } catch (e) {
      _log.warning('Failed to load ClawHub token: $e');
    }
  }

  /// Authenticate with ClawHub using an API token.
  /// Tokens can be generated at https://clawhub.ai after logging in with GitHub.
  Future<ClawHubAuthResult> authenticateClawHub({
    required String token,
  }) async {
    try {
      if (token.trim().isEmpty) {
        return ClawHubAuthResult(
          success: false,
          error: 'Token cannot be empty',
        );
      }

      final authToken = token.trim();

      // Verify token by checking whoami endpoint
      final verifyResponse = await _dio.get(
        'https://clawhub.ai/api/v1/whoami',
        options: Options(
          headers: {'Authorization': 'Bearer $authToken'},
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (s) => true,
        ),
      );

      if (verifyResponse.statusCode != 200) {
        return ClawHubAuthResult(
          success: false,
          error: 'Invalid API token',
        );
      }

      // Save token to secure storage
      await SecureKeyStore.saveApiKey('clawhub', authToken);
      _clawHubToken = authToken;

      _log.info('ClawHub authentication successful');
      return ClawHubAuthResult(success: true, token: authToken);
    } catch (e) {
      _log.warning('ClawHub authentication failed: $e');
      return ClawHubAuthResult(success: false, error: e.toString());
    }
  }

  /// Logout from ClawHub.
  Future<void> logoutClawHub() async {
    await SecureKeyStore.deleteApiKey('clawhub');
    _clawHubToken = null;
    _log.info('ClawHub logout successful');
  }

  /// Check if current ClawHub token is valid.
  Future<bool> verifyClawHubToken() async {
    if (_clawHubToken == null) return false;

    try {
      final response = await _dio.get(
        'https://clawhub.ai/api/v1/whoami',
        options: Options(
          headers: {'Authorization': 'Bearer $_clawHubToken'},
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (s) => true,
        ),
      );

      return response.statusCode == 200;
    } catch (e) {
      _log.warning('Token verification failed: $e');
      return false;
    }
  }

  Future<void> _loadBundledSkills() async {
    const bundledSkills = [
      'web-search',
      'memory-manager',
      'file-manager',
      'headless-browser',
      'health-analyst',
    ];

    for (final name in bundledSkills) {
      try {
        final content =
            await rootBundle.loadString('assets/skills/$name/SKILL.md');
        final skill = _parseSkillMd(content, name, 'bundled');
        if (skill != null) {
          // Workspace skill with same name takes precedence
          if (!_skills.any((s) => s.name == name)) {
            _skills.add(skill);
          }
        }
      } catch (_) {
        // Bundled skill not found, skip
      }
    }
  }

  Future<void> _loadWorkspaceSkills() async {
    final ws = await configManager.workspacePath;
    final skillsDir = Directory('$ws/skills');
    if (!await skillsDir.exists()) return;

    await for (final entity in skillsDir.list()) {
      if (entity is! Directory) continue;
      final name = entity.path.split('/').last;
      final skillFile = File('${entity.path}/SKILL.md');
      if (!await skillFile.exists()) continue;

      try {
        final content = await skillFile.readAsString();
        final skill = _parseSkillMd(content, name, 'workspace');
        if (skill != null) {
          // Remove existing bundled skill with same name
          _skills.removeWhere((s) => s.name == name);
          _skills.add(skill);
        }
      } catch (e) {
        _log.warning('Failed to load skill $name: $e');
      }
    }
  }

  /// Parse a SKILL.md file with YAML frontmatter.
  Skill? _parseSkillMd(String content, String fallbackName, String location) {
    if (content.trim().isEmpty) return null;

    String name = fallbackName;
    String description = '';
    String instructions = content;
    String? homepage;
    String? emoji;
    bool userInvocable = true;

    // Parse YAML frontmatter (between --- lines)
    if (content.startsWith('---')) {
      final endIdx = content.indexOf('---', 3);
      if (endIdx > 0) {
        final frontmatter = content.substring(3, endIdx).trim();
        instructions = content.substring(endIdx + 3).trim();

        for (final line in frontmatter.split('\n')) {
          final colonIdx = line.indexOf(':');
          if (colonIdx < 0) continue;
          final key = line.substring(0, colonIdx).trim();
          var value = line.substring(colonIdx + 1).trim();

          // Remove surrounding quotes from value if present
          if (value.length >= 2 &&
              ((value.startsWith('"') && value.endsWith('"')) ||
               (value.startsWith("'") && value.endsWith("'")))) {
            value = value.substring(1, value.length - 1);
          }

          switch (key) {
            case 'name':
              name = value;
            case 'description':
              description = value;
            case 'homepage':
              homepage = value;
            case 'emoji':
              emoji = value;
            case 'user-invocable':
              userInvocable = value.toLowerCase() != 'false';
          }
        }
      }
    }

    return Skill(
      name: name,
      description: description,
      instructions: instructions,
      location: location,
      homepage: homepage,
      emoji: emoji,
      userInvocable: userInvocable,
    );
  }

  /// Format eligible skills for system prompt injection.
  String getSkillsPrompt() {
    final eligible = enabledSkills;
    if (eligible.isEmpty) return '';

    final buf = StringBuffer();
    buf.writeln('# Skills\n');
    buf.writeln('The following skills are available. Read and follow their instructions when relevant.\n');

    for (final skill in eligible) {
      buf.writeln('<skill name="${skill.name}" description="${skill.description}">');
      buf.writeln(skill.instructions);
      buf.writeln('</skill>\n');
    }

    return buf.toString();
  }

  /// Check if a skill's content is compatible with mobile (iOS/Android).
  /// Uses the agent's default LLM to analyze the SKILL.md content.
  Future<SkillCompatibilityResult> checkSkillCompatibility(
      String skillContent) async {
    if (llmCall == null) return SkillCompatibilityResult.unknown();

    const systemPrompt = '''You are a compatibility analyzer for AI agent skills (prompt-based plugins).
These skills run inside FlutterClaw, a mobile AI assistant app for iOS and Android built with Flutter/Dart.
Skills are prompt instructions (SKILL.md files) that tell the AI agent how to behave or what tools to use.

The agent has access to mobile-appropriate tools: file system (sandboxed), web search, device info, camera, contacts, calendar, health data, and memory.
It does NOT have access to: shell/terminal/bash, desktop GUI automation, system processes, package managers (apt, brew, npm), Docker, SSH, desktop-only APIs, or native OS commands.

Analyze the skill content and determine:
1. "compatible" — works as-is on mobile (prompt instructions, web-based, or uses tools available on mobile)
2. "adaptable" — references desktop-specific features (shell commands, file paths like /usr/bin, desktop automation) but the core intent CAN be adapted for mobile by rewriting the instructions to use mobile-available tools
3. "incompatible" — fundamentally requires desktop OS capabilities that cannot work on mobile (e.g. managing Docker containers, system administration, IDE plugins, CI/CD pipelines)

Respond with ONLY a JSON object (no markdown, no code fences):
{"verdict": "compatible|adaptable|incompatible", "reason": "brief explanation in the user's language", "adapted_content": "full adapted SKILL.md content if verdict is adaptable, otherwise null"}''';

    try {
      final response = await llmCall!(systemPrompt, skillContent);
      if (response == null || response.trim().isEmpty) {
        return SkillCompatibilityResult.unknown();
      }

      // Strip markdown code fences if the LLM wrapped the JSON
      var cleaned = response.trim();
      if (cleaned.startsWith('```')) {
        cleaned = cleaned.replaceFirst(RegExp(r'^```\w*\n?'), '');
        cleaned = cleaned.replaceFirst(RegExp(r'\n?```$'), '');
        cleaned = cleaned.trim();
      }

      final data = jsonDecode(cleaned) as Map<String, dynamic>;
      final verdictStr = data['verdict'] as String? ?? 'compatible';
      final reason = data['reason'] as String? ?? '';
      final adapted = data['adapted_content'] as String?;

      final verdict = switch (verdictStr) {
        'adaptable' => SkillCompatibility.adaptable,
        'incompatible' => SkillCompatibility.incompatible,
        _ => SkillCompatibility.compatible,
      };

      return SkillCompatibilityResult(
        verdict: verdict,
        reason: reason,
        adaptedContent: adapted,
      );
    } catch (e) {
      _log.warning('Compatibility check failed: $e');
      return SkillCompatibilityResult.unknown();
    }
  }

  /// Download a skill's SKILL.md content from ClawHub without installing.
  Future<String?> downloadSkillContent(String slug) async {
    try {
      final headers = <String, String>{};
      if (_clawHubToken != null) {
        headers['Authorization'] = 'Bearer $_clawHubToken';
      }

      final fileResponse = await _dio.get(
        'https://clawhub.ai/api/v1/skills/$slug/file',
        queryParameters: {'path': 'SKILL.md'},
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 15),
          validateStatus: (s) => true,
        ),
      );

      if (fileResponse.statusCode != 200) return null;
      final content = fileResponse.data as String?;
      return (content != null && content.isNotEmpty) ? content : null;
    } catch (e) {
      _log.warning('Failed to download skill content for $slug: $e');
      return null;
    }
  }

  /// Install a skill from ClawHub.
  Future<bool> installSkill(String slug) async {
    try {
      final headers = <String, String>{};
      if (_clawHubToken != null) {
        headers['Authorization'] = 'Bearer $_clawHubToken';
      }

      // First, get skill metadata to verify it exists
      final skillResponse = await _dio.get(
        'https://clawhub.ai/api/v1/skills/$slug',
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 15),
          validateStatus: (s) => true,
        ),
      );

      if (skillResponse.statusCode == 401 || skillResponse.statusCode == 403) {
        _log.warning('ClawHub authentication required for skill: $slug');
        return false;
      }

      if (skillResponse.statusCode != 200) {
        _log.warning('ClawHub skill not found: $slug (${skillResponse.statusCode})');
        return false;
      }

      // Download SKILL.md file
      final fileResponse = await _dio.get(
        'https://clawhub.ai/api/v1/skills/$slug/file',
        queryParameters: {'path': 'SKILL.md'},
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 15),
          validateStatus: (s) => true,
        ),
      );

      if (fileResponse.statusCode != 200) {
        _log.warning('Failed to download SKILL.md for $slug');
        return false;
      }

      final skillMd = fileResponse.data as String?;
      if (skillMd == null || skillMd.isEmpty) {
        _log.warning('Empty skill content from ClawHub: $slug');
        return false;
      }

      final ws = await configManager.workspacePath;
      final skillDir = Directory('$ws/skills/$slug');
      await skillDir.create(recursive: true);
      await File('${skillDir.path}/SKILL.md').writeAsString(skillMd);

      await loadSkills();
      _log.info('Installed skill from ClawHub: $slug');
      return true;
    } catch (e) {
      _log.warning('Failed to install skill $slug: $e');
      return false;
    }
  }

  /// Install a skill from pre-downloaded content (used for adapted skills).
  Future<bool> installSkillFromContent(String slug, String skillMd) async {
    try {
      final ws = await configManager.workspacePath;
      final skillDir = Directory('$ws/skills/$slug');
      await skillDir.create(recursive: true);
      await File('${skillDir.path}/SKILL.md').writeAsString(skillMd);

      await loadSkills();
      _log.info('Installed adapted skill: $slug');
      return true;
    } catch (e) {
      _log.warning('Failed to install adapted skill $slug: $e');
      return false;
    }
  }

  /// Remove a workspace skill.
  Future<void> removeSkill(String name) async {
    final ws = await configManager.workspacePath;
    final skillDir = Directory('$ws/skills/$name');
    if (await skillDir.exists()) {
      await skillDir.delete(recursive: true);
    }
    _skills.removeWhere((s) => s.name == name && s.location == 'workspace');
    _log.info('Removed skill: $name');
  }

  /// Toggle a skill's enabled state.
  void toggleSkill(String name, bool enabled) {
    final skill = _skills.where((s) => s.name == name).firstOrNull;
    if (skill != null) skill.enabled = enabled;
  }

  /// Get full details for a skill from ClawHub.
  Future<ClawHubSkill?> getSkillDetails(String slug) async {
    try {
      final headers = <String, String>{};
      if (_clawHubToken != null) {
        headers['Authorization'] = 'Bearer $_clawHubToken';
      }

      final response = await _dio.get(
        'https://clawhub.ai/api/v1/skills/$slug',
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (s) => true,
        ),
      );

      if (response.statusCode != 200) {
        _log.warning('Failed to get skill details: $slug (${response.statusCode})');
        return null;
      }

      final data = response.data;
      if (data is! Map<String, dynamic>) return null;

      _log.info('Skill detail fields: ${data.keys.join(", ")}');
      _log.info('Skill detail data: $data');

      int parseNumber(dynamic value) {
        if (value == null) return 0;
        if (value is int) return value;
        if (value is String) return int.tryParse(value) ?? 0;
        return 0;
      }

      final author = data['author'] as String? ??
                    data['owner'] as String? ??
                    data['username'] as String?;

      final downloads = parseNumber(
        data['downloads'] ?? data['download_count'] ?? data['installs']
      );

      final stars = parseNumber(
        data['stars'] ?? data['star_count'] ?? data['likes']
      );

      return ClawHubSkill(
        name: data['slug'] as String? ?? slug,
        description: data['summary'] as String? ?? data['description'] as String? ?? '',
        author: author,
        emoji: data['emoji'] as String?,
        version: data['version'] as String?,
        downloads: downloads,
        stars: stars,
        suspicious: data['suspicious'] as bool? ?? false,
      );
    } catch (e) {
      _log.warning('Failed to get skill details for $slug: $e');
      return null;
    }
  }

  /// Search ClawHub for skills.
  Future<List<ClawHubSkill>> searchClawHub(String query) async {
    try {
      final headers = <String, String>{};
      if (_clawHubToken != null) {
        headers['Authorization'] = 'Bearer $_clawHubToken';
      }

      final response = await _dio.get(
        'https://clawhub.ai/api/v1/search',
        queryParameters: {
          'q': query,
          'order_by': 'downloads', // Order by popularity
        },
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (s) => true,
        ),
      );

      if (response.statusCode != 200) return [];

      final data = response.data;
      if (data is! Map<String, dynamic>) return [];

      final results = data['results'] as List<dynamic>?;
      if (results == null) return [];

      // Log the raw response to understand structure
      _log.info('ClawHub search response keys: ${data.keys.join(", ")}');
      _log.info('First result sample: ${results.isNotEmpty ? results[0] : "empty"}');

      return results.map((e) {
        final map = e as Map<String, dynamic>;

        // Debug log to see what fields we're getting
        _log.info('ClawHub skill: ${map['slug']} - Fields: ${map.keys.join(", ")}');
        _log.info('ClawHub skill data: $map');

        // Try multiple field names that the API might use
        final author = map['author'] as String? ??
                      map['owner'] as String? ??
                      map['username'] as String?;

        // Parse numbers correctly - they might come as strings or ints
        int parseNumber(dynamic value) {
          if (value == null) return 0;
          if (value is int) return value;
          if (value is String) return int.tryParse(value) ?? 0;
          return 0;
        }

        final downloads = parseNumber(
          map['downloads'] ?? map['download_count'] ?? map['installs']
        );

        final stars = parseNumber(
          map['stars'] ?? map['star_count'] ?? map['likes']
        );

        _log.info('Parsed - author: $author, downloads: $downloads, stars: $stars');

        return ClawHubSkill(
          name: map['slug'] as String? ?? '',
          description: map['summary'] as String? ?? map['description'] as String? ?? '',
          author: author,
          emoji: map['emoji'] as String?,
          version: map['version'] as String?,
          downloads: downloads,
          stars: stars,
          suspicious: map['suspicious'] as bool? ?? false,
        );
      }).where((skill) => !skill.suspicious).toList(); // Filter suspicious skills
    } catch (e) {
      _log.warning('ClawHub search failed: $e');
      return [];
    }
  }
}
