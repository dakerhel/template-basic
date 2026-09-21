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
  String get permissionGrantedSnackbar => 'Notifiche ativadas com sucesso';

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
  String get profileLinkAccountDesc => 'Conecte com Google, Telegram ou GitHub';

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

  @override
  String get navHome => 'Início';

  @override
  String get navShowcase => 'Mostruário';

  @override
  String get homeStarterTitle => 'Iniciador de Design System';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'Tokens ativos do sistema';

  @override
  String get homeConfigure => 'Configurar';

  @override
  String get homeQuickActions => 'Ações rápidas';

  @override
  String get homeThemeSheet => 'Painel de temas';

  @override
  String get homeThemeSheetSubtitle => '9 paletas e modos';

  @override
  String get homeShowcase => 'Vitrine UI';

  @override
  String get homeShowcaseSubtitle => 'Todos os componentes';

  @override
  String get homeSecurityTest => 'Teste de segurança';

  @override
  String get homeSecurityTestSubtitle => 'Bloqueio de tela';

  @override
  String get homeDiagnostics => 'Diagnóstico';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, memória, SO';

  @override
  String get homeRiverpodState => 'Estado reativo Riverpod';

  @override
  String get homeIncrement => 'Aumentar';

  @override
  String get homeReset => 'Redefinir';

  @override
  String get liquidGlassEffect => 'Efeito Liquid Glass';

  @override
  String get liquidGlassSubtitle => 'Desfoque óptico e reflexos';

  @override
  String get colorSchemes => 'Paletas de cores';

  @override
  String get securityGroup => 'Segurança';

  @override
  String get securityPinTitle => 'Proteção por PIN';

  @override
  String get securityPinSubtitle => 'Exigir PIN ao abrir o app';

  @override
  String get securityBiometricsTitle => 'Biometria (Digital / Face ID)';

  @override
  String get securityBiometricsSubtitle =>
      'Acesso rápido com sensor do dispositivo';

  @override
  String get securityPrivacyTitle => 'Ocultar na lista de tarefas';

  @override
  String get securityPrivacySubtitle =>
      'Proteção de privacidade ao alternar entre apps';

  @override
  String get securityChangePin => 'Alterar código PIN';

  @override
  String get securityChangePinSubtitle => 'Definir novo código de 4 dígitos';

  @override
  String get securityAutoLock => 'Tempo de bloqueio automático';

  @override
  String get securityLockNow => 'Bloquear tela agora';

  @override
  String get securityPinChanged => 'PIN alterado com sucesso';

  @override
  String get securityTimeoutImmediately => 'Imediatamente';

  @override
  String get securityTimeout1Min => '1 minuto';

  @override
  String get securityTimeout5Min => '5 minutos';

  @override
  String get securityTimeout15Min => '15 minutos';

  @override
  String get lockScreenTitle => 'Digite o PIN';

  @override
  String get lockScreenLockedTitle => 'Acesso bloqueado';

  @override
  String get lockScreenSubtitle => 'Para acessar o aplicativo';

  @override
  String get lockScreenBiometricsReason =>
      'Confirme sua identidade para entrar';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return 'Biometria desativada após 3 erros. Digite o PIN ($remaining restantes)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PIN incorreto. Tentativas restantes: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return 'Tente novamente em $time';
  }

  @override
  String get pinSetupCreate => 'Criar código PIN';

  @override
  String get pinSetupConfirm => 'Confirmar código PIN';

  @override
  String get pinSetupEnterCurrent => 'PIN atual';

  @override
  String get pinSetupEnterNew => 'Novo PIN';

  @override
  String get pinSetupPromptDigits => 'Digite 4 dígitos para proteger o app';

  @override
  String get pinSetupPromptConfirm => 'Redigite o PIN para confirmar';

  @override
  String get pinSetupMismatch => 'Os códigos PIN não coincidem. Tente de novo';

  @override
  String get pinSetupTooSimple =>
      'PIN muito simples. Evite números iguais ou em sequência';

  @override
  String get diagnosticsTitle => 'Diagnóstico do sistema';

  @override
  String get diagnosticsCopy => 'Copiar diagnóstico';

  @override
  String get diagnosticsCopied =>
      'Diagnóstico copiado para a área de transferência';

  @override
  String get showcaseButtonsTitle => 'Botões (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle =>
      '5 variantes, 3 tamanhos, carregamento e física de mola';

  @override
  String get showcaseInputsTitle => 'Campos de entrada (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle =>
      'Limpeza rápida, alternar senha e busca estilizada';

  @override
  String get showcaseToastsTitle => 'Notificações flutuantes (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle =>
      'Popups com desfoque de fundo e gesto de dispensar';

  @override
  String get showcaseSheetsTitle => 'Painéis modais (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle =>
      'Painéis inferiores com gesto e Liquid Glass';

  @override
  String get showcaseBadgesTitle => 'Emblemas e tags (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle =>
      'Indicadores de status brilhantes e filtros interativos';

  @override
  String get showcaseHapticsTitle => 'Motor tátil (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => 'Padrões seguros de vibração semântica';

  @override
  String get showcaseSegmentsTitle =>
      'Controles segmentados (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle =>
      'Indicador deslizante Liquid Glass com ícones';

  @override
  String get showcaseProgressTitle => 'Barras de progresso (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle =>
      'Gradientes neon com brilho e círculos de carregamento';

  @override
  String get showcaseAvatarsTitle => 'Avatares e presença (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle =>
      '4 tamanhos, ponto de status, iniciais e borda gradiente';

  @override
  String get securityDisableTitle => 'Desativar proteção por PIN?';

  @override
  String get securityDisableDesc =>
      'É necessário inserir seu PIN atual para desativar a proteção.';

  @override
  String get securityDisabledToast => 'Proteção por PIN desativada';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get diagnosticsDeviceGroup => 'Dispositivo e SO';

  @override
  String get diagnosticsAppGroup => 'Informações da versão';

  @override
  String get diagnosticsDisplayGroup => 'Tela e exibição';

  @override
  String get diagnosticsNetworkGroup => 'Rede e acessibilidade';

  @override
  String get notifRouterTestTitle => 'Teste de roteador de notificações';

  @override
  String get notifRouterTestDesc =>
      'Enviar notificação de teste com carga útil para verificar o roteamento';

  @override
  String get notifSendTestButton => 'Enviar notificação de teste';

  @override
  String get notifTestNotificationTitle => '🔔 Notificação de teste';

  @override
  String get notifTestNotificationBody =>
      'Toque para testar o tratamento de carga do NotificationRouter';

  @override
  String get notifTestNotificationSent =>
      'Notificação de teste enviada! Toque nela na barra de notificações.';

  @override
  String get notifPermissionOnboardingPreview =>
      'Pré-visualizar integração de permissões';

  @override
  String get notifSingleTitle => 'Notificação';
}
