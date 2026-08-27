import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/notifications/notification_service.dart';
import '../di.dart';
import '../domain/entities/app_update.dart';
import 'update_settings_provider.dart';

sealed class UpdateState {
  const UpdateState();
}

final class UpdateIdle extends UpdateState {
  const UpdateIdle();
}

final class UpdateChecking extends UpdateState {
  const UpdateChecking();
}

final class UpdateUpToDate extends UpdateState {
  const UpdateUpToDate();
}

final class UpdateAvailable extends UpdateState {
  const UpdateAvailable(this.update);

  final AppUpdate update;
}

final class UpdateDownloading extends UpdateState {
  const UpdateDownloading(this.update, this.progress);

  final AppUpdate update;
  final double progress;
}

final class UpdateError extends UpdateState {
  const UpdateError(this.error, {required this.isCheck});

  final Object error;
  final bool isCheck;
}

final updateControllerProvider =
    NotifierProvider<UpdateController, UpdateState>(UpdateController.new);

final class UpdateController extends Notifier<UpdateState> {
  static const _lastCheckKey = 'last_update_check_ms';

  @override
  UpdateState build() => const UpdateIdle();

  Future<void> checkForUpdate({
    bool silent = false,
    String Function(String version)? notifTitleBuilder,
    String? notifBody,
  }) async {
    if (!silent) state = const UpdateChecking();
    try {
      final update =
          await ref.read(updateRepositoryProvider).checkForUpdate();
      if (update != null) {
        state = UpdateAvailable(update);
        if (silent && notifTitleBuilder != null) {
          final prefs = await SharedPreferences.getInstance();
          final notify = prefs.getBool('notify_updates') ?? true;
          if (notify) {
            await NotificationService.showUpdateAvailable(
              update.version,
              notifTitleBuilder(update.version),
              notifBody ?? '',
            );
          }
        }
      } else {
        state = const UpdateUpToDate();
      }
    } catch (e) {
      state = silent ? const UpdateIdle() : UpdateError(e, isCheck: true);
    }
  }

  Future<void> downloadAndInstall() async {
    final current = state;
    if (current is! UpdateAvailable) return;
    try {
      state = UpdateDownloading(current.update, 0);
      final repo = ref.read(updateRepositoryProvider);
      final path = await repo.downloadUpdate(
        current.update,
        onProgress: (received, total) {
          if (total != null && total > 0) {
            state = UpdateDownloading(current.update, received / total);
          }
        },
      );
      await repo.installUpdate(current.update, path);
      state = const UpdateIdle();
    } catch (e) {
      state = UpdateError(e, isCheck: false);
    }
  }

  Future<void> maybeBackgroundCheck({
    required String Function(String version) notifTitleBuilder,
    required String notifBody,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final repo = ref.read(updateRepositoryProvider);
    await repo.cleanupOldDownloads();
    const minuteMs = 60000;
    if (!(prefs.getBool('background_check') ?? true)) return;
    final intervalMinutes =
        prefs.getInt('check_interval_minutes') ?? defaultCheckIntervalMinutes;
    final last = prefs.getInt(_lastCheckKey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - last < intervalMinutes * minuteMs) return;
    await checkForUpdate(
      silent: true,
      notifTitleBuilder: notifTitleBuilder,
      notifBody: notifBody,
    );
    if (state is! UpdateAvailable && state is! UpdateUpToDate) return;
    await prefs.setInt(_lastCheckKey, now);
    if (state is UpdateAvailable &&
        (prefs.getBool('background_install') ?? false)) {
      await downloadAndInstall();
    }
  }
}
