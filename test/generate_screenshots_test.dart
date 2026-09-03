import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/device/presentation/sheets/system_diagnostics_sheet.dart';
import 'package:my_app/core/locale/locale_provider.dart';
import 'package:my_app/core/notifications/presentation/permission_onboarding_sheet.dart';
import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/app_theme.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/font_provider.dart';
import 'package:my_app/core/theme/liquid_glass_provider.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';
import 'package:my_app/core/theme/widgets/app_ambient_background.dart';
import 'package:my_app/features/home/presentation/home_screen.dart';
import 'package:my_app/features/profile/presentation/profile_screen.dart';
import 'package:my_app/features/security/data/security_repository_impl.dart';
import 'package:my_app/features/security/domain/models/security_settings.dart';
import 'package:my_app/features/security/domain/repositories/security_repository.dart';
import 'package:my_app/features/security/presentation/controllers/security_controller.dart';
import 'package:my_app/features/security/presentation/screens/lock_screen.dart';
import 'package:my_app/features/security/presentation/screens/privacy_shield_screen.dart';
import 'package:my_app/features/security/presentation/sheets/pin_setup_sheet.dart';
import 'package:my_app/features/settings/presentation/settings_screen.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/font_picker_sheet.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/language_picker_sheet.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/unified_theme_sheet.dart';
import 'package:my_app/features/showcase/presentation/showcase_screen.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const outputDir =
      r'C:\Users\pavel\.gemini\antigravity-ide\brain\14337031-28ec-457d-bc19-f3019527f1fc\screenshots';

  setUpAll(() async {
    Directory(outputDir).createSync(recursive: true);
    TestWidgetsFlutterBinding.ensureInitialized();

    PackageInfo.setMockInitialValues(
      appName: 'Template Basic',
      packageName: 'com.example.template_basic',
      version: '1.0.48',
      buildNumber: '49',
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
        'version': '1.0.48',
        'buildNumber': '49',
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
    AppColorPalette palette = AppColorPalette.indigoGold,
    Brightness brightness = Brightness.dark,
    bool isOled = false,
    bool isGlass = true,
  }) async {
    tester.view.physicalSize = const Size(412 * 2, 915 * 2);
    tester.view.devicePixelRatio = 2.0;

    SharedPreferences.setMockInitialValues({
      'app_color_palette_id': palette.id,
      'app_theme_mode': isOled
          ? AppThemeMode.oled.name
          : (brightness == Brightness.dark
              ? AppThemeMode.dark.name
              : AppThemeMode.light.name),
      'app_liquid_glass_enabled': isGlass,
      'last_run_version': '1.0.48',
      'background_check': false,
      'profile_custom_name': 'Алексей Смирнов',
      'profile_custom_email': 'alex.smirnov@company.dev',
    });

    final repaintKey = GlobalKey();

    final theme = brightness == Brightness.dark
        ? AppTheme.dark(palette: palette, fontFamily: 'Inter', isOled: isOled)
        : AppTheme.light(palette: palette, fontFamily: 'Inter');

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
    await container.read(themeModeProvider.notifier).setThemeMode(
          isOled
              ? AppThemeMode.oled
              : (brightness == Brightness.dark
                  ? AppThemeMode.dark
                  : AppThemeMode.light),
        );
    await container.read(liquidGlassProvider.notifier).setLiquidGlassEnabled(isGlass);

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

    // Pump frames for layout and animations
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump(const Duration(milliseconds: 600));

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

  testWidgets('Generate comprehensive screen audit screenshots', (tester) async {
    // 1. Home - Dark Glass (Indigo Gold)
    await captureScreen(
      tester: tester,
      child: const HomeScreen(),
      filename: 'screen_01_home_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 2. Home - Light Glass (Indigo Gold)
    await captureScreen(
      tester: tester,
      child: const HomeScreen(),
      filename: 'screen_02_home_light.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 3. Home - Light Solid (Indigo Gold)
    await captureScreen(
      tester: tester,
      child: const HomeScreen(),
      filename: 'screen_03_home_light_solid.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.light,
      isGlass: false,
    );

    // 4. Showcase - Dark Glass (Cyber Cyan)
    await captureScreen(
      tester: tester,
      child: const ShowcaseScreen(),
      filename: 'screen_04_showcase_dark.png',
      palette: AppColorPalette.cyberCyan,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 5. Showcase - Light Glass (Fuchsia Pine)
    await captureScreen(
      tester: tester,
      child: const ShowcaseScreen(),
      filename: 'screen_05_showcase_light.png',
      palette: AppColorPalette.fuchsiaPine,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 6. Showcase - Light Solid (Fuchsia Pine)
    await captureScreen(
      tester: tester,
      child: const ShowcaseScreen(),
      filename: 'screen_06_showcase_light_solid.png',
      palette: AppColorPalette.fuchsiaPine,
      brightness: Brightness.light,
      isGlass: false,
    );

    // 7. Profile - Dark Glass (Acid Violet)
    await captureScreen(
      tester: tester,
      child: const ProfileScreen(),
      filename: 'screen_07_profile_dark.png',
      palette: AppColorPalette.acidViolet,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 8. Profile - Light Glass (Acid Violet)
    await captureScreen(
      tester: tester,
      child: const ProfileScreen(),
      filename: 'screen_08_profile_light.png',
      palette: AppColorPalette.acidViolet,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 9. Profile - Light Solid (Acid Violet)
    await captureScreen(
      tester: tester,
      child: const ProfileScreen(),
      filename: 'screen_09_profile_light_solid.png',
      palette: AppColorPalette.acidViolet,
      brightness: Brightness.light,
      isGlass: false,
    );

    // 10. Settings - Dark Glass (Indigo Gold)
    await captureScreen(
      tester: tester,
      child: const SettingsScreen(),
      filename: 'screen_10_settings_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 11. Settings - Light Glass (Warm Amber)
    await captureScreen(
      tester: tester,
      child: const SettingsScreen(),
      filename: 'screen_11_settings_light.png',
      palette: AppColorPalette.warmAmber,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 12. Settings - Light Solid (Warm Amber)
    await captureScreen(
      tester: tester,
      child: const SettingsScreen(),
      filename: 'screen_12_settings_light_solid.png',
      palette: AppColorPalette.warmAmber,
      brightness: Brightness.light,
      isGlass: false,
    );

    // 13. Settings - Light Glass (Fuchsia Pine)
    await captureScreen(
      tester: tester,
      child: const SettingsScreen(),
      filename: 'screen_13_settings_fuchsiapine_light.png',
      palette: AppColorPalette.fuchsiaPine,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 14. Settings - Light Glass (Indigo Gold)
    await captureScreen(
      tester: tester,
      child: const SettingsScreen(),
      filename: 'screen_14_settings_indigogold_light.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 15. Lock Screen - Dark
    await captureScreen(
      tester: tester,
      child: const LockScreen(),
      filename: 'screen_15_lock_screen_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 16. Privacy Shield
    await captureScreen(
      tester: tester,
      child: const PrivacyShieldScreen(),
      filename: 'screen_16_privacy_shield.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 17. Theme Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: UnifiedThemeSheet(),
        ),
      ),
      filename: 'screen_17_theme_sheet_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 18. Theme Sheet - Light
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: UnifiedThemeSheet(),
        ),
      ),
      filename: 'screen_18_theme_sheet_light.png',
      palette: AppColorPalette.warmAmber,
      brightness: Brightness.light,
      isGlass: true,
    );

    // 19. Language Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: LanguagePickerSheet(),
        ),
      ),
      filename: 'screen_19_language_sheet_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 20. Font Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: FontPickerSheet(),
        ),
      ),
      filename: 'screen_20_font_sheet_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 21. Diagnostics Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SystemDiagnosticsSheet(),
        ),
      ),
      filename: 'screen_21_diagnostics_sheet_dark.png',
      palette: AppColorPalette.cyberCyan,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 22. Permission Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PermissionOnboardingSheet(),
        ),
      ),
      filename: 'screen_22_permission_sheet_dark.png',
      palette: AppColorPalette.fuchsiaPine,
      brightness: Brightness.dark,
      isGlass: true,
    );

    // 23. Pin Setup Sheet - Dark
    await captureScreen(
      tester: tester,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: PinSetupSheet(mode: PinSheetMode.create),
        ),
      ),
      filename: 'screen_23_pin_setup_sheet_dark.png',
      palette: AppColorPalette.indigoGold,
      brightness: Brightness.dark,
      isGlass: true,
    );
  });
}

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
