// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => '基盤の準備ができました';

  @override
  String get settingsTitle => '設定';

  @override
  String get aboutPrivacy => 'プライバシーポリシー';

  @override
  String failedToOpen(String url) {
    return '$url を開けませんでした';
  }

  @override
  String get settingsLanguage => '言語';

  @override
  String get languageSystem => 'システムに従う';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get themeSystem => 'システムに従う';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get interfaceGroup => 'インターフェース';

  @override
  String get settingsFont => 'フォント';

  @override
  String get fontScale => 'フォントサイズ';

  @override
  String get fontSystem => 'システムに従う';

  @override
  String get fontDefault => 'デフォルト';

  @override
  String get updatesGroup => 'アップデート';

  @override
  String get backgroundCheckTitle => 'バックグラウンド更新チェック';

  @override
  String get backgroundCheckSubtitle =>
      'アプリはバックグラウンドでアップデートを確認します。バッテリー節約のため無効にできます。手動チェックはいつでも可能です。';

  @override
  String get checkIntervalTitle => 'チェック間隔';

  @override
  String intervalHours(String hours) {
    return '$hours時間';
  }

  @override
  String get backgroundInstallTitle => 'バックグラウンドインストール';

  @override
  String get backgroundInstallSubtitle => '見つかったアップデートを自動的にダウンロードしてインストール';

  @override
  String get aboutGroup => 'アプリについて';

  @override
  String get appNameLabel => 'アプリ名';

  @override
  String get appVersionLabel => 'アプリバージョン';

  @override
  String get coreVersionLabel => 'コアバージョン';

  @override
  String get deviceLabel => 'デバイス';

  @override
  String get sourceCodeLabel => 'ソースコード';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes分';
  }

  @override
  String get installPermissionTitle => 'インストール権限';

  @override
  String get installPermissionSubtitle => 'このソースからのアプリのインストールを許可';

  @override
  String get notificationsPermissionTitle => '通知権限';

  @override
  String get notificationsPermissionSubtitle => '見つかったアップデートの通知用';

  @override
  String get notificationsGroup => '通知';

  @override
  String get notifyUpdatesToggle => 'アップデートを通知';

  @override
  String get backgroundWorkTitle => 'バックグラウンド実行';

  @override
  String get backgroundWorkSubtitle => 'バッテリー制限なしでの実行を許可';

  @override
  String notifUpdateTitle(String version) {
    return 'アップデート $version が利用可能';
  }

  @override
  String get notifUpdateBody => 'アプリを開いてインストール';

  @override
  String get notifUpdatedTitle => 'アプリを更新しました';

  @override
  String notifUpdatedBody(String version) {
    return 'インストールされたバージョン: $version';
  }

  @override
  String get checkForUpdate => 'アップデートを確認';

  @override
  String get updateChecking => '確認中...';

  @override
  String get updateUpToDate => '最新バージョンです';

  @override
  String updateAvailable(String version) {
    return 'バージョン $version が利用可能';
  }

  @override
  String updateDownload(String percent) {
    return 'ダウンロード中：$percent%';
  }

  @override
  String updateButton(String version) {
    return '$version にアップデート';
  }

  @override
  String updateCheckFailed(String error) {
    return 'アップデートの確認に失敗しました：$error';
  }

  @override
  String updateFailed(String error) {
    return 'アップデートに失敗しました：$error';
  }

  @override
  String errorWithMessage(String error) {
    return 'エラー: $error';
  }

  @override
  String get whatsNewLabel => '新機能';

  @override
  String get forceUpdateTitle => 'アップデートが必要です';

  @override
  String get forceUpdateBody => 'このバージョンはサポート終了です。続行するにはアップデートをインストールしてください。';

  @override
  String get storageGroup => 'ストレージ';

  @override
  String storageUsed(String size) {
    return '更新ファイル: $size MB';
  }

  @override
  String get clearCacheAction => '消去';

  @override
  String get cacheCleared => '消去しました';

  @override
  String get permissionOnboardingTitle => '最新情報を確認';

  @override
  String get permissionOnboardingBody =>
      'アプリの更新情報やセキュリティ通知を受け取るには通知を有効にしてください。';

  @override
  String get permissionOnboardingAction => '通知を有効にする';

  @override
  String get permissionOnboardingDismiss => '後で';

  @override
  String get permissionUpdatesBenefitTitle => 'OTAアップデート';

  @override
  String get permissionUpdatesBenefitDesc => '新バージョンや新機能の即時アラート';

  @override
  String get permissionSecurityBenefitTitle => 'セキュリティ保護';

  @override
  String get permissionSecurityBenefitDesc => '重大なセキュリティイベントとセッション通知';

  @override
  String get permissionGrantedSnackbar => '通知が有効になりました';

  @override
  String get permissionDeniedSnackbar => '通知は無効です。設定からいつでも有効にできます。';

  @override
  String get profileTitle => 'プロフィール';

  @override
  String get profileGuestName => 'ゲストユーザー';

  @override
  String get profileGuestDesc => 'ローカルオフラインセッション';

  @override
  String get profileLinkAccount => 'アカウント連携';

  @override
  String get profileLinkAccountDesc => 'Google、Telegram、GitHubでログイン';

  @override
  String get profileAccountSection => 'アカウント';

  @override
  String get profileSecuritySection => 'セキュリティとセッション';

  @override
  String get profileActiveSessions => 'アクティブなデバイス';

  @override
  String get profileCurrentDevice => 'このデバイス';

  @override
  String get profileDeleteAccount => 'プロフィールとデータを削除';

  @override
  String get profileDeleteConfirm => 'よろしいですか？すべてのローカルデータが削除されます。';

  @override
  String get navHome => 'ホーム';

  @override
  String get navShowcase => 'ショーケース';

  @override
  String get homeStarterTitle => 'デザインシステム スターター';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => 'アクティブなシステムトークン';

  @override
  String get homeConfigure => '設定';

  @override
  String get homeQuickActions => 'クイックアクション';

  @override
  String get homeThemeSheet => 'テーマシート';

  @override
  String get homeThemeSheetSubtitle => '9種類のパレットとモード';

  @override
  String get homeShowcase => 'UIショーケース';

  @override
  String get homeShowcaseSubtitle => '全コンポーネント一覧';

  @override
  String get homeSecurityTest => 'セキュリティテスト';

  @override
  String get homeSecurityTestSubtitle => '画面ロックテスト';

  @override
  String get homeDiagnostics => 'システム診断';

  @override
  String get homeDiagnosticsSubtitle => 'DPR、メモリ、OS情報';

  @override
  String get homeRiverpodState => 'Riverpod リアクティブ状態';

  @override
  String get homeIncrement => '増加';

  @override
  String get homeReset => 'リセット';

  @override
  String get liquidGlassEffect => 'Liquid Glass効果';

  @override
  String get liquidGlassSubtitle => '光学的なぼかしとスペキュラ反射';

  @override
  String get colorSchemes => 'カラーパレット';

  @override
  String get securityGroup => 'セキュリティ';

  @override
  String get securityPinTitle => 'PINコード保護';

  @override
  String get securityPinSubtitle => 'アプリ起動時にPINコードを要求';

  @override
  String get securityBiometricsTitle => '生体認証 (指紋 / Face ID)';

  @override
  String get securityBiometricsSubtitle => '端末センサーによる素早いログイン';

  @override
  String get securityPrivacyTitle => 'タスク一覧で内容を非表示';

  @override
  String get securityPrivacySubtitle => 'アプリ切り替え時の覗き見防止';

  @override
  String get securityChangePin => 'PINコード変更';

  @override
  String get securityChangePinSubtitle => '新しい4桁の暗証番号を設定';

  @override
  String get securityAutoLock => '自動ロック時間';

  @override
  String get securityLockNow => '今すぐ画面をロック';

  @override
  String get securityPinChanged => 'PINコードが正常に変更されました';

  @override
  String get securityTimeoutImmediately => '即時';

  @override
  String get securityTimeout1Min => '1分';

  @override
  String get securityTimeout5Min => '5分';

  @override
  String get securityTimeout15Min => '15分';

  @override
  String get lockScreenTitle => 'PINコードを入力';

  @override
  String get lockScreenLockedTitle => '入力がロックされています';

  @override
  String get lockScreenSubtitle => 'アプリにアクセスするために必要です';

  @override
  String get lockScreenBiometricsReason => '認証してアプリのロックを解除';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return '3回失敗したため生体認証が無効化されました。PINを入力してください（残り: $remaining回）';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return 'PINコードが間違っています。残り試行回数: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return '$time 後にもう一度お試しください';
  }

  @override
  String get pinSetupCreate => 'PINコード作成';

  @override
  String get pinSetupConfirm => 'PINコード確認';

  @override
  String get pinSetupEnterCurrent => '現在のPINコード';

  @override
  String get pinSetupEnterNew => '新しいPINコード';

  @override
  String get pinSetupPromptDigits => 'アプリを保護する4桁の番号を入力してください';

  @override
  String get pinSetupPromptConfirm => '確認のためもう一度PINコードを入力してください';

  @override
  String get pinSetupMismatch => 'PINコードが一致しません。再試行してください';

  @override
  String get pinSetupTooSimple => 'PINが単純すぎます。同じ数字や連続する数字は避けてください';

  @override
  String get diagnosticsTitle => 'システム診断';

  @override
  String get diagnosticsCopy => '診断情報をコピー';

  @override
  String get diagnosticsCopied => '診断情報をクリップボードにコピーしました';

  @override
  String get showcaseButtonsTitle => 'ボタン (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle => '5つのバリアント、3サイズ、ロード状態とスプリング物理アニメーション';

  @override
  String get showcaseInputsTitle => '入力フィールド (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle => '素早いクリア、パスワード表示切り替え、スタイル付き検索';

  @override
  String get showcaseToastsTitle => 'フロート通知 (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle => '背景ぼかし付きポップアップ、スワイプで閉じる機能';

  @override
  String get showcaseSheetsTitle => 'モーダルシート (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle => 'スワイプ操作とLiquid Glassぼかしを備えた統合シート';

  @override
  String get showcaseBadgesTitle => 'バッジ & タグ (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle => '発光ステータス表示とインタラクティブなフィルタ';

  @override
  String get showcaseHapticsTitle => '触覚フィードバックエンジン (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => '安全で意味論的なデバイス振動パターン';

  @override
  String get showcaseSegmentsTitle => 'セグメントコントロール (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle => 'アイコン対応のスライド式Liquid Glassインジケーター';

  @override
  String get showcaseProgressTitle => 'プログレスバー (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle => 'ネオングラデーション発光と円形スピナー';

  @override
  String get showcaseAvatarsTitle => 'アバター & プレゼンス (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle => '4サイズ、ステータスドット、イニシャル、グラデーション枠線';

  @override
  String get securityDisableTitle => 'PIN保護を無効にしますか？';

  @override
  String get securityDisableDesc => '保護を無効にするには、現在のPINを入力する必要があります。';

  @override
  String get securityDisabledToast => 'PIN保護が無効になりました';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonContinue => '続行';

  @override
  String get diagnosticsDeviceGroup => 'デバイスとOS';

  @override
  String get diagnosticsAppGroup => 'アプリビルド情報';

  @override
  String get diagnosticsDisplayGroup => '画面とディスプレイ';

  @override
  String get diagnosticsNetworkGroup => 'ネットワークとアクセシビリティ';

  @override
  String get notifRouterTestTitle => '通知ルーターテスト';

  @override
  String get notifRouterTestDesc => 'ルーティングディスパッチャを検証するためにペイロード付きテスト通知を送信';

  @override
  String get notifSendTestButton => 'テスト通知を送信';

  @override
  String get notifTestNotificationTitle => '🔔 テスト通知';

  @override
  String get notifTestNotificationBody =>
      'タップして NotificationRouter のペイロード処理をテスト';

  @override
  String get notifTestNotificationSent => 'テスト通知を送信しました！通知バーからタップしてください。';

  @override
  String get notifPermissionOnboardingPreview => '権限オンボーディングをプレビュー';

  @override
  String get notifSingleTitle => '通知';
}
