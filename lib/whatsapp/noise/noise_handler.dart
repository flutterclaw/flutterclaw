import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto_pkg;
import 'package:cryptography/cryptography.dart';

import '../binary/decoder.dart';
import 'noise_crypto.dart';

/// Noise Protocol mode used by WhatsApp.
const noiseMode = 'Noise_XX_25519_AESGCM_SHA256\x00\x00\x00\x00';

/// WhatsApp Noise header (WA prefix + version).
final waNoiseHeader = Uint8List.fromList([
  0x57, 0x41, // 'WA'
  0x06, // major version
  0x03, // minor version
]);

/// Transport state for post-handshake encrypted communication.
class _TransportState {
  final Uint8List _encKey;
  final Uint8List _decKey;
  int _readCounter = 0;
  int _writeCounter = 0;

  _TransportState(this._encKey, this._decKey);

  Future<Uint8List> encrypt(Uint8List plaintext) async {
    final iv = generateNoiseIV(_writeCounter++);
    return aesEncryptGCM(plaintext, _encKey, iv, Uint8List(0));
  }

  Future<Uint8List> decrypt(Uint8List ciphertext) async {
    final iv = generateNoiseIV(_readCounter++);
    return aesDecryptGCM(ciphertext, _decKey, iv, Uint8List(0));
  }
}

/// Noise Protocol handler for WhatsApp WebSocket communication.
/// Port of Baileys Utils/noise-handler.ts.
class NoiseHandler {
  final SimpleKeyPair _ephemeralKeyPair;
  final Uint8List? _routingInfo;

  Uint8List _hash;
  Uint8List _salt;
  Uint8List _encKey;
  Uint8List _decKey;
  int _counter = 0;
  bool _sentIntro = false;
  _TransportState? _transport;

  /// Buffer for incoming data that hasn't been fully framed yet.
  final _inBytes = <int>[];

  NoiseHandler._({
    required SimpleKeyPair ephemeralKeyPair,
    required Uint8List initialHash,
    Uint8List? routingInfo,
  })  : _ephemeralKeyPair = ephemeralKeyPair,
        _hash = initialHash,
        _salt = Uint8List.fromList(initialHash),
        _encKey = Uint8List.fromList(initialHash),
        _decKey = Uint8List.fromList(initialHash),
        _routingInfo = routingInfo;

  /// Create a new Noise handler with a fresh ephemeral key pair.
  static Future<NoiseHandler> create({Uint8List? routingInfo}) async {
    final keyPair = await generateX25519KeyPair();
    final modeBytes = Uint8List.fromList(noiseMode.codeUnits);

    Uint8List hash;
    if (modeBytes.length == 32) {
      hash = modeBytes;
    } else {
      hash = await sha256Hash(modeBytes);
    }

    final handler = NoiseHandler._(
      ephemeralKeyPair: keyPair,
      initialHash: hash,
      routingInfo: routingInfo,
    );

    // Authenticate the Noise header and our public key
    handler._authenticate(waNoiseHeader);
    final publicKey = await keyPair.extractPublicKey();
    handler._authenticate(Uint8List.fromList(publicKey.bytes));

    return handler;
  }

  /// Whether the handshake is complete and transport mode is active.
  bool get isTransportReady => _transport != null;

  /// Our ephemeral public key bytes (for sending in clientHello).
  Future<Uint8List> get ephemeralPublicKey async {
    final pk = await _ephemeralKeyPair.extractPublicKey();
    return Uint8List.fromList(pk.bytes);
  }

  void _authenticate(Uint8List data) {
    if (_transport != null) return;
    final combined = Uint8List(_hash.length + data.length);
    combined.setAll(0, _hash);
    combined.setAll(_hash.length, data);
    _hash = _syncSha256(combined);
  }

  /// Synchronous SHA-256 using the `crypto` package.
  static Uint8List _syncSha256(Uint8List data) {
    final digest = crypto_pkg.sha256.convert(data);
    return Uint8List.fromList(digest.bytes);
  }

  /// Encrypt during handshake (pre-transport).
  Future<Uint8List> encrypt(Uint8List plaintext) async {
    if (_transport != null) return _transport!.encrypt(plaintext);

    final iv = generateNoiseIV(_counter++);
    final result = await aesEncryptGCM(plaintext, _encKey, iv, _hash);
    _authenticate(result);
    return result;
  }

  /// Decrypt during handshake (pre-transport).
  Future<Uint8List> decrypt(Uint8List ciphertext) async {
    if (_transport != null) return _transport!.decrypt(ciphertext);

    final iv = generateNoiseIV(_counter++);
    final result = await aesDecryptGCM(ciphertext, _decKey, iv, _hash);
    _authenticate(ciphertext);
    return result;
  }

