import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../noise/noise_crypto.dart'
    show generateX25519KeyPair, generateRandomBytes, curve25519Sign;
import '../proto/wa_proto.pb.dart' show ADVSignedDeviceIdentity;
import '../signal/signal_store.dart';
import '../binary/jid_utils.dart';

// ---------------------------------------------------------------------------
// Credential types
// ---------------------------------------------------------------------------

/// WhatsApp identity (JID + LID).
class WAMe {
  final String id;
  final String name;
  final String? lid;

  const WAMe({required this.id, required this.name, this.lid});

  factory WAMe.fromJson(Map<String, dynamic> j) => WAMe(
    id: j['id'] as String,
    name: j['name'] as String? ?? '',
    lid: j['lid'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'lid': lid};
}

/// Signal Protocol address (jid + device id).
class ProtocolAddress {
  final String name;
  final int deviceId;

  const ProtocolAddress({required this.name, required this.deviceId});

  factory ProtocolAddress.fromJson(Map<String, dynamic> j) => ProtocolAddress(
    name: j['name'] as String,
    deviceId: j['deviceId'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {'name': name, 'deviceId': deviceId};
}

/// Signal identity entry.
class SignalIdentity {
  final ProtocolAddress identifier;
  final Uint8List identifierKey;

  const SignalIdentity({required this.identifier, required this.identifierKey});

  factory SignalIdentity.fromJson(Map<String, dynamic> j) => SignalIdentity(
    identifier: ProtocolAddress.fromJson(
      j['identifier'] as Map<String, dynamic>,
    ),
    identifierKey: base64Decode(j['identifierKey'] as String? ?? ''),
  );

  Map<String, dynamic> toJson() => {
    'identifier': identifier.toJson(),
    'identifierKey': base64Encode(identifierKey),
  };
}

/// Prefix version byte to public keys for Signal compatibility.
Uint8List generateSignalPubKey(Uint8List pubKey) {
  if (pubKey.length == 33) return pubKey;
  return Uint8List.fromList([0x05, ...pubKey]);
}

/// Create a Signal identity entry (mirrors Baileys createSignalIdentity).
SignalIdentity createSignalIdentity(String wid, Uint8List accountSignatureKey) {
  return SignalIdentity(
    identifier: ProtocolAddress(name: wid, deviceId: 0),
    identifierKey: generateSignalPubKey(accountSignatureKey),
  );
}

/// All persisted credentials for a WhatsApp session.
/// Matches the shape written by Baileys' useMultiFileAuthState.
class AuthenticationCreds {
  /// Long-term Noise keypair (X25519).
  SimpleKeyPair noiseKey;

  /// Pairing ephemeral keypair (X25519).
  SimpleKeyPair pairingEphemeralKeyPair;

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
  ADVSignedDeviceIdentity? account;
  List<SignalIdentity>? signalIdentities;
  int? lastAccountSyncTimestamp;
  String? myAppStateKeyId;

  // Baileys-aligned state fields.
  List<dynamic> processedHistoryMessages;
  int nextPreKeyId;
  int firstUnuploadedPreKeyId;
  int accountSyncCounter;
  Map<String, dynamic> accountSettings;
  bool registered;
  String? pairingCode;
  String? lastPropHash;
  Uint8List? routingInfo;
  Object? additionalData;
  Map<String, String> lidToPn;
  Map<String, String> pnToLid;

  AuthenticationCreds({
    required this.noiseKey,
    required this.pairingEphemeralKeyPair,
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
    List<dynamic>? processedHistoryMessages,
    this.nextPreKeyId = 1,
    this.firstUnuploadedPreKeyId = 1,
    this.accountSyncCounter = 0,
    Map<String, dynamic>? accountSettings,
    this.registered = false,
    this.pairingCode,
    this.lastPropHash,
    this.routingInfo,
    this.additionalData,
    Map<String, String>? lidToPn,
    Map<String, String>? pnToLid,
  }) : processedHistoryMessages = processedHistoryMessages ?? <dynamic>[],
       accountSettings = accountSettings ?? {'unarchiveChats': false},
       lidToPn = lidToPn ?? <String, String>{},
       pnToLid = pnToLid ?? <String, String>{};

  /// Create brand-new credentials (first run).
  static Future<AuthenticationCreds> generate() async {
    final noiseKey = await generateX25519KeyPair();
    final pairingEphemeralKeyPair = await generateX25519KeyPair();
    final identityKey = await generateX25519KeyPair();
    final advSecret = generateRandomBytes(32);
    final regId = _generateRegistrationId();

    // Generate signed pre-key #1.
    final spk = await _generateSignedPreKey(identityKey, 1);

    return AuthenticationCreds(
      noiseKey: noiseKey,
      pairingEphemeralKeyPair: pairingEphemeralKeyPair,
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
  return {'private': base64Encode(priv), 'public': base64Encode(pub.bytes)};
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
      timestamp:
          j['timestamp'] as int? ??
          DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
  }
}

Future<SignedPreKeyRecord> _generateSignedPreKey(
  SimpleKeyPair identityKey,
  int id,
) async {
  final spkPair = await generateX25519KeyPair();
  final pub = await spkPair.extractPublicKey();
  // Sign the public key with our identity key (Ed25519 semantics via X25519 sign).
  // WhatsApp uses Curve25519 signing here (same as Signal Protocol).
  final privBytes = await identityKey.extractPrivateKeyBytes();
  final pubBytes = Uint8List.fromList(pub.bytes);
  final sig = await curve25519Sign(
    Uint8List.fromList(privBytes),
    generateSignalPubKey(pubBytes),
  );

  return SignedPreKeyRecord(
    id: id,
    keyPair: spkPair,
    signature: sig,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

int _generateRegistrationId() {
  // 14-bit random integer (Baileys / Signal Protocol).
  final bytes = generateRandomBytes(2);
  return ((bytes[0] << 8) | bytes[1]) & 0x3fff;
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

  static String credsFilePath(String directory) => '$directory/creds.json';

  static Future<bool> hasLinkedSession(String directory) async {
    final credsFile = File(credsFilePath(directory));
    if (!await credsFile.exists()) return false;
    try {
      final raw = await credsFile.readAsString();
      final j = jsonDecode(raw) as Map<String, dynamic>;
      final me = j['me'] as Map<String, dynamic>?;
      final id = me?['id']?.toString() ?? '';
      return id.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void storeLidPnMapping({String? lid, String? pn}) {
    final lidKey = _canonicalUserJid(lid);
    final pnKey = _canonicalUserJid(pn);
    if (lidKey == null || pnKey == null) return;
    if (!isLidUser(lidKey) || !isPnUser(pnKey)) return;
    creds.lidToPn[lidKey] = pnKey;
    creds.pnToLid[pnKey] = lidKey;
  }

  String? getPnForLid(String? lid) => creds.lidToPn[_canonicalUserJid(lid)];

  String? getLidForPn(String? pn) => creds.pnToLid[_canonicalUserJid(pn)];

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

    final keys = FileBasedSignalStore(directory: directory)
      ..init(
        identityKey: creds.signedIdentityKey,
        registrationId: creds.registrationId,
      );
    await keys.storePreKey(
      _signedPreKeyStoreId(creds.signedPreKey.id),
      PreKeyRecord(
        id: creds.signedPreKey.id,
        keyPair: creds.signedPreKey.keyPair,
      ),
    );

    return WAAuthState(
      creds: creds,
      keys: keys,
      saveCreds: () => _saveCreds(credsFile, creds),
    );
  }

  static Future<void> _saveCreds(File file, AuthenticationCreds creds) async {
    final j = await _credsToJson(creds);
    await file.writeAsString(jsonEncode(j));
  }
}

int _signedPreKeyStoreId(int id) => 0x80000000 | id;

// ---------------------------------------------------------------------------
// Creds JSON serialization
// ---------------------------------------------------------------------------

Future<Map<String, dynamic>> _credsToJson(AuthenticationCreds c) async {
  final noiseJson = await _keyPairToJson(c.noiseKey);
  final pairingJson = await _keyPairToJson(c.pairingEphemeralKeyPair);
  final identJson = await _keyPairToJson(c.signedIdentityKey);
  final spkJson = await c.signedPreKey.toJson();
  final accountEnc = c.account == null
      ? null
      : base64Encode(c.account!.writeToBuffer());

  return {
    'noiseKey': noiseJson,
    'pairingEphemeralKeyPair': pairingJson,
    'signedIdentityKey': identJson,
    'signedPreKey': spkJson,
    'advSecretKey': base64Encode(c.advSecretKey),
    'registrationId': c.registrationId,
    'me': c.me?.toJson(),
    'platform': c.platform,
    'account': accountEnc,
    'signalIdentities': c.signalIdentities?.map((s) => s.toJson()).toList(),
    'lastAccountSyncTimestamp': c.lastAccountSyncTimestamp,
    'myAppStateKeyId': c.myAppStateKeyId,
    'processedHistoryMessages': c.processedHistoryMessages,
    'nextPreKeyId': c.nextPreKeyId,
    'firstUnuploadedPreKeyId': c.firstUnuploadedPreKeyId,
    'accountSyncCounter': c.accountSyncCounter,
    'accountSettings': c.accountSettings,
    'registered': c.registered,
    'pairingCode': c.pairingCode,
    'lastPropHash': c.lastPropHash,
    'routingInfo': c.routingInfo == null ? null : base64Encode(c.routingInfo!),
    'additionalData': c.additionalData,
    'lidToPn': c.lidToPn,
    'pnToLid': c.pnToLid,
  };
}

Future<AuthenticationCreds> _credsFromJson(Map<String, dynamic> j) async {
  Uint8List? decodeBytes(dynamic value) {
    if (value is String && value.isNotEmpty) {
      return base64Decode(value);
    }
    if (value is List) {
      final ints = value.whereType<int>().toList();
      return Uint8List.fromList(ints);
    }
    return null;
  }

  final noiseKey = await _keyPairFromJson(
    j['noiseKey'] as Map<String, dynamic>,
  );
  final pairingJson = j['pairingEphemeralKeyPair'];
  final pairingKey = pairingJson is Map<String, dynamic>
      ? await _keyPairFromJson(pairingJson)
      : await generateX25519KeyPair();
  final identKey = await _keyPairFromJson(
    j['signedIdentityKey'] as Map<String, dynamic>,
  );
  final spk = await SignedPreKeyRecord.fromJson(
    j['signedPreKey'] as Map<String, dynamic>,
  );

  ADVSignedDeviceIdentity? account;
  final accountRaw = j['account'];
  if (accountRaw is String && accountRaw.isNotEmpty) {
    account = ADVSignedDeviceIdentity.fromBuffer(base64Decode(accountRaw));
  } else if (accountRaw is Map<String, dynamic>) {
    final details = decodeBytes(accountRaw['details']);
    final accountSigKey = decodeBytes(accountRaw['accountSignatureKey']);
    final accountSig = decodeBytes(accountRaw['accountSignature']);
    final deviceSig = decodeBytes(accountRaw['deviceSignature']);
    if (details != null) {
      account = ADVSignedDeviceIdentity(
        details: details,
        accountSignatureKey: accountSigKey,
        accountSignature: accountSig,
        deviceSignature: deviceSig,
      );
    }
  }

  List<SignalIdentity>? signalIdentities;
  final rawSignal = j['signalIdentities'];
  if (rawSignal is List) {
    signalIdentities = rawSignal
        .whereType<Map<String, dynamic>>()
        .map(SignalIdentity.fromJson)
        .toList();
  }

  final me = j['me'] != null
      ? WAMe.fromJson(j['me'] as Map<String, dynamic>)
      : null;
  var regId = int.tryParse(j['registrationId']?.toString() ?? '') ?? 0;
  if (regId <= 0 || (me == null && regId > 0x3fff)) {
    regId = _generateRegistrationId();
  }

  return AuthenticationCreds(
    noiseKey: noiseKey,
    pairingEphemeralKeyPair: pairingKey,
    signedIdentityKey: identKey,
    signedPreKey: spk,
    advSecretKey: decodeBytes(j['advSecretKey']) ?? generateRandomBytes(32),
    registrationId: regId,
    me: me,
    platform: j['platform'] as String? ?? 'smba',
    account: account,
    signalIdentities: signalIdentities,
    lastAccountSyncTimestamp: j['lastAccountSyncTimestamp'] as int?,
    myAppStateKeyId: j['myAppStateKeyId']?.toString(),
    processedHistoryMessages:
        (j['processedHistoryMessages'] as List?) ?? <dynamic>[],
    nextPreKeyId: j['nextPreKeyId'] as int? ?? 1,
    firstUnuploadedPreKeyId: j['firstUnuploadedPreKeyId'] as int? ?? 1,
    accountSyncCounter: j['accountSyncCounter'] as int? ?? 0,
    accountSettings:
        (j['accountSettings'] as Map<String, dynamic>?) ??
        {'unarchiveChats': false},
    registered: j['registered'] as bool? ?? false,
    pairingCode: j['pairingCode'] as String?,
    lastPropHash: j['lastPropHash'] as String?,
    routingInfo: decodeBytes(j['routingInfo']),
    additionalData: j['additionalData'],
    lidToPn:
        (j['lidToPn'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(k, v.toString()),
        ) ??
        <String, String>{},
    pnToLid:
        (j['pnToLid'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(k, v.toString()),
        ) ??
        <String, String>{},
  );
}

String? _canonicalUserJid(String? jid) {
  if (jid == null || jid.isEmpty) return null;
  final decoded = jidDecode(jid);
  if (decoded == null) return jid;
  if (isJidGroup(jid) || isJidBroadcast(jid) || isJidNewsletter(jid)) {
    return jid;
  }
  return jidEncode(decoded.user, decoded.server);
}
