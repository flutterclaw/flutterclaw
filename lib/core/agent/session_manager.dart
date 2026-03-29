/// Session management for agent conversations.
///
/// Two-layer storage matching OpenClaw:
/// 1. sessions.json -- metadata map (sessionKey to metadata)
/// 2. sessionId.jsonl -- append-only transcript (one JSON object per line)
///
/// Entry types in JSONL: session (header), message (user/assistant/tool), compaction
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutterclaw/core/agent/session_disk_budget.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

final _log = Logger('flutterclaw.session_manager');
const _uuid = Uuid();

/// Sessions with no activity in this window are considered inactive and
/// excluded from list views / tool responses. Matches the spirit of
/// OpenClaw's idle-session policy.
const Duration _kSessionActiveTtl = Duration(hours: 24);

/// Sessions older than this are pruned from sessions.json on load (metadata
/// only — JSONL transcript files are kept for history). Set to 30 days to
/// prevent unbounded growth while preserving recent history.
const Duration _kSessionPurgeTtl = Duration(days: 30);

// ---------------------------------------------------------------------------
// Transcript entry types
// ---------------------------------------------------------------------------

class TranscriptEntry {
  final String type; // session, message, compaction
  final String id;
  final String? parentId;
  final int timestamp; // ms since epoch
  final Map<String, dynamic> data;

  TranscriptEntry({
    required this.type,
    String? id,
    this.parentId,
    int? timestamp,
    required this.data,
  })  : id = id ?? _uuid.v4(),
        timestamp = timestamp ?? DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        if (parentId != null) 'parentId': parentId,
        'timestamp': timestamp,
        ...data,
      };

  factory TranscriptEntry.fromJson(Map<String, dynamic> json) =>
      TranscriptEntry(
        type: json['type'] as String? ?? 'message',
        id: json['id'] as String? ?? _uuid.v4(),
        parentId: json['parentId'] as String?,
        timestamp: json['timestamp'] as int? ??
            DateTime.now().millisecondsSinceEpoch,
        data: Map<String, dynamic>.from(json)
          ..remove('type')
          ..remove('id')
          ..remove('parentId')
          ..remove('timestamp'),
      );

  String toJsonLine() => jsonEncode(toJson());
}

// ---------------------------------------------------------------------------
// Session metadata (stored in sessions.json)
// ---------------------------------------------------------------------------

class SessionMeta {
  final String key;
  final String sessionId;
  final String channelType;
  final String chatId;
  int totalTokens;
  int inputTokens;
  int outputTokens;
  /// Tokens served from Anthropic prompt cache (billed at ~10% normal rate).
  int cacheReadTokens;
  /// Tokens written into Anthropic prompt cache (billed at ~125% normal rate).
  int cacheWriteTokens;
  /// Accumulated cost in USD for all API calls in this session.
  double totalCostUsd;
  DateTime lastActivity;
  String? modelOverride;
  int messageCount;
  /// User-defined display name for this session (e.g. "Trip planning").
  String? displayName;
  /// Short snippet from the last user or assistant message for list preview.
  String? lastPreview;
  /// Extended thinking level for this session: null | 'off' | 'low' | 'medium' | 'high'
  String? thinkingLevel;

  SessionMeta({
    required this.key,
    String? sessionId,
    required this.channelType,
    required this.chatId,
    this.totalTokens = 0,
    this.inputTokens = 0,
    this.outputTokens = 0,
    this.cacheReadTokens = 0,
    this.cacheWriteTokens = 0,
    this.totalCostUsd = 0.0,
    DateTime? lastActivity,
    this.modelOverride,
    this.messageCount = 0,
    this.displayName,
    this.lastPreview,
    this.thinkingLevel,
  })  : sessionId = sessionId ?? _uuid.v4(),
        lastActivity = lastActivity ?? DateTime.now();

  /// Whether this session had activity within [_kSessionActiveTtl].
  bool get isActive =>
      DateTime.now().difference(lastActivity) < _kSessionActiveTtl;

  /// Human-readable label: displayName if set, otherwise channel:chatId.
  String get label => displayName?.isNotEmpty == true ? displayName! : key;

