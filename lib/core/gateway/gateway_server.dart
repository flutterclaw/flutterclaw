/// Embedded WebSocket gateway implementing OpenClaw protocol.
library;

import 'dart:async';
import 'dart:io';

import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/gateway/protocol.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/cron_service.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final _log = Logger('flutterclaw.gateway_server');
const _uuid = Uuid();

/// Represents a connected client (operator or node).
class _Client {
  final WebSocketChannel channel;
  String? role;
  String? deviceId;
  bool connected = false;

  _Client(this.channel);
}

/// Embedded WebSocket gateway server.
class GatewayServer {
  final ConfigManager configManager;
  final AgentLoop agentLoop;
  final SessionManager sessionManager;
  final ToolRegistry toolRegistry;
  final CronService? cronService;

  HttpServer? _server;
  final List<_Client> _clients = [];
  String _state = 'idle';
  String? _currentSessionKey;

  GatewayServer({
    required this.configManager,
    required this.agentLoop,
    required this.sessionManager,
    required this.toolRegistry,
    this.cronService,
  });

  /// Start the gateway server.
  Future<void> start() async {
    if (_server != null) {
      _log.warning('Gateway already started');
      return;
    }

    final config = configManager.config.gateway;
    final host = config.host;
    final port = config.port;

    final handler = webSocketHandler(_onConnection);

    try {
      _server = await shelf_io
          .serve(handler, host, port)
          .timeout(const Duration(seconds: 5));
      _log.info('Gateway server listening on ws://$host:${_server!.port}');
    } on SocketException catch (e) {
      if (e.osError?.errorCode == 48 || e.osError?.errorCode == 98) {
        // Port already in use (macOS: 48, Linux: 98)
        throw SocketException('Port $port is already in use');
      }
      rethrow;
    } on TimeoutException {
      throw Exception('Gateway server startup timed out after 5 seconds');
    }
  }

  /// Stop the gateway server.
  Future<void> stop() async {
    _state = 'stopping';
    for (final client in List<_Client>.from(_clients)) {
      client.channel.sink.close();
    }
    _clients.clear();
    await _server?.close(force: true);
    _server = null;
    _state = 'idle';
    _log.info('Gateway server stopped');
  }

  /// Number of currently connected WebSocket clients.
  int get connectionCount => _clients.length;

  /// Check if the gateway server is healthy and responsive.
  bool isHealthy() {
    // Check if server exists and is not null
    if (_server == null) {
      _log.fine('Health check: server is null');
      return false;
    }

    // Check if server port is still valid (indicates server is bound)
    try {
      final port = _server!.port;
      if (port <= 0) {
        _log.warning('Health check: invalid port $port');
        return false;
      }
    } catch (e) {
      _log.warning('Health check: error accessing server port: $e');
      return false;
    }

    // Server appears healthy
    return true;
  }

  /// Broadcast an event to all connected clients.
  void broadcast(ProtocolFrame event) {
    final json = event.toJsonString();
    for (final client in _clients) {
      if (client.connected) {
        try {
          client.channel.sink.add(json);
        } catch (e) {
          _log.warning('Broadcast to client failed: $e');
        }
      }
    }
  }

  void _onConnection(WebSocketChannel webSocket, String? protocol) {
    final client = _Client(webSocket);
    _clients.add(client);

    webSocket.stream.listen(
      (message) => _handleMessage(client, message),
      onError: (e) => _log.warning('WebSocket error: $e'),
      onDone: () => _clients.remove(client),
      cancelOnError: false,
    );

    // Send connect challenge
    final nonce = _uuid.v4();
    final challenge = ProtocolFrame(
      type: 'event',
      event: 'connect.challenge',
      payload: ConnectChallenge(nonce: nonce, ts: DateTime.now().millisecondsSinceEpoch).toJson(),
    );
    client.channel.sink.add(challenge.toJsonString());
  }

  void _handleMessage(_Client client, dynamic message) {
    if (message is! String) return;
    final frame = ProtocolFrame.tryParse(message);
    if (frame == null) return;

    if (frame.type == 'req' && frame.method != null) {
      _handleRequest(client, frame);
    }
  }

  Future<void> _handleRequest(_Client client, ProtocolFrame req) async {
    final id = req.id ?? _uuid.v4();
    final method = req.method!;
    final params = req.params ?? {};

    try {
      final payload = await handleMethod(method, params);
      _sendResponse(client, id, true, payload);
    } catch (e) {
      _log.warning('Method $method failed: $e');
      _sendResponse(client, id, false, null, error: {'message': '$e'});
    }
  }

