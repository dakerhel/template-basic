import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/app_theme.dart';

void main() {
  group('AppColorPalette & ColorScheme Integrity Tests', () {
    for (final palette in AppColorPalette.values) {
      test('Palette ${palette.nameEn} produces valid Light ColorScheme', () {
        final scheme = palette.toColorScheme(brightness: Brightness.light);

        expect(scheme.brightness, Brightness.light);
        expect(scheme.primary, isNotNull);
        expect(scheme.onPrimary, isNotNull);
        expect(scheme.primaryContainer, isNotNull);
        expect(scheme.onPrimaryContainer, isNotNull);
        expect(scheme.surface, isNotNull);
        expect(scheme.onSurface, isNotNull);

        // Ensure onPrimary is distinct from primary
        expect(scheme.onPrimary != scheme.primary, isTrue);

        // Luminance contrast check between primary and onPrimary
        final primLum = scheme.primary.computeLuminance();
        final onPrimLum = scheme.onPrimary.computeLuminance();
        final lumDiff = (primLum - onPrimLum).abs();
        expect(
          lumDiff,
          greaterThan(0.25),
          reason:
              'Light theme ${palette.nameEn} primary and onPrimary must have high luminance contrast (diff: $lumDiff)',
        );
      });

      test('Palette ${palette.nameEn} produces valid Dark ColorScheme', () {
        final scheme = palette.toColorScheme(brightness: Brightness.dark);

        expect(scheme.brightness, Brightness.dark);
        expect(scheme.primary, isNotNull);
        expect(scheme.onPrimary, isNotNull);
        expect(scheme.primaryContainer, isNotNull);
        expect(scheme.surface, isNotNull);

        // Ensure high contrast
        final primLum = scheme.primary.computeLuminance();
        final onPrimLum = scheme.onPrimary.computeLuminance();
        final lumDiff = (primLum - onPrimLum).abs();
        expect(
          lumDiff,
          greaterThan(0.25),
          reason:
              'Dark theme ${palette.nameEn} primary and onPrimary must have high luminance contrast (diff: $lumDiff)',
        );
      });

      test('Palette ${palette.nameEn} produces pure black surface in OLED mode', () {
        final scheme = palette.toColorScheme(
          brightness: Brightness.dark,
          isOled: true,
        );

        expect(scheme.surface, const Color(0xFF000000));
      });
    }

    test('All palettes have unique ids', () {
      final ids = AppColorPalette.values.map((p) => p.id).toSet();
      expect(ids.length, AppColorPalette.values.length);
    });

    test('AppTheme.light and AppTheme.dark build ThemeData without crashing', () {
      for (final palette in AppColorPalette.values) {
        final lightTheme = AppTheme.light(palette: palette, fontFamily: 'Inter');
        final darkTheme = AppTheme.dark(
          palette: palette,
          fontFamily: 'Inter',
          isOled: false,
        );
        final oledTheme = AppTheme.dark(
          palette: palette,
          fontFamily: 'Inter',
          isOled: true,
        );

        expect(lightTheme.colorScheme.brightness, Brightness.light);
        expect(darkTheme.colorScheme.brightness, Brightness.dark);
        expect(oledTheme.colorScheme.surface, const Color(0xFF000000));
      }
    });
  });
}
