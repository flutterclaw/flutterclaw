import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart';
import '../proto/wa_proto.pb.dart';

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

class SenderMessageKeyData {
  final int iteration;
  final Uint8List seed;

  const SenderMessageKeyData({required this.iteration, required this.seed});

  Map<String, dynamic> toJson() => {
    'iteration': iteration,
    'seed': base64Encode(seed),
  };

  factory SenderMessageKeyData.fromJson(Map<String, dynamic> j) =>
      SenderMessageKeyData(
        iteration: j['iteration'] as int,
        seed: base64Decode(j['seed'] as String),
      );
}

/// A sender key for group messaging (Signal-compatible sender key state).
class SenderKeyData {
  final int senderKeyId;
  final int iteration;
  final Uint8List chainKey;
  final Uint8List signingPublicKey;
  final Uint8List? signingPrivateKey;
  final List<SenderMessageKeyData> messageKeys;

  const SenderKeyData({
    required this.senderKeyId,
    required this.iteration,
    required this.chainKey,
    required this.signingPublicKey,
    this.signingPrivateKey,
    this.messageKeys = const [],
  });

  Map<String, dynamic> toJson() => {
    'senderKeyId': senderKeyId,
    'iteration': iteration,
    'chainKey': base64Encode(chainKey),
    'signingPublicKey': base64Encode(signingPublicKey),
    'signingPrivateKey': signingPrivateKey != null
        ? base64Encode(signingPrivateKey!)
        : null,
    'messageKeys': messageKeys.map((m) => m.toJson()).toList(),
  };

