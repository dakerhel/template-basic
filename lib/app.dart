import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config.dart';
import 'core/locale/locale_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/color_palette_provider.dart';
import 'core/theme/font_provider.dart';
import 'core/theme/theme_mode_provider.dart';
import 'core/theme/widgets/app_ambient_background.dart';
import 'features/security/presentation/controllers/security_controller.dart';
import 'features/security/presentation/screens/lock_screen.dart';
import 'features/security/presentation/screens/privacy_shield_screen.dart';
import 'l10n/generated/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final font = ref.watch(fontProvider);
    final palette = ref.watch(colorPaletteProvider);
    final securityState = ref.watch(securityControllerProvider);

    return MaterialApp.router(
      title: AppConfig.appName,
      theme: AppTheme.light(palette: palette, fontFamily: font.themeFontFamily),
      darkTheme: AppTheme.dark(
        palette: palette,
        fontFamily: font.themeFontFamily,
        isOled: themeMode.isOled,
      ),
      themeMode: themeMode.flutterThemeMode,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
      builder: (context, child) {
        final scaledChild = MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(font.scale)),
          child: AppAmbientBackground(
            child: child ?? const SizedBox.shrink(),
          ),
        );

        final isLocked = securityState.isLocked && securityState.isInitialized;
        final isShieldActive = securityState.isPrivacyShieldActive;
        final isObscured = isLocked || isShieldActive;

        final isolatedChild = ExcludeSemantics(
          excluding: isObscured,
          child: FocusScope(
            canRequestFocus: !isObscured,
            child: scaledChild,
          ),
        );

        return AnimatedTheme(
          data: Theme.of(context),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Stack(
            children: [
              isolatedChild,
              if (isLocked)
                const Positioned.fill(child: LockScreen()),
              if (isShieldActive)
                const Positioned.fill(child: PrivacyShieldScreen()),
            ],
          ),
        );
      },
    );
  }
}
