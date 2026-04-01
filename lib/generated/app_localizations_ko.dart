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
  String get voiceCallModelSection => '음성 통화 (Live)';

  @override
  String get voiceCallModelDescription =>
      '통화 버튼을 탭할 때만 사용됩니다. 채팅, 에이전트, 백그라운드 작업은 일반 모델을 사용합니다.';

  @override
  String get voiceCallModelLabel => 'Live 모델';

  @override
  String get voiceCallModelAutomatic => '자동';

  @override
  String get preferLiveVoiceBootstrapTitle => '음성 통화에서 부트스트랩';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      '새로운 빈 채팅에서 BOOTSTRAP.md가 있을 때 (Live가 가능하면) 조용한 텍스트 부트스트랩 대신 음성 통화를 시작합니다.';

  @override
  String get liveVoiceNameLabel => '음성';

  @override
  String get firstHatchModeChoiceTitle => '어떻게 시작할까요?';

  @override
  String get firstHatchModeChoiceBody =>
      '텍스트로 채팅하거나 짧은 통화처럼 음성 대화를 시작할 수 있어요. 편한 방법을 고르세요.';

  @override
  String get firstHatchModeChoiceChatButton => '채팅으로 입력';

  @override
  String get firstHatchModeChoiceVoiceButton => '음성으로 말하기';

  @override
  String get liveVoiceBargeInHint =>
      '어시스턴트가 멈춘 뒤에 말하세요(에코 때문에 말하는 도중에 끊기던 문제가 있었어요).';

  @override
  String get liveVoiceFallbackTitle => '라이브';

  @override
  String get liveVoiceEndConversationTooltip => '통화 종료';

  @override
  String get liveVoiceStatusConnecting => '연결 중…';

  @override
  String get liveVoiceStatusRunning => '실행 중…';

  @override
  String get liveVoiceStatusSpeaking => '말하는 중…';

  @override
  String get liveVoiceStatusListening => '듣는 중…';

  @override
  String get liveVoiceBadge => 'LIVE';

  @override
  String get cannotAddLiveModelAsChat =>
      '이 모델은 음성 통화 전용입니다. 목록에서 채팅 모델을 선택하세요.';

  @override
  String get authBearerTokenLabel => 'Bearer 토큰';

  @override
  String get authAccessKeysLabel => '액세스 키';

  @override
  String authModelsFoundCount(int count) {
    return '모델 $count개 발견';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count개 더 — ID를 직접 입력하세요';
  }

  @override
  String get scanQrBarcodeTitle => 'QR / 바코드 스캔';

  @override
  String get oauthSignInTitle => '로그인';

  @override
  String get browserOverlayDone => '완료';

  @override
  String appInitializationError(String error) {
    return '초기화 오류: $error';
  }

  @override
  String get credentialsScreenTitle => '자격 증명';

  @override
  String get credentialsIntroBody =>
      '공급자마다 여러 API 키를 추가하세요. FlutterClaw가 자동으로 순환하고 한도에 걸린 키는 쿨다운합니다.';

  @override
  String get credentialsNoProvidersBody =>
      '구성된 공급자가 없습니다.\n설정 → 공급자 및 모델에서 추가하세요.';

  @override
  String get credentialsAddKeyTooltip => '키 추가';

  @override
  String get credentialsNoExtraKeysMessage => '추가 키 없음 — 공급자 및 모델의 키를 사용 중입니다.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return '$provider 키 추가';
  }

  @override
  String get credentialsKeyLabelHint => '라벨(예: \"업무용 키\")';

  @override
  String get credentialsApiKeyFieldLabel => 'API 키';

  @override
  String get securitySettingsTitle => '보안';

  @override
  String get securitySettingsIntro => '위험한 작업에 대한 보안 검사를 제어합니다. 현재 세션에 적용됩니다.';

  @override
  String get securitySectionToolExecution => '도구 실행';

  @override
  String get securityPatternDetectionTitle => '보안 패턴 감지';

  @override
  String get securityPatternDetectionSubtitle =>
      '위험한 패턴 차단: 셸 인젝션, 경로 순회, eval/exec, XSS, 역직렬화.';

  @override
  String get securityUnsafeModeBanner =>
      '보안 검사가 꺼져 있습니다. 도구 호출이 검증 없이 실행됩니다. 끝나면 다시 켜세요.';

  @override
  String get securitySectionHowItWorks => '작동 방식';

  @override
  String get securityHowItWorksBlocked =>
      '도구 호출이 위험한 패턴과 일치하면 차단되고 에이전트에게 이유가 전달됩니다.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      '채팅에서 /unsafe로 차단된 호출을 한 번 허용한 뒤 검사가 다시 켜집니다.';

  @override
  String get securityHowItWorksToggleSession =>
      '여기서 \"보안 패턴 감지\"를 끄면 세션 전체에서 검사가 비활성화됩니다.';

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

  @override
  String get modelAlreadyAdded => '이 모델은 이미 목록에 있습니다';

  @override
  String get bothTokensRequired => '두 토큰이 모두 필요합니다';

  @override
  String get slackSavedRestart => 'Slack 저장됨 — 연결하려면 게이트웨이를 재시작하세요';

  @override
  String get slackConfiguration => 'Slack 구성';

  @override
  String get setupTitle => '설정';

  @override
  String get slackSetupInstructions =>
      '1. api.slack.com/apps에서 Slack 앱 생성\n2. Socket Mode 활성화 → 앱 레벨 토큰 (xapp-…) 생성\n   범위: connections:write\n3. 봇 토큰 범위 추가: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. 워크스페이스에 앱 설치 → 봇 토큰 (xoxb-…) 복사';

  @override
  String get botTokenXoxb => '봇 토큰 (xoxb-…)';

  @override
  String get appLevelToken => '앱 레벨 토큰 (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'API URL과 전화번호가 필요합니다';

  @override
  String get signalSavedRestart => 'Signal 저장됨 — 연결하려면 게이트웨이를 재시작하세요';

  @override
  String get signalConfiguration => 'Signal 구성';

  @override
  String get requirementsTitle => '요구사항';

  @override
  String get signalRequirements =>
      '서버에서 실행 중인 signal-cli-rest-api가 필요합니다:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nREST API를 통해 Signal 번호를 등록/연결한 다음 아래에 URL과 전화번호를 입력하세요.';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL 주소';

  @override
  String get signalPhoneNumber => '귀하의 Signal 전화번호';

  @override
  String get userIdLabel => '사용자 ID';

  @override
  String get enterDiscordUserId => 'Discord 사용자 ID 입력';

  @override
  String get enterTelegramUserId => 'Telegram 사용자 ID 입력';

  @override
  String get fromDiscordDevPortal => 'Discord 개발자 포털에서';

  @override
  String get allowedUserIdsTitle => '허용된 사용자 ID';

  @override
  String get approvedDevice => '승인된 기기';

  @override
  String get allowedUser => '허용된 사용자';

  @override
  String get howToGetBotToken => '봇 토큰 받는 방법';

  @override
  String get discordTokenInstructions =>
      '1. Discord 개발자 포털로 이동\n2. 새 애플리케이션 및 봇 생성\n3. 토큰을 복사하여 위에 붙여넣기\n4. Message Content Intent 활성화';

  @override
  String get telegramTokenInstructions =>
      '1. Telegram을 열고 @BotFather 검색\n2. /newbot을 보내고 지침을 따르세요\n3. 토큰을 복사하여 위에 붙여넣기';

  @override
  String get fromBotFatherHint => '@BotFather에서 받기';

  @override
  String get accessTokenLabel => '액세스 토큰';

  @override
  String get notSetOpenAccess => '설정되지 않음 — 개방 액세스(루프백만)';

  @override
  String get gatewayAccessToken => '게이트웨이 액세스 토큰';

  @override
  String get tokenFieldLabel => '토큰';

  @override
  String get leaveEmptyDisableAuth => '인증을 비활성화하려면 비워두세요';

  @override
  String get toolPolicies => '도구 정책';

  @override
  String get toolPoliciesDesc =>
      '에이전트가 액세스할 수 있는 항목을 제어합니다. 비활성화된 도구는 AI에서 숨겨지고 런타임에 차단됩니다.';

  @override
  String get privacySensors => '개인정보 및 센서';

  @override
  String get networkCategory => '네트워크';

  @override
  String get systemCategory => '시스템';

  @override
  String get toolTakePhotos => '사진 촬영';

  @override
  String get toolTakePhotosDesc => '에이전트가 카메라로 사진을 찍을 수 있도록 허용';

  @override
  String get toolRecordVideo => '동영상 녹화';

  @override
  String get toolRecordVideoDesc => '에이전트가 동영상을 녹화할 수 있도록 허용';

  @override
  String get toolLocation => '위치';

  @override
  String get toolLocationDesc => '에이전트가 현재 GPS 위치를 읽을 수 있도록 허용';

  @override
  String get toolHealthData => '건강 데이터';

  @override
  String get toolHealthDataDesc => '에이전트가 건강/피트니스 데이터를 읽을 수 있도록 허용';

  @override
  String get toolContacts => '연락처';

  @override
  String get toolContactsDesc => '에이전트가 연락처를 검색할 수 있도록 허용';

  @override
  String get toolScreenshots => '스크린샷';

  @override
  String get toolScreenshotsDesc => '에이전트가 화면의 스크린샷을 찍을 수 있도록 허용';

  @override
  String get toolWebFetch => 'Web 가져오기';

  @override
  String get toolWebFetchDesc => '에이전트가 URL에서 콘텐츠를 가져올 수 있도록 허용';

  @override
  String get toolWebSearch => 'Web 검색';

  @override
  String get toolWebSearchDesc => '에이전트가 웹을 검색할 수 있도록 허용';

  @override
  String get toolHttpRequests => 'HTTP 요청';

  @override
  String get toolHttpRequestsDesc => '에이전트가 임의의 HTTP 요청을 수행할 수 있도록 허용';

  @override
  String get toolSandboxShell => '샌드박스 셸';

  @override
  String get toolSandboxShellDesc => '에이전트가 샌드박스에서 셸 명령을 실행할 수 있도록 허용';

  @override
  String get toolImageGeneration => '이미지 생성';

  @override
  String get toolImageGenerationDesc => '에이전트가 AI를 통해 이미지를 생성할 수 있도록 허용';

  @override
  String get toolLaunchApps => '앱 실행';

  @override
  String get toolLaunchAppsDesc => '에이전트가 설치된 앱을 열 수 있도록 허용';

  @override
  String get toolLaunchIntents => 'Intent 실행';

  @override
  String get toolLaunchIntentsDesc =>
      '에이전트가 Android Intent(딥 링크, 시스템 화면)를 실행할 수 있도록 허용';

  @override
  String get renameSession => '세션 이름 바꾸기';

  @override
  String get myConversationName => '내 대화 이름';

  @override
  String get renameAction => '이름 바꾸기';

  @override
  String get couldNotTranscribeAudio => '오디오를 변환할 수 없습니다';

  @override
  String get stopRecording => '녹음 중지';

  @override
  String get voiceInput => '음성 입력';

  @override
  String get speakMessage => '읽어주기';

  @override
  String get stopSpeaking => '읽기 중지';

  @override
  String get selectText => '텍스트 선택';

  @override
  String get messageCopied => '메시지가 복사되었습니다';

  @override
  String get copyTooltip => '복사';

  @override
  String get commandsTooltip => '명령';

  @override
  String get providersAndModels => '제공자 및 모델';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 모델 구성됨',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => '자동 시작 활성화됨';

  @override
  String get autoStartOffLabel => '자동 시작 꺼짐';

  @override
  String get allToolsEnabled => '모든 도구 활성화됨';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 도구 비활성화됨',
    );
    return '$_temp0';
  }

  @override
  String appVersionSubtitle(
    String appName,
    String version,
    String buildNumber,
  ) {
    return '$appName v$version ($buildNumber)';
  }

  @override
  String get officialWebsite => '공식 웹사이트';

  @override
  String get noPendingPairingRequests => '대기 중인 페어링 요청 없음';

  @override
  String get pairingRequestsTitle => '페어링 요청';

  @override
  String get gatewayStartingStatus => '게이트웨이 시작 중...';

  @override
  String get gatewayRetryingStatus => '게이트웨이 시작 재시도 중...';

  @override
  String get errorStartingGateway => '게이트웨이 시작 오류';

  @override
  String get runningStatus => '실행 중';

  @override
  String get stoppedStatus => '중지됨';

  @override
  String get notSetUpStatus => '설정되지 않음';

  @override
  String get configuredStatus => '구성됨';

  @override
  String get whatsAppConfigSaved => 'WhatsApp 구성이 저장되었습니다';

  @override
  String get whatsAppDisconnected => 'WhatsApp 연결이 해제되었습니다';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => '적용 중...';

  @override
  String get reconnectWhatsApp => 'WhatsApp 재연결';

  @override
  String get saveSettingsLabel => '설정 저장';

  @override
  String get applySettingsRestart => '설정 적용 및 재시작';

  @override
  String get whatsAppMode => 'WhatsApp 모드';

  @override
  String get myPersonalNumber => '내 개인 번호';

  @override
  String get myPersonalNumberDesc => '자신의 WhatsApp 채팅에 보낸 메시지가 에이전트를 깨웁니다.';

  @override
  String get dedicatedBotAccount => '전용 봇 계정';

  @override
  String get dedicatedBotAccountDesc => '연결된 계정 자체에서 보낸 메시지는 발신 메시지로 무시됩니다.';

  @override
  String get allowedNumbers => '허용된 번호';

  @override
  String get addNumberTitle => '번호 추가';

  @override
  String get phoneNumberJid => '전화번호 / JID';

  @override
  String get noAllowedNumbersConfigured => '허용된 번호가 구성되지 않았습니다';

  @override
  String get devicesAppearAfterPairing => '페어링 요청을 승인하면 기기가 여기에 표시됩니다';

  @override
  String get addPhoneNumbersHint => '봇 사용을 허용할 전화번호를 추가하세요';

  @override
  String get allowedNumber => '허용된 번호';

  @override
  String get howToConnect => '연결 방법';

  @override
  String get whatsAppConnectInstructions =>
      '1. 위의 \"WhatsApp 연결\"을 탭하세요\n2. QR 코드가 나타납니다 — WhatsApp으로 스캔\n   (설정 → 연결된 기기 → 기기 연결)\n3. 연결되면 수신 메시지가 자동으로\n   활성 AI 에이전트로 라우팅됩니다';

  @override
  String get whatsAppPairingDesc => '새 발신자에게 페어링 코드가 부여됩니다. 승인할 수 있습니다.';

  @override
  String get whatsAppAllowlistDesc => '특정 전화번호만 봇에 메시지를 보낼 수 있습니다.';

  @override
  String get whatsAppOpenDesc => '메시지를 보내는 사람은 누구나 봇을 사용할 수 있습니다.';

  @override
  String get whatsAppDisabledDesc => '봇이 수신 메시지에 응답하지 않습니다.';

  @override
  String get sessionExpiredRelink =>
      '세션이 만료되었습니다. 아래의 \"재연결\"을 탭하여 새 QR 코드를 스캔하세요.';

  @override
  String get connectWhatsAppBelow => '아래의 \"WhatsApp 연결\"을 탭하여 계정을 연결하세요.';

  @override
  String get whatsAppAcceptedQr => 'WhatsApp이 QR을 수락했습니다. 링크를 완료하는 중...';

  @override
  String get waitingForWhatsApp => 'WhatsApp이 링크를 완료하기를 기다리는 중...';

  @override
  String get focusedLabel => '집중';

  @override
  String get balancedLabel => '균형';

  @override
  String get creativeLabel => '창의적';

  @override
  String get preciseLabel => '정확';

  @override
  String get expressiveLabel => '표현적';

  @override
  String get browseLabel => '찾아보기';

  @override
  String get apiTokenLabel => 'API 토큰';

  @override
  String get connectToClawHub => 'ClawHub에 연결';

  @override
  String get clawHubLoginHint => 'ClawHub에 로그인하여 프리미엄 스킬에 액세스하고 패키지 설치';

  @override
  String get howToGetApiToken => 'API 토큰을 받는 방법:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. clawhub.ai를 방문하여 GitHub로 로그인\n2. 터미널에서 \"clawhub login\" 실행\n3. 토큰을 복사하여 여기에 붙여넣기';

  @override
  String connectionFailed(String error) {
    return '연결 실패: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count회 실행';
  }

  @override
  String nextRunLabel(String time) {
    return '다음 실행: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return '마지막 오류: $error';
  }

  @override
  String get cronJobHintText => '이 작업이 실행될 때 에이전트에 대한 지침...';

  @override
  String get androidPermissions => 'Android 권한';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw가 대신 화면을 제어할 수 있습니다 — 버튼 탭, 양식 작성, 스크롤, 모든 앱에서의 반복 작업 자동화.';

  @override
  String get twoPermissionsNeeded =>
      '완전한 경험을 위해 두 가지 권한이 필요합니다. 이 단계를 건너뛰고 나중에 설정에서 활성화할 수 있습니다.';

  @override
  String get accessibilityService => '접근성 서비스';

  @override
  String get accessibilityServiceDesc => '탭, 스와이프, 입력 및 화면 콘텐츠 읽기 허용';

  @override
  String get displayOverOtherApps => '다른 앱 위에 표시';

  @override
  String get displayOverOtherAppsDesc => '에이전트가 무엇을 하고 있는지 볼 수 있도록 부동 상태 칩을 표시';

  @override
  String get changeDefaultModel => '기본 모델 변경';

  @override
  String setModelAsDefault(String name) {
    return '$name을(를) 기본 모델로 설정합니다.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '$count개의 에이전트$_temp0도 업데이트';
  }

  @override
  String get startNewSessions => '새 세션 시작';

  @override
  String get currentConversationsArchived => '현재 대화가 보관됩니다';

  @override
  String get applyAction => '적용';

  @override
  String applyModelQuestion(String name) {
    return '$name을(를) 적용하시겠습니까?';
  }

  @override
  String get setAsDefaultModel => '기본 모델로 설정';

  @override
  String get usedByAgentsWithout => '특정 모델이 없는 에이전트에서 사용됨';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '$count개의 에이전트$_temp0에 적용';
  }

  @override
  String get providerAlreadyAuth => '제공자가 이미 인증되었습니다 — API 키가 필요하지 않습니다.';

  @override
  String get selectFromList => '목록에서 선택';

  @override
  String get enterCustomModelId => '사용자 정의 모델 ID 입력';

  @override
  String get removeSkillTitle => '스킬을 제거하시겠습니까?';

  @override
  String get browseClawHubToDiscover => 'ClawHub를 둘러보고 스킬 발견 및 설치';

  @override
  String get addDeviceTooltip => '기기 추가';

  @override
  String get addNumberTooltip => '번호 추가';

  @override
  String get searchSkillsHint => '스킬 검색...';

  @override
  String get loginToClawHub => 'ClawHub에 로그인';

  @override
  String get accountTooltip => '계정';

  @override
  String get editAction => '편집';

  @override
  String get setAsDefaultAction => '기본값으로 설정';

  @override
  String get chooseProviderTitle => '제공자 선택';

  @override
  String get apiKeyTitle => 'API 키';

  @override
  String get slackConfigSaved => 'Slack 저장됨 — 연결하려면 게이트웨이를 재시작하세요';

  @override
  String get signalConfigSaved => 'Signal 저장됨 — 연결하려면 게이트웨이를 재시작하세요';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => '기기 추가';

  @override
  String get skipAction => '건너뛰기';

  @override
  String get mcpServers => 'MCP 서버';

  @override
  String get noMcpServersConfigured => '구성된 MCP 서버가 없습니다';

  @override
  String get mcpServersEmptyHint =>
      'MCP 서버를 추가하여 에이전트가 GitHub, Notion, Slack, 데이터베이스 등의 도구에 액세스할 수 있도록 하세요.';

  @override
  String get addMcpServer => 'MCP 서버 추가';

  @override
  String get editMcpServer => 'MCP 서버 편집';

  @override
  String get removeMcpServer => 'MCP 서버 제거';

  @override
  String removeMcpServerConfirm(String name) {
    return '\"$name\"을(를) 제거하시겠습니까? 해당 도구를 더 이상 사용할 수 없습니다.';
  }

  @override
  String get mcpTransport => '전송 방식';

  @override
  String get testConnection => '연결 테스트';

  @override
  String get mcpServerNameLabel => '서버 이름';

  @override
  String get mcpServerNameHint => '예: GitHub, Notion, 내 DB';

  @override
  String get mcpServerUrlLabel => '서버 URL';

  @override
  String get mcpBearerTokenLabel => 'Bearer 토큰 (선택사항)';

  @override
  String get mcpBearerTokenHint => '인증이 필요 없으면 비워두세요';

  @override
  String get mcpCommandLabel => '명령어';

  @override
  String get mcpArgumentsLabel => '인수 (공백으로 구분)';

  @override
  String get mcpEnvVarsLabel => '환경 변수 (키=값, 한 줄에 하나)';

  @override
  String get mcpStdioNotOnIos => 'stdio는 iOS에서 사용할 수 없습니다. HTTP 또는 SSE를 사용하세요.';

  @override
  String get connectedStatus => '연결됨';

  @override
  String get mcpConnecting => '연결 중...';

  @override
  String get mcpConnectionError => '연결 오류';

  @override
  String get mcpDisconnected => '연결 끊김';

  @override
  String mcpToolsCount(int count) {
    return '도구 $count개';
  }

  @override
  String mcpTestOkTools(int count) {
    return '확인 — $count개의 도구 발견';
  }

  @override
  String get mcpTestOkNoTools => '확인 — 연결됨 (도구 0개)';

  @override
  String get mcpTestFailed => '연결 실패. 서버 URL/토큰을 확인하세요.';

  @override
  String get mcpAddServer => '서버 추가';

  @override
  String get mcpSaveChanges => '변경사항 저장';

  @override
  String get urlIsRequired => 'URL이 필요합니다';

  @override
  String get enterValidUrl => '유효한 URL을 입력하세요';

  @override
  String get commandIsRequired => '명령어가 필요합니다';

  @override
  String skillRemoved(String name) {
    return '스킬 \"$name\"이(가) 제거되었습니다';
  }

  @override
  String get editFileContentHint => '파일 내용 편집...';

  @override
  String get whatsAppPairSubtitle => 'QR 코드로 개인 WhatsApp 계정 연결';

  @override
  String get whatsAppPairingOptional =>
      '연결은 선택사항입니다. 지금 온보딩을 완료하고 나중에 연결할 수 있습니다.';

  @override
  String get whatsAppEnableToLink => 'WhatsApp을 활성화하여 이 기기 연결을 시작하세요.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp이 연결되었습니다. 온보딩 후 FlutterClaw가 응답할 수 있습니다.';

  @override
  String get cancelLink => '연결 취소';
}
