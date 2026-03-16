/// Sandbox shell tool — lets the agent execute Linux commands on the device.
///
/// Android: full execution via PRoot + Alpine rootfs (auto-provisioned on
/// first use).
/// iOS: returns a clear "not available" message (structured for future iSH
/// fork integration).
library;

import 'dart:convert';

import 'package:flutterclaw/services/sandbox_service.dart';
import 'package:flutterclaw/tools/registry.dart';

class RunShellCommandTool extends Tool {
  final SandboxService _svc;
  RunShellCommandTool(this._svc);

  @override
  String get name => 'run_shell_command';

  @override
  String get description =>
      'Execute a shell command in a sandboxed Linux (Alpine) environment.\n\n'
      'Android: runs in a PRoot sandbox with an Alpine Linux rootfs.\n'
      'Available by default: sh, busybox utilities (ls, cat, grep, sed, awk, '
      'wget, etc.), apk package manager.\n'
      'Install anything you need with `apk add <pkg>` — e.g. '
      '`apk add python3`, `apk add git`, `apk add curl`, `apk add nodejs`.\n'
      'You can chain: `apk add python3 && python3 -c "print(42)"`\n\n'
      'iOS: not available (returns an informational error).\n\n'
      'The sandbox persists across calls — installed packages and files in '
      '/root/ survive between invocations. Timeout default is 30 seconds.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'command': {
            'type': 'string',
            'description': 'Shell command to execute (passed to sh -c).',
          },
          'timeout_ms': {
            'type': 'integer',
            'description':
                'Timeout in milliseconds (default 30000, max 120000).',
          },
          'working_dir': {
            'type': 'string',
            'description':
                'Working directory inside the sandbox (default /root).',
          },
        },
        'required': ['command'],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final command = args['command'] as String?;
    if (command == null || command.isEmpty) {
      return ToolResult.error('command is required');
    }

    final timeoutMs = (args['timeout_ms'] as num?)?.toInt() ?? 30000;
    if (timeoutMs < 1000 || timeoutMs > 120000) {
      return ToolResult.error(
        'timeout_ms must be between 1000 and 120000',
      );
    }

    final workingDir = args['working_dir'] as String?;

    // Check sandbox availability and platform.
    final status = await _svc.status();
    if (status['error'] == true) {
      return ToolResult.error(status['message'] as String? ?? 'Status check failed');
    }
    if (status['platform'] == 'ios') {
      return ToolResult.error(
        'Shell sandbox is not available on iOS. '
        'This feature requires Android with PRoot. '
        'For a local Linux shell on iOS, consider the iSH app.',
      );
    }

    // Auto-provision on first call.
    if (status['ready'] != true) {
      final setup = await _svc.setup();
      if (setup['error'] == true) {
        return ToolResult.error(
          'Sandbox setup failed: ${setup['message'] ?? 'unknown error'}\n'
          'Status: ${jsonEncode(status)}',
        );
      }
    }

    // Execute the command.
    final result = await _svc.exec(
      command: command,
      timeoutMs: timeoutMs,
      workingDir: workingDir,
    );
    if (result['error'] == true) {
      return ToolResult.error(
        result['message'] as String? ?? 'Execution failed',
      );
    }
    return ToolResult.success(jsonEncode(result));
  }
}
