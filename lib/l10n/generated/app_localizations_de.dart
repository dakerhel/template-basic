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

  @override
  String get navHome => 'Startseite';

  @override
  String get navShowcase => 'Showcase';

  @override
  String get homeStarterTitle => 'Design-System Starter';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Aktive System-Tokens';

  @override
  String get homeConfigure => 'Konfigurieren';

  @override
  String get homeQuickActions => 'Schnellaktionen';

  @override
  String get homeThemeSheet => 'Design-Menü';

  @override
  String get homeThemeSheetSubtitle => '9 Farbpaletten & Modi';

  @override
  String get homeShowcase => 'UI-Showcase';

  @override
  String get homeShowcaseSubtitle => 'Alle Komponenten';

  @override
  String get homeSecurityTest => 'Sicherheitstest';

  @override
  String get homeSecurityTestSubtitle => 'Bildschirmsperre';

  @override
  String get homeDiagnostics => 'Diagnose';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, Speicher, OS';

  @override
  String get homeRiverpodState => 'Reaktiver Riverpod-Status';

  @override
  String get homeIncrement => 'Erhöhen';

  @override
  String get homeReset => 'Zurücksetzen';

  @override
  String get liquidGlassEffect => 'Liquid Glass-Effekt';

  @override
  String get liquidGlassSubtitle => 'Optische Unschärfe und Glanzeffekte';

  @override
  String get colorSchemes => 'Farbschemata';

  @override
  String get securityGroup => 'Sicherheit';

  @override
  String get securityPinTitle => 'PIN-Schutz';

  @override
  String get securityPinSubtitle => 'PIN-Code beim App-Start anfordern';

  @override
  String get securityBiometricsTitle => 'Biometrie (Fingerabdruck / Face ID)';

  @override
  String get securityBiometricsSubtitle => 'Schneller Login mit Gerätesensor';

  @override
  String get securityPrivacyTitle => 'Im App-Umschalter verbergen';

  @override
  String get securityPrivacySubtitle => 'Sichtschutz beim Wechseln von Apps';

  @override
  String get securityChangePin => 'PIN-Code ändern';

  @override
  String get securityChangePinSubtitle => 'Neuen 4-stelligen Code festlegen';

  @override
  String get securityAutoLock => 'Automatische Sperrzeit';

  @override
  String get securityLockNow => 'Bildschirm jetzt sperren';

  @override
  String get securityPinChanged => 'PIN-Code erfolgreich geändert';

  @override
  String get securityTimeoutImmediately => 'Sofort';

  @override
  String get securityTimeout1Min => '1 Minute';

  @override
  String get securityTimeout5Min => '5 Minuten';

  @override
  String get securityTimeout15Min => '15 Minuten';

  @override
  String get lockScreenTitle => 'PIN eingeben';

  @override
  String get lockScreenLockedTitle => 'Eingabe gesperrt';

  @override
  String get lockScreenSubtitle => 'Um auf die Anwendung zuzugreifen';

  @override
  String get lockScreenBiometricsReason =>
      'Bestätigen Sie Ihre Identität zum Entsperren';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometrie nach 3 Fehlversuchen deaktiviert. PIN eingeben (noch $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'Falsche PIN. Verbleibende Versuche: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Versuchen Sie es erneut in $time';
  }

  @override
  String get pinSetupCreate => 'PIN-Code erstellen';

  @override
  String get pinSetupConfirm => 'PIN-Code bestätigen';

  @override
  String get pinSetupEnterCurrent => 'Aktueller PIN-Code';

  @override
  String get pinSetupEnterNew => 'Neuer PIN-Code';

  @override
  String get pinSetupPromptDigits => '4 Ziffern zum Schutz der App eingeben';

  @override
  String get pinSetupPromptConfirm => 'PIN-Code zur Bestätigung wiederholen';

  @override
  String get pinSetupMismatch =>
      'PIN-Codes stimmen nicht überein. Bitte erneut versuchen';

  @override
  String get pinSetupTooSimple =>
      'PIN ist zu einfach. Keine gleichen oder aufeinanderfolgenden Ziffern verwenden';

  @override
  String get diagnosticsTitle => 'Systemdiagnose';

  @override
  String get diagnosticsCopy => 'Diagnose kopieren';

  @override
  String get diagnosticsCopied => 'Diagnose in die Zwischenablage kopiert';

  @override
  String get showcaseButtonsTitle =>
      'Schaltflächen (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 Varianten, 3 Größen, Ladezustände & Federphysik';

  @override
  String get showcaseInputsTitle => 'Eingabefelder (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Schnelllöschung, Passwortanzeige & gestaltete Suche';

  @override
  String get showcaseToastsTitle =>
      'Schwebende Benachrichtigungen (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Popups mit Hintergrundunschärfe und Wischgeste';

  @override
  String get showcaseSheetsTitle => 'Modale Ansichten (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Einheitliche Bottom-Sheets mit Wischen und Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'Badges & Tags (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Leuchtende Statusindikatoren und interaktive Filter';

  @override
  String get showcaseHapticsTitle => 'Haptik-Engine (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Sichere semantische Gerätevibrationsmuster';

  @override
  String get showcaseSegmentsTitle =>
      'Segmentierte Steuerung (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Gleitender Liquid Glass-Indikator mit Symbolen';

  @override
  String get showcaseProgressTitle => 'Fortschrittsbalken (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Neon-Farbverläufe mit Leuchten und Ladekreise';

  @override
  String get showcaseAvatarsTitle => 'Avatare & Präsenz (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 Größen, Statuspunkt, Initialen & Verlaufsrand';

  @override
  String get securityDisableTitle => 'PIN-Schutz deaktivieren?';

  @override
  String get securityDisableDesc =>
      'Die Eingabe Ihrer aktuellen PIN ist erforderlich, um den Schutz zu deaktivieren.';

  @override
  String get securityDisabledToast => 'PIN-Schutz deaktiviert';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonContinue => 'Fortfahren';

  @override
  String get diagnosticsDeviceGroup => 'Gerät & Betriebssystem';

  @override
  String get diagnosticsAppGroup => 'App-Build-Informationen';

  @override
  String get diagnosticsDisplayGroup => 'Bildschirm & Display';

  @override
  String get diagnosticsNetworkGroup => 'Netzwerk & Barrierefreiheit';

  @override
  String get notifRouterTestTitle => 'Benachrichtigungs-Router-Test';

  @override
  String get notifRouterTestDesc =>
      'Test-Push mit Nutzlast senden, um den Routing-Dispatcher zu überprüfen';

  @override
  String get notifSendTestButton => 'Testbenachrichtigung senden';

  @override
  String get notifTestNotificationTitle => '🔔 Testbenachrichtigung';

  @override
  String get notifTestNotificationBody =>
      'Tippen, um die Payload-Verarbeitung von NotificationRouter zu testen';

  @override
  String get notifTestNotificationSent =>
      'Testbenachrichtigung gesendet! Im Benachrichtigungsbereich antippen.';

  @override
  String get notifPermissionOnboardingPreview =>
      'Berechtigungs-Onboarding ansehen';

  @override
  String get notifSingleTitle => 'Benachrichtigung';
}
