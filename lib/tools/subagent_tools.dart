/// Subagent orchestration tools for FlutterClaw.
///
/// Ports OpenClaw's sessions_spawn / sessions_yield / subagents tools.
///
/// Architecture note (mobile vs OpenClaw):
///   OpenClaw spawns subagents via a TCP gateway (external processes).
///   FlutterClaw spawns subagents as in-process Dart Futures backed by the
///   same AgentLoop singleton. Results are pushed back to the parent session
///   transcript via [onSubagentComplete].
library;

import 'dart:async';
import 'dart:convert';

import 'package:flutterclaw/core/agent/subagent_registry.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

// ---------------------------------------------------------------------------
// sessions_spawn
// ---------------------------------------------------------------------------

/// Spawns an isolated subagent session with a given task.
///
/// Mirrors OpenClaw's sessions_spawn (runtime="subagent", mode="run").
/// The subagent runs in the background as a Dart Future. The parent agent
/// gets an immediate "accepted" response and later receives a completion
/// message injected into its session transcript.
class SessionsSpawnTool extends Tool {
  final SubagentRegistry registry;
  final SubagentLoopProxy loopProxy;
  final SessionManager sessionManager;

  /// Returns the session key of the currently running parent agent.
  final String Function() parentSessionKeyGetter;

  SessionsSpawnTool({
    required this.registry,
    required this.loopProxy,
    required this.sessionManager,
    required this.parentSessionKeyGetter,
  });

  @override
  String get name => 'sessions_spawn';

  @override
  String get description =>
      'Spawn an isolated subagent session to run a task autonomously. '
      'Returns immediately with status="accepted" and a childSessionKey. '
      'The subagent result will arrive as a new message in your session when done. '
      'Use sessions_yield after spawning to signal you are waiting for results. '
      'Use the subagents tool to list, kill, or steer running subagents.\n\n'
      'Parameters:\n'
      '- task (required): The task description or initial message for the subagent\n'
      '- agent_id (optional): Target a specific named agent by ID. When set, the spawned '
      'session uses that agent\'s identity, workspace, and model. Use agents_list to discover IDs.\n'
      '- label (optional): A short human-readable name for this run\n'
      '- model (optional): Override the model for the subagent (e.g. "gpt-4o")\n'
      '- runTimeoutSeconds (optional): Maximum seconds to run (default: no limit)';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'task': {
            'type': 'string',
            'description':
                'The task or initial message to send to the spawned subagent',
          },
          'agent_id': {
            'type': 'string',
            'description':
                'Optional: ID of a named agent to run this task. '
                'The spawned session will use that agent\'s identity, '
                'workspace files, and model. Use agents_list to discover available agent IDs.',
          },
          'label': {
            'type': 'string',
            'description':
                'Short human-readable label for this subagent run (used in completion events)',
          },
          'model': {
            'type': 'string',
            'description':
                'Override the model for the subagent (e.g. "claude-opus-4-6")',
          },
          'runTimeoutSeconds': {
            'type': 'number',
            'minimum': 0,
            'description':
                'Maximum seconds the subagent may run before being killed (0 = no limit)',
          },
        },
        'required': ['task'],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> arguments) async {
    final task = arguments['task'] as String?;
    if (task == null || task.trim().isEmpty) {
      return ToolResult.error('task is required');
    }

    final label = (arguments['label'] as String?)?.trim() ?? '';
    final agentId = (arguments['agent_id'] as String?)?.trim();
    final timeoutSecondsRaw = arguments['runTimeoutSeconds'];
    final timeoutSeconds = timeoutSecondsRaw is num
        ? timeoutSecondsRaw.toInt().clamp(0, 86400)
        : 0;

    final parentKey = parentSessionKeyGetter();

    // Depth guard: prevent infinite subagent recursion
    if (!registry.canSpawn(parentKey)) {
      return ToolResult.error(
        'Cannot spawn subagent: maximum nesting depth '
        '(${SubagentRegistry.maxSpawnDepth}) reached. '
        'This prevents infinite subagent recursion.',
      );
    }

    final shortId = _uuid.v4().substring(0, 8);
    // When targeting a named agent use 'agent:<agentId>:<shortId>' so that
    // AgentLoop can resolve that agent's workspace and identity.
    final childSessionKey = agentId != null && agentId.isNotEmpty
        ? 'agent:$agentId:$shortId'
        : 'subagent:$parentKey:$shortId';
    final runId = _uuid.v4();

    final run = SubagentRun(
      runId: runId,
      sessionKey: childSessionKey,
      label: label.isEmpty ? null : label,
      parentSessionKey: parentKey,
    );
    registry.register(run);

    // Spawn the subagent as a background Future.
    _spawnAsync(
      run: run,
      task: task.trim(),
      timeoutSeconds: timeoutSeconds,
    );

    final displayLabel = label.isNotEmpty
        ? label
        : (agentId != null && agentId.isNotEmpty ? agentId : shortId);
    return ToolResult.success(jsonEncode({
      'status': 'accepted',
      'childSessionKey': childSessionKey,
      'runId': runId,
      'label': displayLabel,
      if (agentId != null && agentId.isNotEmpty) 'targetAgentId': agentId,
      'note':
          'Task dispatched${agentId != null && agentId.isNotEmpty ? ' to agent $agentId' : ''}. '
          'Call sessions_yield to end your turn. '
          'The result will arrive as a new message in your session when done.',
    }));
  }

  void _spawnAsync({
    required SubagentRun run,
    required String task,
    required int timeoutSeconds,
  }) {
    Future(() async {
      try {
        if (run.cancelToken.isCancelled) {
          registry.complete(run.runId,
              error: 'Cancelled before start');
          return;
        }

        Future<String> work = loopProxy.processMessage(run.sessionKey, task);
        if (timeoutSeconds > 0) {
          work = work.timeout(
            Duration(seconds: timeoutSeconds),
            onTimeout: () {
              run.cancelToken.cancel();
              return '[Subagent timed out after ${timeoutSeconds}s]';
            },
          );
        }

        final result = await work;

        if (run.cancelToken.isCancelled) {
          registry.complete(run.runId, error: 'Killed');
          return;
        }

        registry.complete(run.runId, result: result);
      } catch (e) {
        registry.complete(run.runId, error: e.toString());
      }
    });
  }
}

