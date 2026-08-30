import 'package:flutter/material.dart';

import 'tokens/tokens.dart';

abstract final class AppTheme {
  static ThemeData light({
    AppColorPalette palette = AppColorPalette.monochrome,
    String? fontFamily,
  }) => _theme(
    brightness: Brightness.light,
    palette: palette,
    fontFamily: fontFamily,
    isOled: false,
  );

  static ThemeData dark({
    AppColorPalette palette = AppColorPalette.monochrome,
    String? fontFamily,
    bool isOled = false,
  }) => _theme(
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
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: fontFamily,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: colorScheme.onSurface,
          fontFamily: fontFamily,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          textStyle: AppTypography.labelLarge.copyWith(fontFamily: fontFamily),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rLg),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        modalBackgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.sheet),
        elevation: 0,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.xs,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.rMd),
      ),
    );
  }
}
