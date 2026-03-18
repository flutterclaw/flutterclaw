import 'dart:async';
import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.ios_background_audio');

/// Lightweight background audio helper used on iOS.
///
/// Provides a background-safe audio session so long-running assistant
/// activity can continue smoothly when the app is not in the foreground.
class IosBackgroundAudioService {
  static AudioPlayer? _player;
  static bool _isPlaying = false;
  static StreamSubscription<AudioInterruptionEvent>? _interruptionSub;
  static StreamSubscription<PlayerState>? _playerStateSub;

  /// Start unobtrusive background audio on iOS (no-op on other platforms).
  /// Returns true if the session started successfully, false otherwise.
  static Future<bool> start() async {
    if (!Platform.isIOS) {
      _log.fine('Background audio only needed on iOS');
      return true; // Not needed on non-iOS, so consider it successful
    }

    if (_isPlaying) {
      _log.fine('Background audio already playing');
      return true;
    }

    try {
      _log.info('Starting background audio service');

      // Configure audio session to mix with other apps (YouTube, Spotify, etc.)
      // Must be done before creating the player so just_audio respects this config.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playback,
        avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.mixWithOthers,
        avAudioSessionMode: AVAudioSessionMode.defaultMode,
        avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      ));

      // Listen for AVAudioSession interruptions (phone calls, other exclusive audio)
      await _interruptionSub?.cancel();
      _interruptionSub = session.interruptionEventStream.listen((event) {
        if (event.begin) {
          _log.info('Audio session interrupted (e.g. video/call)');
        } else {
          // Interruption ended — resume playback
          _log.info('Audio interruption ended, resuming background audio');
          _resumePlayback();
        }
      });

      _player = AudioPlayer();

      // Load the background audio asset from bundled resources with timeout
      await _player!.setAsset('assets/audio/silence.mp3')
          .timeout(const Duration(seconds: 3), onTimeout: () {
        _log.warning('setAsset timed out - continuing without background audio');
        throw TimeoutException('Audio loading timed out');
      });

      // Loop the background audio indefinitely
      await _player!.setLoopMode(LoopMode.one)
          .timeout(const Duration(seconds: 3), onTimeout: () {});

      // Set very low volume so playback remains unobtrusive for the user
      await _player!.setVolume(0.01)
          .timeout(const Duration(seconds: 3), onTimeout: () {});

      // Start playback
      await _player!.play()
          .timeout(const Duration(seconds: 5), onTimeout: () {});

      _isPlaying = true;

      // Watch for unexpected player stops (e.g. OS killed playback)
      await _playerStateSub?.cancel();
      _playerStateSub = _player!.playerStateStream.listen((playerState) {
        if (_isPlaying &&
            playerState.processingState == ProcessingState.idle &&
            !playerState.playing) {
          _log.warning('Background audio stopped unexpectedly, attempting resume');
          _resumePlayback();
        }
      });

      _log.info('Background audio started successfully');
      return true;
    } catch (e) {
      _log.warning('Background audio failed (non-fatal): $e');
      // Clean up player if it was created
      try {
        await _player?.dispose();
      } catch (_) {}
      _player = null;
      // Return true anyway - background audio is optional
      return true;
    }
  }

  /// Resume playback after an interruption or unexpected stop.
  static void _resumePlayback() async {
    if (!_isPlaying) return;
    try {
      if (_player != null) {
        await _player!.play()
            .timeout(const Duration(seconds: 5), onTimeout: () {});
        _log.info('Background audio resumed');
      } else {
        // Player was disposed somehow — restart fully
        _isPlaying = false;
        await start();
      }
    } catch (e) {
      _log.warning('Failed to resume background audio: $e');
    }
  }

  /// Stop background audio.
  static Future<void> stop() async {
    if (!Platform.isIOS) return;

    _isPlaying = false; // Set before cancelling subs to prevent spurious resumes

    await _interruptionSub?.cancel();
    _interruptionSub = null;
    await _playerStateSub?.cancel();
    _playerStateSub = null;

    if (_player == null) {
      _log.fine('Background audio not playing');
      return;
    }

    try {
      _log.info('Stopping background audio service');
      await _player!.stop();
      await _player!.dispose();
      _player = null;
      _log.info('Background audio stopped successfully');
    } catch (e, st) {
      _log.warning('Error stopping background audio', e, st);
    }
  }

  /// Check if background audio is currently playing.
  static bool get isPlaying => _isPlaying;
}