  Map<String, dynamic> toJson() => {
        'key': key,
        'sessionId': sessionId,
        'channelType': channelType,
        'chatId': chatId,
        'totalTokens': totalTokens,
        'inputTokens': inputTokens,
        'outputTokens': outputTokens,
        if (cacheReadTokens > 0) 'cacheReadTokens': cacheReadTokens,
        if (cacheWriteTokens > 0) 'cacheWriteTokens': cacheWriteTokens,
        if (totalCostUsd > 0) 'totalCostUsd': totalCostUsd,
        'lastActivity': lastActivity.toIso8601String(),
        if (modelOverride != null) 'modelOverride': modelOverride,
        'messageCount': messageCount,
        if (displayName != null) 'displayName': displayName,
        if (lastPreview != null) 'lastPreview': lastPreview,
        if (thinkingLevel != null) 'thinkingLevel': thinkingLevel,
      };

  factory SessionMeta.fromJson(Map<String, dynamic> json) => SessionMeta(
        key: json['key'] as String,
        sessionId: json['sessionId'] as String?,
        channelType: json['channelType'] as String? ?? 'webchat',
        chatId: json['chatId'] as String? ?? 'default',
        totalTokens: json['totalTokens'] as int? ?? 0,
        inputTokens: json['inputTokens'] as int? ?? 0,
        outputTokens: json['outputTokens'] as int? ?? 0,
        cacheReadTokens: json['cacheReadTokens'] as int? ?? 0,
        cacheWriteTokens: json['cacheWriteTokens'] as int? ?? 0,
        totalCostUsd: (json['totalCostUsd'] as num?)?.toDouble() ?? 0.0,
        lastActivity: json['lastActivity'] != null
            ? DateTime.parse(json['lastActivity'] as String)
            : DateTime.now(),
        modelOverride: json['modelOverride'] as String?,
        messageCount: json['messageCount'] as int? ?? 0,
        displayName: json['displayName'] as String?,
        lastPreview: json['lastPreview'] as String?,
        thinkingLevel: json['thinkingLevel'] as String?,
      );
}

// ---------------------------------------------------------------------------
// Legacy Session class (kept for backward compatibility with UI)
// ---------------------------------------------------------------------------

class Session {
  final String key;
  final String channelType;
  final String chatId;
  final List<LlmMessage> messages;
  int totalTokens;
  DateTime lastActivity;
  String? modelOverride;

  Session({
    required this.key,
    required this.channelType,
    required this.chatId,
    List<LlmMessage>? messages,
    this.totalTokens = 0,
    DateTime? lastActivity,
    this.modelOverride,
  })  : messages = messages ?? [],
        lastActivity = lastActivity ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'key': key,
        'channelType': channelType,
        'chatId': chatId,
        'messages': messages.map((m) => m.toJson()).toList(),
        'totalTokens': totalTokens,
        'lastActivity': lastActivity.toIso8601String(),
        if (modelOverride != null) 'modelOverride': modelOverride,
      };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        key: json['key'] as String,
        channelType: json['channelType'] as String,
        chatId: json['chatId'] as String,
        messages: (json['messages'] as List<dynamic>?)
                ?.map((e) => LlmMessage.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        totalTokens: json['totalTokens'] as int? ?? 0,
        lastActivity: json['lastActivity'] != null
            ? DateTime.parse(json['lastActivity'] as String)
            : DateTime.now(),
        modelOverride: json['modelOverride'] as String?,
      );
}

// ---------------------------------------------------------------------------
// SessionManager
// ---------------------------------------------------------------------------

class SessionManager {
  final ConfigManager configManager;
  final Map<String, SessionMeta> _meta = {};
  final Map<String, List<LlmMessage>> _contextCache = {};
  String? _sessionsDir;
  String? _lastEntryId;
  final _diskBudget = const SessionDiskBudget();
  int _messagesSinceLastBudgetCheck = 0;
  static const int _kBudgetCheckInterval = 20; // check every 20 messages

  final _messageController =
      StreamController<(String, LlmMessage)>.broadcast();
  final _sessionsChangedController = StreamController<void>.broadcast();

  /// Fires whenever a message is added to any session: `(sessionKey, message)`.
  Stream<(String, LlmMessage)> get messageStream => _messageController.stream;

  /// Fires whenever a session is created or a message is added.
  Stream<void> get sessionsChanged => _sessionsChangedController.stream;

  void dispose() {
    _messageController.close();
    _sessionsChangedController.close();
  }

  SessionManager(this.configManager);

