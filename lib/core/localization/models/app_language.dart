import 'package:flutter/widgets.dart';

enum AppLanguage {
  english(
    code: 'en',
    nativeName: 'English',
    englishName: 'English',
    flagEmoji: '🇺🇸',
    isRtl: false,
    defaultCurrency: 'USD',
  ),
  russian(
    code: 'ru',
    nativeName: 'Русский',
    englishName: 'Russian',
    flagEmoji: '🇷🇺',
    isRtl: false,
    defaultCurrency: 'RUB',
  ),
  chinese(
    code: 'zh',
    nativeName: '中文',
    englishName: 'Chinese',
    flagEmoji: '🇨🇳',
    isRtl: false,
    defaultCurrency: 'CNY',
  ),
  spanish(
    code: 'es',
    nativeName: 'Español',
    englishName: 'Spanish',
    flagEmoji: '🇪🇸',
    isRtl: false,
    defaultCurrency: 'EUR',
  ),
  portuguese(
    code: 'pt',
    nativeName: 'Português',
    englishName: 'Portuguese',
    flagEmoji: '🇧🇷',
    isRtl: false,
    defaultCurrency: 'BRL',
  ),
  german(
    code: 'de',
    nativeName: 'Deutsch',
    englishName: 'German',
    flagEmoji: '🇩🇪',
    isRtl: false,
    defaultCurrency: 'EUR',
  ),
  french(
    code: 'fr',
    nativeName: 'Français',
    englishName: 'French',
    flagEmoji: '🇫🇷',
    isRtl: false,
    defaultCurrency: 'EUR',
  ),
  italian(
    code: 'it',
    nativeName: 'Italiano',
    englishName: 'Italian',
    flagEmoji: '🇮🇹',
    isRtl: false,
    defaultCurrency: 'EUR',
  ),
  japanese(
    code: 'ja',
    nativeName: '日本語',
    englishName: 'Japanese',
    flagEmoji: '🇯🇵',
    isRtl: false,
    defaultCurrency: 'JPY',
  ),
  korean(
    code: 'ko',
    nativeName: '한국어',
    englishName: 'Korean',
    flagEmoji: '🇰🇷',
    isRtl: false,
    defaultCurrency: 'KRW',
  ),
  turkish(
    code: 'tr',
    nativeName: 'Türkçe',
    englishName: 'Turkish',
    flagEmoji: '🇹🇷',
    isRtl: false,
    defaultCurrency: 'TRY',
  ),
  indonesian(
    code: 'id',
    nativeName: 'Bahasa Indonesia',
    englishName: 'Indonesian',
    flagEmoji: '🇮🇩',
    isRtl: false,
    defaultCurrency: 'IDR',
  ),
  arabic(
    code: 'ar',
    nativeName: 'العربية',
    englishName: 'Arabic',
    flagEmoji: '🇸🇦',
    isRtl: true,
    defaultCurrency: 'SAR',
  ),
  hindi(
    code: 'hi',
    nativeName: 'हिन्दी',
    englishName: 'Hindi',
    flagEmoji: '🇮🇳',
    isRtl: false,
    defaultCurrency: 'INR',
  );

  const AppLanguage({
    required this.code,
    required this.nativeName,
    required this.englishName,
    required this.flagEmoji,
    required this.isRtl,
    required this.defaultCurrency,
  });

  final String code;
  final String nativeName;
  final String englishName;
  final String flagEmoji;
  final bool isRtl;
  final String defaultCurrency;

  Locale get locale => Locale(code);
  TextDirection get textDirection =>
      isRtl ? TextDirection.rtl : TextDirection.ltr;

  static const AppLanguage defaultLanguage = AppLanguage.english;
  static const AppLanguage fallbackLanguage = AppLanguage.english;

  static AppLanguage fromLocale(Locale? locale) {
    if (locale == null) return defaultLanguage;
    return fromCode(locale.languageCode);
  }

  static AppLanguage fromCode(String? code) {
    if (code == null) return defaultLanguage;
    for (final lang in values) {
      if (lang.code == code) return lang;
    }
    return defaultLanguage;
  }
}
