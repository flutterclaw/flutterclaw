import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

/// A standardised empty state widget with icon, title, subtitle, and optional actions.
///
/// Use [EmptyState.loading] to show a shimmer placeholder while content loads.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  }) : _shimmer = false;

  const EmptyState._shimmer({super.key})
      : icon = Icons.circle,
        title = '',
        subtitle = null,
        actionLabel = null,
        onAction = null,
        secondaryActionLabel = null,
        onSecondaryAction = null,
        _shimmer = true;

  /// Returns a shimmer placeholder — use while data is loading.
  static Widget loading({Key? key}) => EmptyState._shimmer(key: key);

  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final bool _shimmer;

  @override
  Widget build(BuildContext context) {
    if (_shimmer) return _ShimmerPlaceholder();

    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.spacingXXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppTokens.iconDisplay,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppTokens.spacingLG),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppTokens.spacingSM),
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppTokens.spacingXL),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
            if (secondaryActionLabel != null && onSecondaryAction != null) ...[
              const SizedBox(height: AppTokens.spacingSM),
              TextButton(
                onPressed: onSecondaryAction,
                child: Text(secondaryActionLabel!),
              ),
            ],
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: AppTokens.durationNormal, curve: Curves.easeOutCubic)
        .slideY(begin: 0.08, duration: AppTokens.durationNormal, curve: Curves.easeOutCubic);
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surfaceContainer;

    Widget shimmerBox(double width, double height) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: base,
          borderRadius: BorderRadius.circular(AppTokens.radiusSM),
        ),
      )
          .animate(onPlay: (c) => c.repeat())
          .shimmer(
            duration: const Duration(milliseconds: 1200),
            color: highlight,
            curve: Curves.easeInOutSine,
          );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.spacingXXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            shimmerBox(AppTokens.iconDisplay, AppTokens.iconDisplay),
            const SizedBox(height: AppTokens.spacingLG),
            shimmerBox(160, 18),
            const SizedBox(height: AppTokens.spacingSM),
            shimmerBox(220, 14),
            const SizedBox(height: AppTokens.spacingXS),
            shimmerBox(180, 14),
          ],
        ),
      ),
    );
  }
}
