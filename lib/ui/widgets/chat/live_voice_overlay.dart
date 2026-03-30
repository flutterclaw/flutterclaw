/// Non-blocking overlay for Gemini Live voice: animated rings and status over the
/// existing chat list. Transcript text streams into [chatProvider] via live agent
/// events; tool pills still arrive from [SessionManager.messageStream]. Session
/// persistence runs on [LiveTurnComplete] (and before tool rows when applicable).
library;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/core/agent/live_agent_loop.dart';
import 'package:flutterclaw/generated/app_localizations.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

/// Live call chrome heights — keep in sync with [LiveVoiceOverlay.listTopPaddingWhenLive].
const double _kLiveHeaderHeight = 52;
const double _kLiveHudHeight = 80;

class LiveVoiceOverlay extends ConsumerStatefulWidget {
  const LiveVoiceOverlay({super.key});

  /// Extra top padding for the chat [ListView] so messages sit below the live header + HUD.
  static const double listTopPaddingWhenLive =
      _kLiveHeaderHeight + _kLiveHudHeight;

  @override
  ConsumerState<LiveVoiceOverlay> createState() => _LiveVoiceOverlayState();
}

class _LiveVoiceOverlayState extends ConsumerState<LiveVoiceOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _ring1Controller;
  late final AnimationController _ring2Controller;
  late final AnimationController _ring3Controller;

  StreamSubscription? _eventSub;

  bool _modelSpeaking = false;
  bool _isConnecting = true;
  String? _activeTool;

  // --- Audio ---
  final List<int> _pcmBuffer = [];

  /// Gapless playlist — segments are appended while the player is running.
  /// Null means the player is idle and the next segment must create a new source.
  ConcatenatingAudioSource? _livePlaylist;

  /// Resets [_livePlaylist] when the player finishes naturally.
  StreamSubscription? _playerCompleteSub;

  /// True after [play] until local output is fully done (see [_armPlaybackEndListener]).
  bool _awaitingLocalPlaybackEnd = false;
  Timer? _playbackEndDebounce;

  /// Mic is cut for the current assistant audio stream (first [LiveAudioOutput] → playback end).
  bool _micHoldForAssistantPcm = false;

  /// Playback must have reached [PlayerState.playing] before we trust idle/completed as "done"
  /// (iOS often reports idle/!playing briefly right after [play]).
  bool _sawPlayerAudibleThisArm = false;
  StreamSubscription<PlayerState>? _playerStateSub;

  /// Bytes queued into [_livePlaylist] since the last [needsNew] reset.
  /// play() is deferred until this exceeds [_kStartThreshold] to avoid
  /// buffer-underrun glitches at the beginning of each turn.
  int _prerollBytes = 0;
  bool _playerStarted = false;

  /// True once [LiveTurnComplete] arrives; gates the debounce end-of-playback reset
  /// so a brief gap between segments mid-turn doesn't prematurely clear the pipeline.
  bool _networkTurnComplete = false;

  /// True once [player.setAudioSource] has been called for the current turn's
  /// [_livePlaylist]; used to distinguish "first start" from "resume after gap".
  bool _playlistLoadedIntoPlayer = false;

  /// Serializes WAV write + [ConcatenatingAudioSource.add] so segment order matches PCM order.
  Future<void> _wavQueueTail = Future.value();

  /// Incremented in [_stopAndClearAudio] so in-flight queue steps exit without touching state.
  int _liveAudioGeneration = 0;

  /// Flush interval: 24 kHz × 2 B × 1.5 s = 72 000 bytes (fewer WAV handoffs at turn start).
  static const int _kFlushBytes = 72000;

  /// Preroll before first [play]: 3 s at 24 kHz mono 16-bit (144 000 B); extra headroom vs decoder/OS underrun.
  static const int _kStartThreshold = 144000;

  final List<String> _tempFiles = [];

  /// Dedicated player: avoids audio_service main [AudioPlayer] contention and uses heavier OS buffering.
  late final AudioPlayer _livePlayer;

  Directory? _cachedTempDir;

  @override
  void initState() {
    super.initState();

    // Do not let just_audio reconfigure the session: [LiveSessionNotifier]
    // already sets playAndRecord + voiceChat for AEC; a second activation
    // fight breaks echo cancellation and can leak speaker audio to the mic path.
    _livePlayer = AudioPlayer(
      handleAudioSessionActivation: false,
      audioLoadConfiguration: AudioLoadConfiguration(
        darwinLoadControl: DarwinLoadControl(
          automaticallyWaitsToMinimizeStalling: false,
          preferredForwardBufferDuration: Duration(seconds: 2),
        ),
        androidLoadControl: AndroidLoadControl(
          minBufferDuration: Duration(milliseconds: 2000),
          maxBufferDuration: Duration(seconds: 10),
          bufferForPlaybackDuration: Duration(milliseconds: 250),
          bufferForPlaybackAfterRebufferDuration: Duration(milliseconds: 500),
        ),
      ),
    );

    _ring1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _ring2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _ring2Controller.repeat(reverse: true);
    });

    _ring3Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _ring3Controller.repeat(reverse: true);
    });

    _subscribeToEvents();
  }

  void _subscribeToEvents() {
    final notifier = ref.read(liveSessionProvider.notifier);
    _eventSub = notifier.agentEvents.listen(
      (event) {
      if (!mounted) return;
      switch (event) {
        case LiveAudioOutput(:final pcmData):
          // Cut mic as soon as assistant PCM arrives — during preroll the speaker is
          // still silent locally but the server is already in "model speaking"; sending
          // mic here triggers spurious LiveInterrupted / cut-off on the first word.
          if (!_micHoldForAssistantPcm && mounted) {
            _micHoldForAssistantPcm = true;
            ref.read(liveSessionProvider.notifier).setLivePlaybackSuppressMic(true);
          }
          _pcmBuffer.addAll(pcmData);
          if (!_modelSpeaking) {
            setState(() {
              _modelSpeaking = true;
              _isConnecting = false;
            });
          }
          if (_pcmBuffer.length >= _kFlushBytes) _flushSegment();

        case LiveUserTranscript():
          setState(() => _isConnecting = false);

        case LiveModelTranscript():
          setState(() => _isConnecting = false);

        case LiveToolStarted(:final name):
          setState(() => _activeTool = name);

        case LiveToolCompleted(:final name):
          if (_activeTool == name) setState(() => _activeTool = null);

        case LiveTurnComplete():
          _networkTurnComplete = true;
          if (_pcmBuffer.isEmpty && _livePlaylist == null && !_playerStarted) {
            // Audio was already cleared (e.g. by a preceding LiveInterrupted).
            if (_micHoldForAssistantPcm) {
              _micHoldForAssistantPcm = false;
              ref.read(liveSessionProvider.notifier).setLivePlaybackSuppressMic(false);
            }
            if (_modelSpeaking) setState(() => _modelSpeaking = false);
            return;
          }
          _flushSegment();
          _enqueueEnsurePlaybackStarted();
          setState(() => _modelSpeaking = false);

        case LiveInterrupted():
          _stopAndClearAudio();
          setState(() => _modelSpeaking = false);

        case LiveAgentError(:final message):
          final messenger = ScaffoldMessenger.maybeOf(context);
          messenger?.showSnackBar(SnackBar(content: Text(message)));

        case LiveSessionDisconnected():
          _stopAndClearAudio();

        case LiveSessionReady():
          setState(() => _isConnecting = false);
      }
      },
      onError: (Object error, StackTrace stack) {
        debugPrint('[LiveAudio] agent event stream error: $error');
        if (mounted) _stopAndClearAudio();
      },
    );
  }

  // --- Audio helpers ---

  void _flushSegment() {
    if (_pcmBuffer.isEmpty) return;
    final pcm = Uint8List.fromList(_pcmBuffer);
    _pcmBuffer.clear();
    final gen = _liveAudioGeneration;
    _wavQueueTail = _wavQueueTail.then((_) async {
      if (gen != _liveAudioGeneration) return;
      try {
        await _writeAndQueueWavInternal(pcm, gen);
      } catch (e) {
        debugPrint('[LiveAudio] queue error: $e');
      }
    });
  }

  /// After [LiveTurnComplete], play any buffered audio even if below [_kStartThreshold] (short replies).
  void _enqueueEnsurePlaybackStarted() {
    final gen = _liveAudioGeneration;
    _wavQueueTail = _wavQueueTail.then((_) async {
      if (gen != _liveAudioGeneration) return;
      try {
        await _ensurePlaybackStartedIfNeeded(gen);
      } catch (e) {
        debugPrint('[LiveAudio] ensure play error: $e');
      }
    });
  }

  /// Write [pcm] as a WAV segment and append it to the gapless playlist.
  ///
  /// The first segment initialises the [ConcatenatingAudioSource] and starts
  /// the player once preroll is met; subsequent segments are appended while
  /// playback is already running.
  Future<void> _writeAndQueueWavInternal(Uint8List pcm, int gen) async {
    if (gen != _liveAudioGeneration) return;

    final needsNew = _livePlaylist == null;
    if (needsNew) {
      if (gen != _liveAudioGeneration) return;
      _livePlaylist = ConcatenatingAudioSource(
        children: [],
        useLazyPreparation: false,
      );
      _prerollBytes = 0;
      _playerStarted = false;
    }
    final playlist = _livePlaylist!;

    try {
      final wav = _buildWav(pcm);
      _cachedTempDir ??= await getTemporaryDirectory();
      final dir = _cachedTempDir!;
      if (gen != _liveAudioGeneration) return;
      final path =
          '${dir.path}/live_${DateTime.now().microsecondsSinceEpoch}.wav';
      await File(path).writeAsBytes(wav);
      if (gen != _liveAudioGeneration) return;
      _tempFiles.add(path);

      await playlist.add(AudioSource.file(path));
      if (gen != _liveAudioGeneration) return;
      _prerollBytes += pcm.length;

      if (!_playerStarted) {
        if (_playlistLoadedIntoPlayer) {
          await _resumeFromGap(_livePlayer, gen);
        } else if (_prerollBytes >= _kStartThreshold) {
          await _startConcatenatedPlayback(_livePlayer, gen);
        }
      }
    } catch (e) {
      debugPrint('[LiveAudio] write error: $e');
      if (needsNew) _livePlaylist = null;
    }
  }

  Future<void> _ensurePlaybackStartedIfNeeded(int gen) async {
    if (gen != _liveAudioGeneration) return;
    if (_playerStarted) return;
    final playlist = _livePlaylist;
    if (playlist == null || playlist.children.isEmpty) return;
    if (_playlistLoadedIntoPlayer) {
      await _resumeFromGap(_livePlayer, gen);
    } else {
      await _startConcatenatedPlayback(_livePlayer, gen);
    }
  }

  Future<void> _startConcatenatedPlayback(AudioPlayer player, int gen) async {
    if (gen != _liveAudioGeneration || _playerStarted) return;
    final playlist = _livePlaylist;
    if (playlist == null || playlist.children.isEmpty) return;
    _playerStarted = true;
    try {
      if (gen != _liveAudioGeneration) {
        _playerStarted = false;
        return;
      }
      await player.setAudioSource(playlist);
      if (gen != _liveAudioGeneration) {
        _playerStarted = false;
        return;
      }
      _playlistLoadedIntoPlayer = true;
      await player.play();
      if (mounted) {
        ref
            .read(liveSessionProvider.notifier)
            .setLivePlaybackSuppressMic(true);
      }
      _armPlaybackEndListener(gen);
    } catch (e) {
      debugPrint('[LiveAudio] playback start error: $e');
      _playerStarted = false;
      _awaitingLocalPlaybackEnd = false;
      _playbackEndDebounce?.cancel();
      if (mounted) {
        ref.read(liveSessionProvider.notifier).setLivePlaybackSuppressMic(false);
      }
    }
  }

  /// Resume playback after a mid-turn gap: seek to the newly added segment and play.
  /// Avoids calling [setAudioSource] again (which would reset position to the start).
  Future<void> _resumeFromGap(AudioPlayer player, int gen) async {
    if (gen != _liveAudioGeneration || _playerStarted) return;
    final playlist = _livePlaylist;
    if (playlist == null || playlist.children.isEmpty) return;
    _playerStarted = true;
    try {
      if (gen != _liveAudioGeneration) {
        _playerStarted = false;
        return;
      }
      await player.seek(Duration.zero, index: playlist.length - 1);
      if (gen != _liveAudioGeneration) {
        _playerStarted = false;
        return;
      }
      await player.play();
      _armPlaybackEndListener(gen);
    } catch (e) {
      debugPrint('[LiveAudio] resume from gap error: $e');
      _playerStarted = false;
    }
  }

  /// Unsuppress mic after playback. Uses [completed] or [idle] when not playing
  /// — `.first` on `completed` alone can fire too early on iOS or never after
  /// [stop], leaving the mic dead for the whole call.
  void _armPlaybackEndListener(int gen) {
    _playerCompleteSub?.cancel();
    _playerStateSub?.cancel();
    _playbackEndDebounce?.cancel();
    _awaitingLocalPlaybackEnd = true;
    _sawPlayerAudibleThisArm = false;
    _playerStateSub = _livePlayer.playerStateStream.listen((ps) {
      if (!mounted || gen != _liveAudioGeneration) return;
      if (ps.playing) _sawPlayerAudibleThisArm = true;
    });
    _playerCompleteSub = _livePlayer.processingStateStream.listen((state) {
      if (!mounted || gen != _liveAudioGeneration || !_awaitingLocalPlaybackEnd) {
        return;
      }
      // Ignore idle/complete until audio has actually started — avoids iOS firing
      // idle+!playing in the gap between setSource and audible output.
      if (!_sawPlayerAudibleThisArm) return;
      final likelyDone = state == ProcessingState.completed ||
          (state == ProcessingState.idle && !_livePlayer.playing);
      if (!likelyDone) return;

      if (!_networkTurnComplete) {
        // Network turn isn't done: player ran dry between segments (segment gap).
        // Mark as stopped so the next _writeAndQueueWavInternal triggers _resumeFromGap.
        // Do NOT reset _livePlaylist or _playlistLoadedIntoPlayer — we'll resume in-place.
        _awaitingLocalPlaybackEnd = false;
        _playerStarted = false;
        _playerCompleteSub?.cancel();
        _playerCompleteSub = null;
        _playerStateSub?.cancel();
        _playerStateSub = null;
        return;
      }

      _playbackEndDebounce?.cancel();
      _playbackEndDebounce = Timer(const Duration(milliseconds: 180), () {
        _playbackEndDebounce = null;
        if (!mounted || gen != _liveAudioGeneration || !_awaitingLocalPlaybackEnd) {
          return;
        }
        _awaitingLocalPlaybackEnd = false;
        _playerStarted = false;
        _micHoldForAssistantPcm = false;
        _livePlaylist = null;
        _playlistLoadedIntoPlayer = false;
        _networkTurnComplete = false;
        _playerStateSub?.cancel();
        _playerStateSub = null;
        ref
            .read(liveSessionProvider.notifier)
            .scheduleMicUnsuppressAfterLocalPlayback();
      });
    });
  }

  void _stopAndClearAudio() {
    _liveAudioGeneration++;
    _wavQueueTail = Future.value();
    _playbackEndDebounce?.cancel();
    _playbackEndDebounce = null;
    _awaitingLocalPlaybackEnd = false;
    _micHoldForAssistantPcm = false;
    _playerStateSub?.cancel();
    _playerStateSub = null;
    _playerCompleteSub?.cancel();
    _playerCompleteSub = null;
    _pcmBuffer.clear();
    _livePlaylist = null;
    _prerollBytes = 0;
    _playerStarted = false;
    _networkTurnComplete = false;
    _playlistLoadedIntoPlayer = false;
    for (final f in List.of(_tempFiles)) {
      File(f).delete().ignore();
    }
    _tempFiles.clear();
    unawaited(_livePlayer.stop().catchError((_) {}));
    if (mounted) {
      ref.read(liveSessionProvider.notifier).setLivePlaybackSuppressMic(false);
    }
  }

  Future<void> _endSession() async {
    _stopAndClearAudio();
    await ref.read(liveSessionProvider.notifier).stopSession();
    if (mounted) {
      await ref.read(chatProvider.notifier).reloadHistory();
    }
  }

  @override
  void dispose() {
    _liveAudioGeneration++;
    _wavQueueTail = Future.value();
    _ring1Controller.dispose();
    _ring2Controller.dispose();
    _ring3Controller.dispose();
    _eventSub?.cancel();
    _playbackEndDebounce?.cancel();
    _playerStateSub?.cancel();
    _playerCompleteSub?.cancel();
    for (final f in _tempFiles) {
      File(f).delete().ignore();
    }
    unawaited(_livePlayer.dispose().catchError((_) {}));
    super.dispose();
  }

  // --- UI ---

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final agent = ref.watch(activeAgentProvider);
    final topBarColor = theme.colorScheme.surface.withValues(alpha: 0.97);

    // Only top chrome: chat list scrolls in the clear area below (with matching padding).
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        color: topBarColor,
        elevation: 2,
        shadowColor: Colors.black26,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _kLiveHeaderHeight,
              child: _buildHeader(theme, agent),
            ),
            SizedBox(
              height: _kLiveHudHeight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppTokens.spacingMD,
                  0,
                  AppTokens.spacingMD,
                  AppTokens.spacingSM,
                ),
                child: _buildCompactHud(theme, agent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, dynamic agent) {
    final agentName =
        (agent != null && (agent.name as String).isNotEmpty) ? agent.name as String : 'Live';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.spacingMD),
      child: Row(
        children: [
          Text(
            agentName,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: AppTokens.spacingSM),
          _LiveBadge(theme: theme),
          const Spacer(),
          IconButton(
            onPressed: _endSession,
            iconSize: 20,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.errorContainer,
              foregroundColor: theme.colorScheme.onErrorContainer,
            ),
            icon: const Icon(Icons.call_end),
            tooltip: 'End conversation',
          ),
        ],
      ),
    );
  }

  /// Compact row: small rings + status; fits in [_hudHeight] so it never overlaps bubbles.
  Widget _buildCompactHud(ThemeData theme, dynamic agent) {
    final agentEmoji =
        (agent != null && (agent.emoji as String).isNotEmpty) ? agent.emoji as String : '🎙';

    final Color ringColor;
    final double minScale;
    final double maxScale;
    final double minOpacity;
    final double maxOpacity;
    final Duration pulseDuration;

    if (_isConnecting) {
      ringColor = theme.colorScheme.outline;
      minScale = 0.95;
      maxScale = 1.05;
      minOpacity = 0.12;
      maxOpacity = 0.32;
      pulseDuration = const Duration(milliseconds: 1200);
    } else if (_modelSpeaking) {
      ringColor = theme.colorScheme.tertiary;
      minScale = 0.88;
      maxScale = 1.12;
      minOpacity = 0.28;
      maxOpacity = 0.65;
      pulseDuration = const Duration(milliseconds: 700);
    } else {
      ringColor = theme.colorScheme.primary;
      minScale = 0.95;
      maxScale = 1.05;
      minOpacity = 0.18;
      maxOpacity = 0.38;
      pulseDuration = const Duration(milliseconds: 1400);
    }

    if (_ring1Controller.duration != pulseDuration) {
      _ring1Controller.duration = pulseDuration;
      _ring2Controller.duration = pulseDuration;
      _ring3Controller.duration = pulseDuration;
    }

    final statusText = _isConnecting
        ? 'Connecting…'
        : _modelSpeaking
            ? 'Speaking…'
            : 'Listening…';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 64,
          height: 64,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              _AnimatedRing(
                controller: _ring3Controller,
                size: 56,
                color: ringColor,
                minScale: minScale,
                maxScale: maxScale,
                minOpacity: minOpacity * 0.6,
                maxOpacity: maxOpacity * 0.6,
              ),
              _AnimatedRing(
                controller: _ring2Controller,
                size: 44,
                color: ringColor,
                minScale: minScale,
                maxScale: maxScale,
                minOpacity: minOpacity * 0.85,
                maxOpacity: maxOpacity * 0.85,
              ),
              _AnimatedRing(
                controller: _ring1Controller,
                size: 32,
                color: ringColor,
                minScale: minScale,
                maxScale: maxScale,
                minOpacity: minOpacity,
                maxOpacity: maxOpacity,
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ringColor.withValues(alpha: 0.18),
                  border: Border.all(
                    color: ringColor.withValues(alpha: 0.45),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    agentEmoji,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppTokens.spacingSM),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (_modelSpeaking && !_isConnecting) ...[
                const SizedBox(height: 2),
                Text(
                  AppLocalizations.of(context)!.liveVoiceBargeInHint,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 10,
                    height: 1.15,
                  ),
                ),
              ],
              if (_activeTool != null) ...[
                const SizedBox(height: 4),
                Text(
                  _activeTool!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  static Uint8List _buildWav(Uint8List pcm,
      {int sampleRate = 24000, int channels = 1, int bitsPerSample = 16}) {
    final byteRate = sampleRate * channels * (bitsPerSample ~/ 8);
    final blockAlign = channels * (bitsPerSample ~/ 8);
    final dataSize = pcm.length;
    final header = ByteData(44);
    void s(int o, int v) => header.setUint8(o, v);
    void u16(int o, int v) => header.setUint16(o, v, Endian.little);
    void u32(int o, int v) => header.setUint32(o, v, Endian.little);
    s(0, 0x52); s(1, 0x49); s(2, 0x46); s(3, 0x46);
    u32(4, 36 + dataSize);
    s(8, 0x57); s(9, 0x41); s(10, 0x56); s(11, 0x45);
    s(12, 0x66); s(13, 0x6D); s(14, 0x74); s(15, 0x20);
    u32(16, 16); u16(20, 1); u16(22, channels);
    u32(24, sampleRate); u32(28, byteRate); u16(32, blockAlign);
    u16(34, bitsPerSample);
    s(36, 0x64); s(37, 0x61); s(38, 0x74); s(39, 0x61);
    u32(40, dataSize);
    final wav = Uint8List(44 + dataSize);
    wav.setRange(0, 44, header.buffer.asUint8List());
    wav.setRange(44, 44 + dataSize, pcm);
    return wav;
  }
}

// --- Subwidgets ---

class _LiveBadge extends StatelessWidget {
  final ThemeData theme;
  const _LiveBadge({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppTokens.radiusPill),
        border: Border.all(
          color: Colors.deepPurple.withValues(alpha: 0.4),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.spatial_audio, size: 10, color: Colors.deepPurple.shade300),
          const SizedBox(width: 3),
          Text(
            'LIVE',
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.deepPurple.shade300,
              fontWeight: FontWeight.w700,
              fontSize: 9,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedRing extends AnimatedWidget {
  final double size;
  final Color color;
  final double minScale;
  final double maxScale;
  final double minOpacity;
  final double maxOpacity;

  const _AnimatedRing({
    required AnimationController controller,
    required this.size,
    required this.color,
    required this.minScale,
    required this.maxScale,
    required this.minOpacity,
    required this.maxOpacity,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    final t = (listenable as AnimationController).value;
    final scale = minScale + (maxScale - minScale) * t;
    final opacity = minOpacity + (maxOpacity - minOpacity) * t;
    return Transform.scale(
      scale: scale,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
