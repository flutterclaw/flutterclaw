/// Token budget management and estimation for FlutterClaw agents.
///
/// Provides centralized token estimation and per-model budget allocation
/// to prevent context window overflow.
library;

import 'dart:convert';

import 'package:logging/logging.dart';

import '../../data/models/config.dart';
import '../../data/models/model_catalog.dart';

final _log = Logger('flutterclaw.token_budget');

/// Manages token budgets and provides estimation utilities.
class TokenBudgetManager {
  /// Estimate tokens for arbitrary content.
  ///
  /// Uses a simple heuristic: ~4 characters per token.
  /// Handles String, List, Map, and other types.
  static int estimateTokens(dynamic content) {
    if (content == null) return 0;

    String text;
    if (content is String) {
      text = content;
    } else if (content is List || content is Map) {
      try {
        text = jsonEncode(content);
      } catch (_) {
        text = content.toString();
      }
    } else {
      text = content.toString();
    }

    // Simple heuristic: 1 token ≈ 4 characters
    return text.length ~/ 4;
  }

  /// Get the context window size for a given model.
  ///
  /// Looks up the model in the catalog and returns its contextWindow.
  /// Returns a default of 200,000 tokens if model not found.
  static int getContextWindow(String modelName, ConfigManager configManager) {
    // First check configured models
    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry != null) {
      // Try to find in catalog to get context window
      final catalogModel = ModelCatalog.models.firstWhere(
        (m) => m.id == modelEntry.model,
        orElse: () => ModelCatalog.models.first, // Fallback to first model
      );
      return catalogModel.contextWindow;
    }

    // Fallback: search catalog directly by name
    final catalogModel = ModelCatalog.models.firstWhere(
      (m) => m.displayName == modelName || m.id == modelName,
      orElse: () => const CatalogModel(
        id: 'default',
        displayName: 'Default',
        providerId: 'custom',
        isFree: false,
        contextWindow: 200000, // Conservative default
      ),
    );

    return catalogModel.contextWindow;
  }

  /// Check if a tool result is safe to include without truncation.
  ///
  /// A result is "safe" if it's under the max tool result budget
  /// with a 20% buffer for the completion.
  static bool isToolResultSafe(
    String content,
    String modelName,
    ConfigManager configManager,
  ) {
    final estimatedTokens = estimateTokens(content);
    final maxTokens = getMaxToolResultTokens(modelName, configManager);

    return estimatedTokens <= maxTokens;
  }

  /// Get the maximum safe tokens for a single tool result.
  ///
  /// Uses config.agents.defaults.maxToolResultTokens if set (default: 50000).
  /// Falls back to 30% of context window if not configured.
  static int getMaxToolResultTokens(
    String modelName,
    ConfigManager configManager,
  ) {
    final configuredMax =
        configManager.config.agents.defaults.maxToolResultTokens;

    // If configured explicitly, use that
    if (configuredMax > 0) return configuredMax;

    // Otherwise, allocate 30% of context window
    final contextWindow = getContextWindow(modelName, configManager);
    return (contextWindow * 0.30).toInt();
  }

  /// Truncate content to fit within a token limit.
  ///
  /// Keeps the first ~70% and last ~10% of content, with a truncation
  /// marker in the middle explaining what happened.
  static String truncateToTokenLimit(String content, int maxTokens) {
    final estimatedTokens = estimateTokens(content);

    if (estimatedTokens <= maxTokens) {
      return content; // No truncation needed
    }

    // Calculate character budgets
    // Keep first 70% and last 10% of allowed tokens
    final maxChars = maxTokens * 4; // Convert back to chars
    final firstChars = (maxChars * 0.70).toInt();
    final lastChars = (maxChars * 0.10).toInt();

    // Build truncated result
    final first = content.length > firstChars
        ? content.substring(0, firstChars)
        : content;

    final last = content.length > lastChars
        ? content.substring(content.length - lastChars)
        : '';

    final omittedChars = content.length - first.length - last.length;
    final truncationMarker = '\n\n'
        '[... TOOL RESULT TRUNCATED ...]\n\n'
        'This result was too large (estimated $estimatedTokens tokens, '
        'max $maxTokens tokens).\n'
        'The middle portion was omitted to stay within context limits '
        '(~$omittedChars characters omitted).\n\n'
        'To get the complete data:\n'
        '- Request a smaller date range\n'
        '- Process data in chunks\n'
        '- Use more specific filters\n\n';

    final truncated = first + truncationMarker + last;

    _log.warning(
      'Truncated content: ${content.length} chars → ${truncated.length} chars '
      '($estimatedTokens tokens → ${estimateTokens(truncated)} tokens)',
    );

    return truncated;
  }

  /// Estimate total tokens in a conversation context.
  ///
  /// Sums token estimates for all message contents.
  static int estimateConversationTokens(
    List<dynamic> messages, {
    String? systemPrompt,
  }) {
    var total = 0;

    if (systemPrompt != null) {
      total += estimateTokens(systemPrompt);
    }

    for (final msg in messages) {
      // Handle different message formats
      if (msg is Map) {
        final content = msg['content'];
        total += estimateTokens(content);
      } else {
        // Assume object with content property
        try {
          total += estimateTokens(msg.toString());
        } catch (_) {
          // Skip if can't estimate
        }
      }
    }

    return total;
  }

  /// Get the safe limit for triggering compaction.
  ///
  /// Uses config.agents.defaults.autoCompactThreshold (default: 0.85).
  /// This threshold leaves enough room for the next assistant response
  /// while preventing overflow.
  static int getSafeContextLimit(String modelName, ConfigManager configManager) {
    final contextWindow = getContextWindow(modelName, configManager);
    final threshold =
        configManager.config.agents.defaults.autoCompactThreshold;

    return (contextWindow * threshold).toInt();
  }
}
