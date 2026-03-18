import 'dart:async';
import 'dart:typed_data';

import '../auth/auth_state.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../proto/wa_proto.pb.dart';
import '../signal/signal_store.dart';
import '../socket/wa_socket.dart';
import '../utils/event_emitter.dart';
import 'message_send.dart' as msg_send;

/// Handles failed message decoding/decryption by requesting a resend.
class MessageRetryHandler {
  final WASocket socket;
  final WAEventEmitter ev;
  final SignalProtocolStore store;
  final AuthenticationCreds creds;
  final Future<void> Function() saveCreds;

  // msgId -> retry count
  final _retries = <String, int>{};
  final _pendingPlaceholderResends = <String>{};
  static const _maxRetries = 5;
  static const _keyBundleType = [0x05];

  late final StreamSubscription<Map<String, dynamic>> _decryptErrorSub;
  late final StreamSubscription<Map<String, dynamic>> _decodeErrorSub;
  late final StreamSubscription<Map<String, dynamic>>
  _placeholderResolvedSub;

  MessageRetryHandler({
    required this.socket,
    required this.ev,
    required this.store,
    required this.creds,
    required this.saveCreds,
  }) {
    _decryptErrorSub = ev.on<Map<String, dynamic>>(
      'messages.decrypt-error',
      _onRetryEvent,
    );
    _decodeErrorSub = ev.on<Map<String, dynamic>>(
      'messages.decode-error',
      _onRetryEvent,
    );
    _placeholderResolvedSub = ev.on<Map<String, dynamic>>(
      'messages.placeholder-resend-resolved',
      (event) {
        final msgId = event['id'] as String?;
        if (msgId != null && msgId.isNotEmpty) {
          _pendingPlaceholderResends.remove(msgId);
        }
      },
    );
  }

  Future<void> _onRetryEvent(Map<String, dynamic> event) async {
    final msgId = event['id'] as String? ?? '';
    final from = event['from'] as String? ?? '';
    final chatId = event['chatId'] as String? ?? from;
    final retryPolicy = event['retryPolicy'] as String? ?? 'retry';
    if (msgId.isEmpty || from.isEmpty || chatId.isEmpty) {
      return;
    }

    final participant = event['participant'] as String?;
    final recipient = event['recipient'] as String?;
    final senderId = event['senderId'] as String?;
    final fromMe = event['fromMe'] as bool? ?? false;
    final timestamp = event['timestamp'] as int?;
    final forceIncludeKeys = event['forceIncludeKeys'] as bool? ?? false;

    final count = (_retries[msgId] ?? 0) + 1;
    if (count > _maxRetries) {
      _retries.remove(msgId);
      _pendingPlaceholderResends.remove(msgId);
      if (senderId != null && senderId.isNotEmpty) {
        await store.deleteSession(senderId);
      }
      return;
    }
    _retries[msgId] = count;

    if (retryPolicy == 'placeholder_resend') {
      if (count <= 2) {
        unawaited(
          _requestPlaceholderResend(
            msgId: msgId,
            chatId: chatId,
            participant: participant,
            fromMe: fromMe,
          ),
        );
      }
      return;
    }

    if (count <= 2) {
      unawaited(
        _requestPlaceholderResend(
          msgId: msgId,
          chatId: chatId,
          participant: participant,
          fromMe: fromMe,
        ),
      );
    }

    await _sendRetryReceipt(
      msgId: msgId,
      to: from,
      retryCount: count,
      participant: participant,
      recipient: recipient,
      timestamp: timestamp,
      forceIncludeKeys: forceIncludeKeys,
    );
  }

  Future<void> _requestPlaceholderResend({
    required String msgId,
    required String chatId,
    required bool fromMe,
    String? participant,
  }) async {
    final me = creds.me;
    if (me == null || me.id.isEmpty || _pendingPlaceholderResends.contains(msgId)) {
      return;
    }

    _pendingPlaceholderResends.add(msgId);
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!_pendingPlaceholderResends.contains(msgId)) {
      return;
    }

    final messageKey = MessageKey(
      remoteJid: chatId,
      fromMe: fromMe,
      id: msgId,
      participant: participant,
    );
    final request = Message_PeerDataOperationRequestMessage(
      peerDataOperationRequestType:
          Message_PeerDataOperationRequestType.PLACEHOLDER_MESSAGE_RESEND,
      placeholderMessageResendRequest: [
        Message_PeerDataOperationRequestMessage_PlaceholderMessageResendRequest(
          messageKey: messageKey,
        ),
      ],
    );

    try {
      await msg_send.sendPeerDataOperationMessage(
        socket: socket,
        store: store,
        jid: jidNormalizedUser(me.id),
        request: request,
      );
    } catch (_) {
      _pendingPlaceholderResends.remove(msgId);
      rethrow;
    }

