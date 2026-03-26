/// In-memory registry for tracking spawned subagent runs.
///
/// Mirrors OpenClaw's subagent-registry pattern adapted for mobile:
/// no gateway, subagents run as Dart Futures in-process.
library;

import 'dart:async';

import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum SubagentStatus { running, completed, error, killed }

/// Token used to request cancellation of a running subagent.
class CancelToken {
  bool _cancelled = false;
  bool get isCancelled => _cancelled;
  void cancel() => _cancelled = true;
}

/// Metadata for a single spawned subagent run.
class SubagentRun {
  final String runId;
  final String sessionKey;
  final String? label;
  final String parentSessionKey;
  SubagentStatus status;
  String? result;
  String? errorMessage;
  final DateTime startedAt;
  final CancelToken cancelToken;

  SubagentRun({
    String? runId,
    required this.sessionKey,
    this.label,
    required this.parentSessionKey,
    this.status = SubagentStatus.running,
    CancelToken? cancelToken,
  })  : runId = runId ?? _uuid.v4(),
        startedAt = DateTime.now(),
        cancelToken = cancelToken ?? CancelToken();

  bool get isActive => status == SubagentStatus.running;

  Map<String, dynamic> toJson() => {
        'runId': runId,
        'sessionKey': sessionKey,
        if (label != null && label!.isNotEmpty) 'label': label,
        'parentSessionKey': parentSessionKey,
        'status': status.name,
        if (result != null) 'result': result,
        if (errorMessage != null) 'error': errorMessage,
        'startedAt': startedAt.toIso8601String(),
        'elapsedMs': DateTime.now().difference(startedAt).inMilliseconds,
      };
}

/// Emitted by [SubagentRegistry] when a subagent completes (success or error).
class SubagentCompletion {
  final SubagentRun run;

  /// Human-readable message injected into the parent session transcript.
  final String message;

  SubagentCompletion(this.run, this.message);
}

/// In-memory registry of all spawned subagent runs.
///
/// Keyed by runId. The registry never persists to disk — it is rebuilt on
/// app restart (subagents don't survive cold boot on mobile).
class SubagentRegistry {
  final Map<String, SubagentRun> _runs = {};

  /// Maximum nesting depth for subagent spawning.
  ///
  /// A depth of 3 means: root agent (0) → subagent (1) → sub-subagent (2)
  /// → sub-sub-subagent (3). Any further spawn is rejected.
  /// Matches OpenClaw's `subagent-depth.ts` default.
  static const maxSpawnDepth = 3;

  /// Returns the current spawn depth for [parentSessionKey].
  ///
  /// Depth is computed by counting how many 'subagent:' prefixes are nested
  /// in the session key chain. A top-level agent has depth 0.
  int spawnDepthFor(String parentSessionKey) {
    var depth = 0;
    var key = parentSessionKey;
    while (key.startsWith('subagent:')) {
      depth++;
      // Extract the parent key from 'subagent:<parentKey>:<shortId>'
      final withoutPrefix = key.substring('subagent:'.length);
      final lastColon = withoutPrefix.lastIndexOf(':');
      if (lastColon < 0) break;
      key = withoutPrefix.substring(0, lastColon);
    }
    return depth;
  }

  /// Returns true if spawning a new subagent from [parentSessionKey] is
  /// permitted (i.e. current depth < [maxSpawnDepth]).
  bool canSpawn(String parentSessionKey) =>
      spawnDepthFor(parentSessionKey) < maxSpawnDepth;

  final _completionController =
      StreamController<SubagentCompletion>.broadcast();

  /// Stream of completion events. ChatNotifier subscribes to this to inject
  /// subagent results into the parent session without a circular dependency.
  Stream<SubagentCompletion> get completionEvents =>
      _completionController.stream;

  void dispose() => _completionController.close();

  void register(SubagentRun run) => _runs[run.runId] = run;

  SubagentRun? get(String runId) => _runs[runId];

  SubagentRun? getBySessionKey(String sessionKey) =>
      _runs.values.where((r) => r.sessionKey == sessionKey).firstOrNull;

  List<SubagentRun> listForParent(String parentSessionKey) => _runs.values
      .where((r) => r.parentSessionKey == parentSessionKey)
      .toList()
    ..sort((a, b) => a.startedAt.compareTo(b.startedAt));

  void complete(String runId, {String? result, String? error}) {
    final run = _runs[runId];
    if (run == null) return;
    run.status =
        error != null ? SubagentStatus.error : SubagentStatus.completed;
    run.result = result;
    run.errorMessage = error;

    final label = run.label ?? run.runId.substring(0, 8);
    final message = error != null
        ? '[Subagent error: $label]\n\n$error'
        : '[Subagent completed: $label]\n\n${result ?? '(no output)'}';
    _completionController.add(SubagentCompletion(run, message));
  }

  /// Returns true if a run was actively killed.
  bool kill(String runId) {
    final run = _runs[runId];
    if (run == null || run.status != SubagentStatus.running) return false;
    run.cancelToken.cancel();
    run.status = SubagentStatus.killed;
    return true;
  }

  /// Kills all active runs for a parent session. Returns count killed.
  int killAll(String parentSessionKey) {
    var count = 0;
    for (final run in listForParent(parentSessionKey)) {
      if (kill(run.runId)) count++;
    }
    return count;
  }
}

/// Singleton proxy that late-binds the AgentLoop's processMessage.
///
/// Breaks the circular dependency: ToolRegistry is created before AgentLoop,
/// so tools capture this proxy at construction time and call it only after
/// the loop has been bound (which happens in app_providers.dart).
class SubagentLoopProxy {
  static final SubagentLoopProxy instance = SubagentLoopProxy._();
  SubagentLoopProxy._();

  Future<String> Function(String sessionKey, String task)? _fn;

  bool get isBound => _fn != null;

  void bind(Future<String> Function(String sessionKey, String task) fn) {
    _fn = fn;
  }

  Future<String> processMessage(String sessionKey, String task) {
    final fn = _fn;
    if (fn == null) {
      throw StateError(
          'SubagentLoopProxy: agent loop not bound. '
          'Make sure agentLoopProvider is initialized before spawning subagents.');
    }
    return fn(sessionKey, task);
  }
}
