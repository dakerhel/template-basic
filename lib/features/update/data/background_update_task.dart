import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import '../../../core/config.dart';
import '../../../core/notifications/notification_service.dart';
import '../presentation/update_settings_provider.dart'
    show defaultCheckIntervalMinutes;
import 'repositories/update_repository_impl.dart';

const updateCheckTaskName = 'com.template.basic.updateCheck';
const _updateCheckUniqueName = 'update-check-periodic';

@pragma('vm:entry-point')
void callbackDispatcher() {
  // return гарантирует что Workmanager дождётся завершения async-задачи
  return Workmanager().executeTask((task, inputData) async {
    await NotificationService.init();
    await runBackgroundUpdateCheck();
    return true;
  });
}

class UpdateBackgroundScheduler {
  static Future<void> sync() async {
    final prefs = await SharedPreferences.getInstance();
    final enabled = prefs.getBool('background_check') ?? true;
    if (!enabled) {
      await Workmanager().cancelByUniqueName(_updateCheckUniqueName);
      return;
    }
    final intervalMinutes =
        prefs.getInt('check_interval_minutes') ?? defaultCheckIntervalMinutes;
    final frequency = Duration(minutes: intervalMinutes.clamp(15, 43200));
    await Workmanager().registerPeriodicTask(
      _updateCheckUniqueName,
      updateCheckTaskName,
      frequency: frequency,
      initialDelay: frequency,
      constraints: Constraints(networkType: NetworkType.connected),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.replace,
    );
  }
}

@visibleForTesting
Future<void> runBackgroundUpdateCheck() async {
  final prefs = await SharedPreferences.getInstance();
  if (!(prefs.getBool('background_check') ?? true)) return;
  final repo = UpdateRepositoryImpl(
    Dio(
      BaseOptions(
        // Явные таймауты чтобы фоновая задача не зависала при недоступном сервере
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: true,
        maxRedirects: 5,
      ),
    ),
  );
  try {
    await repo.cleanupOldDownloads();
    final update = await repo.checkForUpdate();
    if (update == null) return;
    final notify = prefs.getBool('notify_updates') ?? true;
    if (notify) {
      await NotificationService.showUpdateAvailable(
        AppConfig.appName,
        update.notes ?? 'Доступно обновление ${update.version}',
      );
    }
    if (prefs.getBool('background_install') ?? false) {
      final path = await repo.downloadUpdate(update);
      await repo.installUpdate(update, path);
    }
  } on Exception {
    return;
  }
}