  Future<String> _getSessionsDir() async {
    if (_sessionsDir != null) return _sessionsDir!;
    final configDir = await configManager.configDir;
    _sessionsDir = p.join(configDir, 'workspace', 'sessions');
    return _sessionsDir!;
  }

  String _transcriptPath(String dir, String sessionId) =>
      p.join(dir, '$sessionId.jsonl');

  String _storeFilePath(String dir) => p.join(dir, 'sessions.json');

  // -- Public API -----------------------------------------------------------

  Future<SessionMeta> getOrCreate(
    String key,
    String channelType,
    String chatId,
  ) async {
    if (_meta.containsKey(key)) {
      _meta[key]!.lastActivity = DateTime.now();
      return _meta[key]!;
    }

    final dir = await _getSessionsDir();
    await Directory(dir).create(recursive: true);

    // Check if metadata exists in sessions.json
    await _loadStoreIfNeeded(dir);

    if (_meta.containsKey(key)) {
      _meta[key]!.lastActivity = DateTime.now();
      return _meta[key]!;
    }

    // Create new session
    final meta = SessionMeta(
      key: key,
      channelType: channelType,
      chatId: chatId,
    );
    _meta[key] = meta;

    // Write session header to JSONL
    final header = TranscriptEntry(
      type: 'session',
      id: meta.sessionId,
      data: {
        'channelType': channelType,
        'chatId': chatId,
        'sessionKey': key,
      },
    );
    await _appendToTranscript(dir, meta.sessionId, header);
    await _saveStore(dir);

    _sessionsChangedController.add(null);
    return meta;
  }

  /// Append a message to the session transcript (JSONL).
  Future<void> addMessage(String key, LlmMessage message) async {
    final meta = _meta[key];
    if (meta == null) return;

    final dir = await _getSessionsDir();
    final entryId = _uuid.v4();
    final entry = TranscriptEntry(
      type: 'message',
      id: entryId,
      parentId: _lastEntryId,
      data: {
        'role': message.role,
        'content': message.content,
        if (message.name != null) 'name': message.name,
        if (message.toolCalls != null)
          'toolCalls': message.toolCalls!.map((e) => e.toJson()).toList(),
        if (message.toolCallId != null) 'toolCallId': message.toolCallId,
      },
    );

    await _appendToTranscript(dir, meta.sessionId, entry);
    _lastEntryId = entryId;

    meta.messageCount++;
    meta.lastActivity = DateTime.now();

    // Update preview snippet for session list display (user + assistant only).
    if (message.role == 'user' || message.role == 'assistant') {
      final text = message.content is String
          ? message.content as String
          : _extractPreviewText(message.content);
      if (text.isNotEmpty) {
        final snippet = text.length > 100 ? '${text.substring(0, 100)}…' : text;
        meta.lastPreview = snippet;
      }
    }

    // Update context cache
    _contextCache[key] ??= [];
    _contextCache[key]!.add(message);

    _messageController.add((key, message));
    _sessionsChangedController.add(null);
    await _saveStore(dir);

    // Periodically check disk budget
    _messagesSinceLastBudgetCheck++;
    if (_messagesSinceLastBudgetCheck >= _kBudgetCheckInterval) {
      _messagesSinceLastBudgetCheck = 0;
      unawaited(_runDiskBudgetCheck(dir));
    }
  }

  /// Run disk budget enforcement in the background (fire-and-forget).
  Future<void> _runDiskBudgetCheck(String sessionsDir) async {
    try {
      final knownIds = _meta.values.map((m) => m.sessionId).toSet();
      // Active sessions: those with recent activity (last 24 hours)
      final activeIds = _meta.values
          .where((m) => m.isActive)
          .map((m) => m.sessionId)
          .toSet();
      final pruned = await _diskBudget.enforce(
        sessionsDir: sessionsDir,
        knownSessionIds: knownIds,
        activeSessionIds: activeIds,
      );
      if (pruned > 0) {
        _log.info('Disk budget: pruned $pruned session file(s)');
      }
    } catch (e) {
      _log.warning('Disk budget check failed: $e');
    }
  }

  /// Manually trigger a disk budget check. Can be called on app resume.
  Future<void> checkDiskBudget() async {
    final dir = await _getSessionsDir();
    await _runDiskBudgetCheck(dir);
  }

