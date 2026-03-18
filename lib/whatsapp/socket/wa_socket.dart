import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:cryptography/cryptography.dart';
import 'package:fixnum/fixnum.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/auth_state.dart';
import '../binary/encoder.dart';
import '../binary/generic_utils.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../noise/noise_handler.dart';
import '../proto/wa_proto.pb.dart';
import '../types.dart';
import 'keepalive.dart';
import 'wa_socket_config.dart';

/// Connection state of the WhatsApp WebSocket.
enum WAConnectionState { disconnected, connecting, connected, closing }

/// Event emitted when connection state changes.
class ConnectionUpdate {
  final WAConnectionState state;
  final String? qr;
  final Object? lastDisconnect;
  final WADisconnectReason? disconnectReason;
  final int? disconnectStatusCode;
  final bool? receivedPendingNotifications;

  const ConnectionUpdate({
    required this.state,
    this.qr,
    this.lastDisconnect,
    this.disconnectReason,
    this.disconnectStatusCode,
    this.receivedPendingNotifications,
  });
}

class _StreamErrorInfo {
  final String reason;
  final int statusCode;

  const _StreamErrorInfo({required this.reason, required this.statusCode});
}

WADisconnectReason _mapDisconnectReason(_StreamErrorInfo info) {
  switch (info.statusCode) {
    case 401:
      return WADisconnectReason.loggedOut;
    case 405:
      return WADisconnectReason.badSession;
    case 408:
      return WADisconnectReason.timedOut;
    case 440:
      return WADisconnectReason.connectionReplaced;
    case 500:
      return WADisconnectReason.badSession;
    case 515:
      return WADisconnectReason.restartRequired;
    default:
      return WADisconnectReason.connectionClosed;
  }
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
  /// Mutable so it can be refreshed when the server rejects with 405.
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

  /// Called when edge routing info is received so creds can be persisted.
  final Future<void> Function(Uint8List routingInfo)? onRoutingInfo;

  /// WhatsApp companion-device version from Baileys' baileys-version.json.
  /// Do NOT use the check-update endpoint — it returns the browser-app version.
  static const _waVersion = [2, 3000, 1035194821];

  /// Guards against double-scheduling a reconnect when both a `<failure>` node
  /// and the subsequent WebSocket close both call _scheduleReconnect.
  bool _reconnectPending = false;
  bool _disposed = false;
  bool _terminalDisconnect = false;

  WASocket({
    required this.config,
    required this.noiseKey,
    this.passive = false,
    this.creds,
    this.onKeyRefreshNeeded,
    this.onRoutingInfo,
  });

  WAConnectionState get state => _state;

  // ---------------------------------------------------------------------------
  // Connect / disconnect
  // ---------------------------------------------------------------------------

  /// Connect (or reconnect) to WhatsApp.
  Future<void> connect() async {
    if (_disposed) {
      config.logger.info('Ignoring connect because socket is disposed');
      return;
    }
    if (_state == WAConnectionState.connecting ||
        _state == WAConnectionState.connected) {
      return;
    }
    _terminalDisconnect = false;
    _setState(WAConnectionState.connecting);
    final isPassive = creds?.me != null;
    config.logger.info(
      'Using WA version ${_waVersion.join('.')} (passive=$isPassive) '
      'browser=${config.browser.join('/')} deviceName=${config.deviceName} '
      'syncFullHistory=${config.syncFullHistory} countryCode=${config.countryCode} '
      'hasCredsMe=${creds?.me != null} routingInfoBytes=${(creds?.routingInfo ?? config.routingInfo)?.length ?? 0}',
    );

    try {
      // Build Noise handler for this connection attempt.
      final routingInfo = creds?.routingInfo ?? config.routingInfo;
      final noise = await NoiseHandler.create(routingInfo: routingInfo);
      if (_disposed) {
        config.logger.info(
          'Aborting connect because socket was disposed during Noise init',
        );
        return;
      }
      _noiseHandler = noise;
      config.logger.info(
        'Created Noise handler for connect attempt '
        '(routingInfoBytes=${routingInfo?.length ?? 0})',
      );

      // Open WebSocket with headers that WhatsApp requires.
      // web_socket_channel.connect() doesn't support headers; use dart:io directly.
      final wsUrl = _buildWebSocketUrl(config.url, routingInfo);
      config.logger.info('Opening WA WebSocket url=$wsUrl');
      final ws = await WebSocket.connect(
        wsUrl,
        headers: {
          'Origin': 'https://web.whatsapp.com',
          'Host': 'web.whatsapp.com',
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) '
              'AppleWebKit/537.36 (KHTML, like Gecko) '
          'Chrome/127.0.0.0 Safari/537.36',
        },
      );
      if (_disposed) {
        config.logger.info(
          'Socket disposed while WebSocket.connect was in flight; closing socket',
        );
        await ws.close();
        return;
      }
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
    if (_disposed) return;
    _terminalDisconnect = false;
    _reconnectPending = false;
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
    final helloBytes = Uint8List.fromList(clientHello.writeToBuffer());

    final frame = await noise.encodeFrame(helloBytes);
    _channel!.sink.add(frame);
    config.logger.fine('Sent client hello (${ephPub.length} bytes ephemeral)');
  }

  Future<void> _processServerHello(
    NoiseHandler noise,
    Uint8List frameBytes,
  ) async {
    final msg = HandshakeMessage.fromBuffer(frameBytes);
    if (!msg.hasServerHello()) {
      throw StateError('Expected serverHello, got: $msg');
    }
    final sh = msg.serverHello;

    config.logger.info(
      'Processing server hello '
      '(ephemeralBytes=${sh.ephemeral.length}, staticBytes=${sh.static.length}, payloadBytes=${sh.payload.length})',
    );

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
    config.logger.info(
      'Prepared client finish payload '
      '(clientPayloadBytes=${clientPayload.length}, encryptedPayloadBytes=${encPayload.length}, staticBytes=${keyEnc.length})',
    );

    final clientFinish = HandshakeMessage(
      clientFinish: HandshakeMessage_ClientFinish(
        // ignore: deprecated_member_use — `static` is the proto field name
        static: keyEnc,
        payload: encPayload,
      ),
    );
    final finishBytes = Uint8List.fromList(clientFinish.writeToBuffer());

    final frame = await noise.encodeFrame(finishBytes);
    _channel!.sink.add(frame);

    // Transition Noise to transport mode.
    await noise.finishInit();

    config.logger.info('Noise handshake complete — transport mode active');

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

    // In Baileys, registration vs login is decided solely by whether creds.me
    // is set: no `pull` on registration (new device), `pull` on login.
    final hasMe = creds?.me != null;
    final isPassive = hasMe;
    Int64? username;
    int? device;
    if (isPassive) {
      final decoded = jidDecode(creds!.me!.id);
      if (decoded != null) {
        try {
          username = Int64.parseInt(decoded.user);
        } catch (_) {
          username = null;
        }
        device = decoded.device;
      }
    }

    ClientPayload_DevicePairingRegistrationData? regData;
    if (!isPassive && creds != null) {
      final c = creds!;

      // buildHash = MD5("primary.secondary.tertiary") — matches Baileys createHash('md5')
      final versionStr = '${v[0]}.${v[1]}.${v[2]}';
      final buildHash = Uint8List.fromList(
        crypto.md5.convert(utf8.encode(versionStr)).bytes,
      );

      // DeviceProps: companion-app version is fixed {10,15,7}, NOT the WA version.
      final devicePropsBytes = DeviceProps(
        os: config.browser[0],
        version: DeviceProps_AppVersion(
          primary: 10,
          secondary: 15,
          tertiary: 7,
        ),
        platformType: _getPlatformType(config.browser[1]),
        requireFullSync: config.syncFullHistory,
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
        eRegid: _encodeBigEndian(c.registrationId), // 4 bytes
        eKeytype: Uint8List.fromList([0x05]),
        eIdent: identBytes,
        eSkeyId: _encodeBigEndian(
          c.signedPreKey.id,
          size: 3,
        ), // 3 bytes — Baileys
        eSkeyVal: spkBytes,
        eSkeySig: c.signedPreKey.signature,
      );
    }

    final webSubPlatform = _getWebSubPlatform(config);
    final payload = ClientPayload(
      username: username,
      connectType: ClientPayload_ConnectType.WIFI_UNKNOWN,
      connectReason: ClientPayload_ConnectReason.USER_ACTIVATED,
      passive: isPassive,
      // For registration (no creds.me): passive=false, pull=false.
      // For login (creds.me present):   passive=true,  pull=true.
      pull: isPassive,
      device: device,
      lidDbMigrated: isPassive ? false : null,
      userAgent: ClientPayload_UserAgent(
        appVersion: ClientPayload_UserAgent_AppVersion(
          primary: v[0],
          secondary: v[1],
          tertiary: v[2],
        ),
        platform: ClientPayload_UserAgent_Platform.WEB,
        releaseChannel: ClientPayload_UserAgent_ReleaseChannel.RELEASE,
        mcc: '000',
        mnc: '000',
        osVersion: '0.1',
        device: 'Desktop',
        osBuildNumber: '0.1',
        localeLanguageIso6391: 'en',
        localeCountryIso31661Alpha2: config.countryCode,
      ),
      webInfo: ClientPayload_WebInfo(webSubPlatform: webSubPlatform),
      devicePairingData: regData,
    );
    config.logger.info(
      'Built WA client payload '
      'mode=${isPassive ? 'login' : 'registration'} '
      'username=${username?.toString() ?? '-'} '
      'device=${device?.toString() ?? '-'} '
      'browser=${config.browser.join('/')} '
      'webSubPlatform=$webSubPlatform '
      'hasRegData=${regData != null} '
      'registrationId=${creds?.registrationId ?? '-'} '
      'signedPreKeyId=${creds?.signedPreKey.id ?? '-'}',
    );
    return Uint8List.fromList(payload.writeToBuffer());
  }

  /// Maps browser name to DeviceProps platform type — mirrors Baileys getPlatformType().
  static DeviceProps_PlatformType _getPlatformType(String browser) {
    switch (browser.toUpperCase()) {
      case 'CHROME':
        return DeviceProps_PlatformType.CHROME;
      case 'FIREFOX':
        return DeviceProps_PlatformType.FIREFOX;
      case 'SAFARI':
        return DeviceProps_PlatformType.SAFARI;
      case 'EDGE':
        return DeviceProps_PlatformType.EDGE;
      case 'OPERA':
        return DeviceProps_PlatformType.OPERA;
      case 'DESKTOP':
        return DeviceProps_PlatformType.DESKTOP;
      default:
        return DeviceProps_PlatformType.CHROME;
    }
  }

  /// Mirrors Baileys getWebInfo logic for subplatform selection.
  static ClientPayload_WebInfo_WebSubPlatform _getWebSubPlatform(
    WASocketConfig config,
  ) {
    var sub = ClientPayload_WebInfo_WebSubPlatform.WEB_BROWSER;
    if (!config.syncFullHistory) return sub;

    final os = config.browser[0];
    final browser = config.browser[1];
    if (browser != 'Desktop') return sub;

    if (os == 'Mac OS') {
      sub = ClientPayload_WebInfo_WebSubPlatform.DARWIN;
    } else if (os == 'Windows') {
      sub = ClientPayload_WebInfo_WebSubPlatform.WIN32;
    }
    return sub;
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
      config.logger.warning(
        'Unexpected WebSocket data type: ${data.runtimeType}',
      );
      return;
    }

    final noise = _noiseHandler;
    if (noise == null) return;
    config.logger.fine(
      'recv raw frame bytes=${bytes.length} handshakePhase=$_handshakePhase',
    );

    if (_handshakePhase == 0) {
      // First frame is the server hello.
      _handshakePhase = 1; // block further frames until transport is ready
      if (bytes.length < 3) {
        config.logger.severe('Server hello frame too short');
        return;
      }
      final payloadLen = (bytes[0] << 16) | (bytes[1] << 8) | bytes[2];
      config.logger.info(
        'Server hello frame header parsed '
        '(frameBytes=${bytes.length}, payloadLen=$payloadLen)',
      );
      if (bytes.length < payloadLen + 3) {
        config.logger.severe('Server hello frame incomplete');
        return;
      }
      final payload = bytes.sublist(3, payloadLen + 3);

      // Queue any trailing bytes for after transport is active.
      if (bytes.length > payloadLen + 3) {
        _pendingFrames.add(bytes.sublist(payloadLen + 3));
        config.logger.info(
          'Buffered trailing handshake frame bytes=${bytes.length - payloadLen - 3}',
        );
      }

      _processServerHello(noise, payload)
          .then((_) {
            // Flush any frames that arrived during handshake.
            _handshakePhase = 2;
            config.logger.info(
              'Handshake phase complete; flushing ${_pendingFrames.length} pending frame chunk(s)',
            );
            for (final pending in _pendingFrames) {
              _dispatchFrames(pending);
            }
            _pendingFrames.clear();
          })
          .catchError((e, st) {
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
    config.logger.fine('dispatch encrypted frame bytes=${bytes.length}');
    _noiseHandler?.decodeFrame(bytes, _onDecodedFrame).catchError((e, st) {
      config.logger.severe('Frame decode error', e, st);
    });
  }

  void _onDecodedFrame(Object frame) {
    if (frame is BinaryNode) {
      _routeNode(frame).catchError(
        (e, st) => config.logger.warning('Route error for node: $e'),
      );
    }
    // Pre-transport raw frames are handled in _processServerHello path.
  }

  Future<void> _routeNode(BinaryNode node) async {
    config.logger.info('recv ${_summarizeNode(node)}');

    if (node.tag == 'success') {
      _retryCount = 0;
      config.logger.info(
        'WA success received attrs=${node.attrs} '
        'pendingQueries=${_queries.length} '
        'me=${creds?.me?.id ?? '-'}',
      );
      _setState(WAConnectionState.connected);
    }

    // Stream-level errors — log fully and reconnect.
    if (node.tag == 'stream:error' || node.tag == 'failure') {
      final errInfo = node.tag == 'stream:error'
          ? _parseStreamError(node)
          : _parseFailure(node);
      final reason = errInfo.reason;
      final code = errInfo.statusCode;
      config.logger.warning(
        'Server stream error: tag=${node.tag} attrs=${node.attrs} '
        'content=${node.contentString}',
      );

      final disconnectReason = _mapDisconnectReason(errInfo);
      final hasLinkedSession = creds?.me != null;

      // Mirror Baileys/OpenClaw:
      // - 405 => refresh the noise key and retry
      // - 500 while unpaired => rebuild fresh creds and retry
      // - 401 / badSession on an existing linked session => surface relink
      if ((code == 405 || (code == 500 && !hasLinkedSession)) &&
          onKeyRefreshNeeded != null) {
        config.logger.info(
          'Session rejected ($reason/$code) — refreshing noise key before reconnect',
        );
        final newKey = await onKeyRefreshNeeded!(code);
        if (newKey != null) noiseKey = newKey;
      }

      if (_isTerminalDisconnect(disconnectReason, hasLinkedSession)) {
        _terminalDisconnect = true;
        config.logger.info(
          'Treating auth failure as terminal '
          'reason=$disconnectReason statusCode=$code hasLinkedSession=$hasLinkedSession',
        );
        _transitionToDisconnected(
          reason: disconnectReason,
          statusCode: code,
          lastDisconnect: StateError('$reason ($code)'),
          immediate: false,
        );
        return;
      }

      if (disconnectReason == WADisconnectReason.restartRequired) {
        _terminalDisconnect = true;
        config.logger.info(
          'Surfacing restartRequired for external client restart '
          'statusCode=$code hasLinkedSession=$hasLinkedSession',
        );
        _transitionToDisconnected(
          reason: disconnectReason,
          statusCode: code,
          lastDisconnect: StateError('$reason ($code)'),
          immediate: false,
        );
        return;
      }

      await _scheduleReconnect(
        reason: disconnectReason,
        statusCode: code,
        lastDisconnect: StateError('$reason ($code)'),
        immediate: code == 515,
      );
      return;
    }

    // Keepalive pong (iq result with matching id).
    if (node.tag == 'iq' && node.attrs['type'] == 'result') {
      final id = node.attrs['id'];
      if (id != null && _queries.containsKey(id)) {
        config.logger.info(
          'Matched IQ result for id=$id childTags=${node.children.map((c) => c.tag).toList()}',
        );
        _queries.remove(id)!.complete(node);
        return;
      }
    }

    // Edge routing info (used for future reconnects).
    if (node.tag == 'ib') {
      final edgeNode = getBinaryNodeChild(node, 'edge_routing');
      final routingNode = edgeNode == null
          ? null
          : getBinaryNodeChild(edgeNode, 'routing_info');
      final bytes = routingNode?.contentBytes;
      if (bytes != null && bytes.isNotEmpty) {
        final info = Uint8List.fromList(bytes);
        config.logger.info('Received edge routing info bytes=${info.length}');
        if (creds != null) {
          creds!.routingInfo = info;
        }
        if (onRoutingInfo != null) {
          await onRoutingInfo!(info);
        }
      }

      if (getBinaryNodeChild(node, 'offline') != null) {
        _emitConnectionUpdate(
          ConnectionUpdate(
            state: _state,
            receivedPendingNotifications: true,
          ),
        );
      }
    }

    // Dispatch to registered handlers.
    final handlers = [
      ...(_handlers[node.tag] ?? []),
      ...(_handlers['*'] ?? []),
    ];
    for (final h in handlers) {
      h(node).catchError(
        (e, st) => config.logger.warning('Handler error for <${node.tag}>: $e'),
      );
    }
  }

  static _StreamErrorInfo _parseStreamError(BinaryNode node) {
    final children = getAllBinaryNodeChildren(node);
    final reasonNode = children.isNotEmpty ? children.first : null;
    var reason = reasonNode?.tag ?? 'unknown';
    var statusCode = int.tryParse(node.attrs['code']?.toString() ?? '');
    if (statusCode == null || statusCode == 0) {
      statusCode = reason == 'conflict' ? 440 : 500;
    }
    if (statusCode == 515) {
      reason = 'restart required';
    }
    return _StreamErrorInfo(reason: reason, statusCode: statusCode);
  }

  static _StreamErrorInfo _parseFailure(BinaryNode node) {
    final reasonAttr = node.attrs['reason']?.toString();
    final statusCode = int.tryParse(reasonAttr ?? '') ?? 500;
    return _StreamErrorInfo(
      reason: reasonAttr ?? 'unknown',
      statusCode: statusCode,
    );
  }

  static String _buildWebSocketUrl(String baseUrl, Uint8List? routingInfo) {
    if (routingInfo == null || routingInfo.isEmpty) return baseUrl;
    final uri = Uri.parse(baseUrl);
    if (uri.scheme != 'wss') return baseUrl;
    final qp = Map<String, String>.from(uri.queryParameters);
    qp['ED'] = _base64UrlNoPad(routingInfo);
    return uri.replace(queryParameters: qp).toString();
  }

  static String _base64UrlNoPad(Uint8List data) {
    final encoded = base64UrlEncode(data);
    return encoded.replaceAll('=', '');
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
    final summary = _summarizeNode(node);
    if (_shouldLogNodeAtInfo(node)) {
      config.logger.info('send $summary');
    } else {
      config.logger.fine('send $summary');
    }
  }

  /// Send a node and wait for the matching response by [id].
  Future<BinaryNode> query(BinaryNode node, {Duration? timeout}) async {
    final id = node.attrs['id'] ?? _nextTag();
    final completer = Completer<BinaryNode>();
    _queries[id] = completer;
    config.logger.info(
      'Starting query id=$id tag=${node.tag} timeoutMs=${(timeout ?? config.connectTimeout).inMilliseconds}',
    );

    final deadline = timeout ?? config.connectTimeout;
    Timer(deadline, () {
      if (!completer.isCompleted) {
        _queries.remove(id);
        config.logger.warning(
          'Query timed out id=$id after ${deadline.inMilliseconds}ms',
        );
        completer.completeError(
          TimeoutException('Query $id timed out', deadline),
        );
      }
    });

    final nodeToSend = node.attrs.containsKey('id')
        ? node
        : BinaryNode(
            tag: node.tag,
            attrs: {...node.attrs, 'id': id},
            content: node.content,
          );
    await sendNode(nodeToSend);
    final result = await completer.future;
    config.logger.info(
      'Query resolved id=$id result=${_summarizeNode(result)}',
    );
    return result;
  }

  /// Send a passive/active IQ (used after login).
  Future<BinaryNode> sendPassiveIq(String tag) async {
    config.logger.info('Sending passive IQ tag=$tag');
    return query(
      BinaryNode(
        tag: 'iq',
        attrs: {'to': '@s.whatsapp.net', 'xmlns': 'passive', 'type': 'set'},
        content: [BinaryNode(tag: tag, attrs: {})],
      ),
    );
  }

  Future<void> sendPresenceUpdate(String type, {String? toJid}) async {
    final me = creds?.me;
    if (me == null) {
      config.logger.info(
        'Skipping presence update type=$type because creds.me is null',
      );
      return;
    }

    if (type == 'available' || type == 'unavailable') {
      final name = me.name.replaceAll('@', '');
      if (name.isEmpty) {
        config.logger.info(
          'Skipping presence update type=$type because display name is empty',
        );
        return;
      }
      config.logger.info(
        'Sending global presence type=$type nameLength=${name.length}',
      );
      await sendNode(
        BinaryNode(tag: 'presence', attrs: {'name': name, 'type': type}),
      );
      return;
    }

    if (toJid == null || toJid.isEmpty) {
      config.logger.info(
        'Skipping chatstate presence type=$type because toJid is empty',
      );
      return;
    }
    final decoded = jidDecode(toJid);
    final fromJid = decoded?.server == 'lid'
        ? (me.lid?.isNotEmpty == true ? me.lid! : me.id)
        : me.id;
    config.logger.info(
      'Sending chatstate presence type=$type from=$fromJid to=$toJid '
      'addressingServer=${decoded?.server ?? '-'}',
    );

    await sendNode(
      BinaryNode(
        tag: 'chatstate',
        attrs: {'from': fromJid, 'to': toJid},
        content: [
          BinaryNode(
            tag: type == 'recording' ? 'composing' : type,
            attrs: type == 'recording' ? {'media': 'audio'} : const {},
          ),
        ],
      ),
    );
  }

  String _nextTag() => (_msgTag++).toString();

  // ---------------------------------------------------------------------------
  // Keepalive
  // ---------------------------------------------------------------------------

  Future<void> _sendPing() async {
    final tag = _nextTag();
    config.logger.fine('Sending keepalive ping id=$tag');
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
    if (_disposed || _terminalDisconnect) {
      return;
    }
    config.logger.warning(
      'WebSocket error: $error '
      '(state=$_state pendingQueries=${_queries.length} handshakePhase=$_handshakePhase)',
    );
    _scheduleReconnect();
  }

  void _onWsDone() {
    if (_disposed || _terminalDisconnect) {
      return;
    }
    if (_state != WAConnectionState.closing) {
      final ch = _channel;
      final code = ch?.closeCode;
      final reason = ch?.closeReason;
      config.logger.warning(
        'WebSocket closed unexpectedly — code=$code reason=$reason '
        '(pendingQueries=${_queries.length} handshakePhase=$_handshakePhase)',
      );
      _scheduleReconnect();
    }
  }

  Future<void> _scheduleReconnect({
    WADisconnectReason? reason,
    int? statusCode,
    Object? lastDisconnect,
    bool immediate = false,
  }) async {
    if (_disposed || _terminalDisconnect || _state == WAConnectionState.closing) {
      return;
    }
    // Prevent double-scheduling: both a <failure> node and the subsequent
    // WebSocket close would otherwise call this independently.
    if (_reconnectPending) return;
    _reconnectPending = true;

    _transitionToDisconnected(
      reason: reason,
      statusCode: statusCode,
      lastDisconnect: lastDisconnect,
      immediate: immediate,
      resetReconnectPending: false,
    );

    if (config.maxRetries > 0 && _retryCount >= config.maxRetries) {
      config.logger.severe('Max retries reached, giving up');
      _emitConnectionUpdate(
        ConnectionUpdate(
          state: WAConnectionState.disconnected,
          lastDisconnect: lastDisconnect ?? StateError('Max retries reached'),
          disconnectReason: reason,
          disconnectStatusCode: statusCode,
        ),
      );
      _reconnectPending = false;
      return;
    }

    final delay = immediate
        ? const Duration(milliseconds: 750)
        : Duration(seconds: (2 * (1 << _retryCount.clamp(0, 4))).clamp(2, 60));
    _retryCount++;
    config.logger.info(
      'Reconnecting in ${delay.inSeconds}s (attempt $_retryCount) '
      'reason=${reason ?? '-'} statusCode=${statusCode ?? '-'}',
    );

    await Future.delayed(delay);
    if (_disposed || _terminalDisconnect || _state == WAConnectionState.closing) {
      _reconnectPending = false;
      return;
    }
    _reconnectPending = false;
    await connect();
  }

  void _reset() {
    config.logger.info(
      'Resetting WA socket state '
      '(pendingQueries=${_queries.length}, handlers=${_handlers.length}, handshakePhase=$_handshakePhase)',
    );
    _keepalive?.stop();
    _keepalive = null;
    _wsSub?.cancel();
    _wsSub = null;
    final channel = _channel;
    _channel = null;
    if (channel != null) {
      unawaited(channel.sink.close());
    }
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
    final previous = _state;
    _state = s;
    config.logger.info('Connection state: $previous -> $s');
    _emitConnectionUpdate(
      ConnectionUpdate(
        state: s,
        receivedPendingNotifications: s == WAConnectionState.connecting
            ? false
            : null,
      ),
    );
  }

  /// Release all resources permanently (no reconnect).
  void dispose() {
    if (_disposed) return;
    config.logger.info('Disposing WA socket');
    _disposed = true;
    _terminalDisconnect = true;
    _reconnectPending = false;
    _setState(WAConnectionState.closing);
    _reset();
    unawaited(_connectionUpdates.close());
  }

  bool _isTerminalDisconnect(
    WADisconnectReason reason,
    bool hasLinkedSession,
  ) {
    return reason == WADisconnectReason.loggedOut ||
        (reason == WADisconnectReason.badSession && hasLinkedSession);
  }

  void _transitionToDisconnected({
    required WADisconnectReason? reason,
    required int? statusCode,
    required Object? lastDisconnect,
    required bool immediate,
    bool resetReconnectPending = true,
  }) {
    if (resetReconnectPending) {
      _reconnectPending = false;
    }
    _reset();
    _state = WAConnectionState.disconnected;
    _emitConnectionUpdate(
      ConnectionUpdate(
        state: WAConnectionState.disconnected,
        lastDisconnect: lastDisconnect,
        disconnectReason: reason,
        disconnectStatusCode: statusCode,
      ),
    );
    config.logger.info(
      'Connection state: ${WAConnectionState.disconnected} '
      'reason=${reason ?? '-'} statusCode=${statusCode ?? '-'} immediate=$immediate '
      'pendingQueries=${_queries.length}',
    );
  }

  void _emitConnectionUpdate(ConnectionUpdate update) {
    if (_connectionUpdates.isClosed) {
      config.logger.fine(
        'Skipping connection update because stream is closed '
        'state=${update.state} reason=${update.disconnectReason ?? '-'}',
      );
      return;
    }
    _connectionUpdates.add(update);
  }

  static bool _shouldLogNodeAtInfo(BinaryNode node) {
    if (node.tag == 'iq') {
      final xmlns = node.attrs['xmlns']?.toString();
      final hasPairDeviceSign = node.children.any(
        (child) => child.tag == 'pair-device-sign',
      );
      return xmlns == 'md' ||
          xmlns == 'passive' ||
          xmlns == 'encrypt' ||
          xmlns == 'w:p' ||
          hasPairDeviceSign;
    }
    if (node.tag == 'receipt') {
      return true;
    }
    if (node.tag == 'ack') {
      return true;
    }
    return node.tag == 'ib' ||
        node.tag == 'presence' ||
        node.tag == 'chatstate';
  }

  static String _summarizeNode(BinaryNode node) {
    final interestingAttrs = <String, Object?>{};
    for (final key in [
      'id',
      'type',
      'to',
      'from',
      'participant',
      'recipient',
      'xmlns',
      'jid',
      'code',
      'category',
      'name',
      't',
    ]) {
      if (node.attrs.containsKey(key)) {
        interestingAttrs[key] = node.attrs[key];
      }
    }
    final childTags = node.children.map((c) => c.tag).take(6).toList();
    return '<${node.tag}> attrs=$interestingAttrs childTags=$childTags';
  }
}
