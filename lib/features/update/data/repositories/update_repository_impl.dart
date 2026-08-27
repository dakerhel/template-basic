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
    final response = await _dio.getUri<Map<String, dynamic>>(uri);
    final data = response.data;
    if (data == null) throw const UpdateFailure('Пустой ответ манифеста');
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
    final dir = await getApplicationCacheDirectory();
    final segments = Uri.parse(update.fileUrl).pathSegments;
    final urlName = segments.isNotEmpty ? segments.last : 'download';
    final ext = urlName.contains('.')
        ? urlName.substring(urlName.lastIndexOf('.'))
        : '';
    final savePath =
        '${dir.path}${Platform.pathSeparator}update-download$ext';
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

    _verifyChecksum(downloadedFile, update.sha256);
    return savePath;
  }

  void _verifyChecksum(File file, String? expectedSha256) {
    if (expectedSha256 == null || expectedSha256.isEmpty) return;
    if (!file.existsSync()) {
      throw const UpdateFailure('Файл для проверки контрольной суммы не найден');
    }
    final bytes = file.readAsBytesSync();
    final digest = sha256.convert(bytes);
    final actual = digest.toString();
    final expected = expectedSha256.toLowerCase().replaceAll(' ', '');
    if (actual != expected) {
      try {
        file.deleteSync();
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
          final isDownloadArtifact = name.startsWith('my_app-') ||
              name.startsWith('update-download');
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
}
