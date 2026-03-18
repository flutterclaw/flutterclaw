import 'dart:typed_data';
import 'dart:convert';

import 'package:logging/logging.dart';

import '../auth/auth_state.dart';
import '../binary/generic_utils.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../history_sync.dart';
import '../proto/wa_proto.pb.dart';
import '../signal/sender_key.dart';
import '../signal/session_cipher.dart';
import '../signal/signal_store.dart';
import '../socket/wa_socket.dart';
import '../types.dart';
import '../utils/event_emitter.dart';
import '../utils/stanza_ack.dart';

class _AddressingInfo {
  final String chatId;
  final String? chatIdAlt;
  final String author;
  final String? authorAlt;
  final String signalAuthor;
  final String? signalAuthorAlt;
  final String? participant;
  final String? participantAlt;
  final String? addressingMode;
  final bool fromMe;

  const _AddressingInfo({
    required this.chatId,
    this.chatIdAlt,
    required this.author,
    this.authorAlt,
    required this.signalAuthor,
    this.signalAuthorAlt,
    this.participant,
    this.participantAlt,
    this.addressingMode,
    this.fromMe = false,
  });
}

class _PlaceholderResendEntry {
  final _AddressingInfo addressing;
  final int timestamp;

  const _PlaceholderResendEntry({
    required this.addressing,
    required this.timestamp,
  });
}

class _DecodedEnvelope {
  final Message? message;
  final String? failureText;
  final String? failureKind;
  final String? failurePrefix;
  final int? failureBytes;
  final bool isViewOnceUnavailable;

  const _DecodedEnvelope({
    this.message,
    this.failureText,
    this.failureKind,
    this.failurePrefix,
    this.failureBytes,
    this.isViewOnceUnavailable = false,
  });
}

const _noMessageFoundErrorText = 'Message absent from node';
const _missingKeysErrorText = 'Key used already or never filled';
const _nackReasonParsingError = 487;
const _nackReasonMissingMessageSecret = 495;
const _nackReasonUnhandledError = 500;
const _statusExpirySeconds = 24 * 60 * 60;
const _placeholderMaxAgeSeconds = 14 * 24 * 60 * 60;
const _excludedPlaceholderUnavailableTypes = <String>{
  'bot_unavailable_fanout',
  'hosted_unavailable_fanout',
  'view_once_unavailable_fanout',
};

// ---------------------------------------------------------------------------
// Message receive handler
// ---------------------------------------------------------------------------

/// Processes incoming `message` nodes from the WhatsApp WebSocket,
/// decrypts them via Signal Protocol, and emits typed [WAMessage] events.
class MessageReceiver {
  static final _log = Logger('WAMessageRecv');

  final SignalProtocolStore store;
  final SenderKeyManager senderKeyManager;
  final WAEventEmitter ev;
  final WASocket socket;
  final AuthenticationCreds creds;
  final Future<void> Function() saveCreds;
  final Map<String, Future<void>> _decryptQueues = {};
  final _placeholderResendCache = <String, _PlaceholderResendEntry>{};

  MessageReceiver({
    required this.store,
    required this.senderKeyManager,
    required this.ev,
    required this.socket,
    required this.creds,
    required this.saveCreds,
  });

  String get _myJid => creds.me?.id ?? '';
  String? get _myLid => creds.me?.lid;

