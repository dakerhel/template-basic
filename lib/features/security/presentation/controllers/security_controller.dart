import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/security_repository_impl.dart';
import '../../domain/models/security_settings.dart';
import '../../domain/repositories/security_repository.dart';

class SecurityState {
  const SecurityState({
    this.isLocked = false,
    this.settings = const SecuritySettings(),
    this.canUseBiometrics = false,
    this.isInitialized = false,
  });

  final bool isLocked;
  final SecuritySettings settings;
  final bool canUseBiometrics;
  final bool isInitialized;

  SecurityState copyWith({
    bool? isLocked,
    SecuritySettings? settings,
    bool? canUseBiometrics,
    bool? isInitialized,
  }) {
    return SecurityState(
      isLocked: isLocked ?? this.isLocked,
      settings: settings ?? this.settings,
      canUseBiometrics: canUseBiometrics ?? this.canUseBiometrics,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}

final securityControllerProvider =
    NotifierProvider<SecurityController, SecurityState>(SecurityController.new);

class SecurityController extends Notifier<SecurityState>
    with WidgetsBindingObserver {
  late final SecurityRepository _repository;
  DateTime? _pausedAt;

  @override
  SecurityState build() {
    _repository = ref.watch(securityRepositoryProvider);
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(this));

    Future.microtask(_init);
    return const SecurityState();
  }

  Future<void> _init() async {
    final settings = await _repository.loadSettings();
    final canBio = await _repository.canCheckBiometrics();

    state = state.copyWith(
      settings: settings,
      canUseBiometrics: canBio,
      isLocked: settings.isPinEnabled,
      isInitialized: true,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!this.state.settings.isPinEnabled) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _pausedAt ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      if (_pausedAt != null) {
        final elapsed = DateTime.now().difference(_pausedAt!).inSeconds;
        final timeout = this.state.settings.autoLockDuration.seconds;

        if (elapsed >= timeout) {
          this.state = this.state.copyWith(isLocked: true);
        }
        _pausedAt = null;
      }
    }
  }

  Future<bool> verifyAndUnlock(String pin) async {
    final isValid = await _repository.verifyPin(pin);
    if (isValid) {
      state = state.copyWith(isLocked: false);
      _pausedAt = null;
      return true;
    }
    return false;
  }

  Future<bool> unlockWithBiometrics({required String reason}) async {
    if (!state.settings.isBiometricsEnabled) return false;

    final success = await _repository.authenticateWithBiometrics(
      reason: reason,
    );
    if (success) {
      state = state.copyWith(isLocked: false);
      _pausedAt = null;
      return true;
    }
    return false;
  }

  Future<void> setPin(String pin) async {
    await _repository.setPin(pin);
    final updated = state.settings.copyWith(isPinEnabled: true);
    await _repository.saveSettings(updated);
    state = state.copyWith(settings: updated, isLocked: false);
  }

  Future<void> removePin() async {
    await _repository.removePin();
    final updated = state.settings.copyWith(
      isPinEnabled: false,
      isBiometricsEnabled: false,
    );
    state = state.copyWith(settings: updated, isLocked: false);
  }

  Future<void> setBiometricsEnabled(bool enabled) async {
    final updated = state.settings.copyWith(isBiometricsEnabled: enabled);
    await _repository.saveSettings(updated);
    state = state.copyWith(settings: updated);
  }

  Future<void> setAutoLockDuration(AutoLockDuration duration) async {
    final updated = state.settings.copyWith(autoLockDuration: duration);
    await _repository.saveSettings(updated);
    state = state.copyWith(settings: updated);
  }

  void lockManually() {
    if (state.settings.isPinEnabled) {
      state = state.copyWith(isLocked: true);
    }
  }
}
