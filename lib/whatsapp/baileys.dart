import 'dart:async';
import 'dart:typed_data';

import 'auth/auth_state.dart';
import 'auth/pairing_code_auth.dart' as pairing;
import 'noise/noise_crypto.dart' show generateX25519KeyPair;
import 'auth/qr_auth.dart';
import 'binary/types.dart';
import 'media/media_download.dart' as media_dl;
import 'media/media_upload.dart' as media_ul;
import 'messages/message_recv.dart';
import 'messages/message_retry.dart';
import 'messages/message_send.dart' as msg_send;
import 'signal/sender_key.dart';
import 'socket/wa_socket.dart' as low;
import 'socket/wa_socket_config.dart';
import 'types.dart';
import 'utils/event_emitter.dart';

export 'auth/auth_state.dart' show WAAuthState, WAMe;
export 'media/media_upload.dart' show MediaUploadResult;
export 'socket/wa_socket.dart' show ConnectionUpdate, WAConnectionState;
export 'socket/wa_socket_config.dart' show WASocketConfig;
export 'types.dart';

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/// The main WhatsApp client — equivalent to Baileys' `makeWASocket()`.
class WhatsAppClient {
  final WAAuthState _authState;
  final WASocketConfig _config;
  late final _ClientImpl _impl;

  final ev = WAEventEmitter();

  WhatsAppClient._({
    required WAAuthState authState,
    required WASocketConfig config,
  })  : _authState = authState,
        _config = config;

  static Future<WhatsAppClient> create({
    required WAAuthState authState,
    WASocketConfig? config,
  }) async {
    final cfg = config ?? WASocketConfig();
    final client = WhatsAppClient._(authState: authState, config: cfg);
    await client._init();
    return client;
  }

  Future<void> _init() async {
    _impl = _ClientImpl(authState: _authState, config: _config, ev: ev);
    await _impl.connect();
  }

  // ── Streams ────────────────────────────────────────────────────────────────

  Stream<String> get qrStream => _impl.qrStream;
  Stream<low.ConnectionUpdate> get connectionUpdates =>
      _impl.socket.connectionUpdates;

  // ── Messaging ──────────────────────────────────────────────────────────────

  Future<WAMessage> sendMessage(
    String jid,
    WAMessageContent content, {
    WAMessage? quoted,
  }) =>
      msg_send.sendMessage(
        socket: _impl.socket,
        store: _authState.keys,
        jid: jid,
        content: content,
        quoted: quoted,
      );

  // ── Media ──────────────────────────────────────────────────────────────────

  Future<media_ul.MediaUploadResult> uploadMedia(
          Uint8List bytes, String mediaType) =>
      media_ul.uploadMedia(
          socket: _impl.socket, mediaBytes: bytes, mediaType: mediaType);

  Future<Uint8List> downloadMedia(WAMessage message) =>
      media_dl.downloadMedia(message);

  // ── Auth ───────────────────────────────────────────────────────────────────

  Future<String> requestPairingCode(String phoneNumber) =>
      pairing.requestPairingCode(
        socket: _impl.socket,
        authState: _authState,
        phoneNumber: phoneNumber,
      );

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  Future<void> logout() async {
    await _impl.socket.sendNode(BinaryNode(
      tag: 'iq',
      attrs: {
        'to': '@s.whatsapp.net',
        'type': 'set',
        'id': 'logout',
        'xmlns': 'md',
      },
      content: [BinaryNode(tag: 'remove-companion-device', attrs: {})],
    ));
    await end();
  }

  Future<void> end() async {
    _impl.dispose();
    await ev.dispose();
  }
}

/// Factory — equivalent to Baileys' `makeWASocket()`.
Future<WhatsAppClient> makeWASocket({
  required WAAuthState authState,
  WASocketConfig? config,
}) =>
    WhatsAppClient.create(authState: authState, config: config);

// ---------------------------------------------------------------------------
// Internal implementation
// ---------------------------------------------------------------------------

class _ClientImpl {
  final WAAuthState authState;
  final WASocketConfig config;
  final WAEventEmitter ev;

  late final low.WASocket socket;
  late final QRAuth _qrAuth;
  late final MessageReceiver _msgRecv;
  late final MessageRetryHandler _retry;

  final _qrController = StreamController<String>.broadcast();
  Stream<String> get qrStream => _qrController.stream;

  _ClientImpl({
    required this.authState,
    required this.config,
    required this.ev,
  });

  Future<void> connect() async {
    socket = low.WASocket(
      config: config,
      noiseKey: authState.creds.noiseKey,
      passive: authState.creds.me != null,
      creds: authState.creds,
      onKeyRefreshNeeded: (reason) async {
        final newKey = await generateX25519KeyPair();
        authState.creds.noiseKey = newKey;
        await authState.saveCreds();
        return newKey;
      },
    );

    _qrAuth = QRAuth(socket: socket, authState: authState);
    unawaited(_qrAuth.qrStream.pipe(_qrController));
    _qrAuth.start();

    final senderKeyMgr = SenderKeyManager(store: authState.keys);

    _msgRecv = MessageReceiver(
      store: authState.keys,
      senderKeyManager: senderKeyMgr,
      ev: ev,
      myJid: authState.creds.me?.id ?? '',
    );

    _retry = MessageRetryHandler(socket: socket, ev: ev);

    socket.on('message', _msgRecv.handleNode);
    socket.on('receipt', (node) async => ev.emit('messages.update', node));

    await socket.connect();
  }

  void dispose() {
    _qrAuth.stop();
    _retry.dispose();
    socket.dispose();
    _qrController.close();
  }
}
