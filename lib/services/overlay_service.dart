import 'dart:io';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.overlay');

/// Dart bridge to the Android floating overlay status chip.
/// No-op on iOS.
class OverlayService {
  static const _channel = MethodChannel('ai.flutterclaw/overlay');

  Future<bool> checkPermission() async {
    if (!Platform.isAndroid) return false;
    try {
      final result =
          await _channel.invokeMethod<bool>('overlay_check_permission') ??
              false;
      _log.info('checkPermission: $result');
      return result;
    } catch (e) {
      _log.warning('checkPermission error: $e');
      return false;
    }
  }

  Future<void> requestPermission() async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod<bool>('overlay_request_permission');
    } catch (e) {
      _log.warning('requestPermission error: $e');
    }
  }

  Future<void> show(String text) async {
    if (!Platform.isAndroid) return;
    try {
      _log.info('show("$text") → invoking platform channel');
      final result =
          await _channel.invokeMethod<bool>('overlay_show', {'text': text});
      _log.info('show() result: $result');
    } catch (e) {
      _log.warning('show() error: $e');
    }
  }

  Future<void> hide() async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod<bool>('overlay_hide');
    } catch (e) {
      _log.warning('hide() error: $e');
    }
  }
}
