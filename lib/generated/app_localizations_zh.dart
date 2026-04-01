// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => '聊天';

  @override
  String get channels => '频道';

  @override
  String get agent => '代理';

  @override
  String get settings => '设置';

  @override
  String get getStarted => '开始使用';

  @override
  String get yourPersonalAssistant => '您的个人AI助手';

  @override
  String get multiChannelChat => '多频道聊天';

  @override
  String get multiChannelChatDesc => 'Telegram、Discord、WebChat等';

  @override
  String get powerfulAIModels => '强大的AI模型';

  @override
  String get powerfulAIModelsDesc => '强大的AI模型和免费选项';

  @override
  String get localGateway => '本地网关';

  @override
  String get localGatewayDesc => '在您的设备上运行,您的数据属于您';

  @override
  String get chooseProvider => '选择提供商';

  @override
  String get selectProviderDesc => '选择如何连接到AI模型。';

  @override
  String get startForFree => '免费开始';

  @override
  String get freeProvidersDesc => '这些提供商提供免费模型,让您零成本开始。';

  @override
  String get free => '免费';

  @override
  String get otherProviders => '其他提供商';

  @override
  String connectToProvider(String provider) {
    return '连接到$provider';
  }

  @override
  String get enterApiKeyDesc => '输入您的API密钥并选择一个模型。';

  @override
  String get dontHaveApiKey => '没有API密钥?';

  @override
  String get createAccountCopyKey => '创建账户并复制您的密钥。';

  @override
  String get signUp => '注册';

  @override
  String get apiKey => 'API密钥';

  @override
  String get pasteFromClipboard => '从剪贴板粘贴';

  @override
  String get apiBaseUrl => 'API基础URL';

  @override
  String get selectModel => '选择模型';

  @override
  String get modelId => '模型ID';

  @override
  String get validateKey => '验证密钥';

  @override
  String get validating => '验证中...';

  @override
  String get invalidApiKey => '无效的API密钥';

  @override
  String get gatewayConfiguration => '网关配置';

  @override
  String get gatewayConfigDesc => '网关是助手的本地控制平面。';

  @override
  String get defaultSettingsNote => '默认设置适用于大多数用户。仅在您知道需要什么时才更改。';

  @override
  String get host => '主机';

  @override
  String get port => '端口';

  @override
  String get autoStartGateway => '自动启动网关';

  @override
  String get autoStartGatewayDesc => '应用程序启动时自动启动网关。';

  @override
  String get channelsPageTitle => '频道';

  @override
  String get channelsPageDesc => '可选择连接消息频道。您可以稍后在设置中进行配置。';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => '连接Telegram机器人。';

  @override
  String get openBotFather => '打开BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => '连接Discord机器人。';

  @override
  String get developerPortal => '开发者门户';

  @override
  String get botToken => '机器人令牌';

  @override
  String telegramBotToken(String platform) {
    return '$platform机器人令牌';
  }

  @override
  String get readyToGo => '准备就绪';

  @override
  String get reviewConfiguration => '检查您的配置并启动FlutterClaw。';

  @override
  String get model => '模型';

  @override
  String viaProvider(String provider) {
    return '通过$provider';
  }

  @override
  String get gateway => '网关';

  @override
  String get webChatOnly => '仅WebChat(稍后可添加更多)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => '启动中...';

  @override
  String get startFlutterClaw => '启动FlutterClaw';

  @override
  String get newSession => '新会话';

  @override
  String get photoLibrary => '照片库';

  @override
  String get camera => '相机';

  @override
  String get whatDoYouSeeInImage => '您在这张图片中看到了什么?';

  @override
  String get imagePickerNotAvailable => '模拟器上无法使用图片选择器。请使用真实设备。';

  @override
  String get couldNotOpenImagePicker => '无法打开图片选择器。';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get attachImage => '附加图片';

  @override
  String get messageFlutterClaw => '给FlutterClaw发消息...';

  @override
  String get channelsAndGateway => '频道和网关';

  @override
  String get stop => '停止';

  @override
  String get start => '开始';

  @override
  String status(String status) {
    return '状态:$status';
  }

  @override
  String get builtInChatInterface => '内置聊天界面';

  @override
  String get notConfigured => '未配置';

  @override
  String get connected => '已连接';

  @override
  String get configuredStarting => '已配置(启动中...)';

  @override
  String get telegramConfiguration => 'Telegram配置';

  @override
  String get fromBotFather => '来自@BotFather';

  @override
  String get allowedUserIds => '允许的用户ID(用逗号分隔)';

  @override
  String get leaveEmptyToAllowAll => '留空以允许所有人';

  @override
  String get cancel => '取消';

  @override
  String get saveAndConnect => '保存并连接';

  @override
  String get discordConfiguration => 'Discord配置';

  @override
  String get pendingPairingRequests => '待处理的配对请求';

  @override
  String get approve => '批准';

  @override
  String get reject => '拒绝';

  @override
  String get expired => '已过期';

  @override
  String minutesLeft(int minutes) {
    return '剩余$minutes分钟';
  }

  @override
  String get workspaceFiles => '工作区文件';

  @override
  String get personalAIAssistant => '个人AI助手';

  @override
  String sessionsCount(int count) {
    return '会话($count)';
  }

  @override
  String get noActiveSessions => '无活动会话';

  @override
  String get startConversationToCreate => '开始对话以创建会话';

  @override
  String get startConversationToSee => '开始对话以查看会话';

  @override
  String get reset => '重置';

  @override
  String get cronJobs => '计划任务';

  @override
  String get noCronJobs => '无计划任务';

  @override
  String get addScheduledTasks => '为您的代理添加计划任务';

  @override
  String get runNow => '立即运行';

  @override
  String get enable => '启用';

  @override
  String get disable => '禁用';

  @override
  String get delete => '删除';

  @override
  String get skills => '技能';

  @override
  String get browseClawHub => '浏览ClawHub';

  @override
  String get noSkillsInstalled => '未安装技能';

  @override
  String get browseClawHubToAdd => '浏览ClawHub以添加技能';

  @override
  String removeSkillConfirm(String name) {
    return '从您的技能中移除\"$name\"?';
  }

  @override
  String get clawHubSkills => 'ClawHub技能';

  @override
  String get searchSkills => '搜索技能...';

  @override
  String get noSkillsFound => '未找到技能。尝试不同的搜索。';

  @override
  String installedSkill(String name) {
    return '已安装$name';
  }

  @override
  String failedToInstallSkill(String name) {
    return '安装$name失败';
  }

  @override
  String get addCronJob => '添加计划任务';

  @override
  String get jobName => '任务名称';

  @override
  String get dailySummaryExample => '例如:每日摘要';

  @override
  String get taskPrompt => '任务提示';

  @override
  String get whatShouldAgentDo => '代理应该做什么?';

  @override
  String get interval => '间隔';

  @override
  String get every5Minutes => '每5分钟';

  @override
  String get every15Minutes => '每15分钟';

  @override
  String get every30Minutes => '每30分钟';

  @override
  String get everyHour => '每小时';

  @override
  String get every6Hours => '每6小时';

  @override
  String get every12Hours => '每12小时';

  @override
  String get every24Hours => '每24小时';

  @override
  String get add => '添加';

  @override
  String get save => '保存';

  @override
  String get sessions => '会话';

  @override
  String messagesCount(int count) {
    return '$count条消息';
  }

  @override
  String tokensCount(int count) {
    return '$count个令牌';
  }

  @override
  String get compact => '压缩';

  @override
  String get models => '模型';

  @override
  String get noModelsConfigured => '未配置模型';

  @override
  String get addModelToStartChatting => '添加模型以开始聊天';

  @override
  String get addModel => '添加模型';

  @override
  String get default_ => '默认';

  @override
  String get autoStart => '自动启动';

  @override
  String get startGatewayWhenLaunches => '应用程序启动时启动网关';

  @override
  String get heartbeat => '心跳';

  @override
  String get enabled => '已启用';

  @override
  String get periodicAgentTasks => '来自HEARTBEAT.md的定期代理任务';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes分钟';
  }

  @override
  String get about => '关于';

  @override
  String get personalAIAssistantForIOS => 'iOS和Android的个人AI助手';

  @override
  String get version => '版本';

  @override
  String get basedOnOpenClaw => '基于OpenClaw';

  @override
  String get removeModel => '移除模型?';

  @override
  String removeModelConfirm(String name) {
    return '从您的模型中移除\"$name\"?';
  }

  @override
  String get remove => '移除';

  @override
  String get setAsDefault => '设为默认';

  @override
  String get paste => '粘贴';

  @override
  String get chooseProviderStep => '1. 选择提供商';

  @override
  String get selectModelStep => '2. 选择模型';

  @override
  String get apiKeyStep => '3. API密钥';

  @override
  String getApiKeyAt(String provider) {
    return '在$provider获取API密钥';
  }

  @override
  String get justNow => '刚刚';

  @override
  String minutesAgo(int minutes) {
    return '$minutes分钟前';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours小时前';
  }

  @override
  String daysAgo(int days) {
    return '$days天前';
  }

  @override
  String get microphonePermissionDenied => '麦克风权限被拒绝';

  @override
  String liveTranscriptionUnavailable(String error) {
    return '实时转录不可用：$error';
  }

  @override
  String failedToStartRecording(String error) {
    return '无法开始录制：$error';
  }

  @override
  String get usingOnDeviceTranscription => '使用设备转录';

  @override
  String get transcribingWithWhisper => '使用 Whisper API 转录中...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API 失败：$error';
  }

  @override
  String get noTranscriptionCaptured => '未捕获转录';

  @override
  String failedToStopRecording(String error) {
    return '无法停止录制：$error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return '无法$action：$error';
  }

  @override
  String get pause => '暂停';

  @override
  String get resume => '继续';

  @override
  String get send => '发送';

  @override
  String get liveActivityActive => '实时活动已激活';

  @override
  String get restartGateway => '重启网关';

  @override
  String modelLabel(String model) {
    return '模型：$model';
  }

  @override
  String uptimeLabel(String uptime) {
    return '运行时间：$uptime';
  }

  @override
  String get iosBackgroundSupportActive => 'iOS：后台支持已激活 - 网关可以继续响应';

  @override
  String get webChatBuiltIn => '内置聊天界面';

  @override
  String get configure => '配置';

  @override
  String get disconnect => '断开连接';

  @override
  String get agents => '代理';

  @override
  String get agentFiles => '代理文件';

  @override
  String get createAgent => '创建代理';

  @override
  String get editAgent => '编辑代理';

  @override
  String get noAgentsYet => '暂无代理';

  @override
  String get createYourFirstAgent => '创建您的第一个代理！';

  @override
  String get active => '活跃';

  @override
  String get agentName => '代理名称';

  @override
  String get emoji => '表情符号';

  @override
  String get selectEmoji => '选择表情符号';

  @override
  String get vibe => '风格';

  @override
  String get vibeHint => '例如：友好、正式、嘲讽';

  @override
  String get modelConfiguration => '模型配置';

  @override
  String get advancedSettings => '高级设置';

  @override
  String get agentCreated => '代理已创建';

  @override
  String get agentUpdated => '代理已更新';

  @override
  String get agentDeleted => '代理已删除';

  @override
  String switchedToAgent(String name) {
    return '已切换到 $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '删除 $name？这将移除所有工作区数据。';
  }

  @override
  String get agentDetails => '代理详情';

  @override
  String get createdAt => '创建时间';

  @override
  String get lastUsed => '最后使用';

  @override
  String get basicInformation => '基本信息';

  @override
  String get switchToAgent => '切换代理';

  @override
  String get providers => '提供商';

  @override
  String get addProvider => '添加提供商';

  @override
  String get noProvidersConfigured => '未配置提供商。';

  @override
  String get editCredentials => '编辑凭证';

  @override
  String get defaultModelHint => '默认模型用于未指定自身模型的代理。';

  @override
  String get voiceCallModelSection => '语音通话（Live）';

  @override
  String get voiceCallModelDescription => '仅在你点击通话按钮时使用。聊天、代理和后台任务会使用你的常规模型。';

  @override
  String get voiceCallModelLabel => 'Live 模型';

  @override
  String get voiceCallModelAutomatic => '自动';

  @override
  String get preferLiveVoiceBootstrapTitle => '在语音通话中引导';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      '在包含 BOOTSTRAP.md 的全新空聊天中，优先发起语音通话，而不是静默的文本引导（当 Live 可用时）。';

  @override
  String get liveVoiceNameLabel => '语音';

  @override
  String get firstHatchModeChoiceTitle => '你想怎么开始？';

  @override
  String get firstHatchModeChoiceBody =>
      '你可以用文字和助手聊天，或开始语音对话，就像一通简短电话。选你觉得最轻松的方式就好。';

  @override
  String get firstHatchModeChoiceChatButton => '用文字聊天';

  @override
  String get firstHatchModeChoiceVoiceButton => '语音对话';

  @override
  String get liveVoiceBargeInHint => '请在助手说完后再开口（回声会让你在他们说话时打断他们）。';

  @override
  String get liveVoiceFallbackTitle => '直播';

  @override
  String get liveVoiceEndConversationTooltip => '结束通话';

  @override
  String get liveVoiceStatusConnecting => '正在连接…';

  @override
  String get liveVoiceStatusRunning => '运行中…';

  @override
  String get liveVoiceStatusSpeaking => '正在说话…';

  @override
  String get liveVoiceStatusListening => '正在聆听…';

  @override
  String get liveVoiceBadge => '直播';

  @override
  String get cannotAddLiveModelAsChat => '此模型仅用于语音通话。请从列表中选择聊天模型。';

  @override
  String get authBearerTokenLabel => 'Bearer 令牌';

  @override
  String get authAccessKeysLabel => '访问密钥';

  @override
  String authModelsFoundCount(int count) {
    return '找到 $count 个模型';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '另有 $count 个 — 请手动输入 ID';
  }

  @override
  String get scanQrBarcodeTitle => '扫描二维码 / 条码';

  @override
  String get oauthSignInTitle => '登录';

  @override
  String get browserOverlayDone => '完成';

  @override
  String appInitializationError(String error) {
    return '初始化错误：$error';
  }

  @override
  String get credentialsScreenTitle => '凭据';

  @override
  String get credentialsIntroBody =>
      '为每个提供商添加多个 API 密钥。FlutterClaw 会自动轮换，并对触发速率限制的密钥进行冷却。';

  @override
  String get credentialsNoProvidersBody => '尚未配置提供商。\n请前往「设置 → 提供商与模型」添加。';

  @override
  String get credentialsAddKeyTooltip => '添加密钥';

  @override
  String get credentialsNoExtraKeysMessage => '无额外密钥 — 使用「提供商与模型」中的密钥。';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return '添加 $provider 密钥';
  }

  @override
  String get credentialsKeyLabelHint => '标签（例如「工作密钥」）';

  @override
  String get credentialsApiKeyFieldLabel => 'API 密钥';

  @override
  String get securitySettingsTitle => '安全';

  @override
  String get securitySettingsIntro => '控制针对危险操作的安全检查。仅适用于当前会话。';

  @override
  String get securitySectionToolExecution => '工具执行';

  @override
  String get securityPatternDetectionTitle => '安全模式检测';

  @override
  String get securityPatternDetectionSubtitle =>
      '阻止危险模式：shell 注入、路径遍历、eval/exec、XSS、反序列化。';

  @override
  String get securityUnsafeModeBanner => '安全检查已关闭。工具调用将不经验证执行。用完后请重新开启。';

  @override
  String get securitySectionHowItWorks => '工作原理';

  @override
  String get securityHowItWorksBlocked => '当调用匹配危险模式时会被阻止，并告知智能体原因。';

  @override
  String get securityHowItWorksUnsafeCmd =>
      '在聊天中使用 /unsafe 可一次性放行被阻止的调用，随后检查会恢复。';

  @override
  String get securityHowItWorksToggleSession => '在此关闭「安全模式检测」可禁用整个会话的检查。';

  @override
  String get holdToSetAsDefault => '长按设为默认';

  @override
  String get integrations => '集成';

  @override
  String get shortcutsIntegrations => '快捷指令集成';

  @override
  String get shortcutsIntegrationsDesc => '安装iOS快捷指令以运行第三方应用操作';

  @override
  String get dangerZone => '危险区域';

  @override
  String get resetOnboarding => '重置并重新运行引导';

  @override
  String get resetOnboardingDesc => '删除所有配置并返回设置向导。';

  @override
  String get resetAllConfiguration => '重置所有配置？';

  @override
  String get resetAllConfigurationDesc =>
      '这将删除您的API密钥、模型和所有设置。应用将返回设置向导。\n\n您的对话历史不会被删除。';

  @override
  String get removeProvider => '移除提供商';

  @override
  String removeProviderConfirm(String provider) {
    return '移除 $provider 的凭证？';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name 已设为默认模型';
  }

  @override
  String get photoImage => '照片 / 图片';

  @override
  String get documentPdfTxt => '文档 (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return '无法打开文档：$error';
  }

  @override
  String get retry => '重试';

  @override
  String get gatewayStopped => '网关已停止';

  @override
  String get gatewayStarted => '网关启动成功！';

  @override
  String gatewayFailed(String error) {
    return '网关失败：$error';
  }

  @override
  String exceptionError(String error) {
    return '异常：$error';
  }

  @override
  String get pairingRequestApproved => '配对请求已批准';

  @override
  String get pairingRequestRejected => '配对请求已拒绝';

  @override
  String get addDevice => '添加设备';

  @override
  String get telegramConfigSaved => 'Telegram配置已保存';

  @override
  String get discordConfigSaved => 'Discord配置已保存';

  @override
  String get securityMethod => '安全方式';

  @override
  String get pairingRecommended => '配对（推荐）';

  @override
  String get pairingDescription => '新用户获取配对码。您批准或拒绝他们。';

  @override
  String get allowlistTitle => '白名单';

  @override
  String get allowlistDescription => '仅特定用户ID可以访问机器人。';

  @override
  String get openAccess => '开放';

  @override
  String get openAccessDescription => '任何人都可以立即使用机器人（不推荐）。';

  @override
  String get disabledAccess => '禁用';

  @override
  String get disabledAccessDescription => '不允许私信。机器人不会回复任何消息。';

  @override
  String get approvedDevices => '已批准的设备';

  @override
  String get noApprovedDevicesYet => '暂无已批准的设备';

  @override
  String get devicesAppearAfterApproval => '设备将在您批准其配对请求后显示在此处';

  @override
  String get noAllowedUsersConfigured => '未配置允许的用户';

  @override
  String get addUserIdsHint => '添加用户ID以允许他们使用机器人';

  @override
  String get removeDevice => '移除设备？';

  @override
  String removeAccessFor(String name) {
    return '移除 $name 的访问权限？';
  }

  @override
  String get saving => '保存中...';

  @override
  String get channelsLabel => '频道';

  @override
  String get clawHubAccount => 'ClawHub账户';

  @override
  String get loggedInToClawHub => '您当前已登录ClawHub。';

  @override
  String get loggedOutFromClawHub => '已从ClawHub登出';

  @override
  String get login => '登录';

  @override
  String get logout => '登出';

  @override
  String get connect => '连接';

  @override
  String get pasteClawHubToken => '粘贴您的ClawHub API令牌';

  @override
  String get pleaseEnterApiToken => '请输入API令牌';

  @override
  String get successfullyConnected => '已成功连接到ClawHub';

  @override
  String get browseSkillsButton => '浏览技能';

  @override
  String get installSkill => '安装技能';

  @override
  String get incompatibleSkill => '不兼容的技能';

  @override
  String incompatibleSkillDesc(String reason) {
    return '此技能无法在移动端（iOS/Android）运行。\n\n$reason';
  }

  @override
  String get compatibilityWarning => '兼容性警告';

  @override
  String compatibilityWarningDesc(String reason) {
    return '此技能是为桌面端设计的，可能无法在移动端直接使用。\n\n$reason\n\n您想安装针对移动端优化的适配版本吗？';
  }

  @override
  String get ok => '确定';

  @override
  String get installOriginal => '安装原版';

  @override
  String get installAdapted => '安装适配版';

  @override
  String get resetSession => '重置会话';

  @override
  String resetSessionConfirm(String key) {
    return '重置会话\"$key\"？这将清除所有消息。';
  }

  @override
  String get sessionReset => '会话已重置';

  @override
  String get activeSessions => '活动会话';

  @override
  String get scheduledTasks => '计划任务';

  @override
  String get defaultBadge => '默认';

  @override
  String errorGeneric(String error) {
    return '错误：$error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName 已保存';
  }

  @override
  String errorSavingFile(String error) {
    return '保存文件时出错：$error';
  }

  @override
  String get cannotDeleteLastAgent => '无法删除最后一个代理';

  @override
  String get close => '关闭';

  @override
  String get nameIsRequired => '名称是必填项';

  @override
  String get pleaseSelectModel => '请选择模型';

  @override
  String temperatureLabel(String value) {
    return '温度：$value';
  }

  @override
  String get maxTokens => '最大令牌数';

  @override
  String get maxTokensRequired => '最大令牌数是必填项';

  @override
  String get mustBePositiveNumber => '必须是正数';

  @override
  String get maxToolIterations => '最大工具迭代次数';

  @override
  String get maxIterationsRequired => '最大迭代次数是必填项';

  @override
  String get restrictToWorkspace => '限制在工作区内';

  @override
  String get restrictToWorkspaceDesc => '将文件操作限制在代理工作区内';

  @override
  String get noModelsConfiguredLong => '请在创建代理前先在设置中添加至少一个模型。';

  @override
  String get selectProviderFirst => '请先选择提供商';

  @override
  String get skip => '跳过';

  @override
  String get continueButton => '继续';

  @override
  String get uiAutomation => 'UI自动化';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw可以代替您控制屏幕——点击按钮、填写表单、滚动页面，以及自动化任何应用中的重复性任务。';

  @override
  String get uiAutomationAccessibilityNote =>
      '这需要在Android设置中启用无障碍服务。您可以跳过此步骤，稍后启用。';

  @override
  String get openAccessibilitySettings => '打开无障碍设置';

  @override
  String get skipForNow => '暂时跳过';

  @override
  String get checkingPermission => '正在检查权限…';

  @override
  String get accessibilityEnabled => '无障碍服务已启用';

  @override
  String get accessibilityNotEnabled => '无障碍服务未启用';

  @override
  String get exploreIntegrations => '探索集成';

  @override
  String get requestTimedOut => '请求超时';

  @override
  String get myShortcuts => '我的快捷指令';

  @override
  String get addShortcut => '添加快捷指令';

  @override
  String get noShortcutsYet => '暂无快捷指令';

  @override
  String get shortcutsInstructions =>
      '在iOS快捷指令应用中创建快捷指令，在末尾添加回调操作，然后在此注册以便AI可以运行它。';

  @override
  String get shortcutName => '快捷指令名称';

  @override
  String get shortcutNameHint => '快捷指令应用中的确切名称';

  @override
  String get descriptionOptional => '描述（可选）';

  @override
  String get whatDoesShortcutDo => '这个快捷指令做什么？';

  @override
  String get callbackSetup => '回调设置';

  @override
  String get callbackInstructions =>
      '每个快捷指令必须以以下步骤结尾：\n① 获取键的值 → \"callbackUrl\"（从快捷指令输入解析为字典）\n② 打开URL ← ①的输出';

  @override
  String get channelApp => '应用';

  @override
  String get channelHeartbeat => '心跳';

  @override
  String get channelCron => '定时任务';

  @override
  String get channelSubagent => '子代理';

  @override
  String get channelSystem => '系统';

  @override
  String secondsAgo(int seconds) {
    return '$seconds秒前';
  }

  @override
  String get messagesAbbrev => '条消息';

  @override
  String get modelAlreadyAdded => '此模型已在您的列表中';

  @override
  String get bothTokensRequired => '两个令牌都是必需的';

  @override
  String get slackSavedRestart => 'Slack已保存 — 重启网关以连接';

  @override
  String get slackConfiguration => 'Slack配置';

  @override
  String get setupTitle => '设置';

  @override
  String get slackSetupInstructions =>
      '1. 在 api.slack.com/apps 创建 Slack 应用\n2. 启用 Socket Mode → 生成应用级 Token（xapp-…）\n   作用域：connections:write\n3. 添加机器人 Token 作用域：chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. 将应用安装到工作区 → 复制机器人 Token（xoxb-…）';

  @override
  String get botTokenXoxb => '机器人 Token（xoxb-…）';

  @override
  String get appLevelToken => '应用级 Token（xapp-…）';

  @override
  String get apiUrlPhoneRequired => '需要API URL和电话号码';

  @override
  String get signalSavedRestart => 'Signal已保存 — 重启网关以连接';

  @override
  String get signalConfiguration => 'Signal配置';

  @override
  String get requirementsTitle => '要求';

  @override
  String get signalRequirements =>
      '需要在服务器上运行signal-cli-rest-api：\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\n通过REST API注册/链接您的Signal号码，然后在下方输入URL和电话号码。';

  @override
  String get signalApiUrl => 'signal-cli-rest-api 的 URL';

  @override
  String get signalPhoneNumber => '您的Signal电话号码';

  @override
  String get userIdLabel => '用户ID';

  @override
  String get enterDiscordUserId => '输入Discord用户ID';

  @override
  String get enterTelegramUserId => '输入Telegram用户ID';

  @override
  String get fromDiscordDevPortal => '来自Discord开发者门户';

  @override
  String get allowedUserIdsTitle => '允许的用户ID';

  @override
  String get approvedDevice => '已批准的设备';

  @override
  String get allowedUser => '允许的用户';

  @override
  String get howToGetBotToken => '如何获取机器人令牌';

  @override
  String get discordTokenInstructions =>
      '1. 前往Discord开发者门户\n2. 创建新的应用程序和机器人\n3. 复制令牌并粘贴到上方\n4. 启用Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. 打开Telegram并搜索@BotFather\n2. 发送/newbot并按照说明操作\n3. 复制令牌并粘贴到上方';

  @override
  String get fromBotFatherHint => '从@BotFather获取';

  @override
  String get accessTokenLabel => '访问令牌';

  @override
  String get notSetOpenAccess => '未设置 — 开放访问（仅环回）';

  @override
  String get gatewayAccessToken => '网关访问令牌';

  @override
  String get tokenFieldLabel => '令牌';

  @override
  String get leaveEmptyDisableAuth => '留空以禁用身份验证';

  @override
  String get toolPolicies => '工具策略';

  @override
  String get toolPoliciesDesc => '控制代理可以访问的内容。禁用的工具会从AI中隐藏并在运行时被阻止。';

  @override
  String get privacySensors => '隐私和传感器';

  @override
  String get networkCategory => '网络';

  @override
  String get systemCategory => '系统';

  @override
  String get toolTakePhotos => '拍照';

  @override
  String get toolTakePhotosDesc => '允许代理使用相机拍照';

  @override
  String get toolRecordVideo => '录制视频';

  @override
  String get toolRecordVideoDesc => '允许代理录制视频';

  @override
  String get toolLocation => '位置';

  @override
  String get toolLocationDesc => '允许代理读取您当前的GPS位置';

  @override
  String get toolHealthData => '健康数据';

  @override
  String get toolHealthDataDesc => '允许代理读取健康/健身数据';

  @override
  String get toolContacts => '通讯录';

  @override
  String get toolContactsDesc => '允许代理搜索您的通讯录';

  @override
  String get toolScreenshots => '截图';

  @override
  String get toolScreenshotsDesc => '允许代理截取屏幕截图';

  @override
  String get toolWebFetch => 'Web获取';

  @override
  String get toolWebFetchDesc => '允许代理从URL获取内容';

  @override
  String get toolWebSearch => 'Web搜索';

  @override
  String get toolWebSearchDesc => '允许代理搜索Web';

  @override
  String get toolHttpRequests => 'HTTP请求';

  @override
  String get toolHttpRequestsDesc => '允许代理执行任意HTTP请求';

  @override
  String get toolSandboxShell => '沙盒Shell';

  @override
  String get toolSandboxShellDesc => '允许代理在沙盒中运行Shell命令';

  @override
  String get toolImageGeneration => '图像生成';

  @override
  String get toolImageGenerationDesc => '允许代理通过AI生成图像';

  @override
  String get toolLaunchApps => '启动应用';

  @override
  String get toolLaunchAppsDesc => '允许代理打开已安装的应用';

  @override
  String get toolLaunchIntents => '启动Intent';

  @override
  String get toolLaunchIntentsDesc => '允许代理触发Android Intent（深层链接、系统屏幕）';

  @override
  String get renameSession => '重命名会话';

  @override
  String get myConversationName => '我的对话名称';

  @override
  String get renameAction => '重命名';

  @override
  String get couldNotTranscribeAudio => '无法转录音频';

  @override
  String get stopRecording => '停止录制';

  @override
  String get voiceInput => '语音输入';

  @override
  String get speakMessage => '朗读';

  @override
  String get stopSpeaking => '停止朗读';

  @override
  String get selectText => '选择文本';

  @override
  String get messageCopied => '消息已复制';

  @override
  String get copyTooltip => '复制';

  @override
  String get commandsTooltip => '命令';

  @override
  String get providersAndModels => '提供商和模型';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个模型已配置',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => '自动启动已启用';

  @override
  String get autoStartOffLabel => '自动启动已关闭';

  @override
  String get allToolsEnabled => '所有工具已启用';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个工具已禁用',
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
  String get officialWebsite => '官方网站';

  @override
  String get noPendingPairingRequests => '无待处理的配对请求';

  @override
  String get pairingRequestsTitle => '配对请求';

  @override
  String get gatewayStartingStatus => '正在启动网关...';

  @override
  String get gatewayRetryingStatus => '正在重试启动网关...';

  @override
  String get errorStartingGateway => '启动网关时出错';

  @override
  String get runningStatus => '运行中';

  @override
  String get stoppedStatus => '已停止';

  @override
  String get notSetUpStatus => '未设置';

  @override
  String get configuredStatus => '已配置';

  @override
  String get whatsAppConfigSaved => 'WhatsApp配置已保存';

  @override
  String get whatsAppDisconnected => 'WhatsApp已断开连接';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => '应用中...';

  @override
  String get reconnectWhatsApp => '重新连接WhatsApp';

  @override
  String get saveSettingsLabel => '保存设置';

  @override
  String get applySettingsRestart => '应用设置并重启';

  @override
  String get whatsAppMode => 'WhatsApp模式';

  @override
  String get myPersonalNumber => '我的个人号码';

  @override
  String get myPersonalNumberDesc => '您发送到自己的WhatsApp聊天的消息会唤醒代理。';

  @override
  String get dedicatedBotAccount => '专用机器人账户';

  @override
  String get dedicatedBotAccountDesc => '从链接账户本身发送的消息将作为出站消息被忽略。';

  @override
  String get allowedNumbers => '允许的号码';

  @override
  String get addNumberTitle => '添加号码';

  @override
  String get phoneNumberJid => '电话号码 / JID';

  @override
  String get noAllowedNumbersConfigured => '未配置允许的号码';

  @override
  String get devicesAppearAfterPairing => '设备将在您批准其配对请求后显示在此处';

  @override
  String get addPhoneNumbersHint => '添加电话号码以允许他们使用机器人';

  @override
  String get allowedNumber => '允许的号码';

  @override
  String get howToConnect => '如何连接';

  @override
  String get whatsAppConnectInstructions =>
      '1. 点击上方的\"连接WhatsApp\"\n2. 将出现二维码 — 用WhatsApp扫描\n   （设置 → 已链接的设备 → 链接设备）\n3. 连接后，传入消息会自动路由\n   到您的活动AI代理';

  @override
  String get whatsAppPairingDesc => '新发送者获得配对码。您可以批准他们。';

  @override
  String get whatsAppAllowlistDesc => '只有特定电话号码可以向机器人发送消息。';

  @override
  String get whatsAppOpenDesc => '向您发送消息的任何人都可以使用机器人。';

  @override
  String get whatsAppDisabledDesc => '机器人不会响应任何传入消息。';

  @override
  String get sessionExpiredRelink => '会话已过期。点击下方的\"重新连接\"扫描新的二维码。';

  @override
  String get connectWhatsAppBelow => '点击下方的\"连接WhatsApp\"链接您的账户。';

  @override
  String get whatsAppAcceptedQr => 'WhatsApp已接受二维码。正在完成链接...';

  @override
  String get waitingForWhatsApp => '等待WhatsApp完成链接...';

  @override
  String get focusedLabel => '专注';

  @override
  String get balancedLabel => '平衡';

  @override
  String get creativeLabel => '创造性';

  @override
  String get preciseLabel => '精确';

  @override
  String get expressiveLabel => '表现力';

  @override
  String get browseLabel => '浏览';

  @override
  String get apiTokenLabel => 'API令牌';

  @override
  String get connectToClawHub => '连接到ClawHub';

  @override
  String get clawHubLoginHint => '登录ClawHub以访问高级技能并安装包';

  @override
  String get howToGetApiToken => '如何获取API令牌：';

  @override
  String get clawHubApiTokenInstructions =>
      '1. 访问clawhub.ai并使用GitHub登录\n2. 在终端中运行\"clawhub login\"\n3. 复制您的令牌并粘贴到这里';

  @override
  String connectionFailed(String error) {
    return '连接失败：$error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count次运行';
  }

  @override
  String nextRunLabel(String time) {
    return '下次运行：$time';
  }

  @override
  String lastErrorLabel(String error) {
    return '最后一个错误：$error';
  }

  @override
  String get cronJobHintText => '此作业触发时对代理的指令...';

  @override
  String get androidPermissions => 'Android权限';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw可以代替您控制屏幕——点击按钮、填写表单、滚动页面，以及自动化任何应用中的重复性任务。';

  @override
  String get twoPermissionsNeeded => '完整体验需要两个权限。您可以跳过此步骤，稍后在设置中启用。';

  @override
  String get accessibilityService => '无障碍服务';

  @override
  String get accessibilityServiceDesc => '允许点击、滑动、输入和读取屏幕内容';

  @override
  String get displayOverOtherApps => '在其他应用上层显示';

  @override
  String get displayOverOtherAppsDesc => '显示浮动状态芯片，以便您可以看到代理正在做什么';

  @override
  String get changeDefaultModel => '更改默认模型';

  @override
  String setModelAsDefault(String name) {
    return '将$name设为默认模型。';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '同时更新$count个代理$_temp0';
  }

  @override
  String get startNewSessions => '开始新会话';

  @override
  String get currentConversationsArchived => '当前对话将被存档';

  @override
  String get applyAction => '应用';

  @override
  String applyModelQuestion(String name) {
    return '应用$name？';
  }

  @override
  String get setAsDefaultModel => '设为默认模型';

  @override
  String get usedByAgentsWithout => '由没有特定模型的代理使用';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '应用于$count个代理$_temp0';
  }

  @override
  String get providerAlreadyAuth => '提供商已经过身份验证 — 无需API密钥。';

  @override
  String get selectFromList => '从列表中选择';

  @override
  String get enterCustomModelId => '输入自定义模型ID';

  @override
  String get removeSkillTitle => '删除技能？';

  @override
  String get browseClawHubToDiscover => '浏览ClawHub以发现和安装技能';

  @override
  String get addDeviceTooltip => '添加设备';

  @override
  String get addNumberTooltip => '添加号码';

  @override
  String get searchSkillsHint => '搜索技能...';

  @override
  String get loginToClawHub => '登录ClawHub';

  @override
  String get accountTooltip => '账户';

  @override
  String get editAction => '编辑';

  @override
  String get setAsDefaultAction => '设为默认';

  @override
  String get chooseProviderTitle => '选择提供商';

  @override
  String get apiKeyTitle => 'API密钥';

  @override
  String get slackConfigSaved => 'Slack已保存 — 重启网关以连接';

  @override
  String get signalConfigSaved => 'Signal已保存 — 重启网关以连接';

  @override
  String idPrefix(String id) {
    return 'ID：$id';
  }

  @override
  String get addDeviceHint => '添加设备';

  @override
  String get skipAction => '跳过';

  @override
  String get mcpServers => 'MCP 服务器';

  @override
  String get noMcpServersConfigured => '未配置 MCP 服务器';

  @override
  String get mcpServersEmptyHint =>
      '添加 MCP 服务器，让您的代理访问 GitHub、Notion、Slack、数据库等工具。';

  @override
  String get addMcpServer => '添加 MCP 服务器';

  @override
  String get editMcpServer => '编辑 MCP 服务器';

  @override
  String get removeMcpServer => '删除 MCP 服务器';

  @override
  String removeMcpServerConfirm(String name) {
    return '删除\"$name\"？其工具将不再可用。';
  }

  @override
  String get mcpTransport => '传输方式';

  @override
  String get testConnection => '测试连接';

  @override
  String get mcpServerNameLabel => '服务器名称';

  @override
  String get mcpServerNameHint => '如 GitHub、Notion、我的数据库';

  @override
  String get mcpServerUrlLabel => '服务器 URL';

  @override
  String get mcpBearerTokenLabel => 'Bearer 令牌（可选）';

  @override
  String get mcpBearerTokenHint => '不需要认证时留空';

  @override
  String get mcpCommandLabel => '命令';

  @override
  String get mcpArgumentsLabel => '参数（空格分隔）';

  @override
  String get mcpEnvVarsLabel => '环境变量（键=值，每行一个）';

  @override
  String get mcpStdioNotOnIos => 'stdio 在 iOS 上不可用，请使用 HTTP 或 SSE。';

  @override
  String get connectedStatus => '已连接';

  @override
  String get mcpConnecting => '连接中...';

  @override
  String get mcpConnectionError => '连接错误';

  @override
  String get mcpDisconnected => '已断开';

  @override
  String mcpToolsCount(int count) {
    return '$count 个工具';
  }

  @override
  String mcpTestOkTools(int count) {
    return '成功 — 发现 $count 个工具';
  }

  @override
  String get mcpTestOkNoTools => '成功 — 已连接（0 个工具）';

  @override
  String get mcpTestFailed => '连接失败，请检查服务器 URL/令牌。';

  @override
  String get mcpAddServer => '添加服务器';

  @override
  String get mcpSaveChanges => '保存更改';

  @override
  String get urlIsRequired => 'URL 为必填项';

  @override
  String get enterValidUrl => '请输入有效的 URL';

  @override
  String get commandIsRequired => '命令为必填项';

  @override
  String skillRemoved(String name) {
    return '技能\"$name\"已删除';
  }

  @override
  String get editFileContentHint => '编辑文件内容...';

  @override
  String get whatsAppPairSubtitle => '使用二维码绑定您的个人 WhatsApp 账号';

  @override
  String get whatsAppPairingOptional => '绑定是可选的，您可以现在完成初始设置，稍后再完成绑定。';

  @override
  String get whatsAppEnableToLink => '启用 WhatsApp 以开始绑定此设备。';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp 已绑定。初始设置完成后 FlutterClaw 即可响应。';

  @override
  String get cancelLink => '取消绑定';
}
