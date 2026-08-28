enum AutoLockDuration {
  immediately(0, 'Сразу', 'Immediately'),
  oneMinute(60, '1 минута', '1 minute'),
  fiveMinutes(300, '5 минут', '5 minutes'),
  fifteenMinutes(900, '15 минут', '15 minutes');

  const AutoLockDuration(this.seconds, this.nameRu, this.nameEn);

  final int seconds;
  final String nameRu;
  final String nameEn;

  static AutoLockDuration fromSeconds(int? seconds) {
    if (seconds == null) return AutoLockDuration.immediately;
    for (final val in values) {
      if (val.seconds == seconds) return val;
    }
    return AutoLockDuration.immediately;
  }
}

class SecuritySettings {
  const SecuritySettings({
    this.isPinEnabled = false,
    this.isBiometricsEnabled = false,
    this.autoLockDuration = AutoLockDuration.immediately,
  });

  final bool isPinEnabled;
  final bool isBiometricsEnabled;
  final AutoLockDuration autoLockDuration;

  SecuritySettings copyWith({
    bool? isPinEnabled,
    bool? isBiometricsEnabled,
    AutoLockDuration? autoLockDuration,
  }) {
    return SecuritySettings(
      isPinEnabled: isPinEnabled ?? this.isPinEnabled,
      isBiometricsEnabled: isBiometricsEnabled ?? this.isBiometricsEnabled,
      autoLockDuration: autoLockDuration ?? this.autoLockDuration,
    );
  }
}

class LockoutInfo {
  const LockoutInfo({
    this.failedAttempts = 0,
    this.lockoutUntilUtcMs,
    this.remainingSeconds = 0,
  });

  final int failedAttempts;
  final int? lockoutUntilUtcMs;
  final int remainingSeconds;

  bool get isLockedOut => remainingSeconds > 0;
  bool get isBiometricsLockedOut => failedAttempts >= 3;

  int get attemptsUntilNextLockout {
    final mod = failedAttempts % 3;
    return mod == 0 ? 3 : 3 - mod;
  }

  static int calculateLockoutSeconds(int attempts) {
    if (attempts < 3) return 0;
    if (attempts < 6) return 30; // 30 секунд
    if (attempts < 9) return 300; // 5 минут
    if (attempts < 12) return 900; // 15 минут
    return 3600; // 60 минут
  }

  LockoutInfo copyWith({
    int? failedAttempts,
    int? lockoutUntilUtcMs,
    int? remainingSeconds,
  }) {
    return LockoutInfo(
      failedAttempts: failedAttempts ?? this.failedAttempts,
      lockoutUntilUtcMs: lockoutUntilUtcMs ?? this.lockoutUntilUtcMs,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
