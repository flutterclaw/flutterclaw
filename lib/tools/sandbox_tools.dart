/// Sandbox shell tool — lets the agent execute Linux commands on the device.
///
/// Android: full execution via PRoot + Alpine ARM64 rootfs (auto-provisioned
/// on first use, full internet access, `apk add` works).
/// iOS: TinyEMU RISC-V emulator + Alpine 3.21 userspace via wazero/WAMR.
/// With C2WNet (wazero + gvisor-tap-vsock): full internet access.
/// With WAMR fallback: no internet, packages pre-installed at image build time.
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
      'NETWORKING:\n'
      '- Internet access is available: curl, wget, apk add, pip install, git clone all work.\n'
      '- DNS resolves via the virtual gateway (192.168.127.1).\n'
      '- Network operations are slower due to emulation — use longer timeout_ms (60000-120000).\n'
      'LIMITATIONS:\n'
      '- Architecture: riscv64 (not ARM64). `uname -m` returns riscv64.\n'
      '- Single-core CPU (no SMP). Parallel workloads do not benefit from multiple cores.\n'
      '- Performance: simple commands ~0.5-2s, python scripts ~2-10s, heavy operations minutes.\n'
      '- Pre-installed packages: python3, pip, git, curl, wget, jq, bash, file. Install more with `apk add`.\n'
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
  bool get supportsStreaming => true;

  @override
  Stream<String>? executeStream(Map<String, dynamic> args) async* {
    // TODO: Implement real line-by-line streaming of stdout/stderr.
    // Currently this is a pseudo-stream: shows "Running..." then waits for
    // the entire command to complete. Real streaming would require:
    // - Android: EventChannel in SandboxHandler.kt to emit stdout lines
    // - iOS: EventChannel in WasmSandboxHandler.swift
    // - Dart: SandboxService.exec() returning Stream<String> instead of Future
    //
    // For now, yield a "running" notice immediately so the tool card shows activity,
    // then yield the full output once the command completes.
    yield '⏳ Running…\n';
    final result = await execute(args);
    if (!result.isError) {
      // Replace the placeholder with the real output.
      yield '\x00CLEAR\x00${result.content}';
    } else {
      yield '\x00CLEAR\x00Error: ${result.content}';
    }
  }

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
