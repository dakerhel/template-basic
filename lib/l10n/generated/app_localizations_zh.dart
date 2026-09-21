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
  String get clearCacheAction => '清除';

  @override
  String get cacheCleared => '已清除';

  @override
  String get permissionOnboardingTitle => '保持最新与安全';

  @override
  String get permissionOnboardingBody => '开启通知以即时获取应用更新与重要安全提示。';

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
  String get permissionDeniedSnackbar => '通知已关闭。您可随时在“设置”中开启。';

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

  @override
  String get navHome => '首页';

  @override
  String get navShowcase => '组件库';

  @override
  String get homeStarterTitle => '设计系统入门套件';

  @override
  String get homeStarterSubtitle => 'Flutter 3 • Riverpod • 液态玻璃 UI Kit';

  @override
  String get homeActiveTokens => '当前系统设计令牌';

  @override
  String get homeConfigure => '配置';

  @override
  String get homeQuickActions => '快捷操作';

  @override
  String get homeThemeSheet => '主题抽屉';

  @override
  String get homeThemeSheetSubtitle => '9款调色板与模式';

  @override
  String get homeShowcase => 'UI组件展厅';

  @override
  String get homeShowcaseSubtitle => '全量组件陈列';

  @override
  String get homeSecurityTest => '安全测试';

  @override
  String get homeSecurityTestSubtitle => '屏幕锁定测试';

  @override
  String get homeDiagnostics => '系统诊断';

  @override
  String get homeDiagnosticsSubtitle => 'DPR、内存、系统';

  @override
  String get homeRiverpodState => 'Riverpod 响应式状态';

  @override
  String get homeIncrement => '增加';

  @override
  String get homeReset => '重置';

  @override
  String get liquidGlassEffect => '液态玻璃效果';

  @override
  String get liquidGlassSubtitle => '光学模糊与高光折射';

  @override
  String get colorSchemes => '配色方案';

  @override
  String get securityGroup => '安全与隐私';

  @override
  String get securityPinTitle => 'PIN 密码保护';

  @override
  String get securityPinSubtitle => '启动应用时要求输入 PIN 码';

  @override
  String get securityBiometricsTitle => '生物识别 (指纹 / 面容)';

  @override
  String get securityBiometricsSubtitle => '使用设备传感器快速解锁';

  @override
  String get securityPrivacyTitle => '在任务切换器中隐藏内容';

  @override
  String get securityPrivacySubtitle => '切换应用时保护隐私防窥';

  @override
  String get securityChangePin => '修改 PIN 码';

  @override
  String get securityChangePinSubtitle => '设置新的 4 位数字密码';

  @override
  String get securityAutoLock => '自动锁定时长';

  @override
  String get securityLockNow => '立即锁定屏幕';

  @override
  String get securityPinChanged => 'PIN 码修改成功';

  @override
  String get securityTimeoutImmediately => '立即';

  @override
  String get securityTimeout1Min => '1 分钟';

  @override
  String get securityTimeout5Min => '5 分钟';

  @override
  String get securityTimeout15Min => '15 分钟';

  @override
  String get lockScreenTitle => '输入 PIN 码';

  @override
  String get lockScreenLockedTitle => '输入已锁定';

  @override
  String get lockScreenSubtitle => '解锁以访问应用程序';

  @override
  String get lockScreenBiometricsReason => '请验证身份以进入应用';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return '3次错误后生物识别已停用。请输入 PIN 码（剩余：$remaining次）';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PIN 码错误。剩余尝试次数：$remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return '请在 $time 后重试';
  }

  @override
  String get pinSetupCreate => '创建 PIN 码';

  @override
  String get pinSetupConfirm => '确认 PIN 码';

  @override
  String get pinSetupEnterCurrent => '当前 PIN 码';

  @override
  String get pinSetupEnterNew => '新 PIN 码';

  @override
  String get pinSetupPromptDigits => '输入 4 位数字以保护应用安全';

  @override
  String get pinSetupPromptConfirm => '请再次输入 PIN 码进行确认';

  @override
  String get pinSetupMismatch => '两次输入的 PIN 码不一致，请重试';

  @override
  String get pinSetupTooSimple => 'PIN 码过于简单，请勿使用重复或连续数字';

  @override
  String get diagnosticsTitle => '系统诊断';

  @override
  String get diagnosticsCopy => '复制诊断信息';

  @override
  String get diagnosticsCopied => '诊断信息已复制到剪贴板';

  @override
  String get showcaseButtonsTitle => '按钮组件 (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle => '5种样式、3种尺寸、内置加载态与弹性物理动画';

  @override
  String get showcaseInputsTitle => '输入框 (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle => '一键清除、密码显示切换与精美搜索框';

  @override
  String get showcaseToastsTitle => '悬浮通知 (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle => '背景模糊毛玻璃弹窗，支持滑动手势关闭';

  @override
  String get showcaseSheetsTitle => '底部抽屉 (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle => '统一手势拖拽与液态玻璃模糊效果';

  @override
  String get showcaseBadgesTitle => '徽标与标签 (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle => '发光状态指示器与交互式筛选芯片';

  @override
  String get showcaseHapticsTitle => '触觉反馈引擎 (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => '安全且符合语义的设备振动模式';

  @override
  String get showcaseSegmentsTitle => '分段控制器 (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle => '滑动液态玻璃指示器，支持图标展示';

  @override
  String get showcaseProgressTitle => '进度条 (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle => '霓虹渐变发光进度条与环形加载器';

  @override
  String get showcaseAvatarsTitle => '头像与在线状态 (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle => '4种尺寸、状态小圆点、首字母与渐变外框';

  @override
  String get securityDisableTitle => '关闭 PIN 保护？';

  @override
  String get securityDisableDesc => '关闭保护需要输入当前 PIN 码。';

  @override
  String get securityDisabledToast => 'PIN 保护已关闭';

  @override
  String get commonCancel => '取消';

  @override
  String get commonContinue => '继续';

  @override
  String get diagnosticsDeviceGroup => '设备与系统';

  @override
  String get diagnosticsAppGroup => '应用构建信息';

  @override
  String get diagnosticsDisplayGroup => '屏幕与显示';

  @override
  String get diagnosticsNetworkGroup => '网络与无障碍';

  @override
  String get notifRouterTestTitle => '通知路由器测试';

  @override
  String get notifRouterTestDesc => '发送包含有效负载的测试推送以验证路由分发器';

  @override
  String get notifSendTestButton => '发送测试通知';

  @override
  String get notifTestNotificationTitle => '🔔 测试通知';

  @override
  String get notifTestNotificationBody => '点击测试 NotificationRouter 负载处理';

  @override
  String get notifTestNotificationSent => '测试通知已发送！请在系统通知栏中点击它。';

  @override
  String get notifPermissionOnboardingPreview => '预览权限引导';

  @override
  String get notifSingleTitle => '通知';
}
