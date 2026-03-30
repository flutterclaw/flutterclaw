/// Events emitted by [GeminiLiveService] from the Gemini Live API WebSocket.
library;

import 'dart:typed_data';

/// Base class for all events from the Gemini Live API.
sealed class LiveEvent {
  const LiveEvent();
}

/// Session setup completed — ready to send/receive.
class SetupComplete extends LiveEvent {
  const SetupComplete();
}

/// Audio chunk from the model (raw 16-bit PCM, 24 kHz, mono, little-endian).
class AudioChunk extends LiveEvent {
  final Uint8List pcmData;
  const AudioChunk(this.pcmData);
}

/// Text transcript delta from the model's response.
class TextDelta extends LiveEvent {
  final String text;
  const TextDelta(this.text);
}

/// The model's turn is complete.
class TurnComplete extends LiveEvent {
  const TurnComplete();
}

/// Model is requesting a function/tool call.
class ToolCallRequest extends LiveEvent {
  final String id;
  final String name;
  final Map<String, dynamic> args;
  const ToolCallRequest({
    required this.id,
    required this.name,
    required this.args,
  });
}

/// Model cancelled pending tool calls (typically due to barge-in).
class ToolCallCancellation extends LiveEvent {
  final List<String> ids;
  const ToolCallCancellation(this.ids);
}

/// Input transcript from the server (what the user said).
class InputTranscript extends LiveEvent {
  final String text;
  const InputTranscript(this.text);
}

/// An error from the Live API or WebSocket layer.
class LiveError extends LiveEvent {
  final String message;
  final int? code;
  const LiveError(this.message, {this.code});
}

/// The WebSocket connection was closed.
class Disconnected extends LiveEvent {
  final int? code;
  final String? reason;
  const Disconnected({this.code, this.reason});
}
