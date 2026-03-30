/// Configuration for a Gemini Live API session.
library;

class LiveSessionConfig {
  /// Google API key.
  final String apiKey;

  /// Model identifier, e.g. 'models/gemini-3.1-flash-live-preview'.
  final String model;

  /// Optional system instruction text.
  final String? systemInstruction;

  /// Tool declarations in Gemini format (output of [GeminiToolTranslator]).
  final List<Map<String, dynamic>>? tools;

  /// Voice name for audio output (e.g. 'Aoede', 'Charon', 'Fenrir', 'Kore', 'Puck').
  final String voiceName;

  /// Response modalities: 'AUDIO', 'TEXT', or both.
  final List<String> responseModalities;

  const LiveSessionConfig({
    required this.apiKey,
    required this.model,
    this.systemInstruction,
    this.tools,
    this.voiceName = 'Puck',
    this.responseModalities = const ['AUDIO'],
  });

  /// Build the JSON setup message for the WebSocket.
  Map<String, dynamic> toSetupMessage() {
    final generationConfig = <String, dynamic>{
      'responseModalities': responseModalities,
      'speechConfig': {
        'voiceConfig': {
          'prebuiltVoiceConfig': {'voiceName': voiceName},
        },
      },
    };

    final setup = <String, dynamic>{
      'model': model,
      'generationConfig': generationConfig,
    };

    if (systemInstruction != null) {
      setup['systemInstruction'] = {
        'parts': [
          {'text': systemInstruction},
        ],
      };
    }

    if (tools != null && tools!.isNotEmpty) {
      setup['tools'] = tools;
    }

    return {'setup': setup};
  }
}
