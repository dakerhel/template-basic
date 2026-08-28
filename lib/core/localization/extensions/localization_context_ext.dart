import 'package:flutter/widgets.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../formatters/app_currency_formatter.dart';
import '../formatters/app_date_formatter.dart';
import '../formatters/app_number_formatter.dart';
import '../models/app_language.dart';

extension LocalizationContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  Locale get currentLocale => Localizations.localeOf(this);
  AppLanguage get currentLanguage => AppLanguage.fromLocale(currentLocale);

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
  TextDirection get textDirection => Directionality.of(this);

  String formatRelativeDate(DateTime dateTime) {
    return AppDateFormatter.formatRelative(
      dateTime,
      locale: currentLocale.languageCode,
    );
  }

  String formatDate(DateTime dateTime) {
    return AppDateFormatter.formatFullDate(
      dateTime,
      locale: currentLocale.languageCode,
    );
  }

  String formatShortDate(DateTime dateTime) {
    return AppDateFormatter.formatShortDate(
      dateTime,
      locale: currentLocale.languageCode,
    );
  }

  String formatTime(DateTime dateTime) {
    return AppDateFormatter.formatTime(
      dateTime,
      locale: currentLocale.languageCode,
    );
  }

  String formatCurrency(num amount, [String? currencyCode]) {
    final currency = currencyCode ?? currentLanguage.defaultCurrency;
    return AppCurrencyFormatter.formatCurrency(
      amount,
      currencyCode: currency,
      locale: currentLocale.languageCode,
    );
  }

  String formatNumber(num value, [int decimalDigits = 2]) {
    return AppNumberFormatter.formatDecimal(
      value,
      locale: currentLocale.languageCode,
      decimalDigits: decimalDigits,
    );
  }

  String formatPercent(num value, [int decimalDigits = 1]) {
    return AppNumberFormatter.formatPercent(
      value,
      locale: currentLocale.languageCode,
      decimalDigits: decimalDigits,
    );
  }
}
