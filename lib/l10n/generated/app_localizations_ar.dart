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
}
