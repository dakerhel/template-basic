import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final liquidGlassProvider = NotifierProvider<LiquidGlassController, bool>(
  LiquidGlassController.new,
);

final class LiquidGlassController extends Notifier<bool> {
  static const _prefKey = 'app_liquid_glass_enabled';

  @override
  bool build() {
    _restore();
    return true;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final isEnabled = prefs.getBool(_prefKey) ?? true;
    if (isEnabled != state) {
      state = isEnabled;
    }
  }

  Future<void> setLiquidGlassEnabled(bool isEnabled) async {
    if (state == isEnabled) return;
    state = isEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, isEnabled);
  }
}
