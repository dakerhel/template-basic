import '../entities/app_update.dart';

abstract interface class UpdateRepository {
  Future<AppUpdate?> checkForUpdate();
  Future<String> downloadUpdate(
    AppUpdate update, {
    void Function(int received, int? total)? onProgress,
  });
  Future<void> installUpdate(AppUpdate update, String filePath);
  Future<void> cleanupOldDownloads();
}
