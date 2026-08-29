// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => '基础已就绪';

  @override
  String get settingsTitle => '设置';

  @override
  String get aboutPrivacy => '隐私政策';

  @override
  String failedToOpen(String url) {
    return '无法打开 $url';
  }

  @override
  String get settingsLanguage => '语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get settingsTheme => '主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get interfaceGroup => '界面';

  @override
  String get settingsFont => '字体';

  @override
  String get fontScale => '字体大小';

  @override
  String get fontSystem => '跟随系统';

  @override
  String get fontDefault => '默认';

  @override
  String get updatesGroup => '更新';

  @override
  String get backgroundCheckTitle => '后台检查更新';

  @override
  String get backgroundCheckSubtitle => '应用在后台检查更新。为节省电量可关闭。随时可以手动检查更新。';

  @override
  String get checkIntervalTitle => '检查间隔';

  @override
  String intervalHours(String hours) {
    return '$hours 小时';
  }

  @override
  String get backgroundInstallTitle => '后台安装';

  @override
  String get backgroundInstallSubtitle => '自动下载并安装找到的更新';

  @override
  String get aboutGroup => '关于应用';

  @override
  String get appNameLabel => '应用名称';

  @override
  String get appVersionLabel => '应用版本';

  @override
  String get coreVersionLabel => '核心版本';

  @override
  String get deviceLabel => '设备';

  @override
  String get sourceCodeLabel => '源代码';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes 分钟';
  }

  @override
  String get installPermissionTitle => '安装权限';

  @override
  String get installPermissionSubtitle => '允许从此来源安装应用';

  @override
  String get notificationsPermissionTitle => '通知权限';

  @override
  String get notificationsPermissionSubtitle => '用于发现更新时发送通知';

  @override
  String get notificationsGroup => '通知';

  @override
  String get notifyUpdatesToggle => '更新时通知我';

  @override
  String get backgroundWorkTitle => '后台运行';

  @override
  String get backgroundWorkSubtitle => '允许不受电池限制地运行';

  @override
  String notifUpdateTitle(String version) {
    return '有可用更新 $version';
  }

  @override
  String get notifUpdateBody => '打开应用以安装';

  @override
  String get notifUpdatedTitle => '应用已更新';

  @override
  String notifUpdatedBody(String version) {
    return '已安装版本 $version';
  }

  @override
  String get checkForUpdate => '检查更新';

  @override
  String get updateChecking => '检查中...';

  @override
  String get updateUpToDate => '已是最新版本';

  @override
  String updateAvailable(String version) {
    return '新版本 $version 可用';
  }

  @override
  String updateDownload(String percent) {
    return '下载中：$percent%';
  }

  @override
  String updateButton(String version) {
    return '更新到 $version';
  }

  @override
  String updateCheckFailed(String error) {
    return '无法检查更新：$error';
  }

  @override
  String updateFailed(String error) {
    return '更新失败：$error';
  }

  @override
  String errorWithMessage(String error) {
    return '错误：$error';
  }

  @override
  String get whatsNewLabel => '更新内容';

  @override
  String get forceUpdateTitle => '需要更新';

  @override
  String get forceUpdateBody => '您的版本已不再受支持。请安装更新以继续。';

  @override
  String get storageGroup => '存储';

  @override
  String storageUsed(String size) {
    return '更新文件：$size MB';
  }

  @override
  String get cacheCleared => '已清除';

  @override
  String get permissionOnboardingTitle => '保持最新与安全';

  @override
  String get permissionOnboardingBody =>
      '开启通知以即时获取应用更新与重要安全提示。';

  @override
  String get permissionOnboardingAction => '开启通知';

  @override
  String get permissionOnboardingDismiss => '稍后';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA更新';

  @override
  String get permissionUpdatesBenefitDesc => '新版本与功能的即时提醒';

  @override
  String get permissionSecurityBenefitTitle => '安全与防护';

  @override
  String get permissionSecurityBenefitDesc => '关键安全事件与会话提醒';

  @override
  String get permissionGrantedSnackbar => '通知已成功开启';

  @override
  String get permissionDeniedSnackbar =>
      '通知已关闭。您可随时在“设置”中开启。';

  @override
  String get profileTitle => '个人资料';

  @override
  String get profileGuestName => '访客用户';

  @override
  String get profileGuestDesc => '本地离线会话';

  @override
  String get profileLinkAccount => '绑定账号';

  @override
  String get profileLinkAccountDesc => '通过 Google、Telegram 或 GitHub 登录';

  @override
  String get profileAccountSection => '账号设置';

  @override
  String get profileSecuritySection => '安全与会话';

  @override
  String get profileActiveSessions => '活跃设备';

  @override
  String get profileCurrentDevice => '当前设备';

  @override
  String get profileDeleteAccount => '清除资料与数据';

  @override
  String get profileDeleteConfirm => '确定要清除吗？所有本地数据将被删除。';
}