  void _sendResponse(
    _Client client,
    String id,
    bool ok,
    dynamic payload, {
    Map<String, dynamic>? error,
  }) {
    final res = ProtocolFrame(
      type: 'res',
      id: id,
      ok: ok,
      payload: payload,
      error: error,
    );
    client.channel.sink.add(res.toJsonString());
  }

  /// Handle a protocol method. Returns payload or throws.
  Future<dynamic> handleMethod(String method, Map<String, dynamic> params) async {
    switch (method) {
      // Core
      case 'connect':        return _handleConnect(params);
      case 'status':         return _handleStatus();
      // Chat
      case 'chat.send':      return _handleChatSend(params);
      // Sessions
      case 'sessions.list':    return _handleSessionsList();
      case 'sessions.history': return _handleSessionsHistory(params);
      case 'sessions.reset':   return _handleSessionsReset(params);
      case 'sessions.rename':  return _handleSessionsRename(params);
      case 'sessions.compact': return _handleSessionsCompact(params);
      // Tools
      case 'tools.catalog': return _handleToolsCatalog();
      case 'tools.exec':    return _handleToolsExec(params);
      // Agents
      case 'agents.list':    return _handleAgentsList();
      case 'agents.send':    return _handleAgentSend(params);
      case 'agents.messages':return _handleAgentMessages(params);
      case 'agents.switch':  return _handleAgentsSwitch(params);
      // Config
      case 'config.get':   return _handleConfigGet();
      case 'config.patch': return _handleConfigPatch(params);
      // Cron
      case 'cron.list':   return _handleCronList();
      case 'cron.create': return _handleCronCreate(params);
      case 'cron.delete': return _handleCronDelete(params);
      case 'cron.update': return _handleCronUpdate(params);
      default:
        throw UnimplementedError('Method $method');
    }
  }

  Future<Map<String, dynamic>> _handleConnect(Map<String, dynamic> params) async {
    // Token authentication: if a token is configured, reject clients that
    // don't supply the correct bearer token. Empty token = open access
    // (safe only when bound to loopback 127.0.0.1).
    final requiredToken = configManager.config.gateway.token;
    if (requiredToken.isNotEmpty) {
      final clientToken = params['token'] as String? ?? '';
      if (clientToken != requiredToken) {
        throw Exception('Unauthorized: invalid or missing gateway token');
      }
    }

    return {
      'type': 'hello-ok',
      'protocol': 3,
      'policy': {'tickIntervalMs': 15000},
    };
  }

  Future<Map<String, dynamic>> _handleChatSend(Map<String, dynamic> params) async {
    final chatParams = ChatSendParams.fromJson(params);
    final sessionKey = chatParams.sessionKey ??
        '${chatParams.channelType}:${chatParams.chatId}';

    _state = 'busy';
    _currentSessionKey = sessionKey;

    try {
      await agentLoop.processMessage(
        sessionKey,
        chatParams.text,
        channelType: chatParams.channelType,
        chatId: chatParams.chatId,
      );

      return ChatSendResult(
        messageId: _uuid.v4(),
        sessionKey: sessionKey,
      ).toJson();
    } finally {
      _state = 'idle';
      _currentSessionKey = null;
    }
  }

  Map<String, dynamic> _handleStatus() {
    return StatusResult(
      state: _state,
      currentSessionKey: _currentSessionKey,
      activeConnections: _clients.length,
    ).toJson();
  }

  Future<List<Map<String, dynamic>>> _handleSessionsList() async {
    final sessions = sessionManager.listActiveSessions();
    return sessions
        .map((s) => SessionSummary(
              key: s.key,
              channelType: s.channelType,
              chatId: s.chatId,
              messageCount: s.messageCount,
              totalTokens: s.totalTokens,
              lastActivity: s.lastActivity,
              modelOverride: s.modelOverride,
            ).toJson())
        .toList();
  }

  Future<List<Map<String, dynamic>>> _handleSessionsHistory(
    Map<String, dynamic> params,
  ) async {
    final p = SessionsHistoryParams.fromJson(params);
    final history = sessionManager.getHistory(p.sessionKey, limit: p.limit);
    return history.map((m) => m.toJson()).toList();
  }

  Map<String, dynamic> _handleToolsCatalog() {
    final defs = toolRegistry.getDefinitions();
    final tools = defs
        .map((d) => ToolCatalogEntry(
              name: d['name'] as String,
              description: d['description'] as String,
              parameters: d['parameters'] as Map<String, dynamic>,
              source: 'core',
            ))
        .toList();
    return ToolsCatalogResult(tools: tools).toJson();
  }

