import 'package:flutter/foundation.dart';

class AppInfoModel {
  const AppInfoModel({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.coreVersion,
    required this.environment,
    this.installerStore,
  });

  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;
  final String coreVersion;
  final String environment;
  final String? installerStore;

  String get fullVersion => '$version ($buildNumber)';
  bool get isRelease => environment == 'Release';
  bool get isDebug => environment == 'Debug';

  static String detectEnvironment() {
    if (kReleaseMode) return 'Release';
    if (kProfileMode) return 'Profile';
    return 'Debug';
  }

  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'packageName': packageName,
      'version': version,
      'buildNumber': buildNumber,
      'coreVersion': coreVersion,
      'environment': environment,
      'installerStore': installerStore ?? 'Unknown',
    };
  }
}
