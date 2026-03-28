/// Connectivity monitoring service.
///
/// Wraps connectivity_plus to expose simple online/offline/metered states.
/// The ProviderRouter reads this before routing to cloud LLMs.
library;

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.connectivity');

enum ConnectivityState {
  /// Connected via WiFi — full bandwidth available.
  wifi,

  /// Connected via cellular — may be metered.
  cellular,

  /// No internet connection.
  offline,
}

class ConnectivityService {
  final _connectivity = Connectivity();
  ConnectivityState _state = ConnectivityState.wifi;
  StreamSubscription<List<ConnectivityResult>>? _sub;

  ConnectivityState get state => _state;
  bool get isOnline => _state != ConnectivityState.offline;
  bool get isMetered => _state == ConnectivityState.cellular;

  Future<void> init() async {
    final results = await _connectivity.checkConnectivity();
    _state = _toState(results);
    _sub = _connectivity.onConnectivityChanged.listen((results) {
      final prev = _state;
      _state = _toState(results);
      if (_state != prev) {
        _log.info('Connectivity changed: $prev → $_state');
      }
    });
  }

  ConnectivityState _toState(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet)) {
      return ConnectivityState.wifi;
    }
    if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityState.cellular;
    }
    // Only report offline when the list is exclusively [none].
    // An empty list or mixed/unknown results means we can't be certain —
    // default to online to avoid false-positive blocks (common on iOS simulator
    // or briefly during app startup before the network stack is ready).
    if (results.isNotEmpty &&
        results.every((r) => r == ConnectivityResult.none)) {
      return ConnectivityState.offline;
    }
    return ConnectivityState.wifi;
  }

  void dispose() => _sub?.cancel();
}
