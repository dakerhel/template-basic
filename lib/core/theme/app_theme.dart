import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData light([String? fontFamily]) => _theme(Brightness.light, fontFamily);

  static ThemeData dark([String? fontFamily]) => _theme(Brightness.dark, fontFamily);

  static ThemeData _theme(Brightness brightness, String? fontFamily) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
    );
  }
}
