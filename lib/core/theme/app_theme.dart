import 'package:flutter/material.dart';

import 'app_color_palette.dart';

abstract final class AppTheme {
  static ThemeData light({
    AppColorPalette palette = AppColorPalette.fuchsiaPine,
    String? fontFamily,
  }) =>
      _theme(
        brightness: Brightness.light,
        palette: palette,
        fontFamily: fontFamily,
        isOled: false,
      );

  static ThemeData dark({
    AppColorPalette palette = AppColorPalette.fuchsiaPine,
    String? fontFamily,
    bool isOled = false,
  }) =>
      _theme(
        brightness: Brightness.dark,
        palette: palette,
        fontFamily: fontFamily,
        isOled: isOled,
      );

  static ThemeData _theme({
    required Brightness brightness,
    required AppColorPalette palette,
    required String? fontFamily,
    required bool isOled,
  }) {
    final colorScheme = palette.toColorScheme(
      brightness: brightness,
      isOled: isOled,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}
