/// Dart bridge to the native Sandbox MethodChannel.
///
/// Provides typed wrappers for sandbox_status, sandbox_setup, and sandbox_exec
/// methods. All methods return a `Map<String, dynamic>` and never throw —
/// PlatformExceptions are caught and returned as
/// `{'error': true, 'code': ..., 'message': ...}`.
library;

import 'package:flutter/services.dart';

class SandboxService {
  static const _channel = MethodChannel('ai.flutterclaw/sandbox');

  /// Check whether the sandbox environment is ready.
  ///
  /// Returns `{ready: bool, platform: String, proot_available: bool,
  /// rootfs_available: bool}` on Android, or `{ready: false, platform: "ios",
  /// note: "..."}` on iOS.
  Future<Map<String, dynamic>> status() => _invoke('sandbox_status');

  /// Initialize the sandbox environment (downloads and extracts the Alpine
  /// rootfs on Android). Idempotent — skips if already provisioned.
  ///
  /// Returns `{ready: true}` on success, or `{error: true, message: String}`
  /// on failure.
  Future<Map<String, dynamic>> setup() => _invoke('sandbox_setup');

  /// Execute a shell command inside the sandbox.
  ///
  /// Returns `{exit_code: int, stdout: String, stderr: String,
  /// timed_out: bool}`.
  Future<Map<String, dynamic>> exec({
    required String command,
    int timeoutMs = 30000,
    String? workingDir,
  }) =>
      _invoke('sandbox_exec', {
        'command': command,
        'timeout_ms': timeoutMs,
        'working_dir': workingDir,
      });

  // ─── Internal ──────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> _invoke(
    String method, [
    Map<String, dynamic>? args,
  ]) async {
    try {
      final result = await _channel.invokeMapMethod<String, dynamic>(
        method,
        args,
      );
      return result ?? {};
    } on PlatformException catch (e) {
      return {
        'error': true,
        'code': e.code,
        'message': e.message ?? 'Unknown error',
      };
    }
  }
}
