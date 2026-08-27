import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/background_update_task.dart';

const defaultCheckIntervalMinutes = 360;

class UpdateSettings {
  const UpdateSettings({
    this.backgroundCheck = true,
    this.intervalMinutes = defaultCheckIntervalMinutes,
    this.backgroundInstall = false,
    this.notifyUpdates = true,
  });

  final bool backgroundCheck;
  final int intervalMinutes;
  final bool backgroundInstall;
  final bool notifyUpdates;

  UpdateSettings copyWith({
    bool? backgroundCheck,
    int? intervalMinutes,
    bool? backgroundInstall,
    bool? notifyUpdates,
  }) {
    return UpdateSettings(
      backgroundCheck: backgroundCheck ?? this.backgroundCheck,
      intervalMinutes: intervalMinutes ?? this.intervalMinutes,
      backgroundInstall: backgroundInstall ?? this.backgroundInstall,
      notifyUpdates: notifyUpdates ?? this.notifyUpdates,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSettings &&
          other.backgroundCheck == backgroundCheck &&
          other.intervalMinutes == intervalMinutes &&
          other.backgroundInstall == backgroundInstall &&
          other.notifyUpdates == notifyUpdates;

  @override
  int get hashCode => Object.hash(
    backgroundCheck,
    intervalMinutes,
    backgroundInstall,
    notifyUpdates,
  );
}

// Минимум 15 минут — ограничение WorkManager на Android
const updateIntervalOptions = <int>[15, 60, 180, 360, 720, 1440];

final updateSettingsProvider =
    NotifierProvider<UpdateSettingsController, UpdateSettings>(
      UpdateSettingsController.new,
    );

final class UpdateSettingsController extends Notifier<UpdateSettings> {
  static const _checkKey = 'background_check';
  static const _intervalKey = 'check_interval_minutes';
  static const _installKey = 'background_install';
  static const _notifyKey = 'notify_updates';

  @override
  UpdateSettings build() {
    _restore();
    return const UpdateSettings();
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final restored = UpdateSettings(
      backgroundCheck: prefs.getBool(_checkKey) ?? true,
      intervalMinutes:
          prefs.getInt(_intervalKey) ?? defaultCheckIntervalMinutes,
      backgroundInstall: prefs.getBool(_installKey) ?? false,
      notifyUpdates: prefs.getBool(_notifyKey) ?? true,
    );
    if (restored != state) state = restored;
  }

  Future<void> setNotifyUpdates(bool value) async {
    state = state.copyWith(notifyUpdates: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notifyKey, value);
  }

  Future<void> setBackgroundCheck(bool value) async {
    state = state.copyWith(backgroundCheck: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_checkKey, value);
    await UpdateBackgroundScheduler.sync();
  }

  Future<void> setIntervalMinutes(int minutes) async {
    state = state.copyWith(intervalMinutes: minutes);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_intervalKey, minutes);
    await UpdateBackgroundScheduler.sync();
  }

  Future<void> setBackgroundInstall(bool value) async {
    state = state.copyWith(backgroundInstall: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_installKey, value);
  }
}
