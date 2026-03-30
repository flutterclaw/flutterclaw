import '../data/models/config.dart';
import '../ui/screens/settings/providers_models_screen.dart' show kLiveVoices;
import 'registry.dart';

/// Tool that lets the model change the Gemini Live voice on behalf of the user.
///
/// The change is persisted to config and takes effect on the next voice call.
class SetLiveVoiceTool extends Tool {
  final ConfigManager configManager;

  SetLiveVoiceTool(this.configManager);

  @override
  String get name => 'set_live_voice';

  @override
  String get description =>
      'Change the voice used for live voice calls. The change is saved '
      'immediately and takes effect the next time a voice call is started. '
      'Use this when the user asks to change, try, or switch the call voice.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'voice_name': {
            'type': 'string',
            'description':
                'Name of the Gemini Live prebuilt voice to use. '
                'Available voices: ${kLiveVoices.keys.join(', ')}.',
            'enum': kLiveVoices.keys.toList(),
          },
        },
        'required': ['voice_name'],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final voiceName = args['voice_name'] as String? ?? '';
    if (!kLiveVoices.containsKey(voiceName)) {
      return ToolResult(
        content:
            'Unknown voice "$voiceName". Valid voices: ${kLiveVoices.keys.join(', ')}.',
        isError: true,
      );
    }

    final next = configManager.config.agents.defaults
        .copyWith(liveVoiceName: voiceName);
    configManager.update(
      configManager.config.copyWith(
        agents: configManager.config.agents.copyWith(defaults: next),
      ),
    );
    await configManager.save();

    final personality = kLiveVoices[voiceName];
    return ToolResult(
      content:
          'Voice changed to $voiceName ($personality). '
          'It will take effect on the next voice call.',
    );
  }
}
