/// Chat commands matching OpenClaw's slash command system.
///
/// Intercepts messages starting with "/" before sending to the LLM.
library;

import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/agent/subagent_registry.dart';
import 'package:flutterclaw/core/agent/token_budget_manager.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/sandbox_service.dart';
import 'package:flutterclaw/tools/registry.dart';

final _log = Logger('flutterclaw.chat_commands');

class ChatCommandResult {
  final bool handled;
  final String? response;

  /// When true, the in-app chat should clear (like switching sessions) because
  /// the transcript was reset on disk.
  final bool clearChatUi;

  /// When true, this is a /btw ephemeral response — shown with a distinct
  /// visual style and NOT added to the persistent session transcript.
  final bool isBtw;

  const ChatCommandResult({
    this.handled = false,
    this.response,
    this.clearChatUi = false,
    this.isBtw = false,
  });

  static const notHandled = ChatCommandResult();
}

class ChatCommandHandler {
  final SessionManager sessionManager;
  final ConfigManager configManager;
  final AgentLoop agentLoop;
  final ProviderRouter providerRouter;
  final SandboxService sandboxService;
  final ToolRegistry toolRegistry;

  ChatCommandHandler({
    required this.sessionManager,
    required this.configManager,
    required this.agentLoop,
    required this.providerRouter,
    required this.sandboxService,
    required this.toolRegistry,
  });

  Future<ChatCommandResult> handle(String sessionKey, String message) async {
    if (!message.startsWith('/')) return ChatCommandResult.notHandled;

    final parts = message.trim().split(RegExp(r'\s+'));
    final command = parts[0].toLowerCase();
    final args = parts.skip(1).toList();

    switch (command) {
      case '/status':
        return _handleStatus(sessionKey);
      case '/new':
      case '/reset':
        return _handleReset(sessionKey);
      case '/compact':
        final instructions = message.trim().replaceFirst(RegExp(r'^/compact\s*', caseSensitive: false), '');
        return _handleCompact(sessionKey, customInstructions: instructions.isEmpty ? null : instructions);
      case '/model':
        return _handleModel(sessionKey, args);
      case '/think':
        return _handleThink(sessionKey, args);
      case '/verbose':
        return _handleVerbose(args);
      case '/usage':
        return _handleUsage(args);
      case '/sh':
        return _handleShell(args);
      case '/export':
        return _handleExport(sessionKey);
      case '/agents':
        final agentArgs = message.trim().replaceFirst(RegExp(r'^/agents\s*', caseSensitive: false), '');
        return _handleAgents(sessionKey, agentArgs.isEmpty ? null : agentArgs);
      case '/context':
        return _handleContext(sessionKey);
      case '/btw':
        final question = message.trim().replaceFirst(RegExp(r'^/btw\s*', caseSensitive: false), '');
        return _handleBtw(sessionKey, question);
      case '/unsafe':
        return _handleUnsafe(args);
      case '/bg':
        final task = message.trim().replaceFirst(RegExp(r'^/bg\s*', caseSensitive: false), '');
        return _handleBg(sessionKey, task);
      case '/rewind':
        return _handleRewind(sessionKey, args);
      case '/fork':
        return _handleFork(sessionKey);
      case '/doctor':
        return _handleDoctor(sessionKey);
      case '/help':
        return _handleHelp();
      default:
        return ChatCommandResult.notHandled;
    }
  }

  Future<ChatCommandResult> _handleStatus(String sessionKey) async {
    final sessions = sessionManager.listSessions();
    final meta =
        sessions.where((s) => s.key == sessionKey).firstOrNull;

    if (meta == null) {
      return const ChatCommandResult(
        handled: true,
        response: 'No active session.',
      );
    }

    final modelName =
        meta.modelOverride ?? configManager.config.agents.defaults.modelName;

    final cacheInfo = StringBuffer();
    if (meta.cacheReadTokens > 0 || meta.cacheWriteTokens > 0) {
      cacheInfo.write(
        '\n- **Cache:** ${meta.cacheReadTokens} read / ${meta.cacheWriteTokens} write',
      );
    }

    final costStr = meta.totalCostUsd > 0
        ? '\n- **Cost:** \$${meta.totalCostUsd.toStringAsFixed(4)}'
        : '';
    final thinkingStr = meta.thinkingLevel != null
        ? '\n- **Thinking:** ${meta.thinkingLevel}'
        : '';

    return ChatCommandResult(
      handled: true,
      response: '**Session Status**\n\n'
          '- **Session:** ${meta.key}\n'
          '- **Model:** $modelName\n'
          '- **Messages:** ${meta.messageCount}\n'
          '- **Tokens:** ${meta.totalTokens} total '
          '(${meta.inputTokens} in / ${meta.outputTokens} out)'
          '$cacheInfo$costStr$thinkingStr\n'
          '- **Channel:** ${meta.channelType}\n'
          '- **Last activity:** ${meta.lastActivity.toIso8601String()}',
    );
  }

