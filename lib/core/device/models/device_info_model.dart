class DeviceInfoModel {
  const DeviceInfoModel({
    required this.platform,
    required this.osVersion,
    required this.deviceModel,
    required this.manufacturer,
    required this.isPhysicalDevice,
    required this.locale,
    required this.timeZone,
    required this.timeZoneOffset,
  });

  final String platform;
  final String osVersion;
  final String deviceModel;
  final String manufacturer;
  final bool isPhysicalDevice;
  final String locale;
  final String timeZone;
  final String timeZoneOffset;

  String get displayName => manufacturer.isNotEmpty && manufacturer != 'Unknown'
      ? '$manufacturer $deviceModel'
      : deviceModel;

  Map<String, dynamic> toMap() {
    return {
      'platform': platform,
      'osVersion': osVersion,
      'deviceModel': deviceModel,
      'manufacturer': manufacturer,
      'isPhysicalDevice': isPhysicalDevice,
      'locale': locale,
      'timeZone': timeZone,
      'timeZoneOffset': timeZoneOffset,
    };
  }
}
