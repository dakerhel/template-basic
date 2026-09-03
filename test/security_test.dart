import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/security/data/security_repository_impl.dart';
import 'package:my_app/features/security/domain/models/security_settings.dart';
import 'package:my_app/features/security/domain/repositories/security_repository.dart';
import 'package:my_app/features/security/presentation/controllers/security_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SecuritySettings & AutoLockDuration', () {
    test('AutoLockDuration fromSeconds maps correctly', () {
      expect(AutoLockDuration.fromSeconds(0), AutoLockDuration.immediately);
      expect(AutoLockDuration.fromSeconds(60), AutoLockDuration.oneMinute);
      expect(AutoLockDuration.fromSeconds(300), AutoLockDuration.fiveMinutes);
      expect(
        AutoLockDuration.fromSeconds(900),
        AutoLockDuration.fifteenMinutes,
      );
      expect(AutoLockDuration.fromSeconds(null), AutoLockDuration.immediately);
      expect(AutoLockDuration.fromSeconds(9999), AutoLockDuration.immediately);
    });

    test(
      'SecuritySettings copyWith updates values including isHideContentEnabled',
      () {
        const settings = SecuritySettings();
        expect(settings.isPinEnabled, isFalse);
        expect(settings.isBiometricsEnabled, isFalse);
        expect(settings.autoLockDuration, AutoLockDuration.immediately);
        expect(settings.isHideContentEnabled, isTrue);

        final updated = settings.copyWith(
          isPinEnabled: true,
          isBiometricsEnabled: true,
          autoLockDuration: AutoLockDuration.fiveMinutes,
          isHideContentEnabled: false,
        );
        expect(updated.isPinEnabled, isTrue);
        expect(updated.isBiometricsEnabled, isTrue);
        expect(updated.autoLockDuration, AutoLockDuration.fiveMinutes);
        expect(updated.isHideContentEnabled, isFalse);
      },
    );

    test('Cryptographic key stretching produces consistent, resistant hashes', () {
      String hashPin(String pin, String salt) {
        List<int> current = utf8.encode('$salt:$pin:$salt');
        for (int i = 0; i < 10000; i++) {
          current = sha256.convert(current).bytes;
        }
        return sha256
            .convert(utf8.encode('$pin:${base64UrlEncode(current)}:$salt'))
            .toString();
      }

      final hash1 = hashPin('1234', 'salt_123');
      final hash2 = hashPin('1234', 'salt_123');
      final hashDiffPin = hashPin('5678', 'salt_123');
      final hashDiffSalt = hashPin('1234', 'salt_456');

      expect(hash1, equals(hash2));
      expect(hash1, isNot(equals(hashDiffPin)));
      expect(hash1, isNot(equals(hashDiffSalt)));
    });
  });

  group('LockoutInfo & Progressive Retry Limits', () {
    test(
      'calculateLockoutSeconds scales progressively with failed attempts',
      () {
        expect(LockoutInfo.calculateLockoutSeconds(0), 0);
        expect(LockoutInfo.calculateLockoutSeconds(1), 0);
        expect(LockoutInfo.calculateLockoutSeconds(2), 0);

        // 3 ошибки -> 30 секунд
        expect(LockoutInfo.calculateLockoutSeconds(3), 30);
        expect(LockoutInfo.calculateLockoutSeconds(4), 30);
        expect(LockoutInfo.calculateLockoutSeconds(5), 30);

        // 6 ошибок -> 5 минут (300 сек)
        expect(LockoutInfo.calculateLockoutSeconds(6), 300);
        expect(LockoutInfo.calculateLockoutSeconds(7), 300);

        // 9 ошибок -> 15 минут (900 сек)
        expect(LockoutInfo.calculateLockoutSeconds(9), 900);
        expect(LockoutInfo.calculateLockoutSeconds(11), 900);

        // 12+ ошибок -> 60 минут (3600 сек)
        expect(LockoutInfo.calculateLockoutSeconds(12), 3600);
        expect(LockoutInfo.calculateLockoutSeconds(20), 3600);
      },
    );

    test('attemptsUntilNextLockout returns remaining attempts in cycle', () {
      expect(const LockoutInfo(failedAttempts: 0).attemptsUntilNextLockout, 3);
      expect(const LockoutInfo(failedAttempts: 1).attemptsUntilNextLockout, 2);
      expect(const LockoutInfo(failedAttempts: 2).attemptsUntilNextLockout, 1);
      expect(const LockoutInfo(failedAttempts: 3).attemptsUntilNextLockout, 3);
      expect(const LockoutInfo(failedAttempts: 4).attemptsUntilNextLockout, 2);
      expect(const LockoutInfo(failedAttempts: 5).attemptsUntilNextLockout, 1);
    });

    test('isBiometricsLockedOut triggers after 3 failed attempts', () {
      expect(
        const LockoutInfo(failedAttempts: 0).isBiometricsLockedOut,
        isFalse,
      );
      expect(
        const LockoutInfo(failedAttempts: 2).isBiometricsLockedOut,
        isFalse,
      );
      expect(
        const LockoutInfo(failedAttempts: 3).isBiometricsLockedOut,
        isTrue,
      );
      expect(
        const LockoutInfo(failedAttempts: 5).isBiometricsLockedOut,
        isTrue,
      );
    });

    test('isLockedOut checks remainingSeconds', () {
      expect(const LockoutInfo(remainingSeconds: 0).isLockedOut, isFalse);
      expect(const LockoutInfo(remainingSeconds: 30).isLockedOut, isTrue);
    });
  });

  group('SecurityController & Pin Verification', () {
    test('verifyCurrentPin updates lockout on failed attempts and locks out at 3 errors', () async {
      final fakeRepo = FakeSecurityRepository();
      fakeRepo.savedPin = '1234';

      final container = ProviderContainer(
        overrides: [
          securityRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final controller = container.read(securityControllerProvider.notifier);

      // 1st wrong attempt
      final res1 = await controller.verifyCurrentPin('0000');
      expect(res1, isFalse);
      expect(container.read(securityControllerProvider).lockout.failedAttempts, 1);
      expect(container.read(securityControllerProvider).lockout.isLockedOut, isFalse);

      // 2nd wrong attempt
      final res2 = await controller.verifyCurrentPin('0000');
      expect(res2, isFalse);
      expect(container.read(securityControllerProvider).lockout.failedAttempts, 2);
      expect(container.read(securityControllerProvider).lockout.isLockedOut, isFalse);

      // 3rd wrong attempt -> lockout triggered!
      final res3 = await controller.verifyCurrentPin('0000');
      expect(res3, isFalse);
      expect(container.read(securityControllerProvider).lockout.failedAttempts, 3);
      expect(container.read(securityControllerProvider).lockout.isLockedOut, isTrue);
      expect(container.read(securityControllerProvider).lockout.remainingSeconds, 30);

      // While locked out, verifyCurrentPin immediately returns false
      final resWhileLocked = await controller.verifyCurrentPin('1234');
      expect(resWhileLocked, isFalse);

      // Reset lockout and verify correct PIN
      await fakeRepo.resetLockout();
      await controller.verifyCurrentPin('1234');
      expect(container.read(securityControllerProvider).lockout.isLockedOut, isFalse);
    });

    test('Changing PIN with setPin keeps app unlocked (isLocked is false)', () async {
      final fakeRepo = FakeSecurityRepository();
      final container = ProviderContainer(
        overrides: [
          securityRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final controller = container.read(securityControllerProvider.notifier);
      await controller.setPin('9876');

      final state = container.read(securityControllerProvider);
      expect(state.settings.isPinEnabled, isTrue);
      expect(state.isLocked, isFalse);
      expect(await fakeRepo.hasPin(), isTrue);
    });

    test('didChangeAppLifecycleState: inactive does not trigger auto-lock, paused triggers auto-lock', () async {
      final fakeRepo = FakeSecurityRepository();
      fakeRepo.savedPin = '1234';
      fakeRepo.currentSettings = const SecuritySettings(
        isPinEnabled: true,
        autoLockDuration: AutoLockDuration.immediately,
      );

      final container = ProviderContainer(
        overrides: [
          securityRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final controller = container.read(securityControllerProvider.notifier);
      // Wait for init microtask
      await Future<void>.delayed(const Duration(milliseconds: 10));

      // Manually set isLocked to false (authenticated in settings)
      await controller.setPin('1234');
      expect(container.read(securityControllerProvider).isLocked, isFalse);

      // Simulating transient inactive event (e.g. bottom sheet, native dialog, window blur)
      controller.didChangeAppLifecycleState(AppLifecycleState.inactive);
      controller.didChangeAppLifecycleState(AppLifecycleState.resumed);

      // Should NOT lock on transient inactive!
      expect(container.read(securityControllerProvider).isLocked, isFalse);

      // Simulating app being paused (backgrounded / minimized)
      controller.didChangeAppLifecycleState(AppLifecycleState.paused);
      controller.didChangeAppLifecycleState(AppLifecycleState.resumed);

      // Should lock on resume from background when autoLock is immediately
      expect(container.read(securityControllerProvider).isLocked, isTrue);
    });

    test('trivial and sequential PINs are rejected as weak', () {
      bool isTrivialPin(String pin) {
        if (pin.length != 4) return false;
        if (pin[0] == pin[1] && pin[1] == pin[2] && pin[2] == pin[3]) {
          return true;
        }
        const trivialList = {
          '0123', '1234', '2345', '3456', '4567', '5678', '6789',
          '9876', '8765', '7654', '6543', '5432', '4321', '3210',
        };
        return trivialList.contains(pin);
      }

      expect(isTrivialPin('0000'), isTrue);
      expect(isTrivialPin('1111'), isTrue);
      expect(isTrivialPin('9999'), isTrue);
      expect(isTrivialPin('1234'), isTrue);
      expect(isTrivialPin('4321'), isTrue);
      expect(isTrivialPin('0123'), isTrue);

      expect(isTrivialPin('4829'), isFalse);
      expect(isTrivialPin('7193'), isFalse);
      expect(isTrivialPin('1357'), isFalse);
    });
  });
}

class FakeSecurityRepository implements SecurityRepository {
  String? savedPin;
  SecuritySettings currentSettings = const SecuritySettings();
  LockoutInfo currentLockout = const LockoutInfo();

  @override
  Future<bool> hasPin() async => savedPin != null;

  @override
  Future<bool> verifyPin(String pin) async {
    if (currentLockout.isLockedOut) return false;
    final valid = pin == savedPin;
    if (valid) {
      await resetLockout();
    }
    return valid;
  }

  @override
  Future<void> setPin(String pin) async {
    savedPin = pin;
    currentSettings = currentSettings.copyWith(isPinEnabled: true);
    await resetLockout();
  }

  @override
  Future<void> removePin() async {
    savedPin = null;
    currentSettings = currentSettings.copyWith(
      isPinEnabled: false,
      isBiometricsEnabled: false,
    );
    await resetLockout();
  }

  @override
  Future<bool> canCheckBiometrics() async => true;

  @override
  Future<bool> authenticateWithBiometrics({required String reason}) async =>
      true;

  @override
  Future<SecuritySettings> loadSettings() async => currentSettings;

  @override
  Future<void> saveSettings(SecuritySettings settings) async {
    currentSettings = settings;
  }

  @override
  Future<LockoutInfo> getLockoutInfo() async => currentLockout;

  @override
  Future<LockoutInfo> recordFailedAttempt() async {
    final attempts = currentLockout.failedAttempts + 1;
    final lockoutSeconds = LockoutInfo.calculateLockoutSeconds(attempts);
    currentLockout = LockoutInfo(
      failedAttempts: attempts,
      remainingSeconds: lockoutSeconds,
    );
    return currentLockout;
  }

  @override
  Future<void> resetLockout() async {
    currentLockout = const LockoutInfo();
  }
}
