import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final oledModeProvider =
    NotifierProvider<OledModeController, bool>(OledModeController.new);

final class OledModeController extends Notifier<bool> {
  static const _prefKey = 'oled_mode_enabled';

  @override
  bool build() {
    _restore();
    return false;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final restored = prefs.getBool(_prefKey) ?? false;
    if (restored != state) {
      state = restored;
    }
  }

  Future<void> setOledMode(bool value) async {
    if (state == value) return;
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, value);
  }
}
