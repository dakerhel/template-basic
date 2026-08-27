import '../models/security_settings.dart';

abstract interface class SecurityRepository {
  Future<bool> hasPin();
  Future<bool> verifyPin(String pin);
  Future<void> setPin(String pin);
  Future<void> removePin();

  Future<bool> canCheckBiometrics();
  Future<bool> authenticateWithBiometrics({required String reason});

  Future<SecuritySettings> loadSettings();
  Future<void> saveSettings(SecuritySettings settings);
}
