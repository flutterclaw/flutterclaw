/// Background execution service using flutter_foreground_task.
///
/// Manages the foreground service (Android) and background modes (iOS).
/// Starts/stops the gateway+agent in a foreground service.
/// Shows persistent notification with status.
/// Auto-restarts on boot when configured.
library;

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/gateway/gateway_server.dart';
import 'package:flutterclaw/core/providers/openai_provider.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/services/cron_service.dart';
import 'package:flutterclaw/services/ios_background_audio_service.dart';
import 'package:flutterclaw/services/live_activity_service.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.background_service');

/// Top-level callback for the foreground task.
/// Must be a top-level or static function for the isolate.
@pragma('vm:entry-point')
void startFlutterClawTask() {
  FlutterForegroundTask.setTaskHandler(FlutterClawTaskHandler());
}

/// Result of gateway creation attempt.
class _GatewayResult {
  final dynamic gateway;
  final String? error;
  final bool success;

  _GatewayResult.success(this.gateway)
      : error = null,
        success = true;

  _GatewayResult.failure(this.error)
      : gateway = null,
        success = false;
}

/// Formats uptime seconds into a short human-readable string.
String _formatUptime(int seconds) {
  if (seconds < 60) return '${seconds}s';
  if (seconds < 3600) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m}m ${s}s';
  }
  final h = seconds ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  return '${h}h ${m}m';
}

/// Formats token count for notification (e.g. 1200 -> "1.2k").
String _formatTokens(int n) {
  if (n < 1000) return '$n';
  if (n < 1000000) return '${(n / 1000).toStringAsFixed(1)}k';
  return '${(n / 1000000).toStringAsFixed(1)}M';
}

/// Task handler that runs in the foreground service isolate.
class FlutterClawTaskHandler extends TaskHandler {
  dynamic _gatewayServer;
  bool _running = false;
  DateTime? _startedAt;
  ConfigManager? _configManager;
  String _gatewayState = 'stopped';
  String? _lastError;
  int _consecutiveFailures = 0;
  bool _isRetrying = false;
  String _host = '127.0.0.1';
  int _port = 18789;
  String _model = '';

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    _log.info('FlutterClawTaskHandler onStart (starter: ${starter.name})');
    _running = true;
    _startedAt = DateTime.now();

    // On iOS, prepare background support via the audio helper
    if (Platform.isIOS) {
      final audioStarted = await IosBackgroundAudioService.start();
      if (!audioStarted) {
        _log.warning('iOS background audio failed to start (non-fatal)');
      }
    }

    // Load config first so we can show "Iniciando... host:port" immediately
    // and so the notification updates from the initial "Iniciando gateway..." text
    _configManager = ConfigManager();
    await _configManager!.ensureDirectories();
    await _configManager!.load();
    _model = _configManager!.config.agents.defaults.modelName;
    _host = _configManager!.config.gateway.host;
    _port = _configManager!.config.gateway.port;

    _gatewayState = 'starting';
    _sendNotificationToMain('FlutterClaw', 'Starting... $_host:$_port');

    final result = await _createAndStartGatewayWithRetry();

