/// Sandbox shell tool — lets the agent execute Linux commands on the device.
///
/// Android: full execution via PRoot + Alpine ARM64 rootfs (auto-provisioned
/// on first use, full internet access, `apk add` works).
/// iOS: TinyEMU RISC-V emulator + Alpine 3.21 userspace via WAMR. No internet
/// in VM, packages pre-installed at image build time.
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
      'Execute a shell command in a sandboxed Linux (Alpine 3.21) environment.\n\n'
      '=== ANDROID ===\n'
      'Runs in a PRoot sandbox (Alpine ARM64, native speed).\n'
      '`apk add <pkg>` downloads and installs at runtime — e.g. `apk add python3`, `apk add nodejs`.\n'
      'Full internet access from inside the sandbox (curl, wget, apk all work).\n'
      'Installed packages and files in /root/ persist across calls.\n\n'
      '=== iOS ===\n'
      'Runs in a TinyEMU RISC-V emulator (Alpine 3.21 userspace, ~10-100x slower than Android).\n'
      'IMPORTANT LIMITATIONS:\n'
      '- NO internet access inside the VM: curl, wget, and apk CANNOT reach the internet. Do not attempt network operations.\n'
      '- NO runtime package installation: `apk add <pkg>` will fail with a network error.\n'
      '- Pre-installed packages (only these are available): python3, pip, git, curl (local only), wget (local only), jq, bash, file, standard Alpine busybox utilities.\n'
      '- Architecture: riscv64 (not ARM64). `uname -m` returns riscv64.\n'
      '- Single-core CPU (no SMP). Parallel workloads do not benefit from multiple cores.\n'
      '- Performance: simple commands ~0.5-2s, python scripts ~2-10s, heavy operations minutes.\n'
      '- Use longer timeout_ms for heavy operations (60000-120000 recommended).\n'
      'FILE SHARING (host app <-> VM):\n'
      '- Call sandbox_status first to get shared_path.\n'
      '- Files written to shared_path by the host app are visible inside the VM at the same absolute path.\n'
      '- Files written by the VM to that path are readable by the host app.\n'
      '- Use this to pass input files into the VM or retrieve output files.\n'
      'Persistent filesystem: files in /root/ survive between calls (same as Android).';

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