  /// Update the display name for a session and persist immediately.
  Future<void> renameSession(String key, String name) async {
    final meta = _meta[key];
    if (meta == null) return;
    meta.displayName = name.trim().isEmpty ? null : name.trim();
    final dir = await _getSessionsDir();
    await _saveStore(dir);
    _sessionsChangedController.add(null);
  }

  static String _extractPreviewText(dynamic content) {
    if (content is List) {
      for (final block in content) {
        if (block is Map && block['type'] == 'text') {
          final t = block['text'] as String? ?? '';
          if (t.isNotEmpty) return t;
        }
      }
    }
    return '';
  }

  /// Append a compaction entry to the transcript.
  Future<void> addCompaction(
    String key, {
    required String summary,
    required String firstKeptEntryId,
    required int tokensBefore,
  }) async {
    final meta = _meta[key];
    if (meta == null) return;

    final dir = await _getSessionsDir();
    final entry = TranscriptEntry(
      type: 'compaction',
      data: {
        'summary': summary,
        'firstKeptEntryId': firstKeptEntryId,
        'tokensBefore': tokensBefore,
      },
    );

    await _appendToTranscript(dir, meta.sessionId, entry);

    // Rebuild context cache: compaction summary + messages after firstKeptEntryId
    await _rebuildContextCache(key);
    await _saveStore(dir);
  }

  /// Get context messages for LLM calls (respects compaction).
  List<LlmMessage> getContextMessages(String key) {
    final messages = _contextCache[key];
    if (messages != null) {
      _repairOrphanedToolUses(messages);
    }
    return List.from(messages ?? []);
  }

  /// Get message history (legacy compatibility).
  List<LlmMessage> getHistory(String key, {int? limit}) {
    final msgs = _contextCache[key] ?? [];
    if (limit == null) return List.from(msgs);
    final start = msgs.length > limit ? msgs.length - limit : 0;
    return msgs.sublist(start);
  }

  /// Clear a session (reset).
  Future<void> reset(String key) async {
    final meta = _meta[key];
    if (meta == null) return;

    // Create a new session ID (new JSONL file)
    final newId = _uuid.v4();
    final dir = await _getSessionsDir();

    meta.totalTokens = 0;
    meta.inputTokens = 0;
    meta.outputTokens = 0;
    meta.cacheReadTokens = 0;
    meta.cacheWriteTokens = 0;
    meta.messageCount = 0;
    meta.lastActivity = DateTime.now();

    // Update the session ID in metadata (old JSONL file stays as archive)
    _meta[key] = SessionMeta(
      key: key,
      sessionId: newId,
      channelType: meta.channelType,
      chatId: meta.chatId,
      modelOverride: meta.modelOverride,
    );

    // Write new session header
    final header = TranscriptEntry(
      type: 'session',
      id: newId,
      data: {
        'channelType': meta.channelType,
        'chatId': meta.chatId,
        'sessionKey': key,
      },
    );
    await _appendToTranscript(dir, newId, header);

    _contextCache[key] = [];
    _lastEntryId = null;
    await _saveStore(dir);
    _sessionsChangedController.add(null);
    _log.info('Reset session $key (new transcript: $newId)');
  }

  /// Compact session: will be called from AgentLoop with LLM summary.
  Future<void> compact(String key) async {
    // Placeholder -- actual LLM compaction is triggered from AgentLoop
    _log.info('Compact requested for $key (use AgentLoop.compactSession)');
  }

  /// Returns the metadata for a session key, or null if not found.
  SessionMeta? getMeta(String key) => _meta[key];

  List<SessionMeta> listSessions() => _meta.values.toList();

  /// Returns only sessions active within [_kSessionActiveTtl], sorted by
  /// most-recent activity first.
  List<SessionMeta> listActiveSessions() {
    final active = _meta.values.where((s) => s.isActive).toList();
    active.sort((a, b) => b.lastActivity.compareTo(a.lastActivity));
    return active;
  }

  Session? getSession(String key) {
    final meta = _meta[key];
    if (meta == null) return null;
    return Session(
      key: meta.key,
      channelType: meta.channelType,
      chatId: meta.chatId,
      messages: List.from(_contextCache[key] ?? []),
      totalTokens: meta.totalTokens,
      lastActivity: meta.lastActivity,
      modelOverride: meta.modelOverride,
    );
  }

