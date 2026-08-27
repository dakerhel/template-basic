import 'package:flutter/material.dart';

class AppLanguage {
  const AppLanguage(this.locale, this.nativeName);

  final Locale? locale;
  final String nativeName;
}

const appLanguages = <AppLanguage>[
  AppLanguage(Locale('ru'), 'Русский'),
  AppLanguage(Locale('en'), 'English'),
  AppLanguage(Locale('es'), 'Español'),
  AppLanguage(Locale('zh'), '中文'),
  AppLanguage(Locale('hi'), 'हिन्दी'),
  AppLanguage(Locale('ar'), 'العربية'),
  AppLanguage(Locale('fr'), 'Français'),
  AppLanguage(Locale('de'), 'Deutsch'),
  AppLanguage(Locale('pt'), 'Português'),
  AppLanguage(Locale('ja'), '日本語'),
  AppLanguage(Locale('ko'), '한국어'),
  AppLanguage(Locale('tr'), 'Türkçe'),
  AppLanguage(Locale('it'), 'Italiano'),
  AppLanguage(Locale('id'), 'Bahasa Indonesia'),
];
