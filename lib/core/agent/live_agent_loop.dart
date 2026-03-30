/// Bridges [GeminiLiveService] events with [ToolRegistry] for tool execution,
/// and persists transcripts to [SessionManager].
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../../services/gemini_live/gemini_live_service.dart';
import '../../services/gemini_live/live_event.dart';
import '../../tools/registry.dart';
import '../providers/provider_interface.dart';
import 'session_manager.dart';

final _log = Logger('LiveAgentLoop');

/// Events emitted by [LiveAgentLoop] for the UI layer.
sealed class LiveAgentEvent {
  const LiveAgentEvent();
}

class LiveAudioOutput extends LiveAgentEvent {
  final Uint8List pcmData;
  const LiveAudioOutput(this.pcmData);
}

class LiveUserTranscript extends LiveAgentEvent {
  final String text;
  const LiveUserTranscript(this.text);
}

class LiveModelTranscript extends LiveAgentEvent {
  final String text;
  const LiveModelTranscript(this.text);
}

class LiveToolStarted extends LiveAgentEvent {
  final String name;
  final Map<String, dynamic> args;
  const LiveToolStarted(this.name, this.args);
}

class LiveToolCompleted extends LiveAgentEvent {
  final String name;
  final String result;
  final bool isError;
  const LiveToolCompleted(this.name, this.result, {this.isError = false});
}

class LiveSessionReady extends LiveAgentEvent {
  const LiveSessionReady();
}

class LiveTurnComplete extends LiveAgentEvent {
  const LiveTurnComplete();
}

class LiveAgentError extends LiveAgentEvent {
  final String message;
  const LiveAgentError(this.message);
}

class LiveSessionDisconnected extends LiveAgentEvent {
  const LiveSessionDisconnected();
}

/// User spoke while model was responding — audio playback should stop.
class LiveInterrupted extends LiveAgentEvent {
  const LiveInterrupted();
}

/// Bridges the [GeminiLiveService] WebSocket events with the tool registry
/// and session persistence.
class LiveAgentLoop {
  final GeminiLiveService liveService;
  final ToolRegistry toolRegistry;
  final SessionManager sessionManager;

  final _eventController = StreamController<LiveAgentEvent>.broadcast();
  StreamSubscription? _liveSubscription;

  /// Accumulated model transcript for the current turn.
  final _modelTranscriptBuffer = StringBuffer();

  /// Accumulated user transcript for the current turn.
  final _userTranscriptBuffer = StringBuffer();

  /// In-flight tool executions (for cancellation support).
  final Map<String, _PendingTool> _pendingTools = {};

  /// Events for the UI.
  Stream<LiveAgentEvent> get events => _eventController.stream;

  LiveAgentLoop({
    required this.liveService,
    required this.toolRegistry,
    required this.sessionManager,
  });

  /// Start processing events from the live service for [sessionKey].
  void start(String sessionKey) {
    _liveSubscription?.cancel();
    _liveSubscription = liveService.events.listen(
      (event) => _handleEvent(event, sessionKey),
      onError: (Object e) {
        _log.severe('Live event stream error', e);
        _eventController.add(LiveAgentError('$e'));
      },
    );
  }

  /// Stop processing events.
  Future<void> stop() async {
    await _liveSubscription?.cancel();
    _liveSubscription = null;
    _cancelAllPendingTools();
  }

  Future<void> dispose() async {
    await stop();
    await _eventController.close();
  }

  // -- Event Handling --

  void _handleEvent(LiveEvent event, String sessionKey) {
    switch (event) {
      case SetupComplete():
        _eventController.add(const LiveSessionReady());

      case AudioChunk(:final pcmData):
        _eventController.add(LiveAudioOutput(pcmData));

      case TextDelta(:final text):
        _modelTranscriptBuffer.write(text);
        _eventController.add(LiveModelTranscript(text));

      case InputTranscript(:final text):
        _userTranscriptBuffer.write(text);
        _eventController.add(LiveUserTranscript(text));

      case TurnComplete():
        _persistTurn(sessionKey);
        _eventController.add(const LiveTurnComplete());

      case ToolCallRequest(:final id, :final name, :final args):
        _executeToolCall(id, name, args, sessionKey);

      case ToolCallCancellation(:final ids):
        _cancelToolCalls(ids);
        // Barge-in: signal the UI to stop audio immediately.
        _eventController.add(const LiveInterrupted());

      case LiveError(:final message):
        _eventController.add(LiveAgentError(message));

      case Disconnected():
        _cancelAllPendingTools();
        _eventController.add(const LiveSessionDisconnected());
    }
  }