  Future<List<Uint8List>> _localHKDF(Uint8List data) async {
    final key = await hkdfExpand(data, 64, salt: _salt, info: Uint8List(0));
    return [key.sublist(0, 32), key.sublist(32)];
  }

  Future<void> _mixIntoKey(Uint8List data) async {
    final keys = await _localHKDF(data);
    _salt = keys[0];
    _encKey = keys[1];
    _decKey = keys[1];
    _counter = 0;
  }

  /// Finish the handshake and transition to transport mode.
  Future<void> finishInit() async {
    final keys = await _localHKDF(Uint8List(0));
    _transport = _TransportState(keys[0], keys[1]);
  }

  /// Process server hello and return encrypted noise key public.
  ///
  /// [serverEphemeral], [serverStaticEncrypted], [serverPayloadEncrypted]
  /// come from the HandshakeMessage.serverHello.
  /// [noiseKeyPair] is the long-term noise key pair.
  ///
  /// Returns the encrypted noise public key to send back.
  Future<Uint8List> processHandshake({
    required Uint8List serverEphemeral,
    required Uint8List serverStaticEncrypted,
    required Uint8List serverPayloadEncrypted,
    required SimpleKeyPair noiseKeyPair,
  }) async {
    // Authenticate server ephemeral
    _authenticate(serverEphemeral);

    // DH with our ephemeral private + server ephemeral public
    final serverEphPubKey =
        SimplePublicKey(serverEphemeral, type: KeyPairType.x25519);
    final sharedKey1 =
        await x25519SharedKey(_ephemeralKeyPair, serverEphPubKey);
    await _mixIntoKey(sharedKey1);

    // Decrypt server static
    final decStaticContent = await decrypt(serverStaticEncrypted);

    // DH with our ephemeral private + decrypted server static public
    final serverStaticPubKey =
        SimplePublicKey(decStaticContent, type: KeyPairType.x25519);
    final sharedKey2 =
        await x25519SharedKey(_ephemeralKeyPair, serverStaticPubKey);
    await _mixIntoKey(sharedKey2);

    // Decrypt server payload (cert chain) — verified in wa_socket.dart
    await decrypt(serverPayloadEncrypted);

    // Encrypt our noise public key
    final noisePublicKey = await noiseKeyPair.extractPublicKey();
    final keyEnc =
        await encrypt(Uint8List.fromList(noisePublicKey.bytes));

    // DH with noise private + server ephemeral
    final sharedKey3 = await x25519SharedKey(noiseKeyPair, serverEphPubKey);
    await _mixIntoKey(sharedKey3);

    return keyEnc;
  }

  /// Encode a frame for sending over WebSocket.
  /// Prepends intro header on first call, then length-prefixed encrypted data.
  Future<Uint8List> encodeFrame(Uint8List data) async {
    if (_transport != null) {
      data = await _transport!.encrypt(data);
    }

    final dataLen = data.length;
    final introHeader = _buildIntroHeader();
    final introSize = _sentIntro ? 0 : introHeader.length;
    final frame = Uint8List(introSize + 3 + dataLen);

    if (!_sentIntro) {
      frame.setAll(0, introHeader);
      _sentIntro = true;
    }

    frame[introSize] = (dataLen >> 16) & 0xff;
    frame[introSize + 1] = (dataLen >> 8) & 0xff;
    frame[introSize + 2] = dataLen & 0xff;
    frame.setAll(introSize + 3, data);

    return frame;
  }

  /// Decode incoming WebSocket data into frames.
  /// Calls [onFrame] for each complete frame.
  Future<void> decodeFrame(
      Uint8List newData, void Function(Object frame) onFrame) async {
    _inBytes.addAll(newData);

    while (true) {
      if (_inBytes.length < 3) return;

      final size = (_inBytes[0] << 16) | (_inBytes[1] << 8) | _inBytes[2];
      if (_inBytes.length < size + 3) return;

      final frameBytes =
          Uint8List.fromList(_inBytes.sublist(3, size + 3));
      _inBytes.removeRange(0, size + 3);

      if (_transport != null) {
        final decrypted = await _transport!.decrypt(frameBytes);
        final node = await decodeBinaryNode(decrypted);
        onFrame(node);
      } else {
        // Pre-transport: raw bytes
        onFrame(frameBytes);
      }
    }
  }

  Uint8List _buildIntroHeader() {
    final ri = _routingInfo;
    if (ri != null) {
      final header = Uint8List(7 + ri.length + waNoiseHeader.length);
      header[0] = 0x45; // 'E'
      header[1] = 0x44; // 'D'
      header[2] = 0;
      header[3] = 1;
      header[4] = (ri.length >> 16) & 0xff;
      header[5] = (ri.length >> 8) & 0xff;
      header[6] = ri.length & 0xff;
      header.setAll(7, ri);
      header.setAll(7 + ri.length, waNoiseHeader);
      return header;
    }
    return waNoiseHeader;
  }
}
