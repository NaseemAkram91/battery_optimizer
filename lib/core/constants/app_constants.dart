/// App-wide constants: spacing, durations, string literals.
class AppConstants {
  AppConstants._();

  // ── Spacing ──────────────────────────────────────────────
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // ── Border Radius ────────────────────────────────────────
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusCircle = 100.0;

  // ── Animation Durations ──────────────────────────────────
  static const Duration animFast = Duration(milliseconds: 200);
  static const Duration animMedium = Duration(milliseconds: 400);
  static const Duration animSlow = Duration(milliseconds: 800);
  static const Duration animVerySlow = Duration(milliseconds: 1500);

  // ── Strings ──────────────────────────────────────────────
  static const String appName = 'Battery Optimizer';
  static const String home = 'Home';
  static const String usage = 'Usage';
  static const String tools = 'Tools';
  static const String profile = 'Profile';
}
