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
}
