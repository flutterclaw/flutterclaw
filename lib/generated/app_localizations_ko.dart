// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => '채팅';

  @override
  String get channels => '채널';

  @override
  String get agent => '에이전트';

  @override
  String get settings => '설정';

  @override
  String get getStarted => '시작하기';

  @override
  String get yourPersonalAssistant => '당신의 개인 AI 비서';

  @override
  String get multiChannelChat => '멀티 채널 채팅';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat 등';

  @override
  String get powerfulAIModels => '강력한 AI 모델';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok 및 무료 모델';

  @override
  String get localGateway => '로컬 게이트웨이';

  @override
  String get localGatewayDesc => '기기에서 실행, 데이터는 당신의 것';

  @override
  String get chooseProvider => '제공자 선택';

  @override
  String get selectProviderDesc => 'AI 모델에 연결하는 방법을 선택하세요.';

  @override
  String get startForFree => '무료로 시작';

  @override
  String get freeProvidersDesc => '이러한 제공자는 무료 모델을 제공합니다.';

  @override
  String get free => '무료';

  @override
  String get otherProviders => '기타 제공자';

  @override
  String connectToProvider(String provider) {
    return '$provider에 연결';
  }

  @override
  String get enterApiKeyDesc => 'API 키를 입력하고 모델을 선택하세요.';

  @override
  String get dontHaveApiKey => 'API 키가 없으신가요?';

  @override
  String get createAccountCopyKey => '계정을 만들고 키를 복사하세요.';

  @override
  String get signUp => '가입하기';

  @override
  String get apiKey => 'API 키';

  @override
  String get pasteFromClipboard => '클립보드에서 붙여넣기';

  @override
  String get apiBaseUrl => 'API 기본 URL';

  @override
  String get selectModel => '모델 선택';

  @override
  String get modelId => '모델 ID';

  @override
  String get validateKey => '키 검증';

  @override
  String get validating => '검증 중...';

  @override
  String get invalidApiKey => '유효하지 않은 API 키';

  @override
  String get gatewayConfiguration => '게이트웨이 구성';

  @override
  String get gatewayConfigDesc => '게이트웨이는 비서의 로컬 제어 평면입니다.';

  @override
  String get defaultSettingsNote => '기본 설정은 대부분의 사용자에게 적합합니다. 필요한 경우에만 변경하세요.';

  @override
  String get host => '호스트';

  @override
  String get port => '포트';

  @override
  String get autoStartGateway => '게이트웨이 자동 시작';

  @override
  String get autoStartGatewayDesc => '앱 시작 시 게이트웨이를 자동으로 시작합니다.';

  @override
  String get channelsPageTitle => '채널';

  @override
  String get channelsPageDesc => '선택적으로 메시징 채널을 연결하세요. 나중에 설정에서 구성할 수 있습니다.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Telegram 봇을 연결하세요.';

  @override
  String get openBotFather => 'BotFather 열기';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Discord 봇을 연결하세요.';

  @override
  String get developerPortal => '개발자 포털';

  @override
  String get botToken => '봇 토큰';

  @override
  String telegramBotToken(String platform) {
    return '$platform 봇 토큰';
  }

  @override
  String get readyToGo => '준비 완료';

  @override
  String get reviewConfiguration => '구성을 검토하고 FlutterClaw를 시작하세요.';

  @override
  String get model => '모델';

  @override
  String viaProvider(String provider) {
    return '$provider를 통해';
  }

  @override
  String get gateway => '게이트웨이';

  @override
  String get webChatOnly => 'WebChat만 (나중에 더 추가 가능)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => '시작 중...';

  @override
  String get startFlutterClaw => 'FlutterClaw 시작';

  @override
  String get newSession => '새 세션';

  @override
  String get photoLibrary => '사진 라이브러리';

  @override
  String get camera => '카메라';

  @override
  String get whatDoYouSeeInImage => '이 이미지에서 무엇을 보시나요?';

  @override
  String get imagePickerNotAvailable =>
      '시뮬레이터에서는 이미지 선택기를 사용할 수 없습니다. 실제 기기를 사용하세요.';

  @override
  String get couldNotOpenImagePicker => '이미지 선택기를 열 수 없습니다.';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get attachImage => '이미지 첨부';

  @override
  String get messageFlutterClaw => 'FlutterClaw에 메시지...';

  @override
  String get channelsAndGateway => '채널 및 게이트웨이';

  @override
  String get stop => '중지';

  @override
  String get start => '시작';

  @override
  String status(String status) {
    return '상태: $status';
  }

  @override
  String get builtInChatInterface => '내장 채팅 인터페이스';

  @override
  String get notConfigured => '구성되지 않음';

  @override
  String get connected => '연결됨';

  @override
  String get configuredStarting => '구성됨 (시작 중...)';

  @override
  String get telegramConfiguration => 'Telegram 구성';

  @override
  String get fromBotFather => '@BotFather에서';

  @override
  String get allowedUserIds => '허용된 사용자 ID (쉼표로 구분)';

  @override
  String get leaveEmptyToAllowAll => '모두 허용하려면 비워두세요';

  @override
  String get cancel => '취소';

  @override
  String get saveAndConnect => '저장 및 연결';

  @override
  String get discordConfiguration => 'Discord 구성';

  @override
  String get pendingPairingRequests => '대기 중인 페어링 요청';

  @override
  String get approve => '승인';

  @override
  String get reject => '거부';

  @override
  String get expired => '만료됨';

  @override
  String minutesLeft(int minutes) {
    return '$minutes분 남음';
  }

  @override
  String get workspaceFiles => '작업 공간 파일';

  @override
  String get personalAIAssistant => '개인 AI 비서';

  @override
  String sessionsCount(int count) {
    return '세션 ($count)';
  }

  @override
  String get noActiveSessions => '활성 세션 없음';

  @override
  String get startConversationToCreate => '대화를 시작하여 생성하세요';

  @override
  String get startConversationToSee => '대화를 시작하여 세션을 확인하세요';

  @override
  String get reset => '재설정';

  @override
  String get cronJobs => '예약된 작업';

  @override
  String get noCronJobs => '예약된 작업 없음';

  @override
  String get addScheduledTasks => '에이전트에 대한 예약된 작업 추가';

  @override
  String get runNow => '지금 실행';

  @override
  String get enable => '활성화';

  @override
  String get disable => '비활성화';

  @override
  String get delete => '삭제';

  @override
  String get skills => '스킬';

  @override
  String get browseClawHub => 'ClawHub 둘러보기';

  @override
  String get noSkillsInstalled => '설치된 스킬 없음';

  @override
  String get browseClawHubToAdd => 'ClawHub를 둘러보고 스킬 추가';

  @override
  String removeSkillConfirm(String name) {
    return '스킬에서 \"$name\"을(를) 제거하시겠습니까?';
  }

  @override
  String get clawHubSkills => 'ClawHub 스킬';

  @override
  String get searchSkills => '스킬 검색...';

  @override
  String get noSkillsFound => '스킬을 찾을 수 없습니다. 다른 검색어를 시도하세요.';

  @override
  String installedSkill(String name) {
    return '$name 설치됨';
  }

  @override
  String failedToInstallSkill(String name) {
    return '$name 설치 실패';
  }

  @override
  String get addCronJob => '예약된 작업 추가';

  @override
  String get jobName => '작업 이름';

  @override
  String get dailySummaryExample => '예: 일일 요약';

  @override
  String get taskPrompt => '작업 프롬프트';

  @override
  String get whatShouldAgentDo => '에이전트가 무엇을 해야 하나요?';

  @override
  String get interval => '간격';

  @override
  String get every5Minutes => '5분마다';

  @override
  String get every15Minutes => '15분마다';

  @override
  String get every30Minutes => '30분마다';

  @override
  String get everyHour => '매시간';

  @override
  String get every6Hours => '6시간마다';

  @override
  String get every12Hours => '12시간마다';

  @override
  String get every24Hours => '24시간마다';

  @override
  String get add => '추가';

  @override
  String get save => '저장';

  @override
  String get sessions => '세션';

  @override
  String messagesCount(int count) {
    return '$count개의 메시지';
  }

  @override
  String tokensCount(int count) {
    return '$count개의 토큰';
  }

  @override
  String get compact => '압축';

  @override
  String get models => '모델';

  @override
  String get noModelsConfigured => '구성된 모델 없음';

  @override
  String get addModelToStartChatting => '채팅을 시작하려면 모델 추가';

  @override
  String get addModel => '모델 추가';

  @override
  String get default_ => '기본값';

  @override
  String get autoStart => '자동 시작';

  @override
  String get startGatewayWhenLaunches => '앱 시작 시 게이트웨이 시작';

  @override
  String get heartbeat => '하트비트';

  @override
  String get enabled => '활성화됨';

  @override
  String get periodicAgentTasks => 'HEARTBEAT.md의 주기적인 에이전트 작업';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String get about => '정보';

  @override
  String get personalAIAssistantForIOS => 'iOS 및 Android용 개인 AI 비서';

  @override
  String get version => '버전';

  @override
  String get basedOnOpenClaw => 'OpenClaw 기반';

  @override
  String get removeModel => '모델을 제거하시겠습니까?';

  @override
  String removeModelConfirm(String name) {
    return '모델에서 \"$name\"을(를) 제거하시겠습니까?';
  }

  @override
  String get remove => '제거';

  @override
  String get setAsDefault => '기본값으로 설정';

  @override
  String get paste => '붙여넣기';

  @override
  String get chooseProviderStep => '1. 제공자 선택';

  @override
  String get selectModelStep => '2. 모델 선택';

  @override
  String get apiKeyStep => '3. API 키';

  @override
  String getApiKeyAt(String provider) {
    return '$provider에서 API 키 받기';
  }

  @override
  String get justNow => '방금';

  @override
  String minutesAgo(int minutes) {
    return '$minutes분 전';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String daysAgo(int days) {
    return '$days일 전';
  }

  @override
  String get microphonePermissionDenied => '마이크 권한이 거부되었습니다';

  @override
  String liveTranscriptionUnavailable(String error) {
    return '실시간 변환을 사용할 수 없음: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return '녹음 시작 실패: $error';
  }

  @override
  String get usingOnDeviceTranscription => '기기 내 변환 사용 중';

  @override
  String get transcribingWithWhisper => 'Whisper API로 변환 중...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API 실패: $error';
  }

  @override
  String get noTranscriptionCaptured => '변환이 캡처되지 않음';

  @override
  String failedToStopRecording(String error) {
    return '녹음 중지 실패: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return '$action 실패: $error';
  }

  @override
  String get pause => '일시정지';

  @override
  String get resume => '재개';

  @override
  String get send => '보내기';

  @override
  String get liveActivityActive => '라이브 액티비티 활성';

  @override
  String get restartGateway => '게이트웨이 재시작';

  @override
  String modelLabel(String model) {
    return '모델: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return '가동 시간: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: 백그라운드 지원 활성화 - 게이트웨이가 계속 응답할 수 있습니다';

  @override
  String get webChatBuiltIn => '내장 채팅 인터페이스';

  @override
  String get configure => '구성';

  @override
  String get disconnect => '연결 해제';

  @override
  String get agents => '에이전트';

  @override
  String get agentFiles => '에이전트 파일';

  @override
  String get createAgent => '에이전트 만들기';

  @override
  String get editAgent => '에이전트 편집';

  @override
  String get noAgentsYet => '아직 에이전트가 없습니다';

  @override
  String get createYourFirstAgent => '첫 번째 에이전트를 만들어보세요!';

  @override
  String get active => '활성';

  @override
  String get agentName => '에이전트 이름';

  @override
  String get emoji => '이모지';

  @override
  String get selectEmoji => '이모지 선택';

  @override
  String get vibe => '분위기';

  @override
  String get vibeHint => '예: 친근한, 격식체, 비꼬는';

  @override
  String get modelConfiguration => '모델 구성';

  @override
  String get advancedSettings => '고급 설정';

  @override
  String get agentCreated => '에이전트가 생성되었습니다';

  @override
  String get agentUpdated => '에이전트가 업데이트되었습니다';

  @override
  String get agentDeleted => '에이전트가 삭제되었습니다';

  @override
  String switchedToAgent(String name) {
    return '$name(으)로 전환했습니다';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$name을(를) 삭제하시겠습니까? 모든 작업 공간 데이터가 제거됩니다.';
  }

  @override
  String get agentDetails => '에이전트 상세';

  @override
  String get createdAt => '생성일';

  @override
  String get lastUsed => '마지막 사용';

  @override
  String get basicInformation => '기본 정보';

  @override
  String get switchToAgent => '에이전트 전환';

  @override
  String get providers => '제공자';

  @override
  String get addProvider => '제공자 추가';

  @override
  String get noProvidersConfigured => '구성된 제공자가 없습니다.';

  @override
  String get editCredentials => '자격 증명 편집';

  @override
  String get defaultModelHint => '기본 모델은 자체 모델을 지정하지 않는 에이전트에 사용됩니다.';

  @override
  String get holdToSetAsDefault => '길게 눌러 기본값으로 설정';

  @override
  String get integrations => '통합';

  @override
  String get shortcutsIntegrations => '단축어 통합';

  @override
  String get shortcutsIntegrationsDesc => 'iOS 단축어를 설치하여 서드파티 앱 작업 실행';

  @override
  String get dangerZone => '위험 구역';

  @override
  String get resetOnboarding => '초기화 및 온보딩 재실행';

  @override
  String get resetOnboardingDesc => '모든 구성을 삭제하고 설정 마법사로 돌아갑니다.';

  @override
  String get resetAllConfiguration => '모든 구성을 초기화하시겠습니까?';

  @override
  String get resetAllConfigurationDesc =>
      'API 키, 모델 및 모든 설정이 삭제됩니다. 앱이 설정 마법사로 돌아갑니다.\n\n대화 기록은 삭제되지 않습니다.';

  @override
  String get removeProvider => '제공자 제거';

  @override
  String removeProviderConfirm(String provider) {
    return '$provider의 자격 증명을 제거하시겠습니까?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name이(가) 기본 모델로 설정되었습니다';
  }

  @override
  String get photoImage => '사진 / 이미지';

  @override
  String get documentPdfTxt => '문서 (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return '문서를 열 수 없습니다: $error';
  }

  @override
  String get retry => '재시도';

  @override
  String get gatewayStopped => '게이트웨이가 중지되었습니다';

  @override
  String get gatewayStarted => '게이트웨이가 성공적으로 시작되었습니다!';

  @override
  String gatewayFailed(String error) {
    return '게이트웨이 실패: $error';
  }

  @override
  String exceptionError(String error) {
    return '예외: $error';
  }

  @override
  String get pairingRequestApproved => '페어링 요청이 승인되었습니다';

  @override
  String get pairingRequestRejected => '페어링 요청이 거부되었습니다';

  @override
  String get addDevice => '기기 추가';

  @override
  String get telegramConfigSaved => 'Telegram 구성이 저장되었습니다';

  @override
  String get discordConfigSaved => 'Discord 구성이 저장되었습니다';

  @override
  String get securityMethod => '보안 방식';

  @override
  String get pairingRecommended => '페어링 (권장)';

  @override
  String get pairingDescription => '새 사용자에게 페어링 코드가 발급됩니다. 승인 또는 거부할 수 있습니다.';

  @override
  String get allowlistTitle => '허용 목록';

  @override
  String get allowlistDescription => '특정 사용자 ID만 봇에 접근할 수 있습니다.';

  @override
  String get openAccess => '개방';

  @override
  String get openAccessDescription => '누구나 즉시 봇을 사용할 수 있습니다 (권장하지 않음).';

  @override
  String get disabledAccess => '비활성화';

  @override
  String get disabledAccessDescription =>
      'DM이 허용되지 않습니다. 봇이 어떤 메시지에도 응답하지 않습니다.';

  @override
  String get approvedDevices => '승인된 기기';

  @override
  String get noApprovedDevicesYet => '아직 승인된 기기가 없습니다';

  @override
  String get devicesAppearAfterApproval => '페어링 요청을 승인하면 기기가 여기에 표시됩니다';

  @override
  String get noAllowedUsersConfigured => '허용된 사용자가 구성되지 않았습니다';

  @override
  String get addUserIdsHint => '봇 사용을 허용할 사용자 ID를 추가하세요';

  @override
  String get removeDevice => '기기를 제거하시겠습니까?';

  @override
  String removeAccessFor(String name) {
    return '$name의 접근 권한을 제거하시겠습니까?';
  }

  @override
  String get saving => '저장 중...';

  @override
  String get channelsLabel => '채널';

  @override
  String get clawHubAccount => 'ClawHub 계정';

  @override
  String get loggedInToClawHub => '현재 ClawHub에 로그인되어 있습니다.';

  @override
  String get loggedOutFromClawHub => 'ClawHub에서 로그아웃되었습니다';

  @override
  String get login => '로그인';

  @override
  String get logout => '로그아웃';

  @override
  String get connect => '연결';

  @override
  String get pasteClawHubToken => 'ClawHub API 토큰을 붙여넣으세요';

  @override
  String get pleaseEnterApiToken => 'API 토큰을 입력하세요';

  @override
  String get successfullyConnected => 'ClawHub에 성공적으로 연결되었습니다';

  @override
  String get browseSkillsButton => '스킬 둘러보기';

  @override
  String get installSkill => '스킬 설치';

  @override
  String get incompatibleSkill => '호환되지 않는 스킬';

  @override
  String incompatibleSkillDesc(String reason) {
    return '이 스킬은 모바일(iOS/Android)에서 실행할 수 없습니다.\n\n$reason';
  }

  @override
  String get compatibilityWarning => '호환성 경고';

  @override
  String compatibilityWarningDesc(String reason) {
    return '이 스킬은 데스크톱용으로 설계되어 모바일에서 그대로 작동하지 않을 수 있습니다.\n\n$reason\n\n모바일에 최적화된 적응 버전을 설치하시겠습니까?';
  }

  @override
  String get ok => '확인';

  @override
  String get installOriginal => '원본 설치';

  @override
  String get installAdapted => '적응 버전 설치';

  @override
  String get resetSession => '세션 재설정';

  @override
  String resetSessionConfirm(String key) {
    return '세션 \"$key\"을(를) 재설정하시겠습니까? 모든 메시지가 삭제됩니다.';
  }

  @override
  String get sessionReset => '세션이 재설정되었습니다';

  @override
  String get activeSessions => '활성 세션';

  @override
  String get scheduledTasks => '예약된 작업';

  @override
  String get defaultBadge => '기본값';

  @override
  String errorGeneric(String error) {
    return '오류: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName 저장됨';
  }

  @override
  String errorSavingFile(String error) {
    return '파일 저장 오류: $error';
  }

  @override
  String get cannotDeleteLastAgent => '마지막 에이전트는 삭제할 수 없습니다';

  @override
  String get close => '닫기';

  @override
  String get nameIsRequired => '이름은 필수입니다';

  @override
  String get pleaseSelectModel => '모델을 선택하세요';

  @override
  String temperatureLabel(String value) {
    return '온도: $value';
  }

  @override
  String get maxTokens => '최대 토큰';

  @override
  String get maxTokensRequired => '최대 토큰은 필수입니다';

  @override
  String get mustBePositiveNumber => '양수여야 합니다';

  @override
  String get maxToolIterations => '최대 도구 반복 횟수';

  @override
  String get maxIterationsRequired => '최대 반복 횟수는 필수입니다';

  @override
  String get restrictToWorkspace => '작업 공간으로 제한';

  @override
  String get restrictToWorkspaceDesc => '파일 작업을 에이전트 작업 공간으로 제한';

  @override
  String get noModelsConfiguredLong => '에이전트를 만들기 전에 설정에서 모델을 하나 이상 추가하세요.';

  @override
  String get selectProviderFirst => '먼저 제공자를 선택하세요';

  @override
  String get skip => '건너뛰기';

  @override
  String get continueButton => '계속';

  @override
  String get uiAutomation => 'UI 자동화';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw가 대신 화면을 제어할 수 있습니다 — 버튼 탭, 양식 작성, 스크롤, 모든 앱에서의 반복 작업 자동화.';

  @override
  String get uiAutomationAccessibilityNote =>
      '이를 위해 Android 설정에서 접근성 서비스를 활성화해야 합니다. 건너뛰고 나중에 활성화할 수 있습니다.';

  @override
  String get openAccessibilitySettings => '접근성 설정 열기';

  @override
  String get skipForNow => '나중에 하기';

  @override
  String get checkingPermission => '권한 확인 중…';

  @override
  String get accessibilityEnabled => '접근성 서비스가 활성화되었습니다';

  @override
  String get accessibilityNotEnabled => '접근성 서비스가 활성화되지 않았습니다';

  @override
  String get exploreIntegrations => '통합 살펴보기';

  @override
  String get requestTimedOut => '요청 시간 초과';

  @override
  String get myShortcuts => '내 단축어';

  @override
  String get addShortcut => '단축어 추가';

  @override
  String get noShortcutsYet => '아직 단축어가 없습니다';

  @override
  String get shortcutsInstructions =>
      'iOS 단축어 앱에서 단축어를 만들고, 끝에 콜백 작업을 추가한 다음, AI가 실행할 수 있도록 여기에 등록하세요.';

  @override
  String get shortcutName => '단축어 이름';

  @override
  String get shortcutNameHint => '단축어 앱의 정확한 이름';

  @override
  String get descriptionOptional => '설명 (선택 사항)';

  @override
  String get whatDoesShortcutDo => '이 단축어는 무엇을 하나요?';

  @override
  String get callbackSetup => '콜백 설정';

  @override
  String get callbackInstructions =>
      '각 단축어는 다음으로 끝나야 합니다:\n① 키 값 가져오기 → \"callbackUrl\" (단축어 입력을 사전으로 파싱)\n② URL 열기 ← ①의 출력';

  @override
  String get channelApp => '앱';

  @override
  String get channelHeartbeat => '하트비트';

  @override
  String get channelCron => '예약 실행';

  @override
  String get channelSubagent => '하위 에이전트';

  @override
  String get channelSystem => '시스템';

  @override
  String secondsAgo(int seconds) {
    return '$seconds초 전';
  }

  @override
  String get messagesAbbrev => '건';
}
