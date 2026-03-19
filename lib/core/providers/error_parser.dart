/// Parses LLM provider errors into user-friendly messages.
library;

import 'package:dio/dio.dart';
import 'package:flutterclaw/core/providers/openai_provider.dart'
    show LlmProviderException;

class ParsedLlmError {
  final String friendlyMessage;
  final int? statusCode;

  const ParsedLlmError({required this.friendlyMessage, this.statusCode});
}

/// Extracts a user-friendly message and status code from a caught exception.
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

  return ParsedLlmError(
    friendlyMessage: _friendlyMessage(statusCode, raw),
    statusCode: statusCode,
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
        return 'El proveedor respondio con un error ($statusCode). '
            'Intenta de nuevo o revisa tu configuracion.';
      }
      return 'Ocurrio un error al comunicarse con el proveedor. '
          'Intenta de nuevo.';
  }
}
