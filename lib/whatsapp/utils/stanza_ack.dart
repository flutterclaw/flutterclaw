import '../binary/types.dart';

BinaryNode buildAckStanza(
  BinaryNode node, {
  int? errorCode,
  String? meId,
}) {
  final attrs = <String, String>{
    'id': node.attrs['id'] ?? '',
    'to': node.attrs['from'] ?? '',
    'class': node.tag,
  };

  if (errorCode != null && errorCode != 0) {
    attrs['error'] = errorCode.toString();
  }
  final participant = node.attrs['participant'];
  if (participant != null && participant.isNotEmpty) {
    attrs['participant'] = participant;
  }
  final recipient = node.attrs['recipient'];
  if (recipient != null && recipient.isNotEmpty) {
    attrs['recipient'] = recipient;
  }
  final type = node.attrs['type'];
  if (type != null && type.isNotEmpty) {
    attrs['type'] = type;
  }
  if (node.tag == 'message' && meId != null && meId.isNotEmpty) {
    attrs['from'] = meId;
  }

  return BinaryNode(tag: 'ack', attrs: attrs);
}
