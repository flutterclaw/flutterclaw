/// Design tokens for FlutterClaw UI.
/// Use these constants instead of hardcoded values for spacing, radii, and durations.
abstract final class AppTokens {
  // Spacing
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 12;
  static const double spacingLG = 16;
  static const double spacingXL = 24;
  static const double spacingXXL = 32;

  // Border radius
  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 16;
  static const double radiusPill = 20;

  // Animation durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 600);

  // Icon sizes
  static const double iconXS = 14;
  static const double iconSM = 16;
  static const double iconMD = 20;
  static const double iconLG = 24;
  static const double iconXL = 32;
  static const double iconHero = 48;
  static const double iconDisplay = 64;

  // Elevation levels (Material 3 elevation tint scale)
  static const double elevationNone = 0;
  static const double elevationLow = 1;
  static const double elevationMid = 3;
  static const double elevationHigh = 6;

  // Touch targets (WCAG minimum)
  static const double touchTarget = 48;
  static const double touchTargetSM = 40;

  // Opacity levels
  static const double opacityDisabled = 0.38;
  static const double opacitySubdued = 0.60;
  static const double opacityHint = 0.45;

  // Easing curves (use via Curves.*):
  //   entrance: Curves.easeOutCubic
  //   exit:     Curves.easeInCubic
  //   emphasis: Curves.easeInOutCubic
  //   spring:   Curves.elasticOut
}