  Future<ChatCommandResult> _handleReset(String sessionKey) async {
    await sessionManager.reset(sessionKey);
    return const ChatCommandResult(
      handled: true,
      response: 'Session reset. Starting fresh.',
      clearChatUi: true,
    );
  }

  Future<ChatCommandResult> _handleCompact(
    String sessionKey, {
    String? customInstructions,
  }) async {
    final summary = await agentLoop.compactSession(
      sessionKey,
      customInstructions: customInstructions,
    );
    if (summary == null) {
      return const ChatCommandResult(
        handled: true,
        response: 'Nothing to compact (session too short or safeguard active).',
      );
    }
    return ChatCommandResult(
      handled: true,
      response: '**Compacted.** Summary:\n\n$summary',
    );
  }

  Future<ChatCommandResult> _handleModel(
      String sessionKey, List<String> args) async {
    if (args.isEmpty) {
      final current =
          configManager.config.agents.defaults.modelName;
      final models = configManager.config.modelList
          .where((m) => !m.isLiveOnly)
          .map((m) => '- ${m.modelName} (`${m.model}`)')
          .join('\n');
      return ChatCommandResult(
        handled: true,
        response: '**Current model:** $current\n\n**Available:**\n$models',
      );
    }

    final modelName = args.join(' ');
    await sessionManager.setModelOverride(sessionKey, modelName);
    return ChatCommandResult(
      handled: true,
      response: 'Model switched to **$modelName** for this session.',
    );
  }

  Future<ChatCommandResult> _handleThink(
    String sessionKey,
    List<String> args,
  ) async {
    final level = args.isNotEmpty ? args[0].toLowerCase() : null;
    const validLevels = {'off', 'low', 'medium', 'high'};

    if (level == null || !validLevels.contains(level)) {
      final meta = sessionManager.getMeta(sessionKey);
      final current = meta?.thinkingLevel ?? 'off';
      return ChatCommandResult(
        handled: true,
        response: '**Extended Thinking**\n\n'
            '- Current level: **$current**\n\n'
            'Usage: `/think <off|low|medium|high>`\n\n'
            '| Level | Budget | Use case |\n'
            '|-------|--------|----------|\n'
            '| off | — | Default (no thinking) |\n'
            '| low | 1k tokens | Simple reasoning |\n'
            '| medium | 5k tokens | Balanced |\n'
            '| high | 16k tokens | Complex problems |\n\n'
            '_Anthropic: uses extended thinking. OpenAI o-series: sets reasoning_effort._',
      );
    }

    final storedLevel = level == 'off' ? null : level;
    await sessionManager.setThinkingLevel(sessionKey, storedLevel);

    final budgetStr = switch (level) {
      'low' => '~1k tokens',
      'medium' => '~5k tokens',
      'high' => '~16k tokens',
      _ => 'disabled',
    };
    return ChatCommandResult(
      handled: true,
      response: 'Thinking level set to **$level** ($budgetStr). '
          'Takes effect on the next message.',
    );
  }

  ChatCommandResult _handleVerbose(List<String> args) {
    final mode = args.isNotEmpty ? args[0] : 'on';
    return ChatCommandResult(
      handled: true,
      response: 'Verbose mode: **$mode**.',
    );
  }

  ChatCommandResult _handleUsage(List<String> args) {
    final mode = args.isNotEmpty ? args[0] : 'tokens';
    return ChatCommandResult(
      handled: true,
      response: 'Usage display mode: **$mode**.',
    );
  }

