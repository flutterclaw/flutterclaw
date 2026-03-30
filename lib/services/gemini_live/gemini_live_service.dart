/// WebSocket client for the Gemini Live API.
///
/// Manages a stateful WSS connection for real-time bidirectional audio/text
/// streaming with tool calling support.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'live_event.dart';
import 'live_session_config.dart';

final _log = Logger('GeminiLiveService');

/// Connection state for the Live API session.
enum LiveConnectionState {
  disconnected,
  connecting,
  settingUp,
  ready,
}

class GeminiLiveService {
  static const _baseUrl =
      'wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage'
      '.v1beta.GenerativeService.BidiGenerateContent';

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  final _eventController = StreamController<LiveEvent>.broadcast();
  LiveConnectionState _state = LiveConnectionState.disconnected;

  /// Stream of events from the Live API.
  Stream<LiveEvent> get events => _eventController.stream;

  /// Current connection state.
  LiveConnectionState get state => _state;

  bool get isConnected => _state == LiveConnectionState.ready;

  /// Connect to the Gemini Live API and send the setup message.
  Future<void> connect({required LiveSessionConfig config}) async {
    if (_state != LiveConnectionState.disconnected) {
      _log.warning('Already connected or connecting');
      return;
    }

    _state = LiveConnectionState.connecting;

    try {
      final uri = Uri.parse('$_baseUrl?key=${config.apiKey}');
      _channel = WebSocketChannel.connect(uri);
      await _channel!.ready;

      _state = LiveConnectionState.settingUp;
      _log.info('WebSocket connected, sending setup');

      // Listen to incoming messages.
      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
      );

      // Send setup message.
      final setupJson = jsonEncode(config.toSetupMessage());
      _channel!.sink.add(setupJson);
    } catch (e) {
      _log.severe('Failed to connect', e);
      _state = LiveConnectionState.disconnected;
      _eventController.add(LiveError('Connection failed: $e'));
    }
  }

  /// Send raw PCM audio data as a realtimeInput message.
  void sendAudio(Uint8List pcmChunk) {
    if (_state != LiveConnectionState.ready) return;
    _send({
      'realtimeInput': {
        'audio': {
          'data': base64Encode(pcmChunk),
          'mimeType': 'audio/pcm;rate=16000',
        },
      },
    });
  }

  /// Send a text message as realtimeInput.
  void sendText(String text) {
    if (_state != LiveConnectionState.ready) return;
    _send({
      'realtimeInput': {'text': text},
    });
  }

  /// Send a tool/function response back to the model.
  void sendToolResponse(
    String callId,
    String name,
    Map<String, dynamic> result,
  ) {
    if (_state != LiveConnectionState.ready) return;
    _send({
      'toolResponse': {
        'functionResponses': [
          {
            'id': callId,
            'name': name,
            'response': result,
          },
        ],
      },
    });
  }

  /// Disconnect the WebSocket session.
  Future<void> disconnect() async {
    if (_state == LiveConnectionState.disconnected) return;
    _log.info('Disconnecting');
    _state = LiveConnectionState.disconnected;
    await _subscription?.cancel();
    _subscription = null;
    await _channel?.sink.close();
    _channel = null;
  }

  /// Clean up resources.
  Future<void> dispose() async {
    await disconnect();
    await _eventController.close();
  }

  // -- Private --

  void _send(Map<String, dynamic> message) {
    try {
      _channel?.sink.add(jsonEncode(message));
    } catch (e) {
      _log.severe('Failed to send message', e);
    }
  }

  void _onMessage(dynamic raw) {
    try {
      // The Gemini Live API may send JSON as either UTF-8 text frames or
      // binary frames (UTF-8 bytes). Handle both transparently.
      final String text;
      if (raw is String) {
        text = raw;
      } else if (raw is List<int>) {
        text = utf8.decode(raw);
      } else {
        _log.warning('Ignoring unknown frame type: ${raw.runtimeType}');
        return;
      }

      final data = jsonDecode(text) as Map<String, dynamic>;

      // Setup complete.
      if (data.containsKey('setupComplete')) {
        _state = LiveConnectionState.ready;
        _log.info('Setup complete — session ready');
        _eventController.add(const SetupComplete());
        return;
      }

      // Server content (model response).
      if (data.containsKey('serverContent')) {
        _parseServerContent(data['serverContent'] as Map<String, dynamic>);
        return;
      }

      // Tool call (may come as top-level or inside serverContent).
      if (data.containsKey('toolCall')) {
        _parseToolCall(data['toolCall'] as Map<String, dynamic>);
        return;
      }

      // Tool call cancellation (barge-in).
      if (data.containsKey('toolCallCancellation')) {
        final cancellation =
            data['toolCallCancellation'] as Map<String, dynamic>;
        final ids = (cancellation['ids'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [];
        _eventController.add(ToolCallCancellation(ids));
        return;
      }

      // Server error (authentication, model not found, quota, etc.)
      if (data.containsKey('error')) {
        final err = data['error'] as Map<String, dynamic>?;
        final msg = err?['message'] as String? ?? 'Server error';
        final code = err?['code'] as int?;
        final status = err?['status'] as String? ?? '';
        _log.severe('Live API server error [$code $status]: $msg');
        _eventController.add(LiveError(msg, code: code));
        return;
      }

      _log.fine('Unhandled message keys: ${data.keys}');
    } catch (e, st) {
      _log.severe('Failed to parse message: $e\n$st');
      _eventController.add(LiveError('Parse error: $e'));
    }
  }

  void _parseServerContent(Map<String, dynamic> content) {
    final modelTurn = content['modelTurn'] as Map<String, dynamic>?;
    if (modelTurn != null) {
      final parts = modelTurn['parts'] as List<dynamic>?;
      if (parts != null) {
        for (final part in parts) {
          final p = part as Map<String, dynamic>;

          // Audio chunk.
          final inlineData = p['inlineData'] as Map<String, dynamic>?;
          if (inlineData != null) {
            final mimeType = inlineData['mimeType'] as String? ?? '';
            if (mimeType.startsWith('audio/')) {
              final b64 = inlineData['data'] as String;
              final bytes = base64Decode(b64);
              _eventController.add(AudioChunk(Uint8List.fromList(bytes)));
            }
            continue;
          }

          // Text parts in modelTurn are skipped in AUDIO mode — the text
          // transcript comes via outputTranscription below, avoiding duplicates.

          // Function call embedded in serverContent.
          final functionCall = p['functionCall'] as Map<String, dynamic>?;
          if (functionCall != null) {
            _eventController.add(ToolCallRequest(
              id: functionCall['id'] as String? ?? '',
              name: functionCall['name'] as String,
              args: (functionCall['args'] as Map<String, dynamic>?) ?? {},
            ));
            continue;
          }
        }
      }
    }

    // Input transcription (what the user said).
    final inputTranscription =
        content['inputTranscription'] as Map<String, dynamic>?;
    if (inputTranscription != null) {
      final text = inputTranscription['text'] as String?;
      if (text != null && text.isNotEmpty) {
        _eventController.add(InputTranscript(text));
      }
    }

    // Output transcription (text of what the model said).
    final outputTranscription =
        content['outputTranscription'] as Map<String, dynamic>?;
    if (outputTranscription != null) {
      final text = outputTranscription['text'] as String?;
      if (text != null && text.isNotEmpty) {
        _eventController.add(TextDelta(text));
      }
    }

    // Barge-in / interruption — the user started speaking while model was talking.
    final interrupted = content['interrupted'] as bool?;
    if (interrupted == true) {
      _eventController.add(const ToolCallCancellation([])); // reuse as interrupt signal
      _eventController.add(const TurnComplete()); // flush audio, stop speaking
      return;
    }

    // Turn complete.
    final turnComplete = content['turnComplete'] as bool?;
    if (turnComplete == true) {
      _eventController.add(const TurnComplete());
    }
  }

  void _parseToolCall(Map<String, dynamic> toolCall) {
    final functionCalls = toolCall['functionCalls'] as List<dynamic>?;
    if (functionCalls != null) {
      for (final fc in functionCalls) {
        final call = fc as Map<String, dynamic>;
        _eventController.add(ToolCallRequest(
          id: call['id'] as String? ?? '',
          name: call['name'] as String,
          args: (call['args'] as Map<String, dynamic>?) ?? {},
        ));
      }
    }
  }

  void _onError(Object error) {
    _log.severe('WebSocket error', error);
    _eventController.add(LiveError('WebSocket error: $error'));
  }

  void _onDone() {
    final wasConnected = _state != LiveConnectionState.disconnected;
    _state = LiveConnectionState.disconnected;
    final ch = _channel;
    _channel = null;
    _subscription = null;
    if (wasConnected) {
      final closeCode = ch?.closeCode;
      final closeReason = ch?.closeReason;
      _log.info('WebSocket closed — code=$closeCode reason=$closeReason');
      _eventController.add(Disconnected(code: closeCode, reason: closeReason));
    }
  }
}
