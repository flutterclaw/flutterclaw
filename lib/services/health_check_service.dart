import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/services/channel_validation.dart';
import 'package:flutterclaw/services/provider_key_validator.dart';

/// Cached results from lightweight credential health checks.
class HealthCheckResults {
  const HealthCheckResults({
    this.providerErrors = const {},
    this.channelErrors = const {},
    this.checkedAt,
  });

  final Map<String, String> providerErrors;
  final Map<String, String> channelErrors;
  final DateTime? checkedAt;

  bool get hasIssues =>
      providerErrors.isNotEmpty || channelErrors.isNotEmpty;

  HealthCheckResults copyWith({
    Map<String, String>? providerErrors,
    Map<String, String>? channelErrors,
    DateTime? checkedAt,
  }) {
    return HealthCheckResults(
      providerErrors: providerErrors ?? this.providerErrors,
      channelErrors: channelErrors ?? this.channelErrors,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }
}

/// Runs passive validation for provider keys and channel credentials.
class HealthCheckService {
  const HealthCheckService();

  Future<HealthCheckResults> run({
    required FlutterClawConfig config,
    required bool gatewayRunning,
    Map<String, bool> channelConnected = const {},
  }) async {
    final providerErrors = <String, String>{};
    final channelErrors = <String, String>{};

    for (final entry in config.providerCredentials.entries) {
      final provId = entry.key;
      final cred = entry.value;
      final baseId = provId.split(':').first;
      if (baseId == 'bedrock' && cred.awsAuthMode == 'sigv4') continue;
      final catalogProv = ModelCatalog.getProvider(baseId);
      final error = await ProviderKeyValidator.validate(
        providerId: baseId,
        apiKey: cred.apiKey,
        apiBase: cred.apiBase ?? catalogProv?.apiBase,
        awsRegion: cred.awsRegion,
        awsAuthMode: cred.awsAuthMode,
      );
      if (error != null) providerErrors[provId] = error;
    }

    if (gatewayRunning) {
      final tg = config.channels.telegram;
      if (tg.enabled && (tg.token?.isNotEmpty ?? false)) {
        final err = await ChannelValidation.telegramToken(tg.token!);
        if (err != null) channelErrors['telegram'] = err;
      }
      final dc = config.channels.discord;
      if (dc.enabled && (dc.token?.isNotEmpty ?? false)) {
        final err = await ChannelValidation.discordToken(dc.token!);
        if (err != null) channelErrors['discord'] = err;
      }
      final sl = config.channels.slack;
      if (sl.enabled &&
          (sl.botToken?.isNotEmpty ?? false) &&
          (sl.appToken?.isNotEmpty ?? false)) {
        final err = await ChannelValidation.slackTokens(
          sl.botToken!,
          sl.appToken!,
        );
        if (err != null) channelErrors['slack'] = err;
      }
      final sig = config.channels.signal;
      if (sig.enabled && (sig.apiUrl?.isNotEmpty ?? false)) {
        final err = await ChannelValidation.signalApi(sig.apiUrl!);
        if (err != null) channelErrors['signal'] = err;
      }
      final wa = config.channels.whatsapp;
      if (wa.enabled && !(channelConnected['whatsapp'] ?? false)) {
        final err = await ChannelValidation.whatsappConnection(
          isConnected: channelConnected['whatsapp'] ?? false,
        );
        if (err != null) channelErrors['whatsapp'] = err;
      }
    }

    return HealthCheckResults(
      providerErrors: providerErrors,
      channelErrors: channelErrors,
      checkedAt: DateTime.now(),
    );
  }
}
