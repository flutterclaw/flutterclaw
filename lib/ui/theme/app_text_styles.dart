import 'package:flutter/material.dart';

/// Centralised text style helpers.
/// Always call with a context so styles inherit the current theme.
abstract final class AppTextStyles {
  /// Settings/form section header (e.g. "Basic Info", "Advanced")
  static TextStyle sectionHeader(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Theme.of(context).textTheme.labelMedium!.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        );
  }

  /// Monospace — code blocks, terminal paths, addresses
  static TextStyle monospace(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontFamily: 'monospace',
          color: Theme.of(context).colorScheme.onSurface,
        );
  }

  /// User chat bubble text
  static TextStyle chatUser(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        );
  }

  /// Assistant chat bubble text
  static TextStyle chatAssistant(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        );
  }

  /// Status chip / pill label
  static TextStyle statusLabel(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w500,
        );
  }

  /// Empty state title
  static TextStyle emptyStateTitle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        );
  }

  /// Empty state subtitle
  static TextStyle emptyStateSubtitle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );
  }

  /// Agent/channel name in hero cards
  static TextStyle heroTitle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w700,
        );
  }

  /// Secondary descriptor in hero cards (vibe, model name, etc.)
  static TextStyle heroSubtitle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );
  }
}
