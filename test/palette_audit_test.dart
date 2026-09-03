import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/locale/locale_provider.dart';
import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/app_theme.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/font_provider.dart';
import 'package:my_app/core/theme/liquid_glass_provider.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';
import 'package:my_app/core/theme/widgets/app_ambient_background.dart';
import 'package:my_app/features/home/presentation/home_screen.dart';
import 'package:my_app/features/security/data/security_repository_impl.dart';
import 'package:my_app/features/security/domain/models/security_settings.dart';
import 'package:my_app/features/security/domain/repositories/security_repository.dart';
import 'package:my_app/features/security/presentation/controllers/security_controller.dart';
import 'package:my_app/features/settings/presentation/settings_screen.dart';
import 'package:my_app/features/showcase/presentation/showcase_screen.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSecurityRepository implements SecurityRepository {
  String? savedPin = '1234';
  SecuritySettings currentSettings = const SecuritySettings(isPinEnabled: true);
  LockoutInfo currentLockout = const LockoutInfo();

  @override
  Future<bool> hasPin() async => savedPin != null;

  @override
  Future<bool> verifyPin(String pin) async => pin == savedPin;

  @override
  Future<void> setPin(String pin) async {
    savedPin = pin;
    currentSettings = currentSettings.copyWith(isPinEnabled: true);
  }

  @override
  Future<void> removePin() async {
    savedPin = null;
    currentSettings = currentSettings.copyWith(
      isPinEnabled: false,
      isBiometricsEnabled: false,
    );
  }

  @override
  Future<bool> canCheckBiometrics() async => true;

  @override
  Future<bool> authenticateWithBiometrics({required String reason}) async =>
      true;

  @override
  Future<SecuritySettings> loadSettings() async => currentSettings;

  @override
  Future<void> saveSettings(SecuritySettings settings) async {
    currentSettings = settings;
  }

  @override
  Future<LockoutInfo> getLockoutInfo() async => currentLockout;

  @override
  Future<LockoutInfo> recordFailedAttempt() async => currentLockout;

  @override
  Future<void> resetLockout() async {
    currentLockout = const LockoutInfo();
  }
}

void main() {
  const outputDir =
      r'C:\Users\pavel\.gemini\antigravity-ide\brain\14337031-28ec-457d-bc19-f3019527f1fc\screenshots';

  setUpAll(() async {
    Directory(outputDir).createSync(recursive: true);
    TestWidgetsFlutterBinding.ensureInitialized();

    PackageInfo.setMockInitialValues(
      appName: 'Template Basic',
      packageName: 'com.example.template_basic',
      version: '1.0.53',
      buildNumber: '54',
      buildSignature: 'mock',
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/workmanager'),
      (MethodCall methodCall) async => true,
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('dev.fluttercommunity.plus/connectivity'),
      (MethodCall methodCall) async => ['wifi'],
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/package_info_plus'),
      (MethodCall methodCall) async => {
        'appName': 'Template Basic',
        'packageName': 'com.example.template_basic',
        'version': '1.0.53',
        'buildNumber': '54',
        'buildSignature': 'mock',
      },
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/local_auth'),
      (MethodCall methodCall) async => true,
    );

    // Load real fonts
    final interBytes = await File('assets/fonts/Inter.ttf').readAsBytes();
    final fontLoaderInter = FontLoader('Inter');
    fontLoaderInter.addFont(Future.value(ByteData.view(interBytes.buffer)));
    await fontLoaderInter.load();

    final iconsPath =
        r'E:\Tools\flutter\bin\cache\artifacts\material_fonts\MaterialIcons-Regular.otf';
    if (File(iconsPath).existsSync()) {
      final iconBytes = await File(iconsPath).readAsBytes();
      final fontLoaderIcons = FontLoader('MaterialIcons');
      fontLoaderIcons.addFont(Future.value(ByteData.view(iconBytes.buffer)));
      await fontLoaderIcons.load();
    }
  });

  Future<void> captureScreen({
    required WidgetTester tester,
    required Widget child,
    required String filename,
    required AppColorPalette palette,
  }) async {
    await tester.pumpWidget(const SizedBox());
    tester.view.physicalSize = const Size(412 * 2, 915 * 2);
    tester.view.devicePixelRatio = 2.0;

    SharedPreferences.setMockInitialValues({
      'app_color_palette_id': palette.id,
      'app_theme_mode': AppThemeMode.light.name,
      'app_language_code': 'ru',
      'app_font_family': 'Inter',
      'app_font_scale_delta': 0.0,
      'app_liquid_glass_enabled': true,
      'last_run_version': '1.0.53',
      'permission_onboarding_completed': true,
      'notifications_enabled': true,
      'periodic_reminder': true,
      'background_check': false,
      'profile_custom_name': 'Алексей Смирнов',
      'profile_custom_email': 'alex.smirnov@company.dev',
    });

    final repaintKey = GlobalKey();
    final theme = AppTheme.light(palette: palette, fontFamily: 'Inter');
    final fakeRepo = _MockSecurityRepository();

    final container = ProviderContainer(
      overrides: [
        securityRepositoryProvider.overrideWithValue(fakeRepo),
      ],
    );
    container.read(colorPaletteProvider);
    container.read(themeModeProvider);
    container.read(liquidGlassProvider);
    container.read(localeProvider);
    container.read(fontProvider);
    container.read(securityControllerProvider);
    await tester.pump(const Duration(milliseconds: 50));
    await container.read(colorPaletteProvider.notifier).setPalette(palette);
    await container.read(themeModeProvider.notifier).setThemeMode(AppThemeMode.light);
    await container.read(liquidGlassProvider.notifier).setLiquidGlassEnabled(true);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ru'),
          home: Scaffold(
            backgroundColor: Colors.transparent,
            body: RepaintBoundary(
              key: repaintKey,
              child: AppAmbientBackground(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    await tester.runAsync(() async {
      final boundary =
          repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 1.0);
      final byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      final pngBytes = byteData!.buffer.asUint8List();

      final file = File('$outputDir/$filename');
      await file.writeAsBytes(pngBytes);
    });
  }

  testWidgets('Generate Light Theme Audit for all 9 palettes', (tester) async {
    for (final palette in AppColorPalette.values) {
      // 1. Home
      await captureScreen(
        tester: tester,
        child: const HomeScreen(),
        filename: 'audit_light_${palette.name}_01_home.png',
        palette: palette,
      );

      // 2. Showcase
      await captureScreen(
        tester: tester,
        child: const ShowcaseScreen(),
        filename: 'audit_light_${palette.name}_02_showcase.png',
        palette: palette,
      );

      // 3. Settings
      await captureScreen(
        tester: tester,
        child: const SettingsScreen(),
        filename: 'audit_light_${palette.name}_03_settings.png',
        palette: palette,
      );
    }
  });
}
