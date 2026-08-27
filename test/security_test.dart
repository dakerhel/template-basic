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

    test('SecuritySettings copyWith updates values', () {
      const settings = SecuritySettings();
      expect(settings.isPinEnabled, isFalse);
      expect(settings.isBiometricsEnabled, isFalse);
      expect(settings.autoLockDuration, AutoLockDuration.immediately);

      final updated = settings.copyWith(
        isPinEnabled: true,
        isBiometricsEnabled: true,
        autoLockDuration: AutoLockDuration.fiveMinutes,
      );
      expect(updated.isPinEnabled, isTrue);
      expect(updated.isBiometricsEnabled, isTrue);
      expect(updated.autoLockDuration, AutoLockDuration.fiveMinutes);
    });

    test('Cryptographic hash formula produces consistent hashes', () {
      String hashPin(String pin, String salt) {
        final bytes = utf8.encode('$salt:$pin:$salt');
        return sha256.convert(bytes).toString();
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
}
