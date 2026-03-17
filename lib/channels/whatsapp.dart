import 'dart:async';

import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../services/pairing_service.dart';
import '../whatsapp/baileys.dart';
import 'channel_interface.dart';

export '../whatsapp/types.dart' show WAConnectionStatus;

const _type = 'whatsapp';

/// WhatsApp channel adapter.
///
/// Wraps [WhatsAppClient] (the Dart port of Baileys) to implement the
/// [ChannelAdapter] interface used by FlutterClaw's [ChannelRouter].
class WhatsAppChannelAdapter implements ChannelAdapter {
  WhatsAppChannelAdapter({
    String? authDir,
    this.allowedUserIds = const [],
    this.dmPolicy = 'pairing',
    this.pairingService,
    this.chatCommandHandler,
  }) : _authDir = authDir;

  final String? _authDir;
  final List<String> allowedUserIds;
  final String dmPolicy;
  final PairingService? pairingService;
  final Future<String?> Function(String sessionKey, String command)?
      chatCommandHandler;

  final _log = Logger('WhatsAppChannelAdapter');

  WhatsAppClient? _client;
  MessageHandler? _handler;
  StreamSubscription? _msgSub;
  StreamSubscription? _connSub;
  bool _running = false;

  /// Broadcast stream of QR code strings for the UI to render.
  final _qrController = StreamController<String>.broadcast();
  Stream<String> get qrStream => _qrController.stream;

  /// Last emitted QR code — allows the config screen to show it
  /// immediately even if it was emitted before the screen was opened.
  String? _lastQrCode;
  String? get lastQrCode => _lastQrCode;

  /// Broadcast stream of connection state updates for the UI.
  final _stateController =
      StreamController<WAConnectionStatus>.broadcast();
  Stream<WAConnectionStatus> get connectionStateStream =>
      _stateController.stream;

  WAConnectionStatus _connectionStatus = WAConnectionStatus.disconnected;
  WAConnectionStatus get connectionStatus => _connectionStatus;

  @override
  String get type => _type;

  @override
  bool get isConnected => _connectionStatus == WAConnectionStatus.connected;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<void> start(MessageHandler handler) async {
    if (_running) return;
    _running = true;
    _handler = handler;

    try {
      final authDir = await _resolveAuthDir();
      final authState = await WAAuthState.load(authDir);

      _client = await makeWASocket(
        authState: authState,
        config: WASocketConfig(logger: Logger('WASocket')),
      );

      // Forward QR codes to our stream, caching the latest value so the
      // config screen can read it even if it opens after the QR was emitted.
      _client!.qrStream.listen((qr) {
        _lastQrCode = qr;
        _qrController.add(qr);
      });

      // Track connection state.
      _connSub = _client!.connectionUpdates.listen((update) {
        final status = _mapConnectionState(update.state);
        _connectionStatus = status;
        _stateController.add(status);
        _log.info('WhatsApp connection: $status');
      });

      // Save credentials whenever they change.
      _client!.ev.on<void>('creds.update', (_) async {
        await authState.saveCreds();
      });

      // Handle incoming messages.
      _msgSub = Stream<void>.periodic(Duration.zero).listen((_) {});
      _client!.ev.on<Map<String, dynamic>>('messages.upsert', (data) {
        final messages = data['messages'] as List? ?? [];
        for (final raw in messages) {
          if (raw is WAMessage) {
            _handleIncoming(raw);
          }
        }
      });
    } catch (e, st) {
      _log.severe('WhatsApp adapter start failed', e, st);
      _running = false;
    }
  }

  @override
  Future<void> stop() async {
    _running = false;
    _lastQrCode = null;
    await _msgSub?.cancel();
    await _connSub?.cancel();
    await _client?.end();
    _client = null;
    _connectionStatus = WAConnectionStatus.disconnected;
    _handler = null;
  }

  // ---------------------------------------------------------------------------
  // Send
  // ---------------------------------------------------------------------------

