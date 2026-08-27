import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FontFamily { system, defaultFont, inter }

class AppFontSettings {
  const AppFontSettings({
    this.scaleIndex = 3,
    this.family = FontFamily.system,
  });

  final int scaleIndex;
  final FontFamily family;

  double get scale => switch (scaleIndex) {
        1 => 0.85,
        2 => 0.92,
        3 => 1.0,
        4 => 1.1,
        _ => 1.2,
      };

  String? get themeFontFamily => switch (family) {
        FontFamily.system => null,
        FontFamily.defaultFont => 'Roboto',
        FontFamily.inter => 'Inter',
      };
}

final fontProvider =
    NotifierProvider<FontController, AppFontSettings>(FontController.new);

final class FontController extends Notifier<AppFontSettings> {
  static const _scaleKey = 'font_scale_index';
  static const _familyKey = 'font_family';

  @override
  AppFontSettings build() {
    _restore();
    return const AppFontSettings();
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final scaleIndex = prefs.getInt(_scaleKey) ?? 3;
    final familyName = prefs.getString(_familyKey);
    final family = switch (familyName) {
      'default' => FontFamily.defaultFont,
      'inter' => FontFamily.inter,
      _ => FontFamily.system,
    };
    final restored = AppFontSettings(
      scaleIndex: scaleIndex.clamp(1, 5),
      family: family,
    );
    if (restored.scaleIndex != state.scaleIndex ||
        restored.family != state.family) {
      state = restored;
    }
  }

  Future<void> setScaleIndex(int index) async {
    state = AppFontSettings(scaleIndex: index.clamp(1, 5), family: state.family);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_scaleKey, state.scaleIndex);
  }

  Future<void> setFamily(FontFamily family) async {
    state = AppFontSettings(scaleIndex: state.scaleIndex, family: family);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_familyKey, family.name);
  }
}
