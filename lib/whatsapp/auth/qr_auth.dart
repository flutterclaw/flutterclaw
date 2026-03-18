import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import '../binary/generic_utils.dart';
import '../binary/types.dart';
import '../socket/wa_socket.dart';
import 'auth_state.dart';
import 'pair_success.dart';

/// Manages the QR-code authentication flow.
///
/// Listens for `pair-device` nodes from the server, constructs the QR string,
/// and handles `pair-success` to extract and persist credentials.
class QRAuth {
  final WASocket socket;
  final WAAuthState authState;

  final _qrController = StreamController<String>.broadcast();

  /// Stream of QR code strings for the UI to render.
  Stream<String> get qrStream => _qrController.stream;

  Timer? _qrRefreshTimer;

  QRAuth({required this.socket, required this.authState});

  /// Start listening for pair-device / pair-success nodes.
  void start() {
    socket.config.logger.info(
      'QRAuth started (hasMe=${authState.creds.me != null})',
    );
    // pair-device arrives as <iq type=set xmlns=md> (not <ib>) in the
    // multi-device protocol.  pair-success also arrives as an <iq>.
    socket.on('iq', _onIq);
  }

  void stop() {
    socket.config.logger.info('QRAuth stopped');
    _qrRefreshTimer?.cancel();
    _qrRefreshTimer = null;
    socket.off('iq', _onIq);
    if (!_qrController.isClosed) {
      _qrController.close();
    }
  }

  Future<void> _onIq(BinaryNode node) async {
    final success = getBinaryNodeChild(node, 'pair-success');
    socket.config.logger.info(
      'QRAuth observed iq id=${node.attrs['id'] ?? '-'} '
      'type=${node.attrs['type'] ?? '-'} '
      'xmlns=${node.attrs['xmlns'] ?? '-'} '
      'childTags=${node.children.map((c) => c.tag).toList()} '
      'hasPairSuccess=${success != null}',
    );

    if (node.attrs['type'] == 'set') {
      final contentType = node.content == null
          ? 'null'
          : node.content.runtimeType.toString();
      final childTags = node.children.map((c) => c.tag).toList();
      socket.config.logger.info(
        'iq:set md contentType=$contentType children=$childTags',
      );
      if (success != null) {
        await _processPairSuccess(
          stanza: node,
          iqId: node.attrs['id']?.toString() ?? '',
        );
        return;
      }
      final pair = getBinaryNodeChild(node, 'pair-device');
      if (pair != null) {
        // ACK the IQ immediately so the server doesn't disconnect.
        await _ackIq(node.attrs['id']?.toString() ?? '');
        await _handlePairDevice(pair);
        return;
      }

      // If we got a set IQ without pair-device, ACK it to avoid stream errors.
      final id = node.attrs['id']?.toString();
      if (id != null && id.isNotEmpty) {
        await _ackIq(id);
      }
    }

    // pair-success may arrive with any type.
    if (success != null) {
      await _processPairSuccess(
        stanza: node,
        iqId: node.attrs['id']?.toString() ?? '',
      );
    }
  }

  Future<void> _ackIq(String id) async {
    socket.config.logger.info('Acknowledging WhatsApp iq id=$id');
    await socket.sendNode(
      BinaryNode(
        tag: 'iq',
        attrs: {'to': '@s.whatsapp.net', 'type': 'result', 'id': id},
      ),
    );
  }

  Future<void> _handlePairDevice(BinaryNode node) async {
    // Cancel any pending rotation from a previous connection.
    _qrRefreshTimer?.cancel();
    _qrRefreshTimer = null;

    // Baileys sends multiple <ref> children — rotate through them every 20s.
    final refs = getBinaryNodeChildren(
      node,
      'ref',
    ).map((r) => r.contentString).whereType<String>().toList();

    if (refs.isEmpty) {
      socket.config.logger.warning(
        'pair-device received without refs attrs=${node.attrs} childTags=${node.children.map((c) => c.tag).toList()}',
      );
      return;
    }

    final noisePub = await authState.creds.noiseKey.extractPublicKey();
    final identPub = await authState.creds.signedIdentityKey.extractPublicKey();
    final advKey = authState.creds.advSecretKey;

    // Standard base64 WITH padding — do NOT strip '='.
    final noiseB64 = base64Encode(Uint8List.fromList(noisePub.bytes));
    final identB64 = base64Encode(Uint8List.fromList(identPub.bytes));
    final advB64 = base64Encode(advKey);

    var index = 0;
    final overrideMs = socket.config.qrTimeout?.inMilliseconds;
    var qrMs = overrideMs ?? 60000;
    socket.config.logger.info(
      'Handling pair-device refs=${refs.length} '
      'noiseKeyBytes=${noisePub.bytes.length} identityKeyBytes=${identPub.bytes.length} '
      'advKeyBytes=${advKey.length} firstQrMs=$qrMs nextQrMs=${overrideMs ?? 20000}',
    );

    void emitNext() {
      if (_qrController.isClosed) return;
      if (index >= refs.length) {
        socket.config.logger.warning('QR refs exhausted, closing connection');
        unawaited(socket.close());
        return;
      }

      socket.config.logger.info(
        'Emitting WhatsApp QR refIndex=${index + 1}/${refs.length} '
        'refLength=${refs[index].length} timeoutMs=$qrMs',
      );
      _qrController.add('${refs[index]},$noiseB64,$identB64,$advB64');
      index++;
      if (index < refs.length) {
        _qrRefreshTimer = Timer(Duration(milliseconds: qrMs), emitNext);
        qrMs = overrideMs ?? 20000;
      }
    }

    emitNext();
  }

