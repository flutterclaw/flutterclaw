import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart';

// ---------------------------------------------------------------------------
// Key types stored by the Signal Protocol store
// ---------------------------------------------------------------------------

/// A one-time pre-key (id + X25519 key pair).
class PreKeyRecord {
  final int id;
  final SimpleKeyPair keyPair;

  const PreKeyRecord({required this.id, required this.keyPair});

  Future<Map<String, dynamic>> toJson() async {
    final priv = await keyPair.extractPrivateKeyBytes();
    final pub = await keyPair.extractPublicKey();
    return {
      'id': id,
      'private': base64Encode(priv),
      'public': base64Encode(pub.bytes),
    };
  }

  static Future<PreKeyRecord> fromJson(Map<String, dynamic> j) async {
    final privBytes = base64Decode(j['private'] as String);
    final kp = await X25519().newKeyPairFromSeed(privBytes);
    return PreKeyRecord(id: j['id'] as int, keyPair: kp);
  }
}

/// A sender key for group messaging (serialised chain key + signing key).
class SenderKeyData {
  final Uint8List chainKey;
  final Uint8List signingPublicKey;
  final int iteration;
  final int messageKeyIndex;

  const SenderKeyData({
    required this.chainKey,
    required this.signingPublicKey,
    required this.iteration,
    required this.messageKeyIndex,
  });

  Map<String, dynamic> toJson() => {
        'chainKey': base64Encode(chainKey),
        'signingPublicKey': base64Encode(signingPublicKey),
        'iteration': iteration,
        'messageKeyIndex': messageKeyIndex,
      };

  factory SenderKeyData.fromJson(Map<String, dynamic> j) => SenderKeyData(
        chainKey: base64Decode(j['chainKey'] as String),
        signingPublicKey: base64Decode(j['signingPublicKey'] as String),
        iteration: j['iteration'] as int,
        messageKeyIndex: j['messageKeyIndex'] as int,
      );
}

/// Serialised Double-Ratchet session.
class SessionRecord {
  final Uint8List serialized;

  const SessionRecord({required this.serialized});

  Map<String, dynamic> toJson() => {'data': base64Encode(serialized)};

  factory SessionRecord.fromJson(Map<String, dynamic> j) =>
      SessionRecord(serialized: base64Decode(j['data'] as String));
}

// ---------------------------------------------------------------------------
// Store interface
// ---------------------------------------------------------------------------

/// Abstract key store used by the Signal Protocol implementation.
abstract class SignalProtocolStore {
  // Identity
  Future<SimpleKeyPair> getIdentityKeyPair();
  Future<int> getLocalRegistrationId();

  // Trusted identities
  Future<void> saveIdentity(String address, Uint8List identityKey);
  Future<bool> isTrustedIdentity(String address, Uint8List identityKey);
  Future<Uint8List?> loadIdentityKey(String address);

  // Sessions
  Future<SessionRecord?> loadSession(String address);
  Future<void> storeSession(String address, SessionRecord session);
  Future<void> deleteSession(String address);

  // One-time pre-keys
  Future<PreKeyRecord?> loadPreKey(int id);
  Future<void> storePreKey(int id, PreKeyRecord preKey);
  Future<void> removePreKey(int id);

  // Sender keys (group)
  Future<SenderKeyData?> loadSenderKey(String groupId, String senderId);
  Future<void> storeSenderKey(
      String groupId, String senderId, SenderKeyData data);
}

// ---------------------------------------------------------------------------
// File-based implementation
// ---------------------------------------------------------------------------

/// Persists Signal Protocol keys as JSON files under [directory].
///
/// File naming:
///   identity-{address}.json    — trusted identities
///   session-{address}.json     — Double-Ratchet sessions
///   pre-key-{id}.json          — one-time pre-keys
///   sender-{groupId}-{sid}.json — sender keys
class FileBasedSignalStore implements SignalProtocolStore {
  final String directory;
  SimpleKeyPair? _identityKeyPair;
  int? _registrationId;

  FileBasedSignalStore({required this.directory});

  /// Inject the identity key pair and registration ID from auth creds.
  void init(
      {required SimpleKeyPair identityKey, required int registrationId}) {
    _identityKeyPair = identityKey;
    _registrationId = registrationId;
  }

  @override
  Future<SimpleKeyPair> getIdentityKeyPair() async {
    final kp = _identityKeyPair;
    if (kp == null) throw StateError('FileBasedSignalStore not initialised');
    return kp;
  }

  @override
  Future<int> getLocalRegistrationId() async {
    final id = _registrationId;
    if (id == null) throw StateError('FileBasedSignalStore not initialised');
    return id;
  }

  // ── Trusted identities ──────────────────────────────────────────────────

  @override
  Future<void> saveIdentity(String address, Uint8List identityKey) async {
    final file = _file('identity-$address');
    await file.writeAsString(
        jsonEncode({'key': base64Encode(identityKey)}));
  }

  @override
  Future<bool> isTrustedIdentity(
      String address, Uint8List identityKey) async {
    final stored = await loadIdentityKey(address);
    if (stored == null) return true; // Trust on first use.
    return _bytesEqual(stored, identityKey);
  }

  @override
  Future<Uint8List?> loadIdentityKey(String address) async {
    final file = _file('identity-$address');
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return base64Decode(j['key'] as String);
  }

  // ── Sessions ─────────────────────────────────────────────────────────────

  @override
  Future<SessionRecord?> loadSession(String address) async {
    final file = _file('session-${_sanitize(address)}');
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return SessionRecord.fromJson(j);
  }

  @override
  Future<void> storeSession(String address, SessionRecord session) async {
    final file = _file('session-${_sanitize(address)}');
    await file.writeAsString(jsonEncode(session.toJson()));
  }

  @override
  Future<void> deleteSession(String address) async {
    final file = _file('session-${_sanitize(address)}');
    if (await file.exists()) await file.delete();
  }

  // ── One-time pre-keys ────────────────────────────────────────────────────

  @override
  Future<PreKeyRecord?> loadPreKey(int id) async {
    final file = _file('pre-key-$id');
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return PreKeyRecord.fromJson(j);
  }

  @override
  Future<void> storePreKey(int id, PreKeyRecord preKey) async {
    final file = _file('pre-key-$id');
    await file.writeAsString(jsonEncode(await preKey.toJson()));
  }

  @override
  Future<void> removePreKey(int id) async {
    final file = _file('pre-key-$id');
    if (await file.exists()) await file.delete();
  }

  // ── Sender keys ──────────────────────────────────────────────────────────

  @override
  Future<SenderKeyData?> loadSenderKey(
      String groupId, String senderId) async {
    final file = _file('sender-${_sanitize(groupId)}-${_sanitize(senderId)}');
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return SenderKeyData.fromJson(j);
  }

  @override
  Future<void> storeSenderKey(
      String groupId, String senderId, SenderKeyData data) async {
    final file = _file('sender-${_sanitize(groupId)}-${_sanitize(senderId)}');
    await file.writeAsString(jsonEncode(data.toJson()));
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  File _file(String name) => File('$directory/$name.json');

  /// Replace characters unsafe in filenames.
  static String _sanitize(String s) =>
      s.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_');

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// Generate a batch of one-time pre-keys starting at [startId].
Future<List<PreKeyRecord>> generatePreKeys(
    int startId, int count) async {
  final keys = <PreKeyRecord>[];
  for (var i = 0; i < count; i++) {
    final kp = await generateX25519KeyPair();
    keys.add(PreKeyRecord(id: startId + i, keyPair: kp));
  }
  return keys;
}
