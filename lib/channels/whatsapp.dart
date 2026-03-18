import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../services/pairing_service.dart';
import '../whatsapp/baileys.dart';
import '../whatsapp/binary/jid_utils.dart' as wa_jid;
import 'channel_interface.dart';

export '../whatsapp/types.dart' show WAConnectionStatus;

const _type = 'whatsapp';

/// WhatsApp channel adapter.
class WhatsAppChannelAdapter implements ChannelAdapter {
  WhatsAppChannelAdapter({
    String? authDir,
    this.allowedUserIds = const [],
    this.dmPolicy = 'pairing',
    this.selfChatMode,
    this.pairingService,
    this.chatCommandHandler,
  }) : _authDir = authDir;

  final String? _authDir;
  final List<String> allowedUserIds;
  final String dmPolicy;
  final bool? selfChatMode;
  final PairingService? pairingService;
  final Future<String?> Function(String sessionKey, String command)?
  chatCommandHandler;

  final _log = Logger('WhatsAppChannelAdapter');

  WhatsAppClient? _client;
  WAAuthState? _authState;
  String? _resolvedAuthDir;
  MessageHandler? _handler;
  StreamSubscription? _msgSub;
  StreamSubscription? _connSub;
  bool _running = false;
  bool _restartInFlight = false;
  final Map<String, Timer> _typingTimers = {};

  final _qrController = StreamController<String>.broadcast();
  Stream<String> get qrStream => _qrController.stream;

  String? _lastQrCode;
  String? get lastQrCode => _lastQrCode;
  StreamSubscription<String>? _clientQrSub;
  StreamSubscription<void>? _credsUpdateSub;
  StreamSubscription<Map<String, dynamic>>? _messagesUpsertSub;
  StreamSubscription<Map<String, dynamic>>? _decryptErrorSub;

  final _stateController = StreamController<WAConnectionStatus>.broadcast();
  Stream<WAConnectionStatus> get connectionStateStream =>
      _stateController.stream;

  WAConnectionStatus _connectionStatus = WAConnectionStatus.disconnected;
  WAConnectionStatus get connectionStatus => _connectionStatus;

  WADisconnectReason? _lastDisconnectReason;
  WADisconnectReason? get lastDisconnectReason => _lastDisconnectReason;
  bool get requiresRelink =>
      _lastDisconnectReason == WADisconnectReason.loggedOut ||
      _lastDisconnectReason == WADisconnectReason.badSession;

  bool _restartPending = false;
  bool get isRestartPending => _restartPending;

  @override
  String get type => _type;

  @override
  bool get isConnected => _connectionStatus == WAConnectionStatus.connected;

  static Future<String> resolveAuthDir([String? authDir]) async {
    if (authDir != null && authDir.isNotEmpty) return authDir;
    final base = await getApplicationDocumentsDirectory();
    return '${base.path}/whatsapp-auth';
  }

  static Future<bool> hasLinkedAuth([String? authDir]) async {
    final resolved = await resolveAuthDir(authDir);
    return WAAuthState.hasLinkedSession(resolved);
  }

  static Future<void> clearAuth([String? authDir]) async {
    final resolved = await resolveAuthDir(authDir);
    final directory = Directory(resolved);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }

  @override
  Future<void> start(MessageHandler handler) async {
    if (_running) return;
    _running = true;
    _handler = handler;

    try {
      final authDir = await resolveAuthDir(_authDir);
      _resolvedAuthDir = authDir;
      final authState = await WAAuthState.load(authDir);
      _authState = authState;
      _log.info(
        'Starting WhatsApp adapter authDir=$authDir '
        'dmPolicy=$dmPolicy selfChatMode=${selfChatMode ?? 'auto'} '
        'allowFromCount=${allowedUserIds.length} '
        'hasMe=${authState.creds.me != null} me=${authState.creds.me?.id ?? '-'} '
        'lid=${authState.creds.me?.lid ?? '-'}',
      );
      await _createAndAttachClient(authState);
    } catch (e, st) {
      _log.severe('WhatsApp adapter start failed', e, st);
      _running = false;
      rethrow;
    }
  }

