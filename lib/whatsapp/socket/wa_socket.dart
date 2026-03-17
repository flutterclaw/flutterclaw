import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:cryptography/cryptography.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/auth_state.dart';
import '../binary/encoder.dart';
import '../binary/types.dart';
import '../noise/noise_handler.dart';
import '../proto/wa_proto.pb.dart';
import 'keepalive.dart';
import 'wa_socket_config.dart';

/// Connection state of the WhatsApp WebSocket.
enum WAConnectionState { disconnected, connecting, connected, closing }

/// Event emitted when connection state changes.
class ConnectionUpdate {
  final WAConnectionState state;
  final String? qr;
  final Object? lastDisconnect;

  const ConnectionUpdate({required this.state, this.qr, this.lastDisconnect});
}

typedef NodeHandler = Future<void> Function(BinaryNode node);

/// Low-level WhatsApp WebSocket + Noise transport.
///
/// Responsibilities:
/// - Connect to WhatsApp WebSocket.
/// - Perform Noise XX handshake.
/// - Send / receive length-prefixed encrypted BinaryNode frames.
/// - Maintain a query table for request/response correlation.
/// - Keepalive pings.
///
/// Higher-level auth and message logic live in auth/ and messages/.
class WASocket {
  final WASocketConfig config;

  /// Long-term noise key pair (persisted in auth state).
  /// Mutable so it can be refreshed when the server rejects with 405/401.
  SimpleKeyPair noiseKey;

  WAConnectionState _state = WAConnectionState.disconnected;
  WebSocketChannel? _channel;
  NoiseHandler? _noiseHandler;
  KeepAlive? _keepalive;
  StreamSubscription<dynamic>? _wsSub;

  /// Pending queries: tag → completer.
  final _queries = <String, Completer<BinaryNode>>{};

  /// Registered node event handlers (tag → list of handlers).
  final _handlers = <String, List<NodeHandler>>{};

  /// Stream of connection state updates for the channel adapter / UI.
  final _connectionUpdates = StreamController<ConnectionUpdate>.broadcast();
  Stream<ConnectionUpdate> get connectionUpdates => _connectionUpdates.stream;

  int _msgTag = 0;
  int _retryCount = 0;

  /// Whether this is a passive reconnect (existing paired session).
  final bool passive;

  /// Credentials used to build devicePairingData for fresh (non-passive) connections.
  final AuthenticationCreds? creds;

  /// Called when the server rejects with an auth failure (405/401).
  /// Should regenerate the noise key, persist creds, and return the new key.
  final Future<SimpleKeyPair?> Function(int reason)? onKeyRefreshNeeded;

  /// WhatsApp companion-device version from Baileys' baileys-version.json.
  /// Do NOT use the check-update endpoint — it returns the browser-app version.
  static const _waVersion = [2, 3000, 1035194821];

  /// Guards against double-scheduling a reconnect when both a `<failure>` node
  /// and the subsequent WebSocket close both call _scheduleReconnect.
  bool _reconnectPending = false;

  /// When true, use an extended backoff (30–300 s) instead of the normal 2–60 s.
  /// Set on stream:error code=500 (server rate-limit / internal error).
  bool _longBackoff = false;

  WASocket({
    required this.config,
    required this.noiseKey,
    this.passive = false,
    this.creds,
    this.onKeyRefreshNeeded,
  });

  WAConnectionState get state => _state;

  // ---------------------------------------------------------------------------
  // Connect / disconnect
  // ---------------------------------------------------------------------------

