import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';

void main() {
  group('AppColorPalette', () {
    test(
      'all palettes produce valid Light ColorSchemes with proper contrast',
      () {
        for (final palette in AppColorPalette.values) {
          final scheme = palette.toColorScheme(brightness: Brightness.light);
          expect(scheme.brightness, Brightness.light);
          expect(scheme.primary, palette.accentColor);
          expect(scheme.surface, isNotNull);
          expect(scheme.onSurface, isNotNull);
          // onPrimary should be either black or white depending on luminance
          expect(
            scheme.onPrimary == Colors.black ||
                scheme.onPrimary == Colors.white,
            isTrue,
          );
        }
      },
    );

    test('all palettes produce valid Dark and OLED ColorSchemes', () {
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

    test('provides localized names across all 14 supported languages', () {
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
