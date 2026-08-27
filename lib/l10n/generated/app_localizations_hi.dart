// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'आधार तैयार है';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get aboutPrivacy => 'गोपनीयता नीति';

  @override
  String failedToOpen(String url) {
    return '$url खोलने में विफल';
  }

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम के अनुसार';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get themeSystem => 'सिस्टम के अनुसार';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get interfaceGroup => 'इंटरफ़ेस';

  @override
  String get settingsFont => 'फ़ॉन्ट';

  @override
  String get fontScale => 'फ़ॉन्ट आकार';

  @override
  String get fontSystem => 'सिस्टम के अनुसार';

  @override
  String get fontDefault => 'डिफ़ॉल्ट';

  @override
  String get updatesGroup => 'अपडेट';

  @override
  String get backgroundCheckTitle => 'बैकग्राउंड अपडेट जांच';

  @override
  String get backgroundCheckSubtitle =>
      'ऐप बैकग्राउंड में अपडेट की जांच करता है। बैटरी बचाने के लिए इसे बंद करें। मैन्युअल जांच हमेशा उपलब्ध है।';

  @override
  String get checkIntervalTitle => 'जांच अंतराल';

  @override
  String intervalHours(String hours) {
    return '$hours घंटे';
  }

  @override
  String get backgroundInstallTitle => 'बैकग्राउंड इंस्टॉलेशन';

  @override
  String get backgroundInstallSubtitle =>
      'मिले अपडेट को स्वतः डाउनलोड और इंस्टॉल करें';

  @override
  String get aboutGroup => 'ऐप के बारे में';

  @override
  String get appNameLabel => 'ऐप का नाम';

  @override
  String get appVersionLabel => 'ऐप संस्करण';

  @override
  String get coreVersionLabel => 'कोर संस्करण';

  @override
  String get deviceLabel => 'डिवाइस';

  @override
  String get sourceCodeLabel => 'सोर्स कोड';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes मिनट';
  }

  @override
  String get installPermissionTitle => 'इंस्टॉलेशन अनुमति';

  @override
  String get installPermissionSubtitle =>
      'इस स्रोत से ऐप इंस्टॉल करने की अनुमति दें';

  @override
  String get notificationsPermissionTitle => 'अधिसूचना अनुमति';

  @override
  String get notificationsPermissionSubtitle => 'मिले अपडेट की सूचनाओं के लिए';

  @override
  String get notificationsGroup => 'सूचनाएं';

  @override
  String get notifyUpdatesToggle => 'अपडेट के बारे में सूचित करें';

  @override
  String get backgroundWorkTitle => 'बैकग्राउंड निष्पादन';

  @override
  String get backgroundWorkSubtitle =>
      'बैटरी प्रतिबंधों के बिना चलने की अनुमति दें';

  @override
  String notifUpdateTitle(String version) {
    return 'अपडेट $version उपलब्ध';
  }

  @override
  String get notifUpdateBody => 'इंस्टॉल करने के लिए ऐप खोलें';

  @override
  String get notifUpdatedTitle => 'ऐप अपडेट हो गया';

  @override
  String notifUpdatedBody(String version) {
    return 'इंस्टॉल किया गया संस्करण $version';
  }

  @override
  String get checkForUpdate => 'अपडेट के लिए जांचें';

  @override
  String get updateChecking => 'जांच जारी है...';

  @override
  String get updateUpToDate => 'आपके पास नवीनतम संस्करण है';

  @override
  String updateAvailable(String version) {
    return 'संस्करण $version उपलब्ध है';
  }

  @override
  String updateDownload(String percent) {
    return 'डाउनलोड हो रहा है: $percent%';
  }

  @override
  String updateButton(String version) {
    return '$version में अपडेट करें';
  }

  @override
  String updateCheckFailed(String error) {
    return 'अपडेट की जांच विफल: $error';
  }

  @override
  String updateFailed(String error) {
    return 'अपडेट विफल: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'त्रुटि: $error';
  }

  @override
  String get whatsNewLabel => 'नया क्या है';

  @override
  String get forceUpdateTitle => 'अपडेट आवश्यक है';

  @override
  String get forceUpdateBody =>
      'आपका संस्करण अब समर्थित नहीं है। जारी रखने के लिए अपडेट इंस्टॉल करें।';

  @override
  String get storageGroup => 'स्टोरेज';

  @override
  String storageUsed(String size) {
    return 'अपडेट फ़ाइलें: $size MB';
  }

  @override
  String get clearCacheAction => 'साफ़ करें';

  @override
  String get cacheCleared => 'साफ़ हो गया';
}
