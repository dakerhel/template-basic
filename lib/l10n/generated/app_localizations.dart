import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'My App'**
  String get appTitle;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Foundation ready'**
  String get homeGreeting;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @aboutPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get aboutPrivacy;

  /// No description provided for @failedToOpen.
  ///
  /// In en, this message translates to:
  /// **'Failed to open {url}'**
  String failedToOpen(String url);

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @interfaceGroup.
  ///
  /// In en, this message translates to:
  /// **'Interface'**
  String get interfaceGroup;

  /// No description provided for @settingsFont.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get settingsFont;

  /// No description provided for @fontScale.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get fontScale;

  /// No description provided for @fontSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get fontSystem;

  /// No description provided for @fontDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get fontDefault;

  /// No description provided for @updatesGroup.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updatesGroup;

  /// No description provided for @backgroundCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Background update check'**
  String get backgroundCheckTitle;

  /// No description provided for @backgroundCheckSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The app checks for updates in the background. Disable to save battery. Manual check is always available.'**
  String get backgroundCheckSubtitle;

  /// No description provided for @checkIntervalTitle.
  ///
  /// In en, this message translates to:
  /// **'Check interval'**
  String get checkIntervalTitle;

  /// No description provided for @intervalHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} h'**
  String intervalHours(String hours);

  /// No description provided for @backgroundInstallTitle.
  ///
  /// In en, this message translates to:
  /// **'Background installation'**
  String get backgroundInstallTitle;

  /// No description provided for @backgroundInstallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically download and install found updates'**
  String get backgroundInstallSubtitle;

  /// No description provided for @aboutGroup.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get aboutGroup;

  /// No description provided for @appNameLabel.
  ///
  /// In en, this message translates to:
  /// **'App name'**
  String get appNameLabel;

  /// No description provided for @appVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get appVersionLabel;

  /// No description provided for @coreVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Core version'**
  String get coreVersionLabel;

  /// No description provided for @deviceLabel.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get deviceLabel;

  /// No description provided for @sourceCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCodeLabel;

  /// No description provided for @intervalMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String intervalMinutes(String minutes);

  /// No description provided for @installPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Install permission'**
  String get installPermissionTitle;

  /// No description provided for @installPermissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow installing apps from this source'**
  String get installPermissionSubtitle;

  /// No description provided for @notificationsPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification permission'**
  String get notificationsPermissionTitle;

  /// No description provided for @notificationsPermissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For notifications about found updates'**
  String get notificationsPermissionSubtitle;

  /// No description provided for @notificationsGroup.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsGroup;

  /// No description provided for @notifyUpdatesToggle.
  ///
  /// In en, this message translates to:
  /// **'Notify about updates'**
  String get notifyUpdatesToggle;

  /// No description provided for @backgroundWorkTitle.
  ///
  /// In en, this message translates to:
  /// **'Background execution'**
  String get backgroundWorkTitle;

  /// No description provided for @backgroundWorkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow running without battery restrictions'**
  String get backgroundWorkSubtitle;

  /// No description provided for @notifUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update {version} available'**
  String notifUpdateTitle(String version);

  /// No description provided for @notifUpdateBody.
  ///
  /// In en, this message translates to:
  /// **'Open the app to install'**
  String get notifUpdateBody;

  /// No description provided for @notifUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'App updated'**
  String get notifUpdatedTitle;

  /// No description provided for @notifUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'Installed version {version}'**
  String notifUpdatedBody(String version);

  /// No description provided for @checkForUpdate.
  ///
  /// In en, this message translates to:
  /// **'Check for updates'**
  String get checkForUpdate;

  /// No description provided for @updateChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get updateChecking;

  /// No description provided for @updateUpToDate.
  ///
  /// In en, this message translates to:
  /// **'You have the latest version'**
  String get updateUpToDate;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Version {version} available'**
  String updateAvailable(String version);

  /// No description provided for @updateDownload.
  ///
  /// In en, this message translates to:
  /// **'Downloading: {percent}%'**
  String updateDownload(String percent);

  /// No description provided for @updateButton.
  ///
  /// In en, this message translates to:
  /// **'Update to {version}'**
  String updateButton(String version);

  /// No description provided for @updateCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to check for updates: {error}'**
  String updateCheckFailed(String error);

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String updateFailed(String error);

  /// No description provided for @errorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithMessage(String error);

  /// No description provided for @whatsNewLabel.
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get whatsNewLabel;

  /// No description provided for @forceUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get forceUpdateTitle;

  /// No description provided for @forceUpdateBody.
  ///
  /// In en, this message translates to:
  /// **'Your version is no longer supported. Install the update to continue.'**
  String get forceUpdateBody;

  /// No description provided for @storageGroup.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storageGroup;

  /// No description provided for @storageUsed.
  ///
  /// In en, this message translates to:
  /// **'Update files: {size} MB'**
  String storageUsed(String size);

  /// No description provided for @clearCacheAction.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearCacheAction;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get cacheCleared;

  /// No description provided for @permissionOnboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay Updated & Secure'**
  String get permissionOnboardingTitle;

  /// No description provided for @permissionOnboardingBody.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications to receive instant updates about new features, version releases, and important security alerts.'**
  String get permissionOnboardingBody;

  /// No description provided for @permissionOnboardingAction.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get permissionOnboardingAction;

  /// No description provided for @permissionOnboardingDismiss.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get permissionOnboardingDismiss;

  /// No description provided for @permissionUpdatesBenefitTitle.
  ///
  /// In en, this message translates to:
  /// **'OTA Updates'**
  String get permissionUpdatesBenefitTitle;

  /// No description provided for @permissionUpdatesBenefitDesc.
  ///
  /// In en, this message translates to:
  /// **'Instant alerts for new versions & features'**
  String get permissionUpdatesBenefitDesc;

  /// No description provided for @permissionSecurityBenefitTitle.
  ///
  /// In en, this message translates to:
  /// **'Security & Protection'**
  String get permissionSecurityBenefitTitle;

  /// No description provided for @permissionSecurityBenefitDesc.
  ///
  /// In en, this message translates to:
  /// **'Critical security events & session alerts'**
  String get permissionSecurityBenefitDesc;

  /// No description provided for @permissionGrantedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled successfully'**
  String get permissionGrantedSnackbar;

  /// No description provided for @permissionDeniedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Notifications disabled. You can enable them anytime in Settings.'**
  String get permissionDeniedSnackbar;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileGuestName.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get profileGuestName;

  /// No description provided for @profileGuestDesc.
  ///
  /// In en, this message translates to:
  /// **'Local offline session'**
  String get profileGuestDesc;

  /// No description provided for @profileLinkAccount.
  ///
  /// In en, this message translates to:
  /// **'Link Account'**
  String get profileLinkAccount;

  /// No description provided for @profileLinkAccountDesc.
  ///
  /// In en, this message translates to:
  /// **'Connect with Google, Telegram, or GitHub'**
  String get profileLinkAccountDesc;

  /// No description provided for @profileAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileAccountSection;

  /// No description provided for @profileSecuritySection.
  ///
  /// In en, this message translates to:
  /// **'Security & Sessions'**
  String get profileSecuritySection;

  /// No description provided for @profileActiveSessions.
  ///
  /// In en, this message translates to:
  /// **'Active Devices'**
  String get profileActiveSessions;

  /// No description provided for @profileCurrentDevice.
  ///
  /// In en, this message translates to:
  /// **'This Device'**
  String get profileCurrentDevice;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Clear Profile & Data'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? All local data and cached sessions will be removed.'**
  String get profileDeleteConfirm;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navShowcase.
  ///
  /// In en, this message translates to:
  /// **'Showcase'**
  String get navShowcase;

  /// No description provided for @homeStarterTitle.
  ///
  /// In en, this message translates to:
  /// **'Design System Starter'**
  String get homeStarterTitle;

  /// No description provided for @homeStarterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter 3 • Riverpod • Liquid Glass UI Kit'**
  String get homeStarterSubtitle;

  /// No description provided for @homeActiveTokens.
  ///
  /// In en, this message translates to:
  /// **'Active system tokens'**
  String get homeActiveTokens;

  /// No description provided for @homeConfigure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get homeConfigure;

  /// No description provided for @homeQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get homeQuickActions;

  /// No description provided for @homeThemeSheet.
  ///
  /// In en, this message translates to:
  /// **'Theme sheet'**
  String get homeThemeSheet;

  /// No description provided for @homeThemeSheetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'9 palettes & modes'**
  String get homeThemeSheetSubtitle;

  /// No description provided for @homeShowcase.
  ///
  /// In en, this message translates to:
  /// **'UI Showcase'**
  String get homeShowcase;

  /// No description provided for @homeShowcaseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All components'**
  String get homeShowcaseSubtitle;

  /// No description provided for @homeSecurityTest.
  ///
  /// In en, this message translates to:
  /// **'Security test'**
  String get homeSecurityTest;

  /// No description provided for @homeSecurityTestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Screen lock'**
  String get homeSecurityTestSubtitle;

  /// No description provided for @homeDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get homeDiagnostics;

  /// No description provided for @homeDiagnosticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'DPR, memory, OS'**
  String get homeDiagnosticsSubtitle;

  /// No description provided for @homeRiverpodState.
  ///
  /// In en, this message translates to:
  /// **'Riverpod reactive state'**
  String get homeRiverpodState;

  /// No description provided for @homeIncrement.
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get homeIncrement;

  /// No description provided for @homeReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get homeReset;

  /// No description provided for @liquidGlassEffect.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Effect'**
  String get liquidGlassEffect;

  /// No description provided for @liquidGlassSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Optical blur & specular reflections'**
  String get liquidGlassSubtitle;

  /// No description provided for @colorSchemes.
  ///
  /// In en, this message translates to:
  /// **'Color Schemes'**
  String get colorSchemes;

  /// No description provided for @securityGroup.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securityGroup;

  /// No description provided for @securityPinTitle.
  ///
  /// In en, this message translates to:
  /// **'PIN code protection'**
  String get securityPinTitle;

  /// No description provided for @securityPinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Require PIN code on app launch'**
  String get securityPinSubtitle;

  /// No description provided for @securityBiometricsTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometrics (Fingerprint / Face ID)'**
  String get securityBiometricsTitle;

  /// No description provided for @securityBiometricsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick unlock with device sensor'**
  String get securityBiometricsSubtitle;

  /// No description provided for @securityPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Hide in App Switcher'**
  String get securityPrivacyTitle;

  /// No description provided for @securityPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy shield when switching apps'**
  String get securityPrivacySubtitle;

  /// No description provided for @securityChangePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN code'**
  String get securityChangePin;

  /// No description provided for @securityChangePinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set a new 4-digit code'**
  String get securityChangePinSubtitle;

  /// No description provided for @securityAutoLock.
  ///
  /// In en, this message translates to:
  /// **'Auto-lock timeout'**
  String get securityAutoLock;

  /// No description provided for @securityLockNow.
  ///
  /// In en, this message translates to:
  /// **'Lock screen now'**
  String get securityLockNow;

  /// No description provided for @securityPinChanged.
  ///
  /// In en, this message translates to:
  /// **'PIN code changed successfully'**
  String get securityPinChanged;

  /// No description provided for @securityTimeoutImmediately.
  ///
  /// In en, this message translates to:
  /// **'Immediately'**
  String get securityTimeoutImmediately;

  /// No description provided for @securityTimeout1Min.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get securityTimeout1Min;

  /// No description provided for @securityTimeout5Min.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get securityTimeout5Min;

  /// No description provided for @securityTimeout15Min.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get securityTimeout15Min;

  /// No description provided for @lockScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN code'**
  String get lockScreenTitle;

  /// No description provided for @lockScreenLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Entry locked'**
  String get lockScreenLockedTitle;

  /// No description provided for @lockScreenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To access the application'**
  String get lockScreenSubtitle;

  /// No description provided for @lockScreenBiometricsReason.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to unlock the app'**
  String get lockScreenBiometricsReason;

  /// No description provided for @lockScreenBiometricsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Biometrics disabled after 3 failed attempts. Enter PIN ({remaining} left)'**
  String lockScreenBiometricsDisabled(String remaining);

  /// No description provided for @lockScreenAttemptsLeft.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Remaining attempts: {remaining}'**
  String lockScreenAttemptsLeft(String remaining);

  /// No description provided for @lockScreenTimer.
  ///
  /// In en, this message translates to:
  /// **'Try again in {time}'**
  String lockScreenTimer(String time);

  /// No description provided for @pinSetupCreate.
  ///
  /// In en, this message translates to:
  /// **'Create PIN code'**
  String get pinSetupCreate;

  /// No description provided for @pinSetupConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN code'**
  String get pinSetupConfirm;

  /// No description provided for @pinSetupEnterCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current PIN code'**
  String get pinSetupEnterCurrent;

  /// No description provided for @pinSetupEnterNew.
  ///
  /// In en, this message translates to:
  /// **'New PIN code'**
  String get pinSetupEnterNew;

  /// No description provided for @pinSetupPromptDigits.
  ///
  /// In en, this message translates to:
  /// **'Enter 4 digits to secure the app'**
  String get pinSetupPromptDigits;

  /// No description provided for @pinSetupPromptConfirm.
  ///
  /// In en, this message translates to:
  /// **'Re-enter PIN code to confirm'**
  String get pinSetupPromptConfirm;

  /// No description provided for @pinSetupMismatch.
  ///
  /// In en, this message translates to:
  /// **'PIN codes do not match. Try again'**
  String get pinSetupMismatch;

  /// No description provided for @pinSetupTooSimple.
  ///
  /// In en, this message translates to:
  /// **'PIN is too simple. Avoid identical or sequential numbers'**
  String get pinSetupTooSimple;

  /// No description provided for @diagnosticsTitle.
  ///
  /// In en, this message translates to:
  /// **'System Diagnostics'**
  String get diagnosticsTitle;

  /// No description provided for @diagnosticsCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy diagnostics'**
  String get diagnosticsCopy;

  /// No description provided for @diagnosticsCopied.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics copied to clipboard'**
  String get diagnosticsCopied;

  /// No description provided for @showcaseButtonsTitle.
  ///
  /// In en, this message translates to:
  /// **'Buttons (AppButton & AppIconButton)'**
  String get showcaseButtonsTitle;

  /// No description provided for @showcaseButtonsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'5 variants, 3 sizes, loading states & spring physics'**
  String get showcaseButtonsSubtitle;

  /// No description provided for @showcaseInputsTitle.
  ///
  /// In en, this message translates to:
  /// **'Input Fields (AppTextField & Search)'**
  String get showcaseInputsTitle;

  /// No description provided for @showcaseInputsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick clear, password toggle & styled search'**
  String get showcaseInputsSubtitle;

  /// No description provided for @showcaseToastsTitle.
  ///
  /// In en, this message translates to:
  /// **'Floating HUD Toasts (AppToast)'**
  String get showcaseToastsTitle;

  /// No description provided for @showcaseToastsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Popup notifications with background blur & swipe dismiss'**
  String get showcaseToastsSubtitle;

  /// No description provided for @showcaseSheetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Modal Sheets (AppBottomSheet)'**
  String get showcaseSheetsTitle;

  /// No description provided for @showcaseSheetsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unified bottom sheets with swipe & Liquid Glass blur'**
  String get showcaseSheetsSubtitle;

  /// No description provided for @showcaseBadgesTitle.
  ///
  /// In en, this message translates to:
  /// **'Badges & Tags (AppBadge & AppChip)'**
  String get showcaseBadgesTitle;

  /// No description provided for @showcaseBadgesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Status indicators with glow & interactive filters'**
  String get showcaseBadgesSubtitle;

  /// No description provided for @showcaseHapticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Haptic Feedback Engine (AppHaptics)'**
  String get showcaseHapticsTitle;

  /// No description provided for @showcaseHapticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Safe semantic device vibration patterns'**
  String get showcaseHapticsSubtitle;

  /// No description provided for @showcaseSegmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Segmented Controls (AppSegmentedControl)'**
  String get showcaseSegmentsTitle;

  /// No description provided for @showcaseSegmentsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sliding Liquid Glass indicator with icon support'**
  String get showcaseSegmentsSubtitle;

  /// No description provided for @showcaseProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress Indicators (AppProgressBar)'**
  String get showcaseProgressTitle;

  /// No description provided for @showcaseProgressSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Neon gradients with glow & circular spinners'**
  String get showcaseProgressSubtitle;

  /// No description provided for @showcaseAvatarsTitle.
  ///
  /// In en, this message translates to:
  /// **'Avatars & Presence (AppAvatar)'**
  String get showcaseAvatarsTitle;

  /// No description provided for @showcaseAvatarsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'4 sizes, status indicator, initials & gradient outline'**
  String get showcaseAvatarsSubtitle;

  /// No description provided for @securityDisableTitle.
  ///
  /// In en, this message translates to:
  /// **'Disable PIN Protection?'**
  String get securityDisableTitle;

  /// No description provided for @securityDisableDesc.
  ///
  /// In en, this message translates to:
  /// **'Entering your current PIN is required to disable protection.'**
  String get securityDisableDesc;

  /// No description provided for @securityDisabledToast.
  ///
  /// In en, this message translates to:
  /// **'PIN protection disabled'**
  String get securityDisabledToast;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @diagnosticsDeviceGroup.
  ///
  /// In en, this message translates to:
  /// **'Device & OS'**
  String get diagnosticsDeviceGroup;

  /// No description provided for @diagnosticsAppGroup.
  ///
  /// In en, this message translates to:
  /// **'App Build Info'**
  String get diagnosticsAppGroup;

  /// No description provided for @diagnosticsDisplayGroup.
  ///
  /// In en, this message translates to:
  /// **'Screen & Display'**
  String get diagnosticsDisplayGroup;

  /// No description provided for @diagnosticsNetworkGroup.
  ///
  /// In en, this message translates to:
  /// **'Network & Accessibility'**
  String get diagnosticsNetworkGroup;

  /// No description provided for @notifRouterTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Router Test'**
  String get notifRouterTestTitle;

  /// No description provided for @notifRouterTestDesc.
  ///
  /// In en, this message translates to:
  /// **'Send test push with payload to verify routing dispatcher'**
  String get notifRouterTestDesc;

  /// No description provided for @notifSendTestButton.
  ///
  /// In en, this message translates to:
  /// **'Send Test Notification'**
  String get notifSendTestButton;

  /// No description provided for @notifTestNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'🔔 Test Notification'**
  String get notifTestNotificationTitle;

  /// No description provided for @notifTestNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Tap to test NotificationRouter payload handling'**
  String get notifTestNotificationBody;

  /// No description provided for @notifTestNotificationSent.
  ///
  /// In en, this message translates to:
  /// **'Test notification sent! Tap it in the system tray.'**
  String get notifTestNotificationSent;

  /// No description provided for @notifPermissionOnboardingPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview Permission Onboarding'**
  String get notifPermissionOnboardingPreview;

  /// No description provided for @notifSingleTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notifSingleTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