    unawaited(
      Future<void>.delayed(const Duration(seconds: 8), () {
        _pendingPlaceholderResends.remove(msgId);
      }),
    );
  }

  Future<void> _sendRetryReceipt({
    required String msgId,
    required String to,
    required int retryCount,
    required bool forceIncludeKeys,
    String? participant,
    String? recipient,
    int? timestamp,
  }) async {
    await store.transaction(() async {
      final content = <BinaryNode>[
        BinaryNode(
          tag: 'retry',
          attrs: {
            'count': retryCount.toString(),
            'id': msgId,
            'v': '1',
            'error': '0',
            if (timestamp != null) 't': timestamp.toString(),
          },
        ),
        BinaryNode(
          tag: 'registration',
          attrs: const {},
          content: _encodeUint32(creds.registrationId),
        ),
      ];

      if (retryCount > 1 || forceIncludeKeys) {
        final identityPub = await creds.signedIdentityKey.extractPublicKey();
        final preKey = await _allocateRetryPreKey();
        final preKeyPub = await preKey.keyPair.extractPublicKey();
        final signedPreKeyPub = await creds.signedPreKey.keyPair
            .extractPublicKey();
        final deviceIdentity = _encodeSignedDeviceIdentity(
          creds.account,
          includeSignatureKey: true,
        );

        content.add(
          BinaryNode(
            tag: 'keys',
            attrs: const {},
            content: [
              BinaryNode(
                tag: 'type',
                attrs: const {},
                content: Uint8List.fromList(_keyBundleType),
              ),
              BinaryNode(
                tag: 'identity',
                attrs: const {},
                content: Uint8List.fromList(identityPub.bytes),
              ),
              _xmppPreKey(
                id: preKey.id,
                publicKey: Uint8List.fromList(preKeyPub.bytes),
              ),
              _xmppSignedPreKey(
                id: creds.signedPreKey.id,
                publicKey: Uint8List.fromList(signedPreKeyPub.bytes),
                signature: creds.signedPreKey.signature,
              ),
              if (deviceIdentity != null)
                BinaryNode(
                  tag: 'device-identity',
                  attrs: const {},
                  content: deviceIdentity,
                ),
            ],
          ),
        );
      }

      final receipt = BinaryNode(
        tag: 'receipt',
        attrs: {
          'id': msgId,
          'to': to,
          'type': 'retry',
          if (participant != null && participant.isNotEmpty)
            'participant': participant,
          if (recipient != null && recipient.isNotEmpty) 'recipient': recipient,
        },
        content: content,
      );

      await socket.sendNode(receipt);
    }, 'retry-$msgId');
  }

  Future<PreKeyRecord> _allocateRetryPreKey() async {
    final nextId = creds.nextPreKeyId;
    final generated = await generatePreKeys(nextId, 1);
    final preKey = generated.first;
    await store.storePreKey(preKey.id, preKey);

    final updatedNext = preKey.id + 1;
    creds
      ..nextPreKeyId = updatedNext
      ..firstUnuploadedPreKeyId = updatedNext;
    await saveCreds();
    ev.emit('creds.update', {
      'nextPreKeyId': creds.nextPreKeyId,
      'firstUnuploadedPreKeyId': creds.firstUnuploadedPreKeyId,
    });

    return preKey;
  }

  Uint8List? _encodeSignedDeviceIdentity(
    ADVSignedDeviceIdentity? account, {
    required bool includeSignatureKey,
  }) {
    if (account == null) {
      return null;
    }

    final encoded = ADVSignedDeviceIdentity.fromBuffer(account.writeToBuffer());
    if (!includeSignatureKey ||
        !encoded.hasAccountSignatureKey() ||
        encoded.accountSignatureKey.isEmpty) {
      encoded.clearAccountSignatureKey();
    }
    return Uint8List.fromList(encoded.writeToBuffer());
  }

  BinaryNode _xmppPreKey({
    required int id,
    required Uint8List publicKey,
  }) {
    return BinaryNode(
      tag: 'key',
      attrs: const {},
      content: [
        BinaryNode(
          tag: 'id',
          attrs: const {},
          content: _encodeBigEndian(id, 3),
        ),
        BinaryNode(
          tag: 'value',
          attrs: const {},
          content: publicKey,
        ),
      ],
    );
  }

  BinaryNode _xmppSignedPreKey({
    required int id,
    required Uint8List publicKey,
    required Uint8List signature,
  }) {
    return BinaryNode(
      tag: 'skey',
      attrs: const {},
      content: [
        BinaryNode(
          tag: 'id',
          attrs: const {},
          content: _encodeBigEndian(id, 3),
        ),
        BinaryNode(
          tag: 'value',
          attrs: const {},
          content: publicKey,
        ),
        BinaryNode(
          tag: 'signature',
          attrs: const {},
          content: signature,
        ),
      ],
    );
  }

  Uint8List _encodeBigEndian(int value, [int length = 4]) {
    final bytes = Uint8List(length);
    for (var i = length - 1; i >= 0; i--) {
      bytes[i] = value & 0xff;
      value >>= 8;
    }
    return bytes;
  }

  Uint8List _encodeUint32(int value) => _encodeBigEndian(value, 4);

  Future<void> dispose() async {
    _retries.clear();
    _pendingPlaceholderResends.clear();
    await _decryptErrorSub.cancel();
    await _decodeErrorSub.cancel();
    await _placeholderResolvedSub.cancel();
  }
}