  Future<void> handleNode(BinaryNode node) async {
    if (node.tag != 'message') return;
    int? ackErrorCode;
    try {
      final msgId = node.attrs['id'] ?? '';
      final from = node.attrs['from'] ?? '';
      final participant = node.attrs['participant'];
      final recipient = node.attrs['recipient'];
      final category = node.attrs['category']?.toString();
      final timestamp =
          int.tryParse(node.attrs['t'] ?? '') ??
          DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final addressing = _decodeAddressing(node);

      final encNode = getBinaryNodeChild(node, 'enc');
      if (encNode != null && encNode.attrs['type']?.toString() == 'msmsg') {
        ackErrorCode = _nackReasonMissingMessageSecret;
        return;
      }
      final encType = encNode?.attrs['type']?.toString() ?? '-';
      final encBytesLength = encNode?.contentBytes?.length ?? 0;
      await _runSerialized(_decryptQueueKey(addressing), () async {
        final decoded = await _decodeEnvelope(
          node: node,
          msgId: msgId,
          addressing: addressing,
        );

        if (decoded.failureText != null) {
          final failureText = decoded.failureText!;
          final failureKind = decoded.failureKind ?? 'decode';
          final unavailableType =
              getBinaryNodeChild(node, 'unavailable')?.attrs['type']?.toString();
          final messageAge = _unixTimestampSeconds() - timestamp;

          if (failureText == _missingKeysErrorText) {
            ackErrorCode = _nackReasonParsingError;
            return;
          }

          if (!decoded.isViewOnceUnavailable &&
              failureText == _noMessageFoundErrorText &&
              category != 'peer') {
            if (unavailableType != null &&
                _excludedPlaceholderUnavailableTypes.contains(unavailableType)) {
              _log.info(
                'Skipping placeholder resend for excluded unavailable type '
                'id=$msgId type=$unavailableType',
              );
              return;
            }
            if (messageAge > _placeholderMaxAgeSeconds) {
              _log.info(
                'Skipping placeholder resend for old message '
                'id=$msgId age=$messageAge',
              );
              return;
            }

            _cachePlaceholderResend(
              msgId: msgId,
              timestamp: timestamp,
              addressing: addressing,
            );
            ev.emit('messages.decode-error', {
              'id': msgId,
              'from': from,
              'participant': participant,
              'recipient': recipient,
              'timestamp': timestamp,
              'senderId': addressing.signalAuthor,
              'senderAlt': addressing.signalAuthorAlt,
              'chatId': addressing.chatId,
              'chatIdAlt': addressing.chatIdAlt,
              'fromMe': addressing.fromMe,
              'addressingMode': addressing.addressingMode,
              'encType': encType,
              'encBytes': encBytesLength,
              'error': failureText,
              'retryPolicy': 'placeholder_resend',
            });
            _emitCiphertextPlaceholder(
              msgId: msgId,
              timestamp: timestamp,
              addressing: addressing,
              stubParameters: const [_noMessageFoundErrorText],
            );
            return;
          }

          if (isJidStatusBroadcast(addressing.chatId) &&
              messageAge > _statusExpirySeconds) {
            _log.info(
              'Skipping retry for expired status message '
              'id=$msgId age=$messageAge chatId=${addressing.chatId}',
            );
            return;
          }

          _cachePlaceholderResend(
            msgId: msgId,
            timestamp: timestamp,
            addressing: addressing,
          );
          final errorEvent = <String, dynamic>{
            'id': msgId,
            'from': from,
            'participant': participant,
            'recipient': recipient,
            'timestamp': timestamp,
            'senderId': addressing.signalAuthor,
            'senderAlt': addressing.signalAuthorAlt,
            'chatId': addressing.chatId,
            'chatIdAlt': addressing.chatIdAlt,
            'fromMe': addressing.fromMe,
            'addressingMode': addressing.addressingMode,
            'encType': encType,
            'encBytes': encBytesLength,
            'error': failureText,
            'retryPolicy': 'retry',
          };
          if (decoded.failurePrefix != null && decoded.failurePrefix!.isNotEmpty) {
            errorEvent['prefix'] = decoded.failurePrefix;
          }
          if (decoded.failureBytes != null) {
            errorEvent['bytes'] = decoded.failureBytes;
          }

          if (failureKind == 'decrypt') {
            ev.emit('messages.decrypt-error', errorEvent);
          } else {
            ev.emit('messages.decode-error', errorEvent);
          }
          ackErrorCode = _nackReasonUnhandledError;
          return;
        }

        final proto = decoded.message;
        if (proto == null) {
          return;
        }

        final contentProto = _normalizeMessageContent(proto);

        final protocol = contentProto.hasProtocolMessage()
            ? contentProto.protocolMessage
            : null;
        if (await _handleProtocolMessage(
          msgId: msgId,
          from: from,
          timestamp: timestamp,
          addressing: addressing,
          protocol: protocol,
        )) {
          await _sendProtocolReceipts(
            msgId: msgId,
            from: from,
            participant: participant,
            recipient: recipient,
            category: category,
            timestamp: timestamp,
            addressing: addressing,
            protocol: protocol,
          );
          return;
        }

        if (contentProto.hasSenderKeyDistributionMessage()) {
          final dist = contentProto.senderKeyDistributionMessage;
          final groupId = dist.groupId.isNotEmpty
              ? dist.groupId
              : addressing.chatId;
          final bytes = Uint8List.fromList(
            dist.axolotlSenderKeyDistributionMessage,
          );
          if (groupId.isNotEmpty && bytes.isNotEmpty) {
            await senderKeyManager.processDistributionMessage(
              groupId: groupId,
              senderId: addressing.signalAuthor,
              message: bytes,
            );
          }
        }

        final reaction = _extractReaction(contentProto, addressing);
        final body = _extractBody(contentProto);
        final media = _extractMedia(contentProto);

        if ((body == null || body.isEmpty) &&
            reaction == null &&
            media == null) {
          _log.info(
            'Decoded WA message without extracted body '
            'id=$msgId from=$from content=${_describeMessageContent(contentProto)}',
          );
        }

        final msg = WAMessage(
          id: msgId,
          remoteJid: addressing.chatId,
          remoteJidAlt: addressing.chatIdAlt,
          participant: addressing.participant,
          participantAlt: addressing.participantAlt,
          author: addressing.author,
          authorAlt: addressing.authorAlt,
          addressingMode: addressing.addressingMode,
          fromMe: addressing.fromMe,
          timestamp: timestamp,
          status: WAMessageStatus.delivered,
          message: contentProto,
          body: body,
          media: media,
          reaction: reaction,
        );
        _placeholderResendCache.remove(msgId);

        ev.emit('messages.upsert', {
          'messages': [msg],
          'type': 'notify',
        });
        _log.info(
          'Emitted messages.upsert id=$msgId from=$from '
          'bodyLength=${body?.length ?? 0} hasReaction=${reaction != null} '
          'hasMedia=${media != null}',
        );

        await _sendDeliveryReceipt(
          msgId: msgId,
          to: from,
          participant: participant,
          recipient: recipient,
          receiptType: _deliveryReceiptType(
            category: category,
            fromMe: addressing.fromMe,
          ),
          chatId: addressing.chatId,
        );
      });
    } finally {
      await _sendMessageAck(node, errorCode: ackErrorCode);
    }
  }

  String _decryptQueueKey(_AddressingInfo addressing) {
    final raw = addressing.signalAuthor;
    final device = jidDecode(raw)?.device ?? 0;
    final base = jidWithoutDevice(raw);
    return '$base#$device';
  }

