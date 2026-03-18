import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'app_state_sync.dart';
import 'auth/auth_state.dart';
import 'auth/pairing_code_auth.dart' as pairing;
import 'auth/qr_auth.dart';
import 'binary/generic_utils.dart';
import 'binary/jid_utils.dart';
import 'binary/types.dart';
import 'media/media_download.dart' as media_dl;
import 'media/media_upload.dart' as media_ul;
import 'messages/message_recv.dart';
import 'messages/message_retry.dart';
import 'messages/message_send.dart' as msg_send;
import 'noise/noise_crypto.dart' show generateX25519KeyPair;
import 'proto/wa_proto.pb.dart';
import 'signal/sender_key.dart';
import 'signal/signal_auth.dart' as signal_auth;
import 'signal/signal_store.dart' show FileBasedSignalStore, PreKeyRecord;
import 'socket/wa_socket.dart' as low;
import 'socket/wa_socket_config.dart';
import 'types.dart';
import 'utils/event_emitter.dart';
import 'utils/stanza_ack.dart';

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
  }) : _authState = authState,
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
  bool get isAuthenticated => _authState.creds.me != null;

  // ── Messaging ──────────────────────────────────────────────────────────────

  Future<WAMessage> sendMessage(
    String jid,
    WAMessageContent content, {
    WAMessage? quoted,
  }) => msg_send.sendMessage(
    socket: _impl.socket,
    store: _authState.keys,
    jid: jid,
    content: content,
    quoted: quoted,
  );

  Future<void> sendPresenceUpdate(String type, {String? toJid}) =>
      _impl.socket.sendPresenceUpdate(type, toJid: toJid);

  // ── Media ──────────────────────────────────────────────────────────────────

  Future<media_ul.MediaUploadResult> uploadMedia(
    Uint8List bytes,
    String mediaType,
  ) => media_ul.uploadMedia(
    socket: _impl.socket,
    mediaBytes: bytes,
    mediaType: mediaType,
  );

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
    await _impl.socket.sendNode(
      BinaryNode(
        tag: 'iq',
        attrs: {
          'to': '@s.whatsapp.net',
          'type': 'set',
          'id': 'logout',
          'xmlns': 'md',
        },
        content: [BinaryNode(tag: 'remove-companion-device', attrs: {})],
      ),
    );
    await end();
  }

  Future<void> end() async {
    await _impl.dispose();
    await ev.dispose();
  }
}

/// Factory — equivalent to Baileys' `makeWASocket()`.
Future<WhatsAppClient> makeWASocket({
  required WAAuthState authState,
  WASocketConfig? config,
}) => WhatsAppClient.create(authState: authState, config: config);

// ---------------------------------------------------------------------------
// Internal implementation
// ---------------------------------------------------------------------------

enum _InitialSyncState { connecting, awaitingInitialSync, syncing, online }

const _minPreKeyCount = 5;

class _ClientImpl {
  final WAAuthState authState;
  final WASocketConfig config;
  final WAEventEmitter ev;

  late final low.WASocket socket;
  late final QRAuth _qrAuth;
  late final MessageReceiver _msgRecv;
  late final MessageRetryHandler _retry;
  late final AppStateSyncManager _appStateSync;

  final _qrController = StreamController<String>.broadcast();
  Stream<String> get qrStream => _qrController.stream;
  StreamSubscription<String>? _qrForwardSub;
  StreamSubscription<dynamic>? _appStateSyncKeyShareSub;
  StreamSubscription<Map<String, dynamic>>? _historySyncSub;
  StreamSubscription<low.ConnectionUpdate>? _socketConnSub;
  bool _disposed = false;
  bool _didStartConnectBuffer = false;
  final _sendAgainCounts = <String, int>{};
  final _callOfferCache = <String, WACallEvent>{};

  int _serverTimeOffsetMs = 0;
  _InitialSyncState _initialSyncState = _InitialSyncState.connecting;
  Timer? _awaitingInitialSyncTimeout;

  _ClientImpl({
    required this.authState,
    required this.config,
    required this.ev,
  });

  Future<void> connect() async {
    _transitionInitialSyncState(
      _InitialSyncState.connecting,
      reason: 'connect',
    );
    if (authState.creds.me?.id != null && !ev.isBuffering()) {
      ev.buffer();
      _didStartConnectBuffer = true;
      config.logger.info('Connection bootstrap buffer enabled');
    } else {
      _didStartConnectBuffer = false;
    }
    config.logger.info(
      'WhatsApp client connect start '
      'hasMe=${authState.creds.me != null} '
      'me=${authState.creds.me?.id ?? '-'} '
      'lid=${authState.creds.me?.lid ?? '-'} '
      'nextPreKeyId=${authState.creds.nextPreKeyId}',
    );
    socket = low.WASocket(
      config: config,
      noiseKey: authState.creds.noiseKey,
      passive: authState.creds.me != null,
      creds: authState.creds,
      onKeyRefreshNeeded: (reason) async {
        config.logger.info(
          'Noise/auth refresh requested reason=$reason hasMe=${authState.creds.me != null}',
        );
        // Mirror Baileys/OpenClaw:
        // - 500 on an unpaired connection => full creds reset
        // - 405                          => rotate only noise key
        // - 401                          => terminal loggedOut, no key rotation
        if (reason == 401) {
          config.logger.info(
            'Skipping noise key refresh for logged-out session (401)',
          );
          return null;
        }
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
            ..additionalData = null
            ..lidToPn = <String, String>{}
            ..pnToLid = <String, String>{};

          final keys = authState.keys;
          if (keys is FileBasedSignalStore) {
            keys.init(
              identityKey: authState.creds.signedIdentityKey,
              registrationId: authState.creds.registrationId,
            );
          }
          await authState.keys.storePreKey(
            0x80000000 | authState.creds.signedPreKey.id,
            PreKeyRecord(
              id: authState.creds.signedPreKey.id,
              keyPair: authState.creds.signedPreKey.keyPair,
            ),
          );
          await authState.saveCreds();
          config.logger.info(
            'Rebuilt fresh auth credentials after badSession during pairing',
          );
          return authState.creds.noiseKey;
        }

        if (reason != 405) {
          config.logger.info(
            'Skipping noise key refresh for unsupported auth reason=$reason',
          );
          return null;
        }

        final newKey = await generateX25519KeyPair();
        authState.creds.noiseKey = newKey;
        await authState.saveCreds();
        config.logger.info('Rotated noise key after auth rejection');
        return newKey;
      },
      onRoutingInfo: (info) async {
        config.logger.info('Persisting routing info bytes=${info.length}');
        authState.creds.routingInfo = info;
        await authState.saveCreds();
      },
    );

    _qrAuth = QRAuth(socket: socket, authState: authState);
    _qrForwardSub = _qrAuth.qrStream.listen((qr) {
      if (!_qrController.isClosed) {
        config.logger.info('Forwarding QR event length=${qr.length}');
        _qrController.add(qr);
      }
    });
    _qrAuth.start();