  Future<ChatCommandResult> _handleShell(List<String> args) async {
    if (args.isEmpty) {
      return const ChatCommandResult(
        handled: true,
        response: '**Usage:** `/sh <command>`\n\n'
            'Runs a command in the Alpine Linux sandbox.\n'
            'Example: `/sh uname -a`\n'
            'For network operations: `/sh apk add git` (auto-detects 90s timeout)',
      );
    }

    final command = args.join(' ');

    try {

    // Check if sandbox is ready
    final status = await sandboxService.status();
    if (status['error'] == true) {
      return ChatCommandResult(
        handled: true,
        response: '❌ Sandbox error: ${status['message']}',
      );
    }

    // Auto-provision if needed
    if (status['ready'] != true) {
      final setup = await sandboxService.setup();
      if (setup['error'] == true) {
        return ChatCommandResult(
          handled: true,
          response: '❌ Setup failed: ${setup['message']}',
        );
      }
    }

    // Auto-detect commands that need longer timeouts
    final needsLongTimeout = command.contains('apk add') ||
        command.contains('apk upgrade') ||
        command.contains('pip install') ||
        command.contains('npm install') ||
        command.contains('git clone');
    final timeoutMs = needsLongTimeout ? 90000 : 30000;

    // Execute the command
    final result = await sandboxService.exec(
      command: command,
      timeoutMs: timeoutMs,
    );

    if (result['error'] == true) {
      return ChatCommandResult(
        handled: true,
        response: '❌ Execution failed: ${result['message']}',
      );
    }

    final exitCode = result['exit_code'] ?? -1;
    final stdout = (result['stdout'] as String?) ?? '';
    final stderr = (result['stderr'] as String?) ?? '';
    final timedOut = result['timed_out'] == true;

    _log.fine('/sh command=$command exit=$exitCode timed_out=$timedOut '
        'stdout=${stdout.length}b stderr=${stderr.length}b');

    if (timedOut) {
      return const ChatCommandResult(
        handled: true,
        response: '⏱️ Command timed out (>30s).',
      );
    }

    final output = StringBuffer();
    output.writeln('```');
    output.writeln('\$ $command');
    if (stdout.isNotEmpty) output.write(stdout);
    if (stderr.isNotEmpty) {
      if (stdout.isNotEmpty) output.writeln();
      output.write(stderr);
    }
    output.writeln('```');
    output.write('\nExit code: $exitCode');

    return ChatCommandResult(
      handled: true,
      response: output.toString(),
    );
    } catch (e) {
      return ChatCommandResult(
        handled: true,
        response: '❌ Error: $e',
      );
    }
  }

  /// Exports the current session transcript as Markdown and shares it via
  /// the OS share sheet.
  Future<ChatCommandResult> _handleExport(String sessionKey) async {
    try {
      final messages = sessionManager.getContextMessages(sessionKey);
      if (messages.isEmpty) {
        return const ChatCommandResult(
          handled: true,
          response: 'Nothing to export — session is empty.',
        );
      }

      final sessions = sessionManager.listSessions();
      final meta = sessions.where((s) => s.key == sessionKey).firstOrNull;
      final title = meta?.displayName ?? sessionKey;
      final modelName =
          meta?.modelOverride ?? configManager.config.agents.defaults.modelName;

      final buf = StringBuffer();
      buf.writeln('# $title');
      buf.writeln();
      buf.writeln('**Model:** $modelName  ');
      buf.writeln('**Messages:** ${messages.length}  ');
      buf.writeln('**Exported:** ${DateTime.now().toIso8601String()}');
      buf.writeln();
      buf.writeln('---');
      buf.writeln();

      for (final m in messages) {
        final role = switch (m.role) {
          'user' => '**User**',
          'assistant' => '**Assistant**',
          'tool' => '> *Tool result (${m.name ?? 'unknown'})*',
          _ => m.role,
        };
        final content = m.content is String
            ? m.content as String
            : m.content?.toString() ?? '';
        if (content.trim().isEmpty) continue;

        buf.writeln('### $role');
        buf.writeln(content.trim());
        buf.writeln();
      }

      final markdown = buf.toString();
      await Share.share(markdown, subject: title);

      return const ChatCommandResult(
        handled: true,
        response: 'Session exported.',
      );
    } catch (e) {
      return ChatCommandResult(
        handled: true,
        response: 'Export failed: $e',
      );
    }
  }

