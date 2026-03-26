/// Tool registry and base classes for FlutterClaw tools.
///
/// Thread-safe registration, TTL for hidden tools,
/// and OpenAI function calling format support.
library;

import 'package:logging/logging.dart';

import '../core/agent/token_budget_manager.dart';
import '../data/models/config.dart';

final _log = Logger('flutterclaw.tool_registry');

/// Abstract base class for all tools.
abstract class Tool {
  String get name;
  String get description;
  Map<String, dynamic> get parameters; // JSON Schema for parameters
  Future<ToolResult> execute(Map<String, dynamic> args);

  /// Optional streaming execution. Tools that produce incremental output
  /// (e.g. sandbox_exec, web_fetch) can override this to yield progress chunks.
  /// The final [ToolResult] is returned after the stream completes.
  /// Default: null (no streaming; falls back to [execute]).
  Stream<String>? executeStream(Map<String, dynamic> args) => null;

  /// True when this tool supports streaming output.
  bool get supportsStreaming => false;
}

/// Result of a tool execution.
class ToolResult {
  /// Text result for the LLM.
  final String content;

  /// Whether this was an error result.
  final bool isError;

  /// Whether this is an async operation (for future expansion).
  final bool isAsync;

  const ToolResult({
    required this.content,
    this.isError = false,
    this.isAsync = false,
  });

  factory ToolResult.success(String content) =>
      ToolResult(content: content, isError: false);

  factory ToolResult.error(String message) =>
      ToolResult(content: message, isError: true);
}

/// Entry in the registry: tool plus metadata.
class ToolEntry {
  final Tool tool;
  final bool isCore;

  /// TTL for hidden tools. Decremented by tickTTL. When 0, tool is considered expired.
  int ttl;

  ToolEntry({
    required this.tool,
    this.isCore = true,
    this.ttl = 0,
  });
}

/// Thread-safe tool registry with core/hidden tools and TTL management.
///
/// - Core tools: always visible, never expire
/// - Hidden tools: have TTL, decremented by tickTTL; expired tools return null from get()
class ToolRegistry {
  final Map<String, ToolEntry> _tools = {};

  /// Tool names blocked by user policy. Blocked tools are hidden from the LLM
  /// and return an error if somehow invoked.
  final Set<String> _disabled = {};

  /// Config manager for accessing model context limits.
  ConfigManager? _configManager;

  /// Set the config manager (called during initialization).
  void setConfigManager(ConfigManager manager) {
    _configManager = manager;
  }

  /// Replace the set of disabled tools (call when config changes).
  void setDisabledTools(Iterable<String> names) {
    _disabled
      ..clear()
      ..addAll(names);
  }

  /// Registers a core tool (always visible, never expires).
  void register(Tool tool) {
    _sync(() {
      _tools[tool.name] = ToolEntry(tool: tool, isCore: true, ttl: 0);
    });
  }

  /// Removes a core tool by name. No-op if the tool is not registered.
  void unregister(String name) {
    _tools.remove(name);
  }

  /// Removes all tools whose name starts with [prefix].
  /// Used to bulk-remove MCP proxy tools when a server disconnects.
  void unregisterPrefix(String prefix) {
    _tools.removeWhere((key, _) => key.startsWith(prefix));
  }

  /// Registers a hidden tool with optional TTL. If ttl > 0, it will expire after tickTTL calls.
  void registerHidden(Tool tool, {int ttl = 5}) {
    _sync(() {
      _tools[tool.name] = ToolEntry(tool: tool, isCore: false, ttl: ttl);
    });
  }

  /// Promotes hidden tools to visible by setting their TTL. Tools not in the registry are ignored.
  void promoteTools(List<String> names, {int ttl = 5}) {
    _sync(() {
      for (final name in names) {
        final entry = _tools[name];
        if (entry != null && !entry.isCore) {
          entry.ttl = ttl;
        }
      }
    });
  }

  /// Decrements TTL of all hidden tools. Core tools are unaffected.
  void tickTTL() {
    _sync(() {
      for (final entry in _tools.values) {
        if (!entry.isCore && entry.ttl > 0) {
          entry.ttl--;
        }
      }
    });
  }

  /// Returns the tool by name, or null if not found or hidden with expired TTL.
  Tool? get(String name) {
    return _sync(() {
      final entry = _tools[name];
      if (entry == null) return null;
      if (!entry.isCore && entry.ttl <= 0) return null;
      return entry.tool;
    });
  }

