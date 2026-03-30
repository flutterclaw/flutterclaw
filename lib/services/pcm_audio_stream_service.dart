/// Raw PCM audio stream from the microphone for the Gemini Live API.
///
/// Produces a stream of 16-bit signed PCM chunks at 16 kHz mono,
/// suitable for sending directly to the Live API's `realtimeInput`.
library;

import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:record/record.dart';

final _log = Logger('PcmAudioStreamService');

class PcmAudioStreamService {
  final AudioRecorder _recorder = AudioRecorder();
  bool _streaming = false;

  bool get isStreaming => _streaming;

  /// Start streaming raw PCM audio from the microphone.
  ///
  /// Returns a broadcast stream of [Uint8List] chunks (16-bit signed PCM,
  /// 16 kHz, mono, little-endian). Returns null if permission is denied.
  Future<Stream<Uint8List>?> startStreaming() async {
    if (_streaming) {
      _log.warning('Already streaming');
      return null;
    }

    try {
      final hasPermission = await _recorder.hasPermission();
      if (!hasPermission) {
        _log.warning('Microphone permission denied');
        return null;
      }

      // Tell the record package not to manage the AVAudioSession.
      // We configure it ourselves (playAndRecord) so simultaneous mic + speaker
      // playback works. Without this the package overrides back to .record-only.
      await _recorder.ios?.manageAudioSession(false);

      final stream = await _recorder.startStream(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: 16000,
          numChannels: 1,
        ),
      );

      _streaming = true;
      _log.info('PCM streaming started (16kHz, 16-bit signed, mono)');

      return stream.map((data) => Uint8List.fromList(data));
    } catch (e) {
      _log.severe('Failed to start PCM streaming', e);
      return null;
    }
  }

  /// Stop streaming.
  Future<void> stopStreaming() async {
    if (!_streaming) return;
    try {
      await _recorder.stop();
      _streaming = false;
      _log.info('PCM streaming stopped');
    } catch (e) {
      _log.severe('Failed to stop PCM streaming', e);
      _streaming = false;
    }
  }

  Future<void> dispose() async {
    await stopStreaming();
    await _recorder.dispose();
  }
}