  /// Writes buffered user speech to the session if any (e.g. before tool rows).
  Future<void> _flushUserTranscriptToSessionIfNonEmpty(String sessionKey) async {
    final userText = _userTranscriptBuffer.toString();
    if (userText.isEmpty) return;
    await sessionManager.addMessage(
      sessionKey,
      LlmMessage(role: 'user', content: userText),
    );
    _userTranscriptBuffer.clear();
  }

  /// Persist the current turn's transcripts to the session.
  void _persistTurn(String sessionKey) {
    final userText = _userTranscriptBuffer.toString();
    final modelText = _modelTranscriptBuffer.toString();

    if (userText.isNotEmpty) {
      sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'user', content: userText),
      );
      _userTranscriptBuffer.clear();
    }

    if (modelText.isNotEmpty) {
      sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'assistant', content: modelText),
      );
      _modelTranscriptBuffer.clear();
    }
  }

  /// Execute a tool call from the model and send the result back.
  Future<void> _executeToolCall(
    String callId,
    String name,
    Map<String, dynamic> args,
    String sessionKey,
  ) async {
    _log.info('Tool call: $name($callId)');
    _eventController.add(LiveToolStarted(name, args));

    final pending = _PendingTool(callId: callId, name: name);
    _pendingTools[callId] = pending;

    try {
      // Persist the user's utterance before assistant+tool rows so the transcript
      // order matches conversation (fixes UI list showing tools above the question).
      await _flushUserTranscriptToSessionIfNonEmpty(sessionKey);
      // Inject session key for tools that need it.
      args['__session_key'] = sessionKey;

      final result = await toolRegistry.execute(name, args);

      // Check if cancelled while executing.
      if (pending.cancelled) {
        _log.info('Tool $name($callId) completed but was cancelled');
        return;
      }

      _pendingTools.remove(callId);

      _eventController.add(LiveToolCompleted(
        name,
        result.content,
        isError: result.isError,
      ));

      // Send result back to the model.
      liveService.sendToolResponse(
        callId,
        name,
        {'result': result.content},
      );

      // Persist tool call and result (arguments for chat pills; strip internal keys).
      final publicArgs = Map<String, dynamic>.from(args)
        ..removeWhere((k, _) => k.startsWith('__'));
      final argsJson =
          publicArgs.isEmpty ? '{}' : jsonEncode(publicArgs);

      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(
          role: 'assistant',
          content: null,
          toolCalls: [
            ToolCall(
              id: callId,
              function: ToolCallFunction(name: name, arguments: argsJson),
            ),
          ],
        ),
      );
      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(
          role: 'tool',
          content: result.content,
          toolCallId: callId,
          name: name,
        ),
      );
    } catch (e) {
      _pendingTools.remove(callId);
      _log.severe('Tool $name($callId) failed', e);

      final errorMsg = 'Tool "$name" failed: $e';
      _eventController.add(LiveToolCompleted(name, errorMsg, isError: true));

      liveService.sendToolResponse(
        callId,
        name,
        {'error': errorMsg},
      );
    }
  }

  void _cancelToolCalls(List<String> ids) {
    for (final id in ids) {
      final pending = _pendingTools.remove(id);
      if (pending != null) {
        pending.cancelled = true;
        _log.info('Cancelled tool ${pending.name}($id)');
      }
    }
  }

  void _cancelAllPendingTools() {
    for (final pending in _pendingTools.values) {
      pending.cancelled = true;
    }
    _pendingTools.clear();
  }
}

class _PendingTool {
  final String callId;
  final String name;
  bool cancelled = false;

  _PendingTool({required this.callId, required this.name});
}
