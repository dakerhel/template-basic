import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/security_settings.dart';
import '../domain/repositories/security_repository.dart';

final securityRepositoryProvider = Provider<SecurityRepository>((ref) {
  return SecurityRepositoryImpl(
    storage: const FlutterSecureStorage(),
    localAuth: LocalAuthentication(),
  );
});

class SecurityRepositoryImpl implements SecurityRepository {
  SecurityRepositoryImpl({
    this.storage = const FlutterSecureStorage(),
    LocalAuthentication? localAuth,
  }) : _localAuth = localAuth ?? LocalAuthentication();

  final FlutterSecureStorage storage;
  final LocalAuthentication _localAuth;

  static const _pinHashKey = 'app_pin_hash';
  static const _pinSaltKey = 'app_pin_salt';
  static const _prefPinEnabled = 'security_pin_enabled';
  static const _prefBiometricsEnabled = 'security_biometrics_enabled';
  static const _prefAutoLockSeconds = 'security_autolock_seconds';

  @override
  Future<bool> hasPin() async {
    final hash = await storage.read(key: _pinHashKey);
    return hash != null && hash.isNotEmpty;
  }

  @override
  Future<bool> verifyPin(String pin) async {
    final savedHash = await storage.read(key: _pinHashKey);
    final salt = await storage.read(key: _pinSaltKey);
    if (savedHash == null || salt == null) return false;

    final computedHash = _hashPin(pin, salt);
    return computedHash == savedHash;
  }

  @override
  Future<void> setPin(String pin) async {
    final salt = DateTime.now().microsecondsSinceEpoch.toString();
    final hash = _hashPin(pin, salt);

    await storage.write(key: _pinHashKey, value: hash);
    await storage.write(key: _pinSaltKey, value: salt);

    final current = await loadSettings();
    await saveSettings(current.copyWith(isPinEnabled: true));
  }

  @override
  Future<void> removePin() async {
    await storage.delete(key: _pinHashKey);
    await storage.delete(key: _pinSaltKey);

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
    final isBiometricsEnabled =
        prefs.getBool(_prefBiometricsEnabled) ?? false;
    final autoLockSec = prefs.getInt(_prefAutoLockSeconds);

    // Дополнительная валидация: если флаг включен, но хеша нет в KeyStore
    final pinExists = await hasPin();
    final realPinEnabled = isPinEnabled && pinExists;

    return SecuritySettings(
      isPinEnabled: realPinEnabled,
      isBiometricsEnabled: isBiometricsEnabled && realPinEnabled,
      autoLockDuration: AutoLockDuration.fromSeconds(autoLockSec),
    );
  }

  @override
  Future<void> saveSettings(SecuritySettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefPinEnabled, settings.isPinEnabled);
    await prefs.setBool(
      _prefBiometricsEnabled,
      settings.isBiometricsEnabled,
    );
    await prefs.setInt(
      _prefAutoLockSeconds,
      settings.autoLockDuration.seconds,
    );
  }

  String _hashPin(String pin, String salt) {
    final bytes = utf8.encode('$salt:$pin:$salt');
    return sha256.convert(bytes).toString();
  }
}
