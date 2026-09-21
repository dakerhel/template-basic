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
  String get permissionGrantedSnackbar => 'Notifications activées avec succès';

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

  @override
  String get navHome => 'Accueil';

  @override
  String get navShowcase => 'Vitrine';

  @override
  String get homeStarterTitle => 'Kit de Démarrage Design System';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Jetons actifs du système';

  @override
  String get homeConfigure => 'Configurer';

  @override
  String get homeQuickActions => 'Actions rapides';

  @override
  String get homeThemeSheet => 'Volet des thèmes';

  @override
  String get homeThemeSheetSubtitle => '9 palettes et modes';

  @override
  String get homeShowcase => 'Vitrine UI';

  @override
  String get homeShowcaseSubtitle => 'Tous les composants';

  @override
  String get homeSecurityTest => 'Test de sécurité';

  @override
  String get homeSecurityTestSubtitle => 'Verrouillage d\'écran';

  @override
  String get homeDiagnostics => 'Diagnostic';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, mémoire, OS';

  @override
  String get homeRiverpodState => 'État réactif Riverpod';

  @override
  String get homeIncrement => 'Incrémenter';

  @override
  String get homeReset => 'Réinitialiser';

  @override
  String get liquidGlassEffect => 'Effet Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'Flou optique et reflets spéculaires';

  @override
  String get colorSchemes => 'Palettes de couleurs';

  @override
  String get securityGroup => 'Sécurité';

  @override
  String get securityPinTitle => 'Protection par code PIN';

  @override
  String get securityPinSubtitle => 'Demander le code PIN au démarrage';

  @override
  String get securityBiometricsTitle => 'Biométrie (Empreinte / Face ID)';

  @override
  String get securityBiometricsSubtitle => 'Déverrouillage rapide par capteur';

  @override
  String get securityPrivacyTitle => 'Masquer dans le sélecteur d\'apps';

  @override
  String get securityPrivacySubtitle =>
      'Protection de la vie privée lors du multitâche';

  @override
  String get securityChangePin => 'Modifier le code PIN';

  @override
  String get securityChangePinSubtitle =>
      'Définir un nouveau code à 4 chiffres';

  @override
  String get securityAutoLock => 'Délai de verrouillage automatique';

  @override
  String get securityLockNow => 'Verrouiller l\'écran maintenant';

  @override
  String get securityPinChanged => 'Code PIN modifié avec succès';

  @override
  String get securityTimeoutImmediately => 'Immédiatement';

  @override
  String get securityTimeout1Min => '1 minute';

  @override
  String get securityTimeout5Min => '5 minutes';

  @override
  String get securityTimeout15Min => '15 minutes';

  @override
  String get lockScreenTitle => 'Entrez le code PIN';

  @override
  String get lockScreenLockedTitle => 'Accès verrouillé';

  @override
  String get lockScreenSubtitle => 'Pour accéder à l\'application';

  @override
  String get lockScreenBiometricsReason =>
      'Confirmez votre identité pour déverrouiller';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biométrie désactivée après 3 échecs. Entrez le PIN ($remaining restants)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'Code PIN incorrect. Tentatives restantes : $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Réessayez dans $time';
  }

  @override
  String get pinSetupCreate => 'Créer un code PIN';

  @override
  String get pinSetupConfirm => 'Confirmer le code PIN';

  @override
  String get pinSetupEnterCurrent => 'Code PIN actuel';

  @override
  String get pinSetupEnterNew => 'Nouveau code PIN';

  @override
  String get pinSetupPromptDigits =>
      'Entrez 4 chiffres pour sécuriser l\'application';

  @override
  String get pinSetupPromptConfirm =>
      'Entrez à nouveau le code PIN pour confirmer';

  @override
  String get pinSetupMismatch =>
      'Les codes PIN ne correspondent pas. Réessayez';

  @override
  String get pinSetupTooSimple =>
      'PIN trop simple. Évitez les chiffres identiques ou consécutifs';

  @override
  String get diagnosticsTitle => 'Diagnostic système';

  @override
  String get diagnosticsCopy => 'Copier le diagnostic';

  @override
  String get diagnosticsCopied => 'Diagnostic copié dans le presse-papiers';

  @override
  String get showcaseButtonsTitle => 'Boutons (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 variantes, 3 tailles, états de chargement et physique';

  @override
  String get showcaseInputsTitle => 'Champs de saisie (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Effacement rapide, bascule mot de passe et recherche';

  @override
  String get showcaseToastsTitle => 'Notifications flottantes (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Popups avec flou d\'arrière-plan et geste de balayage';

  @override
  String get showcaseSheetsTitle => 'Volets modaux (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Feuilles inférieures unifiées avec glissement et Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'Badges et étiquettes (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Indicateurs d\'état lumineux et filtres interactifs';

  @override
  String get showcaseHapticsTitle => 'Moteur haptique (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Modèles sûrs de vibrations sémantiques';

  @override
  String get showcaseSegmentsTitle =>
      'Contrôles segmentés (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Curseur glissant Liquid Glass avec icônes';

  @override
  String get showcaseProgressTitle => 'Barres de progression (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Dégradés néon lumineux et spinners de chargement';

  @override
  String get showcaseAvatarsTitle => 'Avatars et présence (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 tailles, pastille de statut, initiales et contour dégradé';

  @override
  String get securityDisableTitle => 'Désactiver la protection par code PIN ?';

  @override
  String get securityDisableDesc =>
      'La saisie de votre code PIN actuel est requise pour désactiver la protection.';

  @override
  String get securityDisabledToast => 'Protection par code PIN désactivée';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get diagnosticsDeviceGroup => 'Appareil & Système';

  @override
  String get diagnosticsAppGroup => 'Informations de version';

  @override
  String get diagnosticsDisplayGroup => 'Écran & Affichage';

  @override
  String get diagnosticsNetworkGroup => 'Réseau & Accessibilité';

  @override
  String get notifRouterTestTitle => 'Test du routeur de notifications';

  @override
  String get notifRouterTestDesc =>
      'Envoyer une notification de test avec payload pour vérifier le routeur';

  @override
  String get notifSendTestButton => 'Envoyer une notification de test';

  @override
  String get notifTestNotificationTitle => '🔔 Notification de test';

  @override
  String get notifTestNotificationBody =>
      'Appuyez pour tester la gestion du payload de NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      'Notification de test envoyée ! Appuyez dessus dans le volet du système.';

  @override
  String get notifPermissionOnboardingPreview =>
      'Aperçu de l\'intégration des autorisations';

  @override
  String get notifSingleTitle => 'Notification';
}
