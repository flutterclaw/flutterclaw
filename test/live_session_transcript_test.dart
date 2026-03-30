import 'package:flutter_test/flutter_test.dart';
import 'package:flutterclaw/core/agent/live_session_transcript.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';

void main() {
  test('drops oldest blocks when over budget', () {
    final msgs = [
      const LlmMessage(role: 'user', content: 'aaa'),
      const LlmMessage(role: 'assistant', content: 'bbb'),
      const LlmMessage(role: 'user', content: 'ccc'),
    ];
    final out = formatContextMessagesForLiveSystemInstruction(
      msgs,
      maxChars: 50,
    );
    expect(out.contains('aaa'), isFalse);
    expect(out.contains('bbb'), isFalse);
    expect(out.contains('ccc'), isTrue);
    expect(out.startsWith('# Conversation transcript'), isTrue);
  });

  test('includes system and tool roles', () {
    final msgs = [
      const LlmMessage(role: 'system', content: '[summary]'),
      const LlmMessage(role: 'user', content: 'hi'),
      const LlmMessage(
        role: 'assistant',
        content: '',
        toolCalls: [
          ToolCall(
            id: '1',
            function: ToolCallFunction(name: 'read_file', arguments: '{}'),
          ),
        ],
      ),
      const LlmMessage(
        role: 'tool',
        content: 'file contents',
        name: 'read_file',
        toolCallId: '1',
      ),
    ];
    final out = formatContextMessagesForLiveSystemInstruction(
      msgs,
      maxChars: 10000,
    );
    expect(out.contains('System:'), isTrue);
    expect(out.contains('[summary]'), isTrue);
    expect(out.contains('calling read_file'), isTrue);
    expect(out.contains('Tool (read_file):'), isTrue);
  });
}
