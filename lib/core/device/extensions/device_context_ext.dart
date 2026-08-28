import 'package:flutter/widgets.dart';

import '../models/accessibility_info_model.dart';
import '../models/screen_metrics_model.dart';

extension DeviceContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ScreenMetricsModel get screenMetrics =>
      ScreenMetricsModel.fromMediaQuery(mediaQuery);

  AccessibilityInfoModel get accessibilityInfo =>
      AccessibilityInfoModel.fromMediaQuery(mediaQuery);

  bool get isTablet => screenMetrics.isTablet;
  bool get isLandscape => screenMetrics.isLandscape;
  bool get isPortrait => screenMetrics.isPortrait;

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
}
