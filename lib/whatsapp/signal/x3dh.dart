import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart';
import 'signal_keys.dart';

/// Extended Triple Diffie-Hellman (X3DH) key agreement.
///
/// Spec: https://signal.org/docs/specifications/x3dh/
///
/// This implements the initiator-side of X3DH to establish a shared secret
/// with a recipient given their pre-key bundle.

// ---------------------------------------------------------------------------
// X3DH constants
// ---------------------------------------------------------------------------

/// Info string used in HKDF for X3DH key derivation.
const _x3dhInfo = 'WhisperText';

/// 32-byte curve25519 "F" constant for X3DH: 0xFF repeated 32 times.
final _f = Uint8List(32)..fillRange(0, 32, 0xff);

// ---------------------------------------------------------------------------
// Initiator side
// ---------------------------------------------------------------------------

/// Result of initiating X3DH.
class X3DHInitResult {
  /// 32-byte shared secret (input to Double Ratchet).
  final Uint8List sharedSecret;

  /// Our ephemeral public key (send to recipient in PreKeyMessage).
  final Uint8List ephemeralPublic;

  /// The one-time pre-key ID we used (null if none was available).
  final int? usedOneTimePreKeyId;

  const X3DHInitResult({
    required this.sharedSecret,
    required this.ephemeralPublic,
    this.usedOneTimePreKeyId,
  });
}

/// Initiate X3DH as Alice (sender) given Bob's [bundle].
///
/// [identityKey] is Alice's long-term identity key pair.
/// [bundle]      is Bob's pre-key bundle (fetched from the server).
///
/// Returns the shared secret and the ephemeral public key to include in the
/// initial message header.
Future<X3DHInitResult> x3dhInitiate({
  required SimpleKeyPair identityKey,
  required PreKeyBundle bundle,
}) async {
  // Verify Bob's signed pre-key signature before proceeding.
  final valid = await ed25519Verify(
    bundle.identityKey,
    bundle.signedPreKeyPublic,
    bundle.signedPreKeySignature,
  );
  if (!valid) {
    throw StateError('X3DH: signed pre-key signature verification failed');
  }

  // Generate Alice's ephemeral key pair.
  final ephemeralKP = await generateX25519KeyPair();
  final ephemeralPub = await publicKeyBytes(ephemeralKP);

  // Bob's public keys as SimplePublicKey objects.
  final bobIK =
      SimplePublicKey(bundle.identityKey, type: KeyPairType.x25519);
  final bobSPK =
      SimplePublicKey(bundle.signedPreKeyPublic, type: KeyPairType.x25519);

  // DH1 = DH(IK_A, SPK_B)
  final dh1 = await x25519SharedKey(identityKey, bobSPK);

  // DH2 = DH(EK_A, IK_B)
  final dh2 = await x25519SharedKey(ephemeralKP, bobIK);

  // DH3 = DH(EK_A, SPK_B)
  final dh3 = await x25519SharedKey(ephemeralKP, bobSPK);

  Uint8List? dh4;
  int? usedOtpkId;

  if (bundle.preKeyId != 0) {
    // DH4 = DH(EK_A, OPK_B)  [one-time pre-key]
    final bobOPK =
        SimplePublicKey(bundle.preKeyPublic, type: KeyPairType.x25519);
    dh4 = await x25519SharedKey(ephemeralKP, bobOPK);
    usedOtpkId = bundle.preKeyId;
  }

  // SK = HKDF(F || DH1 || DH2 || DH3 [|| DH4], info="WhisperText")
  final dhInput = _buildDHInput(dh1, dh2, dh3, dh4);
  final sk = await _x3dhHKDF(dhInput);

  return X3DHInitResult(
    sharedSecret: sk,
    ephemeralPublic: ephemeralPub,
    usedOneTimePreKeyId: usedOtpkId,
  );
}

// ---------------------------------------------------------------------------
// Recipient side
// ---------------------------------------------------------------------------

/// Respond to X3DH as Bob (recipient).
///
/// Called when Bob receives Alice's initial message containing her identity
/// key and ephemeral key.
///
/// [identityKey]    Bob's long-term identity key pair.
/// [signedPreKey]   Bob's signed pre-key pair (matching the ID Alice used).
/// [oneTimePreKey]  Bob's one-time pre-key pair (null if none was used).
/// [aliceIdentityKey]  Alice's identity public key (from message header).
/// [aliceEphemeralKey] Alice's ephemeral public key (from message header).
Future<Uint8List> x3dhRespond({
  required SimpleKeyPair identityKey,
  required SimpleKeyPair signedPreKey,
  SimpleKeyPair? oneTimePreKey,
  required Uint8List aliceIdentityKey,
  required Uint8List aliceEphemeralKey,
}) async {
  final aliceIK =
      SimplePublicKey(aliceIdentityKey, type: KeyPairType.x25519);
  final aliceEK =
      SimplePublicKey(aliceEphemeralKey, type: KeyPairType.x25519);

  // DH1 = DH(SPK_B, IK_A)
  final dh1 = await x25519SharedKey(signedPreKey, aliceIK);

  // DH2 = DH(IK_B, EK_A)
  final dh2 = await x25519SharedKey(identityKey, aliceEK);

  // DH3 = DH(SPK_B, EK_A)
  final dh3 = await x25519SharedKey(signedPreKey, aliceEK);

  Uint8List? dh4;
  if (oneTimePreKey != null) {
    // DH4 = DH(OPK_B, EK_A)
    dh4 = await x25519SharedKey(oneTimePreKey, aliceEK);
  }

  final dhInput = _buildDHInput(dh1, dh2, dh3, dh4);
  return _x3dhHKDF(dhInput);
}

// ---------------------------------------------------------------------------
// Internal helpers
// ---------------------------------------------------------------------------

Uint8List _buildDHInput(
    Uint8List dh1, Uint8List dh2, Uint8List dh3, Uint8List? dh4) {
  final parts = [_f, dh1, dh2, dh3];
  if (dh4 != null) parts.add(dh4);

  var totalLen = 0;
  for (final p in parts) {
    totalLen += p.length;
  }
  final combined = Uint8List(totalLen);
  var offset = 0;
  for (final p in parts) {
    combined.setAll(offset, p);
    offset += p.length;
  }
  return combined;
}

/// HKDF-SHA256 with empty salt and info = "WhisperText", output = 32 bytes.
Future<Uint8List> _x3dhHKDF(Uint8List input) async {
  return hkdfExpand(
    input,
    32,
    salt: Uint8List(32), // zero salt (spec: optional, use zeros when absent)
    info: Uint8List.fromList(_x3dhInfo.codeUnits),
  );
}
