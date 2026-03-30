/// Background audio service using audio_service + just_audio.
///
/// Provides lock-screen media controls and system media notifications.
/// Call [initAudioService] from main.dart before runApp().
library;

import 'dart:async';
import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

final _log = Logger('AudioPlayerService');

FlutterClawAudioHandler? _audioHandler;

/// Returns the active audio handler, or null if not initialized.
FlutterClawAudioHandler? get audioHandler => _audioHandler;

/// Initialize the audio service. Must be called before runApp().
Future<FlutterClawAudioHandler> initAudioService() async {
  _audioHandler = await AudioService.init(
    builder: () => FlutterClawAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'ai.flutterclaw.audio',
      androidNotificationChannelName: 'Audio',
      androidNotificationIcon: 'mipmap/ic_launcher',
      androidNotificationOngoing: false,
      androidStopForegroundOnPause: true,
    ),
  );
  return _audioHandler!;
}

/// AudioHandler that wraps a just_audio AudioPlayer with lock-screen controls.
class FlutterClawAudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  FlutterClawAudioHandler() {
    _player.playbackEventStream.map(_transformEvent).listen(
      (state) => playbackState.add(state),
    );
  }

  /// The underlying just_audio player (for direct control / state queries).
  AudioPlayer get player => _player;

  /// Load and start playback from a URL or local file path.
  Future<void> playUri(
    String uri, {
    String title = 'Audio',
    String? artist,
    Uri? artworkUri,
  }) async {
    mediaItem.add(MediaItem(
      id: uri,
      title: title,
      artist: artist,
      artUri: artworkUri,
    ));
    if (uri.startsWith('http://') || uri.startsWith('https://')) {
      await _player.setUrl(uri);
    } else {
      await _player.setFilePath(uri);
    }
    await _player.play();
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  Future<void> setVolume(double volume) => _player.setVolume(volume);

  /// A dedicated player for PCM stream playback (Live API audio output).
  /// Separate from [_player] so it doesn't interfere with media playback.
  AudioPlayer? _pcmPlayer;
  StreamSubscription? _pcmSubscription;

  /// Play a stream of raw PCM audio chunks (16-bit signed, little-endian).
  ///
  /// Used for real-time audio output from the Gemini Live API.
  /// Call [stopPcmStream] to stop playback (e.g. on barge-in).
  Future<void> playPcmStream(
    Stream<Uint8List> pcmChunks, {
    int sampleRate = 24000,
    int channels = 1,
    int bitsPerSample = 16,
  }) async {
    await stopPcmStream();

    _pcmPlayer = AudioPlayer();
    final source = _PcmStreamAudioSource(
      pcmChunks: pcmChunks,
      sampleRate: sampleRate,
      channels: channels,
      bitsPerSample: bitsPerSample,
    );

    try {
      await _pcmPlayer!.setAudioSource(source);
      await _pcmPlayer!.play();
    } catch (e) {
      _log.warning('PCM stream playback error: $e');
      await stopPcmStream();
    }
  }

  /// Stop PCM stream playback (e.g. for barge-in).
  Future<void> stopPcmStream() async {
    await _pcmSubscription?.cancel();
    _pcmSubscription = null;
    await _pcmPlayer?.stop();
    await _pcmPlayer?.dispose();
    _pcmPlayer = null;
  }

  /// Whether PCM stream is currently playing.
  bool get isPcmPlaying => _pcmPlayer?.playing ?? false;

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
      ],
      systemActions: const {MediaAction.seek},
      androidCompactActionIndices: const [0, 1],
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
    );
  }
}

/// A [StreamAudioSource] that wraps incoming raw PCM chunks with a WAV header
/// for playback via just_audio.
///
/// Collects PCM data from the stream and presents it as a single WAV to the
/// player. The player buffers and plays as data arrives.
class _PcmStreamAudioSource extends StreamAudioSource {
  final Stream<Uint8List> pcmChunks;
  final int sampleRate;
  final int channels;
  final int bitsPerSample;

  final _buffer = BytesBuilder(copy: false);
  Completer<void>? _done;
  StreamSubscription? _sub;
  bool _started = false;

  _PcmStreamAudioSource({
    required this.pcmChunks,
    this.sampleRate = 24000,
    this.channels = 1,
    this.bitsPerSample = 16,
  });

  void _ensureListening() {
    if (_started) return;
    _started = true;
    _done = Completer<void>();
    _sub = pcmChunks.listen(
      (chunk) => _buffer.add(chunk),
      onDone: () => _done?.complete(),
      onError: (e) => _done?.completeError(e),
    );
  }

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    _ensureListening();

    // Wait for the stream to finish so we know the full length.
    await _done?.future;

    final pcmBytes = _buffer.toBytes();
    final wavBytes = _buildWav(pcmBytes);

    final effectiveStart = start ?? 0;
    final effectiveEnd = end ?? wavBytes.length;

    return StreamAudioResponse(
      sourceLength: wavBytes.length,
      contentLength: effectiveEnd - effectiveStart,
      offset: effectiveStart,
      stream: Stream.value(
        wavBytes.sublist(effectiveStart, effectiveEnd),
      ),
      contentType: 'audio/wav',
    );
  }

  Uint8List _buildWav(Uint8List pcmData) {
    final byteRate = sampleRate * channels * (bitsPerSample ~/ 8);
    final blockAlign = channels * (bitsPerSample ~/ 8);
    final dataSize = pcmData.length;
    final fileSize = 36 + dataSize;

    final header = ByteData(44);
    // RIFF header
    header.setUint8(0, 0x52); // R
    header.setUint8(1, 0x49); // I
    header.setUint8(2, 0x46); // F
    header.setUint8(3, 0x46); // F
    header.setUint32(4, fileSize, Endian.little);
    header.setUint8(8, 0x57); // W
    header.setUint8(9, 0x41); // A
    header.setUint8(10, 0x56); // V
    header.setUint8(11, 0x45); // E
    // fmt sub-chunk
    header.setUint8(12, 0x66); // f
    header.setUint8(13, 0x6D); // m
    header.setUint8(14, 0x74); // t
    header.setUint8(15, 0x20); // (space)
    header.setUint32(16, 16, Endian.little); // sub-chunk size
    header.setUint16(20, 1, Endian.little); // PCM format
    header.setUint16(22, channels, Endian.little);
    header.setUint32(24, sampleRate, Endian.little);
    header.setUint32(28, byteRate, Endian.little);
    header.setUint16(32, blockAlign, Endian.little);
    header.setUint16(34, bitsPerSample, Endian.little);
    // data sub-chunk
    header.setUint8(36, 0x64); // d
    header.setUint8(37, 0x61); // a
    header.setUint8(38, 0x74); // t
    header.setUint8(39, 0x61); // a
    header.setUint32(40, dataSize, Endian.little);

    final wav = Uint8List(44 + dataSize);
    wav.setRange(0, 44, header.buffer.asUint8List());
    wav.setRange(44, 44 + dataSize, pcmData);
    return wav;
  }

  Future<void> dispose() async {
    await _sub?.cancel();
  }
}
