import 'dart:typed_data';

import 'package:logging/logging.dart';

/// Default WhatsApp Web WebSocket URL.
const waWebSocketUrl = 'wss://web.whatsapp.com/ws/chat';

/// Configuration for the WhatsApp WebSocket connection.
class WASocketConfig {
  /// WebSocket URL to connect to.
  final String url;

  /// Connection timeout.
  final Duration connectTimeout;

  /// Interval between keepalive pings.
  final Duration keepaliveInterval;

  /// Maximum time to wait for a pong before considering the connection dead.
  final Duration keepaliveTimeout;

  /// Maximum reconnect attempts before giving up (0 = unlimited).
  final int maxRetries;

  /// Browser description sent in the client payload [name, platform, version].
  final List<String> browser;

  /// Logger for socket events.
  final Logger logger;

  /// Optional routing info (for multi-device). Leave null for default.
  final Uint8List? routingInfo;

  WASocketConfig({
    this.url = waWebSocketUrl,
    this.connectTimeout = const Duration(seconds: 20),
    this.keepaliveInterval = const Duration(seconds: 25),
    this.keepaliveTimeout = const Duration(seconds: 10),
    this.maxRetries = 0,
    this.browser = const ['Mac OS', 'Chrome', '14.4.1'],
    Logger? logger,
    this.routingInfo,
  }) : logger = logger ?? Logger('WASocket');
}