  Future<void> _runSerialized(
    String key,
    Future<void> Function() action,
  ) async {
    final previous = _decryptQueues[key] ?? Future.value();
    final current = previous.catchError((_) {}).then((_) => action());
    _decryptQueues[key] = current;
    try {
      await current;
    } finally {
      if (identical(_decryptQueues[key], current)) {
        _decryptQueues.remove(key);
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Decryption dispatch
  // ---------------------------------------------------------------------------

  Future<Uint8List> _decrypt({
    required BinaryNode encNode,
    required String senderId,
    required String? senderAlt,
    required String remoteJid,
  }) async {
    final type = encNode.attrs['type'];
    final cipherBytes = encNode.contentBytes;
    if (cipherBytes == null) throw StateError('enc node has no content');

    await _storeMapping(primary: senderId, alternate: senderAlt);

    if (type == 'skmsg') {
      return senderKeyManager.decrypt(
        groupId: remoteJid,
        senderId: senderId,
        message: cipherBytes,
      );
    }

    final decryptionJid = await _resolveDecryptionJid(senderId, senderAlt);
    final cipher = SessionCipher(store: store, recipientAddress: decryptionJid);
    final ciphertextType = type == 'pkmsg'
        ? CiphertextType.preKey
        : CiphertextType.whisper;

    return cipher.decrypt(
      CiphertextMessage(type: ciphertextType, serialized: cipherBytes),
    );
  }

  Future<String> _resolveDecryptionJid(
    String senderId,
    String? senderAlt,
  ) async {
    final primary = _normalizeChatJid(senderId) ?? senderId;
    if (isLidUser(primary) || isHostedLidUser(primary)) {
      return primary;
    }

    if (isPnUser(primary) || isHostedPnUser(primary)) {
      final mappedLid = creds.pnToLid[primary];
      if (mappedLid != null && mappedLid.isNotEmpty) {
        return mappedLid;
      }
    }

    final alternate = _normalizeChatJid(senderAlt);
    if (alternate != null &&
        alternate.isNotEmpty &&
        (isLidUser(alternate) || isHostedLidUser(alternate)) &&
        (isPnUser(primary) || isHostedPnUser(primary))) {
      return primary;
    }

    return primary;
  }

  Future<void> _storeMapping({String? primary, String? alternate}) async {
    final normalizedPrimary = _normalizeChatJid(primary);
    final normalizedAlt = _normalizeChatJid(alternate);
    if (normalizedPrimary == null || normalizedAlt == null) return;

    final lid = isLidUser(normalizedPrimary)
        ? normalizedPrimary
        : (isLidUser(normalizedAlt) ? normalizedAlt : null);
    final pn = isPnUser(normalizedPrimary)
        ? normalizedPrimary
        : (isPnUser(normalizedAlt) ? normalizedAlt : null);
    if (lid == null || pn == null) return;
    if (creds.lidToPn[lid] == pn && creds.pnToLid[pn] == lid) return;

    creds.lidToPn[lid] = pn;
    creds.pnToLid[pn] = lid;
    if (normalizedPrimary == pn && normalizedAlt == lid) {
      await store.migrateSession(pn, lid);
    }
    await saveCreds();
  }

  Future<_DecodedEnvelope> _decodeEnvelope({
    required BinaryNode node,
    required String msgId,
    required _AddressingInfo addressing,
  }) async {
    var isViewOnceUnavailable = false;
    var foundDecryptable = false;
    Message? merged;
    String? failureText;
    String? failureKind;
    String? failurePrefix;
    int? failureBytes;

    for (final child in node.children) {
      if (child.tag == 'unavailable' &&
          child.attrs['type']?.toString() == 'view_once') {
        isViewOnceUnavailable = true;
      }
      if (child.tag != 'enc' && child.tag != 'plaintext') {
        continue;
      }

      final payload = child.contentBytes;
      if (payload == null || payload.isEmpty) {
        continue;
      }

      foundDecryptable = true;
      Uint8List? messageBytes;
      try {
        if (child.tag == 'plaintext') {
          messageBytes = payload;
        } else {
          try {
            messageBytes = await _decrypt(
              encNode: child,
              senderId: addressing.signalAuthor,
              senderAlt: addressing.signalAuthorAlt,
              remoteJid: addressing.chatId,
            );
          } catch (e) {
            failureText = e.toString();
            failureKind = 'decrypt';
            continue;
          }
        }

        final decoded = _decodeMessageProtoOrThrow(
          messageBytes,
          allowUnpad: child.tag != 'plaintext',
        );
        if (decoded.hasSenderKeyDistributionMessage()) {
          final dist = decoded.senderKeyDistributionMessage;
          final groupId = dist.groupId.isNotEmpty
              ? dist.groupId
              : addressing.chatId;
          final bytes = Uint8List.fromList(
            dist.axolotlSenderKeyDistributionMessage,
          );
          if (groupId.isNotEmpty && bytes.isNotEmpty) {
            await senderKeyManager.processDistributionMessage(
              groupId: groupId,
              senderId: addressing.signalAuthor,
              message: bytes,
            );
          }
        }

        if (merged == null) {
          merged = decoded;
        } else {
          merged.mergeFromMessage(decoded);
        }
      } catch (e) {
        failureText = e.toString();
        failureKind = 'decode';
        if (messageBytes != null && messageBytes.isNotEmpty) {
          failureBytes = messageBytes.length;
          failurePrefix = _hexPrefix(messageBytes);
        }
        _log.warning(
          'Failed to decode decrypted WA protobuf '
          'id=$msgId from=${node.attrs['from'] ?? '-'} '
          'bytes=${failureBytes ?? 0} error=$failureText'
          '${failurePrefix != null ? ' prefix=$failurePrefix' : ''}',
        );
      }
    }

    if (merged != null) {
      return _DecodedEnvelope(message: merged);
    }

    if (!foundDecryptable && !isViewOnceUnavailable) {
      return const _DecodedEnvelope(
        failureText: _noMessageFoundErrorText,
        failureKind: 'missing',
      );
    }

    return _DecodedEnvelope(
      failureText: failureText,
      failureKind: failureKind,
      failurePrefix: failurePrefix,
      failureBytes: failureBytes,
      isViewOnceUnavailable: isViewOnceUnavailable,
    );
  }

  void _emitCiphertextPlaceholder({
    required String msgId,
    required int timestamp,
    required _AddressingInfo addressing,
    required List<String> stubParameters,
  }) {
    final msg = WAMessage(
      id: msgId,
      remoteJid: addressing.chatId,
      remoteJidAlt: addressing.chatIdAlt,
      participant: addressing.participant,
      participantAlt: addressing.participantAlt,
      author: addressing.author,
      authorAlt: addressing.authorAlt,
      addressingMode: addressing.addressingMode,
      fromMe: addressing.fromMe,
      timestamp: timestamp,
      status: WAMessageStatus.delivered,
      body: null,
      stubType: WebMessageInfo_StubType.CIPHERTEXT,
      stubParameters: stubParameters,
    );
    ev.emit('messages.upsert', {
      'messages': [msg],
      'type': 'notify',
    });
    _log.info(
      'Emitted ciphertext placeholder messages.upsert '
      'id=$msgId stub=${stubParameters.join('|')}',
    );
  }

  int _unixTimestampSeconds() =>
      DateTime.now().millisecondsSinceEpoch ~/ 1000;

  // ---------------------------------------------------------------------------
  // Body / media extraction
  // ---------------------------------------------------------------------------

  Message _normalizeMessageContent(Message proto) {
    var current = proto;
    for (var i = 0; i < 8; i++) {
      final next = _getWrappedMessage(current);
      if (next == null) {
        break;
      }
      current = next;
    }
    return current;
  }

  Message _decodeMessageProtoOrThrow(
    Uint8List plaintext, {
    bool allowUnpad = true,
  }) {
    final candidates = <(String, Uint8List)>[
      ('raw', plaintext),
    ];

    if (allowUnpad) {
      try {
        candidates.insert(0, ('unpad_random_max16', unpadRandomMax16(plaintext)));
      } catch (_) {}

      try {
        final trimmedZeros = _trimTrailingZeros(plaintext);
        if (trimmedZeros.length != plaintext.length) {
          candidates.add(('trim_trailing_zeros', trimmedZeros));
        }
      } catch (_) {}

      try {
        final trimmedIso = _trimIso7816LikePadding(plaintext);
        if (trimmedIso.length != plaintext.length) {
          candidates.add(('trim_iso7816', trimmedIso));
        }
      } catch (_) {}

      if (plaintext.isNotEmpty) {
        final skipFirst = plaintext.sublist(1);
        candidates.add(('skip_first_byte', skipFirst));

        try {
          final skipFirstTrimmed = _trimTrailingZeros(skipFirst);
          if (skipFirstTrimmed.length != skipFirst.length) {
            candidates.add(('skip_first_and_trim_zeros', skipFirstTrimmed));
          }
        } catch (_) {}

        try {
          final skipFirstIso = _trimIso7816LikePadding(skipFirst);
          if (skipFirstIso.length != skipFirst.length) {
            candidates.add(('skip_first_and_trim_iso7816', skipFirstIso));
          }
        } catch (_) {}
      }
    }

    final seen = <String>{};
    Object? lastError;
    StackTrace? lastStack;
    for (final (label, bytes) in candidates) {
      if (bytes.isEmpty) {
        continue;
      }
      final signature = '${bytes.length}:${_hexPrefix(bytes, limit: 12)}';
      if (!seen.add(signature)) {
        continue;
      }

      try {
        final proto = Message.fromBuffer(bytes);
        if (label != 'raw') {
          _log.info(
            'Decoded WA protobuf using fallback strategy=$label bytes=${bytes.length}',
          );
        }
        return proto;
      } catch (e, st) {
        lastError = e;
        lastStack = st;
      }
    }

    if (lastError != null) {
      Error.throwWithStackTrace(lastError, lastStack!);
    }
    throw StateError('Failed to decode protobuf');
  }

  Uint8List _trimTrailingZeros(Uint8List bytes) {
    var end = bytes.length;
    while (end > 0 && bytes[end - 1] == 0) {
      end -= 1;
    }
    if (end == bytes.length) {
      return bytes;
    }
    return Uint8List.sublistView(bytes, 0, end);
  }

  Uint8List _trimIso7816LikePadding(Uint8List bytes) {
    var end = bytes.length;
    while (end > 0 && bytes[end - 1] == 0) {
      end -= 1;
    }
    if (end > 0 && bytes[end - 1] == 0x80) {
      return Uint8List.sublistView(bytes, 0, end - 1);
    }
    return bytes;
  }

  String _hexPrefix(Uint8List bytes, {int limit = 24}) {
    final slice = bytes.take(limit);
    return slice.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  Future<bool> _handleProtocolMessage({
    required String msgId,
    required String from,
    required int timestamp,
    required _AddressingInfo addressing,
    required Message_ProtocolMessage? protocol,
  }) async {
    if (protocol == null) return false;

    if (protocol.type ==
            Message_ProtocolMessage_Type
                .PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE &&
        protocol.hasPeerDataOperationRequestResponseMessage()) {
      final response = protocol.peerDataOperationRequestResponseMessage;
      var handled = false;

      for (final result in response.peerDataOperationResult) {
        if (!result.hasPlaceholderMessageResendResponse()) {
          continue;
        }
        final retryResponse = result.placeholderMessageResendResponse;
        if (retryResponse.webMessageInfoBytes.isEmpty) {
          continue;
        }

        try {
          final webMessageInfo = WebMessageInfo.fromBuffer(
            retryResponse.webMessageInfoBytes,
          );
          final requestId = response.stanzaId;
          final msgId = webMessageInfo.hasKey() ? webMessageInfo.key.id : '';
          if (msgId.isNotEmpty) {
            ev.emit('messages.placeholder-resend-resolved', {
              'id': msgId,
              'requestId': requestId,
            });
          }
          handled = await _emitPlaceholderResendMessage(
                webMessageInfo: webMessageInfo,
                requestId: requestId,
              ) ||
              handled;
        } catch (e) {
          _log.warning(
            'failed to decode placeholder resend response '
            'stanzaId=${response.stanzaId} error=$e',
          );
        }
      }

      return handled;
    }

    if (protocol.type ==
            Message_ProtocolMessage_Type.HISTORY_SYNC_NOTIFICATION &&
        protocol.hasHistorySyncNotification()) {
      final histNotification = protocol.historySyncNotification;
      final shouldProcess = _shouldProcessHistoryMessage(histNotification);
      final isLatest = creds.processedHistoryMessages.isEmpty;

      _log.info(
        'Got history notification '
        'id=$msgId from=$from syncType=${histNotification.syncType.name} '
        'process=$shouldProcess isLatest=$isLatest',
      );
      ev.emit('history.sync-notification', {
        'id': msgId,
        'from': from,
        'syncType': histNotification.syncType.name,
        'shouldProcess': shouldProcess,
      });

      if (shouldProcess) {
        if (histNotification.syncType != Message_HistorySyncType.ON_DEMAND) {
          creds.processedHistoryMessages = <dynamic>[
            ...creds.processedHistoryMessages,
            {
              'key': {
                'remoteJid': addressing.chatId,
                'id': msgId,
                'fromMe': addressing.fromMe,
                if (addressing.participant != null)
                  'participant': addressing.participant,
                if (addressing.addressingMode != null)
                  'addressingMode': addressing.addressingMode,
              },
              'messageTimestamp': timestamp,
            },
          ];
          await saveCreds();
          ev.emit('creds.update', {
            'processedHistoryMessages': creds.processedHistoryMessages,
          });
        }

        final data = await downloadAndProcessHistorySyncNotification(
          histNotification,
          logger: _log,
        );
        for (final mapping in data.lidPnMappings) {
          final lid = mapping['lid'];
          final pn = mapping['pn'];
          if (lid != null && pn != null) {
            _storeLidPnMapping(lid: lid, pn: pn);
          }
        }
        await saveCreds();
        ev.emit('creds.update', {
          'lidToPn': creds.lidToPn,
          'pnToLid': creds.pnToLid,
        });
        ev.emit('messaging-history.set', {
          'chats': data.chats,
          'contacts': data.contacts,
          'messages': data.messages,
          'isLatest': histNotification.syncType != Message_HistorySyncType.ON_DEMAND
              ? isLatest
              : null,
          'peerDataRequestSessionId': histNotification.peerDataRequestSessionId,
          'syncType': data.syncType,
          'progress': data.progress,
          'lidPnMappings': data.lidPnMappings,
        });
      }
      return true;
    }

    if (protocol.type ==
            Message_ProtocolMessage_Type.APP_STATE_SYNC_KEY_SHARE &&
        protocol.hasAppStateSyncKeyShare()) {
      final keys = protocol.appStateSyncKeyShare.keys;
      final nextAdditional = <String, dynamic>{
        ...?((creds.additionalData as Map?)?.cast<String, dynamic>()),
      };
      final syncKeys = <String, String>{
        ...?((nextAdditional['appStateSyncKeys'] as Map?)?.map(
          (key, value) => MapEntry(key.toString(), value.toString()),
        )),
      };

      String? newestKeyId;
      for (final key in keys) {
        if (!key.hasKeyId() || !key.keyId.hasKeyId()) continue;
        final keyId = base64Encode(key.keyId.keyId);
        syncKeys[keyId] = base64Encode(key.keyData.writeToBuffer());
        await store.storeAppStateSyncKey(keyId, key.keyData);
        newestKeyId = keyId;
      }

      nextAdditional['appStateSyncKeys'] = syncKeys;
      creds.additionalData = nextAdditional;
      if (newestKeyId != null && newestKeyId.isNotEmpty) {
        creds.myAppStateKeyId = newestKeyId;
      }

      await saveCreds();
      ev.emit('creds.update', {
        'myAppStateKeyId': creds.myAppStateKeyId,
      });
      _log.info(
        'Injected app state sync keys '
        'id=$msgId from=$from count=${keys.length} '
        'myAppStateKeyId=${creds.myAppStateKeyId ?? '-'}',
      );
      ev.emit('app-state.sync-key-share', {
        'id': msgId,
        'count': keys.length,
        'myAppStateKeyId': creds.myAppStateKeyId,
      });
      return true;
    }

    if (protocol.type == Message_ProtocolMessage_Type.REVOKE &&
        protocol.hasKey()) {
      ev.emit('messages.update', [
        {
          'key': {
            'remoteJid': addressing.chatId,
            'remoteJidAlt': addressing.chatIdAlt,
            'fromMe': addressing.fromMe,
            'id': protocol.key.id,
            if (addressing.participant != null)
              'participant': addressing.participant,
            if (addressing.participantAlt != null)
              'participantAlt': addressing.participantAlt,
            if (addressing.addressingMode != null)
              'addressingMode': addressing.addressingMode,
          },
          'update': {
            'message': null,
            'stubType': WebMessageInfo_StubType.REVOKE,
            'key': {
              'remoteJid': addressing.chatId,
              'remoteJidAlt': addressing.chatIdAlt,
              'fromMe': addressing.fromMe,
              'id': msgId,
              if (addressing.participant != null)
                'participant': addressing.participant,
              if (addressing.participantAlt != null)
                'participantAlt': addressing.participantAlt,
              if (addressing.addressingMode != null)
                'addressingMode': addressing.addressingMode,
            },
          },
        },
      ]);
      return true;
    }

    if (protocol.type == Message_ProtocolMessage_Type.EPHEMERAL_SETTING) {
      ev.emit('chats.update', [
        {
          'id': addressing.chatId,
          'ephemeralSettingTimestamp': timestamp,
          'ephemeralExpiration':
              protocol.hasEphemeralExpiration()
                  ? protocol.ephemeralExpiration
                  : null,
        },
      ]);
      return true;
    }

    if (protocol.type == Message_ProtocolMessage_Type.MESSAGE_EDIT &&
        protocol.hasKey() &&
        protocol.hasEditedMessage()) {
      ev.emit('messages.update', [
        {
          'key': {
            'remoteJid': addressing.chatId,
            'remoteJidAlt': addressing.chatIdAlt,
            'fromMe': addressing.fromMe,
            'id': protocol.key.id,
            if (addressing.participant != null)
              'participant': addressing.participant,
            if (addressing.participantAlt != null)
              'participantAlt': addressing.participantAlt,
            if (addressing.addressingMode != null)
              'addressingMode': addressing.addressingMode,
          },
          'update': {
            'message': Message(
              editedMessage: Message_FutureProofMessage(
                message: protocol.editedMessage,
              ),
            ),
            'messageTimestamp': protocol.hasTimestampMs()
                ? (protocol.timestampMs ~/ 1000)
                : timestamp,
          },
        },
      ]);
      return true;
    }

    if (protocol.type ==
            Message_ProtocolMessage_Type.GROUP_MEMBER_LABEL_CHANGE &&
        protocol.hasMemberLabel() &&
        protocol.memberLabel.label.isNotEmpty &&
        (addressing.participant ?? '').isNotEmpty) {
      ev.emit('group.member-tag.update', {
        'groupId': addressing.chatId,
        'label': protocol.memberLabel.label,
        'participant': addressing.participant,
        'participantAlt': addressing.participantAlt,
        'messageTimestamp': timestamp,
      });
      return true;
    }

    if (protocol.type ==
            Message_ProtocolMessage_Type.LID_MIGRATION_MAPPING_SYNC &&
        protocol.hasLidMigrationMappingSyncMessage() &&
        protocol.lidMigrationMappingSyncMessage.encodedMappingPayload
            .isNotEmpty) {
      final payload = LIDMigrationMappingSyncPayload.fromBuffer(
        protocol.lidMigrationMappingSyncMessage.encodedMappingPayload,
      );
      var storedMappings = 0;
      for (final mapping in payload.pnToLidMappings) {
        final latestLid = mapping.latestLid.toString();
        final assignedLid = mapping.assignedLid.toString();
        final lid = (latestLid != '0' ? latestLid : assignedLid).trim();
        final pn = mapping.pn.toString().trim();
        if (lid.isEmpty || lid == '0' || pn.isEmpty || pn == '0') {
          continue;
        }
        final lidJid = '$lid@lid';
        final pnJid = '$pn@s.whatsapp.net';
        _storeLidPnMapping(lid: lidJid, pn: pnJid);
        await store.migrateSession(pnJid, lidJid);
        storedMappings += 1;
      }
      if (storedMappings > 0) {
        await saveCreds();
        ev.emit('creds.update', {
          'lidToPn': creds.lidToPn,
          'pnToLid': creds.pnToLid,
        });
      }
      _log.info(
        'Applied LID migration mapping sync '
        'id=$msgId from=$from mappings=$storedMappings',
      );
      return true;
    }

    return false;
  }

  void _cachePlaceholderResend({
    required String msgId,
    required int timestamp,
    required _AddressingInfo addressing,
  }) {
    if (msgId.isEmpty) {
      return;
    }
    _placeholderResendCache[msgId] = _PlaceholderResendEntry(
      addressing: addressing,
      timestamp: timestamp,
    );
  }

  Future<bool> _emitPlaceholderResendMessage({
    required WebMessageInfo webMessageInfo,
    required String? requestId,
  }) async {
    if (!webMessageInfo.hasMessage()) {
      return false;
    }

    final key = webMessageInfo.hasKey() ? webMessageInfo.key : MessageKey();
    final msgId = key.id;
    final cached = msgId.isNotEmpty ? _placeholderResendCache.remove(msgId) : null;
    final timestamp = webMessageInfo.hasMessageTimestamp()
        ? webMessageInfo.messageTimestamp.toInt()
        : (cached?.timestamp ??
              DateTime.now().millisecondsSinceEpoch ~/ 1000);
    final addressing = _addressingFromWebMessageInfo(webMessageInfo, cached);
    final contentProto = _normalizeMessageContent(webMessageInfo.message);

    if (await _handleProtocolMessage(
      msgId: msgId,
      from: addressing.chatId,
      timestamp: timestamp,
      addressing: addressing,
      protocol: contentProto.hasProtocolMessage()
          ? contentProto.protocolMessage
          : null,
    )) {
      return true;
    }

    final reaction = _extractReaction(contentProto, addressing);
    final body = _extractBody(contentProto);
    final media = _extractMedia(contentProto);
    if ((body == null || body.isEmpty) && reaction == null && media == null) {
      _log.info(
        'Decoded WA message without extracted body '
        'id=$msgId from=${addressing.chatId} '
        'content=${_describeMessageContent(contentProto)}',
      );
    }

    final msg = WAMessage(
      id: msgId,
      remoteJid: addressing.chatId,
      remoteJidAlt: addressing.chatIdAlt,
      participant: addressing.participant,
      participantAlt: addressing.participantAlt,
      author: addressing.author,
      authorAlt: addressing.authorAlt,
      addressingMode: addressing.addressingMode,
      fromMe: addressing.fromMe,
      timestamp: timestamp,
      status: WAMessageStatus.delivered,
      message: contentProto,
      body: body,
      media: media,
      reaction: reaction,
    );

    ev.emit('messages.upsert', {
      'messages': [msg],
      'type': 'notify',
      if (requestId != null && requestId.isNotEmpty) 'requestId': requestId,
    });
    _log.info(
      'Emitted placeholder resend messages.upsert '
      'id=$msgId requestId=${requestId ?? '-'} '
      'bodyLength=${body?.length ?? 0} hasReaction=${reaction != null} '
      'hasMedia=${media != null}',
    );
    return true;
  }

  _AddressingInfo _addressingFromWebMessageInfo(
    WebMessageInfo info,
    _PlaceholderResendEntry? cached,
  ) {
    final key = info.hasKey() ? info.key : MessageKey();
    final remoteJid =
        _normalizeChatJid(key.remoteJid) ??
        cached?.addressing.chatId ??
        '';
    final participant = _normalizeChatJid(
      key.participant.isNotEmpty ? key.participant : info.participant,
    );
    final fromMe = key.fromMe || (cached?.addressing.fromMe ?? false);

    if (cached != null) {
      return _AddressingInfo(
        chatId: remoteJid.isNotEmpty ? remoteJid : cached.addressing.chatId,
        chatIdAlt: cached.addressing.chatIdAlt,
        author: participant ?? cached.addressing.author,
        authorAlt: cached.addressing.authorAlt,
        signalAuthor: cached.addressing.signalAuthor,
        signalAuthorAlt: cached.addressing.signalAuthorAlt,
        participant: participant ?? cached.addressing.participant,
        participantAlt: cached.addressing.participantAlt,
        addressingMode: cached.addressing.addressingMode,
        fromMe: fromMe,
      );
    }

    final author = participant ?? remoteJid;
    return _AddressingInfo(
      chatId: remoteJid,
      author: author,
      authorAlt: null,
      signalAuthor: participant ?? remoteJid,
      signalAuthorAlt: null,
      participant: participant,
      participantAlt: null,
      addressingMode: null,
      fromMe: fromMe,
    );
  }

  bool _shouldProcessHistoryMessage(Message_HistorySyncNotification notification) {
    return notification.syncType != Message_HistorySyncType.FULL;
  }

  Message? _getWrappedMessage(Message proto) {
    if (proto.hasDeviceSentMessage() && proto.deviceSentMessage.hasMessage()) {
      return proto.deviceSentMessage.message;
    }
    if (proto.hasEphemeralMessage() && proto.ephemeralMessage.hasMessage()) {
      return proto.ephemeralMessage.message;
    }
    if (proto.hasViewOnceMessage() && proto.viewOnceMessage.hasMessage()) {
      return proto.viewOnceMessage.message;
    }
    if (proto.hasDocumentWithCaptionMessage() &&
        proto.documentWithCaptionMessage.hasMessage()) {
      return proto.documentWithCaptionMessage.message;
    }
    if (proto.hasViewOnceMessageV2() &&
        proto.viewOnceMessageV2.hasMessage()) {
      return proto.viewOnceMessageV2.message;
    }
    if (proto.hasViewOnceMessageV2Extension() &&
        proto.viewOnceMessageV2Extension.hasMessage()) {
      return proto.viewOnceMessageV2Extension.message;
    }
    if (proto.hasEditedMessage() && proto.editedMessage.hasMessage()) {
      return proto.editedMessage.message;
    }
    if (proto.hasGroupMentionedMessage() &&
        proto.groupMentionedMessage.hasMessage()) {
      return proto.groupMentionedMessage.message;
    }
    if (proto.hasAssociatedChildMessage() &&
        proto.associatedChildMessage.hasMessage()) {
      return proto.associatedChildMessage.message;
    }
    if (proto.hasGroupStatusMessage() &&
        proto.groupStatusMessage.hasMessage()) {
      return proto.groupStatusMessage.message;
    }
    if (proto.hasGroupStatusMessageV2() &&
        proto.groupStatusMessageV2.hasMessage()) {
      return proto.groupStatusMessageV2.message;
    }
    return null;
  }

  String? _extractBody(Message proto) {
    if (proto.hasReactionMessage()) return null;
    if (proto.hasConversation()) return proto.conversation;
    if (proto.hasExtendedTextMessage()) {
      return proto.extendedTextMessage.text;
    }
    if (proto.hasButtonsMessage()) {
      final contentText = proto.buttonsMessage.contentText;
      if (contentText.isNotEmpty) return contentText;
      final text = proto.buttonsMessage.text;
      if (text.isNotEmpty) return text;
    }
    if (proto.hasButtonsResponseMessage()) {
      final selected = proto.buttonsResponseMessage.selectedDisplayText;
      if (selected.isNotEmpty) return selected;
    }
    if (proto.hasTemplateButtonReplyMessage()) {
      final selected = proto.templateButtonReplyMessage.selectedDisplayText;
      if (selected.isNotEmpty) return selected;
    }
    if (proto.hasListMessage()) {
      final description = proto.listMessage.description;
      if (description.isNotEmpty) return description;
      final title = proto.listMessage.title;
      if (title.isNotEmpty) return title;
    }
    if (proto.hasListResponseMessage()) {
      final description = proto.listResponseMessage.description;
      if (description.isNotEmpty) return description;
      final title = proto.listResponseMessage.title;
      if (title.isNotEmpty) return title;
      final selectedRowId = proto.listResponseMessage.singleSelectReply.selectedRowId;
      if (selectedRowId.isNotEmpty) return selectedRowId;
    }
    if (proto.hasTemplateMessage()) {
      final content = _extractTemplateText(proto.templateMessage);
      if (content != null && content.isNotEmpty) return content;
    }
    if (proto.hasImageMessage()) return proto.imageMessage.caption;
    if (proto.hasVideoMessage()) return proto.videoMessage.caption;
    if (proto.hasLiveLocationMessage()) return proto.liveLocationMessage.caption;
    if (proto.hasDocumentMessage()) return proto.documentMessage.fileName;
    if (proto.hasGroupInviteMessage()) return proto.groupInviteMessage.caption;
    if (proto.hasHighlyStructuredMessage()) {
      final fallback = proto.highlyStructuredMessage.fallbackLg;
      if (fallback.isNotEmpty) return fallback;
      if (proto.highlyStructuredMessage.params.isNotEmpty) {
        return proto.highlyStructuredMessage.params.join(' ');
      }
    }
    if (proto.hasInteractiveResponseMessage()) {
      final body = proto.interactiveResponseMessage.body.text;
      if (body.isNotEmpty) return body;
    }
    if (proto.hasInteractiveMessage()) {
      final body = proto.interactiveMessage.body.text;
      if (body.isNotEmpty) return body;
    }
    return null;
  }

  String? _extractTemplateText(Message_TemplateMessage template) {
    if (template.hasHydratedFourRowTemplate()) {
      final text = template.hydratedFourRowTemplate.hydratedContentText;
      if (text.isNotEmpty) return text;
      final title = template.hydratedFourRowTemplate.hydratedTitleText;
      if (title.isNotEmpty) return title;
    }
    if (template.hasHydratedTemplate()) {
      final text = template.hydratedTemplate.hydratedContentText;
      if (text.isNotEmpty) return text;
      final title = template.hydratedTemplate.hydratedTitleText;
      if (title.isNotEmpty) return title;
    }
    if (template.hasFourRowTemplate()) {
      final content = template.fourRowTemplate.content.fallbackLg;
      if (content.isNotEmpty) return content;
      final params = template.fourRowTemplate.content.params;
      if (params.isNotEmpty) return params.join(' ');
    }
    return null;
  }

  String _describeMessageContent(Message proto) {
    if (proto.hasProtocolMessage()) {
      return 'protocolMessage(type=${proto.protocolMessage.type.name})';
    }
    if (proto.hasConversation()) return 'conversation';
    if (proto.hasExtendedTextMessage()) return 'extendedTextMessage';
    if (proto.hasButtonsMessage()) return 'buttonsMessage';
    if (proto.hasButtonsResponseMessage()) return 'buttonsResponseMessage';
    if (proto.hasTemplateButtonReplyMessage()) {
      return 'templateButtonReplyMessage';
    }
    if (proto.hasTemplateMessage()) return 'templateMessage';
    if (proto.hasListMessage()) return 'listMessage';
    if (proto.hasListResponseMessage()) return 'listResponseMessage';
    if (proto.hasInteractiveMessage()) return 'interactiveMessage';
    if (proto.hasInteractiveResponseMessage()) {
      return 'interactiveResponseMessage';
    }
    if (proto.hasReactionMessage()) return 'reactionMessage';
    if (proto.hasImageMessage()) return 'imageMessage';
    if (proto.hasVideoMessage()) return 'videoMessage';
    if (proto.hasAudioMessage()) return 'audioMessage';
    if (proto.hasDocumentMessage()) return 'documentMessage';
    if (proto.hasStickerMessage()) return 'stickerMessage';
    if (proto.hasLocationMessage()) return 'locationMessage';
    if (proto.hasLiveLocationMessage()) return 'liveLocationMessage';
    if (proto.hasContactMessage()) return 'contactMessage';
    if (proto.hasContactsArrayMessage()) return 'contactsArrayMessage';
    if (proto.hasPollCreationMessage()) return 'pollCreationMessage';
    if (proto.hasPollCreationMessageV2()) return 'pollCreationMessageV2';
    if (proto.hasPollUpdateMessage()) return 'pollUpdateMessage';
    if (proto.hasKeepInChatMessage()) return 'keepInChatMessage';
    if (proto.hasSenderKeyDistributionMessage()) {
      return 'senderKeyDistributionMessage';
    }
    if (proto.hasHighlyStructuredMessage()) return 'highlyStructuredMessage';
    return 'unknown';
  }

  WAReactionInfo? _extractReaction(Message proto, _AddressingInfo addressing) {
    if (!proto.hasReactionMessage()) return null;
    final reaction = proto.reactionMessage;
    final key = reaction.key;
    final remoteJid = _normalizeChatJid(key.remoteJid) ?? addressing.chatId;
    final participant =
        _normalizeChatJid(key.participant) ?? addressing.participant;
    return WAReactionInfo(
      targetMessageId: key.id,
      emoji: reaction.text,
      remoteJid: remoteJid,
      participant: participant,
      fromMe: key.fromMe,
    );
  }

  WAMediaInfo? _extractMedia(Message proto) {
    if (proto.hasImageMessage()) {
      final m = proto.imageMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        caption: m.caption,
        fileLength: m.fileLength.toInt(),
      );
    }
    if (proto.hasVideoMessage()) {
      final m = proto.videoMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        caption: m.caption,
        fileLength: m.fileLength.toInt(),
      );
    }
    if (proto.hasAudioMessage()) {
      final m = proto.audioMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
      );
    }
    if (proto.hasDocumentMessage()) {
      final m = proto.documentMessage;
      return WAMediaInfo(
        url: m.url,
        directPath: m.directPath,
        mediaKey: Uint8List.fromList(m.mediaKey),
        mimetype: m.mimetype,
        fileLength: m.fileLength.toInt(),
      );
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  _AddressingInfo _decodeAddressing(BinaryNode node) {
    final from = node.attrs['from']?.toString() ?? '';
    final participant = node.attrs['participant']?.toString();
    final recipient = node.attrs['recipient']?.toString();
    final sender = participant ?? from;
    final mode =
        node.attrs['addressing_mode']?.toString() ??
        (isLidUser(sender) ? 'lid' : 'pn');

    String? senderAlt;
    String? recipientAlt;
    if (mode == 'lid') {
      senderAlt =
          node.attrs['participant_pn']?.toString() ??
          node.attrs['sender_pn']?.toString() ??
          node.attrs['peer_recipient_pn']?.toString();
      recipientAlt = node.attrs['recipient_pn']?.toString();
    } else {
      senderAlt =
          node.attrs['participant_lid']?.toString() ??
          node.attrs['sender_lid']?.toString() ??
          node.attrs['peer_recipient_lid']?.toString();
      recipientAlt = node.attrs['recipient_lid']?.toString();
    }

    final normalizedFrom = _normalizeChatJid(from) ?? from;
    final normalizedParticipant = _normalizeChatJid(participant);
    final normalizedSenderAlt = _normalizeChatJid(senderAlt);
    final normalizedRecipient = _normalizeChatJid(recipient);
    final normalizedRecipientAlt = _normalizeChatJid(recipientAlt);

    if (isJidGroup(from)) {
      final author = normalizedParticipant ?? normalizedFrom;
      return _AddressingInfo(
        chatId: normalizedFrom,
        chatIdAlt: null,
        author: author,
        authorAlt: normalizedSenderAlt,
        signalAuthor: participant ?? from,
        signalAuthorAlt: normalizedSenderAlt,
        participant: normalizedParticipant,
        participantAlt: normalizedSenderAlt,
        addressingMode: mode,
        fromMe: _isMe(participant),
      );
    }

    final fromMe = recipient != null && recipient.isNotEmpty && _isMe(from);
    final chatId = fromMe
        ? (normalizedRecipient ?? normalizedFrom)
        : normalizedFrom;
    final chatIdAlt = fromMe ? normalizedRecipientAlt : normalizedSenderAlt;

    return _AddressingInfo(
      chatId: chatId,
      chatIdAlt: chatIdAlt,
      author: normalizedFrom,
      authorAlt: normalizedSenderAlt,
      signalAuthor: sender,
      signalAuthorAlt: normalizedSenderAlt,
      participant: null,
      participantAlt: null,
      addressingMode: mode,
      fromMe: fromMe,
    );
  }

  bool _isMe(String? jid) {
    if (jid == null || jid.isEmpty) return false;
    return (_myJid.isNotEmpty && areJidsSameUser(jid, _myJid)) ||
        (_myLid != null && _myLid!.isNotEmpty && areJidsSameUser(jid, _myLid));
  }

  String? _normalizeChatJid(String? jid) {
    if (jid == null || jid.isEmpty) return null;
    if (isJidGroup(jid) || isJidBroadcast(jid) || isJidNewsletter(jid)) {
      return jid;
    }
    return jidNormalizedUser(jid);
  }

  void _storeLidPnMapping({
    required String lid,
    required String pn,
  }) {
    final normalizedLid = _normalizeChatJid(lid);
    final normalizedPn = _normalizeChatJid(pn);
    if (normalizedLid == null || normalizedPn == null) {
      return;
    }
    creds.lidToPn[normalizedLid] = normalizedPn;
    creds.pnToLid[normalizedPn] = normalizedLid;
  }

  Future<void> _sendDeliveryReceipt({
    required String msgId,
    required String to,
    String? participant,
    String? recipient,
    String? receiptType,
    String? chatId,
  }) async {
    if (msgId.isEmpty || to.isEmpty) return;
    final attrs = <String, String>{'id': msgId};
    if (receiptType == 'sender' &&
        chatId != null &&
        chatId.isNotEmpty &&
        (isPnUser(chatId) || isLidUser(chatId)) &&
        participant != null &&
        participant.isNotEmpty) {
      attrs['to'] = participant;
      attrs['recipient'] = chatId;
    } else {
      attrs['to'] = to;
      if (participant != null && participant.isNotEmpty) {
        attrs['participant'] = participant;
      }
      if (recipient != null && recipient.isNotEmpty) {
        attrs['recipient'] = recipient;
      }
    }
    if (receiptType != null && receiptType.isNotEmpty) {
      attrs['type'] = receiptType;
    }

    final receipt = BinaryNode(tag: 'receipt', attrs: attrs);
    await socket.sendNode(receipt);
  }

  Future<void> _sendProtocolReceipts({
    required String msgId,
    required String from,
    required String? participant,
    required String? recipient,
    required String? category,
    required int timestamp,
    required _AddressingInfo addressing,
    required Message_ProtocolMessage? protocol,
  }) async {
    await _sendDeliveryReceipt(
      msgId: msgId,
      to: from,
      participant: participant,
      recipient: recipient,
      receiptType: _deliveryReceiptType(
        category: category,
        fromMe: addressing.fromMe,
      ),
      chatId: addressing.chatId,
    );

    if (protocol?.type ==
        Message_ProtocolMessage_Type.HISTORY_SYNC_NOTIFICATION) {
      final normalizedChat =
          _normalizeChatJid(addressing.chatId) ?? addressing.chatId;
      await _sendDeliveryReceipt(
        msgId: msgId,
        to: normalizedChat,
        receiptType: 'hist_sync',
        chatId: normalizedChat,
      );
      _log.info(
        'Sent hist_sync receipt for bootstrap history message '
        'id=$msgId chatId=$normalizedChat timestamp=$timestamp',
      );
    }
  }

  String? _deliveryReceiptType({
    required String? category,
    required bool fromMe,
  }) {
    if (category == 'peer') {
      return 'peer_msg';
    }
    if (fromMe) {
      return 'sender';
    }
    return null;
  }

  Future<void> _sendMessageAck(BinaryNode node, {int? errorCode}) async {
    try {
      await socket.sendNode(
        buildAckStanza(node, meId: creds.me?.id, errorCode: errorCode),
      );
    } catch (_) {
      // Best-effort only.
    }
  }
}
