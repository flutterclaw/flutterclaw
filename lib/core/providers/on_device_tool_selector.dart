/// Adaptive tool selector for on-device models.
///
/// On-device models have a ~4K token context window — far too small to include
/// all 40+ tool schemas. This selector uses keyword matching on the user's
/// message to pick 3–5 relevant tools, keeping schema injection under ~1,500
/// tokens.
///
/// Usage:
///   final tools = OnDeviceToolSelector.select(userMessage, allToolSchemas);
library;

/// Keyword groups mapped to tool name prefixes/patterns.
/// Each entry is a (keywords, toolPatterns) pair.
const _toolGroups = <(List<String>, List<String>)>[
  // File operations
  (
    ['file', 'read', 'write', 'folder', 'directory', 'save', 'open', 'path', 'create file', 'list files'],
    ['fs_', 'file_', 'read_file', 'write_file', 'list_dir'],
  ),
  // Memory / knowledge
  (
    ['remember', 'recall', 'memory', 'note', 'forget', 'know', 'stored', 'saved info'],
    ['memory_', 'note_'],
  ),
  // Web / network
  (
    ['search', 'google', 'web', 'internet', 'fetch', 'url', 'website', 'http', 'browse', 'look up'],
    ['web_', 'http_', 'fetch_', 'search'],
  ),
  // Device / system
  (
    ['battery', 'wifi', 'bluetooth', 'device', 'settings', 'notification', 'alarm', 'contacts', 'calendar'],
    ['device_', 'notification_', 'calendar_', 'contacts_'],
  ),
  // Sandbox / shell
  (
    ['run', 'execute', 'terminal', 'shell', 'bash', 'python', 'script', 'command', 'code'],
    ['sandbox_', 'shell_', 'exec_'],
  ),
  // Agent / session
  (
    ['agent', 'session', 'task', 'spawn', 'subagent', 'switch agent'],
    ['agent_', 'session_', 'subagent'],
  ),
  // UI automation
  (
    ['tap', 'click', 'swipe', 'screenshot', 'ui', 'screen', 'button', 'type text'],
    ['ui_', 'screenshot'],
  ),
];

/// Always-available tools regardless of message content.
/// These have low token cost and high utility.
const _alwaysOnToolPatterns = <String>['memory_search', 'device_status', 'web_search'];

/// Maximum number of tools to include (to fit context budget).
const _maxTools = 5;

class OnDeviceToolSelector {
  /// Selects a subset of [allTools] relevant to [userMessage].
  ///
  /// Returns at most [_maxTools] tool schemas. Always includes
  /// [_alwaysOnToolPatterns] if present, then adds contextually matched tools.
  static List<Map<String, dynamic>> select(
    String userMessage,
    List<Map<String, dynamic>> allTools,
  ) {
    if (allTools.isEmpty) return const [];

    final lowerMessage = userMessage.toLowerCase();
    final selected = <Map<String, dynamic>>{};

    // 1. Contextually matched tools based on keyword groups.
    for (final (keywords, patterns) in _toolGroups) {
      if (!keywords.any((kw) => lowerMessage.contains(kw))) continue;
      for (final tool in allTools) {
        if (selected.length >= _maxTools) break;
        final name = _toolName(tool);
        if (patterns.any((p) => name.startsWith(p) || name.contains(p))) {
          selected.add(tool);
        }
      }
      if (selected.length >= _maxTools) break;
    }

    // 2. Only add always-on tools if we already matched something contextual.
    //    For casual chat (no keyword hits), skip tools entirely so the model
    //    responds naturally without listing tool descriptions.
    if (selected.isEmpty) return const [];

    for (final tool in allTools) {
      if (selected.length >= _maxTools) break;
      final name = _toolName(tool);
      if (_alwaysOnToolPatterns.any((p) => name.startsWith(p) || name == p)) {
        selected.add(tool);
      }
    }

    return selected.take(_maxTools).toList();
  }

  /// Builds the tool-calling instruction injected into the system prompt.
  ///
  /// The on-device model is instructed to emit a specific JSON format when
  /// it needs a tool. The agent loop's [OnDeviceProvider] parses this JSON.
  static String buildToolInstruction(List<Map<String, dynamic>> tools) {
    if (tools.isEmpty) return '';

    final toolList = tools.map((t) {
      final fnRaw = t['function'];
      final fn = fnRaw is Map ? Map<String, dynamic>.from(fnRaw) : null;
      if (fn == null) return null;
      final name = fn['name'] as String? ?? '';
      final desc = fn['description'] as String? ?? '';
      final paramsRaw = fn['parameters'];
      final params = paramsRaw is Map ? Map<String, dynamic>.from(paramsRaw) : null;
      final propsRaw = params?['properties'];
      final props = propsRaw is Map ? Map<String, dynamic>.from(propsRaw) : null;
      final required = (params?['required'] as List?)?.cast<String>() ?? [];
      final paramDesc = props?.entries
          .map((e) {
            final isReq = required.contains(e.key) ? '*' : '';
            final pType = (e.value as Map?)?['type'] ?? 'string';
            return '  $isReq${e.key} ($pType)';
          })
          .join('\n') ?? '';
      return '- $name: $desc${paramDesc.isNotEmpty ? '\n$paramDesc' : ''}';
    }).whereType<String>().join('\n');

    return '''
You have tools you can use silently when needed. NEVER list, mention, or describe these tools to the user. Just use them when appropriate by outputting EXACTLY this JSON on a line by itself:
{"tool_call": {"name": "TOOL_NAME", "arguments": {"param": "value"}}}
Then wait for the result before continuing.

Tools:
$toolList''';
  }

  static String _toolName(Map<String, dynamic> tool) {
    final fnRaw = tool['function'];
    final fn = fnRaw is Map ? fnRaw : null;
    return (fn?['name'] as String? ?? '').toLowerCase();
  }
}
