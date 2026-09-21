// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'الأساس جاهز';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get aboutPrivacy => 'سياسة الخصوصية';

  @override
  String failedToOpen(String url) {
    return 'تعذر فتح $url';
  }

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get languageSystem => 'حسب النظام';

  @override
  String get settingsTheme => 'المظهر';

  @override
  String get themeSystem => 'حسب النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get interfaceGroup => 'الواجهة';

  @override
  String get settingsFont => 'الخط';

  @override
  String get fontScale => 'حجم الخط';

  @override
  String get fontSystem => 'حسب النظام';

  @override
  String get fontDefault => 'افتراضي';

  @override
  String get updatesGroup => 'التحديثات';

  @override
  String get backgroundCheckTitle => 'التحقق من التحديثات في الخلفية';

  @override
  String get backgroundCheckSubtitle =>
      'يتحقق التطبيق من التحديثات في الخلفية. عطّله لتوفير البطارية. التحقق اليدوي متاح دائماً.';

  @override
  String get checkIntervalTitle => 'فترة التحقق';

  @override
  String intervalHours(String hours) {
    return '$hours س';
  }

  @override
  String get backgroundInstallTitle => 'التثبيت في الخلفية';

  @override
  String get backgroundInstallSubtitle =>
      'تنزيل وتثبيت التحديثات التي يتم العثور عليها تلقائياً';

  @override
  String get aboutGroup => 'حول التطبيق';

  @override
  String get appNameLabel => 'اسم التطبيق';

  @override
  String get appVersionLabel => 'إصدار التطبيق';

  @override
  String get coreVersionLabel => 'إصدار النواة';

  @override
  String get deviceLabel => 'الجهاز';

  @override
  String get sourceCodeLabel => 'الكود المصدري';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes د';
  }

  @override
  String get installPermissionTitle => 'إذن التثبيت';

  @override
  String get installPermissionSubtitle =>
      'السماح بتثبيت التطبيقات من هذا المصدر';

  @override
  String get notificationsPermissionTitle => 'إذن الإشعارات';

  @override
  String get notificationsPermissionSubtitle =>
      'للإشعارات عن التحديثات التي يتم العثور عليها';

  @override
  String get notificationsGroup => 'الإشعارات';

  @override
  String get notifyUpdatesToggle => 'إشعاري بالتحديثات';

  @override
  String get backgroundWorkTitle => 'العمل في الخلفية';

  @override
  String get backgroundWorkSubtitle => 'السماح بالعمل دون قيود البطارية';

  @override
  String notifUpdateTitle(String version) {
    return 'التحديث $version متاح';
  }

  @override
  String get notifUpdateBody => 'افتح التطبيق للتثبيت';

  @override
  String get notifUpdatedTitle => 'تم تحديث التطبيق';

  @override
  String notifUpdatedBody(String version) {
    return 'تم تثبيت الإصدار $version';
  }

  @override
  String get checkForUpdate => 'التحقق من التحديثات';

  @override
  String get updateChecking => 'جارٍ التحقق...';

  @override
  String get updateUpToDate => 'لديك أحدث إصدار';

  @override
  String updateAvailable(String version) {
    return 'الإصدار $version متاح';
  }

  @override
  String updateDownload(String percent) {
    return 'جارٍ التنزيل: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'التحديث إلى $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'فشل التحقق من التحديثات: $error';
  }

  @override
  String updateFailed(String error) {
    return 'فشل التحديث: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'خطأ: $error';
  }

  @override
  String get whatsNewLabel => 'ما الجديد';

  @override
  String get forceUpdateTitle => 'التحديث مطلوب';

  @override
  String get forceUpdateBody =>
      'إصدارك لم يعد مدعومًا. قم بتثبيت التحديث للمتابعة.';

  @override
  String get storageGroup => 'التخزين';

  @override
  String storageUsed(String size) {
    return 'ملفات التحديث: $size ميجابايت';
  }

  @override
  String get clearCacheAction => 'مسح';

  @override
  String get cacheCleared => 'تم المسح';

  @override
  String get permissionOnboardingTitle => 'ابقَ على اطلاع دائم';

  @override
  String get permissionOnboardingBody =>
      'قم بتمكين الإشعارات لتلقي تنبيهات فورية حول تحديثات التطبيق والأمان.';

  @override
  String get permissionOnboardingAction => 'تمكين الإشعارات';

  @override
  String get permissionOnboardingDismiss => 'لاحقاً';

  @override
  String get permissionUpdatesBenefitTitle => 'تحديثات OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'تنبيهات فورية للإصدارات والميزات الجديدة';

  @override
  String get permissionSecurityBenefitTitle => 'الأمان والحماية';

  @override
  String get permissionSecurityBenefitDesc =>
      'تنبيهات أحداث الأمان الهامة والجلسات';

  @override
  String get permissionGrantedSnackbar => 'تم تمكين الإشعارات بنجاح';

  @override
  String get permissionDeniedSnackbar =>
      'الإشعارات معطلة. يمكنك تفعيلها من الإعدادات.';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get profileGuestName => 'مستخدم ضيف';

  @override
  String get profileGuestDesc => 'جلسة محلية بدون اتصال بالإنترنت';

  @override
  String get profileLinkAccount => 'ربط الحساب';

  @override
  String get profileLinkAccountDesc =>
      'تسجيل الدخول عبر Google أو Telegram أو GitHub';

  @override
  String get profileAccountSection => 'الحساب';

  @override
  String get profileSecuritySection => 'الأمان والجلسات';

  @override
  String get profileActiveSessions => 'الأجهزة النشطة';

  @override
  String get profileCurrentDevice => 'هذا الجهاز';

  @override
  String get profileDeleteAccount => 'مسح الملف الشخصي والبيانات';

  @override
  String get profileDeleteConfirm =>
      'هل أنت متأكد؟ سيتم حذف جميع البيانات المحلية.';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navShowcase => 'المعرض';

  @override
  String get homeStarterTitle => 'حزمة بداية نظام التصميم';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'رموز النظام النشطة';

  @override
  String get homeConfigure => 'تخصيص';

  @override
  String get homeQuickActions => 'إجراءات سريعة';

  @override
  String get homeThemeSheet => 'قائمة السمات';

  @override
  String get homeThemeSheetSubtitle => '9 لوحات وأوضاع';

  @override
  String get homeShowcase => 'معرض الواجهة';

  @override
  String get homeShowcaseSubtitle => 'جميع المكونات';

  @override
  String get homeSecurityTest => 'اختبار الأمان';

  @override
  String get homeSecurityTestSubtitle => 'قفل الشاشة';

  @override
  String get homeDiagnostics => 'التشخيص';

  @override
  String get homeDiagnosticsSubtitle => 'DPR، الذاكرة، النظام';

  @override
  String get homeRiverpodState => 'حالة Riverpod التفاعلية';

  @override
  String get homeIncrement => 'زيادة';

  @override
  String get homeReset => 'إعادة تعيين';

  @override
  String get liquidGlassEffect => 'تأثير Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'تمويه بصري وانعكاسات زجاجية';

  @override
  String get colorSchemes => 'لوحات الألوان';

  @override
  String get securityGroup => 'الأمان والخصوصية';

  @override
  String get securityPinTitle => 'الحماية برمز PIN';

  @override
  String get securityPinSubtitle => 'طلب رمز PIN عند فتح التطبيق';

  @override
  String get securityBiometricsTitle => 'المصادقة البيومترية (بصمة / Face ID)';

  @override
  String get securityBiometricsSubtitle => 'دخول سريع باستخدام مستشعر الجهاز';

  @override
  String get securityPrivacyTitle => 'إخفاء المحتوى في قائمة المهام';

  @override
  String get securityPrivacySubtitle =>
      'حماية الخصوصية عند التبديل بين التطبيقات';

  @override
  String get securityChangePin => 'تغيير رمز PIN';

  @override
  String get securityChangePinSubtitle => 'تعيين رمز جديد من 4 أرقام';

  @override
  String get securityAutoLock => 'مدة القفل التلقائي';

  @override
  String get securityLockNow => 'قفل الشاشة الآن';

  @override
  String get securityPinChanged => 'تم تغيير رمز PIN بنجاح';

  @override
  String get securityTimeoutImmediately => 'فوراً';

  @override
  String get securityTimeout1Min => 'دقيقة واحدة';

  @override
  String get securityTimeout5Min => '5 دقائق';

  @override
  String get securityTimeout15Min => '15 دقيقة';

  @override
  String get lockScreenTitle => 'أدخل رمز PIN';

  @override
  String get lockScreenLockedTitle => 'تم قفل الإدخال';

  @override
  String get lockScreenSubtitle => 'للوصول إلى التطبيق';

  @override
  String get lockScreenBiometricsReason => 'يرجى تأكيد الهوية للدخول';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'تم تعطيل القياسات الحيوية بعد 3 أخطاء. أدخل الرمز (المتبقي: $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'رمز PIN غير صحيح. المحاولات المتبقية: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'حاول مرة أخرى بعد $time';
  }

  @override
  String get pinSetupCreate => 'إنشاء رمز PIN';

  @override
  String get pinSetupConfirm => 'تأكيد رمز PIN';

  @override
  String get pinSetupEnterCurrent => 'رمز PIN الحالي';

  @override
  String get pinSetupEnterNew => 'رمز PIN الجديد';

  @override
  String get pinSetupPromptDigits => 'أدخل 4 أرقام لحماية التطبيق';

  @override
  String get pinSetupPromptConfirm => 'أعد إدخال رمز PIN للتأكيد';

  @override
  String get pinSetupMismatch => 'الرمزان غير متطابقين. يرجى المحاولة مرة أخرى';

  @override
  String get pinSetupTooSimple =>
      'الرمز بسيط جداً. تجنب الأرقام المتطابقة أو المتتالية';

  @override
  String get diagnosticsTitle => 'تشخيص النظام';

  @override
  String get diagnosticsCopy => 'نسخ التشخيص';

  @override
  String get diagnosticsCopied => 'تم نسخ التشخيص إلى الحافظة';

  @override
  String get showcaseButtonsTitle => 'الأزرار (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 أشكال، 3 أحجام، حالات التحميل وحركات فيزيائية مرنة';

  @override
  String get showcaseInputsTitle => 'حقول الإدخال (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'مسح سريع، تبديل رؤية كلمة المرور وبحث منسق';

  @override
  String get showcaseToastsTitle => 'إشعارات منبثقة (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'تنبيهات عائمة مع تمويه الخلفية والسحب للإغلاق';

  @override
  String get showcaseSheetsTitle => 'القوائم السفلية (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'قوائم موحدة مع السحب وتأثير Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'الشارات والعلامات (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle => 'مؤشرات حالة متوهجة وفلاتر تفاعلية';

  @override
  String get showcaseHapticsTitle => 'محرك اللمس (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => 'أنماط اهتزاز دلالية وآمنة للجهاز';

  @override
  String get showcaseSegmentsTitle => 'أشرطة التبديل (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'مؤشر Liquid Glass منزلق يدعم الأيقونات';

  @override
  String get showcaseProgressTitle => 'أشرطة التقدم (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle => 'تدرجات نيون متوهجة ومؤشرات دائرية';

  @override
  String get showcaseAvatarsTitle => 'الصور الرمزية والحالة (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 أحجام، نقطة الحالة، الأحرف الأولى وإطار متدرج';

  @override
  String get securityDisableTitle => 'تعطيل الحماية برمز PIN؟';

  @override
  String get securityDisableDesc => 'يلزم إدخال رمز PIN الحالي لتعطيل الحماية.';

  @override
  String get securityDisabledToast => 'تم تعطيل الحماية برمز PIN';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get diagnosticsDeviceGroup => 'الجهاز ونظام التشغيل';

  @override
  String get diagnosticsAppGroup => 'معلومات إصدار التطبيق';

  @override
  String get diagnosticsDisplayGroup => 'الشاشة والعرض';

  @override
  String get diagnosticsNetworkGroup => 'الشبكة وإمكانية الوصول';

  @override
  String get notifRouterTestTitle => 'اختبار موجه الإشعارات';

  @override
  String get notifRouterTestDesc =>
      'إرسال إشعار تجريبي مع حمولة للتحقق من موجه التوجيه';

  @override
  String get notifSendTestButton => 'إرسال إشعار تجريبي';

  @override
  String get notifTestNotificationTitle => '🔔 إشعار تجريبي';

  @override
  String get notifTestNotificationBody =>
      'انقر لاختبار معالجة حمولة NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      'تم إرسال الإشعار التجريبي! انقر عليه في شريط الإشعارات.';

  @override
  String get notifPermissionOnboardingPreview => 'معاينة إعداد الأذونات';

  @override
  String get notifSingleTitle => 'إشعار';
}
