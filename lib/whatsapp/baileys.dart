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
import 'signal/signal_auth.dart' as signal_auth;
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

  int _serverTimeOffsetMs = 0;

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
        // Mirror Baileys' behavior:
        // - badSession (500) on an unpaired connection => full creds reset
        // - other auth errors (405/401, etc.)        => rotate only noise key
        if (reason == 500 && authState.creds.me == null) {
          final fresh = await AuthenticationCreds.generate();

          authState.creds
            ..noiseKey = fresh.noiseKey
            ..pairingEphemeralKeyPair = fresh.pairingEphemeralKeyPair
            ..signedIdentityKey = fresh.signedIdentityKey
            ..signedPreKey = fresh.signedPreKey
            ..advSecretKey = fresh.advSecretKey
            ..registrationId = fresh.registrationId
            ..me = null
            ..platform = 'smba'
            ..account = null
            ..signalIdentities = null
            ..lastAccountSyncTimestamp = null
            ..myAppStateKeyId = null
            ..processedHistoryMessages = <dynamic>[]
            ..nextPreKeyId = 1
            ..firstUnuploadedPreKeyId = 1
            ..accountSyncCounter = 0
            ..accountSettings = {'unarchiveChats': false}
            ..registered = false
            ..pairingCode = null
            ..lastPropHash = null
            ..routingInfo = null
            ..additionalData = null;

          authState.keys.init(
            identityKey: authState.creds.signedIdentityKey,
            registrationId: authState.creds.registrationId,
          );
          await authState.saveCreds();
          return authState.creds.noiseKey;
        }

        final newKey = await generateX25519KeyPair();
        authState.creds.noiseKey = newKey;
        await authState.saveCreds();
        return newKey;
      },
      onRoutingInfo: (info) async {
        authState.creds.routingInfo = info;
        await authState.saveCreds();
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
      socket: socket,
    );

    _retry = MessageRetryHandler(
      socket: socket,
      ev: ev,
      store: authState.keys,
    );

    socket.on('message', _msgRecv.handleNode);
    socket.on('receipt', (node) async => ev.emit('messages.update', node));
    socket.on('success', _onSuccess);

    await socket.connect();
  }

  Future<void> _onSuccess(BinaryNode node) async {
    _updateServerTimeOffset(node);

    try {
      await _uploadPreKeysIfRequired();
      await socket.sendPassiveIq('active');
    } catch (e) {
      config.logger.warning('failed to send initial passive iq: $e');
    }

    config.logger.info('opened connection to WA');

    final lid = node.attrs['lid']?.toString();
    final me = authState.creds.me;
    if (lid != null && lid.isNotEmpty && me != null && me.lid != lid) {
      authState.creds.me = WAMe(id: me.id, name: me.name, lid: lid);
      await authState.saveCreds();
    }

    await _sendUnifiedSession();
    await _sendPresenceName();
  }

  void _updateServerTimeOffset(BinaryNode node) {
    final tValue = node.attrs['t']?.toString();
    if (tValue == null || tValue.isEmpty) return;
    final parsed = int.tryParse(tValue);
    if (parsed == null || parsed <= 0) return;
    final localMs = DateTime.now().millisecondsSinceEpoch;
    _serverTimeOffsetMs = parsed * 1000 - localMs;
  }

  String _getUnifiedSessionId() {
    const dayMs = 24 * 60 * 60 * 1000;
    const weekMs = 7 * dayMs;
    final now = DateTime.now().millisecondsSinceEpoch + _serverTimeOffsetMs;
    final id = (now + 3 * dayMs) % weekMs;
    return id.toString();
  }

  Future<void> _sendUnifiedSession() async {
    try {
      await socket.sendNode(
        BinaryNode(
          tag: 'ib',
          attrs: const {},
          content: [
            BinaryNode(
              tag: 'unified_session',
              attrs: {'id': _getUnifiedSessionId()},
            ),
          ],
        ),
      );
    } catch (e) {
      config.logger.fine('failed to send unified_session: $e');
    }
  }

  Future<void> _sendPresenceName() async {
    final name = authState.creds.me?.name;
    if (name == null || name.isEmpty) return;
    try {
      await socket.sendNode(
        BinaryNode(
          tag: 'presence',
          attrs: {'name': name.replaceAll('@', ''), 'type': 'available'},
        ),
      );
    } catch (_) {
      // Best-effort only.
    }
  }

  Future<void> _uploadPreKeysIfRequired() async {
    final identPub =
        await authState.creds.signedIdentityKey.extractPublicKey();
    final newNext = await signal_auth.maybeRefillPreKeys(
      socket: socket,
      store: authState.keys,
      identityPublicKey: Uint8List.fromList(identPub.bytes),
      signedPreKey: authState.creds.signedPreKey,
      signedPreKeySignature: authState.creds.signedPreKey.signature,
      nextPreKeyId: authState.creds.nextPreKeyId,
      registrationId: authState.creds.registrationId,
    );

    if (newNext != authState.creds.nextPreKeyId) {
      authState.creds
        ..nextPreKeyId = newNext
        ..firstUnuploadedPreKeyId = newNext;
      await authState.saveCreds();
    }
  }

  void dispose() {
    _qrAuth.stop();
    _retry.dispose();
    socket.dispose();
    _qrController.close();
  }
}
