/// Parses LLM provider errors into user-friendly messages.
library;

import 'package:dio/dio.dart';
import 'package:flutterclaw/core/providers/openai_provider.dart'
    show LlmProviderException;

/// Classifies the failure reason so the router can decide whether to retry,
/// back off, or fail immediately.  Mirrors OpenClaw's `FailoverReason`.
enum FailoverReason {
  /// Transient — safe to retry with exponential backoff.
  rateLimited,
  /// Transient — provider overloaded, retry after brief delay.
  overloaded,
  /// Transient — network issue or unknown, may resolve on retry.
  networkError,
  /// Permanent — bad API key, don't retry.
  authFailed,
  /// Permanent — insufficient credits/quota, don't retry.
  billing,
  /// Permanent — model does not exist, don't retry.
  modelNotFound,
  /// Transient — request timed out, may succeed on retry.
  timeout,
  /// Transient — unknown error, can attempt retry.
  unknown,
}

class ParsedLlmError {
  final String friendlyMessage;
  final int? statusCode;
  /// When set, chat UI uses this as the error card title instead of mapping [statusCode].
  final String? errorTitle;
  /// Optional primary action (e.g. OpenRouter privacy settings).
  final String? ctaUrl;
  final String? ctaLabel;
  /// Failover classification used by [FailoverProviderRouter].
  final FailoverReason failoverReason;

  const ParsedLlmError({
    required this.friendlyMessage,
    this.statusCode,
    this.errorTitle,
    this.ctaUrl,
    this.ctaLabel,
    this.failoverReason = FailoverReason.unknown,
  });

  /// Whether this error is transient and safe to retry with backoff.
  bool get isTransient => switch (failoverReason) {
    FailoverReason.rateLimited => true,
    FailoverReason.overloaded => true,
    FailoverReason.networkError => true,
    FailoverReason.timeout => true,
    FailoverReason.unknown => true,
    _ => false,
  };

  /// Whether this error is permanent — retrying will not help.
  bool get isPermanent => !isTransient;
}

/// Extracts a user-friendly message, status code, and failover reason
/// from a caught exception.
ParsedLlmError parseLlmError(Object e) {
  int? statusCode;
  String raw;

  if (e is LlmProviderException) {
    statusCode = e.statusCode;
    raw = e.message;
  } else if (e is DioException) {
    statusCode = e.response?.statusCode;
    raw = e.message ?? '';
  } else {
    raw = e.toString();
    final match =
        RegExp(r'status(?:\s*code)?\s*(?:of\s+)?(\d{3})').firstMatch(raw);
    if (match != null) {
      statusCode = int.tryParse(match.group(1)!);
    }
  }

  final reason = _classifyFailover(statusCode, raw);
  final mt = _messageAndTitle(statusCode, raw);
  return ParsedLlmError(
    friendlyMessage: mt.message,
    statusCode: statusCode,
    errorTitle: mt.title,
    ctaUrl: mt.ctaUrl,
    ctaLabel: mt.ctaLabel,
    failoverReason: reason,
  );
}

/// Classifies the error into a [FailoverReason] for retry logic.
FailoverReason _classifyFailover(int? statusCode, String raw) {
  final lower = raw.toLowerCase();
  switch (statusCode) {
    case 401:
    case 403:
      return FailoverReason.authFailed;
    case 402:
      return FailoverReason.billing;
    case 404:
      return FailoverReason.modelNotFound;
    case 429:
      return FailoverReason.rateLimited;
    case 500:
    case 502:
    case 503:
    case 529:
      return FailoverReason.overloaded;
    default:
      if (lower.contains('timed out') || lower.contains('timeoutexception')) {
        return FailoverReason.timeout;
      }
      if (lower.contains('socketexception') ||
          lower.contains('connection refused') ||
          lower.contains('network')) {
        return FailoverReason.networkError;
      }
      return FailoverReason.unknown;
  }
}

