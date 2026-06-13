import 'package:flutter/material.dart';

/// Semantic color tokens for status indicators.
/// Use these instead of hardcoded Colors.green / Colors.red / etc.
@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  const SemanticColors({
    required this.statusSuccess,
    required this.statusError,
    required this.statusWarning,
    required this.statusInfo,
    required this.statusInactive,
    required this.surfaceInteractive,
    required this.surfaceProminent,
  });

  final Color statusSuccess;
  final Color statusError;
  final Color statusWarning;
  final Color statusInfo;
  final Color statusInactive;

  // Surface overlays for interactive/elevated states
  final Color surfaceInteractive;
  final Color surfaceProminent;

  // Convenience aliases
  Color get channelOnline => statusSuccess;
  Color get channelOffline => statusInactive;

  static const light = SemanticColors(
    statusSuccess: Color(0xFF2E7D32),     // green[800]
    statusError: Color(0xFFC62828),       // red[800]
    statusWarning: Color(0xFFE65100),     // orange[900]
    statusInfo: Color(0xFF1565C0),        // blue[800]
    statusInactive: Color(0xFF757575),    // grey[600]
    surfaceInteractive: Color(0x0F6750A4), // primary at 6% opacity
    surfaceProminent: Color(0xFFEADDFF),  // primaryContainer light
  );

  static const dark = SemanticColors(
    statusSuccess: Color(0xFF66BB6A),     // green[400]
    statusError: Color(0xFFEF5350),       // red[400]
    statusWarning: Color(0xFFFFA726),     // orange[400]
    statusInfo: Color(0xFF42A5F5),        // blue[400]
    statusInactive: Color(0xFF9E9E9E),    // grey[500]
    surfaceInteractive: Color(0x1FEFB8FF), // primary at 12% opacity (dark)
    surfaceProminent: Color(0xFF4F378B),  // primaryContainer dark
  );

  @override
  SemanticColors copyWith({
    Color? statusSuccess,
    Color? statusError,
    Color? statusWarning,
    Color? statusInfo,
    Color? statusInactive,
    Color? surfaceInteractive,
    Color? surfaceProminent,
  }) {
    return SemanticColors(
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusError: statusError ?? this.statusError,
      statusWarning: statusWarning ?? this.statusWarning,
      statusInfo: statusInfo ?? this.statusInfo,
      statusInactive: statusInactive ?? this.statusInactive,
      surfaceInteractive: surfaceInteractive ?? this.surfaceInteractive,
      surfaceProminent: surfaceProminent ?? this.surfaceProminent,
    );
  }

  @override
  SemanticColors lerp(SemanticColors? other, double t) {
    if (other is! SemanticColors) return this;
    return SemanticColors(
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
      statusError: Color.lerp(statusError, other.statusError, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      statusInfo: Color.lerp(statusInfo, other.statusInfo, t)!,
      statusInactive: Color.lerp(statusInactive, other.statusInactive, t)!,
      surfaceInteractive: Color.lerp(surfaceInteractive, other.surfaceInteractive, t)!,
      surfaceProminent: Color.lerp(surfaceProminent, other.surfaceProminent, t)!,
    );
  }
}

/// Convenience extension for ergonomic access.
extension SemanticColorsContext on BuildContext {
  SemanticColors get semantic =>
      Theme.of(this).extension<SemanticColors>() ?? SemanticColors.light;
}