    final senderKeyMgr = SenderKeyManager(store: authState.keys);
    _appStateSync = AppStateSyncManager(
      authState: authState,
      socket: socket,
      ev: ev,
      logger: config.logger,
    );

    _msgRecv = MessageReceiver(
      store: authState.keys,
      senderKeyManager: senderKeyMgr,
      ev: ev,
      socket: socket,
      creds: authState.creds,
      saveCreds: authState.saveCreds,
    );

    _retry = MessageRetryHandler(
      socket: socket,
      ev: ev,
      store: authState.keys,
      creds: authState.creds,
      saveCreds: authState.saveCreds,
    );

    _appStateSyncKeyShareSub = ev.on<dynamic>('app-state.sync-key-share', (_) {
      if (_disposed) return;
      unawaited(_handleAppStateSyncKeyShare());
    });
    _historySyncSub = ev.on<Map<String, dynamic>>(
      'history.sync-notification',
      (data) {
        if (_disposed) return;
        unawaited(_handleHistorySyncNotification(data));
      },
    );
    _socketConnSub = socket.connectionUpdates.listen(_handleSocketConnectionUpdate);

    socket.on('message', _msgRecv.handleNode);
    socket.on('ib', _handleIb);
    socket.on('notification', _handleNotification);
    socket.on('receipt', _handleReceipt);
    socket.on('call', _handleCall);
    socket.on('ack', _handleAck);
    socket.on('success', _onSuccess);

