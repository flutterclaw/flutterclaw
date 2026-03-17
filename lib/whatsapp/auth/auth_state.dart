import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart'
    show generateX25519KeyPair, generateRandomBytes, ed25519Sign;
import '../signal/signal_store.dart';

// ---------------------------------------------------------------------------
// Credential types
// ---------------------------------------------------------------------------

/// WhatsApp identity (JID + LID).
class WAMe {
  final String id;
  final String name;

  const WAMe({required this.id, required this.name});

  factory WAMe.fromJson(Map<String, dynamic> j) =>
      WAMe(id: j['id'] as String, name: j['name'] as String? ?? '');

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

/// All persisted credentials for a WhatsApp session.
/// Matches the shape written by Baileys' useMultiFileAuthState.
class AuthenticationCreds {
  /// Long-term Noise keypair (X25519).
  SimpleKeyPair noiseKey;

  /// Signed identity keypair (X25519 for X3DH).
  SimpleKeyPair signedIdentityKey;

  /// Signed pre-key (X25519 + signature).
  SignedPreKeyRecord signedPreKey;

  /// Random 32-byte secret used for adv (linked-device) messages.
  Uint8List advSecretKey;

  /// Signal Protocol registration ID.
  int registrationId;

  /// Authenticated user info (set after QR success).
  WAMe? me;

  /// Platform string sent in IQ queries.
  String platform;

  // Timestamps / account data set post-QR.
  Map<String, dynamic>? account;
  String? signalIdentities;
  int? lastAccountSyncTimestamp;
  int? myAppStateKeyId;

  AuthenticationCreds({
    required this.noiseKey,
    required this.signedIdentityKey,
    required this.signedPreKey,
    required this.advSecretKey,
    required this.registrationId,
    this.me,
    this.platform = 'smba',
    this.account,
    this.signalIdentities,
    this.lastAccountSyncTimestamp,
    this.myAppStateKeyId,
  });

  /// Create brand-new credentials (first run).
  static Future<AuthenticationCreds> generate() async {
    final noiseKey = await generateX25519KeyPair();
    final identityKey = await generateX25519KeyPair();
    final advSecret = generateRandomBytes(32);
    final regId = _generateRegistrationId();

    // Generate signed pre-key #1.
    final spk = await _generateSignedPreKey(identityKey, 1);

    return AuthenticationCreds(
      noiseKey: noiseKey,
      signedIdentityKey: identityKey,
      signedPreKey: spk,
      advSecretKey: advSecret,
      registrationId: regId,
    );
  }
}

// ---------------------------------------------------------------------------
// Credential serialization helpers
// ---------------------------------------------------------------------------

Future<Map<String, dynamic>> _keyPairToJson(SimpleKeyPair kp) async {
  final priv = await kp.extractPrivateKeyBytes();
  final pub = await kp.extractPublicKey();
  return {
    'private': base64Encode(priv),
    'public': base64Encode(pub.bytes),
  };
}

Future<SimpleKeyPair> _keyPairFromJson(Map<String, dynamic> j) async {
  final privBytes = base64Decode(j['private'] as String);
  return X25519().newKeyPairFromSeed(privBytes);
}

// ---------------------------------------------------------------------------
// Signed pre-key
// ---------------------------------------------------------------------------

class SignedPreKeyRecord {
  final int id;
  final SimpleKeyPair keyPair;
  final Uint8List signature;
  final int timestamp;

  const SignedPreKeyRecord({
    required this.id,
    required this.keyPair,
    required this.signature,
    required this.timestamp,
  });

  Future<Map<String, dynamic>> toJson() async {
    final kpJson = await _keyPairToJson(keyPair);
    return {
      'keyId': id,
      'keyPair': kpJson,
      'signature': base64Encode(signature),
      'timestamp': timestamp,
    };
  }

