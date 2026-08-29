// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => 'Base pronta';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get aboutPrivacy => 'Política de privacidade';

  @override
  String failedToOpen(String url) {
    return 'Não foi possível abrir $url';
  }

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageSystem => 'Como no sistema';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Como no sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get interfaceGroup => 'Interface';

  @override
  String get settingsFont => 'Fonte';

  @override
  String get fontScale => 'Tamanho da fonte';

  @override
  String get fontSystem => 'Como no sistema';

  @override
  String get fontDefault => 'Padrão';

  @override
  String get updatesGroup => 'Atualizações';

  @override
  String get backgroundCheckTitle => 'Verificação em segundo plano';

  @override
  String get backgroundCheckSubtitle =>
      'O aplicativo verifica atualizações em segundo plano. Desative para economizar bateria. A verificação manual está sempre disponível.';

  @override
  String get checkIntervalTitle => 'Intervalo de verificação';

  @override
  String intervalHours(String hours) {
    return '$hours h';
  }

  @override
  String get backgroundInstallTitle => 'Instalação em segundo plano';

  @override
  String get backgroundInstallSubtitle =>
      'Baixar e instalar automaticamente as atualizações encontradas';

  @override
  String get aboutGroup => 'Sobre o aplicativo';

  @override
  String get appNameLabel => 'Nome do aplicativo';

  @override
  String get appVersionLabel => 'Versão do aplicativo';

  @override
  String get coreVersionLabel => 'Versão do núcleo';

  @override
  String get deviceLabel => 'Dispositivo';

  @override
  String get sourceCodeLabel => 'Código-fonte';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get installPermissionTitle => 'Permissão de instalação';

  @override
  String get installPermissionSubtitle =>
      'Permitir instalar aplicativos desta fonte';

  @override
  String get notificationsPermissionTitle => 'Permissão de notificação';

  @override
  String get notificationsPermissionSubtitle =>
      'Para notificações sobre atualizações encontradas';

  @override
  String get notificationsGroup => 'Notificações';

  @override
  String get notifyUpdatesToggle => 'Avisar sobre atualizações';

  @override
  String get backgroundWorkTitle => 'Execução em segundo plano';

  @override
  String get backgroundWorkSubtitle =>
      'Permitir executar sem restrições de bateria';

  @override
  String notifUpdateTitle(String version) {
    return 'Atualização $version disponível';
  }

  @override
  String get notifUpdateBody => 'Abra o aplicativo para instalar';

  @override
  String get notifUpdatedTitle => 'Aplicativo atualizado';

  @override
  String notifUpdatedBody(String version) {
    return 'Versão instalada: $version';
  }

  @override
  String get checkForUpdate => 'Verificar atualizações';

  @override
  String get updateChecking => 'Verificando...';

  @override
  String get updateUpToDate => 'Você tem a versão mais recente';

  @override
  String updateAvailable(String version) {
    return 'Versão $version disponível';
  }

  @override
  String updateDownload(String percent) {
    return 'Baixando: $percent%';
  }

  @override
  String updateButton(String version) {
    return 'Atualizar para $version';
  }

  @override
  String updateCheckFailed(String error) {
    return 'Falha ao verificar atualizações: $error';
  }

  @override
  String updateFailed(String error) {
    return 'Falha na atualização: $error';
  }

  @override
  String errorWithMessage(String error) {
    return 'Erro: $error';
  }

  @override
  String get whatsNewLabel => 'Novidades';

  @override
  String get forceUpdateTitle => 'Atualização necessária';

  @override
  String get forceUpdateBody =>
      'Sua versão não é mais suportada. Instale a atualização para continuar.';

  @override
  String get storageGroup => 'Armazenamento';

  @override
  String storageUsed(String size) {
    return 'Arquivos de atualização: $size MB';
  }

  @override
  String get clearCacheAction => 'Limpar';

  @override
  String get cacheCleared => 'Limpo';

  @override
  String get permissionOnboardingTitle => 'Mantenha-se informado';

  @override
  String get permissionOnboardingBody =>
      'Ative as notificações para receber alertas instantâneos sobre atualizações e segurança.';

  @override
  String get permissionOnboardingAction => 'Ativar notificações';

  @override
  String get permissionOnboardingDismiss => 'Mais tarde';

  @override
  String get permissionUpdatesBenefitTitle => 'Atualizações OTA';

  @override
  String get permissionUpdatesBenefitDesc =>
      'Alertas instantâneos de novas versões e recursos';

  @override
  String get permissionSecurityBenefitTitle => 'Segurança e proteção';

  @override
  String get permissionSecurityBenefitDesc =>
      'Eventos críticos de segurança e alertas de sessão';

  @override
  String get permissionGrantedSnackbar => 'Notificações ativadas com sucesso';

  @override
  String get permissionDeniedSnackbar =>
      'Notificações desativadas. Você pode ativá-las nas Configurações.';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileGuestName => 'Usuário Convidado';

  @override
  String get profileGuestDesc => 'Sessão local offline';

  @override
  String get profileLinkAccount => 'Vincular conta';

  @override
  String get profileLinkAccountDesc =>
      'Conecte com Google, Telegram ou GitHub';

  @override
  String get profileAccountSection => 'Conta';

  @override
  String get profileSecuritySection => 'Segurança e sessões';

  @override
  String get profileActiveSessions => 'Dispositivos ativos';

  @override
  String get profileCurrentDevice => 'Este dispositivo';

  @override
  String get profileDeleteAccount => 'Limpar perfil e dados';

  @override
  String get profileDeleteConfirm =>
      'Tem certeza? Todos os dados locais serão excluídos.';
}