  @override
  Future<void> sendMessage(OutgoingMessage message) async {
    if (message.channelType != _type) return;
    final client = _client;
    if (client == null) throw StateError('WhatsApp client not started');

    try {
      if (message.text.isNotEmpty) {
        await client.sendMessage(message.chatId, TextContent(message.text));
      }
    } catch (e, st) {
      _log.severe('WhatsApp send failed', e, st);
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  // Incoming message dispatch
  // ---------------------------------------------------------------------------

  void _handleIncoming(WAMessage msg) {
    final text = msg.body ?? '';
    if (text.isEmpty) return;

    final senderId = msg.remoteJid;
    final senderName = senderId.split('@').first;
    final chatId = msg.remoteJid;
    final isGroup = isJidGroup(chatId);

    // DM policy check (non-group).
    if (!isGroup) {
      _checkDmPolicy(senderId, senderName, chatId).then((allowed) {
        if (!allowed) return;
        _dispatchMessage(
            senderId: senderId,
            senderName: senderName,
            chatId: chatId,
            text: text,
            isGroup: isGroup,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
                msg.timestamp * 1000));
      }).catchError((e) { _log.warning('DM policy check failed: $e'); });
      return;
    }

    _dispatchMessage(
      senderId: senderId,
      senderName: senderName,
      chatId: chatId,
      text: text,
      isGroup: isGroup,
      timestamp: DateTime.fromMillisecondsSinceEpoch(msg.timestamp * 1000),
    );
  }

  void _dispatchMessage({
    required String senderId,
    required String senderName,
    required String chatId,
    required String text,
    required bool isGroup,
    required DateTime timestamp,
  }) {
    // Slash command handling.
    if (text.startsWith('/') && chatCommandHandler != null) {
      final sessionKey = '$_type:$chatId';
      chatCommandHandler!(sessionKey, text).then((response) {
        if (response != null) {
          sendMessage(OutgoingMessage(
              channelType: _type, chatId: chatId, text: response));
        }
      }).catchError((e) { _log.warning('Command handler error: $e'); });
      return;
    }

    final incoming = IncomingMessage(
      channelType: _type,
      senderId: senderId,
      senderName: senderName,
      chatId: chatId,
      text: text,
      isGroup: isGroup,
      timestamp: timestamp,
    );

    _handler?.call(incoming).catchError((e, st) {
      _log.severe('Handler error for WhatsApp message', e, st);
    });
  }

  // ---------------------------------------------------------------------------
  // DM policy
  // ---------------------------------------------------------------------------

  Future<bool> _checkDmPolicy(
      String senderId, String senderName, String chatId) async {
    switch (dmPolicy) {
      case 'open':
        return true;
      case 'disabled':
        return false;
      case 'allowlist':
        if (allowedUserIds.isEmpty) return true;
        return allowedUserIds.contains(senderId);
      case 'pairing':
      default:
        if (allowedUserIds.isNotEmpty && allowedUserIds.contains(senderId)) {
          return true;
        }
        if (pairingService == null) return true;
        final approved = await pairingService!.isApproved(_type, senderId);
        if (approved) return true;

        final code = await pairingService!.createRequest(
            _type, senderId, senderName);
        if (code != null) {
          await sendMessage(OutgoingMessage(
            channelType: _type,
            chatId: chatId,
            text: 'To use this bot, send this pairing code to the owner:\n\n'
                '$code\n\nThe code expires in 1 hour.',
          ));
        }
        return false;
    }
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Future<String> _resolveAuthDir() async {
    if (_authDir != null && _authDir.isNotEmpty) return _authDir;
    final base = await getApplicationDocumentsDirectory();
    return '${base.path}/whatsapp-auth';
  }

  WAConnectionStatus _mapConnectionState(WAConnectionState state) {
    switch (state) {
      case WAConnectionState.connected:
        return WAConnectionStatus.connected;
      case WAConnectionState.connecting:
        return WAConnectionStatus.connecting;
      case WAConnectionState.closing:
        return WAConnectionStatus.closing;
      case WAConnectionState.disconnected:
        return WAConnectionStatus.disconnected;
    }
  }

  void dispose() {
    _qrController.close();
    _stateController.close();
  }
}

// Re-export the JID utility needed above.
bool isJidGroup(String jid) => jid.endsWith('@g.us');