    if (result.success) {
      _gatewayServer = result.gateway;
      _gatewayState = 'running';
      _lastError = null;
      _consecutiveFailures = 0;

      _refreshNotification();

      await LiveActivityService.startActivity(
        host: _host,
        port: _port,
        model: _model,
      );

      // Force a second update after a short delay so the notification
      // reliably shows "Gateway activo" even if the first update was dropped
      await Future.delayed(const Duration(milliseconds: 800));
      _refreshNotification();
    } else {
      _gatewayState = 'error';
      _lastError = result.error ?? 'Unknown error';

      _sendNotificationToMain('Gateway error', _buildNotificationText());

      await LiveActivityService.startActivityWithError(
        host: _host,
        port: _port,
        model: _model,
        errorMessage: result.error ?? 'Failed to start gateway',
      );
    }
  }

  /// Attempt to create and start gateway with retry logic.
  /// Uses [_configManager] which must be set before calling (done in onStart).
  Future<_GatewayResult> _createAndStartGatewayWithRetry() async {
    const maxAttempts = 3;
    const retryDelays = [0, 2000, 5000]; // milliseconds
    final configManager = _configManager!;

    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        if (attempt > 1) {
          _gatewayState = 'retrying';
          _isRetrying = true;
          _sendNotificationToMain(
            'Retrying...',
            'Attempt $attempt of $maxAttempts  \u00B7  $_host:$_port',
          );

          final delayMs = retryDelays[attempt - 1];
          if (delayMs > 0) {
            _log.info('Waiting ${delayMs}ms before retry attempt $attempt');
            await Future.delayed(Duration(milliseconds: delayMs));
          }
        }

        _log.info('Gateway start attempt $attempt/$maxAttempts');

        final sessionManager = SessionManager(configManager);
        await sessionManager.load();

        final toolRegistry = ToolRegistry();
        final provider = OpenAiProvider();
        final providerRouter = SimpleProviderRouter(provider);
        final agentLoop = AgentLoop(
          configManager: configManager,
          providerRouter: providerRouter,
          toolRegistry: toolRegistry,
          sessionManager: sessionManager,
        );

        final cronSvc = CronService(configManager: configManager);
        await cronSvc.start();

        final gateway = GatewayServer(
          configManager: configManager,
          agentLoop: agentLoop,
          sessionManager: sessionManager,
          toolRegistry: toolRegistry,
          cronService: cronSvc,
        );

        await gateway.start();
        _log.info('Gateway started successfully on attempt $attempt');
        _isRetrying = false;
        return _GatewayResult.success(gateway);
      } on SocketException catch (e) {
        final errorMsg = 'Network error: ${e.message}';
        _log.warning('Gateway start attempt $attempt failed: $errorMsg');
        _lastError = errorMsg;

        if (attempt == maxAttempts) {
          return _GatewayResult.failure('Port ${_configManager?.config.gateway.port ?? 18789} in use or network error');
        }
      } catch (e, st) {
        final errorMsg = e.toString();
        _log.warning('Gateway start attempt $attempt failed: $errorMsg', e, st);
        _lastError = errorMsg;

        if (attempt == maxAttempts) {
          return _GatewayResult.failure(errorMsg.length > 100 ? '${errorMsg.substring(0, 100)}...' : errorMsg);
        }
      }
    }

    return _GatewayResult.failure('Failed after $maxAttempts attempts');
  }

  static const MethodChannel _notificationUpdateChannel =
      MethodChannel('ai.flutterclaw/notification_update');

  /// Asks the native side to update the foreground notification (title + text).
  /// On Android the task runs in a separate FlutterEngine; we use a dedicated
  /// method channel registered on that engine so the update is applied in the
  /// service process (works on Android 15).
  void _sendNotificationToMain(String title, String text) {
    if (!Platform.isAndroid) {
      FlutterForegroundTask.updateService(
        notificationTitle: title,
        notificationText: text,
        notificationIcon: BackgroundService.notificationIcon,
        notificationButtons: BackgroundService.notificationButtons,
      );
      return;
    }
    try {
      _notificationUpdateChannel.invokeMethod<void>('update', {
        'notificationContentTitle': title,
        'notificationContentText': text,
      });
    } catch (e) {
      _log.warning('Failed to update notification via channel: $e');
    }
  }

  /// Updates the foreground notification with current state (title + rich text).
  /// Sends to main isolate so the update is applied from the app process.
  void _refreshNotification() {
    final sessionCount = _gatewayServer != null
        ? _gatewayServer.sessionManager.listSessions().length
        : 0;
    final tokensProcessed = _gatewayServer != null
        ? _gatewayServer.sessionManager.listSessions().fold<int>(
            0, (int sum, SessionMeta s) => sum + s.totalTokens)
        : 0;
    final title = _gatewayState == 'running'
        ? 'Gateway active'
        : _gatewayState == 'error'
            ? 'Gateway error'
            : 'Gateway stopped';
    final text = _buildNotificationText(
      sessionCount: sessionCount,
      tokensProcessed: tokensProcessed,
    );
    _sendNotificationToMain(title, text);
  }

  /// Builds notification text with status, model, address, uptime; optionally
  /// sessions and tokens (like Live Activity on iOS).
  String _buildNotificationText({
    int? sessionCount,
    int? tokensProcessed,
  }) {
    final uptime = _startedAt != null
        ? DateTime.now().difference(_startedAt!).inSeconds
        : 0;
    final addr = '$_host:$_port';
    final modelLabel = _model.isNotEmpty ? _model : 'no model';

    switch (_gatewayState) {
      case 'running':
        final line1 = '\u25CF $modelLabel  \u00B7  $addr  \u00B7  ${_formatUptime(uptime)}';
        if (sessionCount != null && tokensProcessed != null) {
          final sessionsStr = sessionCount == 1 ? '1 chat' : '$sessionCount chats';
          final tokensStr = _formatTokens(tokensProcessed);
          return '$line1\n$sessionsStr  \u00B7  $tokensStr tokens';
        }
        return line1;
      case 'starting':
        return '\u25CB Starting...  \u00B7  $addr';
      case 'retrying':
        return '\u21BA Retrying...  \u00B7  $addr';
      case 'restarting':
        return '\u21BA Restarting gateway...';
      case 'error':
        final err = _lastError ?? 'Unknown error';
        final short = err.length > 60 ? '${err.substring(0, 60)}...' : err;
        return '\u26A0 $short';
      case 'stopped':
        return '\u25A1 Stopped';
      default:
        return _gatewayState;
    }
  }

  @override
  void onRepeatEvent(DateTime timestamp) {
    if (!_running) return;

    final uptime = _startedAt != null
        ? DateTime.now().difference(_startedAt!).inSeconds
        : 0;
    // Keep _model in sync (it may have been updated after initial start)
    _model = _configManager?.config.agents.defaults.modelName ?? _model;

    if (_gatewayServer != null) {
      // Check gateway health
      final isHealthy = _gatewayServer.isHealthy();

      if (isHealthy) {
        _consecutiveFailures = 0;
        _gatewayState = 'running';

        _refreshNotification();

        final sessions = _gatewayServer.sessionManager.listSessions();
        LiveActivityService.updateActivity(
          isRunning: true,
          status: 'running',
          tokensProcessed: sessions.fold(0, (sum, s) => sum + s.totalTokens),
          model: _model,
          sessionCount: sessions.length,
          uptimeSeconds: uptime,
        );
      } else {
        _consecutiveFailures++;
        _log.warning('Gateway health check failed (${_consecutiveFailures}/3)');

        if (_consecutiveFailures >= 3 && !_isRetrying) {
          _log.severe('Gateway unhealthy after 3 checks, attempting restart');
          _attemptGatewayRestart();
        }
      }
    } else {
      // Gateway is null, update notification and Live Activity to show error state
      _refreshNotification();

      LiveActivityService.updateActivity(
        isRunning: false,
        status: _gatewayState,
        tokensProcessed: 0,
        model: _model,
        sessionCount: 0,
        uptimeSeconds: uptime,
        errorMessage: _lastError,
      );
    }
  }

  /// Attempt to restart a failed gateway.
  void _attemptGatewayRestart() async {
    if (_isRetrying) return;

    _log.info('Attempting to restart gateway');
    _gatewayState = 'restarting';
    _consecutiveFailures = 0;

    // Stop old gateway if it exists
    if (_gatewayServer != null) {
      try {
        await _gatewayServer.stop();
      } catch (e) {
        _log.warning('Error stopping unhealthy gateway: $e');
      }
      _gatewayServer = null;
    }

    // Try to restart with retry logic
    final result = await _createAndStartGatewayWithRetry();
    // Refresh instance fields in case config changed
    _model = _configManager?.config.agents.defaults.modelName ?? _model;
    _host = _configManager?.config.gateway.host ?? _host;
    _port = _configManager?.config.gateway.port ?? _port;

    if (result.success) {
      _gatewayServer = result.gateway;
      _gatewayState = 'running';
      _lastError = null;
      _startedAt = DateTime.now(); // Reset uptime

      _refreshNotification();

      LiveActivityService.updateActivity(
        isRunning: true,
        status: 'running',
        tokensProcessed: 0,
        model: _model,
        sessionCount: 0,
        uptimeSeconds: 0,
      );
    } else {
      _gatewayState = 'error';
      _lastError = result.error ?? 'Restart failed';

      _sendNotificationToMain('Restart error', _buildNotificationText());

      LiveActivityService.updateActivity(
        isRunning: false,
        status: 'error',
        tokensProcessed: 0,
        model: _model,
        sessionCount: 0,
        uptimeSeconds: 0,
        errorMessage: result.error,
      );
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    _log.info('FlutterClawTaskHandler onDestroy (isTimeout: $isTimeout)');
    _running = false;

    // Tear down iOS background helper
    if (Platform.isIOS) {
      await IosBackgroundAudioService.stop();
    }

    await LiveActivityService.endActivity();
    if (_gatewayServer != null) {
      try {
        await _gatewayServer.stop();
      } catch (e) {
        _log.warning('Error stopping gateway: $e');
      }
      _gatewayServer = null;
    }
  }

  @override
  void onReceiveData(Object data) {
    _log.fine('onReceiveData: $data');
  }

  @override
  void onNotificationButtonPressed(String id) {
    _log.fine('onNotificationButtonPressed: $id');
    if (id == 'stop') {
      FlutterForegroundTask.stopService();
    }
  }

  @override
  void onNotificationPressed() {
    _log.fine('onNotificationPressed');
  }

  @override
  void onNotificationDismissed() {
    _log.fine('onNotificationDismissed');
  }
}