  /// Connect (or reconnect) to WhatsApp.
  Future<void> connect() async {
    if (_state == WAConnectionState.connecting ||
        _state == WAConnectionState.connected) {
      return;
    }
    _setState(WAConnectionState.connecting);
    config.logger.info(
        'Using WA version ${_waVersion.join('.')} (passive=$passive)');

    try {
      // Build Noise handler for this connection attempt.
      final noise =
          await NoiseHandler.create(routingInfo: config.routingInfo);
      _noiseHandler = noise;

      // Open WebSocket with headers that WhatsApp requires.
      // web_socket_channel.connect() doesn't support headers; use dart:io directly.
      final ws = await WebSocket.connect(
        config.url,
        headers: {
          'Origin': 'https://web.whatsapp.com',
          'Host': 'web.whatsapp.com',
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) '
              'AppleWebKit/537.36 (KHTML, like Gecko) '
              'Chrome/127.0.0.0 Safari/537.36',
        },
      );
      _channel = IOWebSocketChannel(ws);

      // Send client hello (intro frame with our ephemeral public key).
      await _sendClientHello(noise);

      // Listen for incoming frames.
      _wsSub = _channel!.stream.listen(
        _onRawData,
        onError: _onWsError,
        onDone: _onWsDone,
        cancelOnError: false,
      );

      config.logger.info('WebSocket opened, waiting for server hello');
    } catch (e, st) {
      config.logger.severe('Connect failed', e, st);
      await _scheduleReconnect();
    }
  }

  /// Cleanly close the connection.
  Future<void> close() async {
    _setState(WAConnectionState.closing);
    _keepalive?.stop();
    await _wsSub?.cancel();
    await _channel?.sink.close();
    _reset();
    _retryCount = 0;
    _setState(WAConnectionState.disconnected);
  }

  // ---------------------------------------------------------------------------
  // Handshake
  // ---------------------------------------------------------------------------

  Future<void> _sendClientHello(NoiseHandler noise) async {
    final ephPub = await noise.ephemeralPublicKey;

    // HandshakeMessage.ClientHello { ephemeral: epk }
    final clientHello = HandshakeMessage(
      clientHello: HandshakeMessage_ClientHello(ephemeral: ephPub),
    );
    final helloBytes =
        Uint8List.fromList(clientHello.writeToBuffer());

    final frame = await noise.encodeFrame(helloBytes);
    _channel!.sink.add(frame);
    config.logger.fine('Sent client hello (${ephPub.length} bytes ephemeral)');
  }

  Future<void> _processServerHello(
      NoiseHandler noise, Uint8List frameBytes) async {
    final msg = HandshakeMessage.fromBuffer(frameBytes);
    if (!msg.hasServerHello()) {
      throw StateError('Expected serverHello, got: $msg');
    }
    final sh = msg.serverHello;

    config.logger.fine('Processing server hello');

    // Run Noise handshake — get back our encrypted noise public key.
    final keyEnc = await noise.processHandshake(
      serverEphemeral: Uint8List.fromList(sh.ephemeral),
      // ignore: deprecated_member_use — `static` is the proto field name
      serverStaticEncrypted: Uint8List.fromList(sh.static),
      serverPayloadEncrypted: Uint8List.fromList(sh.payload),
      noiseKeyPair: noiseKey,
    );

    // Build client finish: encrypt the ClientPayload as the payload.
    final clientPayload = await _buildClientPayload();
    final encPayload = await noise.encrypt(clientPayload);

    final clientFinish = HandshakeMessage(
      clientFinish: HandshakeMessage_ClientFinish(
        // ignore: deprecated_member_use — `static` is the proto field name
        static: keyEnc,
        payload: encPayload,
      ),
    );
    final finishBytes =
        Uint8List.fromList(clientFinish.writeToBuffer());

    final frame = await noise.encodeFrame(finishBytes);
    _channel!.sink.add(frame);

    // Transition Noise to transport mode.
    await noise.finishInit();

    config.logger.info('Noise handshake complete — transport mode active');
    _setState(WAConnectionState.connected);

    // Start keepalive.
    _keepalive = KeepAlive(
      interval: config.keepaliveInterval,
      timeout: config.keepaliveTimeout,
      sendPing: _sendPing,
      onDead: () => _scheduleReconnect(),
      logger: config.logger,
    );
    _keepalive!.start();
  }

  Future<Uint8List> _buildClientPayload() async {
    const v = _waVersion;

    ClientPayload_DevicePairingRegistrationData? regData;
    if (!passive && creds != null) {
      final c = creds!;

      // buildHash = MD5("primary.secondary.tertiary") — matches Baileys createHash('md5')
      final versionStr = '${v[0]}.${v[1]}.${v[2]}';
      final buildHash = Uint8List.fromList(
          crypto.md5.convert(utf8.encode(versionStr)).bytes);

      // DeviceProps: companion-app version is fixed {10,15,7}, NOT the WA version.
      final devicePropsBytes = DeviceProps(
        os: config.browser[0],
        version: DeviceProps_AppVersion(primary: 10, secondary: 15, tertiary: 7),
        platformType: _getPlatformType(config.browser[1]),
        requireFullSync: false,
        historySyncConfig: DeviceProps_HistorySyncConfig(
          storageQuotaMb: 10240,
          inlineInitialPayloadInE2EeMsg: true,
          supportCallLogHistory: false,
          supportBotUserAgentChatHistory: true,
          supportCagReactionsAndPolls: true,
          supportBizHostedMsg: true,
          supportRecentSyncChunkMessageCountTuning: true,
          supportHostedGroupMsg: true,
          supportFbidBotChatHistory: true,
          supportMessageAssociation: true,
          supportGroupHistory: false,
        ),
      ).writeToBuffer();

      final identPub = await c.signedIdentityKey.extractPublicKey();
      final identBytes = Uint8List.fromList(identPub.bytes);
      final spkPub = await c.signedPreKey.keyPair.extractPublicKey();
      final spkBytes = Uint8List.fromList(spkPub.bytes);

      regData = ClientPayload_DevicePairingRegistrationData(
        buildHash: buildHash,
        deviceProps: devicePropsBytes,
        eRegid: _encodeBigEndian(c.registrationId),      // 4 bytes
        eKeytype: Uint8List.fromList([0x05]),
        eIdent: identBytes,
        eSkeyId: _encodeBigEndian(c.signedPreKey.id, size: 3),  // 3 bytes — Baileys
        eSkeyVal: spkBytes,
        eSkeySig: c.signedPreKey.signature,
      );
    }

    final payload = ClientPayload(
      connectType: ClientPayload_ConnectType.WIFI_UNKNOWN,
      connectReason: ClientPayload_ConnectReason.USER_ACTIVATED,
      passive: passive,
      pull: !passive,
      userAgent: ClientPayload_UserAgent(
        appVersion: ClientPayload_UserAgent_AppVersion(
            primary: v[0], secondary: v[1], tertiary: v[2]),
        platform: ClientPayload_UserAgent_Platform.WEB,
        releaseChannel: ClientPayload_UserAgent_ReleaseChannel.RELEASE,
        mcc: '000',
        mnc: '000',
        osVersion: '0.1',
        device: 'Desktop',
        osBuildNumber: '0.1',
        localeLanguageIso6391: 'en',
        localeCountryIso31661Alpha2: 'US',
      ),
      webInfo: ClientPayload_WebInfo(
        webSubPlatform: ClientPayload_WebInfo_WebSubPlatform.WEB_BROWSER,
      ),
      devicePairingData: regData,
    );
    return Uint8List.fromList(payload.writeToBuffer());
  }

  /// Maps browser name to DeviceProps platform type — mirrors Baileys getPlatformType().
  static DeviceProps_PlatformType _getPlatformType(String browser) {
    switch (browser.toUpperCase()) {
      case 'CHROME':  return DeviceProps_PlatformType.CHROME;
      case 'FIREFOX': return DeviceProps_PlatformType.FIREFOX;
      case 'SAFARI':  return DeviceProps_PlatformType.SAFARI;
      case 'EDGE':    return DeviceProps_PlatformType.EDGE;
      case 'OPERA':   return DeviceProps_PlatformType.OPERA;
      default:        return DeviceProps_PlatformType.DESKTOP;
    }
  }

  /// Encode an integer as big-endian bytes.
  static Uint8List _encodeBigEndian(int value, {int size = 4}) {
    final bytes = Uint8List(size);
    for (int i = size - 1; i >= 0; i--) {
      bytes[i] = value & 0xff;
      value >>= 8;
    }
    return bytes;
  }

  // ---------------------------------------------------------------------------
  // Incoming data
  // ---------------------------------------------------------------------------

  // Handshake state machine:
  //   _handshakePhase == 0 → waiting for serverHello
  //   _handshakePhase == 1 → serverHello received, processing async (buffer incoming)
  //   _handshakePhase == 2 → handshake done, transport active
  int _handshakePhase = 0;

  /// Buffer for frames that arrive while async handshake is in progress.
  final _pendingFrames = <Uint8List>[];

  void _onRawData(dynamic data) {
    Uint8List bytes;
    if (data is Uint8List) {
      bytes = data;
    } else if (data is List<int>) {
      bytes = Uint8List.fromList(data);
    } else {
      config.logger.warning('Unexpected WebSocket data type: ${data.runtimeType}');
      return;
    }

    final noise = _noiseHandler;
    if (noise == null) return;

    if (_handshakePhase == 0) {
      // First frame is the server hello.
      _handshakePhase = 1; // block further frames until transport is ready
      if (bytes.length < 3) {
        config.logger.severe('Server hello frame too short');
        return;
      }
      final payloadLen = (bytes[0] << 16) | (bytes[1] << 8) | bytes[2];
      if (bytes.length < payloadLen + 3) {
        config.logger.severe('Server hello frame incomplete');
        return;
      }
      final payload = bytes.sublist(3, payloadLen + 3);

      // Queue any trailing bytes for after transport is active.
      if (bytes.length > payloadLen + 3) {
        _pendingFrames.add(bytes.sublist(payloadLen + 3));
      }

      _processServerHello(noise, payload).then((_) {
        // Flush any frames that arrived during handshake.
        _handshakePhase = 2;
        for (final pending in _pendingFrames) {
          _dispatchFrames(pending);
        }
        _pendingFrames.clear();
      }).catchError((e, st) {
        config.logger.severe('Server hello processing failed', e, st);
        _pendingFrames.clear();
        _scheduleReconnect();
      });
    } else if (_handshakePhase == 1) {
      // Handshake in progress — buffer until transport is ready.
      _pendingFrames.add(bytes);
    } else {
      _dispatchFrames(bytes);
    }
  }

  void _dispatchFrames(Uint8List bytes) {
    _noiseHandler
        ?.decodeFrame(bytes, _onDecodedFrame)
        .catchError((e, st) {
      config.logger.severe('Frame decode error', e, st);
    });
  }

  void _onDecodedFrame(Object frame) {
    if (frame is BinaryNode) {
      _routeNode(frame).catchError((e, st) =>
          config.logger.warning('Route error for node: $e'));
    }
    // Pre-transport raw frames are handled in _processServerHello path.
  }

  Future<void> _routeNode(BinaryNode node) async {
    config.logger.info('recv <${node.tag}> attrs=${node.attrs}');

    // Stream-level errors — log fully and reconnect.
    if (node.tag == 'stream:error' || node.tag == 'failure') {
      final reason =
          int.tryParse(node.attrs['reason']?.toString() ?? '') ?? 0;
      final code =
          int.tryParse(node.attrs['code']?.toString() ?? '') ?? 0;
      config.logger.warning(
          'Server stream error: tag=${node.tag} attrs=${node.attrs} '
          'content=${node.contentString}');

      // Auth failures (405 = noise key rejected, 401 = logged out):
      // regenerate the noise key before reconnecting so the next attempt
      // uses a fresh identity — mirrors Baileys' onCBFailure behaviour.
      if ((reason == 405 || reason == 401) &&
          onKeyRefreshNeeded != null) {
        config.logger.info(
            'Auth failure $reason — refreshing noise key before reconnect');
        final newKey = await onKeyRefreshNeeded!(reason);
        if (newKey != null) noiseKey = newKey;
      }

      // 500 = server rate-limit / internal error; back off longer to avoid
      // hammering the server and worsening the rate-limit.
      if (code == 500) {
        _longBackoff = true;
        config.logger.info('Rate-limit (500) — will use extended backoff');
      }

      _scheduleReconnect();
      return;
    }

    // Keepalive pong (iq result with matching id).
    if (node.tag == 'iq' && node.attrs['type'] == 'result') {
      final id = node.attrs['id'];
      if (id != null && _queries.containsKey(id)) {
        _queries.remove(id)!.complete(node);
        return;
      }
    }

    // Dispatch to registered handlers.
    final handlers = [
      ...(_handlers[node.tag] ?? []),
      ...(_handlers['*'] ?? []),
    ];
    for (final h in handlers) {
      h(node).catchError((e, st) =>
          config.logger.warning('Handler error for <${node.tag}>: $e'));
    }
  }

  // ---------------------------------------------------------------------------
  // Sending
  // ---------------------------------------------------------------------------

  /// Send a [BinaryNode] over the encrypted transport.
  Future<void> sendNode(BinaryNode node) async {
    final noise = _noiseHandler;
    if (noise == null || !noise.isTransportReady) {
      throw StateError('Transport not ready');
    }
    final encoded = encodeBinaryNode(node);
    final frame = await noise.encodeFrame(encoded);
    _channel!.sink.add(frame);
    config.logger.fine('sent ${node.tag} id=${node.attrs['id'] ?? ''}');
  }

  /// Send a node and wait for the matching response by [id].
  Future<BinaryNode> query(BinaryNode node, {Duration? timeout}) async {
    final id = node.attrs['id'] ?? _nextTag();
    final completer = Completer<BinaryNode>();
    _queries[id] = completer;

    final deadline = timeout ?? config.connectTimeout;
    Timer(deadline, () {
      if (!completer.isCompleted) {
        _queries.remove(id);
        completer.completeError(
            TimeoutException('Query $id timed out', deadline));
      }
    });

    await sendNode(node);
    return completer.future;
  }

  String _nextTag() => (_msgTag++).toString();

  // ---------------------------------------------------------------------------
  // Keepalive
  // ---------------------------------------------------------------------------

  Future<void> _sendPing() async {
    final tag = _nextTag();
    final pingNode = BinaryNode(
      tag: 'iq',
      attrs: {
        'id': tag,
        'to': '@s.whatsapp.net',
        'type': 'get',
        'xmlns': 'w:p',
      },
    );
    // Register in _queries so the pong (iq result) is matched in _routeNode,
    // then notify KeepAlive.  Use ignore() to suppress unawaited warning.
    final completer = Completer<BinaryNode>();
    _queries[tag] = completer;
    completer.future.then((_) => _keepalive?.onPong()).ignore();
    await sendNode(pingNode);
  }

  // Call keepAlive.onPong() when we receive the iq result for our ping.
  // (Handled in _routeNode where result IQ pops from _queries.)

  // ---------------------------------------------------------------------------
  // Handler registration
  // ---------------------------------------------------------------------------

  /// Register a handler for incoming nodes with the given [tag].
  /// Use '*' to receive all nodes.
  void on(String tag, NodeHandler handler) {
    _handlers.putIfAbsent(tag, () => []).add(handler);
  }

  /// Remove a specific handler.
  void off(String tag, NodeHandler handler) {
    _handlers[tag]?.remove(handler);
  }

  // ---------------------------------------------------------------------------
  // Error / reconnect
  // ---------------------------------------------------------------------------

  void _onWsError(Object error) {
    config.logger.warning('WebSocket error: $error');
    _scheduleReconnect();
  }

  void _onWsDone() {
    if (_state != WAConnectionState.closing) {
      final ch = _channel;
      final code = ch?.closeCode;
      final reason = ch?.closeReason;
      config.logger.warning(
          'WebSocket closed unexpectedly — code=$code reason=$reason');
      _scheduleReconnect();
    }
  }

  Future<void> _scheduleReconnect() async {
    if (_state == WAConnectionState.closing) return;
    // Prevent double-scheduling: both a <failure> node and the subsequent
    // WebSocket close would otherwise call this independently.
    if (_reconnectPending) return;
    _reconnectPending = true;

    _reset();
    _setState(WAConnectionState.disconnected);

    if (config.maxRetries > 0 && _retryCount >= config.maxRetries) {
      config.logger.severe('Max retries reached, giving up');
      _connectionUpdates.add(ConnectionUpdate(
        state: WAConnectionState.disconnected,
        lastDisconnect: StateError('Max retries reached'),
      ));
      _reconnectPending = false;
      return;
    }

    // Normal backoff: 2s→4s→8s→16s→32s, cap 60s.
    // Extended backoff (rate-limit): 30s→60s→120s→300s, cap 300s.
    final int delaySecs;
    if (_longBackoff) {
      delaySecs = (30 * (1 << _retryCount.clamp(0, 3))).clamp(30, 300);
      _longBackoff = false;
    } else {
      delaySecs = (2 * (1 << _retryCount.clamp(0, 4))).clamp(2, 60);
    }
    final delay = Duration(seconds: delaySecs);
    _retryCount++;
    config.logger.info(
        'Reconnecting in ${delay.inSeconds}s (attempt $_retryCount)');

    await Future.delayed(delay);
    _reconnectPending = false;
    await connect();
  }

  void _reset() {
    _keepalive?.stop();
    _keepalive = null;
    _wsSub?.cancel();
    _wsSub = null;
    _noiseHandler = null;
    _handshakePhase = 0;
    _pendingFrames.clear();

    // Fail all pending queries.
    for (final c in _queries.values) {
      if (!c.isCompleted) {
        c.completeError(StateError('Connection reset'));
      }
    }
    _queries.clear();
  }

  void _setState(WAConnectionState s) {
    if (_state == s) return;
    _state = s;
    config.logger.info('Connection state: $s');
    _connectionUpdates.add(ConnectionUpdate(state: s));
  }

  /// Release all resources permanently (no reconnect).
  void dispose() {
    _setState(WAConnectionState.closing);
    _reset();
    _connectionUpdates.close();
  }
}