  @override
  Future<void> stop() async {
    _log.info('Stopping WhatsApp adapter');
    _running = false;
    _lastQrCode = null;
    for (final timer in _typingTimers.values) {
      timer.cancel();
    }
    _typingTimers.clear();
    await _clientQrSub?.cancel();
    _clientQrSub = null;
    await _messagesUpsertSub?.cancel();
    _messagesUpsertSub = null;
    await _decryptErrorSub?.cancel();
    _decryptErrorSub = null;
    await _credsUpdateSub?.cancel();
    _credsUpdateSub = null;
    await _connSub?.cancel();
    _connSub = null;
    await _msgSub?.cancel();
    _msgSub = null;
    await _client?.end();
    _client = null;
    _authState = null;
    _resolvedAuthDir = null;
    _connectionStatus = WAConnectionStatus.disconnected;
    _restartPending = false;
    _restartInFlight = false;
    _lastDisconnectReason = null;
    _handler = null;
    _log.info('WhatsApp adapter stopped');
  }

  @override
  Future<void> sendMessage(OutgoingMessage message) async {
    if (message.channelType != _type) return;
    final client = _client;
    if (client == null) throw StateError('WhatsApp client not started');

    try {
      _log.info(
        'Sending outbound WhatsApp message '
        'action=${message.action ?? 'text'} chatId=${message.chatId} '
        'textLength=${message.text.length} '
        'targetMessageId=${message.targetMessageId ?? '-'} '
        'participantId=${message.participantId ?? '-'}',
      );
      if (message.action == 'react') {
        final targetId = message.targetMessageId;
        if (targetId == null || targetId.isEmpty) {
          throw StateError('Missing targetMessageId for WhatsApp reaction');
        }
        await client.sendMessage(
          message.chatId,
          ReactionContent(
            targetId: targetId,
            emoji: message.emoji ?? '',
            remoteJid: message.chatId,
            participant: message.participantId,
            fromMe: message.fromMe ?? false,
          ),
        );
        return;
      }

      if (message.text.isNotEmpty) {
        await client.sendMessage(message.chatId, TextContent(message.text));
      }
    } catch (e, st) {
      _log.severe('WhatsApp send failed', e, st);
      rethrow;
    }
  }

  Future<void> sendTyping(String chatId) async {
    final client = _client;
    if (client == null) return;
    try {
      _log.fine('Sending composing presence chatId=$chatId');
      await client.sendPresenceUpdate('composing', toJid: chatId);
    } catch (_) {}
  }

  Future<void> sendPaused(String chatId) async {
    final client = _client;
    if (client == null) return;
    try {
      _log.fine('Sending paused presence chatId=$chatId');
      await client.sendPresenceUpdate('paused', toJid: chatId);
    } catch (_) {}
  }

  void startTyping(String chatId) {
    _typingTimers[chatId]?.cancel();
    unawaited(sendTyping(chatId));
    _typingTimers[chatId] = Timer.periodic(
      const Duration(seconds: 3),
      (_) => unawaited(sendTyping(chatId)),
    );
  }

  void stopTyping(String chatId) {
    _typingTimers[chatId]?.cancel();
    _typingTimers.remove(chatId);
    unawaited(sendPaused(chatId));
  }

  Future<void> _handleIncoming(WAMessage msg) async {
    final chatId = msg.remoteJid;
    final senderId =
        msg.authorAlt ?? msg.author ?? msg.remoteJidAlt ?? msg.remoteJid;
    final participantId = msg.participantAlt ?? msg.participant;
    final senderName = _displayName(senderId);
    final isGroup = isJidGroup(chatId);
    final isSelfChat = _isSelfChat(senderId, chatId);
    _log.info(
      'Handling inbound WA message ${_messageSummary(msg)} '
      'senderId=$senderId chatId=$chatId participantId=${participantId ?? '-'} '
      'isGroup=$isGroup isSelfChat=$isSelfChat fromMe=${msg.fromMe}',
    );

    if (msg.fromMe && !isSelfChat) {
      _log.info(
        'Ignoring inbound WA message because fromMe=true and not self chat',
      );
      return;
    }
    if (msg.reaction != null) {
      _log.fine('Ignoring inbound WhatsApp reaction ${msg.reaction!.emoji}');
      return;
    }

    final text = msg.body ?? '';

    if (text.isEmpty) {
      _log.info('Ignoring inbound WA message because extracted text is empty');
      return;
    }

    if (!isGroup) {
      final allowed = await _checkDmPolicy(
        senderId,
        senderName,
        chatId,
        isSelfChat: isSelfChat,
      );
      if (!allowed) {
        _log.info(
          'DM policy blocked inbound WA message senderId=$senderId chatId=$chatId',
        );
        return;
      }
      await _sendAckReaction(msg, chatId);
    }

    final channelContext = <String, dynamic>{
      'channel': _type,
      'chat_id': chatId,
      'message_id': msg.id,
    };
    if (participantId != null) {
      channelContext['participant_id'] = participantId;
    }
    if (msg.remoteJidAlt != null) {
      channelContext['chat_id_alt'] = msg.remoteJidAlt;
    }
    if (msg.authorAlt != null) {
      channelContext['sender_id_alt'] = msg.authorAlt;
    }
    if (msg.addressingMode != null) {
      channelContext['addressing_mode'] = msg.addressingMode;
    }

    _log.info(
      'Dispatching inbound WA message to handler '
      'chatId=$chatId messageId=${msg.id} textLength=${text.length}',
    );
    await _dispatchMessage(
      senderId: senderId,
      senderName: senderName,
      chatId: chatId,
      text: text,
      isGroup: isGroup,
      messageId: msg.id,
      participantId: participantId,
      replyToMessageId: msg.contextInfo?.stanzaId,
      timestamp: DateTime.fromMillisecondsSinceEpoch(msg.timestamp * 1000),
      channelContext: channelContext,
    );
  }

