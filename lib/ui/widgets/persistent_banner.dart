import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

enum PersistentBannerType { info, warning, error }

/// Slim persistent banner shown below an AppBar for ongoing issues
/// (e.g. gateway down, channel disconnected, offline mode).
///
/// Animates in with a slide-down + fade. Dismiss via [onDismiss] (optional).
class PersistentBanner extends StatelessWidget {
  const PersistentBanner({
    super.key,
    required this.message,
    this.type = PersistentBannerType.warning,
    this.actionLabel,
    this.onAction,
    this.onDismiss,
  });

  final String message;
  final PersistentBannerType type;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (bg, fg, icon) = switch (type) {
      PersistentBannerType.info => (
          cs.secondaryContainer,
          cs.onSecondaryContainer,
          Icons.info_outline_rounded,
        ),
      PersistentBannerType.warning => (
          cs.tertiaryContainer,
          cs.onTertiaryContainer,
          Icons.warning_amber_rounded,
        ),
      PersistentBannerType.error => (
          cs.errorContainer,
          cs.onErrorContainer,
          Icons.error_outline_rounded,
        ),
    };

    return Material(
      color: bg,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.spacingLG,
          vertical: AppTokens.spacingSM,
        ),
        child: Row(
          children: [
            Icon(icon, size: AppTokens.iconSM, color: fg),
            const SizedBox(width: AppTokens.spacingSM),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(width: AppTokens.spacingXS),
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: fg,
                  padding: const EdgeInsets.symmetric(horizontal: AppTokens.spacingSM),
                  minimumSize: const Size(0, AppTokens.touchTargetSM),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(actionLabel!),
              ),
            ],
            if (onDismiss != null)
              IconButton(
                icon: const Icon(Icons.close_rounded),
                iconSize: AppTokens.iconSM,
                color: fg,
                onPressed: onDismiss,
                tooltip: 'Dismiss',
                padding: const EdgeInsets.all(AppTokens.spacingXS),
                constraints: const BoxConstraints(
                  minWidth: AppTokens.touchTargetSM,
                  minHeight: AppTokens.touchTargetSM,
                ),
              ),
          ],
        ),
      ),
    )
        .animate()
        .slideY(
          begin: -0.5,
          duration: AppTokens.durationNormal,
          curve: Curves.easeOutCubic,
        )
        .fadeIn(duration: AppTokens.durationFast);
  }
}