/// Service for managing the foreground task lifecycle.
class BackgroundService {
  static bool _initialized = false;

  /// Icon and buttons for the foreground notification.
  static const notificationIcon = NotificationIcon(
    metaDataName: 'com.flutterclaw.notification_icon',
  );
  static const notificationButtons = [
    NotificationButton(id: 'open', text: 'Open'),
    NotificationButton(id: 'stop', text: 'Stop'),
  ];

  /// Initialize the foreground task. Call once at app startup (e.g. in main).
  /// Also call [FlutterForegroundTask.initCommunicationPort] in main before runApp.
  static Future<void> initializeService() async {
    if (_initialized) return;

    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'flutterclaw_foreground',
        channelName: 'FlutterClaw Gateway',
        channelDescription: 'AI gateway running status',
        channelImportance: NotificationChannelImportance.DEFAULT,
        priority: NotificationPriority.DEFAULT,
        visibility: NotificationVisibility.VISIBILITY_PUBLIC,
        onlyAlertOnce: true,
        showWhen: false,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(5000),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: false,
        allowWakeLock: true,
        allowWifiLock: false,
      ),
    );

    _initialized = true;
    _log.info('BackgroundService initialized');
  }

  /// Start the foreground service (gateway + agent).
  static Future<ServiceRequestResult> startService() async {
    if (!_initialized) {
      await initializeService();
    }

    return FlutterForegroundTask.startService(
      notificationTitle: 'FlutterClaw',
      notificationText: 'Starting gateway...',
      notificationIcon: notificationIcon,
      notificationButtons: notificationButtons,
      callback: startFlutterClawTask,
    );
  }

  /// Stop the foreground service.
  static Future<ServiceRequestResult> stopService() async {
    return FlutterForegroundTask.stopService();
  }
}