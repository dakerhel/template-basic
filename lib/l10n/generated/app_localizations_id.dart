// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Fondasi siap';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get aboutPrivacy => 'Kebijakan privasi';

  @override
  String failedToOpen(String url) {
    return 'Gagal membuka $url';
  }

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get languageSystem => 'Ikuti sistem';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Ikuti sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get interfaceGroup => 'Antarmuka';

  @override
  String get settingsFont => 'Font';

  @override
  String get fontScale => 'Ukuran font';

  @override
  String get fontSystem => 'Ikuti sistem';

  @override
  String get fontDefault => 'Bawaan';

  @override
  String get updatesGroup => 'Pembaruan';

  @override
  String get backgroundCheckTitle => 'Pemeriksaan pembaruan latar belakang';

  @override
  String get backgroundCheckSubtitle =>
      'Aplikasi memeriksa pembaruan di latar belakang. Matikan untuk menghemat baterai. Pemeriksaan manual selalu tersedia.';

  @override
  String get checkIntervalTitle => 'Interval pemeriksaan';

  @override
  String intervalHours(String hours) {
    return '$hours jam';
  }

  @override
  String get backgroundInstallTitle => 'Instalasi latar belakang';

  @override
  String get backgroundInstallSubtitle =>
      'Otomatis unduh dan instal pembaruan yang ditemukan';

  @override
  String get aboutGroup => 'Tentang aplikasi';

  @override
  String get appNameLabel => 'Nama aplikasi';

  @override
  String get appVersionLabel => 'Versi aplikasi';

  @override
  String get coreVersionLabel => 'Versi inti';

  @override
  String get deviceLabel => 'Perangkat';

  @override
  String get sourceCodeLabel => 'Kode sumber';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes mnt';
  }

  @override
  String get installPermissionTitle => 'Izin instalasi';

  @override
  String get installPermissionSubtitle =>
      'Izinkan memasang aplikasi dari sumber ini';

  @override
  String get notificationsPermissionTitle => 'Izin notifikasi';

  @override
  String get notificationsPermissionSubtitle =>
      'Untuk notifikasi pembaruan yang ditemukan';

  @override
  String get notificationsGroup => 'Notifikasi';

  @override
  String get notifyUpdatesToggle => 'Beri tahu tentang pembaruan';

  @override
  String get backgroundWorkTitle => 'Eksekusi latar belakang';

  @override
  String get backgroundWorkSubtitle =>
      'Izinkan berjalan tanpa pembatasan baterai';

  @override
  String notifUpdateTitle(String version) {
    return 'Pembaruan $version tersedia';
  }

  @override
  String get notifUpdateBody => 'Buka aplikasi untuk memasang';

  @override
  String get notifUpdatedTitle => 'Aplikasi diperbarui';

  @override
  String notifUpdatedBody(String version) {
    return 'Versi terpasang: $version';
  }

  @override
  String get checkForUpdate => 'Periksa pembaruan';

  @override
  String get updateChecking => 'Memeriksa...';

  @override
  String get updateUpToDate => 'Anda sudah memiliki versi terbaru';

  @override
  String updateAvailable(String version) {
    return 'Versi $version tersedia';
  }

  @override
  String updateDownload(String percent) {
    return 'Mengunduh: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Perbarui ke $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Gagal memeriksa pembaruan: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Pembaruan gagal: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get whatsNewLabel => 'Yang baru';

  @override
  String get forceUpdateTitle => 'Pembaruan diperlukan';

  @override
  String get forceUpdateBody =>
      'Versi Anda tidak lagi didukung. Instal pembaruan untuk melanjutkan.';

  @override
  String get storageGroup => 'Penyimpanan';

  @override
  String storageUsed(String size) {
    return 'File pembaruan: $size MB';
  }

  @override
  String get clearCacheAction => 'Hapus';

  @override
  String get cacheCleared => 'Dihapus';

  @override
  String get permissionOnboardingTitle => 'Tetap Terinformasi & Aman';

  @override
  String get permissionOnboardingBody =>
      'Aktifkan notifikasi untuk menerima info pembaruan instan dan peringatan keamanan.';

  @override
  String get permissionOnboardingAction => 'Aktifkan Notifikasi';

  @override
  String get permissionOnboardingDismiss => 'Nanti Saja';

  @override
  String get permissionUpdatesBenefitTitle => 'Pembaruan OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Peringatan instan untuk versi & fitur baru';

  @override
  String get permissionSecurityBenefitTitle => 'Keamanan & Perlindungan';

  @override
  String get permissionSecurityBenefitDesc =>
      'Peringatan peristiwa keamanan kritis & sesi';

  @override
  String get permissionGrantedSnackbar => 'Notifikasi berhasil diaktifkan';

  @override
  String get permissionDeniedSnackbar =>
      'Notifikasi dinonaktifkan. Anda dapat mengaktifkannya di Pengaturan kapan saja.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileGuestName => 'Pengguna Tamu';

  @override
  String get profileGuestDesc => 'Sesi offline lokal';

  @override
  String get profileLinkAccount => 'Tautkan Akun';

  @override
  String get profileLinkAccountDesc =>
      'Masuk dengan Google, Telegram, atau GitHub';

  @override
  String get profileAccountSection => 'Akun';

  @override
  String get profileSecuritySection => 'Keamanan & Sesi';

  @override
  String get profileActiveSessions => 'Perangkat Aktif';

  @override
  String get profileCurrentDevice => 'Perangkat Ini';

  @override
  String get profileDeleteAccount => 'Hapus Profil & Data';

  @override
  String get profileDeleteConfirm =>
      'Apakah Anda yakin? Semua data lokal akan dihapus.';

  @override
  String get navHome => 'Beranda';

  @override
  String get navShowcase => 'Etalase';

  @override
  String get homeStarterTitle => 'Starter Sistem Desain';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Token sistem aktif';

  @override
  String get homeConfigure => 'Konfigurasi';

  @override
  String get homeQuickActions => 'Aksi cepat';

  @override
  String get homeThemeSheet => 'Menu tema';

  @override
  String get homeThemeSheetSubtitle => '9 palet & mode';

  @override
  String get homeShowcase => 'Showcase UI';

  @override
  String get homeShowcaseSubtitle => 'Semua komponen';

  @override
  String get homeSecurityTest => 'Uji keamanan';

  @override
  String get homeSecurityTestSubtitle => 'Kunci layar';

  @override
  String get homeDiagnostics => 'Diagnostik';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, memori, OS';

  @override
  String get homeRiverpodState => 'Status reaktif Riverpod';

  @override
  String get homeIncrement => 'Tambah';

  @override
  String get homeReset => 'Reset';

  @override
  String get liquidGlassEffect => 'Efek Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'Buram optik & pantulan cahaya';

  @override
  String get colorSchemes => 'Skema Warna';

  @override
  String get securityGroup => 'Keamanan';

  @override
  String get securityPinTitle => 'Perlindungan PIN';

  @override
  String get securityPinSubtitle => 'Minta kode PIN saat membuka aplikasi';

  @override
  String get securityBiometricsTitle => 'Biometrik (Sidik Jari / Face ID)';

  @override
  String get securityBiometricsSubtitle =>
      'Masuk cepat dengan sensor perangkat';

  @override
  String get securityPrivacyTitle => 'Sembunyikan di pengalih aplikasi';

  @override
  String get securityPrivacySubtitle =>
      'Perlindungan privasi saat beralih aplikasi';

  @override
  String get securityChangePin => 'Ubah kode PIN';

  @override
  String get securityChangePinSubtitle => 'Atur kode 4 digit baru';

  @override
  String get securityAutoLock => 'Waktu kunci otomatis';

  @override
  String get securityLockNow => 'Kunci layar sekarang';

  @override
  String get securityPinChanged => 'Kode PIN berhasil diubah';

  @override
  String get securityTimeoutImmediately => 'Segera';

  @override
  String get securityTimeout1Min => '1 menit';

  @override
  String get securityTimeout5Min => '5 menit';

  @override
  String get securityTimeout15Min => '15 menit';

  @override
  String get lockScreenTitle => 'Masukkan kode PIN';

  @override
  String get lockScreenLockedTitle => 'Akses terkunci';

  @override
  String get lockScreenSubtitle => 'Untuk mengakses aplikasi';

  @override
  String get lockScreenBiometricsReason =>
      'Konfirmasi identitas Anda untuk masuk';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometrik dinonaktifkan setelah 3 kegagalan. Masukkan PIN (sisa: $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PIN salah. Sisa percobaan: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Coba lagi dalam $time';
  }

  @override
  String get pinSetupCreate => 'Buat kode PIN';

  @override
  String get pinSetupConfirm => 'Konfirmasi kode PIN';

  @override
  String get pinSetupEnterCurrent => 'Kode PIN saat ini';

  @override
  String get pinSetupEnterNew => 'Kode PIN baru';

  @override
  String get pinSetupPromptDigits =>
      'Masukkan 4 digit untuk mengamankan aplikasi';

  @override
  String get pinSetupPromptConfirm => 'Masukkan kembali PIN untuk konfirmasi';

  @override
  String get pinSetupMismatch => 'Kode PIN tidak cocok. Coba lagi';

  @override
  String get pinSetupTooSimple =>
      'PIN terlalu sederhana. Hindari angka identik atau berurutan';

  @override
  String get diagnosticsTitle => 'Diagnostik Sistem';

  @override
  String get diagnosticsCopy => 'Salin diagnostik';

  @override
  String get diagnosticsCopied => 'Diagnostik disalin ke papan klip';

  @override
  String get showcaseButtonsTitle => 'Tombol (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 varian, 3 ukuran, status memuat & animasi pegas';

  @override
  String get showcaseInputsTitle => 'Bidang Input (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Hapus cepat, tombol sembunyikan kata sandi & pencarian';

  @override
  String get showcaseToastsTitle => 'Notifikasi Melayang (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Pemberitahuan popup dengan latar belakang buram & usap untuk menutup';

  @override
  String get showcaseSheetsTitle => 'Lembar Modal (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Lembar bawah terpadu dengan gerakan geser & Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'Lencana & Tag (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Indikator status bersinar & filter interaktif';

  @override
  String get showcaseHapticsTitle => 'Mesin Umpan Balik Haptik (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Pola getaran perangkat semantik yang aman';

  @override
  String get showcaseSegmentsTitle =>
      'Kontrol Tersegmentasi (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Indikator Liquid Glass geser dengan dukungan ikon';

  @override
  String get showcaseProgressTitle => 'Bilah Kemajuan (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Gradien neon bersinar & pemutar lingkaran';

  @override
  String get showcaseAvatarsTitle => 'Avatar & Kehadiran (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 ukuran, titik status, inisial & garis batas gradien';

  @override
  String get securityDisableTitle => 'Nonaktifkan Perlindungan PIN?';

  @override
  String get securityDisableDesc =>
      'Memasukkan PIN saat ini diperlukan untuk menonaktifkan perlindungan.';

  @override
  String get securityDisabledToast => 'Perlindungan PIN dinonaktifkan';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonContinue => 'Lanjutkan';

  @override
  String get diagnosticsDeviceGroup => 'Perangkat & OS';

  @override
  String get diagnosticsAppGroup => 'Info Build Aplikasi';

  @override
  String get diagnosticsDisplayGroup => 'Layar & Tampilan';

  @override
  String get diagnosticsNetworkGroup => 'Jaringan & Aksesibilitas';

  @override
  String get notifRouterTestTitle => 'Uji Router Notifikasi';

  @override
  String get notifRouterTestDesc =>
      'Kirim push uji dengan muatan untuk memverifikasi perutean';

  @override
  String get notifSendTestButton => 'Kirim Notifikasi Uji';

  @override
  String get notifTestNotificationTitle => '🔔 Notifikasi Uji';

  @override
  String get notifTestNotificationBody =>
      'Ketuk untuk menguji penanganan muatan NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      'Notifikasi uji terkirim! Ketuk di panel notifikasi sistem.';

  @override
  String get notifPermissionOnboardingPreview => 'Pratinjau Onboarding Izin';

  @override
  String get notifSingleTitle => 'Notifikasi';
}
