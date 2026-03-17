import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart';

// ---------------------------------------------------------------------------
// Key pair helpers
// ---------------------------------------------------------------------------

/// Serialise an X25519 key pair to JSON-safe map.
Future<Map<String, dynamic>> keyPairToJson(SimpleKeyPair kp) async {
  final priv = await kp.extractPrivateKeyBytes();
  final pub = await kp.extractPublicKey();
  return {
    'private': base64Encode(priv),
    'public': base64Encode(pub.bytes),
  };
}

/// Deserialise an X25519 key pair from a JSON map.
Future<SimpleKeyPair> keyPairFromJson(Map<String, dynamic> j) async {
  final privBytes = base64Decode(j['private'] as String);
  return X25519().newKeyPairFromSeed(privBytes);
}

/// Extract the raw public key bytes from an X25519 key pair.
Future<Uint8List> publicKeyBytes(SimpleKeyPair kp) async {
  final pub = await kp.extractPublicKey();
  return Uint8List.fromList(pub.bytes);
}

// ---------------------------------------------------------------------------
// IdentityKeyPair
// ---------------------------------------------------------------------------

/// Long-term X25519 identity key pair (Alice/Bob in X3DH).
class IdentityKeyPair {
  final SimpleKeyPair keyPair;

  const IdentityKeyPair(this.keyPair);

  static Future<IdentityKeyPair> generate() async =>
      IdentityKeyPair(await generateX25519KeyPair());

  Future<Uint8List> get publicKey => publicKeyBytes(keyPair);

  Future<Map<String, dynamic>> toJson() => keyPairToJson(keyPair);

  static Future<IdentityKeyPair> fromJson(Map<String, dynamic> j) async =>
      IdentityKeyPair(await keyPairFromJson(j));
}

// ---------------------------------------------------------------------------
// PreKey
// ---------------------------------------------------------------------------

/// One-time X25519 pre-key (id + public key only — private is in the store).
class PreKeyBundle {
  final int registrationId;
  final int deviceId;
  final int preKeyId;
  final Uint8List preKeyPublic;
  final int signedPreKeyId;
  final Uint8List signedPreKeyPublic;
  final Uint8List signedPreKeySignature;
  final Uint8List identityKey;

  const PreKeyBundle({
    required this.registrationId,
    required this.deviceId,
    required this.preKeyId,
    required this.preKeyPublic,
    required this.signedPreKeyId,
    required this.signedPreKeyPublic,
    required this.signedPreKeySignature,
    required this.identityKey,
  });
}

// ---------------------------------------------------------------------------
// SenderKeyRecord
// ---------------------------------------------------------------------------

/// Sender Key state for group messaging.
class SenderKeyRecord {
  /// Current chain key (HMAC-ratcheted each message).
  Uint8List chainKey;

  /// Ed25519 signing key pair for sender key distribution messages.
  final SimpleKeyPair signingKey;

  /// Current chain key iteration counter.
  int iteration;

  SenderKeyRecord({
    required this.chainKey,
    required this.signingKey,
    required this.iteration,
  });

  static Future<SenderKeyRecord> generate() async {
    final chainKey = generateRandomBytes(32);
    final signingKey = await generateX25519KeyPair();
    return SenderKeyRecord(
      chainKey: chainKey,
      signingKey: signingKey,
      iteration: 0,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final skJson = await keyPairToJson(signingKey);
    return {
      'chainKey': base64Encode(chainKey),
      'signingKey': skJson,
      'iteration': iteration,
    };
  }

  static Future<SenderKeyRecord> fromJson(Map<String, dynamic> j) async {
    final skPair = await keyPairFromJson(j['signingKey'] as Map<String, dynamic>);
    return SenderKeyRecord(
      chainKey: base64Decode(j['chainKey'] as String),
      signingKey: skPair,
      iteration: j['iteration'] as int,
    );
  }
}