  /// List all available agents.
  Future<Map<String, dynamic>> _handleAgentsList() async {
    final config = configManager.config;
    final agents = config.agentProfiles;
    final activeAgentId = config.activeAgentId;

    return {
      'agents': agents.map((agent) {
        return {
          'id': agent.id,
          'name': agent.name,
          'emoji': agent.emoji,
          'model': agent.modelName,
          'status': agent.id == activeAgentId ? 'active' : 'idle',
          'vibe': agent.vibe,
        };
      }).toList(),
    };
  }

  /// Send a message from one agent to another.
  Future<Map<String, dynamic>> _handleAgentSend(Map<String, dynamic> params) async {
    final sourceAgentId = params['source_agent_id'] as String?;
    final targetAgentId = params['target_agent_id'] as String?;
    final message = params['message'] as String?;

    if (sourceAgentId == null || sourceAgentId.isEmpty) {
      throw ArgumentError('source_agent_id is required');
    }
    if (targetAgentId == null || targetAgentId.isEmpty) {
      throw ArgumentError('target_agent_id is required');
    }
    if (message == null || message.isEmpty) {
      throw ArgumentError('message is required');
    }

    // Get agent names
    final config = configManager.config;
    final sourceAgent = config.agentProfiles
        .where((a) => a.id == sourceAgentId)
        .firstOrNull;
    final targetAgent = config.agentProfiles
        .where((a) => a.id == targetAgentId)
        .firstOrNull;

    if (targetAgent == null) {
      throw ArgumentError('Target agent not found: $targetAgentId');
    }

    // Send message via session manager
    await sessionManager.sendAgentMessage(
      sourceAgentId: sourceAgentId,
      targetAgentId: targetAgentId,
      message: message,
      sourceAgentName: sourceAgent?.name,
    );

    final sessionKey = 'agent:$sourceAgentId:$targetAgentId';

    return {
      'success': true,
      'message_sent': true,
      'session_key': sessionKey,
      'from': {
        'id': sourceAgentId,
        'name': sourceAgent?.name ?? sourceAgentId,
      },
      'to': {
        'id': targetAgentId,
        'name': targetAgent.name,
      },
    };
  }

  /// Get messages sent to a specific agent.
  Future<Map<String, dynamic>> _handleAgentMessages(Map<String, dynamic> params) async {
    final agentId = params['agent_id'] as String?;

    if (agentId == null || agentId.isEmpty) {
      // Default to active agent if not specified
      final config = configManager.config;
      final activeAgent = config.activeAgent;
      if (activeAgent == null) {
        throw ArgumentError('No active agent and agent_id not specified');
      }
      final messages = await sessionManager.getAgentMessages(activeAgent.id);
      return {
        'messages': messages,
        'count': messages.length,
      };
    }

    final messages = await sessionManager.getAgentMessages(agentId);
    return {
      'messages': messages,
      'count': messages.length,
    };
  }

  // -------------------------------------------------------------------------
  // sessions.reset / rename / compact
  // -------------------------------------------------------------------------

  Future<Map<String, dynamic>> _handleSessionsReset(Map<String, dynamic> params) async {
    final key = params['session_key'] as String?;
    if (key == null || key.isEmpty) throw ArgumentError('session_key is required');
    await sessionManager.reset(key);
    return {'ok': true, 'session_key': key};
  }

  Future<Map<String, dynamic>> _handleSessionsRename(Map<String, dynamic> params) async {
    final key  = params['session_key'] as String?;
    final name = params['name'] as String?;
    if (key == null || key.isEmpty) throw ArgumentError('session_key is required');
    if (name == null) throw ArgumentError('name is required');
    await sessionManager.renameSession(key, name);
    return {'ok': true, 'session_key': key, 'name': name};
  }

  Future<Map<String, dynamic>> _handleSessionsCompact(Map<String, dynamic> params) async {
    final key = params['session_key'] as String?;
    if (key == null || key.isEmpty) throw ArgumentError('session_key is required');
    await sessionManager.compact(key);
    return {'ok': true, 'session_key': key};
  }

  // -------------------------------------------------------------------------
  // tools.exec
  // -------------------------------------------------------------------------

  Future<Map<String, dynamic>> _handleToolsExec(Map<String, dynamic> params) async {
    final name = params['name'] as String?;
    final args = params['args'] as Map<String, dynamic>? ?? {};
    if (name == null || name.isEmpty) throw ArgumentError('name is required');
    final result = await toolRegistry.execute(name, args);
    return {
      'ok': !result.isError,
      'content': result.content,
      'is_error': result.isError,
    };
  }