// ---------------------------------------------------------------------------
// sessions_yield
// ---------------------------------------------------------------------------

/// Signals that the current agent turn is complete and the agent is waiting
/// for subagent completion events.
///
/// In OpenClaw this is a hard protocol signal (WebSocket). On mobile it is
/// a lightweight hint: returning it tells the LLM to stop generating and
/// wait for the next incoming message (which will be the subagent result).
class SessionsYieldTool extends Tool {
  @override
  String get name => 'sessions_yield';

  @override
  String get description =>
      'End your current turn and wait for spawned subagent completion events. '
      'Call this after sessions_spawn to signal you are done for now. '
      'The subagent result will arrive as the next user message in your session.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'message': {
            'type': 'string',
            'description': 'Optional status message to record for this yield',
          },
        },
        'required': [],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> arguments) async {
    final message =
        (arguments['message'] as String?)?.trim() ?? 'Turn yielded.';
    return ToolResult.success(jsonEncode({
      'status': 'yielded',
      'message': message,
      'note':
          'Your turn has ended. The next message you receive will contain '
              'subagent completion events. Process them and then send your final answer.',
    }));
  }
}

// ---------------------------------------------------------------------------
// subagents (list / kill / steer)
// ---------------------------------------------------------------------------

/// Lists, kills, or steers spawned subagents for the current session.
///
/// Mirrors OpenClaw's subagents tool with the same three actions.
class SubagentsTool extends Tool {
  final SubagentRegistry registry;
  final SubagentLoopProxy loopProxy;

  /// Returns the session key of the currently active parent agent.
  final String Function() parentSessionKeyGetter;

  SubagentsTool({
    required this.registry,
    required this.loopProxy,
    required this.parentSessionKeyGetter,
  });

  @override
  String get name => 'subagents';

