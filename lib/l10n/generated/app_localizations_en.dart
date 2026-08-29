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
}
