import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/models/app_language.dart';

export '../localization/errors/app_localized_error.dart';
export '../localization/extensions/localization_context_ext.dart';
export '../localization/formatters/app_currency_formatter.dart';
export '../localization/formatters/app_date_formatter.dart';
export '../localization/formatters/app_number_formatter.dart';
export '../localization/models/app_language.dart';
export '../localization/notifications/app_localized_notification.dart';

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);

final class LocaleController extends Notifier<Locale?> {
  static const _prefsKey = 'app_locale';

  @override
  Locale? build() {
    _restore();
    return null;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefsKey);
    if (code != null && code != state?.languageCode) {
      state = Locale(code);
    }
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_prefsKey);
    } else {
      await prefs.setString(_prefsKey, locale.languageCode);
    }
  }

  Future<void> setLanguage(AppLanguage language) async {
    await setLocale(language.locale);
  }

  Future<void> resetToSystem() async {
    await setLocale(null);
  }
}
