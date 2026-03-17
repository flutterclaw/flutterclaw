import 'dart:typed_data';

import 'types.dart';

/// Get all children of [node] with the given [childTag].
List<BinaryNode> getBinaryNodeChildren(BinaryNode? node, String childTag) {
  if (node == null) return const [];
  final content = node.content;
  if (content is! List<BinaryNode>) return const [];
  return content.where((c) => c.tag == childTag).toList();
}

/// Get the first child of [node] with the given [childTag].
BinaryNode? getBinaryNodeChild(BinaryNode? node, String childTag) {
  if (node == null) return null;
  final content = node.content;
  if (content is! List<BinaryNode>) return null;
  for (final child in content) {
    if (child.tag == childTag) return child;
  }
  return null;
}

/// Get all children of [node].
List<BinaryNode> getAllBinaryNodeChildren(BinaryNode node) {
  final content = node.content;
  if (content is List<BinaryNode>) return content;
  return const [];
}

/// Get the content of a child node as bytes.
Uint8List? getBinaryNodeChildBuffer(BinaryNode? node, String childTag) {
  final child = getBinaryNodeChild(node, childTag)?.content;
  if (child is Uint8List) return child;
  return null;
}

/// Get the content of a child node as a string.
String? getBinaryNodeChildString(BinaryNode? node, String childTag) {
  final child = getBinaryNodeChild(node, childTag)?.content;
  if (child is Uint8List) return String.fromCharCodes(child);
  if (child is String) return child;
  return null;
}

/// Get the content of a child node as an unsigned integer.
int? getBinaryNodeChildUInt(BinaryNode node, String childTag, int length) {
  final buff = getBinaryNodeChildBuffer(node, childTag);
  if (buff == null) return null;
  return _bufferToUInt(buff, length);
}

/// Assert that a binary node does not contain an error child.
void assertNodeErrorFree(BinaryNode node) {
  final errNode = getBinaryNodeChild(node, 'error');
  if (errNode != null) {
    final code = int.tryParse(errNode.attrs['code'] ?? '') ?? 0;
    throw Exception(errNode.attrs['text'] ?? 'Unknown error (code: $code)');
  }
}

/// Reduce children with [tag] into a key-value dictionary.
Map<String, String> reduceBinaryNodeToDictionary(BinaryNode node, String tag) {
  final nodes = getBinaryNodeChildren(node, tag);
  final dict = <String, String>{};
  for (final n in nodes) {
    final key = n.attrs['name'] ?? n.attrs['config_code'] ?? '';
    final value = n.attrs['value'] ?? n.attrs['config_value'] ?? '';
    if (key.isNotEmpty) dict[key] = value;
  }
  return dict;
}

int _bufferToUInt(Uint8List e, int t) {
  var a = 0;
  for (var i = 0; i < t; i++) {
    a = 256 * a + e[i];
  }
  return a;
}
