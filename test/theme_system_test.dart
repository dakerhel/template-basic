import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/tokens/tokens.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';

void main() {
  group('Design Tokens', () {
    test('AppSpacing tokens have correct scale', () {
      expect(AppSpacing.xs, 4.0);
      expect(AppSpacing.sm, 8.0);
      expect(AppSpacing.md, 12.0);
      expect(AppSpacing.base, 16.0);
      expect(AppSpacing.lg, 20.0);
      expect(AppSpacing.xl, 24.0);
      expect(AppSpacing.xxl, 32.0);
    });

    test('AppRadius tokens have correct values', () {
      expect(AppRadius.xs, 4.0);
      expect(AppRadius.sm, 8.0);
      expect(AppRadius.md, 12.0);
      expect(AppRadius.base, 16.0);
      expect(AppRadius.lg, 20.0);
      expect(AppRadius.xxl, 28.0);
      expect(AppRadius.full, 9999.0);
    });

    test('AppIcons tokens have correct scale', () {
      expect(AppIcons.xs, 14.0);
      expect(AppIcons.sm, 18.0);
      expect(AppIcons.md, 22.0);
      expect(AppIcons.lg, 26.0);
      expect(AppIcons.xl, 32.0);
      expect(AppIcons.hero, 48.0);
    });

    test('AppAnimations tokens have valid durations', () {
      expect(AppAnimations.fast.inMilliseconds, 150);
      expect(AppAnimations.normal.inMilliseconds, 250);
      expect(AppAnimations.slow.inMilliseconds, 500);
    });
  });

  group('AppColorPalette & Monochrome Default', () {
    test('monochrome is the default palette with proper contrast', () {
      expect(AppColorPalette.fromId(null), AppColorPalette.monochrome);
      expect(AppColorPalette.fromId('unknown'), AppColorPalette.monochrome);

      final light = AppColorPalette.monochrome.toColorScheme(
        brightness: Brightness.light,
      );
      expect(light.brightness, Brightness.light);
      expect(light.primary, isNotNull);
      expect(light.surface, isNotNull);

      final dark = AppColorPalette.monochrome.toColorScheme(
        brightness: Brightness.dark,
      );
      expect(dark.brightness, Brightness.dark);

      final oled = AppColorPalette.monochrome.toColorScheme(
        brightness: Brightness.dark,
        isOled: true,
      );
      expect(oled.surface, Colors.black);
    });

    test(
      'all 9 palettes produce valid Light ColorSchemes with proper contrast',
      () {
        expect(AppColorPalette.values.length, 9);
        for (final palette in AppColorPalette.values) {
          final scheme = palette.toColorScheme(brightness: Brightness.light);
          expect(scheme.brightness, Brightness.light);
          expect(scheme.primary, isNotNull);
          expect(scheme.surface, isNotNull);
          expect(scheme.onSurface, isNotNull);
        }
      },
    );

    test('all 9 palettes produce valid Dark and OLED ColorSchemes', () {
      for (final palette in AppColorPalette.values) {
        final darkScheme = palette.toColorScheme(brightness: Brightness.dark);
        expect(darkScheme.brightness, Brightness.dark);

        final oledScheme = palette.toColorScheme(
          brightness: Brightness.dark,
          isOled: true,
        );
        expect(oledScheme.brightness, Brightness.dark);
        expect(oledScheme.surface, Colors.black);
      }
    });

    test('provides localized names across all 14 supported languages for all 9 palettes', () {
      final locales = [
        'ru',
        'en',
        'zh',
        'es',
        'pt',
        'de',
        'fr',
        'it',
        'ja',
        'ko',
        'tr',
        'id',
        'ar',
        'hi',
      ];

      for (final palette in AppColorPalette.values) {
        for (final code in locales) {
          final localized = palette.localizedName(Locale(code));
          expect(
            localized,
            isNotEmpty,
            reason: 'Palette ${palette.id} should have translation for $code',
          );
        }
      }
    });
  });

  group('AppThemeMode', () {
    test('correctly maps to Flutter ThemeMode and OLED flag', () {
      expect(AppThemeMode.system.flutterThemeMode, ThemeMode.system);
      expect(AppThemeMode.system.isOled, isFalse);

      expect(AppThemeMode.light.flutterThemeMode, ThemeMode.light);
      expect(AppThemeMode.light.isOled, isFalse);

      expect(AppThemeMode.dark.flutterThemeMode, ThemeMode.dark);
      expect(AppThemeMode.dark.isOled, isFalse);

      expect(AppThemeMode.oled.flutterThemeMode, ThemeMode.dark);
      expect(AppThemeMode.oled.isOled, isTrue);
    });

    test('serializes and deserializes correctly', () {
      for (final mode in AppThemeMode.values) {
        expect(AppThemeMode.fromId(mode.id), mode);
      }
      expect(AppThemeMode.fromId('unknown'), AppThemeMode.system);
    });
  });
}
