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
}