    await socket.connect();
  }

  Future<void> _onSuccess(BinaryNode node) async {
    config.logger.info('WA success handler start attrs=${node.attrs}');
    _updateServerTimeOffset(node);
    config.logger.info('Server time offset now ${_serverTimeOffsetMs}ms');

    try {
      config.logger.info(
        'Post-login init: ensuring pre-keys and sending passive active IQ',
      );
      await _uploadPreKeysIfRequired();
      await socket.sendPassiveIq('active');
      await _digestKeyBundle();
      config.logger.info('Post-login init: passive active IQ sent');
    } catch (e) {
      config.logger.warning('failed to send initial passive iq: $e');
    }

    config.logger.info('opened connection to WA');
    unawaited(_executeInitQueries());

    final lid = node.attrs['lid']?.toString();
    final me = authState.creds.me;
    if (lid != null && lid.isNotEmpty && me != null && me.lid != lid) {
      config.logger.info('Updating me.lid from ${me.lid ?? '-'} to $lid');
      authState.creds.me = WAMe(id: me.id, name: me.name, lid: lid);
      await authState.saveCreds();
    }
    await _syncOwnLidMapping();

    await _sendUnifiedSession();
    config.logger.info('WA success handler complete');
  }

  Future<void> _handleIb(BinaryNode node) async {
    final childTags = node.children.map((child) => child.tag).toList();
    config.logger.info(
      'Handling WA ib from=${node.attrs['from'] ?? '-'} childTags=$childTags',
    );

    if (getBinaryNodeChild(node, 'offline_preview') != null) {
      config.logger.info('offline_preview received — requesting offline_batch');
      try {
        await socket.sendNode(
          BinaryNode(
            tag: 'ib',
            attrs: const {},
            content: [
              BinaryNode(
                tag: 'offline_batch',
                attrs: const {'count': '100'},
              ),
            ],
          ),
        );
      } catch (e) {
        config.logger.warning('failed to request offline_batch: $e');
      }
    }

    final offlineNode = getBinaryNodeChild(node, 'offline');
    if (offlineNode != null) {
      final count = offlineNode.attrs['count'] ?? '0';
      config.logger.info('handled $count offline messages/notifications');
    }

    final dirtyNode = getBinaryNodeChild(node, 'dirty');
    if (dirtyNode != null) {
      try {
        await _appStateSync.handleDirtyNode(dirtyNode);
      } catch (e) {
        config.logger.warning('failed to handle dirty node: $e');
      }
    }
  }

  Future<void> _handleNotification(BinaryNode node) async {
    config.logger.info(
      'Handling WA notification type=${node.attrs['type'] ?? '-'} '
      'id=${node.attrs['id'] ?? '-'} from=${node.attrs['from'] ?? '-'}',
    );
    final type = node.attrs['type']?.toString() ?? '';
    try {
      if (type == 'server_sync') {
        final names = getBinaryNodeChildren(
          node,
          'collection',
        ).map((child) => child.attrs['name']?.toString() ?? '').where((name) {
          return name.isNotEmpty;
        }).toSet();
        if (names.isNotEmpty) {
          unawaited(
            _appStateSync.triggerCollectionsSync(
              collections: names,
              reason: 'server_sync',
            ),
          );
        }
      }

      final msg = await _processNotification(node);
      if (msg != null) {
        ev.emit('messages.upsert', {
          'messages': [msg],
          'type': node.attrs.containsKey('offline') ? 'append' : 'notify',
        });
      }
    } catch (e, st) {
      config.logger.severe(
        'error in handling notification attrs=${node.attrs}',
        e,
        st,
      );
    } finally {
      try {
        await socket.sendNode(
          buildAckStanza(node, meId: authState.creds.me?.id),
        );
      } catch (e) {
        config.logger.warning('failed to ack notification: $e');
      }
    }
  }

  void _handleSocketConnectionUpdate(low.ConnectionUpdate update) {
    if (_disposed) {
      return;
    }
    if (update.receivedPendingNotifications != true) {
      return;
    }

    if (authState.creds.accountSyncCounter == 0) {
      config.logger.info(
        'Received pending notifications during initial bootstrap; keeping buffer until sync completes',
      );
      _beginAwaitingInitialSync();
    } else {
      if (_didStartConnectBuffer) {
        final flushed = ev.flush();
        _didStartConnectBuffer = false;
        config.logger.info(
          'Flushed initial bootstrap buffer after pending notifications flushed=$flushed',
        );
      }
      _finishInitialSync(reason: 'received_pending_notifications');
    }
  }

  Future<void> _handleReceipt(BinaryNode node) async {
    config.logger.info(
      'Handling WA receipt type=${node.attrs['type'] ?? '-'} '
      'id=${node.attrs['id'] ?? '-'} from=${node.attrs['from'] ?? '-'}',
    );
    final attrs = node.attrs;
    final from = attrs['from'] ?? '';
    final participant = attrs['participant'];
    final recipient = attrs['recipient'];
    final isLid = from.contains('lid') || (participant?.contains('lid') ?? false);
    final meId = authState.creds.me?.id;
    final meLid = authState.creds.me?.lid;
    final selfJid = isLid ? (meLid ?? meId) : (meId ?? meLid);
    final isNodeFromMe = areJidsSameUser(participant ?? from, selfJid) ||
        areJidsSameUser(participant ?? from, meId) ||
        areJidsSameUser(participant ?? from, meLid);
    final remoteJid = (!isNodeFromMe || isJidGroup(from))
        ? from
        : (recipient ?? from);
    final receiptType = attrs['type'];
    final fromMe = recipient == null ||
        ((receiptType == 'retry' || receiptType == 'sender') && isNodeFromMe);
    final ids = <String>[
      if ((attrs['id'] ?? '').isNotEmpty) attrs['id']!,
    ];
    if (node.content is List<BinaryNode> && (node.content as List<BinaryNode>).isNotEmpty) {
      final items = getBinaryNodeChildren(
        (node.content as List<BinaryNode>).first,
        'item',
      );
      ids.addAll(
        items
            .map((item) => item.attrs['id'] ?? '')
            .where((id) => id.isNotEmpty),
      );
    }

    try {
      final status = _getMessageStatusFromReceiptType(receiptType);
      final timestamp = int.tryParse(attrs['t'] ?? '0') ?? 0;
      if (status != null && ids.isNotEmpty) {
        if ((isJidGroup(remoteJid) || isJidStatusBroadcast(remoteJid)) &&
            participant != null &&
            participant.isNotEmpty) {
          final receiptUpdates = ids.map((id) {
            final receipt = <String, dynamic>{
              'userJid': jidNormalizedUser(participant),
            };
            if (status == WAMessageStatus.delivered) {
              receipt['receiptTimestamp'] = timestamp;
            } else if (status == WAMessageStatus.played) {
              receipt['playedTimestamp'] = timestamp;
            } else {
              receipt['readTimestamp'] = timestamp;
            }
            return {
              'key': {
                'remoteJid': remoteJid,
                'id': id,
                'fromMe': fromMe,
                if (participant.isNotEmpty) 'participant': participant,
              },
              'receipt': receipt,
            };
          }).toList(growable: false);
          ev.emit('message-receipt.update', receiptUpdates);
        } else {
          final updates = ids.map((id) {
            return {
              'key': {
                'remoteJid': remoteJid,
                'id': id,
                'fromMe': fromMe,
                if (participant != null && participant.isNotEmpty)
                  'participant': participant,
              },
              'update': {
                'status': status,
                'messageTimestamp': timestamp,
              },
            };
          }).toList(growable: false);
          ev.emit('messages.update', updates);
        }
      }

      if (receiptType == 'retry') {
        final retryNode = getBinaryNodeChild(node, 'retry');
        final retryParticipant = participant ?? from;
        if (fromMe &&
            retryNode != null &&
            retryParticipant.isNotEmpty &&
            ids.isNotEmpty) {
          await _sendMessagesAgain(
            remoteJid: remoteJid,
            ids: ids,
            participant: retryParticipant,
            retryNode: retryNode,
          );
        } else {
          config.logger.info(
            'Ignoring retry receipt remoteJid=$remoteJid fromMe=$fromMe participant=${retryParticipant.isEmpty ? '-' : retryParticipant}',
          );
        }
      }
    } finally {
      try {
        await socket.sendNode(
          buildAckStanza(node, meId: authState.creds.me?.id),
        );
      } catch (e) {
        config.logger.warning('failed to ack receipt: $e');
      }
    }
  }

  Future<void> _handleCall(BinaryNode node) async {
    config.logger.info(
      'Handling WA call id=${node.attrs['id'] ?? '-'} '
      'from=${node.attrs['from'] ?? '-'} type=${node.attrs['type'] ?? '-'}',
    );
    try {
      final children = getAllBinaryNodeChildren(node);
      if (children.isEmpty) {
        throw StateError('Missing call info in call node');
      }
      final infoChild = children.first;
      final status = _getCallStatusFromNode(infoChild);
      final callId = infoChild.attrs['call-id'] ?? node.attrs['id'] ?? '';
      if (callId.isEmpty) {
        throw StateError('Missing call id in call node');
      }
      final from = infoChild.attrs['from'] ??
          infoChild.attrs['call-creator'] ??
          node.attrs['from'] ??
          '';
      var call = WACallEvent(
        chatId: node.attrs['from'] ?? from,
        from: from,
        callerPn: infoChild.attrs['caller_pn'],
        id: callId,
        date: DateTime.fromMillisecondsSinceEpoch(
          (int.tryParse(node.attrs['t'] ?? '0') ?? 0) * 1000,
        ),
        offline: node.attrs.containsKey('offline'),
        status: status,
        isVideo: getBinaryNodeChild(infoChild, 'video') != null,
        isGroup: infoChild.attrs['type'] == 'group' ||
            (infoChild.attrs['group-jid']?.isNotEmpty ?? false),
        groupJid: infoChild.attrs['group-jid'],
      );

      final existingCall = _callOfferCache[call.id];
      if (status == WACallUpdateType.offer) {
        _callOfferCache[call.id] = call;
      } else if (existingCall != null) {
        call = WACallEvent(
          chatId: call.chatId,
          from: call.from,
          callerPn: call.callerPn ?? existingCall.callerPn,
          id: call.id,
          date: call.date,
          offline: call.offline,
          status: call.status,
          isVideo: call.isVideo || existingCall.isVideo,
          isGroup: call.isGroup || existingCall.isGroup,
          groupJid: call.groupJid ?? existingCall.groupJid,
          latencyMs: call.latencyMs ?? existingCall.latencyMs,
        );
      }

      if (status == WACallUpdateType.reject ||
          status == WACallUpdateType.accept ||
          status == WACallUpdateType.timeout ||
          status == WACallUpdateType.terminate) {
        _callOfferCache.remove(call.id);
      }

      ev.emit('call', [call]);
      final stub = _buildCallStubMessage(call);
      if (stub != null) {
        ev.emit('messages.upsert', {
          'messages': [stub],
          'type': call.offline ? 'append' : 'notify',
        });
      }
    } finally {
      try {
        await socket.sendNode(
          buildAckStanza(node, meId: authState.creds.me?.id),
        );
      } catch (e) {
        config.logger.warning('failed to ack call: $e');
      }
    }
  }

  Future<void> _handleAck(BinaryNode node) async {
    if (node.attrs['class'] != 'message') {
      return;
    }

    final error = node.attrs['error'];
    if (error == null || error.isEmpty) {
      return;
    }

    config.logger.warning('received error in ack attrs=${node.attrs}');
    ev.emit('messages.update', [
      {
        'key': {
          'remoteJid': node.attrs['from'] ?? '',
          'fromMe': true,
          'id': node.attrs['id'] ?? '',
        },
        'update': {
          'status': WAMessageStatus.failed,
          'stubParameters': [error],
        },
      },
    ]);
  }

  Future<WAMessage?> _processNotification(BinaryNode node) async {
    final children = getAllBinaryNodeChildren(node);
    final child = children.isEmpty ? null : children.first;
    final type = node.attrs['type'] ?? '';
    final normalizedFrom = jidNormalizedUser(node.attrs['from']);
    final from = normalizedFrom.isEmpty
        ? (node.attrs['from'] ?? '')
        : normalizedFrom;

    switch (type) {
      case 'w:gp2':
        if (child == null) {
          return null;
        }
        return _processGroupNotification(node, child, from);
      case 'picture':
        return _processPictureNotification(node, from);
      case 'account_sync':
        if (child != null) {
          await _processAccountSyncNotification(child);
        }
        return null;
      case 'privacy_token':
        await _processPrivacyTokenNotification(node, from);
        return null;
      case 'devices':
        if (child != null) {
          final devices = getBinaryNodeChildren(child, 'device');
          final isOwnDevices = areJidsSameUser(
                child.attrs['jid'],
                authState.creds.me?.id,
              ) ||
              areJidsSameUser(child.attrs['lid'], authState.creds.me?.lid);
          if (isOwnDevices) {
            config.logger.info(
              'my own devices changed devices=${devices.map((d) => {'id': d.attrs['jid'], 'lid': d.attrs['lid']}).toList()}',
            );
          }
        }
        return null;
      case 'newsletter':
        await _processNewsletterNotification(node);
        return null;
      case 'mex':
        await _processMexNewsletterNotification(node);
        return null;
      case 'mediaretry':
        _processMediaRetryNotification(node);
        return null;
      case 'encrypt':
        await _processEncryptNotification(node);
        return null;
      case 'link_code_companion_reg':
        config.logger.info('Received link_code_companion_reg notification');
        return null;
      case 'server_sync':
        return null;
      default:
        return null;
    }
  }

  WAMessage? _processGroupNotification(
    BinaryNode fullNode,
    BinaryNode child,
    String remoteJid,
  ) {
    final participant = fullNode.attrs['participant'];
    final timestamp =
        int.tryParse(fullNode.attrs['t'] ?? '0') ?? _nowUnixTimestampSeconds();
    WebMessageInfo_StubType? stubType;
    List<String> stubParameters = const [];

    switch (child.tag) {
      case 'create':
        final subject = child.attrs['subject'] ?? '';
        stubType = WebMessageInfo_StubType.GROUP_CREATE;
        stubParameters = subject.isEmpty ? const [] : [subject];
        ev.emit('chats.upsert', [
          {
            'id': remoteJid,
            'name': subject,
            'conversationTimestamp':
                int.tryParse(child.attrs['creation'] ?? '') ?? timestamp,
          },
        ]);
        ev.emit('groups.upsert', [
          {
            'id': remoteJid,
            'subject': subject,
            'owner': child.attrs['creator'] ?? participant,
            'author': participant,
          },
        ]);
        break;
      case 'promote':
        stubType = WebMessageInfo_StubType.GROUP_PARTICIPANT_PROMOTE;
        stubParameters = _participantStubParameters(child);
        break;
      case 'demote':
        stubType = WebMessageInfo_StubType.GROUP_PARTICIPANT_DEMOTE;
        stubParameters = _participantStubParameters(child);
        break;
      case 'remove':
        final params = _participantStubParameters(child);
        final participants = getBinaryNodeChildren(child, 'participant');
        final first = participants.isEmpty ? null : participants.first;
        final removedSelf = first != null &&
            (areJidsSameUser(first.attrs['jid'], participant) ||
                areJidsSameUser(first.attrs['phone_number'], participant));
        stubType = removedSelf
            ? WebMessageInfo_StubType.GROUP_PARTICIPANT_LEAVE
            : WebMessageInfo_StubType.GROUP_PARTICIPANT_REMOVE;
        stubParameters = params;
        break;
      case 'add':
        stubType = WebMessageInfo_StubType.GROUP_PARTICIPANT_ADD;
        stubParameters = _participantStubParameters(child);
        break;
      case 'leave':
        stubType = WebMessageInfo_StubType.GROUP_PARTICIPANT_LEAVE;
        stubParameters = _participantStubParameters(child);
        break;
      case 'subject':
        stubType = WebMessageInfo_StubType.GROUP_CHANGE_SUBJECT;
        if ((child.attrs['subject'] ?? '').isNotEmpty) {
          stubParameters = [child.attrs['subject']!];
        }
        break;
      case 'description':
        stubType = WebMessageInfo_StubType.GROUP_CHANGE_DESCRIPTION;
        final description = getBinaryNodeChild(child, 'body')?.contentString;
        if ((description ?? '').isNotEmpty) {
          stubParameters = [description!];
        }
        break;
      case 'announcement':
      case 'not_announcement':
        stubType = WebMessageInfo_StubType.GROUP_CHANGE_ANNOUNCE;
        stubParameters = [child.tag == 'announcement' ? 'on' : 'off'];
        break;
      case 'locked':
      case 'unlocked':
        stubType = WebMessageInfo_StubType.GROUP_CHANGE_RESTRICT;
        stubParameters = [child.tag == 'locked' ? 'on' : 'off'];
        break;
      case 'invite':
        stubType = WebMessageInfo_StubType.GROUP_CHANGE_INVITE_LINK;
        if ((child.attrs['code'] ?? '').isNotEmpty) {
          stubParameters = [child.attrs['code']!];
        }
        break;
      case 'member_add_mode':
        final addMode = child.contentString;
        if ((addMode ?? '').isNotEmpty) {
          stubType = WebMessageInfo_StubType.GROUP_MEMBER_ADD_MODE;
          stubParameters = [addMode!];
        }
        break;
      case 'membership_approval_mode':
        final groupJoin = getBinaryNodeChild(child, 'group_join');
        final state = groupJoin?.attrs['state'];
        if ((state ?? '').isNotEmpty) {
          stubType =
              WebMessageInfo_StubType.GROUP_MEMBERSHIP_JOIN_APPROVAL_MODE;
          stubParameters = [state!];
        }
        break;
      case 'created_membership_requests':
        stubType = WebMessageInfo_StubType
            .GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD;
        stubParameters = [
          jsonEncode({
            'lid': getBinaryNodeChild(child, 'participant')?.attrs['jid'] ??
                participant,
            'pn':
                getBinaryNodeChild(child, 'participant')?.attrs['phone_number'],
          }),
          'created',
          child.attrs['request_method'] ?? '',
        ].where((value) => value.isNotEmpty).toList(growable: false);
        break;
      case 'revoked_membership_requests':
        stubType = WebMessageInfo_StubType
            .GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD;
        final affected = getBinaryNodeChild(child, 'participant');
        final affectedLid = affected?.attrs['jid'] ?? participant;
        final affectedPn = affected?.attrs['phone_number'];
        final isDenied = areJidsSameUser(affectedLid, participant);
        stubParameters = [
          jsonEncode({'lid': affectedLid, 'pn': affectedPn}),
          isDenied ? 'revoked' : 'rejected',
        ];
        break;
      default:
        return null;
    }

    if (stubType == null) {
      return null;
    }

    return WAMessage(
      id: fullNode.attrs['id'] ?? '',
      remoteJid: remoteJid,
      participant: participant,
      author: participant,
      fromMe: _isSelfJid(participant),
      timestamp: timestamp,
      status: WAMessageStatus.delivered,
      stubType: stubType,
      stubParameters: stubParameters,
    );
  }

  WAMessage? _processPictureNotification(BinaryNode node, String remoteJid) {
    final setPicture = getBinaryNodeChild(node, 'set');
    final delPicture = getBinaryNodeChild(node, 'delete');
    if (setPicture == null && delPicture == null) {
      return null;
    }

    ev.emit('contacts.update', [
      {
        'id': remoteJid,
        'imgUrl': setPicture != null ? 'changed' : 'removed',
      },
    ]);

    if (!isJidGroup(remoteJid)) {
      return null;
    }

    final actor = setPicture?.attrs['author'] ?? delPicture?.attrs['author'];
    return WAMessage(
      id: node.attrs['id'] ?? '',
      remoteJid: remoteJid,
      participant: actor,
      author: actor,
      fromMe: _isSelfJid(actor),
      timestamp:
          int.tryParse(node.attrs['t'] ?? '0') ?? _nowUnixTimestampSeconds(),
      status: WAMessageStatus.delivered,
      stubType: WebMessageInfo_StubType.GROUP_CHANGE_ICON,
      stubParameters: [
        if ((setPicture?.attrs['id'] ?? '').isNotEmpty) setPicture!.attrs['id']!,
      ],
    );
  }

  Future<void> _processAccountSyncNotification(BinaryNode child) async {
    if (child.tag == 'disappearing_mode') {
      final newDuration = int.tryParse(child.attrs['duration'] ?? '0') ?? 0;
      final timestamp = int.tryParse(child.attrs['t'] ?? '0') ?? 0;
      final nextSettings = <String, dynamic>{
        ...authState.creds.accountSettings,
        'defaultDisappearingMode': {
          'ephemeralExpiration': newDuration,
          'ephemeralSettingTimestamp': timestamp,
        },
      };
      authState.creds.accountSettings = nextSettings;
      ev.emit('creds.update', {'accountSettings': nextSettings});
      return;
    }

    if (child.tag == 'blocklist') {
      final blocklists = getBinaryNodeChildren(child, 'item');
      for (final block in blocklists) {
        final jid = block.attrs['jid'];
        if ((jid ?? '').isEmpty) {
          continue;
        }
        ev.emit('blocklist.update', {
          'blocklist': [jid],
          'type': block.attrs['action'] == 'block' ? 'add' : 'remove',
        });
      }
    }
  }

  Future<void> _processPrivacyTokenNotification(
    BinaryNode node,
    String from,
  ) async {
    final tokensNode = getBinaryNodeChild(node, 'tokens');
    if (tokensNode == null) {
      return;
    }

    final tokenNodes = getBinaryNodeChildren(tokensNode, 'token');
    if (tokenNodes.isEmpty) {
      return;
    }

    final additionalData = authState.creds.additionalData is Map
        ? Map<String, dynamic>.from(
            authState.creds.additionalData as Map,
          )
        : <String, dynamic>{};
    final privacyTokens = additionalData['privacyTokens'] is Map
        ? Map<String, dynamic>.from(additionalData['privacyTokens'] as Map)
        : <String, dynamic>{};
    final perJid = privacyTokens[from] is Map
        ? Map<String, dynamic>.from(privacyTokens[from] as Map)
        : <String, dynamic>{};

    for (final tokenNode in tokenNodes) {
      final type = tokenNode.attrs['type'];
      final timestamp = tokenNode.attrs['t'];
      final content = tokenNode.contentBytes;
      if ((type ?? '').isEmpty || content == null) {
        continue;
      }
      perJid[type!] = {
        'token': base64Encode(content),
        'timestamp': timestamp,
      };
    }

    privacyTokens[from] = perJid;
    additionalData['privacyTokens'] = privacyTokens;
    authState.creds.additionalData = additionalData;
    ev.emit('creds.update', {'additionalData': additionalData});
  }

  Future<void> _processEncryptNotification(BinaryNode node) async {
    final from = node.attrs['from'];
    if (from == '@s.whatsapp.net') {
      final countChild = getBinaryNodeChild(node, 'count');
      final count = int.tryParse(countChild?.attrs['value'] ?? '') ?? 0;
      final shouldUploadMorePreKeys = count < _minPreKeyCount;
      config.logger.info(
        'recv pre-key count count=$count shouldUploadMorePreKeys=$shouldUploadMorePreKeys',
      );
      if (shouldUploadMorePreKeys) {
        await _uploadPreKeysIfRequired();
      }
      return;
    }

    config.logger.info('unknown encrypt notification attrs=${node.attrs}');
  }

  void _processMediaRetryNotification(BinaryNode node) {
    final retryNode = getBinaryNodeChild(node, 'rmr');
    if (retryNode == null) {
      config.logger.warning('invalid mediaretry notification attrs=${node.attrs}');
      return;
    }

    final event = <String, dynamic>{
      'key': {
        'id': node.attrs['id'] ?? '',
        'remoteJid': retryNode.attrs['jid'] ?? '',
        'fromMe': retryNode.attrs['from_me'] == 'true',
        if ((retryNode.attrs['participant'] ?? '').isNotEmpty)
          'participant': retryNode.attrs['participant'],
      },
    };

    final errorNode = getBinaryNodeChild(node, 'error');
    if (errorNode != null) {
      final errorCode = int.tryParse(errorNode.attrs['code'] ?? '') ?? 0;
      event['error'] = {
        'message': 'Failed to re-upload media ($errorCode)',
        'code': errorCode,
        'statusCode': _mediaRetryStatusCode(errorCode),
        'data': errorNode.attrs,
      };
    } else {
      final encryptNode = getBinaryNodeChild(node, 'encrypt');
      final ciphertext = getBinaryNodeChildBuffer(encryptNode, 'enc_p');
      final iv = getBinaryNodeChildBuffer(encryptNode, 'enc_iv');
      if (ciphertext != null && iv != null) {
        event['media'] = {'ciphertext': ciphertext, 'iv': iv};
      } else {
        event['error'] = {
          'message': 'Failed to re-upload media (missing ciphertext)',
          'statusCode': 404,
        };
      }
    }

    ev.emit('messages.media-update', [event]);
  }

  Future<void> _processMexNewsletterNotification(BinaryNode node) async {
    final mexNode = getBinaryNodeChild(node, 'mex');
    final raw = mexNode?.contentString ??
        (mexNode?.contentBytes != null
            ? utf8.decode(mexNode!.contentBytes!, allowMalformed: true)
            : null);
    if ((raw ?? '').isEmpty) {
      config.logger.warning('Invalid mex newsletter notification attrs=${node.attrs}');
      return;
    }

    dynamic data;
    try {
      data = jsonDecode(raw!);
    } catch (e) {
      config.logger.warning('Failed to parse mex newsletter notification: $e');
      return;
    }

    final operation = data is Map ? data['operation']?.toString() : null;
    final updates = data is Map && data['updates'] is List ? data['updates'] as List : null;
    if ((operation ?? '').isEmpty || updates == null) {
      config.logger.warning('Invalid mex newsletter notification content=$data');
      return;
    }

    switch (operation) {
      case 'NotificationNewsletterUpdate':
        for (final update in updates) {
          if (update is! Map) continue;
          final jid = update['jid']?.toString();
          final settings = update['settings'];
          if ((jid ?? '').isEmpty || settings is! Map || settings.isEmpty) {
            continue;
          }
          ev.emit('newsletter-settings.update', {
            'id': jid,
            'update': Map<String, dynamic>.from(
              settings.map(
                (key, value) => MapEntry(key.toString(), value),
              ),
            ),
          });
        }
        break;
      case 'NotificationNewsletterAdminPromote':
        for (final update in updates) {
          if (update is! Map) continue;
          final jid = update['jid']?.toString();
          final user = update['user']?.toString();
          if ((jid ?? '').isEmpty || (user ?? '').isEmpty) {
            continue;
          }
          ev.emit('newsletter-participants.update', {
            'id': jid,
            'author': node.attrs['from'] ?? '',
            'user': user,
            'new_role': 'ADMIN',
            'action': 'promote',
          });
        }
        break;
      default:
        config.logger.info(
          'Unhandled mex newsletter notification operation=$operation data=$data',
        );
        break;
    }
  }

  Future<void> _processNewsletterNotification(BinaryNode node) async {
    final from = node.attrs['from'] ?? '';
    final author = node.attrs['participant'];
    final children = getAllBinaryNodeChildren(node);
    if (children.isEmpty) {
      config.logger.warning('Invalid newsletter notification attrs=${node.attrs}');
      return;
    }

    final child = children.first;
    switch (child.tag) {
      case 'reaction':
        ev.emit('newsletter.reaction', {
          'id': from,
          'server_id': child.attrs['message_id'],
          'reaction': {
            'code': getBinaryNodeChildString(child, 'reaction'),
            'count': 1,
          },
        });
        break;
      case 'view':
        ev.emit('newsletter.view', {
          'id': from,
          'server_id': child.attrs['message_id'],
          'count': int.tryParse(child.contentString ?? '0') ?? 0,
        });
        break;
      case 'participant':
        ev.emit('newsletter-participants.update', {
          'id': from,
          'author': author,
          'user': child.attrs['jid'],
          'action': child.attrs['action'],
          'new_role': child.attrs['role'],
        });
        break;
      case 'update':
        final settingsNode = getBinaryNodeChild(child, 'settings');
        if (settingsNode == null) {
          break;
        }
        final update = <String, dynamic>{};
        final nameNode = getBinaryNodeChild(settingsNode, 'name');
        if ((nameNode?.contentString ?? '').isNotEmpty) {
          update['name'] = nameNode!.contentString;
        }
        final descriptionNode = getBinaryNodeChild(settingsNode, 'description');
        if ((descriptionNode?.contentString ?? '').isNotEmpty) {
          update['description'] = descriptionNode!.contentString;
        }
        if (update.isNotEmpty) {
          ev.emit('newsletter-settings.update', {
            'id': from,
            'update': update,
          });
        }
        break;
      case 'message':
        final plaintextNode = getBinaryNodeChild(child, 'plaintext');
        final contentBuf = plaintextNode?.contentBytes;
        if (contentBuf == null || contentBuf.isEmpty) {
          break;
        }
        try {
          final messageProto = Message.fromBuffer(contentBuf);
          ev.emit('messages.upsert', {
            'messages': [
              WAMessage(
                id: child.attrs['message_id'] ?? child.attrs['server_id'] ?? '',
                remoteJid: from,
                fromMe: false,
                timestamp:
                    int.tryParse(child.attrs['t'] ?? '0') ??
                    _nowUnixTimestampSeconds(),
                status: WAMessageStatus.delivered,
                message: messageProto,
                body: _extractSimpleNewsletterBody(messageProto),
              ),
            ],
            'type': 'append',
          });
          config.logger.info('Processed plaintext newsletter message');
        } catch (e) {
          config.logger.warning(
            'Failed to decode plaintext newsletter message: $e',
          );
        }
        break;
      default:
        config.logger.warning('Unknown newsletter notification tag=${child.tag}');
        break;
    }
  }

  String? _extractSimpleNewsletterBody(Message message) {
    if (message.conversation.isNotEmpty) {
      return message.conversation;
    }
    if (message.hasExtendedTextMessage() &&
        message.extendedTextMessage.text.isNotEmpty) {
      return message.extendedTextMessage.text;
    }
    if (message.hasImageMessage() && message.imageMessage.caption.isNotEmpty) {
      return message.imageMessage.caption;
    }
    if (message.hasVideoMessage() && message.videoMessage.caption.isNotEmpty) {
      return message.videoMessage.caption;
    }
    if (message.hasDocumentMessage() &&
        message.documentMessage.caption.isNotEmpty) {
      return message.documentMessage.caption;
    }
    return null;
  }

  int _mediaRetryStatusCode(int code) {
    switch (code) {
      case 1:
        return 200;
      case 2:
        return 404;
      case 3:
        return 412;
      default:
        return 500;
    }
  }

  List<String> _participantStubParameters(BinaryNode child) {
    return getBinaryNodeChildren(child, 'participant').map((participant) {
      return jsonEncode({
        'id': participant.attrs['jid'],
        if ((participant.attrs['phone_number'] ?? '').isNotEmpty)
          'phoneNumber': participant.attrs['phone_number'],
        if ((participant.attrs['lid'] ?? '').isNotEmpty)
          'lid': participant.attrs['lid'],
        if ((participant.attrs['type'] ?? '').isNotEmpty)
          'admin': participant.attrs['type'],
      });
    }).toList(growable: false);
  }

  bool _isSelfJid(String? jid) {
    if ((jid ?? '').isEmpty) {
      return false;
    }
    return areJidsSameUser(jid, authState.creds.me?.id) ||
        areJidsSameUser(jid, authState.creds.me?.lid);
  }

  int _nowUnixTimestampSeconds() =>
      DateTime.now().millisecondsSinceEpoch ~/ 1000;

  WAMessageStatus? _getMessageStatusFromReceiptType(String? type) {
    switch (type) {
      case null:
      case '':
        return WAMessageStatus.delivered;
      case 'sender':
        return WAMessageStatus.sent;
      case 'played':
        return WAMessageStatus.played;
      case 'read':
      case 'read-self':
        return WAMessageStatus.read;
      default:
        return null;
    }
  }

  WACallUpdateType _getCallStatusFromNode(BinaryNode node) {
    switch (node.tag) {
      case 'offer':
      case 'offer_notice':
        return WACallUpdateType.offer;
      case 'terminate':
        return node.attrs['reason'] == 'timeout'
            ? WACallUpdateType.timeout
            : WACallUpdateType.terminate;
      case 'reject':
        return WACallUpdateType.reject;
      case 'accept':
        return WACallUpdateType.accept;
      default:
        return WACallUpdateType.ringing;
    }
  }

  String _sendAgainKey(String msgId, String participant) => '$msgId|$participant';

  bool _willSendMessageAgain(String msgId, String participant) {
    return (_sendAgainCounts[_sendAgainKey(msgId, participant)] ?? 0) < 5;
  }

  void _updateSendMessageAgainCount(String msgId, String participant) {
    final key = _sendAgainKey(msgId, participant);
    _sendAgainCounts[key] = (_sendAgainCounts[key] ?? 0) + 1;
  }

  Future<void> _sendMessagesAgain({
    required String remoteJid,
    required List<String> ids,
    required String participant,
    required BinaryNode retryNode,
  }) async {
    final retryCount = int.tryParse(retryNode.attrs['count'] ?? '1') ?? 1;
    for (final id in ids) {
      if (!_willSendMessageAgain(id, participant)) {
        config.logger.info(
          'Skipping resend for retry because limit reached id=$id participant=$participant',
        );
        continue;
      }

      final recent = msg_send.getRecentSentProtoMessage(id);
      if (recent == null) {
        config.logger.info(
          'recv retry request, but message not available remoteJid=$remoteJid id=$id',
        );
        continue;
      }

      _updateSendMessageAgainCount(id, participant);
      final targetJid = isJidGroup(remoteJid)
          ? remoteJid
          : jidNormalizedUser(participant);
      config.logger.info(
        'Resending message after retry receipt '
        'id=$id remoteJid=$remoteJid participant=$participant retryCount=$retryCount targetJid=$targetJid',
      );
      await msg_send.sendProtoMessage(
        socket: socket,
        store: authState.keys,
        jid: targetJid,
        msgId: id,
        proto: recent.proto,
        additionalAttributes: recent.additionalAttributes,
        additionalNodes: recent.additionalNodes,
      );
    }
  }

  WAMessage? _buildCallStubMessage(WACallEvent call) {
    if (call.status == WACallUpdateType.timeout) {
      final stubType = call.isGroup
          ? (call.isVideo
                ? WebMessageInfo_StubType.CALL_MISSED_GROUP_VIDEO
                : WebMessageInfo_StubType.CALL_MISSED_GROUP_VOICE)
          : (call.isVideo
                ? WebMessageInfo_StubType.CALL_MISSED_VIDEO
                : WebMessageInfo_StubType.CALL_MISSED_VOICE);
      return WAMessage(
        id: call.id,
        remoteJid: call.chatId,
        author: call.from,
        participant: call.from,
        fromMe: false,
        timestamp: call.date.millisecondsSinceEpoch ~/ 1000,
        status: WAMessageStatus.delivered,
        stubType: stubType,
      );
    }

    if (call.status == WACallUpdateType.offer && call.isGroup) {
      return WAMessage(
        id: call.id,
        remoteJid: call.chatId,
        author: call.from,
        participant: call.from,
        fromMe: false,
        timestamp: call.date.millisecondsSinceEpoch ~/ 1000,
        status: WAMessageStatus.delivered,
        message: Message(
          call: Message_Call(
            callKey: Uint8List.fromList(utf8.encode(call.id)),
          ),
        ),
      );
    }

    return null;
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
    final sessionId = _getUnifiedSessionId();
    config.logger.info('Sending unified_session after success id=$sessionId');
    try {
      await socket.sendNode(
        BinaryNode(
          tag: 'ib',
          attrs: const {},
          content: [
            BinaryNode(tag: 'unified_session', attrs: {'id': sessionId}),
          ],
        ),
      );
    } catch (e) {
      config.logger.fine('failed to send unified_session: $e');
    }
  }

  Future<void> _uploadPreKeysIfRequired() async {
    config.logger.info(
      'Checking pre-key upload nextPreKeyId=${authState.creds.nextPreKeyId} '
      'signedPreKeyId=${authState.creds.signedPreKey.id}',
    );
    final identPub = await authState.creds.signedIdentityKey.extractPublicKey();
    final signedPreKey = PreKeyRecord(
      id: authState.creds.signedPreKey.id,
      keyPair: authState.creds.signedPreKey.keyPair,
    );

    final newNext = await signal_auth.maybeRefillPreKeys(
      socket: socket,
      store: authState.keys,
      identityPublicKey: Uint8List.fromList(identPub.bytes),
      signedPreKey: signedPreKey,
      signedPreKeySignature: authState.creds.signedPreKey.signature,
      nextPreKeyId: authState.creds.nextPreKeyId,
      registrationId: authState.creds.registrationId,
    );

    if (newNext != authState.creds.nextPreKeyId) {
      config.logger.info(
        'Pre-key state updated nextPreKeyId ${authState.creds.nextPreKeyId} -> $newNext',
      );
      authState.creds
        ..nextPreKeyId = newNext
        ..firstUnuploadedPreKeyId = newNext;
      await authState.saveCreds();
    } else {
      config.logger.info('Pre-key upload not required');
    }
  }

  Future<void> _digestKeyBundle() async {
    config.logger.info('Running key-bundle digest check');
    final response = await socket.query(
      BinaryNode(
        tag: 'iq',
        attrs: {'to': '@s.whatsapp.net', 'type': 'get', 'xmlns': 'encrypt'},
        content: [BinaryNode(tag: 'digest', attrs: const {})],
      ),
      timeout: const Duration(seconds: 60),
    );
    final digestNode = getBinaryNodeChild(response, 'digest');
    if (digestNode == null) {
      config.logger.warning(
        'Key-bundle digest missing in response attrs=${response.attrs} '
        'childTags=${response.children.map((c) => c.tag).toList()}',
      );
      throw StateError('encrypt/get digest returned no digest node');
    }
    config.logger.info(
      'Key-bundle digest ok attrs=${digestNode.attrs} '
      'childTags=${digestNode.children.map((c) => c.tag).toList()}',
    );
  }

  Future<void> _executeInitQueries() async {
    config.logger.info('Starting post-login init queries');
    try {
      final results = await Future.wait([
        _fetchProps(),
        _fetchBlocklist(),
        _fetchPrivacySettings(),
      ]);
      final props = results[0] as Map<String, String>;
      final blocklist = results[1] as List<String>;
      final privacy = results[2] as Map<String, String>;
      config.logger.info(
        'Post-login init queries complete '
        'props=${props.length} '
        'blocklist=${blocklist.length} '
        'privacy=${privacy.length}',
      );
    } catch (e, st) {
      config.logger.warning('Post-login init queries failed: $e\n$st');
    }
  }

  Future<Map<String, String>> _fetchProps() async {
    config.logger.info(
      'Fetching WA props hash=${authState.creds.lastPropHash ?? ''}',
    );
    final response = await socket.query(
      BinaryNode(
        tag: 'iq',
        attrs: {'to': '@s.whatsapp.net', 'xmlns': 'w', 'type': 'get'},
        content: [
          BinaryNode(
            tag: 'props',
            attrs: {
              'protocol': '2',
              'hash': authState.creds.lastPropHash ?? '',
            },
          ),
        ],
      ),
      timeout: const Duration(seconds: 60),
    );

    final propsNode = getBinaryNodeChild(response, 'props');
    if (propsNode == null) {
      config.logger.warning(
        'WA props response missing props node attrs=${response.attrs}',
      );
      return const {};
    }

    final hash = propsNode.attrs['hash']?.toString();
    if (hash != null &&
        hash.isNotEmpty &&
        authState.creds.lastPropHash != hash) {
      config.logger.info(
        'Updating lastPropHash ${authState.creds.lastPropHash ?? '-'} -> $hash',
      );
      authState.creds.lastPropHash = hash;
      await authState.saveCreds();
    }

    final props = reduceBinaryNodeToDictionary(propsNode, 'prop');
    config.logger.info(
      'Fetched WA props count=${props.length} '
      'keys=${props.keys.take(10).join(',')}',
    );
    return props;
  }

  Future<List<String>> _fetchBlocklist() async {
    config.logger.info('Fetching WA blocklist');
    final response = await socket.query(
      BinaryNode(
        tag: 'iq',
        attrs: {'xmlns': 'blocklist', 'to': '@s.whatsapp.net', 'type': 'get'},
      ),
      timeout: const Duration(seconds: 60),
    );

    final listNode = getBinaryNodeChild(response, 'list');
    final blocked = getBinaryNodeChildren(
      listNode,
      'item',
    ).map((n) => n.attrs['jid'] ?? '').where((jid) => jid.isNotEmpty).toList();
    config.logger.info(
      'Fetched WA blocklist count=${blocked.length} '
      'sample=${blocked.take(5).join(',')}',
    );
    return blocked;
  }

  Future<Map<String, String>> _fetchPrivacySettings() async {
    config.logger.info('Fetching WA privacy settings');
    final response = await socket.query(
      BinaryNode(
        tag: 'iq',
        attrs: {'xmlns': 'privacy', 'to': '@s.whatsapp.net', 'type': 'get'},
        content: [BinaryNode(tag: 'privacy', attrs: const {})],
      ),
      timeout: const Duration(seconds: 60),
    );

    final privacyNode = getBinaryNodeChild(response, 'privacy');
    if (privacyNode == null) {
      config.logger.warning(
        'WA privacy response missing privacy node attrs=${response.attrs}',
      );
      return const {};
    }

    final settings = reduceBinaryNodeToDictionary(privacyNode, 'category');
    config.logger.info(
      'Fetched WA privacy settings count=${settings.length} '
      'keys=${settings.keys.join(',')}',
    );
    return settings;
  }

  Future<void> _syncOwnLidMapping() async {
    final me = authState.creds.me;
    final lid = me?.lid;
    if (me == null || lid == null || lid.isEmpty) {
      config.logger.info(
        'Skipping own LID mapping sync because me/lid missing',
      );
      return;
    }

    config.logger.info('Syncing own PN/LID mapping pn=${me.id} lid=$lid');
    authState.storeLidPnMapping(lid: lid, pn: me.id);
    await authState.saveCreds();
    await authState.keys.migrateSession(me.id, lid);
  }

  void _transitionInitialSyncState(
    _InitialSyncState next, {
    required String reason,
  }) {
    if (_initialSyncState == next) {
      return;
    }
    config.logger.info(
      'Initial sync state: $_initialSyncState -> $next reason=$reason',
    );
    _initialSyncState = next;
  }

  void _beginAwaitingInitialSync() {
    if (_disposed || authState.creds.accountSyncCounter != 0) {
      return;
    }

    _awaitingInitialSyncTimeout?.cancel();
    _transitionInitialSyncState(
      _InitialSyncState.awaitingInitialSync,
      reason: 'awaiting_initial_sync',
    );
    if (!ev.isBuffering()) {
      ev.buffer();
    }
    config.logger.info(
      'Connection is now AwaitingInitialSync, buffering events',
    );
    _awaitingInitialSyncTimeout = Timer(const Duration(seconds: 20), () {
      if (_disposed ||
          _initialSyncState != _InitialSyncState.awaitingInitialSync) {
        return;
      }
      config.logger.warning(
        'Timeout in AwaitingInitialSync, forcing state to Online and flushing buffer',
      );
      _finishInitialSync(reason: 'awaiting_timeout');
    });
  }

  Future<void> _handleAppStateSyncKeyShare() async {
    if (_disposed) {
      return;
    }
    if (_initialSyncState != _InitialSyncState.syncing) {
      config.logger.info(
        'App state sync key arrived but sync state is $_initialSyncState; waiting for history bootstrap',
      );
      return;
    }
    await _runInitialAppStateSync(reason: 'protocol_key_share');
  }

  Future<void> _handleHistorySyncNotification(Map<String, dynamic> data) async {
    if (_disposed || authState.creds.accountSyncCounter != 0) {
      return;
    }
    if (_initialSyncState != _InitialSyncState.awaitingInitialSync) {
      config.logger.info(
        'History sync notification arrived while state=$_initialSyncState; ignoring initial-sync transition',
      );
      return;
    }

    final shouldProcess = data['shouldProcess'] == true;
    final syncType = data['syncType']?.toString() ?? '-';
    if (!shouldProcess) {
      config.logger.info(
        'History sync skipped by policy syncType=$syncType; transitioning online',
      );
      _finishInitialSync(reason: 'history_sync_skipped');
      return;
    }

    _awaitingInitialSyncTimeout?.cancel();
    _awaitingInitialSyncTimeout = null;
    _transitionInitialSyncState(
      _InitialSyncState.syncing,
      reason: 'history_sync_notification',
    );
    config.logger.info('Transitioned to Syncing state syncType=$syncType');
    if ((authState.creds.myAppStateKeyId ?? '').isNotEmpty) {
      await _runInitialAppStateSync(reason: 'history_sync_notification');
    }
  }

  Future<void> _runInitialAppStateSync({required String reason}) async {
    if (_disposed || authState.creds.accountSyncCounter != 0) {
      return;
    }
    if (_initialSyncState != _InitialSyncState.syncing) {
      config.logger.info(
        'Skipping app state sync because state=$_initialSyncState reason=$reason',
      );
      return;
    }
    _awaitingInitialSyncTimeout?.cancel();
    _awaitingInitialSyncTimeout = null;
    config.logger.info('Doing app state sync reason=$reason');
    final ok = await _appStateSync.triggerInitialSync(reason: reason);
    config.logger.info('App state sync finished reason=$reason ok=$ok');
    _finishInitialSync(reason: reason);
  }

  void _finishInitialSync({required String reason}) {
    _awaitingInitialSyncTimeout?.cancel();
    _awaitingInitialSyncTimeout = null;
    _didStartConnectBuffer = false;
    _transitionInitialSyncState(
      _InitialSyncState.online,
      reason: reason,
    );
    final flushed = ev.flush();
    config.logger.info(
      'Initial sync flush reason=$reason flushed=$flushed',
    );
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    _awaitingInitialSyncTimeout?.cancel();
    _awaitingInitialSyncTimeout = null;
    _didStartConnectBuffer = false;
    _sendAgainCounts.clear();
    _callOfferCache.clear();
    await _appStateSyncKeyShareSub?.cancel();
    _appStateSyncKeyShareSub = null;
    await _historySyncSub?.cancel();
    _historySyncSub = null;
    await _socketConnSub?.cancel();
    _socketConnSub = null;
    await _qrForwardSub?.cancel();
    _qrForwardSub = null;
    _qrAuth.stop();
    await _retry.dispose();
    socket.dispose();
    if (!_qrController.isClosed) {
      await _qrController.close();
    }
  }
}