  factory SenderKeyData.fromJson(Map<String, dynamic> j) => SenderKeyData(
    senderKeyId: (j['senderKeyId'] as int?) ?? 0,
    iteration: (j['iteration'] as int?) ?? 0,
    chainKey: base64Decode(j['chainKey'] as String),
    signingPublicKey: base64Decode(j['signingPublicKey'] as String),
    signingPrivateKey: j['signingPrivateKey'] != null
        ? base64Decode(j['signingPrivateKey'] as String)
        : null,
    messageKeys:
        (j['messageKeys'] as List?)
            ?.map(
              (e) => SenderMessageKeyData.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        const [],
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

class AppStateSyncVersionRecord {
  final int version;
  final Uint8List hash;
  final Map<String, String> indexValueMap;

  const AppStateSyncVersionRecord({
    required this.version,
    required this.hash,
    required this.indexValueMap,
  });

  factory AppStateSyncVersionRecord.empty() => AppStateSyncVersionRecord(
    version: 0,
    hash: Uint8List(128),
    indexValueMap: const {},
  );

  AppStateSyncVersionRecord copyWith({
    int? version,
    Uint8List? hash,
    Map<String, String>? indexValueMap,
  }) => AppStateSyncVersionRecord(
    version: version ?? this.version,
    hash: hash ?? this.hash,
    indexValueMap: indexValueMap ?? this.indexValueMap,
  );

  Map<String, dynamic> toJson() => {
    'version': version,
    'hash': base64Encode(hash),
    'indexValueMap': indexValueMap,
  };

  factory AppStateSyncVersionRecord.fromJson(Map<String, dynamic> j) =>
      AppStateSyncVersionRecord(
        version: j['version'] as int? ?? 0,
        hash: j['hash'] != null
            ? base64Decode(j['hash'] as String)
            : Uint8List(128),
        indexValueMap:
            (j['indexValueMap'] as Map?)
                ?.map(
                  (key, value) => MapEntry(
                    key.toString(),
                    value.toString(),
                  ),
                ) ??
            const {},
      );
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
  Future<void> migrateSession(String fromAddress, String toAddress);

  // One-time pre-keys
  Future<PreKeyRecord?> loadPreKey(int id);
  Future<void> storePreKey(int id, PreKeyRecord preKey);
  Future<void> removePreKey(int id);

  // Sender keys (group)
  Future<SenderKeyData?> loadSenderKey(String groupId, String senderId);
  Future<void> storeSenderKey(
    String groupId,
    String senderId,
    SenderKeyData data,
  );

  // App state sync
  Future<Message_AppStateSyncKeyData?> loadAppStateSyncKey(String id);
  Future<void> storeAppStateSyncKey(String id, Message_AppStateSyncKeyData data);
  Future<AppStateSyncVersionRecord?> loadAppStateSyncVersion(String name);
  Future<void> storeAppStateSyncVersion(
    String name,
    AppStateSyncVersionRecord data,
  );
  Future<void> clearAppStateSyncVersion(String name);
  Future<T> transaction<T>(Future<T> Function() exec, String key);
}

// ---------------------------------------------------------------------------
// File-based implementation
// ---------------------------------------------------------------------------

/// Persists Signal Protocol keys as JSON files under [directory].
class FileBasedSignalStore implements SignalProtocolStore {
  final String directory;
  SimpleKeyPair? _identityKeyPair;
  int? _registrationId;
  final Map<String, Future<void>> _transactionQueues = {};

  FileBasedSignalStore({required this.directory});

  /// Inject the identity key pair and registration ID from auth creds.
  void init({required SimpleKeyPair identityKey, required int registrationId}) {
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
    final file = _identityFile(address);
    await file.writeAsString(jsonEncode({'key': base64Encode(identityKey)}));
  }

  @override
  Future<bool> isTrustedIdentity(String address, Uint8List identityKey) async {
    final stored = await loadIdentityKey(address);
    if (stored == null) return true; // Trust on first use.
    return _bytesEqual(stored, identityKey);
  }

  @override
  Future<Uint8List?> loadIdentityKey(String address) async {
    final file = _identityFile(address);
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return base64Decode(j['key'] as String);
  }

  // ── Sessions ─────────────────────────────────────────────────────────────

  @override
  Future<SessionRecord?> loadSession(String address) async {
    final file = _sessionFile(address);
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return SessionRecord.fromJson(j);
  }

  @override
  Future<void> storeSession(String address, SessionRecord session) async {
    final file = _sessionFile(address);
    await file.writeAsString(jsonEncode(session.toJson()));
  }

  @override
  Future<void> deleteSession(String address) async {
    final file = _sessionFile(address);
    if (await file.exists()) await file.delete();
  }

  @override
  Future<void> migrateSession(String fromAddress, String toAddress) async {
    if (fromAddress.isEmpty || toAddress.isEmpty || fromAddress == toAddress) {
      return;
    }

    final sourceSession = await loadSession(fromAddress);
    final targetSession = await loadSession(toAddress);
    if (sourceSession != null && targetSession == null) {
      await storeSession(toAddress, sourceSession);
    }

    final sourceIdentity = await loadIdentityKey(fromAddress);
    final targetIdentity = await loadIdentityKey(toAddress);
    if (sourceIdentity != null && targetIdentity == null) {
      await saveIdentity(toAddress, sourceIdentity);
    }
  }

  // ── One-time pre-keys ────────────────────────────────────────────────────

  @override
  Future<PreKeyRecord?> loadPreKey(int id) async {
    final file = _file('pre-key-$id');
    try {
      if (!await file.exists()) return null;
      final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      return PreKeyRecord.fromJson(j);
    } on FileSystemException {
      return null;
    }
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
  Future<SenderKeyData?> loadSenderKey(String groupId, String senderId) async {
    final file = _file('sender-${_sanitize(groupId)}-${_sanitize(senderId)}');
    if (!await file.exists()) return null;
    final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return SenderKeyData.fromJson(j);
  }

  @override
  Future<void> storeSenderKey(
    String groupId,
    String senderId,
    SenderKeyData data,
  ) async {
    final file = _file('sender-${_sanitize(groupId)}-${_sanitize(senderId)}');
    await file.writeAsString(jsonEncode(data.toJson()));
  }

  // ── App state sync ───────────────────────────────────────────────────────

  @override
  Future<Message_AppStateSyncKeyData?> loadAppStateSyncKey(String id) async {
    final file = _file('app-state-sync-key-${_sanitize(id)}');
    try {
      if (!await file.exists()) return null;
      final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final encoded = j['data']?.toString();
      if (encoded == null || encoded.isEmpty) return null;
      return Message_AppStateSyncKeyData.fromBuffer(base64Decode(encoded));
    } on FileSystemException {
      return null;
    }
  }

  @override
  Future<void> storeAppStateSyncKey(
    String id,
    Message_AppStateSyncKeyData data,
  ) async {
    final file = _file('app-state-sync-key-${_sanitize(id)}');
    await file.writeAsString(
      jsonEncode({'data': base64Encode(data.writeToBuffer())}),
    );
  }

  @override
  Future<AppStateSyncVersionRecord?> loadAppStateSyncVersion(
    String name,
  ) async {
    final file = _file('app-state-sync-version-${_sanitize(name)}');
    try {
      if (!await file.exists()) return null;
      final j = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      return AppStateSyncVersionRecord.fromJson(j);
    } on FileSystemException {
      return null;
    }
  }

  @override
  Future<void> storeAppStateSyncVersion(
    String name,
    AppStateSyncVersionRecord data,
  ) async {
    final file = _file('app-state-sync-version-${_sanitize(name)}');
    await file.writeAsString(jsonEncode(data.toJson()));
  }

  @override
  Future<void> clearAppStateSyncVersion(String name) async {
    final file = _file('app-state-sync-version-${_sanitize(name)}');
    if (await file.exists()) await file.delete();
  }

  @override
  Future<T> transaction<T>(Future<T> Function() exec, String key) {
    final previous = _transactionQueues[key] ?? Future.value();
    final completer = Completer<T>();
    late final Future<void> current;
    current = previous.catchError((_) {}).then((_) async {
      try {
        completer.complete(await exec());
      } catch (e, st) {
        completer.completeError(e, st);
      }
    }).whenComplete(() {
      if (identical(_transactionQueues[key], current)) {
        _transactionQueues.remove(key);
      }
    });
    _transactionQueues[key] = current;
    return completer.future;
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  File _file(String name) => File('$directory/$name.json');

  File _sessionFile(String address) => _file('session-${_sanitize(address)}');

  File _identityFile(String address) => _file('identity-${_sanitize(address)}');

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
Future<List<PreKeyRecord>> generatePreKeys(int startId, int count) async {
  final keys = <PreKeyRecord>[];
  for (var i = 0; i < count; i++) {
    final kp = await generateX25519KeyPair();
    keys.add(PreKeyRecord(id: startId + i, keyPair: kp));
  }
  return keys;
}
