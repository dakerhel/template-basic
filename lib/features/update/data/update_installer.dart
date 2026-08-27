import 'dart:io';

import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/error/failure.dart';
import '../domain/entities/app_update.dart';

abstract interface class UpdateInstaller {
  Future<void> install(String filePath, AppUpdate update);
}

UpdateInstaller createInstaller() {
  switch (Platform.operatingSystem) {
    case 'ios':
      return const IosStoreInstaller();
    case 'linux':
      return const LinuxAppImageInstaller();
    default:
      return const OpenFileInstaller();
  }
}

final class OpenFileInstaller implements UpdateInstaller {
  const OpenFileInstaller();

  @override
  Future<void> install(String filePath, AppUpdate update) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw const UpdateFailure('Файл обновления не найден на устройстве');
    }
    final result = await OpenFilex.open(filePath);
    if (result.type != ResultType.done) {
      throw UpdateFailure('Не удалось запустить установку: ${result.message}');
    }
  }
}

final class LinuxAppImageInstaller implements UpdateInstaller {
  const LinuxAppImageInstaller();

  @override
  Future<void> install(String filePath, AppUpdate update) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw const UpdateFailure('Файл обновления не найден на устройстве');
    }
    await Process.run('chmod', ['+x', filePath]);
    final result = await OpenFilex.open(filePath);
    if (result.type != ResultType.done) {
      throw UpdateFailure('Не удалось запустить установку: ${result.message}');
    }
  }
}

final class IosStoreInstaller implements UpdateInstaller {
  const IosStoreInstaller();

  @override
  Future<void> install(String filePath, AppUpdate update) async {
    final uri = Uri.parse(update.fileUrl);
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened) {
      throw const UpdateFailure('Не удалось открыть App Store');
    }
  }
}
