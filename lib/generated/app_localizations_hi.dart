// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'चैट';

  @override
  String get channels => 'चैनल';

  @override
  String get agent => 'एजेंट';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get yourPersonalAssistant => 'आपका व्यक्तिगत AI सहायक';

  @override
  String get multiChannelChat => 'मल्टी-चैनल चैट';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat और अधिक';

  @override
  String get powerfulAIModels => 'शक्तिशाली AI मॉडल';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok और मुफ्त मॉडल';

  @override
  String get localGateway => 'स्थानीय गेटवे';

  @override
  String get localGatewayDesc =>
      'आपके डिवाइस पर चलता है, आपका डेटा आपका रहता है';

  @override
  String get chooseProvider => 'प्रदाता चुनें';

  @override
  String get selectProviderDesc =>
      'चुनें कि आप AI मॉडल से कैसे कनेक्ट करना चाहते हैं।';

  @override
  String get startForFree => 'मुफ्त में शुरू करें';

  @override
  String get freeProvidersDesc =>
      'ये प्रदाता बिना किसी लागत के शुरू करने के लिए मुफ्त मॉडल प्रदान करते हैं।';

  @override
  String get free => 'मुफ्त';

  @override
  String get otherProviders => 'अन्य प्रदाता';

  @override
  String connectToProvider(String provider) {
    return '$provider से कनेक्ट करें';
  }

  @override
  String get enterApiKeyDesc => 'अपनी API कुंजी दर्ज करें और एक मॉडल चुनें।';

  @override
  String get dontHaveApiKey => 'API कुंजी नहीं है?';

  @override
  String get createAccountCopyKey => 'एक खाता बनाएं और अपनी कुंजी कॉपी करें।';

  @override
  String get signUp => 'साइन अप करें';

  @override
  String get apiKey => 'API कुंजी';

  @override
  String get pasteFromClipboard => 'क्लिपबोर्ड से पेस्ट करें';

  @override
  String get apiBaseUrl => 'API आधार URL';

  @override
  String get selectModel => 'मॉडल चुनें';

  @override
  String get modelId => 'मॉडल ID';

  @override
  String get validateKey => 'कुंजी सत्यापित करें';

  @override
  String get validating => 'सत्यापित कर रहा है...';

  @override
  String get invalidApiKey => 'अमान्य API कुंजी';

  @override
  String get gatewayConfiguration => 'गेटवे कॉन्फ़िगरेशन';

  @override
  String get gatewayConfigDesc =>
      'गेटवे आपके सहायक के लिए स्थानीय नियंत्रण तल है।';

  @override
  String get defaultSettingsNote =>
      'डिफ़ॉल्ट सेटिंग्स अधिकांश उपयोगकर्ताओं के लिए काम करती हैं। केवल तभी बदलें जब आप जानते हों कि आपको क्या चाहिए।';

  @override
  String get host => 'होस्ट';

  @override
  String get port => 'पोर्ट';

  @override
  String get autoStartGateway => 'गेटवे स्वचालित रूप से शुरू करें';

  @override
  String get autoStartGatewayDesc =>
      'ऐप शुरू होने पर गेटवे को स्वचालित रूप से शुरू करें।';

  @override
  String get channelsPageTitle => 'चैनल';

  @override
  String get channelsPageDesc =>
      'वैकल्पिक रूप से मैसेजिंग चैनल कनेक्ट करें। आप हमेशा इन्हें सेटिंग्स में बाद में सेट कर सकते हैं।';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Telegram बॉट कनेक्ट करें।';

  @override
  String get openBotFather => 'BotFather खोलें';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Discord बॉट कनेक्ट करें।';

  @override
  String get developerPortal => 'डेवलपर पोर्टल';

  @override
  String get botToken => 'बॉट टोकन';

  @override
  String telegramBotToken(String platform) {
    return '$platform बॉट टोकन';
  }

  @override
  String get readyToGo => 'शुरू करने के लिए तैयार';

  @override
  String get reviewConfiguration =>
      'अपने कॉन्फ़िगरेशन की समीक्षा करें और FlutterClaw शुरू करें।';

  @override
  String get model => 'मॉडल';

  @override
  String viaProvider(String provider) {
    return '$provider के माध्यम से';
  }

  @override
  String get gateway => 'गेटवे';

  @override
  String get webChatOnly => 'केवल WebChat (आप बाद में और जोड़ सकते हैं)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'शुरू हो रहा है...';

  @override
  String get startFlutterClaw => 'FlutterClaw शुरू करें';

  @override
  String get newSession => 'नया सत्र';

  @override
  String get photoLibrary => 'फोटो लाइब्रेरी';

  @override
  String get camera => 'कैमरा';

  @override
  String get whatDoYouSeeInImage => 'आप इस छवि में क्या देखते हैं?';

  @override
  String get imagePickerNotAvailable =>
      'सिम्युलेटर पर इमेज पिकर उपलब्ध नहीं है। एक वास्तविक डिवाइस का उपयोग करें।';

  @override
  String get couldNotOpenImagePicker => 'इमेज पिकर नहीं खोल सका।';

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get attachImage => 'छवि संलग्न करें';

  @override
  String get messageFlutterClaw => 'FlutterClaw को संदेश...';

  @override
  String get channelsAndGateway => 'चैनल और गेटवे';

  @override
  String get stop => 'रोकें';

  @override
  String get start => 'शुरू करें';

  @override
  String status(String status) {
    return 'स्थिति: $status';
  }

  @override
  String get builtInChatInterface => 'अंतर्निहित चैट इंटरफेस';

  @override
  String get notConfigured => 'कॉन्फ़िगर नहीं किया गया';

  @override
  String get connected => 'कनेक्टेड';

  @override
  String get configuredStarting => 'कॉन्फ़िगर किया गया (शुरू हो रहा है...)';

  @override
  String get telegramConfiguration => 'Telegram कॉन्फ़िगरेशन';

  @override
  String get fromBotFather => '@BotFather से';

  @override
  String get allowedUserIds => 'अनुमत उपयोगकर्ता ID (कॉमा द्वारा अलग)';

  @override
  String get leaveEmptyToAllowAll => 'सभी को अनुमति देने के लिए खाली छोड़ दें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get saveAndConnect => 'सहेजें और कनेक्ट करें';

  @override
  String get discordConfiguration => 'Discord कॉन्फ़िगरेशन';

  @override
  String get pendingPairingRequests => 'लंबित पेयरिंग अनुरोध';

  @override
  String get approve => 'स्वीकृत करें';

  @override
  String get reject => 'अस्वीकार करें';

  @override
  String get expired => 'समाप्त हो गया';

  @override
  String minutesLeft(int minutes) {
    return '$minutesमिनट शेष';
  }

  @override
  String get workspaceFiles => 'कार्यक्षेत्र फ़ाइलें';

  @override
  String get personalAIAssistant => 'व्यक्तिगत AI सहायक';

  @override
  String sessionsCount(int count) {
    return 'सत्र ($count)';
  }

  @override
  String get noActiveSessions => 'कोई सक्रिय सत्र नहीं';

  @override
  String get startConversationToCreate => 'बनाने के लिए एक वार्तालाप शुरू करें';

  @override
  String get startConversationToSee =>
      'यहां सत्र देखने के लिए एक वार्तालाप शुरू करें';

  @override
  String get reset => 'रीसेट करें';

  @override
  String get cronJobs => 'निर्धारित कार्य';

  @override
  String get noCronJobs => 'कोई निर्धारित कार्य नहीं';

  @override
  String get addScheduledTasks => 'अपने एजेंट के लिए निर्धारित कार्य जोड़ें';

  @override
  String get runNow => 'अभी चलाएं';

  @override
  String get enable => 'सक्षम करें';

  @override
  String get disable => 'अक्षम करें';

  @override
  String get delete => 'हटाएं';

  @override
  String get skills => 'कौशल';

  @override
  String get browseClawHub => 'ClawHub ब्राउज़ करें';

  @override
  String get noSkillsInstalled => 'कोई कौशल इंस्टॉल नहीं';

  @override
  String get browseClawHubToAdd => 'कौशल जोड़ने के लिए ClawHub ब्राउज़ करें';

  @override
  String removeSkillConfirm(String name) {
    return '\"$name\" को अपने कौशल से हटाएं?';
  }

  @override
  String get clawHubSkills => 'ClawHub कौशल';

  @override
  String get searchSkills => 'कौशल खोजें...';

  @override
  String get noSkillsFound => 'कोई कौशल नहीं मिला। एक अलग खोज प्रयास करें।';

  @override
  String installedSkill(String name) {
    return '$name इंस्टॉल किया गया';
  }

  @override
  String failedToInstallSkill(String name) {
    return '$name को इंस्टॉल करने में विफल';
  }

  @override
  String get addCronJob => 'निर्धारित कार्य जोड़ें';

  @override
  String get jobName => 'कार्य नाम';

  @override
  String get dailySummaryExample => 'उदा. दैनिक सारांश';

  @override
  String get taskPrompt => 'कार्य संकेत';

  @override
  String get whatShouldAgentDo => 'एजेंट को क्या करना चाहिए?';

  @override
  String get interval => 'अंतराल';

  @override
  String get every5Minutes => 'हर 5 मिनट';

  @override
  String get every15Minutes => 'हर 15 मिनट';

  @override
  String get every30Minutes => 'हर 30 मिनट';

  @override
  String get everyHour => 'हर घंटे';

  @override
  String get every6Hours => 'हर 6 घंटे';

  @override
  String get every12Hours => 'हर 12 घंटे';

  @override
  String get every24Hours => 'हर 24 घंटे';

  @override
  String get add => 'जोड़ें';

  @override
  String get save => 'सहेजें';

  @override
  String get sessions => 'सत्र';

  @override
  String messagesCount(int count) {
    return '$count संदेश';
  }

  @override
  String tokensCount(int count) {
    return '$count टोकन';
  }

  @override
  String get compact => 'संक्षिप्त करें';

  @override
  String get models => 'मॉडल';

  @override
  String get noModelsConfigured => 'कोई मॉडल कॉन्फ़िगर नहीं किया गया';

  @override
  String get addModelToStartChatting => 'चैट शुरू करने के लिए एक मॉडल जोड़ें';

  @override
  String get addModel => 'मॉडल जोड़ें';

  @override
  String get default_ => 'डिफ़ॉल्ट';

  @override
  String get autoStart => 'स्वचालित प्रारंभ';

  @override
  String get startGatewayWhenLaunches => 'ऐप शुरू होने पर गेटवे शुरू करें';

  @override
  String get heartbeat => 'हार्टबीट';

  @override
  String get enabled => 'सक्षम';

  @override
  String get periodicAgentTasks => 'HEARTBEAT.md से आवधिक एजेंट कार्य';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String get about => 'के बारे में';

  @override
  String get personalAIAssistantForIOS =>
      'iOS और Android के लिए व्यक्तिगत AI सहायक';

  @override
  String get version => 'संस्करण';

  @override
  String get basedOnOpenClaw => 'OpenClaw पर आधारित';

  @override
  String get removeModel => 'मॉडल हटाएं?';

  @override
  String removeModelConfirm(String name) {
    return '\"$name\" को अपने मॉडल से हटाएं?';
  }

  @override
  String get remove => 'हटाएं';

  @override
  String get setAsDefault => 'डिफ़ॉल्ट के रूप में सेट करें';

  @override
  String get paste => 'पेस्ट करें';

  @override
  String get chooseProviderStep => '1. प्रदाता चुनें';

  @override
  String get selectModelStep => '2. मॉडल चुनें';

  @override
  String get apiKeyStep => '3. API कुंजी';

  @override
  String getApiKeyAt(String provider) {
    return '$provider पर API कुंजी प्राप्त करें';
  }

  @override
  String get justNow => 'अभी-अभी';

  @override
  String minutesAgo(int minutes) {
    return '$minutesमिनट पहले';
  }

  @override
  String hoursAgo(int hours) {
    return '$hoursघंटे पहले';
  }

  @override
  String daysAgo(int days) {
    return '$daysदिन पहले';
  }

  @override
  String get microphonePermissionDenied => 'माइक्रोफ़ोन अनुमति अस्वीकृत';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'लाइव ट्रांसक्रिप्शन उपलब्ध नहीं: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'रिकॉर्डिंग शुरू करने में विफल: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'डिवाइस ट्रांसक्रिप्शन का उपयोग कर रहे हैं';

  @override
  String get transcribingWithWhisper =>
      'Whisper API के साथ ट्रांसक्राइब कर रहे हैं...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API विफल: $error';
  }

  @override
  String get noTranscriptionCaptured =>
      'कोई ट्रांसक्रिप्शन कैप्चर नहीं किया गया';

  @override
  String failedToStopRecording(String error) {
    return 'रिकॉर्डिंग रोकने में विफल: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return '$action विफल: $error';
  }

  @override
  String get pause => 'रोकें';

  @override
  String get resume => 'फिर शुरू करें';

  @override
  String get send => 'भेजें';

  @override
  String get liveActivityActive => 'लाइव एक्टिविटी सक्रिय';

  @override
  String get restartGateway => 'गेटवे पुनः आरंभ करें';

  @override
  String modelLabel(String model) {
    return 'मॉडल: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'अपटाइम: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: बैकग्राउंड समर्थन सक्रिय - गेटवे प्रतिक्रिया देना जारी रख सकता है';

  @override
  String get webChatBuiltIn => 'अंतर्निहित चैट इंटरफ़ेस';

  @override
  String get configure => 'कॉन्फ़िगर करें';

  @override
  String get disconnect => 'डिस्कनेक्ट';

  @override
  String get agents => 'एजेंट्स';

  @override
  String get agentFiles => 'एजेंट फ़ाइलें';

  @override
  String get createAgent => 'एजेंट बनाएं';

  @override
  String get editAgent => 'एजेंट संपादित करें';

  @override
  String get noAgentsYet => 'अभी तक कोई एजेंट नहीं';

  @override
  String get createYourFirstAgent => 'अपना पहला एजेंट बनाएं!';

  @override
  String get active => 'सक्रिय';

  @override
  String get agentName => 'एजेंट का नाम';

  @override
  String get emoji => 'इमोजी';

  @override
  String get selectEmoji => 'इमोजी चुनें';

  @override
  String get vibe => 'वाइब';

  @override
  String get vibeHint => 'उदा., मैत्रीपूर्ण, औपचारिक, व्यंग्यात्मक';

  @override
  String get modelConfiguration => 'मॉडल कॉन्फ़िगरेशन';

  @override
  String get advancedSettings => 'उन्नत सेटिंग्स';

  @override
  String get agentCreated => 'एजेंट बनाया गया';

  @override
  String get agentUpdated => 'एजेंट अपडेट किया गया';

  @override
  String get agentDeleted => 'एजेंट हटाया गया';

  @override
  String switchedToAgent(String name) {
    return '$name पर स्विच किया गया';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$name को हटाएं? इससे सभी कार्यक्षेत्र डेटा हटा दिया जाएगा।';
  }

  @override
  String get agentDetails => 'एजेंट विवरण';

  @override
  String get createdAt => 'बनाया गया';

  @override
  String get lastUsed => 'अंतिम उपयोग';

  @override
  String get basicInformation => 'बुनियादी जानकारी';

  @override
  String get switchToAgent => 'एजेंट बदलें';

  @override
  String get providers => 'प्रदाता';

  @override
  String get addProvider => 'प्रदाता जोड़ें';

  @override
  String get noProvidersConfigured => 'कोई प्रदाता कॉन्फ़िगर नहीं किया गया।';

  @override
  String get editCredentials => 'क्रेडेंशियल संपादित करें';

  @override
  String get defaultModelHint =>
      'डिफ़ॉल्ट मॉडल उन एजेंटों द्वारा उपयोग किया जाता है जो अपना खुद का निर्दिष्ट नहीं करते।';

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
  String get firstHatchModeChoiceTitle => 'आप कैसे शुरू करना चाहेंगे?';

  @override
  String get firstHatchModeChoiceBody =>
      'आप अपने सहायक से टेक्स्ट चैट कर सकते हैं या छोटी कॉल जैसी आवाज़ वाली बातचीत शुरू कर सकते हैं। जो आपको आसान लगे वह चुनें।';

  @override
  String get firstHatchModeChoiceChatButton => 'चैट में लिखें';

  @override
  String get firstHatchModeChoiceVoiceButton => 'आवाज़ से बात करें';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault =>
      'डिफ़ॉल्ट के रूप में सेट करने के लिए दबाकर रखें';

  @override
  String get integrations => 'इंटीग्रेशन';

  @override
  String get shortcutsIntegrations => 'Shortcuts इंटीग्रेशन';

  @override
  String get shortcutsIntegrationsDesc =>
      'थर्ड-पार्टी ऐप एक्शन चलाने के लिए iOS Shortcuts इंस्टॉल करें';

  @override
  String get dangerZone => 'खतरनाक क्षेत्र';

  @override
  String get resetOnboarding => 'ऑनबोर्डिंग रीसेट करें और फिर से चलाएं';

  @override
  String get resetOnboardingDesc =>
      'सभी कॉन्फ़िगरेशन हटा देता है और सेटअप विज़ार्ड पर लौटता है।';

  @override
  String get resetAllConfiguration => 'सभी कॉन्फ़िगरेशन रीसेट करें?';

  @override
  String get resetAllConfigurationDesc =>
      'इससे आपकी API कुंजियां, मॉडल और सभी सेटिंग्स हटा दी जाएंगी। ऐप सेटअप विज़ार्ड पर लौट जाएगा।\n\nआपका वार्तालाप इतिहास हटाया नहीं जाता।';

  @override
  String get removeProvider => 'प्रदाता हटाएं';

  @override
  String removeProviderConfirm(String provider) {
    return '$provider के क्रेडेंशियल हटाएं?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name डिफ़ॉल्ट मॉडल के रूप में सेट किया गया';
  }

  @override
  String get photoImage => 'फोटो / छवि';

  @override
  String get documentPdfTxt => 'दस्तावेज़ (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'दस्तावेज़ नहीं खोल सका: $error';
  }

  @override
  String get retry => 'पुनः प्रयास';

  @override
  String get gatewayStopped => 'गेटवे रोका गया';

  @override
  String get gatewayStarted => 'गेटवे सफलतापूर्वक शुरू हुआ!';

  @override
  String gatewayFailed(String error) {
    return 'गेटवे विफल: $error';
  }

  @override
  String exceptionError(String error) {
    return 'अपवाद: $error';
  }

  @override
  String get pairingRequestApproved => 'पेयरिंग अनुरोध स्वीकृत';

  @override
  String get pairingRequestRejected => 'पेयरिंग अनुरोध अस्वीकृत';

  @override
  String get addDevice => 'डिवाइस जोड़ें';

  @override
  String get telegramConfigSaved => 'Telegram कॉन्फ़िगरेशन सहेजा गया';

  @override
  String get discordConfigSaved => 'Discord कॉन्फ़िगरेशन सहेजा गया';

  @override
  String get securityMethod => 'सुरक्षा विधि';

  @override
  String get pairingRecommended => 'पेयरिंग (अनुशंसित)';

  @override
  String get pairingDescription =>
      'नए उपयोगकर्ताओं को पेयरिंग कोड मिलता है। आप उन्हें स्वीकृत या अस्वीकार करते हैं।';

  @override
  String get allowlistTitle => 'अनुमति सूची';

  @override
  String get allowlistDescription =>
      'केवल विशिष्ट उपयोगकर्ता ID बॉट का उपयोग कर सकते हैं।';

  @override
  String get openAccess => 'खुली पहुंच';

  @override
  String get openAccessDescription =>
      'कोई भी तुरंत बॉट का उपयोग कर सकता है (अनुशंसित नहीं)।';

  @override
  String get disabledAccess => 'अक्षम';

  @override
  String get disabledAccessDescription =>
      'कोई DM अनुमत नहीं। बॉट किसी भी संदेश का जवाब नहीं देगा।';

  @override
  String get approvedDevices => 'स्वीकृत डिवाइस';

  @override
  String get noApprovedDevicesYet => 'अभी तक कोई स्वीकृत डिवाइस नहीं';

  @override
  String get devicesAppearAfterApproval =>
      'पेयरिंग अनुरोध स्वीकृत करने के बाद डिवाइस यहां दिखाई देंगे';

  @override
  String get noAllowedUsersConfigured => 'कोई अनुमत उपयोगकर्ता कॉन्फ़िगर नहीं';

  @override
  String get addUserIdsHint =>
      'बॉट का उपयोग करने की अनुमति देने के लिए उपयोगकर्ता ID जोड़ें';

  @override
  String get removeDevice => 'डिवाइस हटाएं?';

  @override
  String removeAccessFor(String name) {
    return '$name के लिए पहुंच हटाएं?';
  }

  @override
  String get saving => 'सहेज रहा है...';

  @override
  String get channelsLabel => 'चैनल';

  @override
  String get clawHubAccount => 'ClawHub खाता';

  @override
  String get loggedInToClawHub => 'आप वर्तमान में ClawHub में लॉग इन हैं।';

  @override
  String get loggedOutFromClawHub => 'ClawHub से लॉग आउट किया गया';

  @override
  String get login => 'लॉग इन';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get connect => 'कनेक्ट करें';

  @override
  String get pasteClawHubToken => 'अपना ClawHub API टोकन पेस्ट करें';

  @override
  String get pleaseEnterApiToken => 'कृपया एक API टोकन दर्ज करें';

  @override
  String get successfullyConnected => 'ClawHub से सफलतापूर्वक कनेक्ट हो गया';

  @override
  String get browseSkillsButton => 'कौशल ब्राउज़ करें';

  @override
  String get installSkill => 'कौशल इंस्टॉल करें';

  @override
  String get incompatibleSkill => 'असंगत कौशल';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'यह कौशल मोबाइल (iOS/Android) पर नहीं चल सकता।\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'संगतता चेतावनी';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'यह कौशल डेस्कटॉप के लिए डिज़ाइन किया गया था और मोबाइल पर काम नहीं कर सकता।\n\n$reason\n\nक्या आप मोबाइल के लिए अनुकूलित संस्करण इंस्टॉल करना चाहेंगे?';
  }

  @override
  String get ok => 'ठीक है';

  @override
  String get installOriginal => 'मूल इंस्टॉल करें';

  @override
  String get installAdapted => 'अनुकूलित इंस्टॉल करें';

  @override
  String get resetSession => 'सत्र रीसेट करें';

  @override
  String resetSessionConfirm(String key) {
    return 'सत्र \"$key\" रीसेट करें? इससे सभी संदेश हटा दिए जाएंगे।';
  }

  @override
  String get sessionReset => 'सत्र रीसेट किया गया';

  @override
  String get activeSessions => 'सक्रिय सत्र';

  @override
  String get scheduledTasks => 'निर्धारित कार्य';

  @override
  String get defaultBadge => 'डिफ़ॉल्ट';

  @override
  String errorGeneric(String error) {
    return 'त्रुटि: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName सहेजा गया';
  }

  @override
  String errorSavingFile(String error) {
    return 'फ़ाइल सहेजने में त्रुटि: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'अंतिम एजेंट को हटा नहीं सकते';

  @override
  String get close => 'बंद करें';

  @override
  String get nameIsRequired => 'नाम आवश्यक है';

  @override
  String get pleaseSelectModel => 'कृपया एक मॉडल चुनें';

  @override
  String temperatureLabel(String value) {
    return 'तापमान: $value';
  }

  @override
  String get maxTokens => 'अधिकतम टोकन';

  @override
  String get maxTokensRequired => 'अधिकतम टोकन आवश्यक है';

  @override
  String get mustBePositiveNumber => 'एक सकारात्मक संख्या होनी चाहिए';

  @override
  String get maxToolIterations => 'अधिकतम टूल पुनरावृत्तियां';

  @override
  String get maxIterationsRequired => 'अधिकतम पुनरावृत्तियां आवश्यक हैं';

  @override
  String get restrictToWorkspace => 'कार्यक्षेत्र तक सीमित करें';

  @override
  String get restrictToWorkspaceDesc =>
      'फ़ाइल संचालन को एजेंट कार्यक्षेत्र तक सीमित करें';

  @override
  String get noModelsConfiguredLong =>
      'कृपया एजेंट बनाने से पहले सेटिंग्स में कम से कम एक मॉडल जोड़ें।';

  @override
  String get selectProviderFirst => 'पहले एक प्रदाता चुनें';

  @override
  String get skip => 'छोड़ें';

  @override
  String get continueButton => 'जारी रखें';

  @override
  String get uiAutomation => 'UI ऑटोमेशन';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw आपकी ओर से आपकी स्क्रीन को नियंत्रित कर सकता है — बटन टैप करना, फ़ॉर्म भरना, स्क्रॉल करना, और किसी भी ऐप में दोहराए जाने वाले कार्यों को स्वचालित करना।';

  @override
  String get uiAutomationAccessibilityNote =>
      'इसके लिए Android सेटिंग्स में एक्सेसिबिलिटी सर्विस को सक्षम करना आवश्यक है। आप इसे छोड़ सकते हैं और बाद में सक्षम कर सकते हैं।';

  @override
  String get openAccessibilitySettings => 'एक्सेसिबिलिटी सेटिंग्स खोलें';

  @override
  String get skipForNow => 'अभी के लिए छोड़ें';

  @override
  String get checkingPermission => 'अनुमति जांच रहा है…';

  @override
  String get accessibilityEnabled => 'एक्सेसिबिलिटी सर्विस सक्षम है';

  @override
  String get accessibilityNotEnabled => 'एक्सेसिबिलिटी सर्विस सक्षम नहीं है';

  @override
  String get exploreIntegrations => 'इंटीग्रेशन एक्सप्लोर करें';

  @override
  String get requestTimedOut => 'अनुरोध का समय समाप्त हो गया';

  @override
  String get myShortcuts => 'मेरे शॉर्टकट';

  @override
  String get addShortcut => 'शॉर्टकट जोड़ें';

  @override
  String get noShortcutsYet => 'अभी तक कोई शॉर्टकट नहीं';

  @override
  String get shortcutsInstructions =>
      'iOS Shortcuts ऐप में एक शॉर्टकट बनाएं, अंत में कॉलबैक एक्शन जोड़ें, फिर इसे यहां रजिस्टर करें ताकि AI इसे चला सके।';

  @override
  String get shortcutName => 'शॉर्टकट का नाम';

  @override
  String get shortcutNameHint => 'Shortcuts ऐप में सटीक नाम';

  @override
  String get descriptionOptional => 'विवरण (वैकल्पिक)';

  @override
  String get whatDoesShortcutDo => 'यह शॉर्टकट क्या करता है?';

  @override
  String get callbackSetup => 'कॉलबैक सेटअप';

  @override
  String get callbackInstructions =>
      'प्रत्येक शॉर्टकट का अंत इसके साथ होना चाहिए:\n① Get Value for Key → \"callbackUrl\" (Shortcut Input से dict के रूप में पार्स किया गया)\n② Open URLs ← ① का आउटपुट';

  @override
  String get channelApp => 'ऐप';

  @override
  String get channelHeartbeat => 'हार्टबीट';

  @override
  String get channelCron => 'क्रॉन';

  @override
  String get channelSubagent => 'सबएजेंट';

  @override
  String get channelSystem => 'सिस्टम';

  @override
  String secondsAgo(int seconds) {
    return '$secondsसेकंड पहले';
  }

  @override
  String get messagesAbbrev => 'संदेश';

  @override
  String get modelAlreadyAdded => 'यह मॉडल पहले से आपकी सूची में है';

  @override
  String get bothTokensRequired => 'दोनों टोकन आवश्यक हैं';

  @override
  String get slackSavedRestart =>
      'Slack सहेजा गया — कनेक्ट करने के लिए गेटवे को पुनः आरंभ करें';

  @override
  String get slackConfiguration => 'Slack कॉन्फ़िगरेशन';

  @override
  String get setupTitle => 'सेटअप';

  @override
  String get slackSetupInstructions =>
      '1. api.slack.com/apps पर एक Slack ऐप बनाएं\n2. Socket Mode सक्षम करें → App-Level Token (xapp-…) जनरेट करें\n   स्कोप के साथ: connections:write\n3. Bot Token Scopes जोड़ें: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. वर्कस्पेस में ऐप इंस्टॉल करें → Bot Token (xoxb-…) कॉपी करें';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'API URL और फ़ोन नंबर आवश्यक हैं';

  @override
  String get signalSavedRestart =>
      'Signal सहेजा गया — कनेक्ट करने के लिए गेटवे को पुनः आरंभ करें';

  @override
  String get signalConfiguration => 'Signal कॉन्फ़िगरेशन';

  @override
  String get requirementsTitle => 'आवश्यकताएं';

  @override
  String get signalRequirements =>
      'सर्वर पर signal-cli-rest-api चलाना आवश्यक है:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nREST API के माध्यम से अपना Signal नंबर रजिस्टर/लिंक करें, फिर नीचे URL और अपना फ़ोन नंबर दर्ज करें।';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL';

  @override
  String get signalPhoneNumber => 'आपका Signal फ़ोन नंबर';

  @override
  String get userIdLabel => 'उपयोगकर्ता ID';

  @override
  String get enterDiscordUserId => 'Discord उपयोगकर्ता ID दर्ज करें';

  @override
  String get enterTelegramUserId => 'Telegram उपयोगकर्ता ID दर्ज करें';

  @override
  String get fromDiscordDevPortal => 'Discord Developer Portal से';

  @override
  String get allowedUserIdsTitle => 'अनुमत उपयोगकर्ता ID';

  @override
  String get approvedDevice => 'स्वीकृत डिवाइस';

  @override
  String get allowedUser => 'अनुमत उपयोगकर्ता';

  @override
  String get howToGetBotToken => 'अपना बॉट टोकन कैसे प्राप्त करें';

  @override
  String get discordTokenInstructions =>
      '1. Discord Developer Portal पर जाएं\n2. एक नया एप्लिकेशन और बॉट बनाएं\n3. टोकन कॉपी करें और ऊपर पेस्ट करें\n4. Message Content Intent सक्षम करें';

  @override
  String get telegramTokenInstructions =>
      '1. Telegram खोलें और @BotFather खोजें\n2. /newbot भेजें और निर्देशों का पालन करें\n3. टोकन कॉपी करें और ऊपर पेस्ट करें';

  @override
  String get fromBotFatherHint => '@BotFather से प्राप्त करें';

  @override
  String get accessTokenLabel => 'एक्सेस टोकन';

  @override
  String get notSetOpenAccess => 'सेट नहीं — खुली पहुंच (केवल loopback)';

  @override
  String get gatewayAccessToken => 'गेटवे एक्सेस टोकन';

  @override
  String get tokenFieldLabel => 'टोकन';

  @override
  String get leaveEmptyDisableAuth =>
      'प्रमाणीकरण अक्षम करने के लिए खाली छोड़ें';

  @override
  String get toolPolicies => 'टूल नीतियां';

  @override
  String get toolPoliciesDesc =>
      'नियंत्रित करें कि एजेंट क्या एक्सेस कर सकता है। अक्षम टूल AI से छिपे हुए हैं और रनटाइम पर अवरुद्ध हैं।';

  @override
  String get privacySensors => 'गोपनीयता और सेंसर';

  @override
  String get networkCategory => 'नेटवर्क';

  @override
  String get systemCategory => 'सिस्टम';

  @override
  String get toolTakePhotos => 'फोटो लें';

  @override
  String get toolTakePhotosDesc =>
      'एजेंट को कैमरा उपयोग करके फोटो लेने की अनुमति दें';

  @override
  String get toolRecordVideo => 'वीडियो रिकॉर्ड करें';

  @override
  String get toolRecordVideoDesc =>
      'एजेंट को वीडियो रिकॉर्ड करने की अनुमति दें';

  @override
  String get toolLocation => 'स्थान';

  @override
  String get toolLocationDesc =>
      'एजेंट को आपका वर्तमान GPS स्थान पढ़ने की अनुमति दें';

  @override
  String get toolHealthData => 'स्वास्थ्य डेटा';

  @override
  String get toolHealthDataDesc =>
      'एजेंट को स्वास्थ्य/फिटनेस डेटा पढ़ने की अनुमति दें';

  @override
  String get toolContacts => 'संपर्क';

  @override
  String get toolContactsDesc =>
      'एजेंट को आपके संपर्कों को खोजने की अनुमति दें';

  @override
  String get toolScreenshots => 'स्क्रीनशॉट';

  @override
  String get toolScreenshotsDesc =>
      'एजेंट को स्क्रीन के स्क्रीनशॉट लेने की अनुमति दें';

  @override
  String get toolWebFetch => 'वेब फेच';

  @override
  String get toolWebFetchDesc =>
      'एजेंट को URL से सामग्री प्राप्त करने की अनुमति दें';

  @override
  String get toolWebSearch => 'वेब खोज';

  @override
  String get toolWebSearchDesc => 'एजेंट को वेब खोज करने की अनुमति दें';

  @override
  String get toolHttpRequests => 'HTTP अनुरोध';

  @override
  String get toolHttpRequestsDesc =>
      'एजेंट को मनमाने HTTP अनुरोध करने की अनुमति दें';

  @override
  String get toolSandboxShell => 'सैंडबॉक्स शेल';

  @override
  String get toolSandboxShellDesc =>
      'एजेंट को सैंडबॉक्स में शेल कमांड चलाने की अनुमति दें';

  @override
  String get toolImageGeneration => 'छवि निर्माण';

  @override
  String get toolImageGenerationDesc =>
      'एजेंट को AI के माध्यम से छवियां उत्पन्न करने की अनुमति दें';

  @override
  String get toolLaunchApps => 'ऐप लॉन्च करें';

  @override
  String get toolLaunchAppsDesc =>
      'एजेंट को इंस्टॉल किए गए ऐप खोलने की अनुमति दें';

  @override
  String get toolLaunchIntents => 'इंटेंट लॉन्च करें';

  @override
  String get toolLaunchIntentsDesc =>
      'एजेंट को Android इंटेंट चलाने की अनुमति दें (डीप लिंक, सिस्टम स्क्रीन)';

  @override
  String get renameSession => 'सत्र का नाम बदलें';

  @override
  String get myConversationName => 'मेरी बातचीत का नाम';

  @override
  String get renameAction => 'नाम बदलें';

  @override
  String get couldNotTranscribeAudio => 'ऑडियो ट्रांसक्राइब नहीं कर सका';

  @override
  String get stopRecording => 'रिकॉर्डिंग रोकें';

  @override
  String get voiceInput => 'वॉयस इनपुट';

  @override
  String get speakMessage => 'बोलें';

  @override
  String get stopSpeaking => 'बोलना बंद करें';

  @override
  String get selectText => 'टेक्स्ट चुनें';

  @override
  String get messageCopied => 'संदेश कॉपी किया गया';

  @override
  String get copyTooltip => 'कॉपी करें';

  @override
  String get commandsTooltip => 'कमांड';

  @override
  String get providersAndModels => 'प्रदाता और मॉडल';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मॉडल कॉन्फ़िगर किए गए',
      one: '1 मॉडल कॉन्फ़िगर किया गया',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'स्वचालित-प्रारंभ सक्षम';

  @override
  String get autoStartOffLabel => 'स्वचालित-प्रारंभ बंद';

  @override
  String get allToolsEnabled => 'सभी टूल सक्षम';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count टूल अक्षम',
      one: '1 टूल अक्षम',
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
  String get officialWebsite => 'आधिकारिक वेबसाइट';

  @override
  String get noPendingPairingRequests => 'कोई लंबित पेयरिंग अनुरोध नहीं';

  @override
  String get pairingRequestsTitle => 'पेयरिंग अनुरोध';

  @override
  String get gatewayStartingStatus => 'गेटवे शुरू हो रहा है...';

  @override
  String get gatewayRetryingStatus =>
      'गेटवे प्रारंभ फिर से प्रयास कर रहा है...';

  @override
  String get errorStartingGateway => 'गेटवे शुरू करने में त्रुटि';

  @override
  String get runningStatus => 'चल रहा है';

  @override
  String get stoppedStatus => 'रुका हुआ';

  @override
  String get notSetUpStatus => 'सेट अप नहीं किया गया';

  @override
  String get configuredStatus => 'कॉन्फ़िगर किया गया';

  @override
  String get whatsAppConfigSaved => 'WhatsApp कॉन्फ़िगरेशन सहेजा गया';

  @override
  String get whatsAppDisconnected => 'WhatsApp डिस्कनेक्ट हो गया';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'लागू हो रहा है...';

  @override
  String get reconnectWhatsApp => 'WhatsApp को फिर से कनेक्ट करें';

  @override
  String get saveSettingsLabel => 'सेटिंग्स सहेजें';

  @override
  String get applySettingsRestart => 'सेटिंग्स लागू करें और पुनः आरंभ करें';

  @override
  String get whatsAppMode => 'WhatsApp मोड';

  @override
  String get myPersonalNumber => 'मेरा व्यक्तिगत नंबर';

  @override
  String get myPersonalNumberDesc =>
      'आप अपनी WhatsApp चैट को भेजे गए संदेश एजेंट को जगाते हैं।';

  @override
  String get dedicatedBotAccount => 'समर्पित बॉट खाता';

  @override
  String get dedicatedBotAccountDesc =>
      'लिंक किए गए खाते से ही भेजे गए संदेशों को आउटबाउंड के रूप में अनदेखा किया जाता है।';

  @override
  String get allowedNumbers => 'अनुमत नंबर';

  @override
  String get addNumberTitle => 'नंबर जोड़ें';

  @override
  String get phoneNumberJid => 'फोन नंबर / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'कोई अनुमत नंबर कॉन्फ़िगर नहीं किया गया';

  @override
  String get devicesAppearAfterPairing =>
      'पेयरिंग अनुरोधों को स्वीकृत करने के बाद डिवाइस यहां दिखाई देते हैं';

  @override
  String get addPhoneNumbersHint =>
      'बॉट का उपयोग करने की अनुमति देने के लिए फोन नंबर जोड़ें';

  @override
  String get allowedNumber => 'अनुमत नंबर';

  @override
  String get howToConnect => 'कनेक्ट कैसे करें';

  @override
  String get whatsAppConnectInstructions =>
      '1. ऊपर \"WhatsApp कनेक्ट करें\" पर टैप करें\n2. एक QR कोड दिखाई देगा — इसे WhatsApp से स्कैन करें\n   (सेटिंग्स → लिंक किए गए डिवाइस → डिवाइस लिंक करें)\n3. एक बार कनेक्ट होने पर, आने वाले संदेश स्वचालित रूप से\n   आपके सक्रिय AI एजेंट को रूट किए जाते हैं';

  @override
  String get whatsAppPairingDesc =>
      'नए प्रेषकों को पेयरिंग कोड मिलता है। आप उन्हें स्वीकृत करते हैं।';

  @override
  String get whatsAppAllowlistDesc =>
      'केवल विशिष्ट फोन नंबर बॉट को संदेश भेज सकते हैं।';

  @override
  String get whatsAppOpenDesc =>
      'जो कोई भी आपको संदेश भेजता है वह बॉट का उपयोग कर सकता है।';

  @override
  String get whatsAppDisabledDesc =>
      'बॉट किसी भी आने वाले संदेश का जवाब नहीं देगा।';

  @override
  String get sessionExpiredRelink =>
      'सत्र समाप्त हो गया। नया QR कोड स्कैन करने के लिए नीचे \"पुनः कनेक्ट करें\" पर टैप करें।';

  @override
  String get connectWhatsAppBelow =>
      'अपने खाते को लिंक करने के लिए नीचे \"WhatsApp कनेक्ट करें\" पर टैप करें।';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp ने QR स्वीकार कर लिया। लिंक को अंतिम रूप दे रहा है...';

  @override
  String get waitingForWhatsApp =>
      'WhatsApp द्वारा लिंक पूरा करने की प्रतीक्षा कर रहा है...';

  @override
  String get focusedLabel => 'केंद्रित';

  @override
  String get balancedLabel => 'संतुलित';

  @override
  String get creativeLabel => 'रचनात्मक';

  @override
  String get preciseLabel => 'सटीक';

  @override
  String get expressiveLabel => 'अभिव्यंजक';

  @override
  String get browseLabel => 'ब्राउज़ करें';

  @override
  String get apiTokenLabel => 'API टोकन';

  @override
  String get connectToClawHub => 'ClawHub से कनेक्ट करें';

  @override
  String get clawHubLoginHint =>
      'प्रीमियम कौशल एक्सेस करने और पैकेज इंस्टॉल करने के लिए ClawHub में लॉग इन करें';

  @override
  String get howToGetApiToken => 'अपना API टोकन कैसे प्राप्त करें:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. clawhub.ai पर जाएं और GitHub से लॉग इन करें\n2. टर्मिनल में \"clawhub login\" चलाएं\n3. अपना टोकन कॉपी करें और यहां पेस्ट करें';

  @override
  String connectionFailed(String error) {
    return 'कनेक्शन विफल: $error';
  }

  @override
  String cronJobRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रन',
      one: '1 रन',
    );
    return '$_temp0';
  }

  @override
  String nextRunLabel(String time) {
    return 'अगली रन: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'अंतिम त्रुटि: $error';
  }

  @override
  String get cronJobHintText => 'जब यह जॉब फायर हो तो एजेंट के लिए निर्देश…';

  @override
  String get androidPermissions => 'Android अनुमतियां';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw आपकी ओर से आपकी स्क्रीन को नियंत्रित कर सकता है — बटन टैप करना, फॉर्म भरना, स्क्रॉल करना, और किसी भी ऐप में दोहराए जाने वाले कार्यों को स्वचालित करना।';

  @override
  String get twoPermissionsNeeded =>
      'पूर्ण अनुभव के लिए दो अनुमतियां आवश्यक हैं। आप इसे छोड़ सकते हैं और बाद में सेटिंग्स में सक्षम कर सकते हैं।';

  @override
  String get accessibilityService => 'एक्सेसिबिलिटी सर्विस';

  @override
  String get accessibilityServiceDesc =>
      'टैप करने, स्वाइप करने, टाइप करने और स्क्रीन सामग्री पढ़ने की अनुमति देता है';

  @override
  String get displayOverOtherApps => 'अन्य ऐप्स के ऊपर प्रदर्शित करें';

  @override
  String get displayOverOtherAppsDesc =>
      'एक फ्लोटिंग स्टेटस चिप दिखाता है ताकि आप देख सकें कि एजेंट क्या कर रहा है';

  @override
  String get changeDefaultModel => 'डिफ़ॉल्ट मॉडल बदलें';

  @override
  String setModelAsDefault(String name) {
    return '$name को डिफ़ॉल्ट मॉडल के रूप में सेट करें।';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count एजेंट',
      one: '1 एजेंट',
    );
    return '$_temp0 भी अपडेट करें';
  }

  @override
  String get startNewSessions => 'नए सत्र शुरू करें';

  @override
  String get currentConversationsArchived =>
      'वर्तमान वार्तालाप संग्रहीत किए जाएंगे';

  @override
  String get applyAction => 'लागू करें';

  @override
  String applyModelQuestion(String name) {
    return '$name लागू करें?';
  }

  @override
  String get setAsDefaultModel => 'डिफ़ॉल्ट मॉडल के रूप में सेट करें';

  @override
  String get usedByAgentsWithout =>
      'विशिष्ट मॉडल के बिना एजेंटों द्वारा उपयोग किया जाता है';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count एजेंट',
      one: '1 एजेंट',
    );
    return '$_temp0 पर लागू करें';
  }

  @override
  String get providerAlreadyAuth =>
      'प्रदाता पहले से प्रमाणित है — API कुंजी की आवश्यकता नहीं।';

  @override
  String get selectFromList => 'सूची से चुनें';

  @override
  String get enterCustomModelId => 'कस्टम मॉडल ID दर्ज करें';

  @override
  String get removeSkillTitle => 'कौशल हटाएं?';

  @override
  String get browseClawHubToDiscover =>
      'कौशल खोजने और इंस्टॉल करने के लिए ClawHub ब्राउज़ करें';

  @override
  String get addDeviceTooltip => 'डिवाइस जोड़ें';

  @override
  String get addNumberTooltip => 'नंबर जोड़ें';

  @override
  String get searchSkillsHint => 'कौशल खोजें...';

  @override
  String get loginToClawHub => 'ClawHub में लॉग इन करें';

  @override
  String get accountTooltip => 'खाता';

  @override
  String get editAction => 'संपादित करें';

  @override
  String get setAsDefaultAction => 'डिफ़ॉल्ट के रूप में सेट करें';

  @override
  String get chooseProviderTitle => 'प्रदाता चुनें';

  @override
  String get apiKeyTitle => 'API कुंजी';

  @override
  String get slackConfigSaved =>
      'Slack सहेजा गया — कनेक्ट करने के लिए गेटवे को पुनः आरंभ करें';

  @override
  String get signalConfigSaved =>
      'Signal सहेजा गया — कनेक्ट करने के लिए गेटवे को पुनः आरंभ करें';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'डिवाइस जोड़ें';

  @override
  String get skipAction => 'छोड़ें';

  @override
  String get mcpServers => 'MCP सर्वर';

  @override
  String get noMcpServersConfigured => 'कोई MCP सर्वर कॉन्फ़िगर नहीं है';

  @override
  String get mcpServersEmptyHint =>
      'अपने एजेंट को GitHub, Notion, Slack, डेटाबेस और अन्य टूल्स तक पहुँच देने के लिए MCP सर्वर जोड़ें।';

  @override
  String get addMcpServer => 'MCP सर्वर जोड़ें';

  @override
  String get editMcpServer => 'MCP सर्वर संपादित करें';

  @override
  String get removeMcpServer => 'MCP सर्वर हटाएं';

  @override
  String removeMcpServerConfirm(String name) {
    return '\"$name\" हटाएं? इसके टूल्स अब उपलब्ध नहीं रहेंगे।';
  }

  @override
  String get mcpTransport => 'ट्रांसपोर्ट';

  @override
  String get testConnection => 'कनेक्शन टेस्ट करें';

  @override
  String get mcpServerNameLabel => 'सर्वर का नाम';

  @override
  String get mcpServerNameHint => 'जैसे GitHub, Notion, मेरा DB';

  @override
  String get mcpServerUrlLabel => 'सर्वर URL';

  @override
  String get mcpBearerTokenLabel => 'Bearer टोकन (वैकल्पिक)';

  @override
  String get mcpBearerTokenHint =>
      'यदि प्रमाणीकरण आवश्यक नहीं है तो खाली छोड़ें';

  @override
  String get mcpCommandLabel => 'कमांड';

  @override
  String get mcpArgumentsLabel => 'तर्क (स्पेस से अलग)';

  @override
  String get mcpEnvVarsLabel => 'पर्यावरण चर (KEY=VALUE, प्रति पंक्ति एक)';

  @override
  String get mcpStdioNotOnIos =>
      'iOS पर stdio उपलब्ध नहीं है। HTTP या SSE उपयोग करें।';

  @override
  String get connectedStatus => 'कनेक्टेड';

  @override
  String get mcpConnecting => 'कनेक्ट हो रहा है...';

  @override
  String get mcpConnectionError => 'कनेक्शन त्रुटि';

  @override
  String get mcpDisconnected => 'डिस्कनेक्टेड';

  @override
  String mcpToolsCount(int count) {
    return '$count टूल्स';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'ठीक — $count टूल्स मिले';
  }

  @override
  String get mcpTestOkNoTools => 'ठीक — कनेक्टेड (0 टूल्स)';

  @override
  String get mcpTestFailed => 'कनेक्शन विफल। सर्वर URL/टोकन जांचें।';

  @override
  String get mcpAddServer => 'सर्वर जोड़ें';

  @override
  String get mcpSaveChanges => 'बदलाव सहेजें';

  @override
  String get urlIsRequired => 'URL आवश्यक है';

  @override
  String get enterValidUrl => 'एक वैध URL दर्ज करें';

  @override
  String get commandIsRequired => 'कमांड आवश्यक है';

  @override
  String skillRemoved(String name) {
    return 'स्किल \"$name\" हटाई गई';
  }

  @override
  String get editFileContentHint => 'फ़ाइल सामग्री संपादित करें...';

  @override
  String get whatsAppPairSubtitle =>
      'QR कोड से अपना व्यक्तिगत WhatsApp अकाउंट लिंक करें';

  @override
  String get whatsAppPairingOptional =>
      'लिंकिंग वैकल्पिक है। आप अभी ऑनबोर्डिंग पूरी कर सकते हैं और बाद में लिंक जोड़ सकते हैं।';

  @override
  String get whatsAppEnableToLink =>
      'इस डिवाइस को लिंक करने के लिए WhatsApp सक्षम करें।';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp लिंक हो गया। ऑनबोर्डिंग के बाद FlutterClaw जवाब दे सकेगा।';

  @override
  String get cancelLink => 'लिंक रद्द करें';
}
