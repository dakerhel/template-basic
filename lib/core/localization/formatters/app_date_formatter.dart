import 'package:intl/intl.dart';

abstract final class AppDateFormatter {
  /// Относительное время («только что», «5 мин. назад», «вчера», «2 дня назад»)
  static String formatRelative(DateTime dateTime, {String? locale}) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final lang = locale ?? 'en';
    final isRu = lang.startsWith('ru');

    if (difference.isNegative || difference.inSeconds < 45) {
      return isRu ? 'только что' : 'just now';
    }

    if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      if (isRu) {
        return '$minutes ${_pluralMinutesRu(minutes)} назад';
      }
      return '$minutes ${minutes == 1 ? 'min' : 'mins'} ago';
    }

    if (difference.inHours < 24) {
      final hours = difference.inHours;
      if (isRu) {
        return '$hours ${_pluralHoursRu(hours)} назад';
      }
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    }

    if (difference.inDays == 1) {
      final timeStr = DateFormat.Hm(locale).format(dateTime);
      return isRu ? 'вчера в $timeStr' : 'yesterday at $timeStr';
    }

    if (difference.inDays < 7) {
      final days = difference.inDays;
      if (isRu) {
        return '$days ${_pluralDaysRu(days)} назад';
      }
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    }

    // Если больше недели — выводим локализованную дату
    return DateFormat.yMMMd(locale).format(dateTime);
  }

  /// Полная локализованная дата («28 августа 2026 г.» / «August 28, 2026»)
  static String formatFullDate(DateTime dateTime, {String? locale}) {
    return DateFormat.yMMMMd(locale).format(dateTime);
  }

  /// Краткая дата («28.08.2026» / «8/28/2026»)
  static String formatShortDate(DateTime dateTime, {String? locale}) {
    return DateFormat.yMd(locale).format(dateTime);
  }

  /// Время («14:30» / «2:30 PM»)
  static String formatTime(DateTime dateTime, {String? locale}) {
    return DateFormat.jm(locale).format(dateTime);
  }

  /// Дата и время («28 авг., 14:30»)
  static String formatDateTime(DateTime dateTime, {String? locale}) {
    return DateFormat.yMMMd(locale).add_jm().format(dateTime);
  }

  static String _pluralMinutesRu(int n) {
    final mod10 = n % 10;
    final mod100 = n % 100;
    if (mod100 >= 11 && mod100 <= 19) return 'минут';
    if (mod10 == 1) return 'минуту';
    if (mod10 >= 2 && mod10 <= 4) return 'минуты';
    return 'минут';
  }

  static String _pluralHoursRu(int n) {
    final mod10 = n % 10;
    final mod100 = n % 100;
    if (mod100 >= 11 && mod100 <= 19) return 'часов';
    if (mod10 == 1) return 'час';
    if (mod10 >= 2 && mod10 <= 4) return 'часа';
    return 'часов';
  }

  static String _pluralDaysRu(int n) {
    final mod10 = n % 10;
    final mod100 = n % 100;
    if (mod100 >= 11 && mod100 <= 19) return 'дней';
    if (mod10 == 1) return 'день';
    if (mod10 >= 2 && mod10 <= 4) return 'дня';
    return 'дней';
  }
}
