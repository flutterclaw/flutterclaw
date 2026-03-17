import 'dart:async';

import 'package:logging/logging.dart';

/// Manages keepalive ping/pong for the WhatsApp WebSocket connection.
///
/// Sends a ping node periodically and tracks whether a pong arrives in time.
/// If no pong arrives within [timeout], calls [onDead] so the socket can
/// reconnect.
class KeepAlive {
  final Duration interval;
  final Duration timeout;
  final Future<void> Function() sendPing;
  final void Function() onDead;
  final Logger _log;

  Timer? _pingTimer;
  Timer? _timeoutTimer;
  bool _waitingForPong = false;

  KeepAlive({
    required this.interval,
    required this.timeout,
    required this.sendPing,
    required this.onDead,
    Logger? logger,
  }) : _log = logger ?? Logger('KeepAlive');

  /// Start the periodic ping loop.
  void start() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(interval, (_) => _tick());
  }

  /// Stop the keepalive loop (call on disconnect / shutdown).
  void stop() {
    _pingTimer?.cancel();
    _timeoutTimer?.cancel();
    _pingTimer = null;
    _timeoutTimer = null;
    _waitingForPong = false;
  }

  /// Call when a pong (keepalive response) is received from the server.
  void onPong() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _waitingForPong = false;
    _log.fine('Pong received');
  }

  void _tick() {
    if (_waitingForPong) {
      // Previous ping never got a pong — connection is dead.
      _log.warning('No pong received within timeout — marking connection dead');
      stop();
      onDead();
      return;
    }

    _waitingForPong = true;
    _log.fine('Sending ping');

    sendPing().catchError((e) {
      _log.warning('Ping send failed: $e');
      stop();
      onDead();
    });

    _timeoutTimer = Timer(timeout, () {
      if (_waitingForPong) {
        _log.warning('Ping timeout — marking connection dead');
        stop();
        onDead();
      }
    });
  }
}
