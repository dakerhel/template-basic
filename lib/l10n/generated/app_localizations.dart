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
