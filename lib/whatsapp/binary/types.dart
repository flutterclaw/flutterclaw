import 'dart:typed_data';

/// The binary node WhatsApp uses internally for communication.
///
/// Manipulated solely as a data object (no methods) for easy serialization.
/// Port of Baileys WABinary/types.ts.
class BinaryNode {
  final String tag;
  final Map<String, String> attrs;

  /// Content can be: List<BinaryNode>, String, or Uint8List.
  final Object? content;

  const BinaryNode({
    required this.tag,
    this.attrs = const {},
    this.content,
  });

  /// Get content as list of child nodes.
  List<BinaryNode> get children {
    final c = content;
    if (c is List<BinaryNode>) return c;
    return const [];
  }

  /// Get content as bytes.
  Uint8List? get contentBytes {
    final c = content;
    if (c is Uint8List) return c;
    return null;
  }

  /// Get content as string.
  String? get contentString {
    final c = content;
    if (c is String) return c;
    if (c is Uint8List) return String.fromCharCodes(c);
    return null;
  }

  @override
  String toString() => binaryNodeToString(this);
}

/// Pretty-print a BinaryNode tree (for debugging).
String binaryNodeToString(Object? node, [int indent = 0]) {
  if (node == null) return 'null';
  final tabs = '\t' * indent;

  if (node is String) return '$tabs$node';

  if (node is Uint8List) {
    return '$tabs${node.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}';
  }

  if (node is List<BinaryNode>) {
    return node.map((x) => '${'\t' * (indent + 1)}${binaryNodeToString(x, indent + 1)}').join('\n');
  }

  if (node is BinaryNode) {
    final children = binaryNodeToString(node.content, indent + 1);
    final attrStr = node.attrs.entries
        .where((e) => e.value.isNotEmpty)
        .map((e) => "${e.key}='${e.value}'")
        .join(' ');
    final tag = '<${node.tag} $attrStr';
    final content = children.isNotEmpty ? '>\n$children\n$tabs</${node.tag}>' : '/>';
    return tag + content;
  }

  return '$tabs$node';
}
