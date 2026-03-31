/// Short sound effects for live call lifecycle events (connect / end).
///
/// Tones are generated programmatically as raw PCM — no asset files needed.
/// Uses a dedicated [AudioPlayer] with [handleAudioSessionActivation: false]
/// so it never fights the [playAndRecord] / [voiceChat] session that
/// [LiveSessionNotifier.startSession] configures.
library;

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class CallSfxService {
  AudioPlayer? _player;

  AudioPlayer _getPlayer() {
    _player ??= AudioPlayer(handleAudioSessionActivation: false);
    return _player!;
  }

  /// Two ascending beeps (440 Hz → 587 Hz) — signals a successful connection.
  Future<void> playConnected() async {
    try {
      final pcm = _buildConnectedTone();
      final wav = _wrapWav(pcm);
      await _play(wav);
    } catch (e) {
      debugPrint('[CallSfx] playConnected error: $e');
    }
  }

  /// One short descending tone (440 Hz → 330 Hz) — signals call ended.
  Future<void> playEnded() async {
    try {
      final pcm = _buildEndedTone();
      final wav = _wrapWav(pcm);
      await _play(wav);
    } catch (e) {
      debugPrint('[CallSfx] playEnded error: $e');
    }
  }

  Future<void> _play(Uint8List wav) async {
    final player = _getPlayer();
    await player.setVolume(0.5);
    await player.setAudioSource(_BufferAudioSource(wav));
    await player.play();
  }

  // ---------------------------------------------------------------------------
  // Tone builders
  // ---------------------------------------------------------------------------

  /// 440 Hz (130 ms) + 30 ms silence + 587 Hz (150 ms).
  Uint8List _buildConnectedTone() {
    final out = <double>[];
    _addSineTone(out, freq: 440, durationMs: 130, fadeMs: 10);
    _addSilence(out, durationMs: 30);
    _addSineTone(out, freq: 587, durationMs: 150, fadeMs: 10);
    return _doublesToPcm16(out);
  }

  /// 440 Hz → 330 Hz glide over 220 ms.
  Uint8List _buildEndedTone() {
    const sr = 44100;
    const durationMs = 220;
    const samples = (sr * durationMs) ~/ 1000;
    final out = <double>[];
    for (var i = 0; i < samples; i++) {
      final t = i / sr;
      final progress = i / samples;
      final freq = 440.0 - 110.0 * progress; // 440 → 330
      final amp = 0.38 * _envelope(i, samples, fadeMs: 12);
      out.add(amp * math.sin(2 * math.pi * freq * t));
    }
    return _doublesToPcm16(out);
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static const int _kSampleRate = 44100;

  void _addSineTone(
    List<double> out, {
    required double freq,
    required int durationMs,
    int fadeMs = 10,
  }) {
    final samples = (_kSampleRate * durationMs) ~/ 1000;
    for (var i = 0; i < samples; i++) {
      final t = i / _kSampleRate;
      final amp = 0.38 * _envelope(i, samples, fadeMs: fadeMs);
      out.add(amp * math.sin(2 * math.pi * freq * t));
    }
  }

  void _addSilence(List<double> out, {required int durationMs}) {
    final samples = (_kSampleRate * durationMs) ~/ 1000;
    for (var i = 0; i < samples; i++) {
      out.add(0.0);
    }
  }

  double _envelope(int i, int total, {required int fadeMs}) {
    final fadeSamples = (_kSampleRate * fadeMs) ~/ 1000;
    if (i < fadeSamples) return i / fadeSamples;
    if (i > total - fadeSamples) return (total - i) / fadeSamples;
    return 1.0;
  }

  Uint8List _doublesToPcm16(List<double> samples) {
    final out = ByteData(samples.length * 2);
    for (var i = 0; i < samples.length; i++) {
      final v = (samples[i] * 32767).clamp(-32768, 32767).round();
      out.setInt16(i * 2, v, Endian.little);
    }
    return out.buffer.asUint8List();
  }

  Uint8List _wrapWav(Uint8List pcm) {
    const channels = 1;
    const bitsPerSample = 16;
    const byteRate = _kSampleRate * channels * bitsPerSample ~/ 8;
    const blockAlign = channels * bitsPerSample ~/ 8;
    final dataSize = pcm.length;

    final header = ByteData(44);
    // RIFF
    header.setUint8(0, 0x52); header.setUint8(1, 0x49);
    header.setUint8(2, 0x46); header.setUint8(3, 0x46);
    header.setUint32(4, 36 + dataSize, Endian.little);
    header.setUint8(8, 0x57); header.setUint8(9, 0x41);
    header.setUint8(10, 0x56); header.setUint8(11, 0x45);
    // fmt
    header.setUint8(12, 0x66); header.setUint8(13, 0x6D);
    header.setUint8(14, 0x74); header.setUint8(15, 0x20);
    header.setUint32(16, 16, Endian.little);
    header.setUint16(20, 1, Endian.little);
    header.setUint16(22, channels, Endian.little);
    header.setUint32(24, _kSampleRate, Endian.little);
    header.setUint32(28, byteRate, Endian.little);
    header.setUint16(32, blockAlign, Endian.little);
    header.setUint16(34, bitsPerSample, Endian.little);
    // data
    header.setUint8(36, 0x64); header.setUint8(37, 0x61);
    header.setUint8(38, 0x74); header.setUint8(39, 0x61);
    header.setUint32(40, dataSize, Endian.little);

    final result = Uint8List(44 + pcm.length);
    result.setAll(0, header.buffer.asUint8List());
    result.setAll(44, pcm);
    return result;
  }

  void dispose() {
    _player?.dispose();
    _player = null;
  }
}

// ---------------------------------------------------------------------------
// Simple in-memory StreamAudioSource for just_audio.
// ---------------------------------------------------------------------------

class _BufferAudioSource extends StreamAudioSource {
  final Uint8List _buffer;
  _BufferAudioSource(this._buffer);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final s = start ?? 0;
    final e = end ?? _buffer.length;
    return StreamAudioResponse(
      sourceLength: _buffer.length,
      contentLength: e - s,
      offset: s,
      stream: Stream.value(_buffer.sublist(s, e)),
      contentType: 'audio/wav',
    );
  }
}
