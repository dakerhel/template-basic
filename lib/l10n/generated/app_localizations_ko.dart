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
  String get permissionOnboardingBody => '앱 업데이트 및 보안 알림을 즉시 받으려면 알림을 켜세요.';

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
  String get profileDeleteConfirm => '정말 삭제하시겠습니까? 모든 로컬 데이터가 삭제됩니다.';

  @override
  String get navHome => '홈';

  @override
  String get navShowcase => '쇼케이스';

  @override
  String get homeStarterTitle => '디자인 시스템 스타터';

  @override
  String get homeStarterSubtitle =>
      'Flutter 3 • Riverpod • Liquid Glass UI Kit';

  @override
  String get homeActiveTokens => '활성 시스템 토큰';

  @override
  String get homeConfigure => '설정';

  @override
  String get homeQuickActions => '빠른 작업';

  @override
  String get homeThemeSheet => '테마 시트';

  @override
  String get homeThemeSheetSubtitle => '9가지 팔레트 및 모드';

  @override
  String get homeShowcase => 'UI 쇼케이스';

  @override
  String get homeShowcaseSubtitle => '모든 컴포넌트';

  @override
  String get homeSecurityTest => '보안 테스트';

  @override
  String get homeSecurityTestSubtitle => '화면 잠금 테스트';

  @override
  String get homeDiagnostics => '시스템 진단';

  @override
  String get homeDiagnosticsSubtitle => 'DPR, 메모리, OS 정보';

  @override
  String get homeRiverpodState => 'Riverpod 반응형 상태';

  @override
  String get homeIncrement => '증가';

  @override
  String get homeReset => '초기화';

  @override
  String get liquidGlassEffect => 'Liquid Glass 효과';

  @override
  String get liquidGlassSubtitle => '광학 흐림 및 반사 효과';

  @override
  String get colorSchemes => '색상 팔레트';

  @override
  String get securityGroup => '보안';

  @override
  String get securityPinTitle => 'PIN 보호';

  @override
  String get securityPinSubtitle => '앱 시작 시 PIN 코드 요구';

  @override
  String get securityBiometricsTitle => '생체 인증 (지문 / Face ID)';

  @override
  String get securityBiometricsSubtitle => '디바이스 센서로 빠른 로그인';

  @override
  String get securityPrivacyTitle => '최근 작업 목록에서 숨기기';

  @override
  String get securityPrivacySubtitle => '앱 전환 시 화면 엿보기 방지';

  @override
  String get securityChangePin => 'PIN 코드 변경';

  @override
  String get securityChangePinSubtitle => '새로운 4자리 코드 설정';

  @override
  String get securityAutoLock => '자동 잠금 시간';

  @override
  String get securityLockNow => '지금 화면 잠금';

  @override
  String get securityPinChanged => 'PIN 코드가 성공적으로 변경되었습니다';

  @override
  String get securityTimeoutImmediately => '즉시';

  @override
  String get securityTimeout1Min => '1분';

  @override
  String get securityTimeout5Min => '5분';

  @override
  String get securityTimeout15Min => '15분';

  @override
  String get lockScreenTitle => 'PIN 코드 입력';

  @override
  String get lockScreenLockedTitle => '입력 잠김';

  @override
  String get lockScreenSubtitle => '앱에 접근하기 위해 필요합니다';

  @override
  String get lockScreenBiometricsReason => '앱 잠금을 해제하려면 본인 인증을 해주세요';

  @override
  String lockScreenBiometricsDisabled(String remaining) {
    return '3회 실패 후 생체 인증이 비활성화되었습니다. PIN을 입력하세요 (남은 횟수: $remaining)';
  }

  @override
  String lockScreenAttemptsLeft(String remaining) {
    return '잘못된 PIN입니다. 남은 횟수: $remaining';
  }

  @override
  String lockScreenTimer(String time) {
    return '$time 후에 다시 시도하세요';
  }

  @override
  String get pinSetupCreate => 'PIN 코드 생성';

  @override
  String get pinSetupConfirm => 'PIN 코드 확인';

  @override
  String get pinSetupEnterCurrent => '현재 PIN 코드';

  @override
  String get pinSetupEnterNew => '새 PIN 코드';

  @override
  String get pinSetupPromptDigits => '앱을 보호할 4자리 숫자를 입력하세요';

  @override
  String get pinSetupPromptConfirm => '확인을 위해 PIN 코드를 다시 입력하세요';

  @override
  String get pinSetupMismatch => 'PIN 코드가 일치하지 않습니다. 다시 시도하세요';

  @override
  String get pinSetupTooSimple => 'PIN이 너무 단순합니다. 동일하거나 연속된 숫자는 피하세요';

  @override
  String get diagnosticsTitle => '시스템 진단';

  @override
  String get diagnosticsCopy => '진단 정보 복사';

  @override
  String get diagnosticsCopied => '진단 정보가 클립보드에 복사되었습니다';

  @override
  String get showcaseButtonsTitle => '버튼 (AppButton & AppIconButton)';

  @override
  String get showcaseButtonsSubtitle => '5가지 변형, 3가지 크기, 로딩 상태 및 스프링 물리';

  @override
  String get showcaseInputsTitle => '입력 필드 (AppTextField & Search)';

  @override
  String get showcaseInputsSubtitle => '빠른 지우기, 비밀번호 토글 및 스타일 검색';

  @override
  String get showcaseToastsTitle => '플로팅 알림 (AppToast HUD)';

  @override
  String get showcaseToastsSubtitle => '배경 흐림 팝업 및 스와이프 닫기';

  @override
  String get showcaseSheetsTitle => '모달 시트 (AppBottomSheet)';

  @override
  String get showcaseSheetsSubtitle => '스와이프 및 Liquid Glass 흐림이 적용된 통합 시트';

  @override
  String get showcaseBadgesTitle => '배지 및 태그 (AppBadge & AppChip)';

  @override
  String get showcaseBadgesSubtitle => '발광 상태 표시기 및 대화형 필터';

  @override
  String get showcaseHapticsTitle => '햅틱 엔진 (AppHaptics)';

  @override
  String get showcaseHapticsSubtitle => '안전한 의미론적 디바이스 진동 패턴';

  @override
  String get showcaseSegmentsTitle => '세그먼트 컨트롤 (AppSegmentedControl)';

  @override
  String get showcaseSegmentsSubtitle => '아이콘을 지원하는 슬라이딩 Liquid Glass 표시기';

  @override
  String get showcaseProgressTitle => '진행 표시줄 (AppProgressBar)';

  @override
  String get showcaseProgressSubtitle => '네온 그라데이션 발광 및 원형 스피너';

  @override
  String get showcaseAvatarsTitle => '아바타 및 접속 상태 (AppAvatar)';

  @override
  String get showcaseAvatarsSubtitle => '4가지 크기, 상태 점, 이니셜 및 그라데이션 테두리';

  @override
  String get securityDisableTitle => 'PIN 보호를 비활성화하시겠습니까?';

  @override
  String get securityDisableDesc => '보호를 비활성화하려면 현재 PIN을 입력해야 합니다.';

  @override
  String get securityDisabledToast => 'PIN 보호가 비활성화되었습니다';

  @override
  String get commonCancel => '취소';

  @override
  String get commonContinue => '계속';

  @override
  String get diagnosticsDeviceGroup => '기기 및 OS';

  @override
  String get diagnosticsAppGroup => '앱 빌드 정보';

  @override
  String get diagnosticsDisplayGroup => '화면 및 디스플레이';

  @override
  String get diagnosticsNetworkGroup => '네트워크 및 접근성';

  @override
  String get notifRouterTestTitle => '알림 라우터 테스트';

  @override
  String get notifRouterTestDesc => '라우팅 디스패처를 확인하기 위해 페이로드가 포함된 테스트 푸시 전송';

  @override
  String get notifSendTestButton => '테스트 알림 보내기';

  @override
  String get notifTestNotificationTitle => '🔔 테스트 알림';

  @override
  String get notifTestNotificationBody =>
      'NotificationRouter 페이로드 처리를 테스트하려면 탭하세요';

  @override
  String get notifTestNotificationSent => '테스트 알림이 전송되었습니다! 시스템 알림창에서 탭하세요.';

  @override
  String get notifPermissionOnboardingPreview => '권한 온보딩 미리보기';

  @override
  String get notifSingleTitle => '알림';
}
