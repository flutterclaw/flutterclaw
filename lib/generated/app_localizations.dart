import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'FlutterClaw'**
  String get appTitle;

  /// Chat tab label
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Channels tab label
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channels;

  /// Agent tab label
  ///
  /// In en, this message translates to:
  /// **'Agent'**
  String get agent;

  /// Settings tab label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Welcome page button
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// App tagline
  ///
  /// In en, this message translates to:
  /// **'Your personal AI assistant'**
  String get yourPersonalAssistant;

  /// Feature description
  ///
  /// In en, this message translates to:
  /// **'Multi-channel chat'**
  String get multiChannelChat;

  /// Multi-channel chat description
  ///
  /// In en, this message translates to:
  /// **'Telegram, Discord, Chat and more'**
  String get multiChannelChatDesc;

  /// Feature description
  ///
  /// In en, this message translates to:
  /// **'Powerful AI models'**
  String get powerfulAIModels;

  /// AI models description
  ///
  /// In en, this message translates to:
  /// **'OpenAI, Anthropic, Grok, and free models'**
  String get powerfulAIModelsDesc;

  /// Feature description
  ///
  /// In en, this message translates to:
  /// **'Local gateway'**
  String get localGateway;

  /// Local gateway description
  ///
  /// In en, this message translates to:
  /// **'Runs on your device, your data stays yours'**
  String get localGatewayDesc;

  /// Provider selection page title
  ///
  /// In en, this message translates to:
  /// **'Choose a Provider'**
  String get chooseProvider;

  /// Provider selection description
  ///
  /// In en, this message translates to:
  /// **'Select how you want to connect to AI models.'**
  String get selectProviderDesc;

  /// Free providers section title
  ///
  /// In en, this message translates to:
  /// **'Start for Free'**
  String get startForFree;

  /// Free providers description
  ///
  /// In en, this message translates to:
  /// **'These providers offer free models to get you started with no cost.'**
  String get freeProvidersDesc;

  /// Free badge label
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get free;

  /// Paid providers section title
  ///
  /// In en, this message translates to:
  /// **'Other Providers'**
  String get otherProviders;

  /// Auth page title
  ///
  /// In en, this message translates to:
  /// **'Connect to {provider}'**
  String connectToProvider(String provider);

  /// Auth page description
  ///
  /// In en, this message translates to:
  /// **'Enter your API key and select a model.'**
  String get enterApiKeyDesc;

  /// API key prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an API key?'**
  String get dontHaveApiKey;

  /// API key instructions
  ///
  /// In en, this message translates to:
  /// **'Create an account and copy your key.'**
  String get createAccountCopyKey;

  /// Sign up button
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// API key field label
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get apiKey;

  /// Paste button tooltip
  ///
  /// In en, this message translates to:
  /// **'Paste from clipboard'**
  String get pasteFromClipboard;

  /// API base URL field label
  ///
  /// In en, this message translates to:
  /// **'API Base URL'**
  String get apiBaseUrl;

  /// Model selection label
  ///
  /// In en, this message translates to:
  /// **'Select Model'**
  String get selectModel;

  /// Model ID field label
  ///
  /// In en, this message translates to:
  /// **'Model ID'**
  String get modelId;

  /// Validate button label
  ///
  /// In en, this message translates to:
  /// **'Validate Key'**
  String get validateKey;

  /// Validating status
  ///
  /// In en, this message translates to:
  /// **'Validating...'**
  String get validating;

  /// Invalid key error
  ///
  /// In en, this message translates to:
  /// **'Invalid API key'**
  String get invalidApiKey;

  /// Gateway page title
  ///
  /// In en, this message translates to:
  /// **'Gateway Configuration'**
  String get gatewayConfiguration;

  /// Gateway configuration description
  ///
  /// In en, this message translates to:
  /// **'The gateway is the local control plane for your assistant.'**
  String get gatewayConfigDesc;

  /// Gateway settings note
  ///
  /// In en, this message translates to:
  /// **'The default settings work for most users. Only change these if you know what you need.'**
  String get defaultSettingsNote;

  /// Host field label
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get host;

  /// Port field label
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get port;

  /// Auto-start toggle label
  ///
  /// In en, this message translates to:
  /// **'Auto-start gateway'**
  String get autoStartGateway;

  /// Auto-start description
  ///
  /// In en, this message translates to:
  /// **'Start the gateway automatically when the app launches.'**
  String get autoStartGatewayDesc;

  /// Channels page title
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channelsPageTitle;

  /// Channels page description
  ///
  /// In en, this message translates to:
  /// **'Optionally connect messaging channels. You can always set these up later in Settings.'**
  String get channelsPageDesc;

  /// Telegram channel name
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get telegram;

  /// Telegram description
  ///
  /// In en, this message translates to:
  /// **'Connect a Telegram bot.'**
  String get connectTelegramBot;

  /// BotFather link label
  ///
  /// In en, this message translates to:
  /// **'Open BotFather'**
  String get openBotFather;

  /// Discord channel name
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get discord;

  /// Discord description
  ///
  /// In en, this message translates to:
  /// **'Connect a Discord bot.'**
  String get connectDiscordBot;

  /// Discord developer portal link
  ///
  /// In en, this message translates to:
  /// **'Developer Portal'**
  String get developerPortal;

  /// Bot token field label
  ///
  /// In en, this message translates to:
  /// **'Bot Token'**
  String get botToken;

  /// Platform-specific bot token
  ///
  /// In en, this message translates to:
  /// **'{platform} Bot Token'**
  String telegramBotToken(String platform);

  /// Completion page title
  ///
  /// In en, this message translates to:
  /// **'Ready to Go'**
  String get readyToGo;

  /// Completion page description
  ///
  /// In en, this message translates to:
  /// **'Review your configuration and start FlutterClaw.'**
  String get reviewConfiguration;

  /// Model section label
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// Provider attribution
  ///
  /// In en, this message translates to:
  /// **'via {provider}'**
  String viaProvider(String provider);

  /// Gateway section label
  ///
  /// In en, this message translates to:
  /// **'Gateway'**
  String get gateway;

  /// Default channels message
  ///
  /// In en, this message translates to:
  /// **'Chat only (you can add more later)'**
  String get webChatOnly;

  /// In-app chat channel name
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get webChat;

  /// Starting status
  ///
  /// In en, this message translates to:
  /// **'Starting...'**
  String get starting;

  /// Start button label
  ///
  /// In en, this message translates to:
  /// **'Start FlutterClaw'**
  String get startFlutterClaw;

  /// New session tooltip
  ///
  /// In en, this message translates to:
  /// **'New session'**
  String get newSession;

  /// Photo library option
  ///
  /// In en, this message translates to:
  /// **'Photo Library'**
  String get photoLibrary;

  /// Camera option
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Default image caption
  ///
  /// In en, this message translates to:
  /// **'What do you see in this image?'**
  String get whatDoYouSeeInImage;

  /// Simulator error
  ///
  /// In en, this message translates to:
  /// **'Image picker not available on Simulator. Use a real device.'**
  String get imagePickerNotAvailable;

  /// Image picker error
  ///
  /// In en, this message translates to:
  /// **'Could not open image picker.'**
  String get couldNotOpenImagePicker;

  /// Copy confirmation
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// Attach button tooltip
  ///
  /// In en, this message translates to:
  /// **'Attach image'**
  String get attachImage;

  /// Chat input placeholder
  ///
  /// In en, this message translates to:
  /// **'Message FlutterClaw...'**
  String get messageFlutterClaw;

  /// Channels screen title
  ///
  /// In en, this message translates to:
  /// **'Channels & Gateway'**
  String get channelsAndGateway;

  /// Stop button
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// Start button
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Status label
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String status(String status);

  /// WebChat description
  ///
  /// In en, this message translates to:
  /// **'Built-in chat interface'**
  String get builtInChatInterface;

  /// Channel status
  ///
  /// In en, this message translates to:
  /// **'Not configured'**
  String get notConfigured;

  /// Channel status
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// Channel status
  ///
  /// In en, this message translates to:
  /// **'Configured (starting...)'**
  String get configuredStarting;

  /// Telegram config dialog title
  ///
  /// In en, this message translates to:
  /// **'Telegram Configuration'**
  String get telegramConfiguration;

  /// Telegram token hint
  ///
  /// In en, this message translates to:
  /// **'From @BotFather'**
  String get fromBotFather;

  /// Allowed users field label
  ///
  /// In en, this message translates to:
  /// **'Allowed User IDs (comma separated)'**
  String get allowedUserIds;

  /// Allow all users hint
  ///
  /// In en, this message translates to:
  /// **'Leave empty to allow all'**
  String get leaveEmptyToAllowAll;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save and connect button
  ///
  /// In en, this message translates to:
  /// **'Save & Connect'**
  String get saveAndConnect;

  /// Discord config dialog title
  ///
  /// In en, this message translates to:
  /// **'Discord Configuration'**
  String get discordConfiguration;

  /// Pairing section title
  ///
  /// In en, this message translates to:
  /// **'Pending Pairing Requests'**
  String get pendingPairingRequests;

  /// Approve button tooltip
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// Reject button tooltip
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// Expired status
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// Time remaining
  ///
  /// In en, this message translates to:
  /// **'{minutes}m left'**
  String minutesLeft(int minutes);

  /// Workspace section title
  ///
  /// In en, this message translates to:
  /// **'Workspace Files'**
  String get workspaceFiles;

  /// Agent subtitle
  ///
  /// In en, this message translates to:
  /// **'Personal AI Assistant'**
  String get personalAIAssistant;

  /// Sessions section title
  ///
  /// In en, this message translates to:
  /// **'Sessions ({count})'**
  String sessionsCount(int count);

  /// Empty sessions message
  ///
  /// In en, this message translates to:
  /// **'No active sessions'**
  String get noActiveSessions;

  /// Empty sessions hint
  ///
  /// In en, this message translates to:
  /// **'Start a conversation to create one'**
  String get startConversationToCreate;

  /// Empty sessions hint (alternative)
  ///
  /// In en, this message translates to:
  /// **'Start a conversation to see sessions here'**
  String get startConversationToSee;

  /// Reset action
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Cron jobs section title
  ///
  /// In en, this message translates to:
  /// **'Cron Jobs'**
  String get cronJobs;

  /// Empty cron jobs message
  ///
  /// In en, this message translates to:
  /// **'No cron jobs'**
  String get noCronJobs;

  /// Cron jobs hint
  ///
  /// In en, this message translates to:
  /// **'Add scheduled tasks for your agent'**
  String get addScheduledTasks;

  /// Run job action
  ///
  /// In en, this message translates to:
  /// **'Run Now'**
  String get runNow;

  /// Enable action
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Disable action
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// Delete action
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Skills section title
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// ClawHub button tooltip
  ///
  /// In en, this message translates to:
  /// **'Browse ClawHub'**
  String get browseClawHub;

  /// Empty skills message
  ///
  /// In en, this message translates to:
  /// **'No skills installed'**
  String get noSkillsInstalled;

  /// Skills hint
  ///
  /// In en, this message translates to:
  /// **'Browse ClawHub to add skills'**
  String get browseClawHubToAdd;

  /// Remove skill confirmation
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your skills?'**
  String removeSkillConfirm(String name);

  /// ClawHub browser title
  ///
  /// In en, this message translates to:
  /// **'ClawHub Skills'**
  String get clawHubSkills;

  /// Search field hint
  ///
  /// In en, this message translates to:
  /// **'Search skills...'**
  String get searchSkills;

  /// No results message
  ///
  /// In en, this message translates to:
  /// **'No skills found. Try a different search.'**
  String get noSkillsFound;

  /// Install success message
  ///
  /// In en, this message translates to:
  /// **'Installed {name}'**
  String installedSkill(String name);

  /// Install failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to install {name}'**
  String failedToInstallSkill(String name);

  /// Add cron job dialog title
  ///
  /// In en, this message translates to:
  /// **'Add Cron Job'**
  String get addCronJob;

  /// Job name field label
  ///
  /// In en, this message translates to:
  /// **'Job Name'**
  String get jobName;

  /// Job name example
  ///
  /// In en, this message translates to:
  /// **'e.g. Daily Summary'**
  String get dailySummaryExample;

  /// Task prompt field label
  ///
  /// In en, this message translates to:
  /// **'Task Prompt'**
  String get taskPrompt;

  /// Task prompt hint
  ///
  /// In en, this message translates to:
  /// **'What should the agent do?'**
  String get whatShouldAgentDo;

  /// Interval field label
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 5 minutes'**
  String get every5Minutes;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 15 minutes'**
  String get every15Minutes;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 30 minutes'**
  String get every30Minutes;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every hour'**
  String get everyHour;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 6 hours'**
  String get every6Hours;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 12 hours'**
  String get every12Hours;

  /// Interval option
  ///
  /// In en, this message translates to:
  /// **'Every 24 hours'**
  String get every24Hours;

  /// Add button
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Sessions screen title
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessions;

  /// Message count
  ///
  /// In en, this message translates to:
  /// **'{count} messages'**
  String messagesCount(int count);

  /// Token count
  ///
  /// In en, this message translates to:
  /// **'{count} tokens'**
  String tokensCount(int count);

  /// Compact action
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get compact;

  /// Models section title
  ///
  /// In en, this message translates to:
  /// **'Models'**
  String get models;

  /// Empty models message
  ///
  /// In en, this message translates to:
  /// **'No models configured'**
  String get noModelsConfigured;

  /// Models hint
  ///
  /// In en, this message translates to:
  /// **'Add a model to start chatting'**
  String get addModelToStartChatting;

  /// Add model button
  ///
  /// In en, this message translates to:
  /// **'Add Model'**
  String get addModel;

  /// Default badge
  ///
  /// In en, this message translates to:
  /// **'DEFAULT'**
  String get default_;

  /// Auto-start label
  ///
  /// In en, this message translates to:
  /// **'Auto-start'**
  String get autoStart;

  /// Auto-start description
  ///
  /// In en, this message translates to:
  /// **'Start gateway when app launches'**
  String get startGatewayWhenLaunches;

  /// Heartbeat section title
  ///
  /// In en, this message translates to:
  /// **'Heartbeat'**
  String get heartbeat;

  /// Enabled toggle
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// Heartbeat description
  ///
  /// In en, this message translates to:
  /// **'Periodic agent tasks from HEARTBEAT.md'**
  String get periodicAgentTasks;

  /// Interval display
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String intervalMinutes(int minutes);

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// App description
  ///
  /// In en, this message translates to:
  /// **'Personal AI Assistant for iOS & Android'**
  String get personalAIAssistantForIOS;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Attribution
  ///
  /// In en, this message translates to:
  /// **'Based on OpenClaw'**
  String get basedOnOpenClaw;

  /// Remove model dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove model?'**
  String get removeModel;

  /// Remove model confirmation
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your models?'**
  String removeModelConfirm(String name);

  /// Remove button
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Set as default button
  ///
  /// In en, this message translates to:
  /// **'Set as Default'**
  String get setAsDefault;

  /// Paste tooltip
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// Step 1 label
  ///
  /// In en, this message translates to:
  /// **'1. Choose Provider'**
  String get chooseProviderStep;

  /// Step 2 label
  ///
  /// In en, this message translates to:
  /// **'2. Select Model'**
  String get selectModelStep;

  /// Step 3 label
  ///
  /// In en, this message translates to:
  /// **'3. API Key'**
  String get apiKeyStep;

  /// API key link text
  ///
  /// In en, this message translates to:
  /// **'Get API key at {provider}'**
  String getApiKeyAt(String provider);

  /// Time ago format
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get justNow;

  /// Time ago format
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String minutesAgo(int minutes);

  /// Time ago format
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String hoursAgo(int hours);

  /// Time ago format
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String daysAgo(int days);

  /// Microphone permission error
  ///
  /// In en, this message translates to:
  /// **'Microphone permission denied'**
  String get microphonePermissionDenied;

  /// Transcription unavailable error
  ///
  /// In en, this message translates to:
  /// **'Live transcription unavailable: {error}'**
  String liveTranscriptionUnavailable(String error);

  /// Recording start error
  ///
  /// In en, this message translates to:
  /// **'Failed to start recording: {error}'**
  String failedToStartRecording(String error);

  /// Transcription method message
  ///
  /// In en, this message translates to:
  /// **'Using on-device transcription'**
  String get usingOnDeviceTranscription;

  /// Whisper transcription status
  ///
  /// In en, this message translates to:
  /// **'Transcribing with Whisper API...'**
  String get transcribingWithWhisper;

  /// Whisper API error
  ///
  /// In en, this message translates to:
  /// **'Whisper API failed: {error}'**
  String whisperApiFailed(String error);

  /// No transcription message
  ///
  /// In en, this message translates to:
  /// **'No transcription captured'**
  String get noTranscriptionCaptured;

  /// Recording stop error
  ///
  /// In en, this message translates to:
  /// **'Failed to stop recording: {error}'**
  String failedToStopRecording(String error);

  /// Pause/resume error
  ///
  /// In en, this message translates to:
  /// **'Failed to {action}: {error}'**
  String failedToPauseResume(String action, String error);

  /// Pause tooltip
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// Resume tooltip
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// Send tooltip
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Live Activity status message
  ///
  /// In en, this message translates to:
  /// **'Live Activity active'**
  String get liveActivityActive;

  /// Restart gateway tooltip
  ///
  /// In en, this message translates to:
  /// **'Restart Gateway'**
  String get restartGateway;

  /// Current model display
  ///
  /// In en, this message translates to:
  /// **'Model: {model}'**
  String modelLabel(String model);

  /// Gateway uptime display
  ///
  /// In en, this message translates to:
  /// **'Uptime: {uptime}'**
  String uptimeLabel(String uptime);

  /// iOS background support message
  ///
  /// In en, this message translates to:
  /// **'iOS: Background support enabled - gateway can continue responding'**
  String get iosBackgroundSupportActive;

  /// WebChat description
  ///
  /// In en, this message translates to:
  /// **'Built-in chat interface'**
  String get webChatBuiltIn;

  /// Configure button
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// Disconnect button
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// Agents tab label
  ///
  /// In en, this message translates to:
  /// **'Agents'**
  String get agents;

  /// Agent files tab label
  ///
  /// In en, this message translates to:
  /// **'Agent Files'**
  String get agentFiles;

  /// Create agent button
  ///
  /// In en, this message translates to:
  /// **'Create Agent'**
  String get createAgent;

  /// Edit agent button
  ///
  /// In en, this message translates to:
  /// **'Edit Agent'**
  String get editAgent;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No agents yet'**
  String get noAgentsYet;

  /// Empty state call to action
  ///
  /// In en, this message translates to:
  /// **'Create your first agent!'**
  String get createYourFirstAgent;

  /// Active agent status
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Agent name field label
  ///
  /// In en, this message translates to:
  /// **'Agent Name'**
  String get agentName;

  /// Emoji field label
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get emoji;

  /// Select emoji button
  ///
  /// In en, this message translates to:
  /// **'Select Emoji'**
  String get selectEmoji;

  /// Vibe field label
  ///
  /// In en, this message translates to:
  /// **'Vibe'**
  String get vibe;

  /// Vibe field hint
  ///
  /// In en, this message translates to:
  /// **'e.g., friendly, formal, snarky'**
  String get vibeHint;

  /// Model configuration section
  ///
  /// In en, this message translates to:
  /// **'Model Configuration'**
  String get modelConfiguration;

  /// Advanced settings section
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettings;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Agent created'**
  String get agentCreated;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Agent updated'**
  String get agentUpdated;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Agent deleted'**
  String get agentDeleted;

  /// Agent switched message
  ///
  /// In en, this message translates to:
  /// **'Switched to {name}'**
  String switchedToAgent(String name);

  /// Delete agent confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete {name}? This will remove all workspace data.'**
  String deleteAgentConfirm(String name);

  /// Agent details screen title
  ///
  /// In en, this message translates to:
  /// **'Agent Details'**
  String get agentDetails;

  /// Created date label
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdAt;

  /// Last used date label
  ///
  /// In en, this message translates to:
  /// **'Last Used'**
  String get lastUsed;

  /// Basic information section
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// Switch agent modal title
  ///
  /// In en, this message translates to:
  /// **'Switch Agent'**
  String get switchToAgent;

  /// Settings section header
  ///
  /// In en, this message translates to:
  /// **'Providers'**
  String get providers;

  /// Add provider button
  ///
  /// In en, this message translates to:
  /// **'Add provider'**
  String get addProvider;

  /// Empty providers message
  ///
  /// In en, this message translates to:
  /// **'No providers configured.'**
  String get noProvidersConfigured;

  /// Edit credentials tooltip
  ///
  /// In en, this message translates to:
  /// **'Edit credentials'**
  String get editCredentials;

  /// Default model explanation
  ///
  /// In en, this message translates to:
  /// **'The default model is used by agents that don\'t specify their own.'**
  String get defaultModelHint;

  /// Tooltip for model long-press
  ///
  /// In en, this message translates to:
  /// **'Hold to set as default'**
  String get holdToSetAsDefault;

  /// Settings section header
  ///
  /// In en, this message translates to:
  /// **'Integrations'**
  String get integrations;

  /// Shortcuts integration title
  ///
  /// In en, this message translates to:
  /// **'Shortcuts Integrations'**
  String get shortcutsIntegrations;

  /// Shortcuts integration description
  ///
  /// In en, this message translates to:
  /// **'Install iOS Shortcuts to run third-party app actions'**
  String get shortcutsIntegrationsDesc;

  /// Settings section header
  ///
  /// In en, this message translates to:
  /// **'Danger zone'**
  String get dangerZone;

  /// Reset onboarding title
  ///
  /// In en, this message translates to:
  /// **'Reset & re-run onboarding'**
  String get resetOnboarding;

  /// Reset onboarding description
  ///
  /// In en, this message translates to:
  /// **'Deletes all configuration and returns to the setup wizard.'**
  String get resetOnboardingDesc;

  /// Reset confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Reset all configuration?'**
  String get resetAllConfiguration;

  /// Reset confirmation dialog body
  ///
  /// In en, this message translates to:
  /// **'This will delete your API keys, models, and all settings. The app will return to the setup wizard.\n\nYour conversation history is not deleted.'**
  String get resetAllConfigurationDesc;

  /// Remove provider dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove provider'**
  String get removeProvider;

  /// Remove provider confirmation
  ///
  /// In en, this message translates to:
  /// **'Remove credentials for {provider}?'**
  String removeProviderConfirm(String provider);

  /// Model set as default confirmation
  ///
  /// In en, this message translates to:
  /// **'{name} set as default model'**
  String modelSetAsDefault(String name);

  /// Attach menu option
  ///
  /// In en, this message translates to:
  /// **'Photo / Image'**
  String get photoImage;

  /// Attach menu option
  ///
  /// In en, this message translates to:
  /// **'Document (PDF / TXT)'**
  String get documentPdfTxt;

  /// Document open error
  ///
  /// In en, this message translates to:
  /// **'Could not open document: {error}'**
  String couldNotOpenDocument(String error);

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Gateway stopped snackbar
  ///
  /// In en, this message translates to:
  /// **'Gateway stopped'**
  String get gatewayStopped;

  /// Gateway started snackbar
  ///
  /// In en, this message translates to:
  /// **'Gateway started successfully!'**
  String get gatewayStarted;

  /// Gateway failure snackbar
  ///
  /// In en, this message translates to:
  /// **'Gateway failed: {error}'**
  String gatewayFailed(String error);

  /// Generic exception message
  ///
  /// In en, this message translates to:
  /// **'Exception: {error}'**
  String exceptionError(String error);

  /// Pairing approved snackbar
  ///
  /// In en, this message translates to:
  /// **'Pairing request approved'**
  String get pairingRequestApproved;

  /// Pairing rejected snackbar
  ///
  /// In en, this message translates to:
  /// **'Pairing request rejected'**
  String get pairingRequestRejected;

  /// Add device dialog title
  ///
  /// In en, this message translates to:
  /// **'Add Device'**
  String get addDevice;

  /// Telegram config saved snackbar
  ///
  /// In en, this message translates to:
  /// **'Telegram configuration saved'**
  String get telegramConfigSaved;

  /// Discord config saved snackbar
  ///
  /// In en, this message translates to:
  /// **'Discord configuration saved'**
  String get discordConfigSaved;

  /// Security method section header
  ///
  /// In en, this message translates to:
  /// **'Security Method'**
  String get securityMethod;

  /// Security mode option
  ///
  /// In en, this message translates to:
  /// **'Pairing (Recommended)'**
  String get pairingRecommended;

  /// Pairing mode description
  ///
  /// In en, this message translates to:
  /// **'New users get a pairing code. You approve or reject them.'**
  String get pairingDescription;

  /// Security mode option
  ///
  /// In en, this message translates to:
  /// **'Allowlist'**
  String get allowlistTitle;

  /// Allowlist mode description
  ///
  /// In en, this message translates to:
  /// **'Only specific user IDs can access the bot.'**
  String get allowlistDescription;

  /// Security mode option
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openAccess;

  /// Open access description
  ///
  /// In en, this message translates to:
  /// **'Anyone can use the bot immediately (not recommended).'**
  String get openAccessDescription;

  /// Security mode option
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabledAccess;

  /// Disabled access description
  ///
  /// In en, this message translates to:
  /// **'No DMs allowed. Bot will not respond to any messages.'**
  String get disabledAccessDescription;

  /// Approved devices section header
  ///
  /// In en, this message translates to:
  /// **'Approved Devices'**
  String get approvedDevices;

  /// Empty approved devices
  ///
  /// In en, this message translates to:
  /// **'No approved devices yet'**
  String get noApprovedDevicesYet;

  /// Empty devices hint
  ///
  /// In en, this message translates to:
  /// **'Devices will appear here after you approve their pairing requests'**
  String get devicesAppearAfterApproval;

  /// Empty allowed users
  ///
  /// In en, this message translates to:
  /// **'No allowed users configured'**
  String get noAllowedUsersConfigured;

  /// Empty allowed users hint
  ///
  /// In en, this message translates to:
  /// **'Add user IDs to allow them to use the bot'**
  String get addUserIdsHint;

  /// Remove device dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove device?'**
  String get removeDevice;

  /// Remove device confirmation
  ///
  /// In en, this message translates to:
  /// **'Remove access for {name}?'**
  String removeAccessFor(String name);

  /// Saving button state
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// Channels section label in gateway screen
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channelsLabel;

  /// ClawHub account dialog title
  ///
  /// In en, this message translates to:
  /// **'ClawHub Account'**
  String get clawHubAccount;

  /// Logged in status message
  ///
  /// In en, this message translates to:
  /// **'You are currently logged in to ClawHub.'**
  String get loggedInToClawHub;

  /// Logged out snackbar
  ///
  /// In en, this message translates to:
  /// **'Logged out from ClawHub'**
  String get loggedOutFromClawHub;

  /// Login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Connect button
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// ClawHub token hint
  ///
  /// In en, this message translates to:
  /// **'Paste your ClawHub API token'**
  String get pasteClawHubToken;

  /// Token validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter an API token'**
  String get pleaseEnterApiToken;

  /// Connection success snackbar
  ///
  /// In en, this message translates to:
  /// **'Successfully connected to ClawHub'**
  String get successfullyConnected;

  /// Browse skills button label
  ///
  /// In en, this message translates to:
  /// **'Browse Skills'**
  String get browseSkillsButton;

  /// Install skill button
  ///
  /// In en, this message translates to:
  /// **'Install Skill'**
  String get installSkill;

  /// Incompatible skill dialog title
  ///
  /// In en, this message translates to:
  /// **'Incompatible Skill'**
  String get incompatibleSkill;

  /// Incompatible skill dialog body
  ///
  /// In en, this message translates to:
  /// **'This skill cannot run on mobile (iOS/Android).\n\n{reason}'**
  String incompatibleSkillDesc(String reason);

  /// Compatibility warning dialog title
  ///
  /// In en, this message translates to:
  /// **'Compatibility Warning'**
  String get compatibilityWarning;

  /// Compatibility warning dialog body
  ///
  /// In en, this message translates to:
  /// **'This skill was designed for desktop and may not work as-is on mobile.\n\n{reason}\n\nWould you like to install an adapted version optimized for mobile?'**
  String compatibilityWarningDesc(String reason);

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Install original button
  ///
  /// In en, this message translates to:
  /// **'Install Original'**
  String get installOriginal;

  /// Install adapted button
  ///
  /// In en, this message translates to:
  /// **'Install Adapted'**
  String get installAdapted;

  /// Reset session dialog title
  ///
  /// In en, this message translates to:
  /// **'Reset Session'**
  String get resetSession;

  /// Reset session confirmation
  ///
  /// In en, this message translates to:
  /// **'Reset session \"{key}\"? This will clear all messages.'**
  String resetSessionConfirm(String key);

  /// Session reset snackbar
  ///
  /// In en, this message translates to:
  /// **'Session reset'**
  String get sessionReset;

  /// Active sessions section header
  ///
  /// In en, this message translates to:
  /// **'Active Sessions'**
  String get activeSessions;

  /// Scheduled tasks section header
  ///
  /// In en, this message translates to:
  /// **'Scheduled Tasks'**
  String get scheduledTasks;

  /// Default badge label
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultBadge;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorGeneric(String error);

  /// File saved snackbar
  ///
  /// In en, this message translates to:
  /// **'{fileName} saved'**
  String fileSaved(String fileName);

  /// File save error
  ///
  /// In en, this message translates to:
  /// **'Error saving file: {error}'**
  String errorSavingFile(String error);

  /// Cannot delete last agent error
  ///
  /// In en, this message translates to:
  /// **'Cannot delete the last agent'**
  String get cannotDeleteLastAgent;

  /// Close button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Name validation error
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameIsRequired;

  /// Model validation error
  ///
  /// In en, this message translates to:
  /// **'Please select a model'**
  String get pleaseSelectModel;

  /// Temperature slider label
  ///
  /// In en, this message translates to:
  /// **'Temperature: {value}'**
  String temperatureLabel(String value);

  /// Max tokens field label
  ///
  /// In en, this message translates to:
  /// **'Max Tokens'**
  String get maxTokens;

  /// Max tokens validation error
  ///
  /// In en, this message translates to:
  /// **'Max tokens is required'**
  String get maxTokensRequired;

  /// Number validation error
  ///
  /// In en, this message translates to:
  /// **'Must be a positive number'**
  String get mustBePositiveNumber;

  /// Max iterations field label
  ///
  /// In en, this message translates to:
  /// **'Max Tool Iterations'**
  String get maxToolIterations;

  /// Max iterations validation error
  ///
  /// In en, this message translates to:
  /// **'Max iterations is required'**
  String get maxIterationsRequired;

  /// Workspace restriction toggle
  ///
  /// In en, this message translates to:
  /// **'Restrict to Workspace'**
  String get restrictToWorkspace;

  /// Workspace restriction description
  ///
  /// In en, this message translates to:
  /// **'Limit file operations to agent workspace'**
  String get restrictToWorkspaceDesc;

  /// Long no models message
  ///
  /// In en, this message translates to:
  /// **'Please add at least one model in Settings before creating an agent.'**
  String get noModelsConfiguredLong;

  /// Provider not selected placeholder
  ///
  /// In en, this message translates to:
  /// **'Select a provider first'**
  String get selectProviderFirst;

  /// Skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Accessibility page title
  ///
  /// In en, this message translates to:
  /// **'UI Automation'**
  String get uiAutomation;

  /// UI automation description
  ///
  /// In en, this message translates to:
  /// **'FlutterClaw can control your screen on your behalf — tapping buttons, filling forms, scrolling, and automating repetitive tasks across any app.'**
  String get uiAutomationDesc;

  /// Accessibility service note
  ///
  /// In en, this message translates to:
  /// **'This requires enabling the Accessibility Service in Android Settings. You can skip this and enable it later.'**
  String get uiAutomationAccessibilityNote;

  /// Open accessibility settings button
  ///
  /// In en, this message translates to:
  /// **'Open Accessibility Settings'**
  String get openAccessibilitySettings;

  /// Skip for now button
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// Permission check status
  ///
  /// In en, this message translates to:
  /// **'Checking permission…'**
  String get checkingPermission;

  /// Accessibility enabled status
  ///
  /// In en, this message translates to:
  /// **'Accessibility Service is enabled'**
  String get accessibilityEnabled;

  /// Accessibility not enabled status
  ///
  /// In en, this message translates to:
  /// **'Accessibility Service is not enabled'**
  String get accessibilityNotEnabled;

  /// Explore integrations button
  ///
  /// In en, this message translates to:
  /// **'Explore Integrations'**
  String get exploreIntegrations;

  /// Request timeout error
  ///
  /// In en, this message translates to:
  /// **'Request timed out'**
  String get requestTimedOut;

  /// Shortcuts screen title
  ///
  /// In en, this message translates to:
  /// **'My Shortcuts'**
  String get myShortcuts;

  /// Add shortcut button/dialog title
  ///
  /// In en, this message translates to:
  /// **'Add Shortcut'**
  String get addShortcut;

  /// Empty shortcuts message
  ///
  /// In en, this message translates to:
  /// **'No shortcuts yet'**
  String get noShortcutsYet;

  /// Shortcuts empty state instructions
  ///
  /// In en, this message translates to:
  /// **'Create a shortcut in the iOS Shortcuts app, add the callback action at the end, then register it here so the AI can run it.'**
  String get shortcutsInstructions;

  /// Shortcut name field label
  ///
  /// In en, this message translates to:
  /// **'Shortcut name'**
  String get shortcutName;

  /// Shortcut name hint
  ///
  /// In en, this message translates to:
  /// **'Exact name from the Shortcuts app'**
  String get shortcutNameHint;

  /// Optional description field label
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get descriptionOptional;

  /// Shortcut description hint
  ///
  /// In en, this message translates to:
  /// **'What does this shortcut do?'**
  String get whatDoesShortcutDo;

  /// Callback setup section title
  ///
  /// In en, this message translates to:
  /// **'Callback setup'**
  String get callbackSetup;

  /// Callback setup instructions
  ///
  /// In en, this message translates to:
  /// **'Each shortcut must end with:\n① Get Value for Key → \"callbackUrl\" (from Shortcut Input parsed as dict)\n② Open URLs ← output of ①'**
  String get callbackInstructions;

  /// App channel label
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get channelApp;

  /// Heartbeat channel label
  ///
  /// In en, this message translates to:
  /// **'Heartbeat'**
  String get channelHeartbeat;

  /// Cron channel label
  ///
  /// In en, this message translates to:
  /// **'Cron'**
  String get channelCron;

  /// Subagent channel label
  ///
  /// In en, this message translates to:
  /// **'Subagent'**
  String get channelSubagent;

  /// System channel label
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get channelSystem;

  /// Seconds ago time format
  ///
  /// In en, this message translates to:
  /// **'{seconds}s ago'**
  String secondsAgo(int seconds);

  /// Messages abbreviation
  ///
  /// In en, this message translates to:
  /// **'msgs'**
  String get messagesAbbrev;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'cs',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