  Future<void> _processPairSuccess({
    required BinaryNode stanza,
    required String iqId,
  }) async {
    _qrRefreshTimer?.cancel();
    _qrRefreshTimer = null;
    socket.config.logger.info(
      'pair-success received — processing (iqId=$iqId) '
      'attrs=${stanza.attrs} childTags=${stanza.children.map((c) => c.tag).toList()}',
    );

    try {
      final result = await configureSuccessfulPairingDart(
        stanza,
        authState.creds,
        msgIdOverride: iqId.isNotEmpty ? iqId : null,
      );
      socket.config.logger.info(
        'pair-success verified jid=${result.jid} lid=${result.lid ?? '-'} '
        'platform=${result.platform ?? '-'} bizName=${result.bizName ?? '-'} '
        'hasAccount=${result.account != null} hasSignalIdentity=${result.signalIdentity != null}',
      );

      // Send reply IQ constructed by the helper.
      final pairDeviceSign = getBinaryNodeChild(
        result.replyNode,
        'pair-device-sign',
      );
      final replyIdentity = getBinaryNodeChild(
        pairDeviceSign,
        'device-identity',
      );
      socket.config.logger.info(
        'Sending pair-device-sign reply iqId=$iqId '
        'keyIndex=${replyIdentity?.attrs['key-index'] ?? '-'}',
      );
      await socket.sendNode(result.replyNode);
      unawaited(_sendUnifiedSessionBestEffort());

      // Update credentials with authenticated user info.
      authState.creds.platform = result.platform ?? 'smba';
      authState.creds.me = WAMe(
        id: result.jid,
        name: result.bizName ?? '',
        lid: result.lid,
      );
      authState.creds.account = result.account;
      if (result.signalIdentity != null) {
        final current = authState.creds.signalIdentities ?? <SignalIdentity>[];
        authState.creds.signalIdentities = [...current, result.signalIdentity!];
      }
      await authState.saveCreds();
      socket.config.logger.info(
        'Saved paired creds me=${authState.creds.me?.id ?? '-'} '
        'lid=${authState.creds.me?.lid ?? '-'} '
        'signalIdentityCount=${authState.creds.signalIdentities?.length ?? 0}',
      );

      socket.config.logger.info(
        'Pairing successful — me=${authState.creds.me?.id}, '
        'platform=${authState.creds.platform}',
      );
    } catch (e, st) {
      socket.config.logger.warning('pair-success processing failed: $e\n$st');
    }
  }

  String _getUnifiedSessionId() {
    const dayMs = 24 * 60 * 60 * 1000;
    const weekMs = 7 * dayMs;
    final now = DateTime.now().millisecondsSinceEpoch;
    return ((now + 3 * dayMs) % weekMs).toString();
  }

  Future<void> _sendUnifiedSessionBestEffort() async {
    final sessionId = _getUnifiedSessionId();
    socket.config.logger.info(
      'Sending unified_session during pair-success id=$sessionId',
    );
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
      socket.config.logger.fine(
        'failed to send unified_session during pair-success: $e',
      );
    }
  }
}

/// Build the client payload bytes with pairing registration data.
/// Used when registering a new device via QR.
Future<Uint8List> buildPairingRegistrationPayload({
  required AuthenticationCreds creds,
  required int registrationId,
}) async {
  final noisePub = await creds.noiseKey.extractPublicKey();
  final identPub = await creds.signedIdentityKey.extractPublicKey();
  final spkPub = await creds.signedPreKey.keyPair.extractPublicKey();

  // Build a pre-key bundle for the server.
  final preKeyId = creds.signedPreKey.id;
  final spkSig = creds.signedPreKey.signature;

  // Encode registration data as JSON (WhatsApp web format).
  final data = {
    'registrationId': registrationId,
    'noiseKey': base64Encode(Uint8List.fromList(noisePub.bytes)),
    'identityKey': base64Encode(Uint8List.fromList(identPub.bytes)),
    'signedPreKey': {
      'keyId': preKeyId,
      'publicKey': base64Encode(Uint8List.fromList(spkPub.bytes)),
      'signature': base64Encode(spkSig),
    },
  };

  return Uint8List.fromList(utf8.encode(jsonEncode(data)));
}
