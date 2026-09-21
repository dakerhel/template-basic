// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Foundation ready';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get aboutPrivacy => 'Privacy policy';

  @override
  String failedToOpen(String url) {
    return 'Failed to open $url';
  }

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get interfaceGroup => 'Interface';

  @override
  String get settingsFont => 'Font';

  @override
  String get fontScale => 'Font size';

  @override
  String get fontSystem => 'System';

  @override
  String get fontDefault => 'Default';

  @override
  String get updatesGroup => 'Updates';

  @override
  String get backgroundCheckTitle => 'Background update check';

  @override
  String get backgroundCheckSubtitle =>
      'The app checks for updates in the background. Disable to save battery. Manual check is always available.';

  @override
  String get checkIntervalTitle => 'Check interval';

  @override
  String intervalHours(String hours) {
    return '$hours h';
  }

  @override
  String get backgroundInstallTitle => 'Background installation';

  @override
  String get backgroundInstallSubtitle =>
      'Automatically download and install found updates';

  @override
  String get aboutGroup => 'About the app';

  @override
  String get appNameLabel => 'App name';

  @override
  String get appVersionLabel => 'App version';

  @override
  String get coreVersionLabel => 'Core version';

  @override
  String get deviceLabel => 'Device';

  @override
  String get sourceCodeLabel => 'Source code';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get installPermissionTitle => 'Install permission';

  @override
  String get installPermissionSubtitle =>
      'Allow installing apps from this source';

  @override
  String get notificationsPermissionTitle => 'Notification permission';

  @override
  String get notificationsPermissionSubtitle =>
      'For notifications about found updates';

  @override
  String get notificationsGroup => 'Notifications';

  @override
  String get notifyUpdatesToggle => 'Notify about updates';

  @override
  String get backgroundWorkTitle => 'Background execution';

  @override
  String get backgroundWorkSubtitle =>
      'Allow running without battery restrictions';

  @override
  String notifUpdateTitle(String version) {
    return 'Update $version available';
  }

  @override
  String get notifUpdateBody => 'Open the app to install';

  @override
  String get notifUpdatedTitle => 'App updated';

  @override
  String notifUpdatedBody(String version) {
    return 'Installed version $version';
  }

  @override
  String get checkForUpdate => 'Check for updates';

  @override
  String get updateChecking => 'Checking...';

  @override
  String get updateUpToDate => 'You have the latest version';

  @override
  String updateAvailable(String version) {
    return 'Version $version available';
  }

  @override
  String updateDownload(String percent) {
    return 'Downloading: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Update to $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Failed to check for updates: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Update failed: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get whatsNewLabel => 'What\'s new';

  @override
  String get forceUpdateTitle => 'Update required';

  @override
  String get forceUpdateBody =>
      'Your version is no longer supported. Install the update to continue.';

  @override
  String get storageGroup => 'Storage';

  @override
  String storageUsed(String size) {
    return 'Update files: $size MB';
  }

  @override
  String get clearCacheAction => 'Clear';

  @override
  String get cacheCleared => 'Cleared';

  @override
  String get permissionOnboardingTitle => 'Stay Updated & Secure';

  @override
  String get permissionOnboardingBody =>
      'Enable notifications to receive instant updates about new features, version releases, and important security alerts.';

  @override
  String get permissionOnboardingAction => 'Enable Notifications';

  @override
  String get permissionOnboardingDismiss => 'Maybe Later';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA Updates';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Instant alerts for new versions & features';

  @override
  String get permissionSecurityBenefitTitle => 'Security & Protection';

  @override
  String get permissionSecurityBenefitDesc =>
      'Critical security events & session alerts';

  @override
  String get permissionGrantedSnackbar => 'Notifications enabled successfully';

  @override
  String get permissionDeniedSnackbar =>
      'Notifications disabled. You can enable them anytime in Settings.';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileGuestName => 'Guest User';

  @override
  String get profileGuestDesc => 'Local offline session';

  @override
  String get profileLinkAccount => 'Link Account';

  @override
  String get profileLinkAccountDesc =>
      'Connect with Google, Telegram, or GitHub';

  @override
  String get profileAccountSection => 'Account';

  @override
  String get profileSecuritySection => 'Security & Sessions';

  @override
  String get profileActiveSessions => 'Active Devices';

  @override
  String get profileCurrentDevice => 'This Device';

  @override
  String get profileDeleteAccount => 'Clear Profile & Data';

  @override
  String get profileDeleteConfirm =>
      'Are you sure? All local data and cached sessions will be removed.';

  @override
  String get navHome => 'Home';

  @override
  String get navShowcase => 'Showcase';

  @override
  String get homeStarterTitle => 'Design System Starter';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Active system tokens';

  @override
  String get homeConfigure => 'Configure';

  @override
  String get homeQuickActions => 'Quick actions';

  @override
  String get homeThemeSheet => 'Theme sheet';

  @override
  String get homeThemeSheetSubtitle => '9 palettes & modes';

  @override
  String get homeShowcase => 'UI Showcase';

  @override
  String get homeShowcaseSubtitle => 'All components';

  @override
  String get homeSecurityTest => 'Security test';

  @override
  String get homeSecurityTestSubtitle => 'Screen lock';

  @override
  String get homeDiagnostics => 'Diagnostics';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, memory, OS';

  @override
  String get homeRiverpodState => 'Riverpod reactive state';

  @override
  String get homeIncrement => 'Increment';

  @override
  String get homeReset => 'Reset';

  @override
  String get liquidGlassEffect => 'Liquid Glass Effect';

  @override
  String get liquidGlassSubtitle => 'Optical blur & specular reflections';

  @override
  String get colorSchemes => 'Color Schemes';

  @override
  String get securityGroup => 'Security';

  @override
  String get securityPinTitle => 'PIN code protection';

  @override
  String get securityPinSubtitle => 'Require PIN code on app launch';

  @override
  String get securityBiometricsTitle => 'Biometrics (Fingerprint / Face ID)';

  @override
  String get securityBiometricsSubtitle => 'Quick unlock with device sensor';

  @override
  String get securityPrivacyTitle => 'Hide in App Switcher';

  @override
  String get securityPrivacySubtitle => 'Privacy shield when switching apps';

  @override
  String get securityChangePin => 'Change PIN code';

  @override
  String get securityChangePinSubtitle => 'Set a new 4-digit code';

  @override
  String get securityAutoLock => 'Auto-lock timeout';

  @override
  String get securityLockNow => 'Lock screen now';

  @override
  String get securityPinChanged => 'PIN code changed successfully';

  @override
  String get securityTimeoutImmediately => 'Immediately';

  @override
  String get securityTimeout1Min => '1 minute';

  @override
  String get securityTimeout5Min => '5 minutes';

  @override
  String get securityTimeout15Min => '15 minutes';

  @override
  String get lockScreenTitle => 'Enter PIN code';

  @override
  String get lockScreenLockedTitle => 'Entry locked';

  @override
  String get lockScreenSubtitle => 'To access the application';

  @override
  String get lockScreenBiometricsReason => 'Authenticate to unlock the app';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometrics disabled after 3 failed attempts. Enter PIN ($remaining left)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'Incorrect PIN. Remaining attempts: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Try again in $time';
  }

  @override
  String get pinSetupCreate => 'Create PIN code';

  @override
  String get pinSetupConfirm => 'Confirm PIN code';

  @override
  String get pinSetupEnterCurrent => 'Current PIN code';

  @override
  String get pinSetupEnterNew => 'New PIN code';

  @override
  String get pinSetupPromptDigits => 'Enter 4 digits to secure the app';

  @override
  String get pinSetupPromptConfirm => 'Re-enter PIN code to confirm';

  @override
  String get pinSetupMismatch => 'PIN codes do not match. Try again';

  @override
  String get pinSetupTooSimple =>
      'PIN is too simple. Avoid identical or sequential numbers';

  @override
  String get diagnosticsTitle => 'System Diagnostics';

  @override
  String get diagnosticsCopy => 'Copy diagnostics';

  @override
  String get diagnosticsCopied => 'Diagnostics copied to clipboard';

  @override
  String get showcaseButtonsTitle => 'Buttons (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 variants, 3 sizes, loading states & spring physics';

  @override
  String get showcaseInputsTitle => 'Input Fields (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Quick clear, password toggle & styled search';

  @override
  String get showcaseToastsTitle => 'Floating HUD Toasts (AppToast)';

  @override
  String get showcaseToastsSubtitle =>
      'Popup notifications with background blur & swipe dismiss';

  @override
  String get showcaseSheetsTitle => 'Modal Sheets (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Unified bottom sheets with swipe & Liquid Glass blur';

  @override
  String get showcaseBadgesTitle => 'Badges & Tags (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Status indicators with glow & interactive filters';

  @override
  String get showcaseHapticsTitle => 'Haptic Feedback Engine (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Safe semantic device vibration patterns';

  @override
  String get showcaseSegmentsTitle =>
      'Segmented Controls (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Sliding Liquid Glass indicator with icon support';

  @override
  String get showcaseProgressTitle => 'Progress Indicators (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Neon gradients with glow & circular spinners';

  @override
  String get showcaseAvatarsTitle => 'Avatars & Presence (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 sizes, status indicator, initials & gradient outline';

  @override
  String get securityDisableTitle => 'Disable PIN Protection?';

  @override
  String get securityDisableDesc =>
      'Entering your current PIN is required to disable protection.';

  @override
  String get securityDisabledToast => 'PIN protection disabled';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonContinue => 'Continue';

  @override
  String get diagnosticsDeviceGroup => 'Device & OS';

  @override
  String get diagnosticsAppGroup => 'App Build Info';

  @override
  String get diagnosticsDisplayGroup => 'Screen & Display';

  @override
  String get diagnosticsNetworkGroup => 'Network & Accessibility';

  @override
  String get notifRouterTestTitle => 'Notification Router Test';

  @override
  String get notifRouterTestDesc =>
      'Send test push with payload to verify routing dispatcher';

  @override
  String get notifSendTestButton => 'Send Test Notification';

  @override
  String get notifTestNotificationTitle => '🔔 Test Notification';

  @override
  String get notifTestNotificationBody =>
      'Tap to test NotificationRouter payload handling';

  @override
  String get notifTestNotificationSent =>
      'Test notification sent! Tap it in the system tray.';

  @override
  String get notifPermissionOnboardingPreview =>
      'Preview Permission Onboarding';

  @override
  String get notifSingleTitle => 'Notification';
}
