import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../models/device_info_model.dart';

abstract final class DeviceInfoService {
  static final DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  static Future<DeviceInfoModel> getDeviceInfo() async {
    String platform = 'Unknown';
    String osVersion = 'Unknown';
    String deviceModel = 'Unknown';
    String manufacturer = 'Unknown';
    bool isPhysicalDevice = true;

    final now = DateTime.now();
    final timeZone = now.timeZoneName;
    final offsetHours = now.timeZoneOffset.inHours;
    final offsetSign = offsetHours >= 0 ? '+' : '';
    final timeZoneOffset = 'UTC$offsetSign$offsetHours';
    final locale = Platform.localeName;

    try {
      if (kIsWeb) {
        final web = await _plugin.webBrowserInfo;
        platform = 'Web';
        osVersion = web.userAgent ?? 'Unknown Browser';
        deviceModel = web.browserName.name;
        manufacturer = web.vendor ?? 'Unknown';
      } else if (Platform.isAndroid) {
        final android = await _plugin.androidInfo;
        platform = 'Android';
        osVersion =
            'Android ${android.version.release} (API ${android.version.sdkInt})';
        deviceModel = android.model;
        manufacturer = android.manufacturer;
        isPhysicalDevice = android.isPhysicalDevice;
      } else if (Platform.isIOS) {
        final ios = await _plugin.iosInfo;
        platform = 'iOS';
        osVersion = '${ios.systemName} ${ios.systemVersion}';
        deviceModel = ios.utsname.machine;
        manufacturer = 'Apple';
        isPhysicalDevice = ios.isPhysicalDevice;
      } else if (Platform.isWindows) {
        final windows = await _plugin.windowsInfo;
        platform = 'Windows';
        osVersion =
            'Windows ${windows.majorVersion}.${windows.minorVersion} (Build ${windows.buildNumber})';
        deviceModel = windows.computerName;
        manufacturer = windows.registeredOwner.isNotEmpty
            ? windows.registeredOwner
            : 'PC';
      } else if (Platform.isMacOS) {
        final macos = await _plugin.macOsInfo;
        platform = 'macOS';
        osVersion = '${macos.osRelease} (Build ${macos.kernelVersion})';
        deviceModel = macos.model;
        manufacturer = 'Apple';
      } else if (Platform.isLinux) {
        final linux = await _plugin.linuxInfo;
        platform = 'Linux';
        osVersion = linux.prettyName;
        deviceModel = linux.name;
        manufacturer = linux.id;
      }
    } catch (_) {
      platform = Platform.operatingSystem;
      osVersion = Platform.operatingSystemVersion;
    }

    return DeviceInfoModel(
      platform: platform,
      osVersion: osVersion,
      deviceModel: deviceModel,
      manufacturer: manufacturer,
      isPhysicalDevice: isPhysicalDevice,
      locale: locale,
      timeZone: timeZone,
      timeZoneOffset: timeZoneOffset,
    );
  }
}
