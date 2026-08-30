// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get homeGreeting => '기반이 준비되었습니다';

  @override
  String get settingsTitle => '설정';

  @override
  String get aboutPrivacy => '개인정보 처리방침';

  @override
  String failedToOpen(String url) {
    return '$url을(를) 열 수 없습니다';
  }

  @override
  String get settingsLanguage => '언어';

  @override
  String get languageSystem => '시스템 설정 따르기';

  @override
  String get settingsTheme => '테마';

  @override
  String get themeSystem => '시스템 설정 따르기';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get interfaceGroup => '인터페이스';

  @override
  String get settingsFont => '글꼴';

  @override
  String get fontScale => '글꼴 크기';

  @override
  String get fontSystem => '시스템 설정 따르기';

  @override
  String get fontDefault => '기본값';

  @override
  String get updatesGroup => '업데이트';

  @override
  String get backgroundCheckTitle => '백그라운드 업데이트 확인';

  @override
  String get backgroundCheckSubtitle =>
      '앱이 백그라운드에서 업데이트를 확인합니다. 배터리를 절약하려면 끄세요. 수동 확인은 항상 가능합니다.';

  @override
  String get checkIntervalTitle => '확인 간격';

  @override
  String intervalHours(String hours) {
    return '$hours시간';
  }

  @override
  String get backgroundInstallTitle => '백그라운드 설치';

  @override
  String get backgroundInstallSubtitle => '발견된 업데이트를 자동으로 다운로드 및 설치';

  @override
  String get aboutGroup => '앱 정보';

  @override
  String get appNameLabel => '앱 이름';

  @override
  String get appVersionLabel => '앱 버전';

  @override
  String get coreVersionLabel => '코어 버전';

  @override
  String get deviceLabel => '기기';

  @override
  String get sourceCodeLabel => '소스 코드';

  @override
  String intervalMinutes(String minutes) {
    return '$minutes분';
  }

  @override
  String get installPermissionTitle => '설치 권한';

  @override
  String get installPermissionSubtitle => '이 출처에서 앱 설치 허용';

  @override
  String get notificationsPermissionTitle => '알림 권한';

  @override
  String get notificationsPermissionSubtitle => '발견된 업데이트 알림용';

  @override
  String get notificationsGroup => '알림';

  @override
  String get notifyUpdatesToggle => '업데이트 알림 받기';

  @override
  String get backgroundWorkTitle => '백그라운드 실행';

  @override
  String get backgroundWorkSubtitle => '배터리 제한 없이 실행 허용';

  @override
  String notifUpdateTitle(String version) {
    return '업데이트 $version 사용 가능';
  }

  @override
  String get notifUpdateBody => '설치하려면 앱을 여세요';

  @override
  String get notifUpdatedTitle => '앱이 업데이트되었습니다';

  @override
  String notifUpdatedBody(String version) {
    return '설치된 버전: $version';
  }

  @override
  String get checkForUpdate => '업데이트 확인';

  @override
  String get updateChecking => '확인 중...';

  @override
  String get updateUpToDate => '최신 버전입니다';

  @override
  String updateAvailable(String version) {
    return '버전 $version 사용 가능';
  }

  @override
  String updateDownload(String percent) {
    return '다운로드 중: $percent%';
  }

  @override
  String updateButton(String version) {
    return '$version(으)로 업데이트';
  }

  @override
  String updateCheckFailed(String error) {
    return '업데이트 확인 실패: $error';
  }

  @override
  String updateFailed(String error) {
    return '업데이트 실패: $error';
  }

  @override
  String errorWithMessage(String error) {
    return '오류: $error';
  }

  @override
  String get whatsNewLabel => '새 소식';

  @override
  String get forceUpdateTitle => '업데이트 필요';

  @override
  String get forceUpdateBody => '더 이상 지원되지 않는 버전입니다. 계속하려면 업데이트를 설치하세요.';

  @override
  String get storageGroup => '저장 공간';

  @override
  String storageUsed(String size) {
    return '업데이트 파일: $size MB';
  }

  @override
  String get clearCacheAction => '지우기';

  @override
  String get cacheCleared => '지워졌습니다';

  @override
  String get permissionOnboardingTitle => '최신 상태 및 보안 유지';

  @override
  String get permissionOnboardingBody =>
      '앱 업데이트 및 보안 알림을 즉시 받으려면 알림을 켜세요.';

  @override
  String get permissionOnboardingAction => '알림 활성화';

  @override
  String get permissionOnboardingDismiss => '나중에';

  @override
  String get permissionUpdatesBenefitTitle => 'OTA 업데이트';

  @override
  String get permissionUpdatesBenefitDesc => '새 버전 및 기능에 대한 즉각적인 알림';

  @override
  String get permissionSecurityBenefitTitle => '보안 및 보호';

  @override
  String get permissionSecurityBenefitDesc => '중요한 보안 이벤트 및 세션 알림';

  @override
  String get permissionGrantedSnackbar => '알림이 성공적으로 활성화되었습니다';

  @override
  String get permissionDeniedSnackbar =>
      '알림이 비활성화되었습니다. 설정에서 언제든지 활성화할 수 있습니다.';

  @override
  String get profileTitle => '프로필';

  @override
  String get profileGuestName => '게스트 사용자';

  @override
  String get profileGuestDesc => '로컬 오프라인 세션';

  @override
  String get profileLinkAccount => '계정 연결';

  @override
  String get profileLinkAccountDesc => 'Google, Telegram 또는 GitHub로 로그인';

  @override
  String get profileAccountSection => '계정';

  @override
  String get profileSecuritySection => '보안 및 세션';

  @override
  String get profileActiveSessions => '활성 기기';

  @override
  String get profileCurrentDevice => '이 기기';

  @override
  String get profileDeleteAccount => '프로필 및 데이터 지우기';

  @override
  String get profileDeleteConfirm =>
      '정말 삭제하시겠습니까? 모든 로컬 데이터가 삭제됩니다.';

  @override
  String get navHome => '홈';

  @override
  String get navShowcase => '쇼케이스';
}
