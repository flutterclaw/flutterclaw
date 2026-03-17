import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pointycastle/export.dart' as pc;

import '../noise/noise_crypto.dart';
import '../types.dart';
import 'media_types.dart';

/// Download and decrypt media from the WhatsApp CDN.
///
/// [message]   — the [WAMessage] containing media info.
/// Returns the decrypted raw media bytes.
Future<Uint8List> downloadMedia(WAMessage message) async {
  final media = message.media;
  if (media == null) throw ArgumentError('Message has no media');
  if (media.mediaKey == null) throw ArgumentError('Message has no mediaKey');

  final url = media.url ?? media.directPath;
  if (url == null || url.isEmpty) throw ArgumentError('Message has no URL');

  // HTTP GET from CDN.
  final response = await http.get(
    Uri.parse(url),
    headers: {'Origin': 'https://web.whatsapp.com'},
  );
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw StateError('Media download failed: HTTP ${response.statusCode}');
  }

  final blob = response.bodyBytes;
  final mediaType = mediaTypeFromMime(media.mimetype ?? 'application/octet-stream');

  return _decryptMedia(
    blob: Uint8List.fromList(blob),
    mediaKey: media.mediaKey!,
    mediaType: mediaType,
  );
}

// ---------------------------------------------------------------------------
// Decryption
// ---------------------------------------------------------------------------

Future<Uint8List> _decryptMedia({
  required Uint8List blob,
  required Uint8List mediaKey,
  required String mediaType,
}) async {
  // Derive keys.
  final info = mediaKeyInfo[mediaType] ?? 'WhatsApp Document Keys';
  final expanded = await _expandMediaKey(mediaKey, info);
  final iv = expanded.sublist(0, 16);
  final aesKey = expanded.sublist(16, 48);
  final macKey = expanded.sublist(48, 80);

  // Verify MAC (last 10 bytes of blob).
  if (blob.length < 10) throw StateError('Media blob too short');
  final encrypted = blob.sublist(0, blob.length - 10);
  final receivedMac = blob.sublist(blob.length - 10);

  final macInput = Uint8List(16 + encrypted.length);
  macInput.setAll(0, iv);
  macInput.setAll(16, encrypted);
  final expectedMac = (await hmacSha256(macInput, macKey)).sublist(0, 10);

  for (var i = 0; i < 10; i++) {
    if (receivedMac[i] != expectedMac[i]) {
      throw StateError('Media MAC verification failed');
    }
  }

  // Decrypt AES-256-CBC.
  return _aesCbcDecrypt(encrypted, aesKey, iv);
}

Uint8List _aesCbcDecrypt(Uint8List ciphertext, Uint8List key, Uint8List iv) {
  final cipher = pc.CBCBlockCipher(pc.AESEngine())
    ..init(
      false, // decrypt
      pc.ParametersWithIV(pc.KeyParameter(key), iv),
    );

  final blockSize = cipher.blockSize;
  if (ciphertext.length % blockSize != 0) {
    throw StateError('Ciphertext length not a multiple of block size');
  }

  final output = Uint8List(ciphertext.length);
  for (var offset = 0; offset < ciphertext.length; offset += blockSize) {
    cipher.processBlock(ciphertext, offset, output, offset);
  }

  // Remove PKCS7 padding.
  final padLen = output.last;
  if (padLen == 0 || padLen > blockSize) {
    throw StateError('Invalid PKCS7 padding');
  }
  return output.sublist(0, output.length - padLen);
}

Future<Uint8List> _expandMediaKey(Uint8List mediaKey, String info) async {
  return hkdfExpand(
    mediaKey,
    80,
    salt: Uint8List(32),
    info: Uint8List.fromList(info.codeUnits),
  );
}
