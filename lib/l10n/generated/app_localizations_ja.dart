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
  String get clearCacheAction => 'クリア';

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
  String get permissionSecurityBenefitDesc =>
      '重大なセキュリティイベントとセッション通知';

  @override
  String get permissionGrantedSnackbar => '通知が有効になりました';

  @override
  String get permissionDeniedSnackbar =>
      '通知は無効です。設定からいつでも有効にできます。';

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
  String get profileDeleteConfirm =>
      'よろしいですか？すべてのローカルデータが削除されます。';
}
