import '../binary/types.dart';
import '../socket/wa_socket.dart';
import '../utils/event_emitter.dart';

/// Handles failed message decryption by requesting a resend from the sender.
class MessageRetryHandler {
  final WASocket socket;
  final WAEventEmitter ev;

  // msgId → retry count
  final _retries = <String, int>{};
  static const _maxRetries = 5;

  MessageRetryHandler({required this.socket, required this.ev}) {
    ev.on<Map<String, dynamic>>('messages.decrypt-error', _onDecryptError);
  }

  Future<void> _onDecryptError(Map<String, dynamic> event) async {
    final msgId = event['id'] as String? ?? '';
    final from = event['from'] as String? ?? '';
    if (msgId.isEmpty || from.isEmpty) return;

    final count = (_retries[msgId] ?? 0) + 1;
    if (count > _maxRetries) {
      _retries.remove(msgId);
      return;
    }
    _retries[msgId] = count;

    // Send a receipt node requesting retransmission.
    await _sendRetryReceipt(msgId: msgId, to: from, retryCount: count);
  }

  Future<void> _sendRetryReceipt({
    required String msgId,
    required String to,
    required int retryCount,
  }) async {
    final receipt = BinaryNode(
      tag: 'receipt',
      attrs: {
        'id': msgId,
        'to': to,
        'type': 'retry',
      },
      content: [
        BinaryNode(
          tag: 'retry',
          attrs: {
            'count': retryCount.toString(),
            'id': msgId,
            'v': '1',
          },
        ),
      ],
    );

    await socket.sendNode(receipt);
  }

  void dispose() {
    _retries.clear();
  }
}
