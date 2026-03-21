/// Wrapper around flutter_local_notifications for FlutterClaw.
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';
import 'package:timezone/data/latest.dart' as tz_data;

final _log = Logger('flutterclaw.notification_service');

/// Notification IDs for different purposes.
class NotificationIds {
  static const int persistent = 1;
  static const int toolStatus = 2;
  static const int messageBase = 100;
}

/// Channel IDs.
class NotificationChannels {
  static const String persistent = 'flutterclaw_foreground';
  static const String messages = 'flutterclaw_messages';
}

/// Wrapper around flutter_local_notifications.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  final _tapController = StreamController<String>.broadcast();

  /// Emits the payload string whenever a notification is tapped.
  /// Payload is the session key (e.g. "cron:abc123") set at send time.
  Stream<String> get tapPayloadStream => _tapController.stream;

  void dispose() => _tapController.close();

  /// Initialize the notification plugin.
  /// Call once at app startup.
  Future<void> initialize() async {
    if (_initialized) return;
    if (kIsWeb) {
      _initialized = true;
      return;
    }

    // Initialize timezone data required by zonedSchedule.
    tz_data.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      // Foreground presentation — set both old (presentAlert) and new (presentBanner)
      // flags so it works on all iOS versions supported by Flutter.
      defaultPresentAlert: true,   // iOS <14
      defaultPresentBanner: true,  // iOS 14+
      defaultPresentList: true,    // iOS 14+ — also appears in notification centre
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: darwinInit,
      macOS: darwinInit,
    );

    try {
      final result = await _plugin.initialize(
        settings: initSettings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
      );

      // flutter_local_notifications v21 returns null on iOS/macOS (means OK),
      // true on Android success, false on failure.
      // Treat null as success — only false means actual failure.
      if (result == false) {
        _log.warning('NotificationService: plugin.initialize returned false');
        return;
      }

      _initialized = true;

      if (Platform.isAndroid) {
        await _createAndroidChannels();
      } else if (Platform.isIOS) {
        // Explicitly request iOS permissions (belt-and-suspenders alongside init flags).
        await _requestIOSPermissions();
      }

      _log.info('NotificationService initialized (result=$result)');
    } catch (e) {
      _log.warning('NotificationService initialization failed: $e');
    }
  }

  Future<void> _requestIOSPermissions() async {
    final iosPlugin = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (iosPlugin == null) return;
    final granted = await iosPlugin.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    _log.info('iOS notification permissions granted: $granted');
  }

  Future<void> _createAndroidChannels() async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin == null) return;

    await androidPlugin
        .createNotificationChannel(const AndroidNotificationChannel(
      NotificationChannels.persistent,
      'FlutterClaw Service',
      description: 'Persistent notification when gateway is running',
      importance: Importance.low,
      playSound: false,
    ));

    await androidPlugin.createNotificationChannel(
      const AndroidNotificationChannel(
        NotificationChannels.messages,
        'Messages',
        description: 'Incoming chat messages',
        importance: Importance.defaultImportance,
    ));
  }

  void _onNotificationTapped(NotificationResponse response) {
    _log.fine('Notification tapped: id=${response.id} payload=${response.payload}');
    final payload = response.payload;
    if (payload != null && payload.isNotEmpty) {
      _tapController.add(payload);
    }
  }

  /// Show persistent notification for foreground service.
  Future<void> showPersistentNotification(String title, String body) async {
    if (!_initialized) return;

    await _plugin.show(
      id: NotificationIds.persistent,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.persistent,
          'FlutterClaw Service',
          channelDescription: 'Persistent notification when gateway is running',
          importance: Importance.low,
          priority: Priority.low,
          ongoing: true,
          autoCancel: false,
        ),
      ),
    );
  }

  /// Show notification for an incoming proactive message.
  /// [payload] is stored and emitted via [tapPayloadStream] when tapped.
  /// Set payload to the session key so the app can navigate to the right chat.
  Future<void> showMessageNotification(
    String channel,
    String sender,
    String text, {
    String? payload,
  }) async {
    if (!_initialized) {
      // Try once more — initialization may have been skipped on first attempt.
      await initialize();
      if (!_initialized) {
        throw StateError(
            'NotificationService not initialized. '
            'Check that notification permissions are granted.');
      }
    }

    final id = NotificationIds.messageBase + channel.hashCode.abs() % 1000;

    await _plugin.show(
      id: id,
      title: sender,
      body: text,
      payload: payload,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.messages,
          'Messages',
          channelDescription: 'Incoming messages from your AI agent',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,   // iOS <14
          presentBanner: true,  // iOS 14+
          presentList: true,    // iOS 14+ — notification centre
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  /// Show a transient tool-status notification while a tool is running in background.
  /// Always uses the same ID so it is replaced (not stacked) for each tool call.
  /// Silent — no sound or badge.
  Future<void> showToolStatusNotification(String agentName, String toolLabel) async {
    if (!_initialized) return;
    await _plugin.show(
      id: NotificationIds.toolStatus,
      title: agentName,
      body: toolLabel,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.messages,
          'Messages',
          channelDescription: 'Incoming messages from your AI agent',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          playSound: false,
          enableVibration: false,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBanner: true,
          presentList: false,
          presentBadge: false,
          presentSound: false,
        ),
      ),
    );
  }

  /// Cancel a notification by ID.
  Future<void> cancelNotification(int id) async {
    if (!_initialized) return;
    await _plugin.cancel(id: id);
  }

  /// Ensures the app can show notifications on Android (API 33+).
  /// Call before starting the foreground service so the persistent notification is visible.
  /// No-op on other platforms.
  Future<void> ensureAndroidNotificationPermission() async {
    if (!Platform.isAndroid) return;
    await initialize();
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final granted = await androidPlugin?.requestNotificationsPermission();
    if (granted != true) {
      _log.warning('Android notification permission not granted');
    }
  }
}
