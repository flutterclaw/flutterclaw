import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as libsignal;

/// Crypto primitives for the Noise Protocol and general WhatsApp crypto.
/// Uses `cryptography` package (Apache 2.0).

/// Generate an X25519 key pair.
Future<SimpleKeyPair> generateX25519KeyPair() async {
  final algorithm = X25519();
  return await algorithm.newKeyPair();
}

/// Perform X25519 Diffie-Hellman shared secret computation.
Future<Uint8List> x25519SharedKey(
    SimpleKeyPair ourKeyPair, SimplePublicKey theirPublicKey) async {
  final algorithm = X25519();
  final sharedSecret = await algorithm.sharedSecretKey(
    keyPair: ourKeyPair,
    remotePublicKey: theirPublicKey,
  );
  final bytes = await sharedSecret.extractBytes();
  return Uint8List.fromList(bytes);
}

/// AES-256-GCM encrypt. Tag is appended to ciphertext.
Future<Uint8List> aesEncryptGCM(
    Uint8List plaintext, Uint8List key, Uint8List iv, Uint8List aad) async {
  final algorithm = AesGcm.with256bits();
  final secretKey = SecretKey(key);
  final secretBox = await algorithm.encrypt(
    plaintext,
    secretKey: secretKey,
    nonce: iv,
    aad: aad,
  );
  // Combine ciphertext + mac (tag)
  final result = Uint8List(secretBox.cipherText.length + secretBox.mac.bytes.length);
  result.setAll(0, secretBox.cipherText);
  result.setAll(secretBox.cipherText.length, secretBox.mac.bytes);
  return result;
}

/// AES-256-GCM decrypt. Expects tag appended to ciphertext.
Future<Uint8List> aesDecryptGCM(
    Uint8List ciphertext, Uint8List key, Uint8List iv, Uint8List aad) async {
  final algorithm = AesGcm.with256bits();
  const tagLength = 16; // 128 bits
  final enc = ciphertext.sublist(0, ciphertext.length - tagLength);
  final tag = ciphertext.sublist(ciphertext.length - tagLength);
  final secretKey = SecretKey(key);
  final secretBox = SecretBox(enc, nonce: iv, mac: Mac(tag));
  final decrypted = await algorithm.decrypt(secretBox, secretKey: secretKey, aad: aad);
  return Uint8List.fromList(decrypted);
}

/// HKDF-SHA256 key derivation.
Future<Uint8List> hkdfExpand(Uint8List input, int length,
    {required Uint8List salt, Uint8List? info}) async {
  final algorithm = Hkdf(hmac: Hmac.sha256(), outputLength: length);
  final secretKey = SecretKey(input);
  final derived = await algorithm.deriveKey(
    secretKey: secretKey,
    nonce: salt,
    info: info ?? Uint8List(0),
  );
  final bytes = await derived.extractBytes();
  return Uint8List.fromList(bytes);
}

/// SHA-256 hash.
Future<Uint8List> sha256Hash(Uint8List data) async {
  final algorithm = Sha256();
  final hash = await algorithm.hash(data);
  return Uint8List.fromList(hash.bytes);
}

/// HMAC-SHA256 sign.
Future<Uint8List> hmacSha256(Uint8List data, Uint8List key) async {
  final algorithm = Hmac.sha256();
  final secretKey = SecretKey(key);
  final mac = await algorithm.calculateMac(data, secretKey: secretKey);
  return Uint8List.fromList(mac.bytes);
}

/// Generate IV for Noise counter-based encryption.
Uint8List generateNoiseIV(int counter) {
  final iv = Uint8List(12);
  final view = ByteData.view(iv.buffer);
  view.setUint32(8, counter, Endian.big);
  return iv;
}

/// Ed25519 sign.
Future<Uint8List> ed25519Sign(Uint8List privateKey, Uint8List message) async {
  final algorithm = Ed25519();
  final keyPair = await algorithm.newKeyPairFromSeed(privateKey);
  final signature = await algorithm.sign(message, keyPair: keyPair);
  return Uint8List.fromList(signature.bytes);
}

/// Curve25519 (Signal) sign.
Future<Uint8List> curve25519Sign(
    Uint8List privateKey, Uint8List message) async {
  final key = libsignal.DjbECPrivateKey(privateKey);
  return libsignal.Curve.calculateSignature(key, message);
}

/// Generate cryptographically random bytes.
Uint8List generateRandomBytes(int length) {
  final rng = Random.secure();
  return Uint8List.fromList(List.generate(length, (_) => rng.nextInt(256)));
}

/// Ed25519 verify.
Future<bool> ed25519Verify(
    Uint8List publicKey, Uint8List message, Uint8List signature) async {
  final algorithm = Ed25519();
  final pk = SimplePublicKey(publicKey, type: KeyPairType.ed25519);
  final sig = Signature(signature, publicKey: pk);
  return await algorithm.verify(message, signature: sig);
}

/// Curve25519 (Signal) verify.
Future<bool> curve25519Verify(
    Uint8List publicKey, Uint8List message, Uint8List signature) async {
  final key = libsignal.DjbECPublicKey(publicKey);
  return libsignal.Curve.verifySignature(key, message, signature);
}
