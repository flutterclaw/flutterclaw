import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterclaw/ui/theme/semantic_colors.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

enum StatusDotState { success, warning, error, inactive, connecting }

/// A small colored dot used to indicate status (connected, warning, offline, etc).
///
/// Use [StatusDot.pulsing] for an animated "connecting" indicator.
class StatusDot extends StatelessWidget {
  const StatusDot({
    super.key,
    required this.state,
    this.size = 10,
    this.semanticLabel,
  }) : _pulsing = false;

  const StatusDot.pulsing({
    super.key,
    this.size = 10,
    this.semanticLabel,
  })  : state = StatusDotState.connecting,
        _pulsing = true;

  final StatusDotState state;
  final double size;
  final String? semanticLabel;
  final bool _pulsing;

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      StatusDotState.success => context.semantic.statusSuccess,
      StatusDotState.warning => context.semantic.statusWarning,
      StatusDotState.error => context.semantic.statusError,
      StatusDotState.inactive => context.semantic.statusInactive,
      StatusDotState.connecting => context.semantic.statusInfo,
    };

    final dot = Semantics(
      label: semanticLabel,
      child: Container(
        width: size.clamp(8.0, double.infinity),
        height: size.clamp(8.0, double.infinity),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );

    if (!_pulsing) return dot;

    return dot
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .fadeIn(
          begin: AppTokens.opacityHint,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOutSine,
        );
  }
}
