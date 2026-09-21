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

  @override
  String get permissionOnboardingTitle => 'अपडेट और सुरक्षित रहें';

  @override
  String get permissionOnboardingBody =>
      'ऐप अपडेट और महत्वपूर्ण सुरक्षा चेतावनियों के लिए नोटिफिकेशन सक्षम करें।';

  @override
  String get permissionOnboardingAction => 'सूचनाएं सक्षम करें';

  @override
  String get permissionOnboardingDismiss => 'बाद में';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA अपडेट';

  @override
  String get permissionUpdatesBenefitDesc =>
      'नए संस्करणों और सुविधाओं के लिए त्वरित अलर्ट';

  @override
  String get permissionSecurityBenefitTitle => 'सुरक्षा और संरक्षण';

  @override
  String get permissionSecurityBenefitDesc =>
      'महत्वपूर्ण सुरक्षा घटनाएं और सत्र अलर्ट';

  @override
  String get permissionGrantedSnackbar => 'सूचनाएं सफलतापूर्वक सक्षम की गईं';

  @override
  String get permissionDeniedSnackbar =>
      'सूचनाएं अक्षम हैं। आप इन्हें कभी भी सेटिंग्स में चालू कर सकते हैं।';

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get profileGuestName => 'अतिथि उपयोगकर्ता';

  @override
  String get profileGuestDesc => 'स्थानीय ऑफ़लाइन सत्र';

  @override
  String get profileLinkAccount => 'खाता लिंक करें';

  @override
  String get profileLinkAccountDesc =>
      'Google, Telegram या GitHub के माध्यम से साइन इन करें';

  @override
  String get profileAccountSection => 'खाता';

  @override
  String get profileSecuritySection => 'सुरक्षा और सत्र';

  @override
  String get profileActiveSessions => 'सक्रिय डिवाइस';

  @override
  String get profileCurrentDevice => 'यह डिवाइस';

  @override
  String get profileDeleteAccount => 'प्रोफ़ाइल और डेटा साफ़ करें';

  @override
  String get profileDeleteConfirm =>
      'क्या आप सुनिश्चित हैं? सारा स्थानीय डेटा हटा दिया जाएगा।';

  @override
  String get navHome => 'होम';

  @override
  String get navShowcase => 'शोकेस';

  @override
  String get homeStarterTitle => 'डिजाइन सिस्टम स्टार्टर';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'सक्रिय सिस्टम टोकन';

  @override
  String get homeConfigure => 'कॉन्फ़िगर करें';

  @override
  String get homeQuickActions => 'त्वरित कार्रवाइयां';

  @override
  String get homeThemeSheet => 'थीम शीट';

  @override
  String get homeThemeSheetSubtitle => '9 पैलेट और मोड';

  @override
  String get homeShowcase => 'यूआई शोकेस';

  @override
  String get homeShowcaseSubtitle => 'सभी घटक';

  @override
  String get homeSecurityTest => 'सुरक्षा परीक्षण';

  @override
  String get homeSecurityTestSubtitle => 'स्क्रीन लॉक';

  @override
  String get homeDiagnostics => 'निदान';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, मेमोरी, OS';

  @override
  String get homeRiverpodState => 'Riverpod प्रतिक्रियाशील स्थिति';

  @override
  String get homeIncrement => 'बढ़ाएं';

  @override
  String get homeReset => 'रीसेट करें';

  @override
  String get liquidGlassEffect => 'Liquid Glass प्रभाव';

  @override
  String get liquidGlassSubtitle => 'ऑप्टिकल ब्लर और चमकदार परावर्तन';

  @override
  String get colorSchemes => 'रंग योजनाएं';

  @override
  String get securityGroup => 'सुरक्षा';

  @override
  String get securityPinTitle => 'पिन सुरक्षा';

  @override
  String get securityPinSubtitle => 'ऐप खोलते समय पिन कोड आवश्यक करें';

  @override
  String get securityBiometricsTitle =>
      'बायोमेट्रिक्स (फिंगरप्रिंट / फेस आईडी)';

  @override
  String get securityBiometricsSubtitle => 'डिवाइस सेंसर से त्वरित लॉगिन';

  @override
  String get securityPrivacyTitle => 'टास्क स्विचर में छिपाएं';

  @override
  String get securityPrivacySubtitle => 'ऐप्स बदलते समय गोपनीयता सुरक्षा';

  @override
  String get securityChangePin => 'पिन कोड बदलें';

  @override
  String get securityChangePinSubtitle => 'नया 4-अंकीय कोड सेट करें';

  @override
  String get securityAutoLock => 'ऑटो-लॉक समय';

  @override
  String get securityLockNow => 'अभी स्क्रीन लॉक करें';

  @override
  String get securityPinChanged => 'पिन कोड सफलतापूर्वक बदल दिया गया';

  @override
  String get securityTimeoutImmediately => 'तुरंत';

  @override
  String get securityTimeout1Min => '1 मिनट';

  @override
  String get securityTimeout5Min => '5 मिनट';

  @override
  String get securityTimeout15Min => '15 मिनट';

  @override
  String get lockScreenTitle => 'पिन कोड दर्ज करें';

  @override
  String get lockScreenLockedTitle => 'प्रवेश अवरुद्ध';

  @override
  String get lockScreenSubtitle => 'ऐप एक्सेस करने के लिए';

  @override
  String get lockScreenBiometricsReason =>
      'लॉगिन करने के लिए अपनी पहचान सत्यापित करें';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return '3 गलत प्रयासों के बाद बायोमेट्रिक्स अक्षम। पिन दर्ज करें (शेष: $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'गलत पिन। शेष प्रयास: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return '$time बाद पुनः प्रयास करें';
  }

  @override
  String get pinSetupCreate => 'पिन कोड बनाएं';

  @override
  String get pinSetupConfirm => 'पिन कोड पुष्टि करें';

  @override
  String get pinSetupEnterCurrent => 'वर्तमान पिन कोड';

  @override
  String get pinSetupEnterNew => 'नया पिन कोड';

  @override
  String get pinSetupPromptDigits => 'ऐप सुरक्षित करने के लिए 4 अंक दर्ज करें';

  @override
  String get pinSetupPromptConfirm => 'पुष्टि के लिए पिन पुनः दर्ज करें';

  @override
  String get pinSetupMismatch => 'पिन कोड मेल नहीं खाते। पुनः प्रयास करें';

  @override
  String get pinSetupTooSimple =>
      'पिन बहुत सरल है। समान या क्रमिक संख्याओं से बचें';

  @override
  String get diagnosticsTitle => 'सिस्टम निदान';

  @override
  String get diagnosticsCopy => 'निदान कॉपी करें';

  @override
  String get diagnosticsCopied => 'निदान क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get showcaseButtonsTitle => 'बटन (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 प्रकार, 3 आकार, लोडिंग स्थिति और स्प्रिंग एनिमेशन';

  @override
  String get showcaseInputsTitle => 'इनपुट फ़ील्ड (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'त्वरित क्लीयर, पासवर्ड टॉगल और स्टाइलिश खोज';

  @override
  String get showcaseToastsTitle => 'फ्लोटिंग नोटिफिकेशन (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'बैकग्राउंड ब्लर और स्वाइप डिस्मिस के साथ पॉपअप';

  @override
  String get showcaseSheetsTitle => 'मॉडल शीट्स (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'स्वाइप और Liquid Glass ब्लर के साथ एकीकृत शीट्स';

  @override
  String get showcaseBadgesTitle => 'बैज और टैग (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'चमकदार स्थिति संकेतक और इंटरैक्टिव फ़िल्टर';

  @override
  String get showcaseHapticsTitle => 'हैप्टिक फीडबैक इंजन (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => 'सुरक्षित सिमेंटिक डिवाइस कंपन पैटर्न';

  @override
  String get showcaseSegmentsTitle => 'सेगमेंटेड कंट्रोल (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'आइकन सपोर्ट के साथ स्लाइडिंग Liquid Glass संकेतक';

  @override
  String get showcaseProgressTitle => 'प्रगति संकेतक (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle => 'चमकदार नियॉन ग्रेडिएंट और गोल स्पिनर';

  @override
  String get showcaseAvatarsTitle => 'अवतार और उपस्थिति (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 आकार, स्थिति बिंदु, आद्याक्षर और ग्रेडिएंट आउटलाइन';

  @override
  String get securityDisableTitle => 'क्या पिन सुरक्षा बंद करें?';

  @override
  String get securityDisableDesc =>
      'सुरक्षा बंद करने के लिए आपका वर्तमान पिन दर्ज करना आवश्यक है।';

  @override
  String get securityDisabledToast => 'पिन सुरक्षा बंद कर दी गई';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonContinue => 'जारी रखें';

  @override
  String get diagnosticsDeviceGroup => 'डिवाइस और ओएस';

  @override
  String get diagnosticsAppGroup => 'ऐप बिल्ड जानकारी';

  @override
  String get diagnosticsDisplayGroup => 'स्क्रीन और डिस्प्ले';

  @override
  String get diagnosticsNetworkGroup => 'नेटवर्क और सुलभता';

  @override
  String get notifRouterTestTitle => 'अधिसूचना राउटर परीक्षण';

  @override
  String get notifRouterTestDesc =>
      'रूटिंग सत्यापन के लिए पेलोड के साथ परीक्षण पुश भेजें';

  @override
  String get notifSendTestButton => 'परीक्षण अधिसूचना भेजें';

  @override
  String get notifTestNotificationTitle => '🔔 परीक्षण अधिसूचना';

  @override
  String get notifTestNotificationBody =>
      'NotificationRouter पेलोड परीक्षण के लिए टैप करें';

  @override
  String get notifTestNotificationSent =>
      'परीक्षण अधिसूचना भेजी गई! सिस्टम ट्रे में इस पर टैप करें।';

  @override
  String get notifPermissionOnboardingPreview =>
      'अनुमति ऑनबोर्डिंग पूर्वावलोकन';

  @override
  String get notifSingleTitle => 'अधिसूचना';
}
