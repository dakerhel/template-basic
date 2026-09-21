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

  @override
  String get navHome => 'Inicio';

  @override
  String get navShowcase => 'Galería';

  @override
  String get homeStarterTitle => 'Plantilla de Sistema de Diseño';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Tokens activos del sistema';

  @override
  String get homeConfigure => 'Configurar';

  @override
  String get homeQuickActions => 'Acciones rápidas';

  @override
  String get homeThemeSheet => 'Menú de temas';

  @override
  String get homeThemeSheetSubtitle => '9 paletas y modos';

  @override
  String get homeShowcase => 'Muestrario UI';

  @override
  String get homeShowcaseSubtitle => 'Todos los componentes';

  @override
  String get homeSecurityTest => 'Test de seguridad';

  @override
  String get homeSecurityTestSubtitle => 'Bloqueo de pantalla';

  @override
  String get homeDiagnostics => 'Diagnóstico';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, memoria, SO';

  @override
  String get homeRiverpodState => 'Estado reactivo de Riverpod';

  @override
  String get homeIncrement => 'Aumentar';

  @override
  String get homeReset => 'Restablecer';

  @override
  String get liquidGlassEffect => 'Efecto Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'Desenfoque óptico y reflejos';

  @override
  String get colorSchemes => 'Paletas de color';

  @override
  String get securityGroup => 'Seguridad';

  @override
  String get securityPinTitle => 'Protección con PIN';

  @override
  String get securityPinSubtitle => 'Solicitar código PIN al abrir la app';

  @override
  String get securityBiometricsTitle => 'Biometría (Huella / Face ID)';

  @override
  String get securityBiometricsSubtitle =>
      'Acceso rápido con sensor del dispositivo';

  @override
  String get securityPrivacyTitle => 'Ocultar en vista de tareas';

  @override
  String get securityPrivacySubtitle =>
      'Protección de privacidad al cambiar de app';

  @override
  String get securityChangePin => 'Cambiar código PIN';

  @override
  String get securityChangePinSubtitle =>
      'Configurar un nuevo código de 4 dígitos';

  @override
  String get securityAutoLock => 'Tiempo de autobloqueo';

  @override
  String get securityLockNow => 'Bloquear pantalla ahora';

  @override
  String get securityPinChanged => 'PIN cambiado con éxito';

  @override
  String get securityTimeoutImmediately => 'Inmediatamente';

  @override
  String get securityTimeout1Min => '1 minuto';

  @override
  String get securityTimeout5Min => '5 minutos';

  @override
  String get securityTimeout15Min => '15 minutos';

  @override
  String get lockScreenTitle => 'Ingrese el código PIN';

  @override
  String get lockScreenLockedTitle => 'Entrada bloqueada';

  @override
  String get lockScreenSubtitle => 'Para acceder a la aplicación';

  @override
  String get lockScreenBiometricsReason =>
      'Verifique su identidad para ingresar';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometría deshabilitada tras 3 fallos. Ingrese PIN (quedan: $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PIN incorrecto. Intentos restantes: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Intente de nuevo en $time';
  }

  @override
  String get pinSetupCreate => 'Crear código PIN';

  @override
  String get pinSetupConfirm => 'Confirmar código PIN';

  @override
  String get pinSetupEnterCurrent => 'Código PIN actual';

  @override
  String get pinSetupEnterNew => 'Nuevo código PIN';

  @override
  String get pinSetupPromptDigits => 'Ingrese 4 dígitos para proteger la app';

  @override
  String get pinSetupPromptConfirm => 'Reingrese el PIN para confirmar';

  @override
  String get pinSetupMismatch =>
      'Los códigos PIN no coinciden. Intente de nuevo';

  @override
  String get pinSetupTooSimple =>
      'PIN demasiado simple. Evite números iguales o consecutivos';

  @override
  String get diagnosticsTitle => 'Diagnóstico del sistema';

  @override
  String get diagnosticsCopy => 'Copiar diagnóstico';

  @override
  String get diagnosticsCopied => 'Diagnóstico copiado al portapapeles';

  @override
  String get showcaseButtonsTitle => 'Botones (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 variantes, 3 tamaños, carga y física de muelle';

  @override
  String get showcaseInputsTitle => 'Campos de texto (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Limpieza rápida, alternancia de contraseña y búsqueda';

  @override
  String get showcaseToastsTitle => 'Notificaciones flotantes (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Avisos emergentes con desenfoque y gesto de descarte';

  @override
  String get showcaseSheetsTitle => 'Hojas modales (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Hojas unificadas con deslizamiento y Liquid Glass';

  @override
  String get showcaseBadgesTitle =>
      'Insignias y etiquetas (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Indicadores de estado brillantes y filtros interactivos';

  @override
  String get showcaseHapticsTitle => 'Motor háptico (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle =>
      'Patrones seguros de vibración semántica';

  @override
  String get showcaseSegmentsTitle =>
      'Controles segmentados (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Indicador deslizante Liquid Glass con iconos';

  @override
  String get showcaseProgressTitle => 'Barras de progreso (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Gradientes de neón con brillo y círculos de carga';

  @override
  String get showcaseAvatarsTitle => 'Avatares y presencia (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 tamaños, punto de estado, iniciales y borde gradiente';

  @override
  String get securityDisableTitle => '¿Desactivar la protección por PIN?';

  @override
  String get securityDisableDesc =>
      'Se requiere ingresar su PIN actual para desactivar la protección.';

  @override
  String get securityDisabledToast => 'Protección por PIN desactivada';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get diagnosticsDeviceGroup => 'Dispositivo y SO';

  @override
  String get diagnosticsAppGroup => 'Información de compilación';

  @override
  String get diagnosticsDisplayGroup => 'Pantalla y visualización';

  @override
  String get diagnosticsNetworkGroup => 'Red y accesibilidad';

  @override
  String get notifRouterTestTitle => 'Prueba de router de notificaciones';

  @override
  String get notifRouterTestDesc =>
      'Enviar notificación de prueba con payload para verificar el enrutador';

  @override
  String get notifSendTestButton => 'Enviar notificación de prueba';

  @override
  String get notifTestNotificationTitle => '🔔 Notificación de prueba';

  @override
  String get notifTestNotificationBody =>
      'Toque para probar el manejo de payload de NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      '¡Notificación de prueba enviada! Tóquela en la barra del sistema.';

  @override
  String get notifPermissionOnboardingPreview => 'Vista previa de permisos';

  @override
  String get notifSingleTitle => 'Notificación';
}
