import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_color_palette.dart';

final colorPaletteProvider =
    NotifierProvider<ColorPaletteController, AppColorPalette>(
        ColorPaletteController.new);

final class ColorPaletteController extends Notifier<AppColorPalette> {
  static const _prefKey = 'app_color_palette_id';

  @override
  AppColorPalette build() {
    _restore();
    return AppColorPalette.fuchsiaPine;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(_prefKey);
    final restored = AppColorPalette.fromId(id);
    if (restored != state) {
      state = restored;
    }
  }

  Future<void> setPalette(AppColorPalette palette) async {
    if (state == palette) return;
    state = palette;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, palette.id);
  }
}
