import 'package:dio/dio.dart';

/// Lightweight pre-save validation of channel credentials.
///
/// Each method returns `null` on success, or a short human-readable error
/// description when the credentials are rejected or unreachable.
class ChannelValidation {
  ChannelValidation._();

  static final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// Validates a Telegram bot token via the `getMe` endpoint.
  static Future<String?> telegramToken(String token) async {
    try {
      final res = await _dio.get('https://api.telegram.org/bot$token/getMe');
      final data = res.data;
      if (data is Map && data['ok'] == true) return null;
      return (data is Map ? data['description']?.toString() : null) ??
          'Unexpected response from Telegram';
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401 || status == 404) return 'Invalid bot token';
      return e.message ?? e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  /// Validates a Discord bot token via `GET /users/@me`.
  static Future<String?> discordToken(String token) async {
    try {
      await _dio.get(
        'https://discord.com/api/v10/users/@me',
        options: Options(headers: {'Authorization': 'Bot $token'}),
      );
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) return 'Invalid bot token';
      return e.message ?? e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  /// Validates Slack bot + app tokens via `auth.test` and
  /// `apps.connections.open`.
  static Future<String?> slackTokens(String botToken, String appToken) async {
    try {
      final botRes = await _dio.post(
        'https://slack.com/api/auth.test',
        options: Options(headers: {'Authorization': 'Bearer $botToken'}),
      );
      final botData = botRes.data;
      if (botData is! Map || botData['ok'] != true) {
        return 'Bot token: ${botData is Map ? botData['error'] ?? 'invalid' : 'invalid'}';
      }
      final appRes = await _dio.post(
        'https://slack.com/api/apps.connections.open',
        options: Options(headers: {'Authorization': 'Bearer $appToken'}),
      );
      final appData = appRes.data;
      if (appData is! Map || appData['ok'] != true) {
        return 'App token: ${appData is Map ? appData['error'] ?? 'invalid' : 'invalid'}';
      }
      return null;
    } on DioException catch (e) {
      return e.message ?? e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  /// Returns an error when WhatsApp is enabled but not connected.
  static Future<String?> whatsappConnection({required bool isConnected}) async {
    if (isConnected) return null;
    return 'Not connected — scan QR to link';
  }

  /// Checks that a signal-cli-rest-api instance is reachable at [apiUrl].
  static Future<String?> signalApi(String apiUrl) async {
    try {
      final base = apiUrl.endsWith('/')
          ? apiUrl.substring(0, apiUrl.length - 1)
          : apiUrl;
      await _dio.get('$base/v1/about');
      return null;
    } on DioException catch (e) {
      return e.message ?? e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
