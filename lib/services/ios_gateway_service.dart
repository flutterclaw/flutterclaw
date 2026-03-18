/// iOS-specific gateway service that doesn't use flutter_foreground_task.
/// Uses iOS-compatible background support so the gateway can continue running
/// when the app is not in the foreground.
library;

import 'dart:async';
import 'dart:io';

import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/gateway/gateway_server.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/ios_background_audio_service.dart';
import 'package:flutterclaw/services/live_activity_service.dart';
import 'package:flutterclaw/services/skills_service.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.ios_gateway_service');

/// iOS-specific gateway service
class IosGatewayService {
  static GatewayServer? _gateway;
  static bool _isRunning = false;
  static DateTime? _startedAt;
  static ConfigManager? _configManager;
  static String? _lastError;

  // Stored startup params for watchdog restarts
  static ProviderRouter? _providerRouter;
  static SessionManager? _sessionManager;
  static ToolRegistry? _toolRegistry;
  static SkillsService? _skillsService;

  // Watchdog
  static Timer? _watchdogTimer;
  static int _consecutiveFailures = 0;
  static bool _isRestarting = false;

  // State event stream — subscribers (GatewayStateNotifier) listen for unexpected changes
  static final _eventController =
      StreamController<Map<String, dynamic>>.broadcast();
  static Stream<Map<String, dynamic>> get events => _eventController.stream;

  /// Start the gateway service on iOS
  static Future<bool> start({
    required ConfigManager configManager,
    required ProviderRouter providerRouter,
    required SessionManager sessionManager,
    required ToolRegistry toolRegistry,
    required SkillsService skillsService,
  }) async {
    if (_isRunning) {
      _log.info('Gateway already running');
      return true;
    }

    try {
      _log.info('Starting iOS gateway service');
      _configManager = configManager;
      _providerRouter = providerRouter;
      _sessionManager = sessionManager;
      _toolRegistry = toolRegistry;
      _skillsService = skillsService;

      // Enable iOS background support if available
      if (Platform.isIOS) {
        try {
          final audioStarted = await IosBackgroundAudioService.start()
              .timeout(const Duration(seconds: 8), onTimeout: () {
            _log.warning('Background audio start timed out (non-fatal)');
            return true;
          });
          if (!audioStarted) {
            _log.warning('iOS background audio failed to start (non-fatal)');
          }
        } catch (e) {
          _log.warning('Background audio error (non-fatal): $e');
        }
      }

      // Create agent loop
      _log.info('Creating AgentLoop...');
      final agentLoop = AgentLoop(
        configManager: configManager,
        providerRouter: providerRouter,
        toolRegistry: toolRegistry,
        sessionManager: sessionManager,
        skillsPromptGetter: () => skillsService.getSkillsPrompt(),
      );
      _log.info('AgentLoop created');

      // Create and start gateway
      _log.info('Creating GatewayServer...');
      final gateway = GatewayServer(
        configManager: configManager,
        agentLoop: agentLoop,
        sessionManager: sessionManager,
        toolRegistry: toolRegistry,
      );
      _log.info('GatewayServer created, starting...');

      await gateway.start();
      _log.info('GatewayServer.start() returned');
      _gateway = gateway;
      _isRunning = true;
      _startedAt = DateTime.now();
      _lastError = null;

      _log.info('Gateway started successfully');

      // Start watchdog
      _startWatchdog();

      // Start Live Activity
      final host = configManager.config.gateway.host;
      final port = configManager.config.gateway.port;
      final model = configManager.config.agents.defaults.modelName;

      await LiveActivityService.startActivity(
        host: host,
        port: port,
        model: model,
      );

      return true;
    } catch (e, st) {
      _log.severe('Failed to start gateway: $e', e, st);
      _lastError = e.toString();
      _isRunning = false;

      // Show error in Live Activity
      final host = _configManager?.config.gateway.host ?? '127.0.0.1';
      final port = _configManager?.config.gateway.port ?? 18789;
      final model = _configManager?.config.agents.defaults.modelName ?? '';

      await LiveActivityService.startActivityWithError(
        host: host,
        port: port,
        model: model,
        errorMessage: e.toString(),
      );

      return false;
    }
  }

  /// Stop the gateway service
  static Future<void> stop() async {
    _stopWatchdog();

    if (!_isRunning) {
      _log.info('Gateway not running');
      return;
    }

    _log.info('Stopping iOS gateway service');

    try {
      // Stop gateway
      if (_gateway != null) {
        await _gateway!.stop();
        _gateway = null;
      }

      // Stop background audio
      if (Platform.isIOS) {
        await IosBackgroundAudioService.stop();
      }

      // End Live Activity
      await LiveActivityService.endActivity();

      _isRunning = false;
      _startedAt = null;
      _log.info('Gateway stopped successfully');
    } catch (e, st) {
      _log.warning('Error stopping gateway: $e', e, st);
    }
  }

