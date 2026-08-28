import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/device/device.dart';

void main() {
  group('ScreenMetricsModel', () {
    test('calculates portrait and phone metrics accurately', () {
      const mediaQuery = MediaQueryData(
        size: Size(390, 844),
        devicePixelRatio: 3.0,
      );

      final metrics = ScreenMetricsModel.fromMediaQuery(mediaQuery);
      expect(metrics.width, 390.0);
      expect(metrics.height, 844.0);
      expect(metrics.pixelRatio, 3.0);
      expect(metrics.isPortrait, isTrue);
      expect(metrics.isLandscape, isFalse);
      expect(metrics.isTablet, isFalse);
      expect(metrics.resolutionString, contains('1170 × 2532 px'));
    });

    test('calculates tablet and landscape metrics accurately', () {
      const mediaQuery = MediaQueryData(
        size: Size(1024, 768),
        devicePixelRatio: 2.0,
      );

      final metrics = ScreenMetricsModel.fromMediaQuery(mediaQuery);
      expect(metrics.isTablet, isTrue);
      expect(metrics.isLandscape, isTrue);
      expect(metrics.isPortrait, isFalse);
      expect(metrics.resolutionString, contains('2048 × 1536 px'));
    });
  });

  group('AppInfoModel', () {
    test('formats full version and detects environment', () {
      const app = AppInfoModel(
        appName: 'My App',
        packageName: 'com.example.app',
        version: '1.0.35',
        buildNumber: '36',
        coreVersion: '1.5.0',
        environment: 'Debug',
      );

      expect(app.fullVersion, '1.0.35 (36)');
      expect(app.isDebug, isTrue);
      expect(app.isRelease, isFalse);

      final map = app.toMap();
      expect(map['appName'], 'My App');
      expect(map['version'], '1.0.35');
      expect(map['coreVersion'], '1.5.0');
    });
  });

  group('DeviceInfoModel', () {
    test('creates display name with manufacturer when available', () {
      const device = DeviceInfoModel(
        platform: 'Android',
        osVersion: 'Android 14 (API 34)',
        deviceModel: 'Pixel 8',
        manufacturer: 'Google',
        isPhysicalDevice: true,
        locale: 'ru_RU',
        timeZone: 'MSK',
        timeZoneOffset: 'UTC+3',
      );

      expect(device.displayName, 'Google Pixel 8');
      expect(device.toMap()['platform'], 'Android');
      expect(device.toMap()['timeZoneOffset'], 'UTC+3');
    });
  });

  group('AccessibilityInfoModel', () {
    test('detects enabled accessibility features', () {
      const normalData = MediaQueryData(
        boldText: false,
        highContrast: false,
        disableAnimations: false,
        accessibleNavigation: false,
        textScaler: TextScaler.linear(1.0),
      );
      final normal = AccessibilityInfoModel.fromMediaQuery(normalData);
      expect(normal.hasAccessibilityEnabled, isFalse);

      const highContrastData = MediaQueryData(
        boldText: true,
        highContrast: true,
        disableAnimations: false,
        accessibleNavigation: false,
        textScaler: TextScaler.linear(1.2),
      );
      final accessible = AccessibilityInfoModel.fromMediaQuery(
        highContrastData,
      );
      expect(accessible.hasAccessibilityEnabled, isTrue);
      expect(accessible.boldText, isTrue);
      expect(accessible.highContrast, isTrue);
      expect(accessible.textScaleFactor, 1.2);
    });
  });
}
