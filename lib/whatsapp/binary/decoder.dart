import 'dart:io';
import 'dart:typed_data';

import 'constants.dart';
import 'jid_utils.dart';
import 'types.dart';

/// Decode bytes into a [BinaryNode].
/// Port of Baileys WABinary/decode.ts.
Future<BinaryNode> decodeBinaryNode(Uint8List buff) async {
  final decompBuff = await _decompressIfRequired(buff);
  return _decodeNode(decompBuff, _IndexRef());
}

/// Synchronous decode of already-decompressed buffer.
BinaryNode _decodeNode(Uint8List buffer, _IndexRef indexRef) {
  void checkEOS(int length) {
    if (indexRef.index + length > buffer.length) {
      throw StateError('end of stream');
    }
  }

  int next() {
    final value = buffer[indexRef.index];
    indexRef.index += 1;
    return value;
  }

  int readByte() {
    checkEOS(1);
    return next();
  }

  Uint8List readBytes(int n) {
    checkEOS(n);
    final value = buffer.sublist(indexRef.index, indexRef.index + n);
    indexRef.index += n;
    return value;
  }

  String readStringFromChars(int length) {
    final bytes = readBytes(length);
    return String.fromCharCodes(bytes);
  }

  int readInt(int n, {bool littleEndian = false}) {
    checkEOS(n);
    var val = 0;
    for (var i = 0; i < n; i++) {
      final shift = littleEndian ? i : n - 1 - i;
      val |= next() << (shift * 8);
    }
    return val;
  }

  int readInt20() {
    checkEOS(3);
    return ((next() & 15) << 16) + (next() << 8) + next();
  }

  int unpackHex(int value) {
    if (value >= 0 && value < 16) {
      return value < 10 ? 0x30 + value : 0x41 + value - 10;
    }
    throw ArgumentError('invalid hex: $value');
  }

  int unpackNibble(int value) {
    if (value >= 0 && value <= 9) return 0x30 + value; // '0' + value
    switch (value) {
      case 10:
        return 0x2D; // '-'
      case 11:
        return 0x2E; // '.'
      case 15:
        return 0x00; // '\0'
      default:
        throw ArgumentError('invalid nibble: $value');
    }
  }

  int unpackByte(int tag, int value) {
    if (tag == Tags.nibble8) return unpackNibble(value);
    if (tag == Tags.hex8) return unpackHex(value);
    throw ArgumentError('unknown tag: $tag');
  }

  String readPacked8(int tag) {
    final startByte = readByte();
    final buf = StringBuffer();
    for (var i = 0; i < (startByte & 127); i++) {
      final curByte = readByte();
      buf.writeCharCode(unpackByte(tag, (curByte & 0xf0) >> 4));
      buf.writeCharCode(unpackByte(tag, curByte & 0x0f));
    }
    var value = buf.toString();
    if (startByte >> 7 != 0) {
      value = value.substring(0, value.length - 1);
    }
    return value;
  }

  bool isListTag(int tag) =>
      tag == Tags.listEmpty || tag == Tags.list8 || tag == Tags.list16;

  int readListSize(int tag) {
    switch (tag) {
      case Tags.listEmpty:
        return 0;
      case Tags.list8:
        return readByte();
      case Tags.list16:
        return readInt(2);
      default:
        throw ArgumentError('invalid tag for list size: $tag');
    }
  }

  String getTokenDouble(int index1, int index2) {
    if (index1 >= doubleByteTokens.length) {
      throw ArgumentError('Invalid double token dict ($index1)');
    }
    final dict = doubleByteTokens[index1];
    if (index2 >= dict.length) {
      throw ArgumentError('Invalid double token ($index2)');
    }
    return dict[index2];
  }

  late String Function(int tag) readString;
  readString = (int tag) {
    if (tag >= 1 && tag < singleByteTokens.length) {
      return singleByteTokens[tag];
    }

    switch (tag) {
      case Tags.dictionary0:
      case Tags.dictionary1:
      case Tags.dictionary2:
      case Tags.dictionary3:
        return getTokenDouble(tag - Tags.dictionary0, readByte());
      case Tags.listEmpty:
        return '';
      case Tags.binary8:
        return readStringFromChars(readByte());
      case Tags.binary20:
        return readStringFromChars(readInt20());
      case Tags.binary32:
        return readStringFromChars(readInt(4));
      case Tags.jidPair:
        final i = readString(readByte());
        final j = readString(readByte());
        if (j.isNotEmpty) return '${i.isEmpty ? '' : i}@$j';
        throw StateError('invalid jid pair: $i, $j');
      case Tags.fbJid:
        final user = readString(readByte());
        final device = readInt(2);
        final server = readString(readByte());
        return '$user:$device@$server';
      case Tags.interopJid:
        final user = readString(readByte());
        final device = readInt(2);
        final integrator = readInt(2);
        var server = 'interop';
        final beforeServer = indexRef.index;
        try {
          server = readString(readByte());
        } catch (_) {
          indexRef.index = beforeServer;
        }
        return '$integrator-$user:$device@$server';
      case Tags.adJid:
        final rawDomainType = readByte();
        final device = readByte();
        final user = readString(readByte());
        var server = 's.whatsapp.net';
        if (rawDomainType == WAJIDDomains.lid.value) {
          server = 'lid';
        } else if (rawDomainType == WAJIDDomains.hosted.value) {
          server = 'hosted';
        } else if (rawDomainType == WAJIDDomains.hostedLid.value) {
          server = 'hosted.lid';
        }
        return jidEncode(user, server, device);
      case Tags.hex8:
      case Tags.nibble8:
        return readPacked8(tag);
      default:
        throw ArgumentError('invalid string with tag: $tag');
    }
  };

  List<BinaryNode> readList(int tag) {
    final items = <BinaryNode>[];
    final size = readListSize(tag);
    for (var i = 0; i < size; i++) {
      items.add(_decodeNode(buffer, indexRef));
    }
    return items;
  }

  // --- Main decoding logic ---

  final listSize = readListSize(readByte());
  final header = readString(readByte());
  if (listSize == 0 || header.isEmpty) {
    throw StateError('invalid node');
  }

  final attrs = <String, String>{};
  Object? data;

  final attributesLength = (listSize - 1) >> 1;
  for (var i = 0; i < attributesLength; i++) {
    final key = readString(readByte());
    final value = readString(readByte());
    attrs[key] = value;
  }

  if (listSize % 2 == 0) {
    final tag = readByte();
    if (isListTag(tag)) {
      data = readList(tag);
    } else {
      switch (tag) {
        case Tags.binary8:
          data = readBytes(readByte());
          break;
        case Tags.binary20:
          data = readBytes(readInt20());
          break;
        case Tags.binary32:
          data = readBytes(readInt(4));
          break;
        default:
          data = readString(tag);
          break;
      }
    }
  }

  return BinaryNode(tag: header, attrs: attrs, content: data);
}

Future<Uint8List> _decompressIfRequired(Uint8List buffer) async {
  if (buffer.isEmpty) return buffer;
  if (2 & buffer[0] != 0) {
    // Compressed with zlib
    final compressed = buffer.sublist(1);
    final decoded = zlib.decode(compressed);
    return Uint8List.fromList(decoded);
  } else {
    // No compression, skip prefix byte
    return buffer.sublist(1);
  }
}

/// Mutable index reference for recursive decoding.
class _IndexRef {
  int index = 0;
}
