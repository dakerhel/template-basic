// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'La base è pronta';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get aboutPrivacy => 'Informativa sulla privacy';

  @override
  String failedToOpen(String url) {
    return 'Impossibile aprire $url';
  }

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get languageSystem => 'Come il sistema';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Come il sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get interfaceGroup => 'Interfaccia';

  @override
  String get settingsFont => 'Carattere';

  @override
  String get fontScale => 'Dimensione carattere';

  @override
  String get fontSystem => 'Come il sistema';

  @override
  String get fontDefault => 'Predefinito';

  @override
  String get updatesGroup => 'Aggiornamenti';

  @override
  String get backgroundCheckTitle => 'Controllo aggiornamenti in background';

  @override
  String get backgroundCheckSubtitle =>
      'L\'app controlla gli aggiornamenti in background. Disattiva per risparmiare batteria. Il controllo manuale è sempre disponibile.';

  @override
  String get checkIntervalTitle => 'Intervallo di controllo';

  @override
  String intervalHours(String hours) {
    return '$hours ore';
  }

  @override
  String get backgroundInstallTitle => 'Installazione in background';

  @override
  String get backgroundInstallSubtitle =>
      'Scarica e installa automaticamente gli aggiornamenti trovati';

  @override
  String get aboutGroup => 'Info app';

  @override
  String get appNameLabel => 'Nome dell\'app';

  @override
  String get appVersionLabel => 'Versione dell\'app';

  @override
  String get coreVersionLabel => 'Versione del core';

  @override
  String get deviceLabel => 'Dispositivo';

  @override
  String get sourceCodeLabel => 'Codice sorgente';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get installPermissionTitle => 'Autorizzazione di installazione';

  @override
  String get installPermissionSubtitle =>
      'Consenti l\'installazione di app da questa fonte';

  @override
  String get notificationsPermissionTitle => 'Autorizzazione notifiche';

  @override
  String get notificationsPermissionSubtitle =>
      'Per le notifiche degli aggiornamenti trovati';

  @override
  String get notificationsGroup => 'Notifiche';

  @override
  String get notifyUpdatesToggle => 'Avvisami degli aggiornamenti';

  @override
  String get backgroundWorkTitle => 'Esecuzione in background';

  @override
  String get backgroundWorkSubtitle =>
      'Consenti l\'esecuzione senza restrizioni batteria';

  @override
  String notifUpdateTitle(String version) {
    return 'Aggiornamento $version disponibile';
  }

  @override
  String get notifUpdateBody => 'Apri l\'app per installare';

  @override
  String get notifUpdatedTitle => 'App aggiornata';

  @override
  String notifUpdatedBody(String version) {
    return 'Versione installata: $version';
  }

  @override
  String get checkForUpdate => 'Cerca aggiornamenti';

  @override
  String get updateChecking => 'Verifica in corso...';

  @override
  String get updateUpToDate => 'Hai l\'ultima versione';

  @override
  String updateAvailable(String version) {
    return 'Versione $version disponibile';
  }

  @override
  String updateDownload(String percent) {
    return 'Download: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Aggiorna alla $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Verifica aggiornamenti non riuscita: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Aggiornamento non riuscito: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Errore: $error';
  }

  @override
  String get whatsNewLabel => 'Novità';

  @override
  String get forceUpdateTitle => 'Aggiornamento richiesto';

  @override
  String get forceUpdateBody =>
      'La tua versione non è più supportata. Installa l\'aggiornamento per continuare.';

  @override
  String get storageGroup => 'Archiviazione';

  @override
  String storageUsed(String size) {
    return 'File di aggiornamento: $size MB';
  }

  @override
  String get clearCacheAction => 'Cancella';

  @override
  String get cacheCleared => 'Cancellato';

  @override
  String get permissionOnboardingTitle => 'Rimani informato';

  @override
  String get permissionOnboardingBody =>
      'Attiva le notifiche per ricevere avvisi immediati sugli aggiornamenti e sulla sicurezza.';

  @override
  String get permissionOnboardingAction => 'Attiva notifiche';

  @override
  String get permissionOnboardingDismiss => 'Più tardi';

  @override
  String get permissionUpdatesBenefitTitle => 'Aggiornamenti OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Avvisi immediati per nuove versioni e funzionalità';

  @override
  String get permissionSecurityBenefitTitle => 'Sicurezza e protezione';

  @override
  String get permissionSecurityBenefitDesc =>
      'Eventi critici di sicurezza e avvisi di sessione';

  @override
  String get permissionGrantedSnackbar => 'Notifiche attivate con successo';

  @override
  String get permissionDeniedSnackbar =>
      'Notifiche disattivate. Puoi attivarle nelle Impostazioni.';

  @override
  String get profileTitle => 'Profilo';

  @override
  String get profileGuestName => 'Utente Ospite';

  @override
  String get profileGuestDesc => 'Sessione offline locale';

  @override
  String get profileLinkAccount => 'Collega account';

  @override
  String get profileLinkAccountDesc => 'Accedi con Google, Telegram o GitHub';

  @override
  String get profileAccountSection => 'Account';

  @override
  String get profileSecuritySection => 'Sicurezza e sessioni';

  @override
  String get profileActiveSessions => 'Dispositivi attivi';

  @override
  String get profileCurrentDevice => 'Questo dispositivo';

  @override
  String get profileDeleteAccount => 'Cancella profilo e dati';

  @override
  String get profileDeleteConfirm =>
      'Sei sicuro? Tutti i dati locali verranno rimossi.';

  @override
  String get navHome => 'Home';

  @override
  String get navShowcase => 'Vetrina';

  @override
  String get homeStarterTitle => 'Kit Iniziale Design System';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Token attivi del sistema';

  @override
  String get homeConfigure => 'Configura';

  @override
  String get homeQuickActions => 'Azioni rapide';

  @override
  String get homeThemeSheet => 'Pannello temi';

  @override
  String get homeThemeSheetSubtitle => '9 palette e modalità';

  @override
  String get homeShowcase => 'Vetrina UI';

  @override
  String get homeShowcaseSubtitle => 'Tutti i componenti';

  @override
  String get homeSecurityTest => 'Test sicurezza';

  @override
  String get homeSecurityTestSubtitle => 'Blocco schermo';

  @override
  String get homeDiagnostics => 'Diagnostica';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, memoria, SO';

  @override
  String get homeRiverpodState => 'Stato reattivo Riverpod';

  @override
  String get homeIncrement => 'Incrementa';

  @override
  String get homeReset => 'Ripristina';

  @override
  String get liquidGlassEffect => 'Effetto Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'Sfocatura ottica e riflessi';

  @override
  String get colorSchemes => 'Schemi colore';

  @override
  String get securityGroup => 'Sicurezza';

  @override
  String get securityPinTitle => 'Protezione con PIN';

  @override
  String get securityPinSubtitle => 'Richiedi PIN all\'avvio dell\'app';

  @override
  String get securityBiometricsTitle => 'Biometria (Impronta / Face ID)';

  @override
  String get securityBiometricsSubtitle =>
      'Accesso rapido con sensore del dispositivo';

  @override
  String get securityPrivacyTitle => 'Nascondi nella schermata multitasking';

  @override
  String get securityPrivacySubtitle =>
      'Protezione privacy quando si cambia app';

  @override
  String get securityChangePin => 'Modifica codice PIN';

  @override
  String get securityChangePinSubtitle => 'Imposta un nuovo codice a 4 cifre';

  @override
  String get securityAutoLock => 'Tempo di blocco automatico';

  @override
  String get securityLockNow => 'Blocca schermo ora';

  @override
  String get securityPinChanged => 'PIN modificato con successo';

  @override
  String get securityTimeoutImmediately => 'Immediatamente';

  @override
  String get securityTimeout1Min => '1 minuto';

  @override
  String get securityTimeout5Min => '5 minuti';

  @override
  String get securityTimeout15Min => '15 minuti';

  @override
  String get lockScreenTitle => 'Inserisci il PIN';

  @override
  String get lockScreenLockedTitle => 'Accesso bloccato';

  @override
  String get lockScreenSubtitle => 'Per accedere all\'applicazione';

  @override
  String get lockScreenBiometricsReason =>
      'Conferma la tua identità per accedere';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometria disabilitata dopo 3 tentativi errati. Inserisci PIN ($remaining rimasti)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PIN errato. Tentativi rimasti: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Riprova tra $time';
  }

  @override
  String get pinSetupCreate => 'Crea codice PIN';

  @override
  String get pinSetupConfirm => 'Conferma codice PIN';

  @override
  String get pinSetupEnterCurrent => 'Codice PIN attuale';

  @override
  String get pinSetupEnterNew => 'Nuovo codice PIN';

  @override
  String get pinSetupPromptDigits => 'Inserisci 4 cifre per proteggere l\'app';

  @override
  String get pinSetupPromptConfirm => 'Reinserisci il PIN per confermare';

  @override
  String get pinSetupMismatch => 'I codici PIN non corrispondono. Riprova';

  @override
  String get pinSetupTooSimple =>
      'PIN troppo semplice. Evita cifre uguali o consecutive';

  @override
  String get diagnosticsTitle => 'Diagnostica di sistema';

  @override
  String get diagnosticsCopy => 'Copia diagnostica';

  @override
  String get diagnosticsCopied => 'Diagnostica copiata negli appunti';

  @override
  String get showcaseButtonsTitle => 'Pulsanti (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 varianti, 3 dimensioni, stati di caricamento e fisica';

  @override
  String get showcaseInputsTitle => 'Campi di testo (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Cancellazione rapida, visualizza password e ricerca';

  @override
  String get showcaseToastsTitle => 'Notifiche fluttuanti (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Avvisi popup con sfocatura e scorrimento per chiudere';

  @override
  String get showcaseSheetsTitle => 'Pannelli modali (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Pannelli inferiori con trascinamento e Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'Badge ed etichette (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Indicatori di stato luminosi e filtri interattivi';

  @override
  String get showcaseHapticsTitle => 'Motore aptico (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Pattern di vibrazione sicuri e semantici';

  @override
  String get showcaseSegmentsTitle =>
      'Controlli segmentati (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Indicatore scorrevole Liquid Glass con icone';

  @override
  String get showcaseProgressTitle => 'Barre di progresso (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Gradienti neon luminosi e indicatori circolari';

  @override
  String get showcaseAvatarsTitle => 'Avatar e presenza (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 dimensioni, punto di stato, iniziali e bordo sfumato';

  @override
  String get securityDisableTitle => 'Disattivare la protezione PIN?';

  @override
  String get securityDisableDesc =>
      'È necessario inserire il PIN attuale per disattivare la protezione.';

  @override
  String get securityDisabledToast => 'Protezione PIN disattivata';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonContinue => 'Continua';

  @override
  String get diagnosticsDeviceGroup => 'Dispositivo e SO';

  @override
  String get diagnosticsAppGroup => 'Informazioni sulla build';

  @override
  String get diagnosticsDisplayGroup => 'Schermo e display';

  @override
  String get diagnosticsNetworkGroup => 'Rete e accessibilità';

  @override
  String get notifRouterTestTitle => 'Test del router di notifiche';

  @override
  String get notifRouterTestDesc =>
      'Invia notifica di prova con payload per verificare il router';

  @override
  String get notifSendTestButton => 'Invia notifica di prova';

  @override
  String get notifTestNotificationTitle => '🔔 Notifica di prova';

  @override
  String get notifTestNotificationBody =>
      'Tocca per verificare la gestione del payload di NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      'Notifica di prova inviata! Toccala nella barra delle notifiche.';

  @override
  String get notifPermissionOnboardingPreview =>
      'Anteprima onboarding autorizzazioni';

  @override
  String get notifSingleTitle => 'Notifica';
}
