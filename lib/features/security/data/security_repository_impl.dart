import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/security_settings.dart';
import '../domain/repositories/security_repository.dart';

final securityRepositoryProvider = Provider<SecurityRepository>((ref) {
  return SecurityRepositoryImpl(localAuth: LocalAuthentication());
});

class SecurityRepositoryImpl implements SecurityRepository {
  SecurityRepositoryImpl({LocalAuthentication? localAuth})
    : _localAuth = localAuth ?? LocalAuthentication();

  final LocalAuthentication _localAuth;

  static const _pinHashKey = 'app_pin_hash';
  static const _pinSaltKey = 'app_pin_salt';
  static const _prefPinEnabled = 'security_pin_enabled';
  static const _prefBiometricsEnabled = 'security_biometrics_enabled';
  static const _prefAutoLockSeconds = 'security_autolock_seconds';
  static const _prefHideContentEnabled = 'security_hide_content_enabled';

  static const _prefFailedAttempts = 'security_failed_attempts';
  static const _prefLockoutUntilUtcMs = 'security_lockout_until_utc_ms';
  static const _prefLastObservedUtcMs = 'security_last_observed_utc_ms';

  @override
  Future<bool> hasPin() async {
    final prefs = await SharedPreferences.getInstance();
    final hash = prefs.getString(_pinHashKey);
    return hash != null && hash.isNotEmpty;
  }

  @override
  Future<bool> verifyPin(String pin) async {
    final lockout = await getLockoutInfo();
    if (lockout.isLockedOut) return false;

    final prefs = await SharedPreferences.getInstance();
    final savedHash = prefs.getString(_pinHashKey);
    final salt = prefs.getString(_pinSaltKey);
    if (savedHash == null || salt == null) return false;

    final computedHash = _hashPin(pin, salt);
    final isValid = _constantTimeEquals(computedHash, savedHash);

    if (isValid) {
      await resetLockout();
    }
    return isValid;
  }

  @override
  Future<void> setPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    // Криптографически стойкая генерация соли (256 бит энтропии)
    final random = Random.secure();
    final saltBytes = List<int>.generate(32, (_) => random.nextInt(256));
    final salt = base64UrlEncode(saltBytes);

    final hash = _hashPin(pin, salt);

    await prefs.setString(_pinHashKey, hash);
    await prefs.setString(_pinSaltKey, salt);

    await resetLockout();