  Future<void> updateTokens(
    String key,
    UsageInfo usage, {
    double costUsd = 0.0,
  }) async {
    final meta = _meta[key];
    if (meta == null) return;
    meta.totalTokens += usage.totalTokens;
    meta.inputTokens += usage.promptTokens;
    meta.outputTokens += usage.completionTokens;
    meta.cacheReadTokens += usage.cacheReadTokens;
    meta.cacheWriteTokens += usage.cacheWriteTokens;
    meta.totalCostUsd += costUsd;
    meta.lastActivity = DateTime.now();
    final dir = await _getSessionsDir();
    await _saveStore(dir);
  }

  Future<void> setModelOverride(String key, String? modelName) async {
    final meta = _meta[key];
    if (meta == null) return;
    meta.modelOverride = modelName;
    meta.lastActivity = DateTime.now();
    final dir = await _getSessionsDir();
    await _saveStore(dir);
  }

  /// Set the extended thinking level for a session.
  Future<void> setThinkingLevel(String key, String? level) async {
    final meta = _meta[key];
    if (meta == null) return;
    meta.thinkingLevel = level;
    meta.lastActivity = DateTime.now();
    final dir = await _getSessionsDir();
    await _saveStore(dir);
  }

  /// Remove the last [n] user-initiated exchanges (user+assistant pairs) from
  /// the context cache and record the rewind in the transcript.
  ///
  /// Returns the number of messages actually removed (0 if nothing to rewind).
  Future<int> rewind(String key, int n) async {
    final meta = _meta[key];
    if (meta == null || n <= 0) return 0;

    final messages = List<LlmMessage>.from(_contextCache[key] ?? []);
    if (messages.isEmpty) return 0;

    // Walk backwards to find the start of the nth user exchange.
    var exchangesFound = 0;
    var cutoffIndex = messages.length;
    for (var i = messages.length - 1; i >= 0; i--) {
      if (messages[i].role == 'user') {
        exchangesFound++;
        if (exchangesFound == n) {
          cutoffIndex = i;
          break;
        }
      }
    }
    if (cutoffIndex == messages.length) return 0; // nothing to cut

    final removedCount = messages.length - cutoffIndex;
    _contextCache[key] = messages.sublist(0, cutoffIndex);

    final dir = await _getSessionsDir();
    final entry = TranscriptEntry(
      type: 'rewind',
      data: {
        'cutoffMessageCount': cutoffIndex,
        'removedCount': removedCount,
      },
    );
    await _appendToTranscript(dir, meta.sessionId, entry);
    meta.lastActivity = DateTime.now();
    await _saveStore(dir);
    _sessionsChangedController.add(null);
    _log.info('Rewind $key: removed $removedCount messages');
    return removedCount;
  }

  /// Fork the current session: create a new session with the same context
  /// messages up to this point. Returns the new session key.
  Future<String> fork(String key) async {
    final meta = _meta[key];
    if (meta == null) throw StateError('Session $key not found');

    final messages = List<LlmMessage>.from(_contextCache[key] ?? []);
    final newKey = '${key}_fork_${DateTime.now().millisecondsSinceEpoch}';

    final newMeta = SessionMeta(
      key: newKey,
      channelType: meta.channelType,
      chatId: meta.chatId,
      modelOverride: meta.modelOverride,
      thinkingLevel: meta.thinkingLevel,
    );
    _meta[newKey] = newMeta;

    final dir = await _getSessionsDir();
    await Directory(dir).create(recursive: true);

    // Write session header
    final header = TranscriptEntry(
      type: 'session',
      id: newMeta.sessionId,
      data: {
        'channelType': meta.channelType,
        'chatId': meta.chatId,
        'sessionKey': newKey,
        'forkedFrom': key,
      },
    );
    await _appendToTranscript(dir, newMeta.sessionId, header);

    // Write all messages from the source session
    String? prevId = newMeta.sessionId;
    for (final msg in messages) {
      final entryId = _uuid.v4();
      final entry = TranscriptEntry(
        type: 'message',
        id: entryId,
        parentId: prevId,
        data: {
          'role': msg.role,
          'content': msg.content,
          if (msg.name != null) 'name': msg.name,
          if (msg.toolCalls != null)
            'toolCalls': msg.toolCalls!.map((e) => e.toJson()).toList(),
          if (msg.toolCallId != null) 'toolCallId': msg.toolCallId,
        },
      );
      await _appendToTranscript(dir, newMeta.sessionId, entry);
      prevId = entryId;
    }

    _contextCache[newKey] = List.from(messages);
    newMeta.messageCount = messages.length;

    await _saveStore(dir);
    _sessionsChangedController.add(null);
    _log.info('Forked $key -> $newKey (${messages.length} messages)');
    return newKey;
  }