  /// Lists available agents or switches to a named agent.
  ///
  /// `/agents` → list all agents with their emoji, name, and model.
  /// `/agents switch <name>` → switch active agent (by name or emoji prefix).
  Future<ChatCommandResult> _handleAgents(
    String sessionKey,
    String? subcommand,
  ) async {
    final profiles = configManager.config.agentProfiles;
    final active = configManager.config.activeAgent;

    if (subcommand == null || subcommand.isEmpty) {
      // List all agents
      if (profiles.isEmpty) {
        return const ChatCommandResult(
          handled: true,
          response: 'No agents configured.',
        );
      }
      final lines = profiles.map((a) {
        final activeMarker = a.id == active?.id ? ' ◀ active' : '';
        return '${a.emoji} **${a.name}** — ${a.modelName}$activeMarker';
      }).join('\n');
      return ChatCommandResult(
        handled: true,
        response: '**Agents**\n\n$lines\n\n'
            '_Switch with `/agents switch <name>`_',
      );
    }

    // Switch subcommand
    final parts = subcommand.trim().split(RegExp(r'\s+'));
    if (parts[0].toLowerCase() == 'switch' && parts.length > 1) {
      final query = parts.sublist(1).join(' ').toLowerCase();
      final match = profiles.firstWhere(
        (a) =>
            a.name.toLowerCase().contains(query) ||
            a.emoji.contains(query),
        orElse: () => profiles.first,
      );
      await configManager.switchAgent(match.id);
      return ChatCommandResult(
        handled: true,
        response: 'Switched to ${match.emoji} **${match.name}**.',
      );
    }

    return const ChatCommandResult(
      handled: true,
      response: 'Usage: `/agents` or `/agents switch <name>`',
    );
  }

  /// Shows a breakdown of the current context window usage.
  Future<ChatCommandResult> _handleContext(String sessionKey) async {
    final sessions = sessionManager.listSessions();
    final meta = sessions.where((s) => s.key == sessionKey).firstOrNull;

    if (meta == null) {
      return const ChatCommandResult(
        handled: true,
        response: 'No active session.',
      );
    }

    final modelName =
        meta.modelOverride ?? configManager.config.agents.defaults.modelName;
    final contextWindow =
        TokenBudgetManager.getContextWindow(modelName, configManager);
    final safeLimit =
        TokenBudgetManager.getSafeContextLimit(modelName, configManager);

    final messages = sessionManager.getContextMessages(sessionKey);
    int toolTokens = 0;
    int convTokens = 0;

    for (final m in messages) {
      final t = TokenBudgetManager.estimateTokens(m.content);
      if (m.role == 'tool') {
        toolTokens += t;
      } else {
        convTokens += t;
      }
    }
    final total = convTokens + toolTokens;
    final pct = contextWindow > 0 ? (total * 100 / contextWindow).round() : 0;
    final bar = _contextBar(total, contextWindow);

    return ChatCommandResult(
      handled: true,
      response: '**Context Usage**\n\n'
          '$bar\n\n'
          '- **Conversation:** ~$convTokens tokens\n'
          '- **Tool results:** ~$toolTokens tokens\n'
          '- **Total (est.):** ~$total / $contextWindow tokens ($pct%)\n'
          '- **Auto-compact at:** $safeLimit tokens '
          '(${(safeLimit * 100 / contextWindow).round()}%)\n'
          '- **Model:** $modelName\n\n'
          '_Note: system prompt tokens not counted (estimated separately)._',
    );
  }

  /// Returns a simple ASCII progress bar for context usage.
  String _contextBar(int used, int total) {
    if (total <= 0) return '';
    final pct = (used / total).clamp(0.0, 1.0);
    const width = 20;
    final filled = (pct * width).round();
    final empty = width - filled;
    final bar = '█' * filled + '░' * empty;
    final emoji = pct < 0.60 ? '🟢' : pct < 0.85 ? '🟡' : '🔴';
    return '$emoji `[$bar]` ${(pct * 100).round()}%';
  }

