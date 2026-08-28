import 'package:flutter/widgets.dart';

abstract final class AppColors {
  // Pure Neutrals
  static const Color pureBlack = Color(0xFF000000);
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Dark Scales
  static const Color darkBackground = Color(0xFF0D0D11);
  static const Color darkSurface = Color(0xFF141419);
  static const Color darkCard = Color(0xFF1C1C24);
  static const Color darkBorder = Color(0xFF2E2E38);

  // Light Scales
  static const Color lightBackground = Color(0xFFF7F8FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFF0F2F5);
  static const Color lightBorder = Color(0xFFE2E4E9);

  // Status & Feedback
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Glass Specular
  static const Color glassBorderLight = Color(0x33FFFFFF);
  static const Color glassBorderDark = Color(0x1FFFFFFF);
}
