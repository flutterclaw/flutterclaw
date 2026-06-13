import 'package:flutter/material.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

/// Standardised card primitive with three visual variants.
///
/// Replace ad-hoc `Card(child: Padding(...))` patterns with this widget.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
  }) : _color = null,
       _elevation = AppTokens.elevationNone;

  const AppCard.elevated({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
  }) : _color = null,
       _elevation = AppTokens.elevationLow;

  const AppCard.tonal({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
  }) : _color = _AppCardColor.tonal,
       _elevation = AppTokens.elevationNone;

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final _AppCardColor? _color;
  final double _elevation;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = _color == _AppCardColor.tonal ? cs.secondaryContainer : null;

    final card = Card(
      elevation: _elevation,
      color: bg,
      margin: margin ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTokens.radiusLG),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppTokens.spacingLG),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTokens.radiusLG),
        child: card,
      );
    }
    return card;
  }
}

enum _AppCardColor { tonal }
