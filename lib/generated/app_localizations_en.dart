// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Channels';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Settings';

  @override
  String get getStarted => 'Get Started';

  @override
  String get yourPersonalAssistant => 'Your personal AI assistant';

  @override
  String get multiChannelChat => 'Multi-channel chat';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, Chat and more';

  @override
  String get powerfulAIModels => 'Powerful AI models';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok, and free models';

  @override
  String get localGateway => 'Local gateway';

  @override
  String get localGatewayDesc => 'Runs on your device, your data stays yours';

  @override
  String get chooseProvider => 'Choose a Provider';

  @override
  String get selectProviderDesc =>
      'Select how you want to connect to AI models.';

  @override
  String get startForFree => 'Start for Free';

  @override
  String get freeProvidersDesc =>
      'These providers offer free models to get you started with no cost.';

  @override
  String get free => 'FREE';

  @override
  String get otherProviders => 'Other Providers';

  @override
  String connectToProvider(String provider) {
    return 'Connect to $provider';
  }

  @override
  String get enterApiKeyDesc => 'Enter your API key and select a model.';

  @override
  String get dontHaveApiKey => 'Don\'t have an API key?';

  @override
  String get createAccountCopyKey => 'Create an account and copy your key.';

  @override
  String get signUp => 'Sign up';

  @override
  String get apiKey => 'API Key';

  @override
  String get pasteFromClipboard => 'Paste from clipboard';

  @override
  String get apiBaseUrl => 'API Base URL';

  @override
  String get selectModel => 'Select Model';

  @override
  String get modelId => 'Model ID';

  @override
  String get validateKey => 'Validate Key';

  @override
  String get validating => 'Validating...';

  @override
  String get invalidApiKey => 'Invalid API key';

  @override
  String get gatewayConfiguration => 'Gateway Configuration';

  @override
  String get gatewayConfigDesc =>
      'The gateway is the local control plane for your assistant.';

  @override
  String get defaultSettingsNote =>
      'The default settings work for most users. Only change these if you know what you need.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Auto-start gateway';

  @override
  String get autoStartGatewayDesc =>
      'Start the gateway automatically when the app launches.';

  @override
  String get channelsPageTitle => 'Channels';

  @override
  String get channelsPageDesc =>
      'Optionally connect messaging channels. You can always set these up later in Settings.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Connect a Telegram bot.';

  @override
  String get openBotFather => 'Open BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Connect a Discord bot.';

  @override
  String get developerPortal => 'Developer Portal';

  @override
  String get botToken => 'Bot Token';

  @override
  String telegramBotToken(String platform) {
    return '$platform Bot Token';
  }

  @override
  String get readyToGo => 'Ready to Go';

  @override
  String get reviewConfiguration =>
      'Review your configuration and start FlutterClaw.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return 'via $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Chat only (you can add more later)';

  @override
  String get webChat => 'Chat';

  @override
  String get starting => 'Starting...';

  @override
  String get startFlutterClaw => 'Start FlutterClaw';

  @override
  String get newSession => 'New session';

  @override
  String get photoLibrary => 'Photo Library';

  @override
  String get camera => 'Camera';

  @override
  String get whatDoYouSeeInImage => 'What do you see in this image?';

  @override
  String get imagePickerNotAvailable =>
      'Image picker not available on Simulator. Use a real device.';

  @override
  String get couldNotOpenImagePicker => 'Could not open image picker.';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get attachImage => 'Attach image';

  @override
  String get messageFlutterClaw => 'Message FlutterClaw...';

  @override
  String get channelsAndGateway => 'Channels & Gateway';

  @override
  String get stop => 'Stop';

  @override
  String get start => 'Start';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Built-in chat interface';

  @override
  String get notConfigured => 'Not configured';

  @override
  String get connected => 'Connected';

  @override
  String get configuredStarting => 'Configured (starting...)';

  @override
  String get telegramConfiguration => 'Telegram Configuration';

  @override
  String get fromBotFather => 'From @BotFather';

  @override
  String get allowedUserIds => 'Allowed User IDs (comma separated)';

  @override
  String get leaveEmptyToAllowAll => 'Leave empty to allow all';

  @override
  String get cancel => 'Cancel';

  @override
  String get saveAndConnect => 'Save & Connect';

  @override
  String get discordConfiguration => 'Discord Configuration';

  @override
  String get pendingPairingRequests => 'Pending Pairing Requests';

  @override
  String get approve => 'Approve';

  @override
  String get reject => 'Reject';

  @override
  String get expired => 'Expired';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m left';
  }

  @override
  String get workspaceFiles => 'Workspace Files';

  @override
  String get personalAIAssistant => 'Personal AI Assistant';

  @override
  String sessionsCount(int count) {
    return 'Sessions ($count)';
  }

  @override
  String get noActiveSessions => 'No active sessions';

  @override
  String get startConversationToCreate => 'Start a conversation to create one';

  @override
  String get startConversationToSee =>
      'Start a conversation to see sessions here';

  @override
  String get reset => 'Reset';

  @override
  String get cronJobs => 'Cron Jobs';

  @override
  String get noCronJobs => 'No cron jobs';

  @override
  String get addScheduledTasks => 'Add scheduled tasks for your agent';

  @override
  String get runNow => 'Run Now';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get delete => 'Delete';

  @override
  String get skills => 'Skills';

  @override
  String get browseClawHub => 'Browse ClawHub';

  @override
  String get noSkillsInstalled => 'No skills installed';

  @override
  String get browseClawHubToAdd => 'Browse ClawHub to add skills';

  @override
  String removeSkillConfirm(String name) {
    return 'Remove \"$name\" from your skills?';
  }

  @override
  String get clawHubSkills => 'ClawHub Skills';

  @override
  String get searchSkills => 'Search skills...';

  @override
  String get noSkillsFound => 'No skills found. Try a different search.';

  @override
  String installedSkill(String name) {
    return 'Installed $name';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Failed to install $name';
  }

  @override
  String get addCronJob => 'Add Cron Job';

  @override
  String get jobName => 'Job Name';

  @override
  String get dailySummaryExample => 'e.g. Daily Summary';

  @override
  String get taskPrompt => 'Task Prompt';

  @override
  String get whatShouldAgentDo => 'What should the agent do?';

  @override
  String get interval => 'Interval';

  @override
  String get every5Minutes => 'Every 5 minutes';

  @override
  String get every15Minutes => 'Every 15 minutes';

  @override
  String get every30Minutes => 'Every 30 minutes';

  @override
  String get everyHour => 'Every hour';

  @override
  String get every6Hours => 'Every 6 hours';

  @override
  String get every12Hours => 'Every 12 hours';

  @override
  String get every24Hours => 'Every 24 hours';

  @override
  String get add => 'Add';

  @override
  String get save => 'Save';

  @override
  String get sessions => 'Sessions';

  @override
  String messagesCount(int count) {
    return '$count messages';
  }

  @override
  String tokensCount(int count) {
    return '$count tokens';
  }

  @override
  String get compact => 'Compact';

  @override
  String get models => 'Models';

  @override
  String get noModelsConfigured => 'No models configured';

  @override
  String get addModelToStartChatting => 'Add a model to start chatting';

  @override
  String get addModel => 'Add Model';

  @override
  String get default_ => 'DEFAULT';

  @override
  String get autoStart => 'Auto-start';

  @override
  String get startGatewayWhenLaunches => 'Start gateway when app launches';

  @override
  String get heartbeat => 'Heartbeat';

  @override
  String get enabled => 'Enabled';

  @override
  String get periodicAgentTasks => 'Periodic agent tasks from HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'About';

  @override
  String get personalAIAssistantForIOS =>
      'Personal AI Assistant for iOS & Android';

  @override
  String get version => 'Version';

  @override
  String get basedOnOpenClaw => 'Based on OpenClaw';

  @override
  String get removeModel => 'Remove model?';

  @override
  String removeModelConfirm(String name) {
    return 'Remove \"$name\" from your models?';
  }

  @override
  String get remove => 'Remove';

  @override
  String get setAsDefault => 'Set as Default';

  @override
  String get paste => 'Paste';

  @override
  String get chooseProviderStep => '1. Choose Provider';

  @override
  String get selectModelStep => '2. Select Model';

  @override
  String get apiKeyStep => '3. API Key';

  @override
  String getApiKeyAt(String provider) {
    return 'Get API key at $provider';
  }

  @override
  String get justNow => 'just now';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String daysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String get microphonePermissionDenied => 'Microphone permission denied';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Live transcription unavailable: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Failed to start recording: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Using on-device transcription';

  @override
  String get transcribingWithWhisper => 'Transcribing with Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API failed: $error';
  }

  @override
  String get noTranscriptionCaptured => 'No transcription captured';

  @override
  String failedToStopRecording(String error) {
    return 'Failed to stop recording: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Failed to $action: $error';
  }

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get send => 'Send';

  @override
  String get liveActivityActive => 'Live Activity active';

  @override
  String get restartGateway => 'Restart Gateway';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Uptime: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Background support enabled - gateway can continue responding';

  @override
  String get webChatBuiltIn => 'Built-in chat interface';

  @override
  String get configure => 'Configure';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get agents => 'Agents';

  @override
  String get agentFiles => 'Agent Files';

  @override
  String get createAgent => 'Create Agent';

  @override
  String get editAgent => 'Edit Agent';

  @override
  String get noAgentsYet => 'No agents yet';

  @override
  String get createYourFirstAgent => 'Create your first agent!';

  @override
  String get active => 'Active';

  @override
  String get agentName => 'Agent Name';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Select Emoji';

  @override
  String get vibe => 'Vibe';

  @override
  String get vibeHint => 'e.g., friendly, formal, snarky';

  @override
  String get modelConfiguration => 'Model Configuration';

  @override
  String get advancedSettings => 'Advanced Settings';

  @override
  String get agentCreated => 'Agent created';

  @override
  String get agentUpdated => 'Agent updated';

  @override
  String get agentDeleted => 'Agent deleted';

  @override
  String switchedToAgent(String name) {
    return 'Switched to $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Delete $name? This will remove all workspace data.';
  }

  @override
  String get agentDetails => 'Agent Details';

  @override
  String get createdAt => 'Created';

  @override
  String get lastUsed => 'Last Used';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get switchToAgent => 'Switch Agent';

  @override
  String get providers => 'Providers';

  @override
  String get addProvider => 'Add provider';

  @override
  String get noProvidersConfigured => 'No providers configured.';

  @override
  String get editCredentials => 'Edit credentials';

  @override
  String get defaultModelHint =>
      'The default model is used by agents that don\'t specify their own.';

  @override
  String get voiceCallModelSection => 'Voice call (Live)';

  @override
  String get voiceCallModelDescription =>
      'Used only when you tap the call button. Chat, agents, and background tasks use your normal model.';

  @override
  String get voiceCallModelLabel => 'Live model';

  @override
  String get voiceCallModelAutomatic => 'Automatic';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Bootstrap in voice call';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'On a new empty chat with BOOTSTRAP.md, start a voice call instead of a silent text hatch (when Live is available).';

  @override
  String get liveVoiceNameLabel => 'Voice';

  @override
  String get firstHatchModeChoiceTitle => 'How would you like to get started?';

  @override
  String get firstHatchModeChoiceBody =>
      'You can chat with your assistant in text, or jump into a voice conversation—like a quick call. Pick whatever feels easiest for you.';

  @override
  String get firstHatchModeChoiceChatButton => 'Write in chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Talk with voice';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get liveVoiceFallbackTitle => 'Live';

  @override
  String get liveVoiceEndConversationTooltip => 'End conversation';

  @override
  String get liveVoiceStatusConnecting => 'Connecting…';

  @override
  String get liveVoiceStatusRunning => 'Running…';

  @override
  String get liveVoiceStatusSpeaking => 'Speaking…';

  @override
  String get liveVoiceStatusListening => 'Listening…';

  @override
  String get liveVoiceBadge => 'LIVE';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get authBearerTokenLabel => 'Bearer Token';

  @override
  String get authAccessKeysLabel => 'Access Keys';

  @override
  String authModelsFoundCount(int count) {
    return '$count models found';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count more — enter ID manually';
  }

  @override
  String get scanQrBarcodeTitle => 'Scan QR / Barcode';

  @override
  String get oauthSignInTitle => 'Sign In';

  @override
  String get browserOverlayDone => 'Done';

  @override
  String appInitializationError(String error) {
    return 'Initialization error: $error';
  }

  @override
  String get credentialsScreenTitle => 'Credentials';

  @override
  String get credentialsIntroBody =>
      'Add multiple API keys per provider. FlutterClaw rotates between them automatically, cooling down keys that hit rate limits.';

  @override
  String get credentialsNoProvidersBody =>
      'No providers configured.\nGo to Settings → Providers & Models to add one.';

  @override
  String get credentialsAddKeyTooltip => 'Add key';

  @override
  String get credentialsNoExtraKeysMessage =>
      'No extra keys — using the key from Providers & Models.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'Add $provider key';
  }

  @override
  String get credentialsKeyLabelHint => 'Label (e.g. \"Work key\")';

  @override
  String get credentialsApiKeyFieldLabel => 'API key';

  @override
  String get securitySettingsTitle => 'Security';

  @override
  String get securitySettingsIntro =>
      'Control security checks that protect against dangerous operations. These settings apply to the current session.';

  @override
  String get securitySectionToolExecution => 'TOOL EXECUTION';

  @override
  String get securityPatternDetectionTitle => 'Security pattern detection';

  @override
  String get securityPatternDetectionSubtitle =>
      'Blocks dangerous patterns: shell injection, path traversal, eval/exec, XSS, deserialization.';

  @override
  String get securityUnsafeModeBanner =>
      'Security checks are disabled. All tool calls will execute without safety validation. Re-enable when done.';

  @override
  String get securitySectionHowItWorks => 'HOW IT WORKS';

  @override
  String get securityHowItWorksBlocked =>
      'When a tool call matches a dangerous pattern it is blocked and the agent is told why.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'Use /unsafe in chat for a one-shot override that allows a single blocked call, then re-enables checks.';

  @override
  String get securityHowItWorksToggleSession =>
      'Toggle \"Security pattern detection\" off here to disable checks for the whole session.';

  @override
  String get holdToSetAsDefault => 'Hold to set as default';

  @override
  String get integrations => 'Integrations';

  @override
  String get shortcutsIntegrations => 'Shortcuts Integrations';

  @override
  String get shortcutsIntegrationsDesc =>
      'Install iOS Shortcuts to run third-party app actions';

  @override
  String get dangerZone => 'Danger zone';

  @override
  String get resetOnboarding => 'Reset & re-run onboarding';

  @override
  String get resetOnboardingDesc =>
      'Deletes all configuration and returns to the setup wizard.';

  @override
  String get resetAllConfiguration => 'Reset all configuration?';

  @override
  String get resetAllConfigurationDesc =>
      'This will delete your API keys, models, and all settings. The app will return to the setup wizard.\n\nYour conversation history is not deleted.';

  @override
  String get removeProvider => 'Remove provider';

  @override
  String removeProviderConfirm(String provider) {
    return 'Remove credentials for $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name set as default model';
  }

  @override
  String get photoImage => 'Photo / Image';

  @override
  String get documentPdfTxt => 'Document (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Could not open document: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get gatewayStopped => 'Gateway stopped';

  @override
  String get gatewayStarted => 'Gateway started successfully!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway failed: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Exception: $error';
  }

  @override
  String get pairingRequestApproved => 'Pairing request approved';

  @override
  String get pairingRequestRejected => 'Pairing request rejected';

  @override
  String get addDevice => 'Add Device';

  @override
  String get telegramConfigSaved => 'Telegram configuration saved';

  @override
  String get discordConfigSaved => 'Discord configuration saved';

  @override
  String get securityMethod => 'Security Method';

  @override
  String get pairingRecommended => 'Pairing (Recommended)';

  @override
  String get pairingDescription =>
      'New users get a pairing code. You approve or reject them.';

  @override
  String get allowlistTitle => 'Allowlist';

  @override
  String get allowlistDescription =>
      'Only specific user IDs can access the bot.';

  @override
  String get openAccess => 'Open';

  @override
  String get openAccessDescription =>
      'Anyone can use the bot immediately (not recommended).';

  @override
  String get disabledAccess => 'Disabled';

  @override
  String get disabledAccessDescription =>
      'No DMs allowed. Bot will not respond to any messages.';

  @override
  String get approvedDevices => 'Approved Devices';

  @override
  String get noApprovedDevicesYet => 'No approved devices yet';

  @override
  String get devicesAppearAfterApproval =>
      'Devices will appear here after you approve their pairing requests';

  @override
  String get noAllowedUsersConfigured => 'No allowed users configured';

  @override
  String get addUserIdsHint => 'Add user IDs to allow them to use the bot';

  @override
  String get removeDevice => 'Remove device?';

  @override
  String removeAccessFor(String name) {
    return 'Remove access for $name?';
  }

  @override
  String get saving => 'Saving...';

  @override
  String get channelsLabel => 'Channels';

  @override
  String get clawHubAccount => 'ClawHub Account';

  @override
  String get loggedInToClawHub => 'You are currently logged in to ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Logged out from ClawHub';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get connect => 'Connect';

  @override
  String get pasteClawHubToken => 'Paste your ClawHub API token';

  @override
  String get pleaseEnterApiToken => 'Please enter an API token';

  @override
  String get successfullyConnected => 'Successfully connected to ClawHub';

  @override
  String get browseSkillsButton => 'Browse Skills';

  @override
  String get installSkill => 'Install Skill';

  @override
  String get incompatibleSkill => 'Incompatible Skill';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'This skill cannot run on mobile (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Compatibility Warning';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'This skill was designed for desktop and may not work as-is on mobile.\n\n$reason\n\nWould you like to install an adapted version optimized for mobile?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Install Original';

  @override
  String get installAdapted => 'Install Adapted';

  @override
  String get resetSession => 'Reset Session';

  @override
  String resetSessionConfirm(String key) {
    return 'Reset session \"$key\"? This will clear all messages.';
  }

  @override
  String get sessionReset => 'Session reset';

  @override
  String get activeSessions => 'Active Sessions';

  @override
  String get scheduledTasks => 'Scheduled Tasks';

  @override
  String get defaultBadge => 'Default';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName saved';
  }

  @override
  String errorSavingFile(String error) {
    return 'Error saving file: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Cannot delete the last agent';

  @override
  String get close => 'Close';

  @override
  String get nameIsRequired => 'Name is required';

  @override
  String get pleaseSelectModel => 'Please select a model';

  @override
  String temperatureLabel(String value) {
    return 'Temperature: $value';
  }

  @override
  String get maxTokens => 'Max Tokens';

  @override
  String get maxTokensRequired => 'Max tokens is required';

  @override
  String get mustBePositiveNumber => 'Must be a positive number';

  @override
  String get maxToolIterations => 'Max Tool Iterations';

  @override
  String get maxIterationsRequired => 'Max iterations is required';

  @override
  String get restrictToWorkspace => 'Restrict to Workspace';

  @override
  String get restrictToWorkspaceDesc =>
      'Limit file operations to agent workspace';

  @override
  String get noModelsConfiguredLong =>
      'Please add at least one model in Settings before creating an agent.';

  @override
  String get selectProviderFirst => 'Select a provider first';

  @override
  String get skip => 'Skip';

  @override
  String get continueButton => 'Continue';

  @override
  String get uiAutomation => 'UI Automation';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw can control your screen on your behalf — tapping buttons, filling forms, scrolling, and automating repetitive tasks across any app.';

  @override
  String get uiAutomationAccessibilityNote =>
      'This requires enabling the Accessibility Service in Android Settings. You can skip this and enable it later.';

  @override
  String get openAccessibilitySettings => 'Open Accessibility Settings';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get checkingPermission => 'Checking permission…';

  @override
  String get accessibilityEnabled => 'Accessibility Service is enabled';

  @override
  String get accessibilityNotEnabled => 'Accessibility Service is not enabled';

  @override
  String get exploreIntegrations => 'Explore Integrations';

  @override
  String get requestTimedOut => 'Request timed out';

  @override
  String get myShortcuts => 'My Shortcuts';

  @override
  String get addShortcut => 'Add Shortcut';

  @override
  String get noShortcutsYet => 'No shortcuts yet';

  @override
  String get shortcutsInstructions =>
      'Create a shortcut in the iOS Shortcuts app, add the callback action at the end, then register it here so the AI can run it.';

  @override
  String get shortcutName => 'Shortcut name';

  @override
  String get shortcutNameHint => 'Exact name from the Shortcuts app';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get whatDoesShortcutDo => 'What does this shortcut do?';

  @override
  String get callbackSetup => 'Callback setup';

  @override
  String get callbackInstructions =>
      'Each shortcut must end with:\n① Get Value for Key → \"callbackUrl\" (from Shortcut Input parsed as dict)\n② Open URLs ← output of ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Heartbeat';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagent';

  @override
  String get channelSystem => 'System';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s ago';
  }

  @override
  String get messagesAbbrev => 'msgs';

  @override
  String get modelAlreadyAdded => 'This model is already in your list';

  @override
  String get bothTokensRequired => 'Both tokens are required';

  @override
  String get slackSavedRestart =>
      'Slack saved — restart the gateway to connect';

  @override
  String get slackConfiguration => 'Slack Configuration';

  @override
  String get setupTitle => 'Setup';

  @override
  String get slackSetupInstructions =>
      '1. Create a Slack App at api.slack.com/apps\n2. Enable Socket Mode → generate App-Level Token (xapp-…)\n   with scope: connections:write\n3. Add Bot Token Scopes: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Install app to workspace → copy Bot Token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'API URL and phone number are required';

  @override
  String get signalSavedRestart => 'Signal saved — restart gateway to connect';

  @override
  String get signalConfiguration => 'Signal Configuration';

  @override
  String get requirementsTitle => 'Requirements';

  @override
  String get signalRequirements =>
      'Requires signal-cli-rest-api running on a server:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegister/link your Signal number via the REST API, then enter the URL and your phone number below.';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL';

  @override
  String get signalPhoneNumber => 'Your Signal phone number';

  @override
  String get userIdLabel => 'User ID';

  @override
  String get enterDiscordUserId => 'Enter Discord user ID';

  @override
  String get enterTelegramUserId => 'Enter Telegram user ID';

  @override
  String get fromDiscordDevPortal => 'From Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Allowed User IDs';

  @override
  String get approvedDevice => 'Approved device';

  @override
  String get allowedUser => 'Allowed user';

  @override
  String get howToGetBotToken => 'How to get your bot token';

  @override
  String get discordTokenInstructions =>
      '1. Go to Discord Developer Portal\n2. Create a new application and bot\n3. Copy the token and paste it above\n4. Enable Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Open Telegram and search for @BotFather\n2. Send /newbot and follow the instructions\n3. Copy the token and paste it above';

  @override
  String get fromBotFatherHint => 'Get from @BotFather';

  @override
  String get accessTokenLabel => 'Access token';

  @override
  String get notSetOpenAccess => 'Not set — open access (loopback only)';

  @override
  String get gatewayAccessToken => 'Gateway access token';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth => 'Leave empty to disable auth';

  @override
  String get toolPolicies => 'Tool Policies';

  @override
  String get toolPoliciesDesc =>
      'Control what the agent can access. Disabled tools are hidden from the AI and blocked at runtime.';

  @override
  String get privacySensors => 'Privacy & Sensors';

  @override
  String get networkCategory => 'Network';

  @override
  String get systemCategory => 'System';

  @override
  String get toolTakePhotos => 'Take Photos';

  @override
  String get toolTakePhotosDesc =>
      'Allow the agent to take photos using the camera';

  @override
  String get toolRecordVideo => 'Record Video';

  @override
  String get toolRecordVideoDesc => 'Allow the agent to record video';

  @override
  String get toolLocation => 'Location';

  @override
  String get toolLocationDesc =>
      'Allow the agent to read your current GPS location';

  @override
  String get toolHealthData => 'Health Data';

  @override
  String get toolHealthDataDesc =>
      'Allow the agent to read health/fitness data';

  @override
  String get toolContacts => 'Contacts';

  @override
  String get toolContactsDesc => 'Allow the agent to search your contacts';

  @override
  String get toolScreenshots => 'Screenshots';

  @override
  String get toolScreenshotsDesc =>
      'Allow the agent to take screenshots of the screen';

  @override
  String get toolWebFetch => 'Web Fetch';

  @override
  String get toolWebFetchDesc => 'Allow the agent to fetch content from URLs';

  @override
  String get toolWebSearch => 'Web Search';

  @override
  String get toolWebSearchDesc => 'Allow the agent to search the web';

  @override
  String get toolHttpRequests => 'HTTP Requests';

  @override
  String get toolHttpRequestsDesc =>
      'Allow the agent to make arbitrary HTTP requests';

  @override
  String get toolSandboxShell => 'Sandbox Shell';

  @override
  String get toolSandboxShellDesc =>
      'Allow the agent to run shell commands in the sandbox';

  @override
  String get toolImageGeneration => 'Image Generation';

  @override
  String get toolImageGenerationDesc =>
      'Allow the agent to generate images via AI';

  @override
  String get toolLaunchApps => 'Launch Apps';

  @override
  String get toolLaunchAppsDesc => 'Allow the agent to open installed apps';

  @override
  String get toolLaunchIntents => 'Launch Intents';

  @override
  String get toolLaunchIntentsDesc =>
      'Allow the agent to fire Android intents (deep links, system screens)';

  @override
  String get renameSession => 'Rename session';

  @override
  String get myConversationName => 'My conversation name';

  @override
  String get renameAction => 'Rename';

  @override
  String get couldNotTranscribeAudio => 'Could not transcribe audio';

  @override
  String get stopRecording => 'Stop recording';

  @override
  String get voiceInput => 'Voice input';

  @override
  String get speakMessage => 'Speak';

  @override
  String get stopSpeaking => 'Stop speaking';

  @override
  String get selectText => 'Select Text';

  @override
  String get messageCopied => 'Message copied';

  @override
  String get copyTooltip => 'Copy';

  @override
  String get commandsTooltip => 'Commands';

  @override
  String get providersAndModels => 'Providers & Models';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count models configured',
      one: '1 model configured',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Auto-start enabled';

  @override
  String get autoStartOffLabel => 'Auto-start off';

  @override
  String get allToolsEnabled => 'All tools enabled';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tools disabled',
      one: '1 tool disabled',
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
  String get officialWebsite => 'Official website';

  @override
  String get noPendingPairingRequests => 'No pending pairing requests';

  @override
  String get pairingRequestsTitle => 'Pairing Requests';

  @override
  String get gatewayStartingStatus => 'Starting gateway...';

  @override
  String get gatewayRetryingStatus => 'Retrying gateway start...';

  @override
  String get errorStartingGateway => 'Error starting gateway';

  @override
  String get runningStatus => 'Running';

  @override
  String get stoppedStatus => 'Stopped';

  @override
  String get notSetUpStatus => 'Not set up';

  @override
  String get configuredStatus => 'Configured';

  @override
  String get whatsAppConfigSaved => 'WhatsApp configuration saved';

  @override
  String get whatsAppDisconnected => 'WhatsApp disconnected';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Applying...';

  @override
  String get reconnectWhatsApp => 'Reconnect WhatsApp';

  @override
  String get saveSettingsLabel => 'Save Settings';

  @override
  String get applySettingsRestart => 'Apply Settings & Restart';

  @override
  String get whatsAppMode => 'WhatsApp Mode';

  @override
  String get myPersonalNumber => 'My personal number';

  @override
  String get myPersonalNumberDesc =>
      'Messages you send to your own WhatsApp chat wake the agent.';

  @override
  String get dedicatedBotAccount => 'Dedicated bot account';

  @override
  String get dedicatedBotAccountDesc =>
      'Messages sent from the linked account itself are ignored as outbound.';

  @override
  String get allowedNumbers => 'Allowed Numbers';

  @override
  String get addNumberTitle => 'Add Number';

  @override
  String get phoneNumberJid => 'Phone number / JID';

  @override
  String get noAllowedNumbersConfigured => 'No allowed numbers configured';

  @override
  String get devicesAppearAfterPairing =>
      'Devices appear here after you approve pairing requests';

  @override
  String get addPhoneNumbersHint =>
      'Add phone numbers to allow them to use the bot';

  @override
  String get allowedNumber => 'Allowed number';

  @override
  String get howToConnect => 'How to connect';

  @override
  String get whatsAppConnectInstructions =>
      '1. Tap \"Connect WhatsApp\" above\n2. A QR code will appear — scan it with WhatsApp\n   (Settings → Linked Devices → Link a Device)\n3. Once connected, incoming messages are routed\n   to your active AI agent automatically';

  @override
  String get whatsAppPairingDesc =>
      'New senders get a pairing code. You approve them.';

  @override
  String get whatsAppAllowlistDesc =>
      'Only specific phone numbers can message the bot.';

  @override
  String get whatsAppOpenDesc => 'Anyone who messages you can use the bot.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot will not respond to any incoming messages.';

  @override
  String get sessionExpiredRelink =>
      'Session expired. Tap \"Reconnect\" below to scan a fresh QR code.';

  @override
  String get connectWhatsAppBelow =>
      'Tap \"Connect WhatsApp\" below to link your account.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp accepted the QR. Finalizing the link...';

  @override
  String get waitingForWhatsApp =>
      'Waiting for WhatsApp to complete the link...';

  @override
  String get focusedLabel => 'Focused';

  @override
  String get balancedLabel => 'Balanced';

  @override
  String get creativeLabel => 'Creative';

  @override
  String get preciseLabel => 'Precise';

  @override
  String get expressiveLabel => 'Expressive';

  @override
  String get browseLabel => 'Browse';

  @override
  String get apiTokenLabel => 'API Token';

  @override
  String get connectToClawHub => 'Connect to ClawHub';

  @override
  String get clawHubLoginHint =>
      'Login to ClawHub to access premium skills and install packages';

  @override
  String get howToGetApiToken => 'How to get your API token:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Visit clawhub.ai and login with GitHub\n2. Run \"clawhub login\" in terminal\n3. Copy your token and paste it here';

  @override
  String connectionFailed(String error) {
    return 'Connection failed: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count runs';
  }

  @override
  String nextRunLabel(String time) {
    return 'Next run: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Last error: $error';
  }

  @override
  String get cronJobHintText =>
      'Instructions for the agent when this job fires…';

  @override
  String get androidPermissions => 'Android Permissions';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw can control your screen on your behalf — tapping buttons, filling forms, scrolling, and automating repetitive tasks across any app.';

  @override
  String get twoPermissionsNeeded =>
      'Two permissions are needed for the full experience. You can skip this and enable them later in Settings.';

  @override
  String get accessibilityService => 'Accessibility Service';

  @override
  String get accessibilityServiceDesc =>
      'Allows tapping, swiping, typing, and reading screen content';

  @override
  String get displayOverOtherApps => 'Display Over Other Apps';

  @override
  String get displayOverOtherAppsDesc =>
      'Shows a floating status chip so you can see what the agent is doing';

  @override
  String get changeDefaultModel => 'Change default model';

  @override
  String setModelAsDefault(String name) {
    return 'Set $name as the default model.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Also update $count agent$_temp0';
  }

  @override
  String get startNewSessions => 'Start new sessions';

  @override
  String get currentConversationsArchived =>
      'Current conversations will be archived';

  @override
  String get applyAction => 'Apply';

  @override
  String applyModelQuestion(String name) {
    return 'Apply $name?';
  }

  @override
  String get setAsDefaultModel => 'Set as default model';

  @override
  String get usedByAgentsWithout => 'Used by agents without a specific model';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Apply to $count agent$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Provider already authenticated — no API key needed.';

  @override
  String get selectFromList => 'Select from list';

  @override
  String get enterCustomModelId => 'Enter a custom model ID';

  @override
  String get removeSkillTitle => 'Remove skill?';

  @override
  String get browseClawHubToDiscover =>
      'Browse ClawHub to discover and install skills';

  @override
  String get addDeviceTooltip => 'Add device';

  @override
  String get addNumberTooltip => 'Add number';

  @override
  String get searchSkillsHint => 'Search skills...';

  @override
  String get loginToClawHub => 'Login to ClawHub';

  @override
  String get accountTooltip => 'Account';

  @override
  String get editAction => 'Edit';

  @override
  String get setAsDefaultAction => 'Set as default';

  @override
  String get chooseProviderTitle => 'Choose provider';

  @override
  String get apiKeyTitle => 'API Key';

  @override
  String get slackConfigSaved => 'Slack saved — restart the gateway to connect';

  @override
  String get signalConfigSaved => 'Signal saved — restart gateway to connect';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Add device';

  @override
  String get skipAction => 'Skip';

  @override
  String get mcpServers => 'MCP Servers';

  @override
  String get noMcpServersConfigured => 'No MCP servers configured';

  @override
  String get mcpServersEmptyHint =>
      'Add MCP servers to give your agent access to tools from GitHub, Notion, Slack, databases, and more.';

  @override
  String get addMcpServer => 'Add MCP Server';

  @override
  String get editMcpServer => 'Edit MCP Server';

  @override
  String get removeMcpServer => 'Remove MCP Server';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Remove \"$name\"? Its tools will no longer be available.';
  }

  @override
  String get mcpTransport => 'Transport';

  @override
  String get testConnection => 'Test Connection';

  @override
  String get mcpServerNameLabel => 'Server name';

  @override
  String get mcpServerNameHint => 'e.g. GitHub, Notion, My DB';

  @override
  String get mcpServerUrlLabel => 'Server URL';

  @override
  String get mcpBearerTokenLabel => 'Bearer token (optional)';

  @override
  String get mcpBearerTokenHint => 'Leave blank if no auth required';

  @override
  String get mcpCommandLabel => 'Command';

  @override
  String get mcpArgumentsLabel => 'Arguments (space-separated)';

  @override
  String get mcpEnvVarsLabel =>
      'Environment variables (KEY=VALUE, one per line)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio is not available on iOS. Use HTTP or SSE instead.';

  @override
  String get connectedStatus => 'Connected';

  @override
  String get mcpConnecting => 'Connecting...';

  @override
  String get mcpConnectionError => 'Connection error';

  @override
  String get mcpDisconnected => 'Disconnected';

  @override
  String mcpToolsCount(int count) {
    return '$count tools';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — $count tools discovered';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Connected (0 tools)';

  @override
  String get mcpTestFailed => 'Connection failed. Check server URL/token.';

  @override
  String get mcpAddServer => 'Add server';

  @override
  String get mcpSaveChanges => 'Save changes';

  @override
  String get urlIsRequired => 'URL is required';

  @override
  String get enterValidUrl => 'Enter a valid URL';

  @override
  String get commandIsRequired => 'Command is required';

  @override
  String skillRemoved(String name) {
    return 'Skill \"$name\" removed';
  }

  @override
  String get editFileContentHint => 'Edit file content...';

  @override
  String get whatsAppPairSubtitle =>
      'Pair your personal WhatsApp account with a QR code';

  @override
  String get whatsAppPairingOptional =>
      'Pairing is optional. You can finish onboarding now and complete the link later.';

  @override
  String get whatsAppEnableToLink =>
      'Enable WhatsApp to start linking this device.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp is linked. FlutterClaw will be able to respond after onboarding.';

  @override
  String get cancelLink => 'Cancel Link';
}