/// OpenRouter returns HTTP 404 with a body like "No endpoints available… data policy…
/// Configure: https://openrouter.ai/settings/privacy" — not "model not found".
({
  String message,
  String? title,
  String? ctaUrl,
  String? ctaLabel,
}) _messageAndTitle(int? statusCode, String raw) {
  // HTTP 413: Payload Too Large (RFC 7231). OpenRouter/proxy may reject oversized
  // JSON bodies — long chat history, images/PDFs as base64, etc.
  // See https://openrouter.ai/docs/api/reference/errors-and-debugging
  if (statusCode == 413) {
    return (
      message:
          'La peticion es demasiado grande para el proveedor (HTTP 413, "Payload Too Large"). '
          'Suele ocurrir con historial muy largo, imagenes o archivos en base64. '
          'Prueba en una conversacion nueva, envia menos adjuntos o acorta el contexto. '
          'Documentacion: https://openrouter.ai/docs/api/reference/errors-and-debugging',
      title: 'Solicitud demasiado grande',
      ctaUrl: 'https://openrouter.ai/docs/api/reference/errors-and-debugging',
      ctaLabel: 'Ver documentacion de errores',
    );
  }

  final lower = raw.toLowerCase();
  if (lower.contains('guardrail') ||
      lower.contains('openrouter.ai/settings/privacy') ||
      (lower.contains('no endpoints available') &&
          (lower.contains('data policy') || lower.contains('policy')))) {
    return (
      message:
          'OpenRouter no tiene endpoints disponibles para este modelo segun la politica '
          'de privacidad y datos de tu cuenta. Abre https://openrouter.ai/settings/privacy '
          'en el navegador (inicia sesion), revisa que proveedores y tipos de datos '
          'permites, guarda los cambios e intenta de nuevo. Tambien puedes elegir otro modelo.',
      title: 'Politica de datos (OpenRouter)',
      ctaUrl: 'https://openrouter.ai/settings/privacy',
      ctaLabel: 'Abrir ajustes de privacidad',
    );
  }
  return (
    message: _friendlyMessage(statusCode, raw),
    title: null,
    ctaUrl: null,
    ctaLabel: null,
  );
}

String _friendlyMessage(int? statusCode, String raw) {
  switch (statusCode) {
    case 401:
      return 'La clave API es invalida o no fue proporcionada. '
          'Revisa tu configuracion en Ajustes > Proveedores y modelos.';
    case 402:
      return 'Tu cuenta no tiene saldo suficiente o requiere un plan de pago '
          'para usar este modelo. Revisa tu plan en el sitio del proveedor.';
    case 403:
      return 'No tienes permiso para acceder a este modelo. '
          'Puede que necesites activarlo en tu cuenta del proveedor.';
    case 404:
      return 'El modelo solicitado no fue encontrado. '
          'Verifica que el nombre del modelo sea correcto en Ajustes.';
    case 413:
      return 'La peticion supera el tamaño maximo permitido (HTTP 413). '
          'Reduce el historial, adjuntos o imagenes en el mensaje.';
    case 429:
      return 'Demasiadas solicitudes. El proveedor ha limitado temporalmente '
          'tu acceso. Espera un momento e intenta de nuevo.';
    case 500:
      return 'El servidor del proveedor tuvo un error interno. '
          'Intenta de nuevo en unos minutos.';
    case 502 || 503:
      return 'El servicio del proveedor no esta disponible en este momento. '
          'Intenta de nuevo en unos minutos.';
    case 529:
      return 'El proveedor esta sobrecargado. '
          'Intenta de nuevo en unos minutos.';
    case 400:
      return 'El proveedor rechazo la solicitud (400): $raw';
    default:
      if (raw.contains('SocketException') ||
          raw.contains('Connection refused')) {
        return 'No se pudo conectar al proveedor. '
            'Revisa tu conexion a internet.';
      }
      if (raw.contains('timed out') || raw.contains('TimeoutException')) {
        return 'La solicitud tardo demasiado y se agoto el tiempo. '
            'Intenta de nuevo.';
      }
      if (statusCode != null) {
        return 'El proveedor respondio con un error ($statusCode): $raw';
      }
      return 'Ocurrio un error al comunicarse con el proveedor. '
          'Intenta de nuevo.';
  }
}
