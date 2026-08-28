import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/security_settings.dart';
import '../presentation/controllers/security_controller.dart';

final securityServiceProvider = Provider<SecurityService>((ref) {
  final state = ref.watch(securityControllerProvider);
  final controller = ref.watch(securityControllerProvider.notifier);
  return SecurityService(state, controller);
});

class SecurityService {
  const SecurityService(this._state, this._controller);

  final SecurityState _state;
  final SecurityController _controller;

  // State
  bool get isLocked => _state.isLocked;
  bool get hasPin => _state.settings.isPinEnabled;
  bool get isBiometricsEnabled => _state.settings.isBiometricsEnabled;
  bool get isBiometricsAvailable => _state.canUseBiometrics;
  bool get isHideContentEnabled => _state.settings.isHideContentEnabled;
  bool get isPrivacyShieldActive => _state.isPrivacyShieldActive;
  bool get isInitialized => _state.isInitialized;
  LockoutInfo get lockout => _state.lockout;

  // Actions
  void lock() => _controller.lockManually();
  Future<bool> unlockWithPin(String pin) => _controller.verifyAndUnlock(pin);
  Future<bool> unlockWithBiometrics({
    String reason = 'Подтвердите личность для входа',
  }) => _controller.unlockWithBiometrics(reason: reason);

  Future<void> setPin(String pin) => _controller.setPin(pin);
  Future<void> removePin() => _controller.removePin();
  Future<void> setBiometricsEnabled(bool enabled) =>
      _controller.setBiometricsEnabled(enabled);
  Future<void> setAutoLockDuration(AutoLockDuration duration) =>
      _controller.setAutoLockDuration(duration);
  Future<void> setHideContentEnabled(bool enabled) =>
      _controller.setHideContentEnabled(enabled);
}
