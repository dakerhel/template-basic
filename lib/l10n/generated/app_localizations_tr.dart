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

  @override
  String get permissionOnboardingTitle => 'Haberdar Kalın';

  @override
  String get permissionOnboardingBody =>
      'Güncellemeler ve güvenlik uyarıları hakkında anında bilgi almak için bildirimleri etkinleştirin.';

  @override
  String get permissionOnboardingAction => 'Bildirimleri Etkinleştir';

  @override
  String get permissionOnboardingDismiss => 'Daha Sonra';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA Güncellemeleri';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Yeni sürümler ve özellikler için anında uyarılar';

  @override
  String get permissionSecurityBenefitTitle => 'Güvenlik ve Koruma';

  @override
  String get permissionSecurityBenefitDesc =>
      'Kritik güvenlik olayları ve oturum uyarıları';

  @override
  String get permissionGrantedSnackbar =>
      'Bildirimler başarıyla etkinleştirildi';

  @override
  String get permissionDeniedSnackbar =>
      'Bildirimler devre dışı. Ayarlar bölümünden istediğiniz zaman etkinleştirebilirsiniz.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileGuestName => 'Misafir Kullanıcı';

  @override
  String get profileGuestDesc => 'Yerel çevrimdışı oturum';

  @override
  String get profileLinkAccount => 'Hesap Bağla';

  @override
  String get profileLinkAccountDesc =>
      'Google, Telegram veya GitHub ile bağlanın';

  @override
  String get profileAccountSection => 'Hesap';

  @override
  String get profileSecuritySection => 'Güvenlik ve Oturumlar';

  @override
  String get profileActiveSessions => 'Aktif Cihazlar';

  @override
  String get profileCurrentDevice => 'Bu Cihaz';

  @override
  String get profileDeleteAccount => 'Profili ve Verileri Temizle';

  @override
  String get profileDeleteConfirm =>
      'Emin misiniz? Tüm yerel veriler silinecektir.';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navShowcase => 'Vitrin';

  @override
  String get homeStarterTitle => 'Tasarım Sistemi Başlatıcı';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Aktif sistem belirteçleri';

  @override
  String get homeConfigure => 'Yapılandır';

  @override
  String get homeQuickActions => 'Hızlı işlemler';

  @override
  String get homeThemeSheet => 'Tema menüsü';

  @override
  String get homeThemeSheetSubtitle => '9 palet ve mod';

  @override
  String get homeShowcase => 'UI Vitrini';

  @override
  String get homeShowcaseSubtitle => 'Tüm bileşenler';

  @override
  String get homeSecurityTest => 'Güvenlik testi';

  @override
  String get homeSecurityTestSubtitle => 'Ekran kilidi';

  @override
  String get homeDiagnostics => 'Tanılama';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, bellek, işletim sistemi';

  @override
  String get homeRiverpodState => 'Riverpod reaktif durumu';

  @override
  String get homeIncrement => 'Artır';

  @override
  String get homeReset => 'Sıfırla';

  @override
  String get liquidGlassEffect => 'Liquid Glass Etkisi';

  @override
  String get liquidGlassSubtitle => 'Optik bulanıklık ve yansımalar';

  @override
  String get colorSchemes => 'Renk Paletleri';

  @override
  String get securityGroup => 'Güvenlik';

  @override
  String get securityPinTitle => 'PIN Koruması';

  @override
  String get securityPinSubtitle => 'Uygulama açılışında PIN iste';

  @override
  String get securityBiometricsTitle => 'Biyometri (Parmak İzi / Face ID)';

  @override
  String get securityBiometricsSubtitle => 'Cihaz sensörü ile hızlı giriş';

  @override
  String get securityPrivacyTitle => 'Görev listesinde gizle';

  @override
  String get securityPrivacySubtitle =>
      'Uygulama değiştirirken gizlilik koruması';

  @override
  String get securityChangePin => 'PIN Kodunu Değiştir';

  @override
  String get securityChangePinSubtitle => 'Yeni 4 haneli kod belirle';

  @override
  String get securityAutoLock => 'Otomatik kilit süresi';

  @override
  String get securityLockNow => 'Ekranı şimdi kilitle';

  @override
  String get securityPinChanged => 'PIN kodu başarıyla değiştirildi';

  @override
  String get securityTimeoutImmediately => 'Hemen';

  @override
  String get securityTimeout1Min => '1 dakika';

  @override
  String get securityTimeout5Min => '5 dakika';

  @override
  String get securityTimeout15Min => '15 dakika';

  @override
  String get lockScreenTitle => 'PIN Kodunu Girin';

  @override
  String get lockScreenLockedTitle => 'Giriş Kilitlendi';

  @override
  String get lockScreenSubtitle => 'Uygulamaya erişmek için';

  @override
  String get lockScreenBiometricsReason =>
      'Giriş yapmak için kimliğinizi doğrulayın';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return '3 hatalı denemeden sonra biyometri devre dışı. PIN girin ($remaining kaldı)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'Yanlış PIN. Kalan deneme: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return '$time sonra tekrar deneyin';
  }

  @override
  String get pinSetupCreate => 'PIN Kodu Oluştur';

  @override
  String get pinSetupConfirm => 'PIN Kodunu Onayla';

  @override
  String get pinSetupEnterCurrent => 'Mevcut PIN Kodu';

  @override
  String get pinSetupEnterNew => 'Yeni PIN Kodu';

  @override
  String get pinSetupPromptDigits => 'Uygulamayı korumak için 4 hane girin';

  @override
  String get pinSetupPromptConfirm => 'Onaylamak için PIN kodunu tekrar girin';

  @override
  String get pinSetupMismatch => 'PIN kodları eşleşmiyor. Tekrar deneyin';

  @override
  String get pinSetupTooSimple =>
      'PIN çok basit. Aynı veya ardışık sayılardan kaçının';

  @override
  String get diagnosticsTitle => 'Sistem Tanılama';

  @override
  String get diagnosticsCopy => 'Tanılamayı kopyala';

  @override
  String get diagnosticsCopied => 'Tanılama panoya kopyalandı';

  @override
  String get showcaseButtonsTitle => 'Düğmeler (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 varyant, 3 boyut, yükleme durumları ve yay fiziği';

  @override
  String get showcaseInputsTitle => 'Giriş Alanları (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Hızlı temizleme, şifre gizleme/gösterme ve arama';

  @override
  String get showcaseToastsTitle => 'Kayan Bildirimler (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Arka plan bulanıklığı ve kaydırarak kapatma';

  @override
  String get showcaseSheetsTitle => 'Modal Sayfalar (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Kaydırma ve Liquid Glass bulanıklığına sahip sayfalar';

  @override
  String get showcaseBadgesTitle =>
      'Rozetler ve Etiketler (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Parlayan durum göstergeleri ve etkileşimli filtreler';

  @override
  String get showcaseHapticsTitle =>
      'Dokunsal Geri Bildirim Motoru (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Güvenli anlamsal cihaz titreşim desenleri';

  @override
  String get showcaseSegmentsTitle =>
      'Segment Kontrolleri (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Simgeleri destekleyen kayan Liquid Glass göstergesi';

  @override
  String get showcaseProgressTitle => 'İlerleme Çubukları (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Parlayan neon gradyanlar ve dairesel yükleyiciler';

  @override
  String get showcaseAvatarsTitle => 'Avatarlar ve Durum (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 boyut, durum noktası, baş harfler ve gradyan kenarlık';

  @override
  String get securityDisableTitle => 'PIN Korumasını Devre Dışı Bırak?';

  @override
  String get securityDisableDesc =>
      'Korumayı devre dışı bırakmak için mevcut PIN kodunuzu girmeniz gerekir.';

  @override
  String get securityDisabledToast => 'PIN koruması devre dışı bırakıldı';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonContinue => 'Devam Et';

  @override
  String get diagnosticsDeviceGroup => 'Cihaz ve İşletim Sistemi';

  @override
  String get diagnosticsAppGroup => 'Uygulama Yapı Bilgisi';

  @override
  String get diagnosticsDisplayGroup => 'Ekran ve Görüntü';

  @override
  String get diagnosticsNetworkGroup => 'Ağ ve Erişilebilirlik';

  @override
  String get notifRouterTestTitle => 'Bildirim Yönlendirici Testi';

  @override
  String get notifRouterTestDesc =>
      'Yönlendirme dağıtıcısını doğrulamak için test bildirimi gönder';

  @override
  String get notifSendTestButton => 'Test Bildirimi Gönder';

  @override
  String get notifTestNotificationTitle => '🔔 Test Bildirimi';

  @override
  String get notifTestNotificationBody =>
      'NotificationRouter yük işlemesini test etmek için dokunun';

  @override
  String get notifTestNotificationSent =>
      'Test bildirimi gönderildi! Bildirim panelinde üzerine dokunun.';

  @override
  String get notifPermissionOnboardingPreview => 'İzin Katılımını Önizle';

  @override
  String get notifSingleTitle => 'Bildirim';
}
