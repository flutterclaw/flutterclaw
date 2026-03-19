/// Slack channel adapter using Socket Mode.
///
/// Socket Mode opens a WebSocket connection to Slack's event infrastructure
/// so no public inbound URL is required — ideal for a mobile app.
///
/// Setup:
/// 1. Create a Slack App at https://api.slack.com/apps
/// 2. Enable Socket Mode: Settings → Socket Mode
/// 3. Create an App-Level Token (xapp-…) with `connections:write` scope
/// 4. Add Bot Token Scopes: chat:write, channels:read, channels:history,
///    groups:read, groups:history, im:read, im:history, mpim:read, mpim:history
/// 5. Install the app to your workspace → copy Bot Token (xoxb-…)
library;

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'channel_interface.dart';

const _type = 'slack';
const _apiBase = 'https://slack.com/api';

final _log = Logger('SlackChannelAdapter');

class SlackChannelAdapter implements ChannelAdapter {
  SlackChannelAdapter({
    required this.botToken,
    required this.appToken,
    this.allowedUserIds = const [],
    this.chatCommandHandler,
  }) : _dio = Dio(BaseOptions(
          baseUrl: _apiBase,
          headers: {
            'Authorization': 'Bearer $botToken',
            'Content-Type': 'application/json; charset=utf-8',
          },
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
        ));

  final String botToken;
  final String appToken;
  final List<String> allowedUserIds;
  final Dio _dio;
  final Future<String?> Function(String sessionKey, String command)?
      chatCommandHandler;

  MessageHandler? _handler;
  bool _running = false;
  WebSocketChannel? _ws;
  Timer? _reconnectTimer;
  String? _botUserId;

  @override
  String get type => _type;

  @override
  bool get isConnected => _running && _ws != null;

  @override
  Future<void> start(MessageHandler handler) async {
    if (_running) return;
    _handler = handler;
    _running = true;
    await _resolveBotUserId();
    await _connect();
  }

  @override
  Future<void> stop() async {
    _running = false;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _ws?.sink.close();
    _ws = null;
    _handler = null;
  }

  // -----------------------------------------------------------------------
  // Socket Mode connection
  // -----------------------------------------------------------------------

  Future<void> _resolveBotUserId() async {
    try {
      final r = await _dio.post('/auth.test');
      _botUserId = r.data?['user_id'] as String?;
      _log.info('Slack bot user_id: $_botUserId');
    } catch (e) {
      _log.warning('Could not resolve bot user_id: $e');
    }
  }

  Future<void> _connect() async {
    if (!_running) return;
    try {
      // Request a Socket Mode WSS URL using the app-level token
      final r = await Dio(BaseOptions(
        baseUrl: _apiBase,
        headers: {'Authorization': 'Bearer $appToken'},
      )).post('/apps.connections.open');

      if (r.data?['ok'] != true) {
        _log.warning('apps.connections.open failed: ${r.data}');
        _scheduleReconnect();
        return;
      }

      final wssUrl = r.data?['url'] as String?;
      if (wssUrl == null) {
        _scheduleReconnect();
        return;
      }

      _ws = WebSocketChannel.connect(Uri.parse(wssUrl));
      _log.info('Slack Socket Mode connected');

      _ws!.stream.listen(
        _onMessage,
        onError: (e) {
          _log.warning('Slack WS error: $e');
          _scheduleReconnect();
        },
        onDone: () {
          _log.info('Slack WS closed');
          if (_running) _scheduleReconnect();
        },
        cancelOnError: false,
      );
    } catch (e) {
      _log.warning('Slack connect error: $e');
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    if (!_running) return;
    _reconnectTimer?.cancel();
    _reconnectTimer =
        Timer(const Duration(seconds: 10), () => _connect());
  }

  void _onMessage(dynamic raw) {
    if (raw is! String) return;
    Map<String, dynamic> payload;
    try {
      payload = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return;
    }

    final type = payload['type'] as String?;

    // Acknowledge all events immediately (required within 3 s)
    final envId = payload['envelope_id'] as String?;
    if (envId != null) {
      _ws?.sink.add(jsonEncode({'envelope_id': envId}));
    }

    if (type == 'hello') {
      _log.fine('Slack hello received');
      return;
    }

    if (type == 'disconnect') {
      _log.info('Slack requested reconnect');
      _ws?.sink.close();
      _ws = null;
      if (_running) _connect();
      return;
    }

    // events_api payload
    if (type == 'events_api') {
      _handleEventPayload(payload['payload'] as Map<String, dynamic>?);
    }
  }

  void _handleEventPayload(Map<String, dynamic>? payload) {
    if (payload == null) return;
    final event = payload['event'] as Map<String, dynamic>?;
    if (event == null) return;

    final eventType = event['type'] as String?;
    if (eventType != 'message') return;

    final subtype = event['subtype'] as String?;
    if (subtype != null) return; // skip edits, deletions, bot messages

    final userId = event['user'] as String?;
    if (userId == null) return;
    if (userId == _botUserId) return; // ignore own messages

    if (allowedUserIds.isNotEmpty && !allowedUserIds.contains(userId)) {
      return;
    }

    final text = event['text'] as String? ?? '';
    final channelId = event['channel'] as String? ?? '';
    final ts = event['ts'] as String? ?? '';
    final threadTs = event['thread_ts'] as String?;

    final sessionKey = '$_type:$channelId';

    // Handle slash commands
    if (text.startsWith('/') && chatCommandHandler != null) {
      final parts = text.split(' ');
      final command = parts.first;
      chatCommandHandler!(sessionKey, command).then((response) {
        if (response != null) {
          sendMessage(OutgoingMessage(
            channelType: _type,
            chatId: channelId,
            text: response,
            replyToMessageId: threadTs ?? ts,
          ));
        }
      });
      return;
    }

    final incoming = IncomingMessage(
      channelType: _type,
      senderId: userId,
      senderName: userId,
      chatId: channelId,
      text: text,
      messageId: ts,
      replyToMessageId: threadTs,
      timestamp: DateTime.now(),
    );

    _handler?.call(incoming).catchError((e) {
      _log.warning('Handler error: $e');
    });
  }

  // -----------------------------------------------------------------------
  // Sending messages
  // -----------------------------------------------------------------------

  @override
  Future<void> sendMessage(OutgoingMessage message) async {
    if (message.channelType != _type) return;

    // Split long messages at 3000-char Slack limit
    final text = message.text;
    final chunks = <String>[];
    for (var i = 0; i < text.length; i += 3000) {
      chunks.add(text.substring(i, (i + 3000).clamp(0, text.length)));
    }

    for (final chunk in chunks) {
      try {
        await _dio.post('/chat.postMessage', data: {
          'channel': message.chatId,
          'text': chunk,
          if (message.replyToMessageId != null)
            'thread_ts': message.replyToMessageId,
          'mrkdwn': true,
        });
      } catch (e) {
        _log.warning('Slack sendMessage error: $e');
      }
    }
  }
}
