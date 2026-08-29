// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Basis ist bereit';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get aboutPrivacy => 'Datenschutzrichtlinie';

  @override
  String failedToOpen(String url) {
    return '$url konnte nicht geöffnet werden';
  }

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get languageSystem => 'Wie im System';

  @override
  String get settingsTheme => 'Design';

  @override
  String get themeSystem => 'Wie im System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get interfaceGroup => 'Oberfläche';

  @override
  String get settingsFont => 'Schrift';

  @override
  String get fontScale => 'Schriftgröße';

  @override
  String get fontSystem => 'Wie im System';

  @override
  String get fontDefault => 'Standard';

  @override
  String get updatesGroup => 'Updates';

  @override
  String get backgroundCheckTitle => 'Hintergrund-Update-Prüfung';

  @override
  String get backgroundCheckSubtitle =>
      'Die App prüft im Hintergrund auf Updates. Zum Akkusparen deaktivieren. Die manuelle Prüfung ist jederzeit möglich.';

  @override
  String get checkIntervalTitle => 'Prüfintervall';

  @override
  String intervalHours(String hours) {
    return '$hours Std.';
  }

  @override
  String get backgroundInstallTitle => 'Hintergrundinstallation';

  @override
  String get backgroundInstallSubtitle =>
      'Gefundene Updates automatisch herunterladen und installieren';

  @override
  String get aboutGroup => 'Über die App';

  @override
  String get appNameLabel => 'App-Name';

  @override
  String get appVersionLabel => 'App-Version';

  @override
  String get coreVersionLabel => 'Kern-Version';

  @override
  String get deviceLabel => 'Gerät';

  @override
  String get sourceCodeLabel => 'Quellcode';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes Min.';
  }

  @override
  String get installPermissionTitle => 'Installationsberechtigung';

  @override
  String get installPermissionSubtitle =>
      'Installation von Apps aus dieser Quelle erlauben';

  @override
  String get notificationsPermissionTitle => 'Benachrichtigungsberechtigung';

  @override
  String get notificationsPermissionSubtitle =>
      'Für Benachrichtigungen über gefundene Updates';

  @override
  String get notificationsGroup => 'Benachrichtigungen';

  @override
  String get notifyUpdatesToggle => 'Über Updates benachrichtigen';

  @override
  String get backgroundWorkTitle => 'Hintergrund-Ausführung';

  @override
  String get backgroundWorkSubtitle =>
      'Ausführung ohne Akku-Einschränkungen erlauben';

  @override
  String notifUpdateTitle(String version) {
    return 'Update $version verfügbar';
  }

  @override
  String get notifUpdateBody => 'App öffnen, um zu installieren';

  @override
  String get notifUpdatedTitle => 'App aktualisiert';

  @override
  String notifUpdatedBody(String version) {
    return 'Installierte Version: $version';
  }

  @override
  String get checkForUpdate => 'Nach Updates suchen';

  @override
  String get updateChecking => 'Wird geprüft...';

  @override
  String get updateUpToDate => 'Du hast die neueste Version';

  @override
  String updateAvailable(String version) {
    return 'Version $version verfügbar';
  }

  @override
  String updateDownload(String percent) {
    return 'Wird geladen: $percent %';
  }

  @override
  String updateButton(String version) {
    return 'Auf $version aktualisieren';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Update-Prüfung fehlgeschlagen: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Update fehlgeschlagen: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Fehler: $error';
  }

  @override
  String get whatsNewLabel => 'Neuigkeiten';

  @override
  String get forceUpdateTitle => 'Aktualisierung erforderlich';

  @override
  String get forceUpdateBody =>
      'Ihre Version wird nicht mehr unterstützt. Installieren Sie das Update, um fortzufahren.';

  @override
  String get storageGroup => 'Speicher';

  @override
  String storageUsed(String size) {
    return 'Updatedateien: $size MB';
  }

  @override
  String get clearCacheAction => 'Löschen';

  @override
  String get cacheCleared => 'Gelöscht';

  @override
  String get permissionOnboardingTitle => 'Auf dem Laufenden bleiben';

  @override
  String get permissionOnboardingBody =>
      'Aktivieren Sie Benachrichtigungen, um sofort über neue Updates und Sicherheitsmeldungen informiert zu werden.';

  @override
  String get permissionOnboardingAction => 'Benachrichtigungen aktivieren';

  @override
  String get permissionOnboardingDismiss => 'Später';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA-Updates';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Sofortige Hinweise auf neue Versionen & Features';

  @override
  String get permissionSecurityBenefitTitle => 'Sicherheit & Schutz';

  @override
  String get permissionSecurityBenefitDesc =>
      'Kritische Sicherheitsereignisse & Sitzungswarnungen';

  @override
  String get permissionGrantedSnackbar =>
      'Benachrichtigungen erfolgreich aktiviert';

  @override
  String get permissionDeniedSnackbar =>
      'Benachrichtigungen deaktiviert. Sie können sie jederzeit in den Einstellungen aktivieren.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileGuestName => 'Gastbenutzer';

  @override
  String get profileGuestDesc => 'Lokale Offline-Sitzung';

  @override
  String get profileLinkAccount => 'Konto verknüpfen';

  @override
  String get profileLinkAccountDesc =>
      'Mit Google, Telegram oder GitHub anmelden';

  @override
  String get profileAccountSection => 'Konto';

  @override
  String get profileSecuritySection => 'Sicherheit & Sitzungen';

  @override
  String get profileActiveSessions => 'Aktive Geräte';

  @override
  String get profileCurrentDevice => 'Dieses Gerät';

  @override
  String get profileDeleteAccount => 'Profil & Daten löschen';

  @override
  String get profileDeleteConfirm =>
      'Sind Sie sicher? Alle lokalen Daten werden gelöscht.';
}