  // ---------------------------------------------------------------------------
  // Watchdog
  // ---------------------------------------------------------------------------

  static void _startWatchdog() {
    _stopWatchdog();
    _consecutiveFailures = 0;
    _isRestarting = false;
    _watchdogTimer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => _watchdogTick(),
    );
    _log.fine('Watchdog started (15s interval)');
  }

  static void _stopWatchdog() {
    _watchdogTimer?.cancel();
    _watchdogTimer = null;
  }

  static void _watchdogTick() {
    if (_isRestarting) return;

    final healthy = _gateway?.isHealthy() ?? false;

    if (healthy) {
      if (_consecutiveFailures > 0) {
        _log.fine('Gateway healthy again');
      }
      _consecutiveFailures = 0;
    } else {
      _consecutiveFailures++;
      _log.warning(
          'Gateway health check failed ($_consecutiveFailures/3)');
      _eventController.add({
        'state': 'unhealthy',
        'failures': _consecutiveFailures,
      });

      if (_consecutiveFailures >= 3) {
        _log.severe('Gateway unhealthy for 3 consecutive checks — restarting');
        _attemptRestart();
      }
    }
  }

  static void _attemptRestart() async {
    if (_isRestarting) return;
    _isRestarting = true;
    _consecutiveFailures = 0;
    _isRunning = false;

    _eventController.add({'state': 'restarting'});
    _log.info('Attempting gateway restart...');

    // Stop old gateway
    try {
      await _gateway?.stop();
    } catch (e) {
      _log.warning('Error stopping unhealthy gateway: $e');
    }
    _gateway = null;

    // Notify Live Activity about offline state
    final host = _configManager?.config.gateway.host ?? '127.0.0.1';
    final port = _configManager?.config.gateway.port ?? 18789;
    final model = _configManager?.config.agents.defaults.modelName ?? '';
    await LiveActivityService.startActivityWithError(
      host: host,
      port: port,
      model: model,
      errorMessage: 'Restarting...',
    );

    // Guard: make sure we have stored params
    if (_configManager == null ||
        _providerRouter == null ||
        _sessionManager == null ||
        _toolRegistry == null ||
        _skillsService == null) {
      _log.severe('Cannot restart — startup params not available');
      _lastError = 'Cannot restart: missing startup parameters';
      _isRestarting = false;
      _eventController.add({'state': 'error', 'error': _lastError});
      return;
    }

    try {
      // Restart background audio first
      await IosBackgroundAudioService.start()
          .timeout(const Duration(seconds: 8), onTimeout: () => true);

      // Recreate agent loop + gateway
      final agentLoop = AgentLoop(
        configManager: _configManager!,
        providerRouter: _providerRouter!,
        toolRegistry: _toolRegistry!,
        sessionManager: _sessionManager!,
        skillsPromptGetter: () => _skillsService!.getSkillsPrompt(),
      );
      final gateway = GatewayServer(
        configManager: _configManager!,
        agentLoop: agentLoop,
        sessionManager: _sessionManager!,
        toolRegistry: _toolRegistry!,
      );
      await gateway.start();

      _gateway = gateway;
      _isRunning = true;
      _startedAt = DateTime.now();
      _lastError = null;

      _log.info('Gateway restarted successfully');
      _eventController.add({'state': 'running'});

      await LiveActivityService.startActivity(
        host: host,
        port: port,
        model: model,
      );
    } catch (e, st) {
      _log.severe('Gateway restart failed: $e', e, st);
      _lastError = e.toString();
      _eventController.add({'state': 'error', 'error': _lastError});

      await LiveActivityService.startActivityWithError(
        host: host,
        port: port,
        model: model,
        errorMessage: e.toString(),
      );
    } finally {
      _isRestarting = false;
    }
  }

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Check if gateway is running
  static bool get isRunning => _isRunning;

  /// Get gateway uptime in seconds
  static int get uptimeSeconds {
    if (_startedAt == null) return 0;
    return DateTime.now().difference(_startedAt!).inSeconds;
  }

  /// Update Live Activity with current stats
  static void updateLiveActivity({
    int tokensProcessed = 0,
    int sessionCount = 0,
  }) {
    if (!_isRunning || _configManager == null) return;

    final model = _configManager!.config.agents.defaults.modelName;
    final uptime = uptimeSeconds;

    LiveActivityService.updateActivity(
      isRunning: true,
      status: 'running',
      tokensProcessed: tokensProcessed,
      model: model,
      sessionCount: sessionCount,
      uptimeSeconds: uptime,
    );
  }

  /// Get last error message
  static String? get lastError => _lastError;
}