  // -------------------------------------------------------------------------
  // agents.switch
  // -------------------------------------------------------------------------

  Future<Map<String, dynamic>> _handleAgentsSwitch(Map<String, dynamic> params) async {
    final id = params['agent_id'] as String?;
    if (id == null || id.isEmpty) throw ArgumentError('agent_id is required');
    await configManager.switchAgent(id);
    return {'ok': true, 'active_agent_id': id};
  }

  // -------------------------------------------------------------------------
  // config.get / config.patch
  // -------------------------------------------------------------------------

  Map<String, dynamic> _handleConfigGet() {
    final config = configManager.config;
    return {
      'active_agent_id': config.activeAgentId,
      'model': config.agents.defaults.modelName,
      'max_tokens': config.agents.defaults.maxTokens,
      'temperature': config.agents.defaults.temperature,
      'max_tool_iterations': config.agents.defaults.maxToolIterations,
      'gateway': {
        'host': config.gateway.host,
        'port': config.gateway.port,
        'auto_start': config.gateway.autoStart,
        'token_set': config.gateway.token.isNotEmpty,
      },
      'agents': config.agentProfiles.map((a) => {
        'id': a.id,
        'name': a.name,
        'emoji': a.emoji,
        'model': a.modelName,
      }).toList(),
    };
  }

  Future<Map<String, dynamic>> _handleConfigPatch(Map<String, dynamic> params) async {
    final current = configManager.config;
    final defaults = current.agents.defaults;

    final newDefaults = AgentsDefaults(
      workspace: defaults.workspace,
      modelName: params['model'] as String? ?? defaults.modelName,
      maxTokens: params['max_tokens'] as int? ?? defaults.maxTokens,
      temperature: (params['temperature'] as num?)?.toDouble() ?? defaults.temperature,
      maxToolIterations: params['max_tool_iterations'] as int? ?? defaults.maxToolIterations,
      restrictToWorkspace: defaults.restrictToWorkspace,
    );

    configManager.update(current.copyWith(
      agents: AgentsConfig(defaults: newDefaults),
    ));
    await configManager.save();
    return {'ok': true};
  }

  // -------------------------------------------------------------------------
  // cron.list / create / delete / update
  // -------------------------------------------------------------------------

  Map<String, dynamic> _handleCronList() {
    if (cronService == null) return {'jobs': [], 'note': 'CronService not available'};
    final jobs = cronService!.jobs;
    return {
      'jobs': jobs.map((j) => {
        'id': j.id,
        'name': j.name,
        'task': j.task,
        'cron_expression': j.cronExpression,
        'enabled': j.enabled,
        'run_count': j.runCount,
        'last_run_at': j.lastRunAt?.toIso8601String(),
        'next_run_at': j.nextRunAt?.toIso8601String(),
        'last_status': j.lastStatus.name,
      }).toList(),
    };
  }

  Future<Map<String, dynamic>> _handleCronCreate(Map<String, dynamic> params) async {
    if (cronService == null) throw StateError('CronService not available');
    final name       = params['name'] as String?     ?? 'Gateway job';
    final task       = params['task'] as String?     ?? params['prompt'] as String? ?? '';
    final cronExpr   = params['cron_expression'] as String? ?? params['schedule'] as String?;
    final intervalS  = params['interval_seconds'] as int?;
    final enabled    = params['enabled'] as bool?    ?? true;
    final job = await cronService!.addJob(CronJob(
      name: name,
      task: task,
      cronExpression: cronExpr,
      interval: intervalS != null ? Duration(seconds: intervalS) : null,
      enabled: enabled,
    ));
    return {'ok': true, 'id': job.id, 'name': job.name};
  }

  Future<Map<String, dynamic>> _handleCronDelete(Map<String, dynamic> params) async {
    if (cronService == null) throw StateError('CronService not available');
    final id = params['id'] as String?;
    if (id == null || id.isEmpty) throw ArgumentError('id is required');
    await cronService!.removeJob(id);
    return {'ok': true, 'id': id};
  }

  Future<Map<String, dynamic>> _handleCronUpdate(Map<String, dynamic> params) async {
    if (cronService == null) throw StateError('CronService not available');
    final id = params['id'] as String?;
    if (id == null || id.isEmpty) throw ArgumentError('id is required');
    await cronService!.updateJob(
      id,
      enabled: params['enabled'] as bool?,
      task:    params['task'] as String? ?? params['prompt'] as String?,
    );
    return {'ok': true, 'id': id};
  }
}