  Future<void> _sendAckReaction(WAMessage msg, String chatId) async {
    if (msg.id.isEmpty) return;
    try {
      _log.info('Sending ack reaction for messageId=${msg.id} chatId=$chatId');
      await sendMessage(
        OutgoingMessage(
          channelType: _type,
          chatId: chatId,
          text: '',
          action: 'react',
          targetMessageId: msg.id,
          emoji: '👀',
          participantId: msg.participant,
          fromMe: false,
        ),
      );
    } catch (e) {
      _log.fine('Ack reaction failed: $e');
    }
  }

  Future<void> _dispatchMessage({
    required String senderId,
    required String senderName,
    required String chatId,
    required String text,
    required bool isGroup,
    required DateTime timestamp,
    String? messageId,
    String? participantId,
    String? replyToMessageId,
    Map<String, dynamic>? channelContext,
  }) async {
    if (text.startsWith('/') && chatCommandHandler != null) {
      final sessionKey = '$_type:$chatId';
      _log.info(
        'Routing WhatsApp slash command sessionKey=$sessionKey textLength=${text.length}',
      );
      final response = await chatCommandHandler!(sessionKey, text);
      if (response != null) {
        _log.info(
          'Slash command handled sessionKey=$sessionKey responseLength=${response.length}',
        );
        await sendMessage(
          OutgoingMessage(channelType: _type, chatId: chatId, text: response),
        );
      }
      return;
    }

    final incoming = IncomingMessage(
      channelType: _type,
      senderId: senderId,
      senderName: senderName,
      chatId: chatId,
      text: text,
      isGroup: isGroup,
      messageId: messageId,
      participantId: participantId,
      replyToMessageId: replyToMessageId,
      timestamp: timestamp,
      channelContext: channelContext,
    );

    final handler = _handler;
    if (handler == null) {
      _log.warning(
        'No WhatsApp handler registered; dropping message chatId=$chatId senderId=$senderId',
      );
      return;
    }

    startTyping(chatId);
    try {
      _log.info(
        'Invoking WhatsApp handler chatId=$chatId senderId=$senderId isGroup=$isGroup',
      );
      await handler(incoming);
      _log.info('WhatsApp handler completed chatId=$chatId senderId=$senderId');
    } catch (e, st) {
      _log.severe('Handler error for WhatsApp message', e, st);
    } finally {
      stopTyping(chatId);
    }
  }

  Future<bool> _checkDmPolicy(
    String senderId,
    String senderName,
    String chatId, {
    required bool isSelfChat,
  }) async {
    if (dmPolicy == 'disabled') {
      _log.info('DM policy=disabled senderId=$senderId chatId=$chatId');
      return false;
    }
    if (isSelfChat) {
      _log.info('Allowing inbound WA DM because it is self chat');
      return true;
    }
    switch (dmPolicy) {
      case 'open':
        _log.info('DM policy=open senderId=$senderId');
        return true;
      case 'allowlist':
        if (allowedUserIds.isEmpty) {
          _log.info(
            'DM policy=allowlist but allowlist empty, allowing senderId=$senderId',
          );
          return true;
        }
        final allowed = _isAllowedSender(senderId);
        _log.info(
          'DM policy=allowlist senderId=$senderId allowed=$allowed allowFromCount=${allowedUserIds.length}',
        );
        return allowed;
      case 'pairing':
      default:
        if (allowedUserIds.isNotEmpty && _isAllowedSender(senderId)) {
          _log.info(
            'DM policy=pairing senderId=$senderId already in allowlist',
          );
          return true;
        }
        if (pairingService == null) {
          _log.info(
            'DM policy=pairing but pairingService is null, allowing senderId=$senderId',
          );
          return true;
        }
        final approved = await pairingService!.isApproved(_type, senderId);
        if (approved) {
          _log.info('DM policy=pairing senderId=$senderId already approved');
          return true;
        }

        final code = await pairingService!.createRequest(
          _type,
          senderId,
          senderName,
        );
        _log.info(
          'DM policy=pairing created approval request senderId=$senderId hasCode=${code != null}',
        );
        if (code != null) {
          await sendMessage(
            OutgoingMessage(
              channelType: _type,
              chatId: chatId,
              text:
                  'To use this bot, send this pairing code to the owner:\n\n'
                  '$code\n\nThe code expires in 1 hour.',
            ),
          );
        }
        return false;
    }
  }