  @override
  String get description =>
      'List, kill, or steer spawned sub-agents for this session. '
      'Use this for sub-agent orchestration.\n\n'
      'Actions:\n'
      '- list: Show all subagents spawned by this session with their status\n'
      '- kill: Terminate a specific subagent by runId/label, or "all" to kill all\n'
      '- steer: Send a follow-up message to a still-running subagent';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'action': {
            'type': 'string',
            'enum': ['list', 'kill', 'steer'],
            'description': 'Action to perform on subagents',
          },
          'target': {
            'type': 'string',
            'description':
                'For kill/steer: the runId, label, or "all" (kill only)',
          },
          'message': {
            'type': 'string',
            'description': 'For steer: the message to send to the subagent',
          },
        },
        'required': [],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> arguments) async {
    final action = (arguments['action'] as String?)?.trim() ?? 'list';
    final parentKey = parentSessionKeyGetter();

    switch (action) {
      case 'list':
        return _handleList(parentKey);
      case 'kill':
        return _handleKill(parentKey, arguments);
      case 'steer':
        return _handleSteer(parentKey, arguments);
      default:
        return ToolResult.error('Unknown action: $action. Use list, kill, or steer.');
    }
  }

  ToolResult _handleList(String parentKey) {
    final runs = registry.listForParent(parentKey);
    if (runs.isEmpty) {
      return ToolResult.success(jsonEncode({
        'status': 'ok',
        'action': 'list',
        'total': 0,
        'runs': [],
        'text': 'No subagents spawned in this session.',
      }));
    }
    final active = runs.where((r) => r.isActive).toList();
    final finished = runs.where((r) => !r.isActive).toList();
    return ToolResult.success(jsonEncode({
      'status': 'ok',
      'action': 'list',
      'total': runs.length,
      'active': active.length,
      'finished': finished.length,
      'runs': runs.map((r) => r.toJson()).toList(),
    }));
  }

  ToolResult _handleKill(String parentKey, Map<String, dynamic> args) {
    final target = (args['target'] as String?)?.trim() ?? '';
    if (target.isEmpty) {
      return ToolResult.error('target is required for kill action');
    }

    if (target == 'all' || target == '*') {
      final count = registry.killAll(parentKey);
      return ToolResult.success(jsonEncode({
        'status': 'ok',
        'action': 'kill',
        'target': 'all',
        'killed': count,
        'text': count > 0
            ? 'Killed $count subagent${count == 1 ? '' : 's'}.'
            : 'No running subagents to kill.',
      }));
    }

    // Find by runId or label
    final run = _resolveTarget(parentKey, target);
    if (run == null) {
      return ToolResult.error(
          'Subagent not found: "$target". Use subagents action=list to see available runIds/labels.');
    }

    final killed = registry.kill(run.runId);
    return ToolResult.success(jsonEncode({
      'status': killed ? 'ok' : 'error',
      'action': 'kill',
      'target': target,
      'runId': run.runId,
      'sessionKey': run.sessionKey,
      'label': run.label,
      'text': killed
          ? 'Killed subagent ${run.label ?? run.runId}.'
          : 'Subagent is not running (status: ${run.status.name}).',
    }));
  }

  Future<ToolResult> _handleSteer(
      String parentKey, Map<String, dynamic> args) async {
    final target = (args['target'] as String?)?.trim() ?? '';
    final message = (args['message'] as String?)?.trim() ?? '';

    if (target.isEmpty) {
      return ToolResult.error('target is required for steer action');
    }
    if (message.isEmpty) {
      return ToolResult.error('message is required for steer action');
    }
    if (message.length > 20000) {
      return ToolResult.error(
          'Message too long (${message.length} chars, max 20000).');
    }

    final run = _resolveTarget(parentKey, target);
    if (run == null) {
      return ToolResult.error(
          'Subagent not found: "$target". Use subagents action=list to see available runIds/labels.');
    }
    if (!run.isActive) {
      return ToolResult.error(
          'Subagent "${run.label ?? run.runId}" is not running (status: ${run.status.name}).');
    }

    try {
      await loopProxy.processMessage(run.sessionKey, message);
      return ToolResult.success(jsonEncode({
        'status': 'ok',
        'action': 'steer',
        'target': target,
        'runId': run.runId,
        'sessionKey': run.sessionKey,
        'label': run.label,
        'text': 'Steering message sent to subagent ${run.label ?? run.runId}.',
      }));
    } catch (e) {
      return ToolResult.error('Steer failed: $e');
    }
  }

  SubagentRun? _resolveTarget(String parentKey, String target) {
    final runs = registry.listForParent(parentKey);
    // Try exact runId match first
    final byId = runs.where((r) => r.runId == target).firstOrNull;
    if (byId != null) return byId;
    // Then by label (case-insensitive)
    final targetLower = target.toLowerCase();
    return runs
        .where((r) => r.label?.toLowerCase() == targetLower)
        .firstOrNull;
  }
}

// ---------------------------------------------------------------------------
// sessions_history
// ---------------------------------------------------------------------------

/// Returns the message history for a given session key.
///
/// Ports OpenClaw's sessions-history-tool to give agents read access to
/// their own or subagent session transcripts.
class SessionsHistoryTool extends Tool {
  final SessionManager sessionManager;
  final String Function() currentSessionKeyGetter;

  SessionsHistoryTool({
    required this.sessionManager,
    required this.currentSessionKeyGetter,
  });

  @override
  String get name => 'sessions_history';

  @override
  String get description =>
      'Read the message history of a session (your own or a subagent session). '
      'Returns the last N messages from the session transcript.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'sessionKey': {
            'type': 'string',
            'description':
                'The session key to read. Defaults to the current session if omitted.',
          },
          'limit': {
            'type': 'integer',
            'minimum': 1,
            'maximum': 100,
            'description': 'Maximum number of messages to return (default 20)',
          },
        },
        'required': [],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> arguments) async {
    final sessionKey =
        (arguments['sessionKey'] as String?)?.trim().isNotEmpty == true
            ? (arguments['sessionKey'] as String).trim()
            : currentSessionKeyGetter();
    final limit = (arguments['limit'] as int?) ?? 20;

    try {
      final messages = sessionManager.getContextMessages(sessionKey);
      if (messages.isEmpty) {
        return ToolResult.success(jsonEncode({
          'sessionKey': sessionKey,
          'count': 0,
          'messages': [],
        }));
      }

      final tail = messages.length > limit
          ? messages.sublist(messages.length - limit)
          : messages;

      final formatted = tail.map((m) {
        final content = m.content is String
            ? m.content as String
            : jsonEncode(m.content);
        return {
          'role': m.role,
          'content': content.length > 2000
              ? '${content.substring(0, 2000)}...[truncated]'
              : content,
          if (m.name != null) 'name': m.name,
        };
      }).toList();

      return ToolResult.success(jsonEncode({
        'sessionKey': sessionKey,
        'count': formatted.length,
        'total': messages.length,
        'messages': formatted,
      }));
    } catch (e) {
      return ToolResult.error('Failed to read session history: $e');
    }
  }
}
