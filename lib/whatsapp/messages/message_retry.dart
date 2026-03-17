import '../binary/types.dart';
import '../socket/wa_socket.dart';
import '../signal/signal_store.dart';
import '../utils/event_emitter.dart';

/// Handles failed message decryption by requesting a resend from the sender.
class MessageRetryHandler {
  final WASocket socket;
  final WAEventEmitter ev;
  final SignalProtocolStore store;

  // msgId → retry count
  final _retries = <String, int>{};
  static const _maxRetries = 5;

  MessageRetryHandler({
    required this.socket,
    required this.ev,
    required this.store,
  }) {
    ev.on<Map<String, dynamic>>('messages.decrypt-error', _onDecryptError);
  }

  Future<void> _onDecryptError(Map<String, dynamic> event) async {
    final msgId = event['id'] as String? ?? '';
    final from = event['from'] as String? ?? '';
    if (msgId.isEmpty || from.isEmpty) return;

    final participant = event['participant'] as String?;
    final recipient = event['recipient'] as String?;
    final senderId = event['senderId'] as String?;

    final count = (_retries[msgId] ?? 0) + 1;
    if (count > _maxRetries) {
      _retries.remove(msgId);
      if (senderId != null && senderId.isNotEmpty) {
        await store.deleteSession(senderId);
      }
      return;
    }
    _retries[msgId] = count;

    // Send a receipt node requesting retransmission.
    await _sendRetryReceipt(
      msgId: msgId,
      to: from,
      retryCount: count,
      participant: participant,
      recipient: recipient,
    );
  }

  Future<void> _sendRetryReceipt({
    required String msgId,
    required String to,
    required int retryCount,
    String? participant,
    String? recipient,
  }) async {
    final receipt = BinaryNode(
      tag: 'receipt',
      attrs: {
        'id': msgId,
        'to': to,
        'type': 'retry',
        if (participant != null && participant.isNotEmpty)
          'participant': participant,
        if (recipient != null && recipient.isNotEmpty) 'recipient': recipient,
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
