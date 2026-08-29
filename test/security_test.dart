import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/security/domain/models/security_settings.dart';

void main() {
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
}
