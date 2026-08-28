import 'package:intl/intl.dart';

abstract final class AppNumberFormatter {
  /// Локализованное форматирование числа («1 250,50» / «1,250.50»)
  static String formatDecimal(
    num value, {
    String? locale,
    int decimalDigits = 2,
  }) {
    final format = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: decimalDigits,
    );
    return format.format(value);
  }

  /// Целое число с разделителями тысяч («1 000 000» / «1,000,000»)
  static String formatInteger(num value, {String? locale}) {
    final format = NumberFormat.decimalPattern(locale);
    return format.format(value);
  }

  /// Компактное представление («1.5K», «3.4M»)
  static String formatCompact(num value, {String? locale}) {
    final format = NumberFormat.compact(locale: locale);
    return format.format(value);
  }

  /// Проценты («15.5%» / «15,5%»)
  static String formatPercent(
    num value, {
    String? locale,
    int decimalDigits = 1,
  }) {
    final format = NumberFormat.percentPattern(locale);
    format.minimumFractionDigits = decimalDigits;
    format.maximumFractionDigits = decimalDigits;
    return format.format(value);
  }
}
