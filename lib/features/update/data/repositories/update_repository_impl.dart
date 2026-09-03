import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/config.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/version_compare.dart';
import '../../domain/entities/app_update.dart';
import '../../domain/repositories/update_repository.dart';
import '../update_installer.dart';

final class UpdateRepositoryImpl implements UpdateRepository {
  UpdateRepositoryImpl(this._dio, [UpdateInstaller? installer])
    : _installer = installer ?? createInstaller();

  final Dio _dio;
  final UpdateInstaller _installer;

  @override
  Future<AppUpdate?> checkForUpdate() async {
    final uri = Uri.parse(AppConfig.updateManifestUrl);
    _validateHttps(uri);

    final response = await _dio.getUri<dynamic>(
      uri,
      options: Options(responseType: ResponseType.plain),
    );
    final rawData = response.data;
    if (rawData == null) throw const UpdateFailure('Пустой ответ манифеста');

    final Map<String, dynamic> data;
    if (rawData is Map<String, dynamic>) {
      data = rawData;
    } else if (rawData is String) {
      try {
        data = jsonDecode(rawData) as Map<String, dynamic>;
      } catch (_) {
        throw const UpdateFailure('Не удалось разобрать JSON манифеста');
      }
    } else {
      throw const UpdateFailure('Неверный формат манифеста');
    }

    final update = AppUpdate.fromJson(data, Platform.operatingSystem, uri);
    final info = await PackageInfo.fromPlatform();
    final minSupported = update.minSupported;
    final isForced =
        minSupported != null && compareVersions(info.version, minSupported) < 0;
    final resolved = isForced ? update.withRequired(true) : update;
    final isNewer = compareVersions(update.version, info.version) > 0;
    return isNewer ? resolved : null;
  }

  @override
  Future<String> downloadUpdate(
    AppUpdate update, {
    void Function(int received, int? total)? onProgress,
  }) async {
    final updateUri = Uri.parse(update.fileUrl);
    _validateHttps(updateUri);

    final dir = await getApplicationCacheDirectory();
    final ext = _sanitizeExtension(updateUri.path);
    final savePath =
        '${dir.path}${Platform.pathSeparator}app-update-package$ext';
    final targetFile = File(savePath);

    // Гарантируем существование директории кеша
    if (!await targetFile.parent.exists()) {
      await targetFile.parent.create(recursive: true);
    }
    if (await targetFile.exists()) {
      try {
        await targetFile.delete();
      } on FileSystemException {
        // best effort cleanup
      }
    }

    await _dio.download(
      update.fileUrl,
      savePath,
      onReceiveProgress: onProgress,
    );

    final downloadedFile = File(savePath);
    if (!await downloadedFile.exists()) {
      throw const UpdateFailure('Файл обновления не был сохранён на диск');
    }

    await _verifyChecksum(downloadedFile, update.sha256);
    return savePath;
  }

  Future<void> _verifyChecksum(File file, String? expectedSha256) async {
    if (expectedSha256 == null || expectedSha256.trim().isEmpty) {
      try {
        await file.delete();
      } on FileSystemException {
        // best effort cleanup
      }
      throw const UpdateFailure(
        'Отсутствует обязательная контрольная сумма SHA-256 в манифесте обновления',
      );
    }
    if (!await file.exists()) {
      throw const UpdateFailure(
        'Файл для проверки контрольной суммы не найден',
      );
    }
    // Потоковое вычисление SHA-256 без загрузки всего файла (50-150 МБ) в RAM (защита от OOM)
    final digest = await sha256.bind(file.openRead()).first;
    final actual = digest.toString().toLowerCase();
    final expected = expectedSha256.toLowerCase().replaceAll(' ', '');

    if (!_constantTimeEquals(actual, expected)) {
      try {
        await file.delete();
      } on FileSystemException {
        // best effort cleanup
      }
      throw UpdateFailure(
        'Контрольная сумма не совпадает: ожидалось $expected, получено $actual',
      );
    }
  }

  @override
  Future<void> cleanupOldDownloads() async {
    final now = DateTime.now();
    for (final dir in await _downloadDirectories()) {
      List<FileSystemEntity> entities;
      try {
        entities = dir.listSync();
      } on Exception {
        continue;
      }
      for (final entity in entities) {
        if (entity is! File) continue;
        try {
          final name = entity.uri.pathSegments.last;
          final isDownloadArtifact =
              name.startsWith('my_app-') ||
              name.startsWith('update-download') ||
              name.startsWith('app-update-package');
          if (!isDownloadArtifact) continue;
          final stat = entity.statSync();
          final isStale =
              now.difference(stat.modified) > const Duration(hours: 24);
          if (name.startsWith('my_app-') || isStale) {
            await entity.delete();
          }
        } on Exception {
          continue;
        }
      }
    }
  }

  Future<List<Directory>> _downloadDirectories() async {
    final dirs = <Directory>[];
    try {
      dirs.add(await getApplicationDocumentsDirectory());
    } on Exception {
      // ignore
    }
    try {
      dirs.add(await getApplicationCacheDirectory());
    } on Exception {
      // ignore
    }
    return dirs;
  }

  @override
  Future<void> installUpdate(AppUpdate update, String filePath) {
    return _installer.install(filePath, update);
  }

  static void _validateHttps(Uri uri) {
    // Разрешаем только HTTPS для защиты от MITM-атак при загрузке APK
    if (!uri.hasScheme || uri.scheme != 'https') {
      throw const UpdateFailure(
        'Недопустимый протокол URL обновления. Требуется HTTPS.',
      );
    }
  }

  static String _sanitizeExtension(String path) {
    const allowed = ['.apk', '.exe', '.dmg', '.zip', '.appimage'];
    final lower = path.toLowerCase();
    for (final ext in allowed) {
      if (lower.endsWith(ext)) return ext;
    }
    return '.apk';
  }

  static bool _constantTimeEquals(String a, String b) {
    if (a.length != b.length) return false;
    int result = 0;
    for (int i = 0; i < a.length; i++) {
      result |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
    }
    return result == 0;
  }
}
