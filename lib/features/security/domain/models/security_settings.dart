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
