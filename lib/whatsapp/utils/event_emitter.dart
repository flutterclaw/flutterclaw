import 'dart:async';

/// A typed event emitter that supports named event streams.
class WAEventEmitter {
  final _controllers = <String, StreamController<dynamic>>{};

  /// Emit an event with [name] and [data].
  void emit(String name, dynamic data) {
    _controllers[name]?.add(data);
  }

  /// Subscribe to events with [name].
  StreamSubscription<T> on<T>(String name, void Function(T data) handler) {
    final ctrl = _controllers.putIfAbsent(
        name, () => StreamController<dynamic>.broadcast());
    return ctrl.stream.cast<T>().listen(handler);
  }

  /// Returns a single-use future that resolves on the next [name] event.
  Future<T> once<T>(String name) {
    final ctrl = _controllers.putIfAbsent(
        name, () => StreamController<dynamic>.broadcast());
    return ctrl.stream.cast<T>().first;
  }

  /// Close all streams.
  Future<void> dispose() async {
    for (final c in _controllers.values) {
      await c.close();
    }
    _controllers.clear();
  }
}
