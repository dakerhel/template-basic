import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/locale/locale_provider.dart';

void main() {
  group('AppLanguage & RTL Support', () {
    test('contains all 14 supported languages', () {
      expect(AppLanguage.values.length, 14);
      final codes = AppLanguage.values.map((l) => l.code).toSet();
      expect(
        codes,
        containsAll([
          'en',
          'ru',
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
        ]),
      );
    });

    test('correctly identifies Arabic as RTL language', () {
      expect(AppLanguage.arabic.isRtl, isTrue);
      expect(AppLanguage.arabic.textDirection, TextDirection.rtl);

      // Other languages should be LTR
      expect(AppLanguage.english.isRtl, isFalse);
      expect(AppLanguage.english.textDirection, TextDirection.ltr);
      expect(AppLanguage.russian.isRtl, isFalse);
      expect(AppLanguage.chinese.isRtl, isFalse);
    });

    test('fromLocale and fromCode map with fallback', () {
      expect(AppLanguage.fromLocale(const Locale('ru')), AppLanguage.russian);
      expect(AppLanguage.fromLocale(const Locale('ar')), AppLanguage.arabic);
      expect(
        AppLanguage.fromLocale(const Locale('xx')),
        AppLanguage.defaultLanguage,
      );
      expect(AppLanguage.fromLocale(null), AppLanguage.defaultLanguage);

      expect(AppLanguage.fromCode('zh'), AppLanguage.chinese);
      expect(AppLanguage.fromCode('unknown'), AppLanguage.defaultLanguage);
      expect(AppLanguage.fromCode(null), AppLanguage.defaultLanguage);
    });

    test('each language has a valid flag emoji and default currency', () {
      for (final lang in AppLanguage.values) {
        expect(lang.flagEmoji, isNotEmpty);
        expect(lang.nativeName, isNotEmpty);
        expect(lang.englishName, isNotEmpty);
        expect(lang.defaultCurrency, isNotEmpty);
      }
    });
  });

  group('AppDateFormatter', () {
    test('formats relative time correctly in Russian and English', () {
      final now = DateTime.now();

      final justNow = now.subtract(const Duration(seconds: 10));
      expect(
        AppDateFormatter.formatRelative(justNow, locale: 'ru'),
        'только что',
      );
      expect(
        AppDateFormatter.formatRelative(justNow, locale: 'en'),
        'just now',
      );

      final minutesAgo = now.subtract(const Duration(minutes: 5));
      expect(
        AppDateFormatter.formatRelative(minutesAgo, locale: 'ru'),
        '5 минут назад',
      );
      expect(
        AppDateFormatter.formatRelative(minutesAgo, locale: 'en'),
        '5 mins ago',
      );

      final hoursAgo = now.subtract(const Duration(hours: 2));
      expect(
        AppDateFormatter.formatRelative(hoursAgo, locale: 'ru'),
        '2 часа назад',
      );
      expect(
        AppDateFormatter.formatRelative(hoursAgo, locale: 'en'),
        '2 hours ago',
      );
    });
  });

  group('AppNumberFormatter', () {
    test('formats decimals, percentages, and compact values', () {
      expect(
        AppNumberFormatter.formatDecimal(
          1234.56,
          locale: 'en',
          decimalDigits: 2,
        ),
        '1,234.56',
      );
      expect(AppNumberFormatter.formatCompact(1500, locale: 'en'), '1.5K');
      expect(
        AppNumberFormatter.formatPercent(0.155, locale: 'en', decimalDigits: 1),
        '15.5%',
      );
    });
  });

  group('AppCurrencyFormatter', () {
    test('formats currencies with proper symbols', () {
      final usd = AppCurrencyFormatter.formatCurrency(
        100,
        currencyCode: 'USD',
        locale: 'en',
      );
      expect(usd, contains('\$'));

      final rub = AppCurrencyFormatter.formatCurrency(
        100,
        currencyCode: 'RUB',
        locale: 'ru',
      );
      expect(rub, contains('₽'));
    });
  });
}