  /// Executes a tool by name. Returns error result if tool not found, expired,
  /// or disabled by user policy.
  ///
  /// Automatically truncates oversized tool results to prevent context overflow.
  Future<ToolResult> execute(String name, Map<String, dynamic> args) async {
    if (_disabled.contains(name)) {
      return ToolResult.error(
          'Tool "$name" is disabled by policy. The user has restricted this tool.');
    }
    final tool = get(name);
    if (tool == null) {
      return ToolResult.error('Tool "$name" not found or expired');
    }

    final result = await tool.execute(args);

    // Apply truncation middleware if needed
    return _maybeTruncateResult(name, result);
  }

  /// Executes a tool and yields incremental output chunks via [onChunk] if the
  /// tool supports streaming ([Tool.supportsStreaming] == true). Falls back to
  /// plain [execute] for non-streaming tools.
  ///
  /// [onChunk] is called for each output chunk BEFORE the final result is
  /// returned. The final [ToolResult] is the return value.
  ///
  /// Automatically truncates oversized tool results to prevent context overflow.
  Future<ToolResult> executeWithProgress(
    String name,
    Map<String, dynamic> args, {
    required void Function(String chunk) onChunk,
  }) async {
    if (_disabled.contains(name)) {
      return ToolResult.error(
          'Tool "$name" is disabled by policy.');
    }
    final tool = get(name);
    if (tool == null) {
      return ToolResult.error('Tool "$name" not found or expired');
    }

    ToolResult result;

    if (tool.supportsStreaming) {
      final stream = tool.executeStream(args);
      if (stream != null) {
        var resultContent = '';
        await for (final chunk in stream) {
          // \x00CLEAR\x00 prefix: reset the accumulated result to this chunk.
          // Used by tools that first yield progress indicators and then yield
          // the authoritative final content (e.g. sandbox_exec).
          if (chunk.startsWith('\x00CLEAR\x00')) {
            resultContent = chunk.substring(7); // skip the 7-char sentinel (\x00CLEAR\x00)
            onChunk(chunk); // pass through so UI can handle the clear
          } else {
            resultContent += chunk;
            onChunk(chunk);
          }
        }
        result = ToolResult.success(resultContent);
      } else {
        result = await tool.execute(args);
      }
    } else {
      // Non-streaming fallback
      result = await tool.execute(args);
    }

    // Apply truncation middleware if needed
    return _maybeTruncateResult(name, result);
  }

  /// Apply truncation middleware to tool results if they exceed safe limits.
  ///
  /// Skips truncation for:
  /// - Error results
  /// - Already-truncated results
  /// - Results under the safe token limit
  ToolResult _maybeTruncateResult(String toolName, ToolResult result) {
    // Skip truncation for errors
    if (result.isError) return result;

    // Skip if already truncated
    if (result.content.contains('[... TOOL RESULT TRUNCATED ...]')) {
      return result;
    }

    // Skip if no config manager available
    if (_configManager == null) return result;

    // Get current model and check if result is safe
    final modelName = _configManager!.config.agents.defaults.modelName;

    if (!TokenBudgetManager.isToolResultSafe(
      result.content,
      modelName,
      _configManager!,
    )) {
      // Result exceeds safe limit, truncate it
      final maxTokens = TokenBudgetManager.getMaxToolResultTokens(
        modelName,
        _configManager!,
      );
      final truncated = TokenBudgetManager.truncateToTokenLimit(
        result.content,
        maxTokens,
      );

      _log.warning(
        'Tool "$toolName" result truncated: '
        '${result.content.length} chars → ${truncated.length} chars',
      );

      return ToolResult.success(truncated);
    }

    // Result is safe, return as-is
    return result;
  }

  /// Returns tool definitions for system prompt (human-readable).
  List<Map<String, dynamic>> getDefinitions() {
    return _sync(() {
      final entries = _visibleEntries;
      return entries
          .map((e) => {
                'name': e.tool.name,
                'description': e.tool.description,
                'parameters': e.tool.parameters,
              })
          .toList();
    });
  }

  /// Returns OpenAI function calling format:
  /// [{"type": "function", "function": {"name": "...", "description": "...", "parameters": {...}}}]
  List<Map<String, dynamic>> toProviderDefs() {
    return _sync(() {
      final entries = _visibleEntries;
      return entries
          .map((e) => {
                'type': 'function',
                'function': {
                  'name': e.tool.name,
                  'description': e.tool.description,
                  'parameters': e.tool.parameters,
                },
              })
          .toList();
    });
  }

  List<ToolEntry> get _visibleEntries {
    final list = _tools.values
        .where((e) => (e.isCore || e.ttl > 0) && !_disabled.contains(e.tool.name))
        .toList();
    list.sort((a, b) => a.tool.name.compareTo(b.tool.name));
    return list;
  }

  T _sync<T>(T Function() fn) {
    return fn();
  }
}
