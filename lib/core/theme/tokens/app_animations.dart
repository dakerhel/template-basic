import 'package:flutter/widgets.dart';

abstract final class AppAnimations {
  // Durations
  static const Duration instant = Duration.zero;
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 500);

  // Transitions
  static const Duration sheetTransition = Duration(milliseconds: 300);
  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration themeTransition = Duration(milliseconds: 200);

  // Curves
  static const Curve standard = Curves.easeInOut;
  static const Curve smoothOut = Curves.easeOutCubic;
  static const Curve smoothIn = Curves.easeInCubic;
  static const Curve bounce = Curves.elasticOut;
  static const Curve snappy = Curves.easeOutQuad;
}
