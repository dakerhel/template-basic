import 'package:flutter/services.dart';

/// Централизованный безопасный контроллер тактильной отдачи (Haptic Feedback).
/// Предоставляет семантически понятные методы для различных типов пользовательских действий.
abstract final class AppHaptics {
  /// Лёгкий щелчок при переключении табов, чекбоксов, свитчей и пикеров.
  static Future<void> selection() async {
    try {
      await HapticFeedback.selectionClick();
    } catch (_) {}
  }

  /// Мягкий отклик при нажатии на стандартные кнопки и карточки.
  static Future<void> light() async {
    try {
      await HapticFeedback.lightImpact();
    } catch (_) {}
  }

  /// Средний отклик при подтверждении действий, открытии модальных окон.
  static Future<void> medium() async {
    try {
      await HapticFeedback.mediumImpact();
    } catch (_) {}
  }

  /// Сильный отклик при удалении данных, критических операциях (Danger action).
  static Future<void> heavy() async {
    try {
      await HapticFeedback.heavyImpact();
    } catch (_) {}
  }

  /// Тактильный паттерн успешного завершения операции (успешный тост, сохранение).
  static Future<void> success() async {
    try {
      await HapticFeedback.lightImpact();
      await Future<void>.delayed(const Duration(milliseconds: 60));
      await HapticFeedback.mediumImpact();
    } catch (_) {}
  }

  /// Тактильный паттерн ошибки или отказа доступа (ошибочный PIN, ошибка сети).
  static Future<void> error() async {
    try {
      await HapticFeedback.heavyImpact();
      await Future<void>.delayed(const Duration(milliseconds: 80));
      await HapticFeedback.heavyImpact();
    } catch (_) {}
  }

  /// Тактильный паттерн предупреждения.
  static Future<void> warning() async {
    try {
      await HapticFeedback.mediumImpact();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await HapticFeedback.lightImpact();
    } catch (_) {}
  }
}
