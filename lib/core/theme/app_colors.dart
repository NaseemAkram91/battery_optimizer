import 'package:flutter/material.dart';

/// Central color palette for the Battery Optimizer app.
/// All colors are derived from the Figma design system.
class AppColors {
  AppColors._();

  // ── Backgrounds ──────────────────────────────────────────
  static const Color background = Color(0xFF0A0E21);
  static const Color surface = Color(0xFF1A1F38);
  static const Color surfaceLight = Color(0xFF222745);
  static const Color cardBorder = Color(0xFF3A7BD5); // More blue for the "glow" border
  static const Color bottomNavBg = Color(0xFF121630);

  // ── Primary / Accent ─────────────────────────────────────
  static const Color primary = Color(0xFF00D2FF);
  static const Color primaryDark = Color(0xFF0099CC);
  static const Color primaryLight = Color(0xFF66E5FF);

  // ── Semantic ─────────────────────────────────────────────
  static const Color success = Color(0xFF39FF14);
  static const Color successDark = Color(0xFF2ECC0F);
  static const Color warning = Color(0xFFFFB800);
  static const Color warningDark = Color(0xFFCC9300);
  static const Color danger = Color(0xFFFF4757);
  static const Color dangerDark = Color(0xFFCC3945);

  // ── Text ─────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8A8FA8);
  static const Color textTertiary = Color(0xFF5A5F78);

  // ── Gradients ────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF007AFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF39FF14), Color(0xFF00C853)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFFB800), Color(0xFFFF8C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient dangerGradient = LinearGradient(
    colors: [Color(0xFFFF4757), Color(0xFFFF6B81)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1F38), Color(0xFF151929)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
