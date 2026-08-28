import 'package:package_info_plus/package_info_plus.dart';

import '../../config.dart';
import '../models/app_info_model.dart';

abstract final class AppInfoService {
  static Future<AppInfoModel> getAppInfo() async {
    final pkg = await PackageInfo.fromPlatform();

    return AppInfoModel(
      appName: pkg.appName.isNotEmpty ? pkg.appName : AppConfig.appName,
      packageName: pkg.packageName,
      version: pkg.version.isNotEmpty ? pkg.version : '1.0.0',
      buildNumber: pkg.buildNumber.isNotEmpty ? pkg.buildNumber : '1',
      coreVersion: AppConfig.coreVersion,
      environment: AppInfoModel.detectEnvironment(),
      installerStore: pkg.installerStore,
    );
  }
}
