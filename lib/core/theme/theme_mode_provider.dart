import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode {
  system(
    id: 'system',
    nameRu: 'Как в системе',
    nameEn: 'System Default',
    icon: Icons.brightness_auto_outlined,
  ),
  light(
    id: 'light',
    nameRu: 'Светлая',
    nameEn: 'Light',
    icon: Icons.light_mode_outlined,
  ),
  dark(
    id: 'dark',
    nameRu: 'Тёмная',
    nameEn: 'Dark',
    icon: Icons.dark_mode_outlined,
  ),
  oled(
    id: 'oled',
    nameRu: 'OLED (Чёрная)',
    nameEn: 'OLED (Pure Black)',
    icon: Icons.contrast_outlined,
  );

  const AppThemeMode({
    required this.id,
    required this.nameRu,
    required this.nameEn,
    required this.icon,
  });

  final String id;
  final String nameRu;
  final String nameEn;
  final IconData icon;

  bool get isOled => this == AppThemeMode.oled;

  ThemeMode get flutterThemeMode => switch (this) {
    AppThemeMode.system => ThemeMode.system,
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.oled => ThemeMode.dark,
  };

  String localizedName(Locale? locale) {
    if (locale?.languageCode == 'ru') return nameRu;
    return nameEn;
  }

  static AppThemeMode fromId(String? id) {
    if (id == null) return AppThemeMode.system;
    for (final mode in values) {
      if (mode.id == id) return mode;
    }
    return AppThemeMode.system;
  }
}

final themeModeProvider = NotifierProvider<ThemeModeController, AppThemeMode>(
  ThemeModeController.new,
);

final class ThemeModeController extends Notifier<AppThemeMode> {
  static const _prefsKey = 'app_theme_mode_v2';

  @override
  AppThemeMode build() {
    _restore();
    return AppThemeMode.system;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);
    final mode = AppThemeMode.fromId(saved);
    if (mode != state) state = mode;
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (state == mode) return;
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, mode.id);
  }
}