  WAConnectionStatus _mapConnectionUpdate(
    ConnectionUpdate update, {
    required bool isAuthenticated,
  }) {
    if ((_restartPending || _restartInFlight) &&
        update.state == WAConnectionState.disconnected) {
      return WAConnectionStatus.connecting;
    }
    switch (update.state) {
      case WAConnectionState.connected:
        return isAuthenticated
            ? WAConnectionStatus.connected
            : WAConnectionStatus.connecting;
      case WAConnectionState.connecting:
        return WAConnectionStatus.connecting;
      case WAConnectionState.closing:
        return WAConnectionStatus.closing;
      case WAConnectionState.disconnected:
        return WAConnectionStatus.disconnected;
    }
  }

  String _displayName(String senderId) {
    final user = senderId.split('@').first;
    return user.split(':').first;
  }

  bool _isAllowedSender(String senderId) {
    return allowedUserIds.any((candidate) {
      if (candidate == senderId) return true;
      return wa_jid.areJidsSameUser(candidate, senderId);
    });
  }

  bool _isSelfChat(String senderId, String chatId) {
    if (selfChatMode == false) {
      return false;
    }
    return !_isGroupOrBroadcast(chatId) &&
        _isSelfJid(senderId) &&
        _isSelfJid(chatId);
  }

  bool _isSelfJid(String jid) {
    final me = _authState?.creds.me;
    if (me == null) return false;
    return wa_jid.areJidsSameUser(jid, me.id) ||
        (me.lid != null &&
            me.lid!.isNotEmpty &&
            wa_jid.areJidsSameUser(jid, me.lid));
  }

  bool _isGroupOrBroadcast(String jid) {
    return isJidGroup(jid) ||
        wa_jid.isJidBroadcast(jid) ||
        wa_jid.isJidNewsletter(jid);
  }

