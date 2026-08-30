// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Фундамент готов';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get aboutPrivacy => 'Политика конфиденциальности';

  @override
  String failedToOpen(String url) {
    return 'Не удалось открыть $url';
  }

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get languageSystem => 'Как в системе';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get themeSystem => 'Как в системе';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get interfaceGroup => 'Интерфейс';

  @override
  String get settingsFont => 'Шрифт';

  @override
  String get fontScale => 'Размер шрифта';

  @override
  String get fontSystem => 'Как в системе';

  @override
  String get fontDefault => 'Дефолтный';

  @override
  String get updatesGroup => 'Обновления';

  @override
  String get backgroundCheckTitle => 'Фоновая проверка обновлений';

  @override
  String get backgroundCheckSubtitle =>
      'Приложение в фоне проверяет обновления. Для экономии батареи — отключите. Проверка всегда доступна в ручном режиме.';

  @override
  String get checkIntervalTitle => 'Интервал проверки';

  @override
  String intervalHours(String hours) {
    return '$hours ч';
  }

  @override
  String get backgroundInstallTitle => 'Установка в фоне';

  @override
  String get backgroundInstallSubtitle =>
      'Автоматически скачивать и устанавливать найденные обновления';

  @override
  String get aboutGroup => 'О приложении';

  @override
  String get appNameLabel => 'Название приложения';

  @override
  String get appVersionLabel => 'Версия приложения';

  @override
  String get coreVersionLabel => 'Версия ядра';

  @override
  String get deviceLabel => 'Устройство';

  @override
  String get sourceCodeLabel => 'Исходный код';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes мин';
  }

  @override
  String get installPermissionTitle => 'Разрешение на установку';

  @override
  String get installPermissionSubtitle =>
      'Разрешить установку приложений из этого источника';

  @override
  String get notificationsPermissionTitle => 'Разрешение на уведомления';

  @override
  String get notificationsPermissionSubtitle =>
      'Для уведомлений о найденных обновлениях';

  @override
  String get notificationsGroup => 'Уведомления';

  @override
  String get notifyUpdatesToggle => 'Уведомлять об обновлениях';

  @override
  String get backgroundWorkTitle => 'Работа в фоне';

  @override
  String get backgroundWorkSubtitle =>
      'Разрешить работу без ограничений батареи';

  @override
  String notifUpdateTitle(String version) {
    return 'Доступно обновление $version';
  }

  @override
  String get notifUpdateBody => 'Откройте приложение, чтобы установить';

  @override
  String get notifUpdatedTitle => 'Приложение обновлено';

  @override
  String notifUpdatedBody(String version) {
    return 'Установлена версия $version';
  }

  @override
  String get checkForUpdate => 'Проверить наличие обновления';

  @override
  String get updateChecking => 'Проверяем...';

  @override
  String get updateUpToDate => 'У вас последняя версия';

  @override
  String updateAvailable(String version) {
    return 'Доступна версия $version';
  }

  @override
  String updateDownload(String percent) {
    return 'Загрузка: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Обновить до $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Не удалось проверить обновления: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Ошибка обновления: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get whatsNewLabel => 'Что нового';

  @override
  String get forceUpdateTitle => 'Требуется обновление';

  @override
  String get forceUpdateBody =>
      'Ваша версия больше не поддерживается. Установите обновление, чтобы продолжить.';

  @override
  String get storageGroup => 'Память';

  @override
  String storageUsed(String size) {
    return 'Файлы обновлений: $size МБ';
  }

  @override
  String get clearCacheAction => 'Очистить';

  @override
  String get cacheCleared => 'Очищено';

  @override
  String get permissionOnboardingTitle => 'Будьте в курсе важного';

  @override
  String get permissionOnboardingBody =>
      'Включите уведомления, чтобы мгновенно узнавать о выходе обновлений и важных событиях безопасности.';

  @override
  String get permissionOnboardingAction => 'Включить уведомления';

  @override
  String get permissionOnboardingDismiss => 'Позже';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA-обновления';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Оповещения о выходе новых версий и функций';

  @override
  String get permissionSecurityBenefitTitle => 'Безопасность';

  @override
  String get permissionSecurityBenefitDesc =>
      'Контроль критических событий и статуса защиты';

  @override
  String get permissionGrantedSnackbar => 'Уведомления успешно включены';

  @override
  String get permissionDeniedSnackbar =>
      'Уведомления отключены. Вы можете включить их в любой момент в Настройках.';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileGuestName => 'Гостевой профиль';

  @override
  String get profileGuestDesc => 'Локальная сессия без облачной синхронизации';

  @override
  String get profileLinkAccount => 'Привязать аккаунт';

  @override
  String get profileLinkAccountDesc =>
      'Войдите через Google, Telegram или GitHub';

  @override
  String get profileAccountSection => 'Учетная запись';

  @override
  String get profileSecuritySection => 'Безопасность и сессии';

  @override
  String get profileActiveSessions => 'Активные устройства';

  @override
  String get profileCurrentDevice => 'Текущее устройство';

  @override
  String get profileDeleteAccount => 'Очистить профиль и данные';

  @override
  String get profileDeleteConfirm =>
      'Вы уверены? Все локальные данные и кэш сессий будут удалены.';

  @override
  String get navHome => 'Главная';

  @override
  String get navShowcase => 'Витрина';
}