  /// Load all session metadata from sessions.json.
  Future<void> load() async {
    final dir = await _getSessionsDir();
    await Directory(dir).create(recursive: true);
    await _loadStoreIfNeeded(dir);

    // Load context caches for all known sessions
    for (final meta in _meta.values) {
      await _rebuildContextCache(meta.key);
    }
  }

  /// Persist all metadata.
  Future<void> persist() async {
    final dir = await _getSessionsDir();
    await _saveStore(dir);
  }

  /// Get all transcript entry IDs for a session (for compaction reference).
  Future<List<TranscriptEntry>> loadTranscript(String key) async {
    final meta = _meta[key];
    if (meta == null) return [];
    final dir = await _getSessionsDir();
    return _readTranscript(dir, meta.sessionId);
  }

  /// Get the last compaction entry for a session, if any.
  ///
  /// Returns null if no compaction has been performed yet.
  /// Used by auto-compaction logic to avoid compacting too frequently.
  Future<TranscriptEntry?> getLastCompactionEntry(String key) async {
    final meta = _meta[key];
    if (meta == null) return null;

    final dir = await _getSessionsDir();
    final entries = await _readTranscript(dir, meta.sessionId);

    // Search backwards for the most recent compaction entry
    for (var i = entries.length - 1; i >= 0; i--) {
      if (entries[i].type == 'compaction') {
        return entries[i];
      }
    }

    return null; // No compaction found
  }

  // -- Private helpers ------------------------------------------------------

  bool _storeLoaded = false;

  Future<void> _loadStoreIfNeeded(String dir) async {
    if (_storeLoaded) return;
    _storeLoaded = true;

    final storePath = _storeFilePath(dir);
    final file = File(storePath);
    if (!await file.exists()) {
      // Try migrating from old format (single JSON files)
      await _migrateFromLegacy(dir);
      return;
    }

    try {
      final content = await file.readAsString();
      final map = jsonDecode(content) as Map<String, dynamic>;
      final cutoff = DateTime.now().subtract(_kSessionPurgeTtl);
      var purged = 0;
      for (final entry in map.entries) {
        final meta = SessionMeta.fromJson(entry.value as Map<String, dynamic>);
        if (meta.lastActivity.isBefore(cutoff)) {
          purged++;
          continue; // drop from in-memory map; JSONL file stays on disk
        }
        _meta[entry.key] = meta;
      }
      if (purged > 0) {
        _log.info('Purged $purged expired session(s) from metadata on load');
        await _saveStore(dir); // rewrite sessions.json without the purged entries
      }
    } catch (e) {
      _log.warning('Failed to load sessions.json: $e');
    }
  }

  Future<void> _migrateFromLegacy(String dir) async {
    final d = Directory(dir);
    if (!await d.exists()) return;

    await for (final entity in d.list()) {
      if (entity is! File) continue;
      final name = p.basename(entity.path);
      if (!name.endsWith('.json') || name == 'sessions.json') continue;

      try {
        final content = await entity.readAsString();
        final json = jsonDecode(content) as Map<String, dynamic>;
        final oldSession = Session.fromJson(json);

        final meta = SessionMeta(
          key: oldSession.key,
          channelType: oldSession.channelType,
          chatId: oldSession.chatId,
          totalTokens: oldSession.totalTokens,
          lastActivity: oldSession.lastActivity,
          modelOverride: oldSession.modelOverride,
          messageCount: oldSession.messages.length,
        );
        _meta[meta.key] = meta;

        // Write header to JSONL
        final header = TranscriptEntry(
          type: 'session',
          id: meta.sessionId,
          data: {
            'channelType': meta.channelType,
            'chatId': meta.chatId,
            'sessionKey': meta.key,
          },
        );
        await _appendToTranscript(dir, meta.sessionId, header);

        // Write existing messages
        String? prevId;
        for (final msg in oldSession.messages) {
          final entryId = _uuid.v4();
          final entry = TranscriptEntry(
            type: 'message',
            id: entryId,
            parentId: prevId ?? meta.sessionId,
            data: {
              'role': msg.role,
              'content': msg.content,
              if (msg.name != null) 'name': msg.name,
              if (msg.toolCalls != null)
                'toolCalls':
                    msg.toolCalls!.map((e) => e.toJson()).toList(),
              if (msg.toolCallId != null) 'toolCallId': msg.toolCallId,
            },
          );
          await _appendToTranscript(dir, meta.sessionId, entry);
          prevId = entryId;
        }

        _contextCache[meta.key] = List.from(oldSession.messages);

        // Remove legacy file
        await entity.delete();
        _log.info('Migrated legacy session: ${meta.key}');
      } catch (e) {
        _log.warning('Failed to migrate ${entity.path}: $e');
      }
    }

    await _saveStore(dir);
  }