  static Future<SignedPreKeyRecord> fromJson(Map<String, dynamic> j) async {
    final kp = await _keyPairFromJson(j['keyPair'] as Map<String, dynamic>);
    return SignedPreKeyRecord(
      id: j['keyId'] as int,
      keyPair: kp,
      signature: base64Decode(j['signature'] as String),
      timestamp: j['timestamp'] as int? ??
          DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
  }
}

Future<SignedPreKeyRecord> _generateSignedPreKey(
    SimpleKeyPair identityKey, int id) async {
  final spkPair = await generateX25519KeyPair();
  final pub = await spkPair.extractPublicKey();
  // Sign the public key with our identity key (Ed25519 semantics via X25519 sign).
  // WhatsApp uses Curve25519 signing here (same as Signal Protocol).
  final privBytes = await identityKey.extractPrivateKeyBytes();
  final sig = await ed25519Sign(
      Uint8List.fromList(privBytes), Uint8List.fromList(pub.bytes));

  return SignedPreKeyRecord(
    id: id,
    keyPair: spkPair,
    signature: sig,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

int _generateRegistrationId() {
  // 31-bit random integer (Signal Protocol spec).
  final bytes = generateRandomBytes(4);
  return ((bytes[0] << 16) | (bytes[1] << 8) | bytes[2]) & 0x3fffff;
}

// ---------------------------------------------------------------------------
// Multi-file auth state (persistent on-device storage)
// ---------------------------------------------------------------------------

/// Loads or generates auth state persisted as JSON files in [directory].
/// Returns [WAAuthState] that exposes [creds] + [SignalProtocolStore].
class WAAuthState {
  final AuthenticationCreds creds;
  final SignalProtocolStore keys;

  /// Callback to persist current creds (call after mutations).
  final Future<void> Function() saveCreds;

  const WAAuthState({
    required this.creds,
    required this.keys,
    required this.saveCreds,
  });

  /// Load (or create) auth state from [directory].
  static Future<WAAuthState> load(String directory) async {
    final dir = Directory(directory);
    await dir.create(recursive: true);

    final credsFile = File('$directory/creds.json');
    AuthenticationCreds creds;

    if (await credsFile.exists()) {
      final raw = await credsFile.readAsString();
      final j = jsonDecode(raw) as Map<String, dynamic>;
      creds = await _credsFromJson(j);
    } else {
      creds = await AuthenticationCreds.generate();
      await _saveCreds(credsFile, creds);
    }

    final keys = FileBasedSignalStore(directory: directory);

    return WAAuthState(
      creds: creds,
      keys: keys,
      saveCreds: () => _saveCreds(credsFile, creds),
    );
  }

  static Future<void> _saveCreds(
      File file, AuthenticationCreds creds) async {
    final j = await _credsToJson(creds);
    await file.writeAsString(jsonEncode(j));
  }
}

// ---------------------------------------------------------------------------
// Creds JSON serialization
// ---------------------------------------------------------------------------

Future<Map<String, dynamic>> _credsToJson(AuthenticationCreds c) async {
  final noiseJson = await _keyPairToJson(c.noiseKey);
  final identJson = await _keyPairToJson(c.signedIdentityKey);
  final spkJson = await c.signedPreKey.toJson();

  return {
    'noiseKey': noiseJson,
    'signedIdentityKey': identJson,
    'signedPreKey': spkJson,
    'advSecretKey': base64Encode(c.advSecretKey),
    'registrationId': c.registrationId,
    'me': c.me?.toJson(),
    'platform': c.platform,
    'account': c.account,
    'signalIdentities': c.signalIdentities,
    'lastAccountSyncTimestamp': c.lastAccountSyncTimestamp,
    'myAppStateKeyId': c.myAppStateKeyId,
  };
}

Future<AuthenticationCreds> _credsFromJson(Map<String, dynamic> j) async {
  final noiseKey = await _keyPairFromJson(j['noiseKey'] as Map<String, dynamic>);
  final identKey =
      await _keyPairFromJson(j['signedIdentityKey'] as Map<String, dynamic>);
  final spk = await SignedPreKeyRecord.fromJson(
      j['signedPreKey'] as Map<String, dynamic>);

  return AuthenticationCreds(
    noiseKey: noiseKey,
    signedIdentityKey: identKey,
    signedPreKey: spk,
    advSecretKey: base64Decode(j['advSecretKey'] as String),
    registrationId: j['registrationId'] as int,
    me: j['me'] != null
        ? WAMe.fromJson(j['me'] as Map<String, dynamic>)
        : null,
    platform: j['platform'] as String? ?? 'smba',
    account: j['account'] as Map<String, dynamic>?,
    signalIdentities: j['signalIdentities'] as String?,
    lastAccountSyncTimestamp: j['lastAccountSyncTimestamp'] as int?,
    myAppStateKeyId: j['myAppStateKeyId'] as int?,
  );
}
