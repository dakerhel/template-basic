import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract final class NativeIntentLauncher {
  /// Открывает настройки работы в фоне / оптимизации батареи с каскадным fallback для OriginOS, MIUI, HyperOS, ColorOS, OneUI и AOSP
  static Future<bool> openBatteryOptimizationSettings() async {
    if (!Platform.isAndroid) return false;
    final info = await PackageInfo.fromPlatform();
    final packageName = info.packageName;

    // 1. Попытка открыть список оптимизации батареи системы
    try {
      final intent = const AndroidIntent(
        action: 'android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS',
      );
      await intent.launch();
      return true;
    } catch (_) {
      // fallback
    }

    // 2. Попытка запросить игнорирование для конкретного пакета
    try {
      final intent = AndroidIntent(
        action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
        data: 'package:$packageName',
      );
      await intent.launch();
      return true;
    } catch (_) {
      // fallback
    }

    // 3. Гарантированный fallback: страница "О приложении" (работает на OriginOS, MIUI, Vivo, Xiaomi, Samsung)
    return openAppDetailsSettings();
  }

  /// Открывает страницу разрешений на установку из неизвестных источников
  static Future<bool> openInstallPermissionSettings() async {
    if (!Platform.isAndroid) return false;
    final info = await PackageInfo.fromPlatform();
    final packageName = info.packageName;

    // 1. Прямой Intent для конкретного приложения (Android 8.0+)
    try {
      final intent = AndroidIntent(
        action: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
        data: 'package:$packageName',
      );
      await intent.launch();
      return true;
    } catch (_) {
      // fallback
    }

    // 2. Общий список приложений
    try {
      const intent = AndroidIntent(
        action: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
      );
      await intent.launch();
      return true;
    } catch (_) {
      // fallback
    }

    // 3. Fallback на страницу приложения
    return openAppDetailsSettings();
  }

  /// Открывает настройки уведомлений приложения
  static Future<bool> openNotificationSettings() async {
    if (!Platform.isAndroid) return false;
    final info = await PackageInfo.fromPlatform();
    final packageName = info.packageName;

    // 1. Прямой Intent настроек уведомлений
    try {
      final intent = AndroidIntent(
        action: 'android.settings.APP_NOTIFICATION_SETTINGS',
        arguments: <String, String>{
          'android.provider.extra.APP_PACKAGE': packageName,
          'app_package': packageName,
          'app_uid': info.buildNumber,
        },
      );
      await intent.launch();
      return true;
    } catch (_) {
      // fallback
    }

    // 2. Fallback на страницу приложения
    return openAppDetailsSettings();
  }

  /// Универсальный переход в настройки приложения "О приложении", где есть управление батареей, разрешениями и автозапуском
  static Future<bool> openAppDetailsSettings() async {
    if (!Platform.isAndroid) return false;
    try {
      final info = await PackageInfo.fromPlatform();
      final intent = AndroidIntent(
        action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
        data: 'package:${info.packageName}',
      );
      await intent.launch();
      return true;
    } catch (_) {
      try {
        const fallback = AndroidIntent(action: 'android.settings.SETTINGS');
        await fallback.launch();
        return true;
      } catch (_) {
        return false;
      }
    }
  }
}