  Future<void> _appendToTranscript(
    String dir,
    String sessionId,
    TranscriptEntry entry,
  ) async {
    final path = _transcriptPath(dir, sessionId);
    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsString('${entry.toJsonLine()}\n', mode: FileMode.append);
  }

  Future<List<TranscriptEntry>> _readTranscript(
    String dir,
    String sessionId,
  ) async {
    final path = _transcriptPath(dir, sessionId);
    final file = File(path);
    if (!await file.exists()) return [];

    final entries = <TranscriptEntry>[];
    try {
      final lines = await file.readAsLines();
      for (final line in lines) {
        if (line.trim().isEmpty) continue;
        try {
          final json = jsonDecode(line) as Map<String, dynamic>;
          entries.add(TranscriptEntry.fromJson(json));
        } catch (e) {
          _log.warning('Skipping malformed JSONL line: $e');
        }
      }
    } catch (e) {
      _log.warning('Failed to read transcript $sessionId: $e');
    }
    return entries;
  }

  Future<void> _rebuildContextCache(String key) async {
    final meta = _meta[key];
    if (meta == null) return;

    final dir = await _getSessionsDir();
    final entries = await _readTranscript(dir, meta.sessionId);

    final messages = <LlmMessage>[];
    String? lastCompactionSummary;
    String? firstKeptEntryId;
    int? rewindCutoff; // max number of messages to keep (from most recent rewind)

    // Scan backwards for the most recent compaction and rewind entries.
    for (final e in entries.reversed) {
      if (e.type == 'compaction' && lastCompactionSummary == null) {
        lastCompactionSummary = e.data['summary'] as String?;
        firstKeptEntryId = e.data['firstKeptEntryId'] as String?;
      } else if (e.type == 'rewind' && rewindCutoff == null) {
        rewindCutoff = e.data['cutoffMessageCount'] as int?;
      }
      if (lastCompactionSummary != null && rewindCutoff != null) break;
    }

    bool afterCompaction = lastCompactionSummary == null;

    // If there was a compaction, prepend the summary as a system message
    if (lastCompactionSummary != null) {
      messages.add(LlmMessage(
        role: 'system',
        content:
            '[Previous conversation summary]\n$lastCompactionSummary',
      ));
    }

    for (final e in entries) {
      if (e.type != 'message') continue;

      if (!afterCompaction) {
        if (e.id == firstKeptEntryId) {
          afterCompaction = true;
        } else {
          continue;
        }
      }

      final role = e.data['role'] as String? ?? 'user';
      final content = e.data['content'];
      final name = e.data['name'] as String?;
      final toolCallId = e.data['toolCallId'] as String?;
      List<ToolCall>? toolCalls;
      if (e.data['toolCalls'] != null) {
        toolCalls = (e.data['toolCalls'] as List<dynamic>)
            .map((tc) => ToolCall.fromJson(tc as Map<String, dynamic>))
            .toList();
      }

      messages.add(LlmMessage(
        role: role,
        content: content,
        name: name,
        toolCalls: toolCalls,
        toolCallId: toolCallId,
      ));
    }

    // Apply rewind cutoff: keep only messages up to rewindCutoff count.
    // The cutoff is relative to messages AFTER the compaction summary.
    if (rewindCutoff != null) {
      final summaryOffset = lastCompactionSummary != null ? 1 : 0;
      final maxKeep = summaryOffset + rewindCutoff;
      if (messages.length > maxKeep) {
        _contextCache[key] = messages.sublist(0, maxKeep);
        return;
      }
    }

    // Sanitize: ensure every assistant tool_use has a matching tool_result.
    // A previous crash may have persisted the assistant message with tool_calls
    // but never written the tool result. The Anthropic API rejects such
    // transcripts with a 400 error.
    _repairOrphanedToolUses(messages);

    _contextCache[key] = messages;
  }