    final current = await loadSettings();
    await saveSettings(current.copyWith(isPinEnabled: true));
  }

  @override
  Future<void> removePin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pinHashKey);
    await prefs.remove(_pinSaltKey);

    await resetLockout();

    final current = await loadSettings();
    await saveSettings(
      current.copyWith(isPinEnabled: false, isBiometricsEnabled: false),
    );
  }

  @override
  Future<bool> canCheckBiometrics() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      return canCheck || isDeviceSupported;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> authenticateWithBiometrics({required String reason}) async {
    try {
      final lockout = await getLockoutInfo();
      if (lockout.isBiometricsLockedOut || lockout.isLockedOut) {
        return false;
      }

      final canAuth = await canCheckBiometrics();
      if (!canAuth) return false;

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
          useErrorDialogs: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }

  @override
  Future<SecuritySettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final isPinEnabled = prefs.getBool(_prefPinEnabled) ?? false;
    final isBiometricsEnabled = prefs.getBool(_prefBiometricsEnabled) ?? false;
    final autoLockSec = prefs.getInt(_prefAutoLockSeconds);
    final isHideContent = prefs.getBool(_prefHideContentEnabled) ?? true;

    final pinExists = await hasPin();
    final realPinEnabled = isPinEnabled && pinExists;

    return SecuritySettings(
      isPinEnabled: realPinEnabled,
      isBiometricsEnabled: isBiometricsEnabled && realPinEnabled,
      autoLockDuration: AutoLockDuration.fromSeconds(autoLockSec),
      isHideContentEnabled: isHideContent,
    );
  }

  @override
  Future<void> saveSettings(SecuritySettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefPinEnabled, settings.isPinEnabled);
    await prefs.setBool(_prefBiometricsEnabled, settings.isBiometricsEnabled);
    await prefs.setInt(_prefAutoLockSeconds, settings.autoLockDuration.seconds);
    await prefs.setBool(_prefHideContentEnabled, settings.isHideContentEnabled);
  }

  @override
  Future<LockoutInfo> getLockoutInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final failedAttempts = prefs.getInt(_prefFailedAttempts) ?? 0;
    final lockoutUntilUtcMs = prefs.getInt(_prefLockoutUntilUtcMs);
    final lastObserved = prefs.getInt(_prefLastObservedUtcMs) ?? 0;

    final nowUtcMs = DateTime.now().toUtc().millisecondsSinceEpoch;

    // Защита от перевода часов назад (Anti-clock tampering)
    final effectiveNowMs = (nowUtcMs < lastObserved) ? lastObserved : nowUtcMs;
    if (nowUtcMs > lastObserved) {
      await prefs.setInt(_prefLastObservedUtcMs, nowUtcMs);
    }

    int remainingSeconds = 0;
    if (lockoutUntilUtcMs != null) {
      final diffMs = lockoutUntilUtcMs - effectiveNowMs;
      if (diffMs > 0) {
        remainingSeconds = (diffMs / 1000).ceil();
      } else {
        await prefs.remove(_prefLockoutUntilUtcMs);
      }
    }

    return LockoutInfo(
      failedAttempts: failedAttempts,
      lockoutUntilUtcMs: remainingSeconds > 0 ? lockoutUntilUtcMs : null,
      remainingSeconds: remainingSeconds,
    );
  }

  @override
  Future<LockoutInfo> recordFailedAttempt() async {
    final prefs = await SharedPreferences.getInstance();
    final currentAttempts = (prefs.getInt(_prefFailedAttempts) ?? 0) + 1;
    await prefs.setInt(_prefFailedAttempts, currentAttempts);

    final nowUtcMs = DateTime.now().toUtc().millisecondsSinceEpoch;
    await prefs.setInt(_prefLastObservedUtcMs, nowUtcMs);

    int remainingSeconds = 0;
    int? lockoutUntilUtcMs;

    // Блокировка срабатывает каждые 3 неверные попытки (3, 6, 9, 12...)
    if (currentAttempts % 3 == 0) {
      final lockoutDurationSec = LockoutInfo.calculateLockoutSeconds(
        currentAttempts,
      );
      lockoutUntilUtcMs = nowUtcMs + (lockoutDurationSec * 1000);
      remainingSeconds = lockoutDurationSec;
      await prefs.setInt(_prefLockoutUntilUtcMs, lockoutUntilUtcMs);
    }

    return LockoutInfo(
      failedAttempts: currentAttempts,
      lockoutUntilUtcMs: lockoutUntilUtcMs,
      remainingSeconds: remainingSeconds,
    );
  }

  @override
  Future<void> resetLockout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefFailedAttempts);
    await prefs.remove(_prefLockoutUntilUtcMs);
  }

  String _hashPin(String pin, String salt) {
    // 10 000 раундов криптографического солевого хэширования (Key Stretching)
    // для защиты 4-значного PIN-кода от быстрого офлайн-перебора
    List<int> current = utf8.encode('$salt:$pin:$salt');
    for (int i = 0; i < 10000; i++) {
      current = sha256.convert(current).bytes;
    }
    return sha256
        .convert(utf8.encode('$pin:${base64UrlEncode(current)}:$salt'))
        .toString();
  }

  /// Constant-time string comparison для защиты от атак по времени (Timing Attacks)
  static bool _constantTimeEquals(String a, String b) {
    if (a.length != b.length) return false;
    int result = 0;
    for (int i = 0; i < a.length; i++) {
      result |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
    }
    return result == 0;
  }
}
