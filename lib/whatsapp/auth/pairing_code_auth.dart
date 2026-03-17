import 'dart:typed_data';

import '../binary/generic_utils.dart';
import '../binary/jid_utils.dart';
import '../binary/types.dart';
import '../noise/noise_crypto.dart';
import '../socket/wa_socket.dart';
import 'auth_state.dart';

/// Crockford Base32 alphabet (excludes I, L, O, U to avoid visual confusion).
const _crockfordAlphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';

/// Request a phone-number pairing code from WhatsApp.
///
/// The user enters this code in WhatsApp on their phone under
/// Settings → Linked Devices → Link a Device → Link with phone number.
///
/// Returns the 8-character Crockford-encoded pairing code.
Future<String> requestPairingCode({
  required WASocket socket,
  required WAAuthState authState,
  required String phoneNumber,
}) async {
  final normalised = _normalisePhone(phoneNumber);

  // Build the registration payload.
  final noisePub =
      await authState.creds.noiseKey.extractPublicKey();
  final identPub =
      await authState.creds.signedIdentityKey.extractPublicKey();

  // Send IQ to request pairing code.
  final iqId = 'pair-${DateTime.now().millisecondsSinceEpoch}';
  final iq = BinaryNode(
    tag: 'iq',
    attrs: {
      'to': '@s.whatsapp.net',
      'type': 'set',
      'id': iqId,
      'xmlns': 'md',
    },
    content: [
      BinaryNode(
        tag: 'link_code_companion_reg',
        attrs: {
          'jid': jidEncode(normalised, 's.whatsapp.net'),
          'stage': 'companion_hello',
          'should_show_push_notification': 'true',
        },
        content: [
          BinaryNode(
            tag: 'link_code_pairing_wrapped_companion_ephemeral_pub',
            attrs: {},
            content: Uint8List.fromList(noisePub.bytes),
          ),
          BinaryNode(
            tag: 'companion_server_auth_key_pub',
            attrs: {},
            content: Uint8List.fromList(identPub.bytes),
          ),
          BinaryNode(
            tag: 'companion_platform_id',
            attrs: {},
            content: _encodePlatformId('Chrome', '4.0.0'),
          ),
          BinaryNode(
            tag: 'link_code_pairing_nonce',
            attrs: {},
            content: generateRandomBytes(32),
          ),
        ],
      ),
    ],
  );

  final response = await socket.query(iq);

  // Extract code from response.
  final codeNode = getBinaryNodeChild(
      getBinaryNodeChild(response, 'link_code_companion_reg') ??
          BinaryNode(tag: '', attrs: {}),
      'link_code_pairing_ref');

  if (codeNode?.contentBytes != null) {
    return _encodeCrockford(codeNode!.contentBytes!);
  }

  // Fallback: look for the code in a result iq.
  final pairingRef = getBinaryNodeChildBuffer(response, 'link_code_pairing_ref');
  if (pairingRef != null) {
    return _encodeCrockford(pairingRef);
  }

  throw StateError('Pairing code not found in server response');
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

String _normalisePhone(String phone) =>
    phone.replaceAll(RegExp(r'[^\d]'), '');

/// Encode [bytes] as a Crockford Base32 string, inserting a dash every 4 chars.
String _encodeCrockford(Uint8List bytes) {
  var bits = 0;
  var count = 0;
  final result = StringBuffer();

  for (final byte in bytes) {
    bits = (bits << 8) | byte;
    count += 8;
    while (count >= 5) {
      count -= 5;
      result.write(_crockfordAlphabet[(bits >> count) & 0x1f]);
    }
  }
  if (count > 0) {
    result.write(_crockfordAlphabet[(bits << (5 - count)) & 0x1f]);
  }

  // Insert dash every 4 characters to produce XXXX-XXXX format.
  final s = result.toString();
  if (s.length >= 8) {
    return '${s.substring(0, 4)}-${s.substring(4, 8)}';
  }
  return s;
}

Uint8List _encodePlatformId(String browser, String version) {
  // Simple encoding: browser:version as UTF-8.
  final s = '$browser:$version';
  return Uint8List.fromList(s.codeUnits);
}
