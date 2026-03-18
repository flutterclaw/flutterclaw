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
  String get powerfulAIModelsDesc => 'OpenAI、Anthropic、Grok和免费模型';

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
  String get iosBackgroundSupportActive =>
      'iOS：后台支持已激活 - 网关可以继续响应';

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
}
