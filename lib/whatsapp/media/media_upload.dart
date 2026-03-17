import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pointycastle/export.dart' as pc;

import '../noise/noise_crypto.dart';
import '../socket/wa_socket.dart';
import '../binary/generic_utils.dart';
import '../binary/types.dart';
import 'media_types.dart';

/// Result of a successful media upload.
class MediaUploadResult {
  final String url;
  final String directPath;
  final Uint8List mediaKey;
  final Uint8List fileEncSha256;
  final Uint8List fileSha256;
  final int fileLength;

  const MediaUploadResult({
    required this.url,
    required this.directPath,
    required this.mediaKey,
    required this.fileEncSha256,
    required this.fileSha256,
    required this.fileLength,
  });
}

/// Upload [mediaBytes] to the WhatsApp CDN.
///
/// 1. Generates a random media key.
/// 2. Derives AES-256-CBC + HMAC-SHA256 keys via HKDF.
/// 3. Encrypts the media.
/// 4. Queries the server for an upload URL via [socket].
/// 5. HTTP-POSTs the encrypted bytes.
Future<MediaUploadResult> uploadMedia({
  required WASocket socket,
  required Uint8List mediaBytes,
  required String mediaType,
}) async {
  // Generate media key (32 random bytes).
  final mediaKey = generateRandomBytes(32);

  // Derive keys: AES key (32) + IV (16) + MAC key (32) = 80 bytes.
  final info = mediaKeyInfo[mediaType] ?? 'WhatsApp Document Keys';
  final expanded = await _expandMediaKey(mediaKey, info);
  final iv = expanded.sublist(0, 16);
  final aesKey = expanded.sublist(16, 48);
  final macKey = expanded.sublist(48, 80);

  // Encrypt with AES-256-CBC.
  final encrypted = _aesCbcEncrypt(mediaBytes, aesKey, iv);

  // Compute MAC over (iv + ciphertext).
  final macInput = Uint8List(16 + encrypted.length);
  macInput.setAll(0, iv);
  macInput.setAll(16, encrypted);
  final mac = await hmacSha256(macInput, macKey);
  final macSlice = mac.sublist(0, 10); // WhatsApp uses first 10 bytes

  // Build final encrypted blob: encrypted + mac[0:10]
  final blob = Uint8List(encrypted.length + 10);
  blob.setAll(0, encrypted);
  blob.setAll(encrypted.length, macSlice);

  // Compute hashes.
  final fileSha256 = await sha256Hash(mediaBytes);
  final fileEncSha256 = await sha256Hash(blob);

  // Request upload URL from server.
  final uploadUrl = await _requestUploadUrl(
    socket: socket,
    mediaType: mediaType,
    fileEncSha256: fileEncSha256,
    fileLength: blob.length,
  );

  // HTTP POST to CDN.
  final response = await http.post(
    Uri.parse(uploadUrl),
    headers: {
      'Content-Type': 'application/octet-stream',
      'Origin': 'https://web.whatsapp.com',
    },
    body: blob,
  );

  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw StateError(
        'Media upload failed: HTTP ${response.statusCode}: ${response.body}');
  }

  // Parse response JSON for directPath.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final directPath = json['direct_path'] as String? ?? '';
  final url = 'https://mmg.whatsapp.net$directPath';

  return MediaUploadResult(
    url: url,
    directPath: directPath,
    mediaKey: mediaKey,
    fileEncSha256: fileEncSha256,
    fileSha256: fileSha256,
    fileLength: blob.length,
  );
}

// ---------------------------------------------------------------------------
// Request upload URL
// ---------------------------------------------------------------------------

Future<String> _requestUploadUrl({
  required WASocket socket,
  required String mediaType,
  required Uint8List fileEncSha256,
  required int fileLength,
}) async {
  final iq = BinaryNode(
    tag: 'iq',
    attrs: {
      'id': 'media-upload-${DateTime.now().millisecondsSinceEpoch}',
      'to': '@s.whatsapp.net',
      'type': 'set',
      'xmlns': 'w:m',
    },
    content: [
      BinaryNode(
        tag: 'media',
        attrs: {
          'type': mediaType,
          'hash': base64Encode(fileEncSha256),
          'size': fileLength.toString(),
        },
      ),
    ],
  );

  final response = await socket.query(iq);
  final mediaNode = getBinaryNodeChild(response, 'media');
  final uploadUrl = mediaNode?.attrs['url'];

  if (uploadUrl == null || uploadUrl.isEmpty) {
    throw StateError('Server returned no upload URL');
  }
  return uploadUrl;
}

// ---------------------------------------------------------------------------
// AES-256-CBC (pointycastle — sync)
// ---------------------------------------------------------------------------

Uint8List _aesCbcEncrypt(Uint8List plaintext, Uint8List key, Uint8List iv) {
  final cipher = pc.CBCBlockCipher(pc.AESEngine())
    ..init(
      true, // encrypt
      pc.ParametersWithIV(pc.KeyParameter(key), iv),
    );

  // PKCS7 padding.
  final blockSize = cipher.blockSize;
  final padLen = blockSize - (plaintext.length % blockSize);
  final padded = Uint8List(plaintext.length + padLen);
  padded.setAll(0, plaintext);
  padded.fillRange(plaintext.length, padded.length, padLen);

  final output = Uint8List(padded.length);
  for (var offset = 0; offset < padded.length; offset += blockSize) {
    cipher.processBlock(padded, offset, output, offset);
  }
  return output;
}

// ---------------------------------------------------------------------------
// HKDF key expansion for media keys
// ---------------------------------------------------------------------------

Future<Uint8List> _expandMediaKey(Uint8List mediaKey, String info) async {
  return hkdfExpand(
    mediaKey,
    80,
    salt: Uint8List(32),
    info: Uint8List.fromList(info.codeUnits),
  );
}
