import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/notification_permissions.dart';

final class PermissionOnboardingState {
  const PermissionOnboardingState({
    required this.hasSeenOnboarding,
    required this.areNotificationsEnabled,
    this.isLoading = false,
  });

  final bool hasSeenOnboarding;
  final bool areNotificationsEnabled;
  final bool isLoading;

  bool get shouldPrompt => !hasSeenOnboarding && !areNotificationsEnabled;

  PermissionOnboardingState copyWith({
    bool? hasSeenOnboarding,
    bool? areNotificationsEnabled,
    bool? isLoading,
  }) {
    return PermissionOnboardingState(
      hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
      areNotificationsEnabled:
          areNotificationsEnabled ?? this.areNotificationsEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class PermissionOnboardingNotifier
    extends Notifier<PermissionOnboardingState> {
  static const String _prefKey = 'has_seen_notification_onboarding';

  @override
  PermissionOnboardingState build() {
    _init();
    return const PermissionOnboardingState(
      hasSeenOnboarding: false,
      areNotificationsEnabled: false,
      isLoading: true,
    );
  }

  Future<void> _init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasSeen = prefs.getBool(_prefKey) ?? false;
      final isEnabled =
          await NotificationPermissions.areNotificationsEnabled();

      state = PermissionOnboardingState(
        hasSeenOnboarding: hasSeen,
        areNotificationsEnabled: isEnabled,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Проверяет, нужно ли показать приветственный диалог/шторку
  Future<bool> checkShouldPrompt() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeen = prefs.getBool(_prefKey) ?? false;
    final isEnabled = await NotificationPermissions.areNotificationsEnabled();
    state = state.copyWith(
      hasSeenOnboarding: hasSeen,
      areNotificationsEnabled: isEnabled,
    );
    return !hasSeen && !isEnabled;
  }

  /// Запрашивает нативное системное разрешение
  Future<bool> requestPermission() async {
    state = state.copyWith(isLoading: true);
    try {
      final granted = await NotificationPermissions.requestPermission();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKey, true);

      state = state.copyWith(
        hasSeenOnboarding: true,
        areNotificationsEnabled: granted,
        isLoading: false,
      );
      return granted;
    } catch (_) {
      state = state.copyWith(isLoading: false);
      return false;
    }
  }

  /// Отклонить или отложить показ
  Future<void> dismiss() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
    state = state.copyWith(hasSeenOnboarding: true);
  }

  /// Сбросить состояние (для отладки/тестов)
  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefKey);
    final isEnabled = await NotificationPermissions.areNotificationsEnabled();
    state = PermissionOnboardingState(
      hasSeenOnboarding: false,
      areNotificationsEnabled: isEnabled,
      isLoading: false,
    );
  }
}

final permissionOnboardingProvider =
    NotifierProvider<
      PermissionOnboardingNotifier,
      PermissionOnboardingState
    >(PermissionOnboardingNotifier.new);