  /// Handles `/btw <question>` — runs the question in an ephemeral side channel
  /// without touching the main session transcript.
  Future<ChatCommandResult> _handleBtw(
    String sessionKey,
    String question,
  ) async {
    if (question.isEmpty) {
      return const ChatCommandResult(
        handled: true,
        response: 'Usage: `/btw <question>`\n\nAsk a quick side question '
            'without adding it to the session context.',
      );
    }

    final defaults = configManager.config.agents.defaults;
    final session = sessionManager.getSession(sessionKey);
    final modelName = session?.modelOverride ?? defaults.modelName;
    final modelEntry = configManager.config.getModel(modelName);

    if (modelEntry == null) {
      return ChatCommandResult(
        handled: true,
        response: 'Error: model "$modelName" not configured.',
      );
    }

    try {
      final systemPrompt = await agentLoop.buildBtwSystemPrompt(sessionKey);
      final cred = configManager.config.providerCredentials[modelEntry.provider];
      final request = LlmRequest(
        model: modelEntry.model,
        apiKey: configManager.config.resolveApiKey(modelEntry),
        apiBase: configManager.config.resolveApiBase(modelEntry),
        messages: [
          LlmMessage(role: 'system', content: systemPrompt),
          LlmMessage(role: 'user', content: question),
        ],
        maxTokens: 1024,
        temperature: defaults.temperature,
        timeoutSeconds: modelEntry.requestTimeout,
        supportsVision: false,
        awsSecretKey: cred?.awsSecretKey,
        awsRegion: cred?.awsRegion,
        awsAuthMode: cred?.awsAuthMode,
      );

      final response = await providerRouter.chatCompletion(request);
      final answer = response.content?.trim() ?? '(no response)';

      _log.fine('/btw answered ${question.length} chars → ${answer.length} chars');
      return ChatCommandResult(
        handled: true,
        response: answer,
        isBtw: true,
      );
    } catch (e) {
      _log.warning('/btw failed: $e');
      return ChatCommandResult(
        handled: true,
        response: 'Error: $e',
      );
    }
  }

  ChatCommandResult _handleUnsafe(List<String> args) {
    final sub = args.isNotEmpty ? args[0].toLowerCase() : null;

    if (sub == 'on') {
      toolRegistry.setPersistentUnsafeMode(true);
      return const ChatCommandResult(
        handled: true,
        response: '🔓 **Unsafe mode enabled.**\n\n'
            'Security blocks are now downgraded to warnings — all tool calls '
            'will execute regardless of dangerous pattern detection.\n\n'
            'Disable with `/unsafe off` when done.',
      );
    }

    if (sub == 'off') {
      toolRegistry.setPersistentUnsafeMode(false);
      return const ChatCommandResult(
        handled: true,
        response: '🔒 **Unsafe mode disabled.** Security checks restored.',
      );
    }

    if (sub == 'status') {
      final on = toolRegistry.persistentUnsafeMode;
      return ChatCommandResult(
        handled: true,
        response: 'Unsafe mode: **${on ? 'ON 🔓' : 'OFF 🔒'}**',
      );
    }

    // No args → one-shot override
    toolRegistry.setSecurityOverride();
    return const ChatCommandResult(
      handled: true,
      response: '⚠️ **One-shot security override active.**\n\n'
          'The next blocked tool call will execute once. '
          'Send your message now.\n\n'
          '_Use `/unsafe on` to disable checks persistently for this session._',
    );
  }

  Future<ChatCommandResult> _handleBg(
    String parentSessionKey,
    String task,
  ) async {
    if (task.isEmpty) {
      return const ChatCommandResult(
        handled: true,
        response: 'Usage: `/bg <task>`\n\nStarts the task in the background and notifies you when done.\n\nExample: `/bg summarise all notes from this week`',
      );
    }

    if (!SubagentLoopProxy.instance.isBound) {
      return const ChatCommandResult(
        handled: true,
        response: 'Background tasks are not available yet — agent loop not initialised.',
      );
    }

    final bgKey = '${parentSessionKey}_bg_${DateTime.now().millisecondsSinceEpoch}';

    // Fire and forget — result delivered via SubagentRegistry completion event.
    SubagentLoopProxy.instance.processMessage(bgKey, task).then((_) {
      _log.info('Background task completed: $bgKey');
    }).catchError((e) {
      _log.warning('Background task failed ($bgKey): $e');
    });

    return ChatCommandResult(
      handled: true,
      response: '**Background task started.**\n\n'
          '> $task\n\n'
          'Session: `$bgKey`\n'
          'You will be notified when it completes.',
    );
  }

  Future<ChatCommandResult> _handleRewind(
    String sessionKey,
    List<String> args,
  ) async {
    final n = args.isNotEmpty ? int.tryParse(args[0]) ?? 1 : 1;
    if (n <= 0) {
      return const ChatCommandResult(
        handled: true,
        response: 'Usage: `/rewind [N]` — removes the last N exchanges (default 1).',
      );
    }
    final removed = await sessionManager.rewind(sessionKey, n);
    if (removed == 0) {
      return const ChatCommandResult(
        handled: true,
        response: 'Nothing to rewind — session is empty or already at the start.',
      );
    }
    return ChatCommandResult(
      handled: true,
      response: 'Rewound $n exchange${n == 1 ? '' : 's'} '
          '($removed message${removed == 1 ? '' : 's'} removed from context).',
      clearChatUi: true,
    );
  }

