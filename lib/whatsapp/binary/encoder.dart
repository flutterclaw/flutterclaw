import 'dart:convert';
import 'dart:typed_data';

import 'constants.dart';
import 'jid_utils.dart';
import 'types.dart';

/// Encode a [BinaryNode] into bytes.
/// Port of Baileys WABinary/encode.ts.
Uint8List encodeBinaryNode(BinaryNode node) {
  final buffer = <int>[0]; // first byte: compression flag (0 = none)
  _encodeBinaryNodeInner(node, buffer);
  return Uint8List.fromList(buffer);
}

void _encodeBinaryNodeInner(BinaryNode node, List<int> buffer) {
  void pushByte(int value) => buffer.add(value & 0xff);

  void pushInt(int value, int n, {bool littleEndian = false}) {
    for (var i = 0; i < n; i++) {
      final curShift = littleEndian ? i : n - 1 - i;
      buffer.add((value >> (curShift * 8)) & 0xff);
    }
  }

  void pushBytes(List<int> bytes) => buffer.addAll(bytes);

  void pushInt16(int value) => pushBytes([(value >> 8) & 0xff, value & 0xff]);

  void pushInt20(int value) =>
      pushBytes([(value >> 16) & 0x0f, (value >> 8) & 0xff, value & 0xff]);

  void writeByteLength(int length) {
    if (length >= 4294967296) {
      throw ArgumentError('string too large to encode: $length');
    }
    if (length >= 1 << 20) {
      pushByte(Tags.binary32);
      pushInt(length, 4);
    } else if (length >= 256) {
      pushByte(Tags.binary20);
      pushInt20(length);
    } else {
      pushByte(Tags.binary8);
      pushByte(length);
    }
  }

  void writeStringRaw(String str) {
    final bytes = utf8.encode(str);
    writeByteLength(bytes.length);
    buffer.addAll(bytes);
  }

  int packNibble(String char) {
    switch (char) {
      case '-':
        return 10;
      case '.':
        return 11;
      case '\x00':
        return 15;
      default:
        final code = char.codeUnitAt(0);
        if (code >= 0x30 && code <= 0x39) return code - 0x30; // '0'-'9'
        throw ArgumentError('invalid nibble char "$char"');
    }
  }

  int packHex(String char) {
    final code = char.codeUnitAt(0);
    if (code >= 0x30 && code <= 0x39) return code - 0x30; // '0'-'9'
    if (code >= 0x41 && code <= 0x46) return 10 + code - 0x41; // 'A'-'F'
    if (code >= 0x61 && code <= 0x66) return 10 + code - 0x61; // 'a'-'f'
    if (char == '\x00') return 15;
    throw ArgumentError('invalid hex char "$char"');
  }

  void writePackedBytes(String str, bool isNibbleType) {
    if (str.length > Tags.packedMax) {
      throw ArgumentError('Too many bytes to pack');
    }
    pushByte(isNibbleType ? Tags.nibble8 : Tags.hex8);

    var roundedLength = (str.length / 2.0).ceil();
    if (str.length % 2 != 0) roundedLength |= 128;
    pushByte(roundedLength);

    final packFn = isNibbleType ? packNibble : packHex;

    final half = str.length ~/ 2;
    for (var i = 0; i < half; i++) {
      pushByte((packFn(str[2 * i]) << 4) | packFn(str[2 * i + 1]));
    }
    if (str.length % 2 != 0) {
      pushByte((packFn(str[str.length - 1]) << 4) | packFn('\x00'));
    }
  }

  bool isNibble(String? str) {
    if (str == null || str.isEmpty || str.length > Tags.packedMax) return false;
    for (var i = 0; i < str.length; i++) {
      final c = str[i];
      final isDigit = c.codeUnitAt(0) >= 0x30 && c.codeUnitAt(0) <= 0x39;
      if (!isDigit && c != '-' && c != '.') return false;
    }
    return true;
  }

  bool isHex(String? str) {
    if (str == null || str.isEmpty || str.length > Tags.packedMax) return false;
    for (var i = 0; i < str.length; i++) {
      final code = str.codeUnitAt(i);
      final isDigit = code >= 0x30 && code <= 0x39;
      final isUpperHex = code >= 0x41 && code <= 0x46;
      if (!isDigit && !isUpperHex) return false;
    }
    return true;
  }

  // writeJid and writeString are mutually recursive, so we use late.
  late void Function(FullJid jid) writeJid;
  late void Function(String? str) writeString;

  writeJid = (FullJid jid) {
    if (jid.device != null) {
      pushByte(Tags.adJid);
      pushByte(jid.domainType ?? 0);
      pushByte(jid.device ?? 0);
      writeString(jid.user);
    } else {
      pushByte(Tags.jidPair);
      if (jid.user.isNotEmpty) {
        writeString(jid.user);
      } else {
        pushByte(Tags.listEmpty);
      }
      writeString(jid.server);
    }
  };

  writeString = (String? str) {
    if (str == null) {
      pushByte(Tags.listEmpty);
      return;
    }
    if (str.isEmpty) {
      writeStringRaw(str);
      return;
    }

    final tokenIndex = tokenMap[str];
    if (tokenIndex != null) {
      if (tokenIndex.dict != null) {
        pushByte(Tags.dictionary0 + tokenIndex.dict!);
      }
      pushByte(tokenIndex.index);
    } else if (isNibble(str)) {
      writePackedBytes(str, true);
    } else if (isHex(str)) {
      writePackedBytes(str, false);
    } else {
      final decodedJid = jidDecode(str);
      if (decodedJid != null) {
        writeJid(decodedJid);
      } else {
        writeStringRaw(str);
      }
    }
  };

  void writeListStart(int listSize) {
    if (listSize == 0) {
      pushByte(Tags.listEmpty);
    } else if (listSize < 256) {
      pushBytes([Tags.list8, listSize]);
    } else {
      pushByte(Tags.list16);
      pushInt16(listSize);
    }
  }

  // --- Main encoding logic ---

  if (node.tag.isEmpty) {
    throw ArgumentError('Invalid node: tag cannot be empty');
  }

  final validAttributes = node.attrs.entries
      .where((e) => e.value.isNotEmpty)
      .toList();

  final hasContent = node.content != null;
  writeListStart(2 * validAttributes.length + 1 + (hasContent ? 1 : 0));
  writeString(node.tag);

  for (final entry in validAttributes) {
    writeString(entry.key);
    writeString(entry.value);
  }

  final content = node.content;
  if (content is String) {
    writeString(content);
  } else if (content is Uint8List) {
    writeByteLength(content.length);
    buffer.addAll(content);
  } else if (content is List<BinaryNode>) {
    final validContent = content.where((item) => item.tag.isNotEmpty).toList();
    writeListStart(validContent.length);
    for (final item in validContent) {
      _encodeBinaryNodeInner(item, buffer);
    }
  } else if (content != null) {
    throw ArgumentError(
        'invalid content for tag "${node.tag}": $content (${content.runtimeType})');
  }
}
