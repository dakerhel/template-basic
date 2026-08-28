import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/security_repository_impl.dart';
import '../../domain/models/security_settings.dart';
import '../../domain/repositories/security_repository.dart';

class SecurityState {
  const SecurityState({
    this.isLocked = false,
    this.isPrivacyShieldActive = false,
    this.settings = const SecuritySettings(),
    this.lockout = const LockoutInfo(),
    this.canUseBiometrics = false,
    this.isInitialized = false,
  });

  final bool isLocked;
  final bool isPrivacyShieldActive;
  final SecuritySettings settings;
  final LockoutInfo lockout;
  final bool canUseBiometrics;
  final bool isInitialized;

  SecurityState copyWith({
    bool? isLocked,
    bool? isPrivacyShieldActive,
    SecuritySettings? settings,
    LockoutInfo? lockout,
    bool? canUseBiometrics,
    bool? isInitialized,
  }) {
    return SecurityState(
      isLocked: isLocked ?? this.isLocked,
      isPrivacyShieldActive:
          isPrivacyShieldActive ?? this.isPrivacyShieldActive,
      settings: settings ?? this.settings,
      lockout: lockout ?? this.lockout,
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
  Timer? _countdownTimer;

  @override
  SecurityState build() {
    _repository = ref.watch(securityRepositoryProvider);
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() {
      _countdownTimer?.cancel();
      WidgetsBinding.instance.removeObserver(this);
    });

    Future.microtask(_init);
    return const SecurityState();
  }

  Future<void> _init() async {
    final settings = await _repository.loadSettings();
    final canBio = await _repository.canCheckBiometrics();
    final lockout = await _repository.getLockoutInfo();

    state = state.copyWith(
      settings: settings,
      lockout: lockout,
      canUseBiometrics: canBio,
      isLocked: settings.isPinEnabled,
      isInitialized: true,
    );

    if (lockout.isLockedOut) {
      _startLockoutCountdown();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!this.state.settings.isPinEnabled) return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _pausedAt ??= DateTime.now();

      // Активируем Privacy Shield для диспетчера задач
      if (this.state.settings.isHideContentEnabled &&
          !this.state.isPrivacyShieldActive) {
        this.state = this.state.copyWith(isPrivacyShieldActive: true);
      }
    } else if (state == AppLifecycleState.resumed) {
      // Снимаем Privacy Shield при возврате на передний план
      this.state = this.state.copyWith(isPrivacyShieldActive: false);

      // Синхронизируем таймер блокировки
      _refreshLockout();

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

  Future<void> _refreshLockout() async {
    final lockout = await _repository.getLockoutInfo();
    state = state.copyWith(lockout: lockout);
    if (lockout.isLockedOut) {
      _startLockoutCountdown();
    } else {
      _countdownTimer?.cancel();
    }
  }

  void _startLockoutCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final lockout = await _repository.getLockoutInfo();
      state = state.copyWith(lockout: lockout);

      if (!lockout.isLockedOut) {
        _countdownTimer?.cancel();
      }
    });
  }

  Future<bool> verifyAndUnlock(String pin) async {
    if (state.lockout.isLockedOut) return false;

    final isValid = await _repository.verifyPin(pin);
    if (isValid) {
      _countdownTimer?.cancel();
      state = state.copyWith(
        isLocked: false,
        isPrivacyShieldActive: false,
        lockout: const LockoutInfo(),
      );
      _pausedAt = null;
      return true;
    } else {
      final updatedLockout = await _repository.recordFailedAttempt();
      state = state.copyWith(lockout: updatedLockout);

      if (updatedLockout.isLockedOut) {
        _startLockoutCountdown();
      }
      return false;
    }
  }

  Future<bool> unlockWithBiometrics({required String reason}) async {
    if (!state.settings.isBiometricsEnabled) return false;
    if (state.lockout.isBiometricsLockedOut || state.lockout.isLockedOut) {
      return false;
    }

    final success = await _repository.authenticateWithBiometrics(
      reason: reason,
    );
    if (success) {
      _countdownTimer?.cancel();
      await _repository.resetLockout();
      state = state.copyWith(
        isLocked: false,
        isPrivacyShieldActive: false,
        lockout: const LockoutInfo(),
      );
      _pausedAt = null;
      return true;
    }
    return false;
  }

  Future<void> setPin(String pin) async {
    await _repository.setPin(pin);
    _countdownTimer?.cancel();
    // setPin уже вызывает saveSettings внутри репозитория — повторный вызов не нужен
    final settings = await _repository.loadSettings();
    state = state.copyWith(
      settings: settings,
      isLocked: false,
      isPrivacyShieldActive: false,
      lockout: const LockoutInfo(),
    );
  }

  Future<void> removePin() async {
    await _repository.removePin();
    _countdownTimer?.cancel();
    final updated = state.settings.copyWith(
      isPinEnabled: false,
      isBiometricsEnabled: false,
    );
    state = state.copyWith(
      settings: updated,
      isLocked: false,
      isPrivacyShieldActive: false,
      lockout: const LockoutInfo(),
    );
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

  Future<void> setHideContentEnabled(bool enabled) async {
    final updated = state.settings.copyWith(isHideContentEnabled: enabled);
    await _repository.saveSettings(updated);
    state = state.copyWith(settings: updated);
  }

  void lockManually() {
    if (state.settings.isPinEnabled) {
      state = state.copyWith(isLocked: true);
    }
  }
}
