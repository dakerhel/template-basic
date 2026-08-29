// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'La base est prête';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get aboutPrivacy => 'Politique de confidentialité';

  @override
  String failedToOpen(String url) {
    return 'Impossible d\'ouvrir $url';
  }

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get languageSystem => 'Comme le système';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get themeSystem => 'Comme le système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get interfaceGroup => 'Interface';

  @override
  String get settingsFont => 'Police';

  @override
  String get fontScale => 'Taille de police';

  @override
  String get fontSystem => 'Comme le système';

  @override
  String get fontDefault => 'Par défaut';

  @override
  String get updatesGroup => 'Mises à jour';

  @override
  String get backgroundCheckTitle => 'Vérification en arrière-plan';

  @override
  String get backgroundCheckSubtitle =>
      'L\'application recherche les mises à jour en arrière-plan. Désactivez pour économiser la batterie. La vérification manuelle reste disponible.';

  @override
  String get checkIntervalTitle => 'Intervalle de vérification';

  @override
  String intervalHours(String hours) {
    return '$hours h';
  }

  @override
  String get backgroundInstallTitle => 'Installation en arrière-plan';

  @override
  String get backgroundInstallSubtitle =>
      'Télécharger et installer automatiquement les mises à jour trouvées';

  @override
  String get aboutGroup => 'À propos de l\'application';

  @override
  String get appNameLabel => 'Nom de l\'application';

  @override
  String get appVersionLabel => 'Version de l\'application';

  @override
  String get coreVersionLabel => 'Version du noyau';

  @override
  String get deviceLabel => 'Appareil';

  @override
  String get sourceCodeLabel => 'Code source';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get installPermissionTitle => 'Autorisation d\'installation';

  @override
  String get installPermissionSubtitle =>
      'Autoriser l\'installation d\'applications depuis cette source';

  @override
  String get notificationsPermissionTitle => 'Autorisation de notification';

  @override
  String get notificationsPermissionSubtitle =>
      'Pour les notifications de mises à jour trouvées';

  @override
  String get notificationsGroup => 'Notifications';

  @override
  String get notifyUpdatesToggle => 'Me notifier des mises à jour';

  @override
  String get backgroundWorkTitle => 'Exécution en arrière-plan';

  @override
  String get backgroundWorkSubtitle =>
      'Autoriser l\'exécution sans restrictions de batterie';

  @override
  String notifUpdateTitle(String version) {
    return 'Mise à jour $version disponible';
  }

  @override
  String get notifUpdateBody => 'Ouvrez l\'application pour installer';

  @override
  String get notifUpdatedTitle => 'Application mise à jour';

  @override
  String notifUpdatedBody(String version) {
    return 'Version installée : $version';
  }

  @override
  String get checkForUpdate => 'Rechercher des mises à jour';

  @override
  String get updateChecking => 'Vérification...';

  @override
  String get updateUpToDate => 'Vous avez la dernière version';

  @override
  String updateAvailable(String version) {
    return 'La version $version est disponible';
  }

  @override
  String updateDownload(String percent) {
    return 'Téléchargement : $percent %';
  }

  @override
  String updateButton(String version) {
    return 'Mettre à jour vers $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Échec de la vérification des mises à jour : $error';
  }

  @override
  String updateFailed(String error) {
    return 'Échec de la mise à jour : $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Erreur : $error';
  }

  @override
  String get whatsNewLabel => 'Nouveautés';

  @override
  String get forceUpdateTitle => 'Mise à jour requise';

  @override
  String get forceUpdateBody =>
      'Votre version n\'est plus prise en charge. Installez la mise à jour pour continuer.';

  @override
  String get storageGroup => 'Stockage';

  @override
  String storageUsed(String size) {
    return 'Fichiers de mise à jour : $size Mo';
  }

  @override
  String get clearCacheAction => 'Effacer';

  @override
  String get cacheCleared => 'Effacé';

  @override
  String get permissionOnboardingTitle => 'Restez informé';

  @override
  String get permissionOnboardingBody =>
      'Activez les notifications pour recevoir des alertes instantanées sur les mises à jour et la sécurité.';

  @override
  String get permissionOnboardingAction => 'Activer les notifications';

  @override
  String get permissionOnboardingDismiss => 'Plus tard';

  @override
  String get permissionUpdatesBenefitTitle => 'Mises à jour OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Alertes instantanées des nouvelles versions et fonctionnalités';

  @override
  String get permissionSecurityBenefitTitle => 'Sécurité et protection';

  @override
  String get permissionSecurityBenefitDesc =>
      'Événements de sécurité critiques et alertes de session';

  @override
  String get permissionGrantedSnackbar =>
      'Notifications activées avec succès';

  @override
  String get permissionDeniedSnackbar =>
      'Notifications désactivées. Vous pouvez les activer dans les Paramètres.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileGuestName => 'Utilisateur Invité';

  @override
  String get profileGuestDesc => 'Session locale hors ligne';

  @override
  String get profileLinkAccount => 'Lier un compte';

  @override
  String get profileLinkAccountDesc =>
      'Connectez-vous avec Google, Telegram ou GitHub';

  @override
  String get profileAccountSection => 'Compte';

  @override
  String get profileSecuritySection => 'Sécurité et sessions';

  @override
  String get profileActiveSessions => 'Appareils actifs';

  @override
  String get profileCurrentDevice => 'Cet appareil';

  @override
  String get profileDeleteAccount => 'Effacer profil et données';

  @override
  String get profileDeleteConfirm =>
      'Êtes-vous sûr ? Toutes les données locales seront supprimées.';
}