  Future<ChatCommandResult> _handleFork(String sessionKey) async {
    try {
      final newKey = await sessionManager.fork(sessionKey);
      final messages = sessionManager.getContextMessages(sessionKey).length;
      return ChatCommandResult(
        handled: true,
        response: '**Session forked.**\n\n'
            'New session key: `$newKey`\n'
            'Copied $messages messages from the current context.\n\n'
            '_Switch to the new session from the Sessions screen._',
      );
    } catch (e) {
      return ChatCommandResult(
        handled: true,
        response: 'Fork failed: $e',
      );
    }
  }

  Future<ChatCommandResult> _handleDoctor(String sessionKey) async {
    final buf = StringBuffer('**FlutterClaw Diagnostics**\n\n');

    // Model / API key check
    final meta = sessionManager.getMeta(sessionKey);
    final modelName = meta?.modelOverride ??
        configManager.config.agents.defaults.modelName;
    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry == null) {
      buf.writeln('- **Model:** ❌ "$modelName" not found in config');
    } else {
      final apiKey = configManager.config.resolveApiKey(modelEntry);
      final keyOk = apiKey.isNotEmpty && apiKey != 'missing';
      buf.writeln(
          '- **Model:** ${keyOk ? '✅' : '❌'} $modelName (${modelEntry.provider})');
      if (!keyOk) buf.writeln('  ⚠️ No API key configured for ${modelEntry.provider}');
    }

    // Sandbox check
    try {
      final status = await sandboxService.status();
      final ready = status['ready'] == true;
      final msg = status['message'] as String? ?? '';
      buf.writeln('- **Sandbox:** ${ready ? '✅ Ready' : '⚠️ Not ready'}'
          '${msg.isNotEmpty ? ' — $msg' : ''}');
    } catch (e) {
      buf.writeln('- **Sandbox:** ❌ Error — $e');
    }

    // MCP servers
    final mcpServers = configManager.config.mcpServers;
    if (mcpServers.isEmpty) {
      buf.writeln('- **MCP Servers:** none configured');
    } else {
      final enabled = mcpServers.where((s) => s.enabled).length;
      buf.writeln('- **MCP Servers:** $enabled/${mcpServers.length} enabled');
      for (final s in mcpServers) {
        final icon = s.enabled ? '✅' : '⚪';
        buf.writeln('  $icon ${s.name} (${s.transportType})');
      }
    }

    // Security status
    final unsafeOn = toolRegistry.persistentUnsafeMode;
    buf.writeln('- **Unsafe mode:** ${unsafeOn ? '🔓 ON — security checks disabled' : '🔒 OFF'}');

    // Session summary
    final sessions = sessionManager.listActiveSessions();
    buf.writeln('- **Active sessions:** ${sessions.length}');

    // Agent summary
    final agents = configManager.config.agentProfiles;
    final active = configManager.config.activeAgent;
    buf.writeln('- **Agents:** ${agents.length} configured'
        '${active != null ? ', active: ${active.emoji} ${active.name}' : ''}');

    return ChatCommandResult(
      handled: true,
      response: buf.toString().trimRight(),
    );
  }

  ChatCommandResult _handleHelp() {
    return const ChatCommandResult(
      handled: true,
      response: '**Chat Commands**\n\n'
          '- `/status` — session info (model, tokens, cost)\n'
          '- `/new` or `/reset` — reset the session\n'
          '- `/compact` — compress session context\n'
          '- `/model [name]` — view or switch model\n'
          '- `/think [off|low|medium|high]` — extended thinking level\n'
          '- `/unsafe [on|off|status]` — one-shot or persistent security bypass\n'
          '- `/bg <task>` — run a task in the background\n'
          '- `/rewind [N]` — undo last N exchanges (default 1)\n'
          '- `/fork` — branch current session into a new one\n'
          '- `/doctor` — system diagnostics\n'
          '- `/context` — context window usage breakdown\n'
          '- `/agents [switch <name>]` — list or switch agents\n'
          '- `/export` — export session as Markdown (share sheet)\n'
          '- `/btw <question>` — quick side question (no context pollution)\n'
          '- `/sh <command>` — run command in Alpine sandbox\n'
          '- `/help` — show this help',
    );
  }
}
