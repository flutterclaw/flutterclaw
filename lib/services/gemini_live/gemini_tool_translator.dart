/// Translates between OpenAI function-calling format and Gemini Live API format.
library;

/// Converts tool definitions from OpenAI format (used by [ToolRegistry.toProviderDefs()])
/// to Gemini's `functionDeclarations` format for the Live API setup message.
class GeminiToolTranslator {
  /// Convert OpenAI tool defs to Gemini format.
  ///
  /// Input (OpenAI):
  /// ```json
  /// [{"type": "function", "function": {"name": "X", "description": "Y", "parameters": {...}}}]
  /// ```
  ///
  /// Output (Gemini):
  /// ```json
  /// [{"functionDeclarations": [{"name": "X", "description": "Y", "parameters": {...}}]}]
  /// ```
  static List<Map<String, dynamic>> toGeminiTools(
    List<Map<String, dynamic>> openAiTools,
  ) {
    final declarations = <Map<String, dynamic>>[];
    for (final tool in openAiTools) {
      final fn = tool['function'] as Map<String, dynamic>?;
      if (fn == null) continue;

      final decl = <String, dynamic>{
        'name': fn['name'],
        'description': fn['description'],
      };

      // Gemini uses the same JSON Schema format for parameters but doesn't
      // accept `additionalProperties` at the top level in all cases.
      final params = fn['parameters'] as Map<String, dynamic>?;
      if (params != null) {
        decl['parameters'] = _cleanParameters(params);
      }

      declarations.add(decl);
    }

    if (declarations.isEmpty) return [];
    return [
      {'functionDeclarations': declarations},
    ];
  }

  /// Recursively clean a JSON Schema for Gemini Live API compatibility.
  ///
  /// Gemini rejects several standard JSON Schema keywords. This walks the
  /// entire schema tree and removes all unsupported fields.
  /// Safely coerce any Map to `Map<String, dynamic>`.
  static Map<String, dynamic> _toStringMap(dynamic m) {
    if (m is Map<String, dynamic>) return Map<String, dynamic>.from(m);
    if (m is Map) {
      return {for (final e in m.entries) e.key.toString(): e.value};
    }
    return {};
  }

  static Map<String, dynamic> _cleanParameters(Map<String, dynamic> params) {
    final cleaned = Map<String, dynamic>.from(params);

    // Fields Gemini Live API does not accept at any level.
    const unsupported = {
      'additionalProperties',
      '\$schema',
      '\$defs',
      'definitions',
      'contentEncoding',
      'contentMediaType',
    };
    for (final key in unsupported) {
      cleaned.remove(key);
    }

    // Recursively clean nested property schemas.
    if (cleaned['properties'] is Map) {
      final props = _toStringMap(cleaned['properties']);
      cleaned['properties'] = {
        for (final e in props.entries)
          e.key: e.value is Map
              ? _cleanParameters(_toStringMap(e.value))
              : e.value,
      };
    }

    // Recursively clean array item schemas.
    if (cleaned['items'] is Map) {
      cleaned['items'] = _cleanParameters(_toStringMap(cleaned['items']));
    }

    // Recursively clean anyOf / oneOf / allOf schemas.
    for (final key in ['anyOf', 'oneOf', 'allOf']) {
      if (cleaned[key] is List) {
        cleaned[key] = (cleaned[key] as List)
            .map((e) => e is Map ? _cleanParameters(_toStringMap(e)) : e)
            .toList();
      }
    }

    return cleaned;
  }

  /// Convert a Gemini function call response back to the format expected by
  /// [ToolRegistry.execute]: just the parsed arguments map.
  static Map<String, dynamic> parseGeminiFunctionArgs(
    Map<String, dynamic> geminiArgs,
  ) {
    // Gemini sends args directly as a map, unlike OpenAI which sends a JSON string.
    return geminiArgs;
  }
}
