import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import '../binary/generic_utils.dart';
import '../binary/types.dart';
import '../socket/wa_socket.dart';
import 'auth_state.dart';

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
    // pair-device arrives as <iq type=set xmlns=md> (not <ib>) in the
    // multi-device protocol.  pair-success also arrives as an <iq>.
    socket.on('iq', _onIq);
  }

  void stop() {
    _qrRefreshTimer?.cancel();
    _qrRefreshTimer = null;
    socket.off('iq', _onIq);
    _qrController.close();
  }

  Future<void> _onIq(BinaryNode node) async {
    if (node.attrs['type'] == 'set') {
      final pair = getBinaryNodeChild(node, 'pair-device');
      if (pair != null) {
        // ACK the IQ immediately so the server doesn't disconnect.
        await _ackIq(node.attrs['id']?.toString() ?? '');
        await _handlePairDevice(pair);
        return;
      }
    }

    // pair-success may arrive with any type.
    final success = getBinaryNodeChild(node, 'pair-success');
    if (success != null) {
      await _processPairSuccess(
        successNode: success,
        iqId: node.attrs['id']?.toString() ?? '',
      );
    }
  }

  Future<void> _ackIq(String id) async {
    await socket.sendNode(BinaryNode(
      tag: 'iq',
      attrs: {'to': '@s.whatsapp.net', 'type': 'result', 'id': id},
    ));
  }

  Future<void> _handlePairDevice(BinaryNode node) async {
    // Cancel any pending rotation from a previous connection.
    _qrRefreshTimer?.cancel();
    _qrRefreshTimer = null;

    // Baileys sends multiple <ref> children — rotate through them every 20s.
    final refs = getBinaryNodeChildren(node, 'ref')
        .map((r) => r.contentString)
        .whereType<String>()
        .toList();

    if (refs.isEmpty) return;

    final noisePub = await authState.creds.noiseKey.extractPublicKey();
    final identPub = await authState.creds.signedIdentityKey.extractPublicKey();
    final advKey = authState.creds.advSecretKey;

    // Standard base64 WITH padding — do NOT strip '='.
    final noiseB64 = base64Encode(Uint8List.fromList(noisePub.bytes));
    final identB64 = base64Encode(Uint8List.fromList(identPub.bytes));
    final advB64 = base64Encode(advKey);

    var index = 0;
    void emitNext() {
      if (index >= refs.length || _qrController.isClosed) return;
      _qrController.add('${refs[index]},$noiseB64,$identB64,$advB64');
      index++;
      if (index < refs.length) {
        _qrRefreshTimer = Timer(const Duration(seconds: 20), emitNext);
      }
    }

    emitNext();
  }

  Future<void> _processPairSuccess({
    required BinaryNode successNode,
    required String iqId,
  }) async {
    final deviceIdentityNode =
        getBinaryNodeChild(successNode, 'device-identity');
    if (deviceIdentityNode == null) return;

    final platform =
        getBinaryNodeChild(successNode, 'platform')?.contentString ?? 'smba';
    final deviceIdentityBytes = deviceIdentityNode.contentBytes;
    if (deviceIdentityBytes == null) return;

    authState.creds.platform = platform;
    await authState.saveCreds();

    // ACK the pair-success IQ using the parent IQ id.
    await _ackIq(iqId);
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
