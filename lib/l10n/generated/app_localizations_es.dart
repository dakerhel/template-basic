// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'La base está lista';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get aboutPrivacy => 'Política de privacidad';

  @override
  String failedToOpen(String url) {
    return 'No se pudo abrir $url';
  }

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageSystem => 'Como el sistema';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Como el sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get interfaceGroup => 'Interfaz';

  @override
  String get settingsFont => 'Fuente';

  @override
  String get fontScale => 'Tamaño de fuente';

  @override
  String get fontSystem => 'Como el sistema';

  @override
  String get fontDefault => 'Predeterminado';

  @override
  String get updatesGroup => 'Actualizaciones';

  @override
  String get backgroundCheckTitle => 'Comprobación en segundo plano';

  @override
  String get backgroundCheckSubtitle =>
      'La aplicación busca actualizaciones en segundo plano. Desactívalo para ahorrar batería. La comprobación manual siempre está disponible.';

  @override
  String get checkIntervalTitle => 'Intervalo de comprobación';

  @override
  String intervalHours(String hours) {
    return '$hours h';
  }

  @override
  String get backgroundInstallTitle => 'Instalación en segundo plano';

  @override
  String get backgroundInstallSubtitle =>
      'Descargar e instalar automáticamente las actualizaciones encontradas';

  @override
  String get aboutGroup => 'Acerca de la aplicación';

  @override
  String get appNameLabel => 'Nombre de la aplicación';

  @override
  String get appVersionLabel => 'Versión de la aplicación';

  @override
  String get coreVersionLabel => 'Versión del núcleo';

  @override
  String get deviceLabel => 'Dispositivo';

  @override
  String get sourceCodeLabel => 'Código fuente';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get installPermissionTitle => 'Permiso de instalación';

  @override
  String get installPermissionSubtitle =>
      'Permitir instalar aplicaciones de esta fuente';

  @override
  String get notificationsPermissionTitle => 'Permiso de notificaciones';

  @override
  String get notificationsPermissionSubtitle =>
      'Para notificaciones de actualizaciones encontradas';

  @override
  String get notificationsGroup => 'Notificaciones';

  @override
  String get notifyUpdatesToggle => 'Avisar de actualizaciones';

  @override
  String get backgroundWorkTitle => 'Ejecución en segundo plano';

  @override
  String get backgroundWorkSubtitle =>
      'Permitir ejecutar sin restricciones de batería';

  @override
  String notifUpdateTitle(String version) {
    return 'Actualización $version disponible';
  }

  @override
  String get notifUpdateBody => 'Abre la aplicación para instalar';

  @override
  String get notifUpdatedTitle => 'Aplicación actualizada';

  @override
  String notifUpdatedBody(String version) {
    return 'Versión instalada: $version';
  }

  @override
  String get checkForUpdate => 'Buscar actualizaciones';

  @override
  String get updateChecking => 'Comprobando...';

  @override
  String get updateUpToDate => 'Tienes la última versión';

  @override
  String updateAvailable(String version) {
    return 'Versión $version disponible';
  }

  @override
  String updateDownload(String percent) {
    return 'Descargando: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Actualizar a $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'No se pudieron buscar actualizaciones: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Error de actualización: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get whatsNewLabel => 'Novedades';

  @override
  String get forceUpdateTitle => 'Actualización necesaria';

  @override
  String get forceUpdateBody =>
      'Tu versión ya no es compatible. Instala la actualización para continuar.';

  @override
  String get storageGroup => 'Almacenamiento';

  @override
  String storageUsed(String size) {
    return 'Archivos de actualización: $size MB';
  }

  @override
  String get clearCacheAction => 'Borrar';

  @override
  String get cacheCleared => 'Borrado';

  @override
  String get permissionOnboardingTitle => 'Mantente informado';

  @override
  String get permissionOnboardingBody =>
      'Activa las notificaciones para recibir alertas instantáneas sobre nuevas actualizaciones y seguridad.';

  @override
  String get permissionOnboardingAction => 'Activar notificaciones';

  @override
  String get permissionOnboardingDismiss => 'Más tarde';

  @override
  String get permissionUpdatesBenefitTitle => 'Actualizaciones OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Alertas instantáneas de nuevas versiones y funciones';

  @override
  String get permissionSecurityBenefitTitle => 'Seguridad y protección';

  @override
  String get permissionSecurityBenefitDesc =>
      'Eventos críticos de seguridad y alertas de sesión';

  @override
  String get permissionGrantedSnackbar =>
      'Notificaciones activadas correctamente';

  @override
  String get permissionDeniedSnackbar =>
      'Notificaciones desactivadas. Puedes activarlas en Configuración.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileGuestName => 'Usuario Invitado';

  @override
  String get profileGuestDesc => 'Sesión local sin conexión';

  @override
  String get profileLinkAccount => 'Vincular cuenta';

  @override
  String get profileLinkAccountDesc =>
      'Conéctate con Google, Telegram o GitHub';

  @override
  String get profileAccountSection => 'Cuenta';

  @override
  String get profileSecuritySection => 'Seguridad y sesiones';

  @override
  String get profileActiveSessions => 'Dispositivos activos';

  @override
  String get profileCurrentDevice => 'Este dispositivo';

  @override
  String get profileDeleteAccount => 'Borrar perfil y datos';

  @override
  String get profileDeleteConfirm =>
      '¿Estás seguro? Se eliminarán todos los datos locales.';
}