  Future<void> _createAndAttachClient(WAAuthState authState) async {
    final client = await makeWASocket(
      authState: authState,
      config: WASocketConfig(logger: Logger('WASocket')),
    );
    if (!_running) {
      await client.end();
      return;
    }

    _client = client;
    _authState = authState;

    _clientQrSub = client.qrStream.listen((qr) {
      if (_client != client) return;
      _log.info('WhatsApp adapter received QR event length=${qr.length}');
      _lastQrCode = qr;
      _connectionStatus = WAConnectionStatus.connecting;
      _stateController.add(_connectionStatus);
      _qrController.add(qr);
    });

    _connSub = client.connectionUpdates.listen((update) {
      if (_client != client) return;
      _log.info(
        'Raw WA connection update state=${update.state} '
        'disconnectReason=${update.disconnectReason ?? '-'} '
        'statusCode=${update.disconnectStatusCode ?? '-'} '
        'lastDisconnect=${update.lastDisconnect ?? '-'} '
        'isAuthenticated=${client.isAuthenticated}',
      );
      _lastDisconnectReason = update.disconnectReason;
      if (update.disconnectReason == WADisconnectReason.restartRequired) {
        _restartPending = true;
        if (update.state == WAConnectionState.disconnected) {
          unawaited(_restartClientAfterPairing(client));
        }
      }
      if (update.state == WAConnectionState.connected) {
        _restartPending = false;
        _restartInFlight = false;
      }
      final status = _mapConnectionUpdate(
        update,
        isAuthenticated: client.isAuthenticated,
      );
      _connectionStatus = status;
      _stateController.add(status);
      _log.info('WhatsApp connection: $status');
    });

    _credsUpdateSub = client.ev.on<dynamic>('creds.update', (_) async {
      if (_client != client) return;
      _log.info(
        'creds.update received me=${authState.creds.me?.id ?? '-'} '
        'lid=${authState.creds.me?.lid ?? '-'} '
        'signalIdentityCount=${authState.creds.signalIdentities?.length ?? 0}',
      );
      await authState.saveCreds();
    });

    _messagesUpsertSub = client.ev.on<Map<String, dynamic>>(
      'messages.upsert',
      (data) {
        if (_client != client) return;
        final messages = data['messages'] as List? ?? [];
        _log.info('messages.upsert received count=${messages.length}');
        for (final raw in messages) {
          if (raw is WAMessage) {
            _log.info('Inbound WA message ${_messageSummary(raw)}');
            unawaited(_handleIncoming(raw));
          }
        }
      },
    );

    _decryptErrorSub = client.ev.on<Map<String, dynamic>>(
      'messages.decrypt-error',
      (data) {
        if (_client != client) return;
        _log.warning(
          'WhatsApp decrypt error '
          'id=${data['id'] ?? '-'} '
          'from=${data['from'] ?? '-'} '
          'senderId=${data['senderId'] ?? '-'} '
          'senderAlt=${data['senderAlt'] ?? '-'} '
          'chatId=${data['chatId'] ?? '-'} '
          'chatIdAlt=${data['chatIdAlt'] ?? '-'} '
          'fromMe=${data['fromMe'] ?? '-'} '
          'addressingMode=${data['addressingMode'] ?? '-'} '
          'encType=${data['encType'] ?? '-'} '
          'encBytes=${data['encBytes'] ?? '-'} '
          'error=${data['error'] ?? '-'}',
        );
      },
    );
  }

  Future<void> _restartClientAfterPairing(WhatsAppClient sourceClient) async {
    if (!_running || _restartInFlight || _client != sourceClient) {
      return;
    }
    final authDir = _resolvedAuthDir;
    if (authDir == null) {
      _log.warning('Skipping full WhatsApp restart because authDir is null');
      return;
    }

    _restartInFlight = true;
    _log.info('Restarting WhatsApp client after pairing to mirror OpenClaw');

    await _clientQrSub?.cancel();
    _clientQrSub = null;
    await _messagesUpsertSub?.cancel();
    _messagesUpsertSub = null;
    await _decryptErrorSub?.cancel();
    _decryptErrorSub = null;
    await _credsUpdateSub?.cancel();
    _credsUpdateSub = null;
    await _connSub?.cancel();
    _connSub = null;
    _client = null;

    try {
      await _authState?.saveCreds();
    } catch (e) {
      _log.warning('Failed to flush creds before WhatsApp restart: $e');
    }

    try {
      await sourceClient.end();
    } catch (e) {
      _log.warning('Error while stopping WhatsApp client for restart: $e');
    }

    if (!_running) {
      _restartInFlight = false;
      return;
    }

    try {
      final freshAuthState = await WAAuthState.load(authDir);
      _log.info(
        'Reloaded WhatsApp auth after pairing restart '
        'hasMe=${freshAuthState.creds.me != null} '
        'me=${freshAuthState.creds.me?.id ?? '-'} '
        'lid=${freshAuthState.creds.me?.lid ?? '-'}',
      );
      await _createAndAttachClient(freshAuthState);
    } catch (e, st) {
      _log.severe('WhatsApp full restart after pairing failed', e, st);
      _connectionStatus = WAConnectionStatus.disconnected;
      _stateController.add(_connectionStatus);
    } finally {
      _restartPending = false;
      _restartInFlight = false;
    }
  }

  void dispose() {
    _log.info('Disposing WhatsApp adapter streams');
    _qrController.close();
    _stateController.close();
  }

  String _messageSummary(WAMessage msg) {
    return 'id=${msg.id} remoteJid=${msg.remoteJid} '
        'remoteJidAlt=${msg.remoteJidAlt ?? '-'} '
        'participant=${msg.participant ?? '-'} '
        'participantAlt=${msg.participantAlt ?? '-'} '
        'author=${msg.author ?? '-'} '
        'authorAlt=${msg.authorAlt ?? '-'} '
        'fromMe=${msg.fromMe} '
        'stubType=${msg.stubType?.name ?? '-'} '
        'bodyLength=${msg.body?.length ?? 0} '
        'timestamp=${msg.timestamp}';
  }
}

bool isJidGroup(String jid) => jid.endsWith('@g.us');
