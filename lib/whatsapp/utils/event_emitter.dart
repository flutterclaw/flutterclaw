import 'dart:async';

class _BufferedEvent {
  final String name;
  final dynamic data;

  const _BufferedEvent({required this.name, required this.data});
}

/// A typed event emitter that supports named event streams.
class WAEventEmitter {
  final _controllers = <String, StreamController<dynamic>>{};
  final _bufferedEvents = <_BufferedEvent>[];
  var _bufferDepth = 0;

  static const _bufferableEvents = <String>{
    'messaging-history.set',
    'chats.upsert',
    'chats.update',
    'chats.delete',
    'contacts.upsert',
    'contacts.update',
    'messages.upsert',
    'messages.update',
    'messages.delete',
    'messages.reaction',
    'message-receipt.update',
    'groups.upsert',
    'groups.update',
  };

  /// Emit an event with [name] and [data].
  void emit(String name, dynamic data) {
    if (isBuffering() && _bufferableEvents.contains(name)) {
      _bufferedEvents.add(_BufferedEvent(name: name, data: data));
      return;
    }
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

  /// Start buffering known high-volume sync events until [flush] is called.
  void buffer() {
    _bufferDepth += 1;
  }

  /// Flush buffered events in arrival order.
  bool flush() {
    if (!isBuffering() && _bufferedEvents.isEmpty) {
      return false;
    }

    _bufferDepth = 0;
    final pending = List<_BufferedEvent>.from(_bufferedEvents);
    _bufferedEvents.clear();
    for (final event in pending) {
      _controllers[event.name]?.add(event.data);
    }
    return true;
  }

  bool isBuffering() => _bufferDepth > 0;

  /// Close all streams.
  Future<void> dispose() async {
    _bufferedEvents.clear();
    _bufferDepth = 0;
    for (final c in _controllers.values) {
      await c.close();
    }
    _controllers.clear();
  }
}
