import 'package:intl/intl.dart';

abstract final class AppCurrencyFormatter {
  /// Локализованное форматирование валюты («100,00 ₽» / «$100.00» / «100,00 €»)
  static String formatCurrency(
    num amount, {
    String? currencyCode,
    String? locale,
    int? decimalDigits,
  }) {
    final format = NumberFormat.simpleCurrency(
      locale: locale,
      name: currencyCode,
      decimalDigits: decimalDigits,
    );
    return format.format(amount);
  }

  /// Компактная валюта («$1.5K», «1,5 млн ₽»)
  static String formatCompactCurrency(
    num amount, {
    String? currencyCode,
    String? locale,
  }) {
    final format = NumberFormat.compactCurrency(
      locale: locale,
      name: currencyCode,
    );
    return format.format(amount);
  }
}
