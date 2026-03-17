import 'dart:typed_data';

import '../binary/generic_utils.dart';
import '../binary/types.dart';
import '../noise/noise_crypto.dart'
    show hmacSha256, curve25519Sign, curve25519Verify;
import '../proto/wa_proto.pb.dart'
    show
        ADVSignedDeviceIdentityHMAC,
        ADVSignedDeviceIdentity,
        ADVDeviceIdentity,
        ADVEncryptionType;
import 'auth_state.dart';

/// Result of configuring a successful pairing, ported from Baileys'
/// configureSuccessfulPairing.
class ConfigurePairSuccessResult {
  final BinaryNode replyNode;

  /// Partial auth update to apply to [AuthenticationCreds].
  final String jid;
  final String? lid;
  final String? bizName;
  final String? platform;
  final ADVSignedDeviceIdentity? account;
  final SignalIdentity? signalIdentity;

  ConfigurePairSuccessResult({
    required this.replyNode,
    required this.jid,
    required this.lid,
    required this.bizName,
    required this.platform,
    required this.account,
    required this.signalIdentity,
  });
}

// Prefix constants — ported from Baileys Defaults.
const List<int> _waAdvDeviceSigPrefix = [6, 1];
const List<int> _waAdvAccountSigPrefix = [6, 0];
const List<int> _waAdvHostedAccountSigPrefix = [6, 5];

Future<ConfigurePairSuccessResult> configureSuccessfulPairingDart(
  BinaryNode stanza,
  AuthenticationCreds creds, {
  String? msgIdOverride,
}
) async {
  final msgId = msgIdOverride ?? stanza.attrs['id']?.toString() ?? '';

  final pairSuccessNode = stanza.tag == 'pair-success'
      ? stanza
      : getBinaryNodeChild(stanza, 'pair-success');
  if (pairSuccessNode == null) {
    throw StateError('pair-success node not found in stanza');
  }

  final deviceIdentityNode =
      getBinaryNodeChild(pairSuccessNode, 'device-identity');
  final platformNode = getBinaryNodeChild(pairSuccessNode, 'platform');
  final deviceNode = getBinaryNodeChild(pairSuccessNode, 'device');
  final bizNode = getBinaryNodeChild(pairSuccessNode, 'biz');

  if (deviceIdentityNode?.contentBytes == null || deviceNode == null) {
    throw StateError(
        'Missing device-identity or device in pair-success node');
  }

  final bizName = bizNode?.attrs['name']?.toString();
  final jid = deviceNode.attrs['jid']?.toString() ?? '';
  final lid = deviceNode.attrs['lid']?.toString();

  final deviceIdentityBytes = Uint8List.fromList(
      deviceIdentityNode!.contentBytes as List<int>);

  // 1. Decode HMAC wrapper and verify (with hosted/non-hosted prefixes).
  final hmacWrapper =
      ADVSignedDeviceIdentityHMAC.fromBuffer(deviceIdentityBytes);
  final details = Uint8List.fromList(hmacWrapper.details);

  // accountType is optional; hosted accounts use a different prefix.
  Uint8List hmacPrefix = Uint8List(0);
  if (hmacWrapper.accountType == ADVEncryptionType.HOSTED) {
    hmacPrefix = Uint8List.fromList(_waAdvHostedAccountSigPrefix);
  }

  final expectedHmac =
      await hmacSha256(Uint8List.fromList([...hmacPrefix, ...details]),
          creds.advSecretKey);
  final receivedHmac = Uint8List.fromList(hmacWrapper.hmac);
  if (!_bytesEqual(expectedHmac, receivedHmac)) {
    throw StateError('Invalid account signature (ADV HMAC verification failed)');
  }

  // 2. Decode signed identity and device identity.
  final account = ADVSignedDeviceIdentity.fromBuffer(details);
  final deviceDetails = Uint8List.fromList(account.details);
  final deviceIdentity = ADVDeviceIdentity.fromBuffer(deviceDetails);

  // 3. Verify account signature.
  final identPub = await creds.signedIdentityKey.extractPublicKey();
  final accountSignatureKey =
      Uint8List.fromList(account.accountSignatureKey);
  final accountSignature =
      Uint8List.fromList(account.accountSignature);
  if (accountSignatureKey.isEmpty || accountSignature.isEmpty) {
    throw StateError('Missing account signature key/signature');
  }

  final accountSigPrefix =
      deviceIdentity.deviceType == ADVEncryptionType.HOSTED
          ? _waAdvHostedAccountSigPrefix
          : _waAdvAccountSigPrefix;
  final accountMsg = Uint8List.fromList([
    ...accountSigPrefix,
    ...deviceDetails,
    ...identPub.bytes,
  ]);
  final accountOk = await curve25519Verify(
    accountSignatureKey,
    accountMsg,
    accountSignature,
  );
  if (!accountOk) {
    throw StateError('Failed to verify account signature');
  }

  // 4. Compute device signature:
  //    [WA_ADV_DEVICE_SIG_PREFIX] + deviceDetails + identityPub + accountSignatureKey
  final identPrivBytes =
      await creds.signedIdentityKey.extractPrivateKeyBytes();
  final deviceMsg = Uint8List.fromList([
    ..._waAdvDeviceSigPrefix,
    ...deviceDetails,
    ...identPub.bytes,
    ...accountSignatureKey,
  ]);

  // Use Curve25519 signature for device signature (Signal-compatible).
  final deviceSig = await curve25519Sign(
    Uint8List.fromList(identPrivBytes),
    deviceMsg,
  );

  // 5. Create account with device signature (keep signature key for creds).
  final accountForCreds = ADVSignedDeviceIdentity(
    details: account.details,
    accountSignatureKey: account.accountSignatureKey,
    accountSignature: account.accountSignature,
    deviceSignature: deviceSig,
  );

  // Re-encode account WITHOUT accountSignatureKey for reply.
  final accountForEncode = ADVSignedDeviceIdentity(
    details: account.details,
    accountSignature: account.accountSignature,
    deviceSignature: deviceSig,
  );
  final accountEnc = accountForEncode.writeToBuffer();

  final signalIdentity = (lid != null && lid.isNotEmpty)
      ? createSignalIdentity(lid, accountSignatureKey)
      : null;

  // 6. Build reply IQ node.
  final replyNode = BinaryNode(
    tag: 'iq',
    attrs: {
      'to': '@s.whatsapp.net',
      'type': 'result',
      'id': msgId,
    },
    content: [
      BinaryNode(
        tag: 'pair-device-sign',
        attrs: const {},
        content: [
          BinaryNode(
            tag: 'device-identity',
            attrs: {'key-index': deviceIdentity.keyIndex.toString()},
            content: accountEnc,
          ),
        ],
      ),
    ],
  );

  final platform = platformNode?.attrs['name']?.toString();

  return ConfigurePairSuccessResult(
    replyNode: replyNode,
    jid: jid,
    lid: lid,
    bizName: bizName,
    platform: platform,
    account: accountForCreds,
    signalIdentity: signalIdentity,
  );
}

bool _bytesEqual(Uint8List a, Uint8List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
