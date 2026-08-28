import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_info_model.dart';
import '../models/device_info_model.dart';
import '../models/network_status_model.dart';
import '../services/app_info_service.dart';
import '../services/device_info_service.dart';

final deviceInfoProvider = FutureProvider<DeviceInfoModel>((ref) async {
  return await DeviceInfoService.getDeviceInfo();
});

final appInfoProvider = FutureProvider<AppInfoModel>((ref) async {
  return await AppInfoService.getAppInfo();
});

final networkStatusProvider = FutureProvider<NetworkStatusModel>((ref) async {
  return await NetworkStatusModel.check();
});
