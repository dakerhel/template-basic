// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Temel hazır';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get aboutPrivacy => 'Gizlilik politikası';

  @override
  String failedToOpen(String url) {
    return '$url açılamadı';
  }

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get languageSystem => 'Sistem gibi';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Sistem gibi';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get interfaceGroup => 'Arayüz';

  @override
  String get settingsFont => 'Yazı tipi';

  @override
  String get fontScale => 'Yazı tipi boyutu';

  @override
  String get fontSystem => 'Sistem gibi';

  @override
  String get fontDefault => 'Varsayılan';

  @override
  String get updatesGroup => 'Güncellemeler';

  @override
  String get backgroundCheckTitle => 'Arka planda güncelleme kontrolü';

  @override
  String get backgroundCheckSubtitle =>
      'Uygulama arka planda güncellemeleri kontrol eder. Pil tasarrufu için kapatın. Manuel kontrol her zaman mümkündür.';

  @override
  String get checkIntervalTitle => 'Kontrol aralığı';

  @override
  String intervalHours(String hours) {
    return '$hours sa';
  }

  @override
  String get backgroundInstallTitle => 'Arka plan kurulumu';

  @override
  String get backgroundInstallSubtitle =>
      'Bulunan güncellemeleri otomatik indir ve kur';

  @override
  String get aboutGroup => 'Uygulama hakkında';

  @override
  String get appNameLabel => 'Uygulama adı';

  @override
  String get appVersionLabel => 'Uygulama sürümü';

  @override
  String get coreVersionLabel => 'Çekirdek sürümü';

  @override
  String get deviceLabel => 'Cihaz';

  @override
  String get sourceCodeLabel => 'Kaynak kodu';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes dk';
  }

  @override
  String get installPermissionTitle => 'Yükleme izni';

  @override
  String get installPermissionSubtitle =>
      'Bu kaynaktan uygulama yüklemeye izin ver';

  @override
  String get notificationsPermissionTitle => 'Bildirim izni';

  @override
  String get notificationsPermissionSubtitle =>
      'Bulunan güncelleme bildirimleri için';

  @override
  String get notificationsGroup => 'Bildirimler';

  @override
  String get notifyUpdatesToggle => 'Güncellemelerden haberdar et';

  @override
  String get backgroundWorkTitle => 'Arka planda çalışma';

  @override
  String get backgroundWorkSubtitle =>
      'Pil kısıtlaması olmadan çalışmaya izin ver';

  @override
  String notifUpdateTitle(String version) {
    return '$version güncellemesi mevcut';
  }

  @override
  String get notifUpdateBody => 'Yüklemek için uygulamayı açın';

  @override
  String get notifUpdatedTitle => 'Uygulama güncellendi';

  @override
  String notifUpdatedBody(String version) {
    return 'Yüklü sürüm: $version';
  }

  @override
  String get checkForUpdate => 'Güncellemeleri kontrol et';

  @override
  String get updateChecking => 'Kontrol ediliyor...';

  @override
  String get updateUpToDate => 'En son sürüme sahipsiniz';

  @override
  String updateAvailable(String version) {
    return 'Sürüm $version mevcut';
  }

  @override
  String updateDownload(String percent) {
    return 'İndiriliyor: %$percent';
  }

  @override
  String updateButton(String version) {
    return '$version sürümüne güncelle';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Güncelleme kontrolü başarısız: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Güncelleme başarısız: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Hata: $error';
  }

  @override
  String get whatsNewLabel => 'Yenilikler';

  @override
  String get forceUpdateTitle => 'Güncelleme gerekli';

  @override
  String get forceUpdateBody =>
      'Sürümünüz artık desteklenmiyor. Devam etmek için güncellemeyi yükleyin.';

  @override
  String get storageGroup => 'Depolama';

  @override
  String storageUsed(String size) {
    return 'Güncelleme dosyaları: $size MB';
  }

  @override
  String get clearCacheAction => 'Temizle';

  @override
  String get cacheCleared => 'Temizlendi';
}