  /// Scan [messages] for assistant tool_use blocks that lack a corresponding
  /// tool_result and either append a synthetic error result or remove the
  /// orphaned assistant message.
  void _repairOrphanedToolUses(List<LlmMessage> messages) {
    for (var i = 0; i < messages.length; i++) {
      final msg = messages[i];
      if (msg.role != 'assistant' || msg.toolCalls == null) continue;

      // Collect all tool call IDs from this assistant message.
      final expectedIds = msg.toolCalls!.map((tc) => tc.id).toSet();

      // Look at subsequent messages to find matching tool results.
      for (var j = i + 1; j < messages.length; j++) {
        if (messages[j].role == 'tool' && messages[j].toolCallId != null) {
          expectedIds.remove(messages[j].toolCallId);
        }
        // Stop scanning once we hit the next non-tool message (user or assistant).
        if (messages[j].role == 'user' || messages[j].role == 'assistant') break;
      }

      // If any tool call IDs are unmatched, insert synthetic error results.
      if (expectedIds.isNotEmpty) {
        _log.warning(
          'Repairing ${expectedIds.length} orphaned tool_use(s) in transcript',
        );
        // Find insertion point: right after the last tool message following this
        // assistant message, or right after the assistant message itself.
        var insertAt = i + 1;
        while (insertAt < messages.length && messages[insertAt].role == 'tool') {
          insertAt++;
        }
        for (final id in expectedIds) {
          final tc = msg.toolCalls!.firstWhere((t) => t.id == id);
          messages.insert(
            insertAt,
            LlmMessage(
              role: 'tool',
              content:
                  'Tool "${tc.function.name}" failed: execution was interrupted '
                  '(session recovered from a previous error).',
              toolCallId: id,
              name: tc.function.name,
            ),
          );
          insertAt++;
        }
      }
    }
  }

  Future<void> _saveStore(String dir) async {
    final storePath = _storeFilePath(dir);
    final map = <String, dynamic>{};
    for (final entry in _meta.entries) {
      map[entry.key] = entry.value.toJson();
    }
    final encoder = const JsonEncoder.withIndent('  ');
    await File(storePath).writeAsString(encoder.convert(map));
  }

  // -- Inter-Agent Communication --------------------------------------------

  /// Send a message from one agent to another.
  /// Creates a special inter-agent session with key pattern: agent:{sourceId}:{targetId}
  Future<void> sendAgentMessage({
    required String sourceAgentId,
    required String targetAgentId,
    required String message,
    String? sourceAgentName,
  }) async {
    final sessionKey = 'agent:$sourceAgentId:$targetAgentId';

    // Get or create the inter-agent session
    await getOrCreate(
      sessionKey,
      'inter_agent',
      targetAgentId,
    );

    // Create a user message from the source agent
    final llmMessage = LlmMessage(
      role: 'user',
      content: message,
      name: sourceAgentName ?? sourceAgentId,
    );

    // Add message to session
    await addMessage(sessionKey, llmMessage);

    _log.info('Agent message sent: $sourceAgentId -> $targetAgentId');
  }

  /// Get all messages sent to a specific agent from other agents.
  /// Returns list of message objects with metadata about sender.
  Future<List<Map<String, dynamic>>> getAgentMessages(String agentId) async {
    final messages = <Map<String, dynamic>>[];

    // Find all sessions where this agent is the target
    // Session key pattern: agent:{sourceId}:{targetId}
    for (final meta in _meta.values) {
      if (meta.key.startsWith('agent:') && meta.key.endsWith(':$agentId')) {
        // Extract source agent ID from session key
        final parts = meta.key.split(':');
        if (parts.length == 3) {
          final sourceAgentId = parts[1];

          // Get the session messages
          final sessionMessages = getHistory(meta.key);

          // Add each message with metadata
          for (final msg in sessionMessages) {
            if (msg.role == 'user') {
              messages.add({
                'from_agent_id': sourceAgentId,
                'from_agent_name': msg.name ?? sourceAgentId,
                'message': msg.content.toString(),
                'timestamp': meta.lastActivity.toIso8601String(),
                'session_key': meta.key,
              });
            }
          }
        }
      }
    }

    return messages;
  }
}
