/// Chat commands matching OpenClaw's slash command system.
///
/// Intercepts messages starting with "/" before sending to the LLM.
library;

import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/agent/token_budget_manager.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/sandbox_service.dart';

class ChatCommandResult {
  final bool handled;
  final String? response;

  /// When true, the in-app chat should clear (like switching sessions) because
  /// the transcript was reset on disk.
  final bool clearChatUi;

  const ChatCommandResult({
    this.handled = false,
    this.response,
    this.clearChatUi = false,
  });

  static const notHandled = ChatCommandResult();
}

class ChatCommandHandler {
  final SessionManager sessionManager;
  final ConfigManager configManager;
  final AgentLoop agentLoop;
  final SandboxService sandboxService;

  ChatCommandHandler({
    required this.sessionManager,
    required this.configManager,
    required this.agentLoop,
    required this.sandboxService,
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
        return _handleCompact(sessionKey);
      case '/model':
        return _handleModel(sessionKey, args);
      case '/think':
        return _handleThink(args);
      case '/verbose':
        return _handleVerbose(args);
      case '/usage':
        return _handleUsage(args);
      case '/sh':
        return _handleShell(args);
      case '/context':
        return _handleContext(sessionKey);
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

    return ChatCommandResult(
      handled: true,
      response: '**Session Status**\n\n'
          '- **Session:** ${meta.key}\n'
          '- **Model:** $modelName\n'
          '- **Messages:** ${meta.messageCount}\n'
          '- **Tokens:** ${meta.totalTokens} total '
          '(${meta.inputTokens} in / ${meta.outputTokens} out)\n'
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

  Future<ChatCommandResult> _handleCompact(String sessionKey) async {
    final summary = await agentLoop.compactSession(sessionKey);
    if (summary == null) {
      return const ChatCommandResult(
        handled: true,
        response: 'Nothing to compact (session too short).',
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

  ChatCommandResult _handleThink(List<String> args) {
    final level = args.isNotEmpty ? args[0] : 'medium';
    return ChatCommandResult(
      handled: true,
      response: 'Thinking level set to **$level**. '
          '(Note: thinking levels depend on model support.)',
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

    // Debug logging
    print('🐛 /sh command: $command');
    print('🐛 exit_code: $exitCode, timed_out: $timedOut');
    print('🐛 stdout length: ${stdout.length}, stderr length: ${stderr.length}');
    if (stdout.isNotEmpty) print('🐛 stdout preview: ${stdout.substring(0, stdout.length > 100 ? 100 : stdout.length)}');
    if (stderr.isNotEmpty) print('🐛 stderr preview: ${stderr.substring(0, stderr.length > 100 ? 100 : stderr.length)}');

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

    // Estimate context from session messages
    final messages = sessionManager.getContextMessages(sessionKey);
    int systemTokens = 0; // can't measure without re-building prompt
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
    final total = systemTokens + convTokens + toolTokens;
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

  ChatCommandResult _handleHelp() {
    return const ChatCommandResult(
      handled: true,
      response: '**Chat Commands**\n\n'
          '- `/status` -- session info (model, tokens, cost)\n'
          '- `/new` or `/reset` -- reset the session\n'
          '- `/compact` -- compress session context\n'
          '- `/model [name]` -- view or switch model\n'
          '- `/think <level>` -- off|low|medium|high\n'
          '- `/verbose on|off` -- toggle verbose mode\n'
          '- `/usage off|tokens|full` -- usage footer mode\n'
          '- `/context` -- context window usage breakdown\n'
          '- `/sh <command>` -- run command in Alpine sandbox\n'
          '- `/help` -- show this help',
    );
  }
}
