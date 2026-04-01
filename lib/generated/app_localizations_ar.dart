// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'محادثة';

  @override
  String get channels => 'القنوات';

  @override
  String get agent => 'الوكيل';

  @override
  String get settings => 'الإعدادات';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get yourPersonalAssistant => 'مساعدك الشخصي بالذكاء الاصطناعي';

  @override
  String get multiChannelChat => 'محادثة متعددة القنوات';

  @override
  String get multiChannelChatDesc => 'Telegram و Discord و WebChat والمزيد';

  @override
  String get powerfulAIModels => 'نماذج ذكاء اصطناعي قوية';

  @override
  String get powerfulAIModelsDesc => 'OpenAI و Anthropic و Grok ونماذج مجانية';

  @override
  String get localGateway => 'بوابة محلية';

  @override
  String get localGatewayDesc => 'يعمل على جهازك، بياناتك تبقى ملكك';

  @override
  String get chooseProvider => 'اختر مزود الخدمة';

  @override
  String get selectProviderDesc =>
      'اختر كيف تريد الاتصال بنماذج الذكاء الاصطناعي.';

  @override
  String get startForFree => 'ابدأ مجاناً';

  @override
  String get freeProvidersDesc =>
      'يقدم هؤلاء المزودون نماذج مجانية للبدء بدون تكلفة.';

  @override
  String get free => 'مجاني';

  @override
  String get otherProviders => 'مزودو خدمة آخرون';

  @override
  String connectToProvider(String provider) {
    return 'الاتصال بـ $provider';
  }

  @override
  String get enterApiKeyDesc => 'أدخل مفتاح API الخاص بك واختر نموذجاً.';

  @override
  String get dontHaveApiKey => 'ليس لديك مفتاح API؟';

  @override
  String get createAccountCopyKey => 'أنشئ حساباً وانسخ مفتاحك.';

  @override
  String get signUp => 'تسجيل';

  @override
  String get apiKey => 'مفتاح API';

  @override
  String get pasteFromClipboard => 'لصق من الحافظة';

  @override
  String get apiBaseUrl => 'عنوان URL الأساسي لـ API';

  @override
  String get selectModel => 'اختر النموذج';

  @override
  String get modelId => 'معرف النموذج';

  @override
  String get validateKey => 'التحقق من المفتاح';

  @override
  String get validating => 'جارٍ التحقق...';

  @override
  String get invalidApiKey => 'مفتاح API غير صالح';

  @override
  String get gatewayConfiguration => 'إعداد البوابة';

  @override
  String get gatewayConfigDesc => 'البوابة هي مستوى التحكم المحلي لمساعدك.';

  @override
  String get defaultSettingsNote =>
      'الإعدادات الافتراضية تعمل لمعظم المستخدمين. قم بتغييرها فقط إذا كنت تعرف ما تحتاجه.';

  @override
  String get host => 'المضيف';

  @override
  String get port => 'المنفذ';

  @override
  String get autoStartGateway => 'تشغيل البوابة تلقائياً';

  @override
  String get autoStartGatewayDesc => 'تشغيل البوابة تلقائياً عند بدء التطبيق.';

  @override
  String get channelsPageTitle => 'القنوات';

  @override
  String get channelsPageDesc =>
      'اربط قنوات المراسلة اختيارياً. يمكنك دائماً إعدادها لاحقاً في الإعدادات.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'اربط بوت Telegram.';

  @override
  String get openBotFather => 'افتح BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'اربط بوت Discord.';

  @override
  String get developerPortal => 'بوابة المطور';

  @override
  String get botToken => 'رمز البوت';

  @override
  String telegramBotToken(String platform) {
    return 'رمز بوت $platform';
  }

  @override
  String get readyToGo => 'جاهز للبدء';

  @override
  String get reviewConfiguration => 'راجع إعداداتك وابدأ FlutterClaw.';

  @override
  String get model => 'النموذج';

  @override
  String viaProvider(String provider) {
    return 'عبر $provider';
  }

  @override
  String get gateway => 'البوابة';

  @override
  String get webChatOnly => 'WebChat فقط (يمكنك إضافة المزيد لاحقاً)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'جارٍ البدء...';

  @override
  String get startFlutterClaw => 'ابدأ FlutterClaw';

  @override
  String get newSession => 'جلسة جديدة';

  @override
  String get photoLibrary => 'مكتبة الصور';

  @override
  String get camera => 'الكاميرا';

  @override
  String get whatDoYouSeeInImage => 'ماذا ترى في هذه الصورة؟';

  @override
  String get imagePickerNotAvailable =>
      'منتقي الصور غير متاح على المحاكي. استخدم جهازاً حقيقياً.';

  @override
  String get couldNotOpenImagePicker => 'تعذر فتح منتقي الصور.';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get attachImage => 'إرفاق صورة';

  @override
  String get messageFlutterClaw => 'رسالة إلى FlutterClaw...';

  @override
  String get channelsAndGateway => 'القنوات والبوابة';

  @override
  String get stop => 'إيقاف';

  @override
  String get start => 'ابدأ';

  @override
  String status(String status) {
    return 'الحالة: $status';
  }

  @override
  String get builtInChatInterface => 'واجهة محادثة مدمجة';

  @override
  String get notConfigured => 'غير مُعد';

  @override
  String get connected => 'متصل';

  @override
  String get configuredStarting => 'مُعد (جارٍ البدء...)';

  @override
  String get telegramConfiguration => 'إعداد Telegram';

  @override
  String get fromBotFather => 'من @BotFather';

  @override
  String get allowedUserIds => 'معرفات المستخدمين المسموح بها (مفصولة بفواصل)';

  @override
  String get leaveEmptyToAllowAll => 'اتركه فارغاً للسماح للجميع';

  @override
  String get cancel => 'إلغاء';

  @override
  String get saveAndConnect => 'حفظ والاتصال';

  @override
  String get discordConfiguration => 'إعداد Discord';

  @override
  String get pendingPairingRequests => 'طلبات الاقتران المعلقة';

  @override
  String get approve => 'موافقة';

  @override
  String get reject => 'رفض';

  @override
  String get expired => 'منتهي الصلاحية';

  @override
  String minutesLeft(int minutes) {
    return '$minutes دقيقة متبقية';
  }

  @override
  String get workspaceFiles => 'ملفات مساحة العمل';

  @override
  String get personalAIAssistant => 'مساعد شخصي بالذكاء الاصطناعي';

  @override
  String sessionsCount(int count) {
    return 'الجلسات ($count)';
  }

  @override
  String get noActiveSessions => 'لا توجد جلسات نشطة';

  @override
  String get startConversationToCreate => 'ابدأ محادثة لإنشاء واحدة';

  @override
  String get startConversationToSee => 'ابدأ محادثة لرؤية الجلسات هنا';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get cronJobs => 'المهام المجدولة';

  @override
  String get noCronJobs => 'لا توجد مهام مجدولة';

  @override
  String get addScheduledTasks => 'أضف مهام مجدولة لوكيلك';

  @override
  String get runNow => 'تشغيل الآن';

  @override
  String get enable => 'تفعيل';

  @override
  String get disable => 'تعطيل';

  @override
  String get delete => 'حذف';

  @override
  String get skills => 'المهارات';

  @override
  String get browseClawHub => 'تصفح ClawHub';

  @override
  String get noSkillsInstalled => 'لم يتم تثبيت مهارات';

  @override
  String get browseClawHubToAdd => 'تصفح ClawHub لإضافة مهارات';

  @override
  String removeSkillConfirm(String name) {
    return 'إزالة \"$name\" من مهاراتك؟';
  }

  @override
  String get clawHubSkills => 'مهارات ClawHub';

  @override
  String get searchSkills => 'البحث عن مهارات...';

  @override
  String get noSkillsFound => 'لم يتم العثور على مهارات. جرب بحثاً مختلفاً.';

  @override
  String installedSkill(String name) {
    return 'تم تثبيت $name';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'فشل تثبيت $name';
  }

  @override
  String get addCronJob => 'إضافة مهمة مجدولة';

  @override
  String get jobName => 'اسم المهمة';

  @override
  String get dailySummaryExample => 'مثال: ملخص يومي';

  @override
  String get taskPrompt => 'تعليمات المهمة';

  @override
  String get whatShouldAgentDo => 'ماذا يجب أن يفعل الوكيل؟';

  @override
  String get interval => 'الفاصل الزمني';

  @override
  String get every5Minutes => 'كل 5 دقائق';

  @override
  String get every15Minutes => 'كل 15 دقيقة';

  @override
  String get every30Minutes => 'كل 30 دقيقة';

  @override
  String get everyHour => 'كل ساعة';

  @override
  String get every6Hours => 'كل 6 ساعات';

  @override
  String get every12Hours => 'كل 12 ساعة';

  @override
  String get every24Hours => 'كل 24 ساعة';

  @override
  String get add => 'إضافة';

  @override
  String get save => 'حفظ';

  @override
  String get sessions => 'الجلسات';

  @override
  String messagesCount(int count) {
    return '$count رسالة';
  }

  @override
  String tokensCount(int count) {
    return '$count رمز';
  }

  @override
  String get compact => 'ضغط';

  @override
  String get models => 'النماذج';

  @override
  String get noModelsConfigured => 'لم يتم إعداد نماذج';

  @override
  String get addModelToStartChatting => 'أضف نموذجاً لبدء المحادثة';

  @override
  String get addModel => 'إضافة نموذج';

  @override
  String get default_ => 'افتراضي';

  @override
  String get autoStart => 'بدء تلقائي';

  @override
  String get startGatewayWhenLaunches => 'بدء البوابة عند تشغيل التطبيق';

  @override
  String get heartbeat => 'نبض القلب';

  @override
  String get enabled => 'مُفعَّل';

  @override
  String get periodicAgentTasks => 'مهام الوكيل الدورية من HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get about => 'حول';

  @override
  String get personalAIAssistantForIOS =>
      'مساعد شخصي بالذكاء الاصطناعي لـ iOS و Android';

  @override
  String get version => 'الإصدار';

  @override
  String get basedOnOpenClaw => 'مبني على OpenClaw';

  @override
  String get removeModel => 'إزالة النموذج؟';

  @override
  String removeModelConfirm(String name) {
    return 'إزالة \"$name\" من نماذجك؟';
  }

  @override
  String get remove => 'إزالة';

  @override
  String get setAsDefault => 'تعيين كافتراضي';

  @override
  String get paste => 'لصق';

  @override
  String get chooseProviderStep => '1. اختيار المزود';

  @override
  String get selectModelStep => '2. اختيار النموذج';

  @override
  String get apiKeyStep => '3. مفتاح API';

  @override
  String getApiKeyAt(String provider) {
    return 'احصل على مفتاح API من $provider';
  }

  @override
  String get justNow => 'الآن';

  @override
  String minutesAgo(int minutes) {
    return 'منذ $minutes دقيقة';
  }

  @override
  String hoursAgo(int hours) {
    return 'منذ $hours ساعة';
  }

  @override
  String daysAgo(int days) {
    return 'منذ $days يوم';
  }

  @override
  String get microphonePermissionDenied => 'تم رفض إذن الميكروفون';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'النسخ المباشر غير متاح: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'فشل بدء التسجيل: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'استخدام النسخ على الجهاز';

  @override
  String get transcribingWithWhisper => 'النسخ باستخدام Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'فشل Whisper API: $error';
  }

  @override
  String get noTranscriptionCaptured => 'لم يتم التقاط نسخ';

  @override
  String failedToStopRecording(String error) {
    return 'فشل إيقاف التسجيل: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'فشل $action: $error';
  }

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get resume => 'استئناف';

  @override
  String get send => 'إرسال';

  @override
  String get liveActivityActive => 'النشاط المباشر نشط';

  @override
  String get restartGateway => 'إعادة تشغيل البوابة';

  @override
  String modelLabel(String model) {
    return 'النموذج: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'وقت التشغيل: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: دعم الخلفية نشط - يمكن للبوابة الاستمرار في الاستجابة';

  @override
  String get webChatBuiltIn => 'واجهة الدردشة المدمجة';

  @override
  String get configure => 'تكوين';

  @override
  String get disconnect => 'قطع الاتصال';

  @override
  String get agents => 'الوكلاء';

  @override
  String get agentFiles => 'ملفات الوكيل';

  @override
  String get createAgent => 'إنشاء وكيل';

  @override
  String get editAgent => 'تعديل الوكيل';

  @override
  String get noAgentsYet => 'لا يوجد وكلاء بعد';

  @override
  String get createYourFirstAgent => 'أنشئ وكيلك الأول!';

  @override
  String get active => 'نشط';

  @override
  String get agentName => 'اسم الوكيل';

  @override
  String get emoji => 'رمز تعبيري';

  @override
  String get selectEmoji => 'اختر رمزاً تعبيرياً';

  @override
  String get vibe => 'أسلوب';

  @override
  String get vibeHint => 'مثال: ودود، رسمي، ساخر';

  @override
  String get modelConfiguration => 'إعداد النموذج';

  @override
  String get advancedSettings => 'إعدادات متقدمة';

  @override
  String get agentCreated => 'تم إنشاء الوكيل';

  @override
  String get agentUpdated => 'تم تحديث الوكيل';

  @override
  String get agentDeleted => 'تم حذف الوكيل';

  @override
  String switchedToAgent(String name) {
    return 'تم التبديل إلى $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'حذف $name؟ سيؤدي هذا إلى إزالة جميع بيانات مساحة العمل.';
  }

  @override
  String get agentDetails => 'تفاصيل الوكيل';

  @override
  String get createdAt => 'تاريخ الإنشاء';

  @override
  String get lastUsed => 'آخر استخدام';

  @override
  String get basicInformation => 'معلومات أساسية';

  @override
  String get switchToAgent => 'تبديل الوكيل';

  @override
  String get providers => 'المزودون';

  @override
  String get addProvider => 'إضافة مزود';

  @override
  String get noProvidersConfigured => 'لم يتم إعداد مزودين.';

  @override
  String get editCredentials => 'تعديل بيانات الاعتماد';

  @override
  String get defaultModelHint =>
      'يُستخدم النموذج الافتراضي للوكلاء الذين لا يحددون نموذجاً خاصاً بهم.';

  @override
  String get voiceCallModelSection => 'مكالمة صوتية (مباشر)';

  @override
  String get voiceCallModelDescription =>
      'يُستخدم فقط عند النقر على زر المكالمة. الدردشة والوكلاء والمهام في الخلفية تستخدم نموذجك المعتاد.';

  @override
  String get voiceCallModelLabel => 'نموذج Live';

  @override
  String get voiceCallModelAutomatic => 'تلقائي';

  @override
  String get preferLiveVoiceBootstrapTitle => 'البدء عبر مكالمة صوتية';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'في محادثة جديدة وفارغة مع BOOTSTRAP.md، ابدأ مكالمة صوتية بدلاً من بدء إعداد نصّي صامت (عندما يتوفر Live).';

  @override
  String get liveVoiceNameLabel => 'الصوت';

  @override
  String get firstHatchModeChoiceTitle => 'كيف تود أن تبدأ؟';

  @override
  String get firstHatchModeChoiceBody =>
      'يمكنك الدردشة نصياً مع مساعدك أو بدء محادثة صوتية مثل مكالمة قصيرة. اختر ما يناسبك.';

  @override
  String get firstHatchModeChoiceChatButton => 'الكتابة في الدردشة';

  @override
  String get firstHatchModeChoiceVoiceButton => 'التحدث بالصوت';

  @override
  String get liveVoiceBargeInHint =>
      'تحدث بعد أن يتوقف المساعد (كان الصدى يقاطعهم أثناء الكلام).';

  @override
  String get liveVoiceFallbackTitle => 'مباشر';

  @override
  String get liveVoiceEndConversationTooltip => 'إنهاء المحادثة';

  @override
  String get liveVoiceStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get liveVoiceStatusRunning => 'قيد التشغيل…';

  @override
  String get liveVoiceStatusSpeaking => 'يتحدث…';

  @override
  String get liveVoiceStatusListening => 'يستمع…';

  @override
  String get liveVoiceBadge => 'مباشر';

  @override
  String get cannotAddLiveModelAsChat =>
      'هذا النموذج مخصص للمكالمات الصوتية فقط. اختر نموذج دردشة من القائمة.';

  @override
  String get authBearerTokenLabel => 'رمز Bearer';

  @override
  String get authAccessKeysLabel => 'مفاتيح الوصول';

  @override
  String authModelsFoundCount(int count) {
    return 'تم العثور على $count نموذجًا';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count إضافية — أدخل المعرّف يدويًا';
  }

  @override
  String get scanQrBarcodeTitle => 'مسح QR / الباركود';

  @override
  String get oauthSignInTitle => 'تسجيل الدخول';

  @override
  String get browserOverlayDone => 'تم';

  @override
  String appInitializationError(String error) {
    return 'خطأ في التهيئة: $error';
  }

  @override
  String get credentialsScreenTitle => 'بيانات الاعتماد';

  @override
  String get credentialsIntroBody =>
      'أضف عدة مفاتيح API لكل مزود. يدوّر FlutterClaw بينها تلقائيًا ويبرد المفاتيح عند حدود المعدل.';

  @override
  String get credentialsNoProvidersBody =>
      'لا يوجد مزودون مُعدّون.\nانتقل إلى الإعدادات ← المزودون والنماذج لإضافة واحد.';

  @override
  String get credentialsAddKeyTooltip => 'إضافة مفتاح';

  @override
  String get credentialsNoExtraKeysMessage =>
      'لا مفاتيح إضافية — يُستخدم المفتاح من المزودون والنماذج.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'إضافة مفتاح $provider';
  }

  @override
  String get credentialsKeyLabelHint => 'التسمية (مثل \"مفتاح العمل\")';

  @override
  String get credentialsApiKeyFieldLabel => 'مفتاح API';

  @override
  String get securitySettingsTitle => 'الأمان';

  @override
  String get securitySettingsIntro =>
      'تحكّم في فحوص الأمان ضد العمليات الخطيرة. تُطبَّق على الجلسة الحالية.';

  @override
  String get securitySectionToolExecution => 'تنفيذ الأدوات';

  @override
  String get securityPatternDetectionTitle => 'اكتشاف أنماط أمنية';

  @override
  String get securityPatternDetectionSubtitle =>
      'يحظر أنماطًا خطيرة: حقن الصدفة، تجاوز المسار، eval/exec، XSS، إلغاء التسلسل.';

  @override
  String get securityUnsafeModeBanner =>
      'فحوص الأمان معطّلة. ستُنفَّذ استدعاءات الأدوات دون تحقق. أعد التفعيل عند الانتهاء.';

  @override
  String get securitySectionHowItWorks => 'كيف يعمل';

  @override
  String get securityHowItWorksBlocked =>
      'عندما يطابق الاستدعاء نمطًا خطيرًا يُحظر ويُعلَم الوكيل بالسبب.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'استخدم /unsafe في الدردشة لاستثناء لمرة واحدة لاستدعاء محظور، ثم تُعاد الفحوص.';

  @override
  String get securityHowItWorksToggleSession =>
      'عطّل هنا \"اكتشاف أنماط أمنية\" لتعطيل الفحوص للجلسة بأكملها.';

  @override
  String get holdToSetAsDefault => 'اضغط مطولاً للتعيين كافتراضي';

  @override
  String get integrations => 'التكاملات';

  @override
  String get shortcutsIntegrations => 'تكامل الاختصارات';

  @override
  String get shortcutsIntegrationsDesc =>
      'قم بتثبيت اختصارات iOS لتشغيل إجراءات تطبيقات الطرف الثالث';

  @override
  String get dangerZone => 'منطقة الخطر';

  @override
  String get resetOnboarding => 'إعادة تعيين وإعادة تشغيل الإعداد';

  @override
  String get resetOnboardingDesc =>
      'يحذف جميع الإعدادات ويعود إلى معالج الإعداد.';

  @override
  String get resetAllConfiguration => 'إعادة تعيين جميع الإعدادات؟';

  @override
  String get resetAllConfigurationDesc =>
      'سيؤدي هذا إلى حذف مفاتيح API والنماذج وجميع الإعدادات. سيعود التطبيق إلى معالج الإعداد.\n\nلن يتم حذف سجل المحادثات.';

  @override
  String get removeProvider => 'إزالة المزود';

  @override
  String removeProviderConfirm(String provider) {
    return 'إزالة بيانات الاعتماد لـ $provider؟';
  }

  @override
  String modelSetAsDefault(String name) {
    return 'تم تعيين $name كنموذج افتراضي';
  }

  @override
  String get photoImage => 'صورة / صورة فوتوغرافية';

  @override
  String get documentPdfTxt => 'مستند (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'تعذر فتح المستند: $error';
  }

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get gatewayStopped => 'تم إيقاف البوابة';

  @override
  String get gatewayStarted => 'تم بدء البوابة بنجاح!';

  @override
  String gatewayFailed(String error) {
    return 'فشلت البوابة: $error';
  }

  @override
  String exceptionError(String error) {
    return 'استثناء: $error';
  }

  @override
  String get pairingRequestApproved => 'تمت الموافقة على طلب الاقتران';

  @override
  String get pairingRequestRejected => 'تم رفض طلب الاقتران';

  @override
  String get addDevice => 'إضافة جهاز';

  @override
  String get telegramConfigSaved => 'تم حفظ إعداد Telegram';

  @override
  String get discordConfigSaved => 'تم حفظ إعداد Discord';

  @override
  String get securityMethod => 'طريقة الأمان';

  @override
  String get pairingRecommended => 'الاقتران (موصى به)';

  @override
  String get pairingDescription =>
      'يحصل المستخدمون الجدد على رمز اقتران. تقوم بالموافقة عليهم أو رفضهم.';

  @override
  String get allowlistTitle => 'قائمة السماح';

  @override
  String get allowlistDescription =>
      'فقط معرفات مستخدمين محددة يمكنها الوصول إلى البوت.';

  @override
  String get openAccess => 'مفتوح';

  @override
  String get openAccessDescription =>
      'يمكن لأي شخص استخدام البوت فوراً (غير موصى به).';

  @override
  String get disabledAccess => 'معطل';

  @override
  String get disabledAccessDescription =>
      'الرسائل المباشرة غير مسموحة. لن يرد البوت على أي رسائل.';

  @override
  String get approvedDevices => 'الأجهزة الموافق عليها';

  @override
  String get noApprovedDevicesYet => 'لا توجد أجهزة موافق عليها بعد';

  @override
  String get devicesAppearAfterApproval =>
      'ستظهر الأجهزة هنا بعد الموافقة على طلبات الاقتران الخاصة بها';

  @override
  String get noAllowedUsersConfigured => 'لم يتم إعداد مستخدمين مسموح بهم';

  @override
  String get addUserIdsHint =>
      'أضف معرفات المستخدمين للسماح لهم باستخدام البوت';

  @override
  String get removeDevice => 'إزالة الجهاز؟';

  @override
  String removeAccessFor(String name) {
    return 'إزالة الوصول لـ $name؟';
  }

  @override
  String get saving => 'جارٍ الحفظ...';

  @override
  String get channelsLabel => 'القنوات';

  @override
  String get clawHubAccount => 'حساب ClawHub';

  @override
  String get loggedInToClawHub => 'أنت مسجل الدخول حالياً في ClawHub.';

  @override
  String get loggedOutFromClawHub => 'تم تسجيل الخروج من ClawHub';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get connect => 'اتصال';

  @override
  String get pasteClawHubToken => 'الصق رمز ClawHub API الخاص بك';

  @override
  String get pleaseEnterApiToken => 'يرجى إدخال رمز API';

  @override
  String get successfullyConnected => 'تم الاتصال بـ ClawHub بنجاح';

  @override
  String get browseSkillsButton => 'تصفح المهارات';

  @override
  String get installSkill => 'تثبيت المهارة';

  @override
  String get incompatibleSkill => 'مهارة غير متوافقة';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'لا يمكن تشغيل هذه المهارة على الهاتف (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'تحذير التوافق';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'صُممت هذه المهارة لسطح المكتب وقد لا تعمل كما هي على الهاتف.\n\n$reason\n\nهل تريد تثبيت نسخة معدلة محسنة للهاتف؟';
  }

  @override
  String get ok => 'حسناً';

  @override
  String get installOriginal => 'تثبيت الأصلية';

  @override
  String get installAdapted => 'تثبيت المعدلة';

  @override
  String get resetSession => 'إعادة تعيين الجلسة';

  @override
  String resetSessionConfirm(String key) {
    return 'إعادة تعيين الجلسة \"$key\"؟ سيؤدي هذا إلى مسح جميع الرسائل.';
  }

  @override
  String get sessionReset => 'تمت إعادة تعيين الجلسة';

  @override
  String get activeSessions => 'الجلسات النشطة';

  @override
  String get scheduledTasks => 'المهام المجدولة';

  @override
  String get defaultBadge => 'افتراضي';

  @override
  String errorGeneric(String error) {
    return 'خطأ: $error';
  }

  @override
  String fileSaved(String fileName) {
    return 'تم حفظ $fileName';
  }

  @override
  String errorSavingFile(String error) {
    return 'خطأ في حفظ الملف: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'لا يمكن حذف الوكيل الأخير';

  @override
  String get close => 'إغلاق';

  @override
  String get nameIsRequired => 'الاسم مطلوب';

  @override
  String get pleaseSelectModel => 'يرجى اختيار نموذج';

  @override
  String temperatureLabel(String value) {
    return 'الحرارة: $value';
  }

  @override
  String get maxTokens => 'الحد الأقصى للرموز';

  @override
  String get maxTokensRequired => 'الحد الأقصى للرموز مطلوب';

  @override
  String get mustBePositiveNumber => 'يجب أن يكون رقماً موجباً';

  @override
  String get maxToolIterations => 'الحد الأقصى لتكرارات الأداة';

  @override
  String get maxIterationsRequired => 'الحد الأقصى للتكرارات مطلوب';

  @override
  String get restrictToWorkspace => 'تقييد بمساحة العمل';

  @override
  String get restrictToWorkspaceDesc =>
      'تقييد عمليات الملفات بمساحة عمل الوكيل';

  @override
  String get noModelsConfiguredLong =>
      'يرجى إضافة نموذج واحد على الأقل في الإعدادات قبل إنشاء وكيل.';

  @override
  String get selectProviderFirst => 'اختر مزوداً أولاً';

  @override
  String get skip => 'تخطي';

  @override
  String get continueButton => 'متابعة';

  @override
  String get uiAutomation => 'أتمتة واجهة المستخدم';

  @override
  String get uiAutomationDesc =>
      'يمكن لـ FlutterClaw التحكم في شاشتك نيابةً عنك — الضغط على الأزرار، ملء النماذج، التمرير، وأتمتة المهام المتكررة عبر أي تطبيق.';

  @override
  String get uiAutomationAccessibilityNote =>
      'يتطلب هذا تفعيل خدمة إمكانية الوصول في إعدادات Android. يمكنك تخطي هذا وتفعيله لاحقاً.';

  @override
  String get openAccessibilitySettings => 'فتح إعدادات إمكانية الوصول';

  @override
  String get skipForNow => 'تخطي الآن';

  @override
  String get checkingPermission => 'جارٍ التحقق من الإذن…';

  @override
  String get accessibilityEnabled => 'خدمة إمكانية الوصول مفعلة';

  @override
  String get accessibilityNotEnabled => 'خدمة إمكانية الوصول غير مفعلة';

  @override
  String get exploreIntegrations => 'استكشاف التكاملات';

  @override
  String get requestTimedOut => 'انتهت مهلة الطلب';

  @override
  String get myShortcuts => 'اختصاراتي';

  @override
  String get addShortcut => 'إضافة اختصار';

  @override
  String get noShortcutsYet => 'لا توجد اختصارات بعد';

  @override
  String get shortcutsInstructions =>
      'أنشئ اختصاراً في تطبيق اختصارات iOS، أضف إجراء رد الاتصال في النهاية، ثم سجله هنا حتى يتمكن الذكاء الاصطناعي من تشغيله.';

  @override
  String get shortcutName => 'اسم الاختصار';

  @override
  String get shortcutNameHint => 'الاسم الدقيق من تطبيق الاختصارات';

  @override
  String get descriptionOptional => 'الوصف (اختياري)';

  @override
  String get whatDoesShortcutDo => 'ماذا يفعل هذا الاختصار؟';

  @override
  String get callbackSetup => 'إعداد رد الاتصال';

  @override
  String get callbackInstructions =>
      'يجب أن ينتهي كل اختصار بـ:\n① الحصول على قيمة المفتاح → \"callbackUrl\" (من مدخلات الاختصار المحللة كقاموس)\n② فتح عناوين URL ← ناتج ①';

  @override
  String get channelApp => 'التطبيق';

  @override
  String get channelHeartbeat => 'نبض القلب';

  @override
  String get channelCron => 'مجدول';

  @override
  String get channelSubagent => 'وكيل فرعي';

  @override
  String get channelSystem => 'النظام';

  @override
  String secondsAgo(int seconds) {
    return 'منذ $secondsث';
  }

  @override
  String get messagesAbbrev => 'رسائل';

  @override
  String get modelAlreadyAdded => 'هذا النموذج موجود بالفعل في قائمتك';

  @override
  String get bothTokensRequired => 'كلا الرمزين مطلوبان';

  @override
  String get slackSavedRestart => 'تم حفظ Slack — أعد تشغيل البوابة للاتصال';

  @override
  String get slackConfiguration => 'إعداد Slack';

  @override
  String get setupTitle => 'الإعداد';

  @override
  String get slackSetupInstructions =>
      '1. أنشئ تطبيق Slack على api.slack.com/apps\n2. فعّل وضع Socket → أنشئ رمز مستوى التطبيق (xapp-…)\n   مع النطاق: connections:write\n3. أضف نطاقات رمز البوت: chat:write، channels:history،\n   groups:history، im:history، mpim:history\n4. ثبت التطبيق في مساحة العمل → انسخ رمز البوت (xoxb-…)';

  @override
  String get botTokenXoxb => 'رمز البوت (xoxb-…)';

  @override
  String get appLevelToken => 'رمز مستوى التطبيق (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'عنوان URL لـ API ورقم الهاتف مطلوبان';

  @override
  String get signalSavedRestart => 'تم حفظ Signal — أعد تشغيل البوابة للاتصال';

  @override
  String get signalConfiguration => 'إعداد Signal';

  @override
  String get requirementsTitle => 'المتطلبات';

  @override
  String get signalRequirements =>
      'يتطلب تشغيل signal-cli-rest-api على خادم:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nسجل/اربط رقم Signal الخاص بك عبر REST API، ثم أدخل عنوان URL ورقم هاتفك أدناه.';

  @override
  String get signalApiUrl => 'عنوان URL لـ signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'رقم هاتف Signal الخاص بك';

  @override
  String get userIdLabel => 'معرف المستخدم';

  @override
  String get enterDiscordUserId => 'أدخل معرف مستخدم Discord';

  @override
  String get enterTelegramUserId => 'أدخل معرف مستخدم Telegram';

  @override
  String get fromDiscordDevPortal => 'من بوابة مطور Discord';

  @override
  String get allowedUserIdsTitle => 'معرفات المستخدمين المسموح بها';

  @override
  String get approvedDevice => 'جهاز معتمد';

  @override
  String get allowedUser => 'مستخدم مسموح به';

  @override
  String get howToGetBotToken => 'كيفية الحصول على رمز البوت الخاص بك';

  @override
  String get discordTokenInstructions =>
      '1. انتقل إلى بوابة مطور Discord\n2. أنشئ تطبيقاً وبوتاً جديدين\n3. انسخ الرمز والصقه أعلاه\n4. فعّل Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. افتح Telegram وابحث عن @BotFather\n2. أرسل /newbot واتبع التعليمات\n3. انسخ الرمز والصقه أعلاه';

  @override
  String get fromBotFatherHint => 'احصل عليه من @BotFather';

  @override
  String get accessTokenLabel => 'رمز الوصول';

  @override
  String get notSetOpenAccess => 'غير معين — وصول مفتوح (loopback فقط)';

  @override
  String get gatewayAccessToken => 'رمز وصول البوابة';

  @override
  String get tokenFieldLabel => 'الرمز';

  @override
  String get leaveEmptyDisableAuth => 'اتركه فارغاً لتعطيل المصادقة';

  @override
  String get toolPolicies => 'سياسات الأدوات';

  @override
  String get toolPoliciesDesc =>
      'تحكم في ما يمكن للوكيل الوصول إليه. الأدوات المعطلة مخفية عن الذكاء الاصطناعي ومحظورة في وقت التشغيل.';

  @override
  String get privacySensors => 'الخصوصية والمستشعرات';

  @override
  String get networkCategory => 'الشبكة';

  @override
  String get systemCategory => 'النظام';

  @override
  String get toolTakePhotos => 'التقاط الصور';

  @override
  String get toolTakePhotosDesc =>
      'السماح للوكيل بالتقاط الصور باستخدام الكاميرا';

  @override
  String get toolRecordVideo => 'تسجيل الفيديو';

  @override
  String get toolRecordVideoDesc => 'السماح للوكيل بتسجيل الفيديو';

  @override
  String get toolLocation => 'الموقع';

  @override
  String get toolLocationDesc =>
      'السماح للوكيل بقراءة موقع GPS الحالي الخاص بك';

  @override
  String get toolHealthData => 'البيانات الصحية';

  @override
  String get toolHealthDataDesc => 'السماح للوكيل بقراءة بيانات الصحة/اللياقة';

  @override
  String get toolContacts => 'جهات الاتصال';

  @override
  String get toolContactsDesc => 'السماح للوكيل بالبحث في جهات اتصالك';

  @override
  String get toolScreenshots => 'لقطات الشاشة';

  @override
  String get toolScreenshotsDesc => 'السماح للوكيل بالتقاط لقطات شاشة';

  @override
  String get toolWebFetch => 'جلب الويب';

  @override
  String get toolWebFetchDesc => 'السماح للوكيل بجلب المحتوى من عناوين URL';

  @override
  String get toolWebSearch => 'البحث على الويب';

  @override
  String get toolWebSearchDesc => 'السماح للوكيل بالبحث على الويب';

  @override
  String get toolHttpRequests => 'طلبات HTTP';

  @override
  String get toolHttpRequestsDesc => 'السماح للوكيل بإجراء طلبات HTTP عشوائية';

  @override
  String get toolSandboxShell => 'صدفة وضع الحماية';

  @override
  String get toolSandboxShellDesc =>
      'السماح للوكيل بتشغيل أوامر الصدفة في وضع الحماية';

  @override
  String get toolImageGeneration => 'توليد الصور';

  @override
  String get toolImageGenerationDesc =>
      'السماح للوكيل بتوليد الصور عبر الذكاء الاصطناعي';

  @override
  String get toolLaunchApps => 'تشغيل التطبيقات';

  @override
  String get toolLaunchAppsDesc => 'السماح للوكيل بفتح التطبيقات المثبتة';

  @override
  String get toolLaunchIntents => 'تشغيل النوايا';

  @override
  String get toolLaunchIntentsDesc =>
      'السماح للوكيل بتشغيل نوايا Android (الروابط العميقة، شاشات النظام)';

  @override
  String get renameSession => 'إعادة تسمية الجلسة';

  @override
  String get myConversationName => 'اسم محادثتي';

  @override
  String get renameAction => 'إعادة التسمية';

  @override
  String get couldNotTranscribeAudio => 'تعذر نسخ الصوت';

  @override
  String get stopRecording => 'إيقاف التسجيل';

  @override
  String get voiceInput => 'إدخال صوتي';

  @override
  String get speakMessage => 'نطق الرسالة';

  @override
  String get stopSpeaking => 'إيقاف النطق';

  @override
  String get selectText => 'تحديد النص';

  @override
  String get messageCopied => 'تم نسخ الرسالة';

  @override
  String get copyTooltip => 'نسخ';

  @override
  String get commandsTooltip => 'الأوامر';

  @override
  String get providersAndModels => 'المزودون والنماذج';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نموذج مُعد',
      many: '$count نموذجاً مُعداً',
      few: '$count نماذج مُعدة',
      two: 'نموذجان مُعدان',
      one: 'نموذج واحد مُعد',
      zero: 'لا نماذج',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'البدء التلقائي مُفعَّل';

  @override
  String get autoStartOffLabel => 'البدء التلقائي معطل';

  @override
  String get allToolsEnabled => 'جميع الأدوات مُفعَّلة';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أداة معطلة',
      many: '$count أداة معطلة',
      few: '$count أدوات معطلة',
      two: 'أداتان معطلتان',
      one: 'أداة واحدة معطلة',
      zero: 'لا أدوات معطلة',
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
  String get officialWebsite => 'الموقع الرسمي';

  @override
  String get noPendingPairingRequests => 'لا توجد طلبات اقتران معلقة';

  @override
  String get pairingRequestsTitle => 'طلبات الاقتران';

  @override
  String get gatewayStartingStatus => 'جارٍ بدء البوابة...';

  @override
  String get gatewayRetryingStatus => 'جارٍ إعادة محاولة بدء البوابة...';

  @override
  String get errorStartingGateway => 'خطأ في بدء البوابة';

  @override
  String get runningStatus => 'قيد التشغيل';

  @override
  String get stoppedStatus => 'متوقف';

  @override
  String get notSetUpStatus => 'غير معد';

  @override
  String get configuredStatus => 'مُعد';

  @override
  String get whatsAppConfigSaved => 'تم حفظ إعداد WhatsApp';

  @override
  String get whatsAppDisconnected => 'تم قطع اتصال WhatsApp';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'جارٍ التطبيق...';

  @override
  String get reconnectWhatsApp => 'إعادة الاتصال بـ WhatsApp';

  @override
  String get saveSettingsLabel => 'حفظ الإعدادات';

  @override
  String get applySettingsRestart => 'تطبيق الإعدادات وإعادة التشغيل';

  @override
  String get whatsAppMode => 'وضع WhatsApp';

  @override
  String get myPersonalNumber => 'رقمي الشخصي';

  @override
  String get myPersonalNumberDesc =>
      'الرسائل التي ترسلها إلى محادثة WhatsApp الخاصة بك توقظ الوكيل.';

  @override
  String get dedicatedBotAccount => 'حساب بوت مخصص';

  @override
  String get dedicatedBotAccountDesc =>
      'الرسائل المرسلة من الحساب المرتبط نفسه يتم تجاهلها كصادرة.';

  @override
  String get allowedNumbers => 'الأرقام المسموح بها';

  @override
  String get addNumberTitle => 'إضافة رقم';

  @override
  String get phoneNumberJid => 'رقم الهاتف / JID';

  @override
  String get noAllowedNumbersConfigured => 'لا توجد أرقام مسموح بها مُعدة';

  @override
  String get devicesAppearAfterPairing =>
      'تظهر الأجهزة هنا بعد الموافقة على طلبات الاقتران';

  @override
  String get addPhoneNumbersHint =>
      'أضف أرقام الهواتف للسماح لهم باستخدام البوت';

  @override
  String get allowedNumber => 'رقم مسموح به';

  @override
  String get howToConnect => 'كيفية الاتصال';

  @override
  String get whatsAppConnectInstructions =>
      '1. انقر على \"الاتصال بـ WhatsApp\" أعلاه\n2. سيظهر رمز QR — امسحه ضوئياً باستخدام WhatsApp\n   (الإعدادات ← الأجهزة المرتبطة ← ربط جهاز)\n3. بمجرد الاتصال، يتم توجيه الرسائل الواردة\n   إلى وكيل الذكاء الاصطناعي النشط تلقائياً';

  @override
  String get whatsAppPairingDesc =>
      'يحصل المرسلون الجدد على رمز اقتران. تقوم بالموافقة عليهم.';

  @override
  String get whatsAppAllowlistDesc =>
      'فقط أرقام الهواتف المحددة يمكنها إرسال رسائل إلى البوت.';

  @override
  String get whatsAppOpenDesc => 'أي شخص يراسلك يمكنه استخدام البوت.';

  @override
  String get whatsAppDisabledDesc => 'لن يرد البوت على أي رسائل واردة.';

  @override
  String get sessionExpiredRelink =>
      'انتهت صلاحية الجلسة. انقر على \"إعادة الاتصال\" أدناه لمسح رمز QR جديد.';

  @override
  String get connectWhatsAppBelow =>
      'انقر على \"الاتصال بـ WhatsApp\" أدناه لربط حسابك.';

  @override
  String get whatsAppAcceptedQr => 'قبل WhatsApp رمز QR. جارٍ إنهاء الربط...';

  @override
  String get waitingForWhatsApp => 'في انتظار إكمال WhatsApp للربط...';

  @override
  String get focusedLabel => 'مركز';

  @override
  String get balancedLabel => 'متوازن';

  @override
  String get creativeLabel => 'إبداعي';

  @override
  String get preciseLabel => 'دقيق';

  @override
  String get expressiveLabel => 'تعبيري';

  @override
  String get browseLabel => 'تصفح';

  @override
  String get apiTokenLabel => 'رمز API';

  @override
  String get connectToClawHub => 'الاتصال بـ ClawHub';

  @override
  String get clawHubLoginHint =>
      'سجل الدخول إلى ClawHub للوصول إلى المهارات المميزة وتثبيت الحزم';

  @override
  String get howToGetApiToken => 'كيفية الحصول على رمز API الخاص بك:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. قم بزيارة clawhub.ai وسجل الدخول باستخدام GitHub\n2. قم بتشغيل \"clawhub login\" في الطرفية\n3. انسخ رمزك والصقه هنا';

  @override
  String connectionFailed(String error) {
    return 'فشل الاتصال: $error';
  }

  @override
  String cronJobRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تشغيل',
      many: '$count تشغيلاً',
      few: '$count تشغيلات',
      two: 'تشغيلان',
      one: 'تشغيل واحد',
      zero: 'لا تشغيلات',
    );
    return '$_temp0';
  }

  @override
  String nextRunLabel(String time) {
    return 'التشغيل التالي: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'آخر خطأ: $error';
  }

  @override
  String get cronJobHintText => 'تعليمات للوكيل عند تشغيل هذه المهمة…';

  @override
  String get androidPermissions => 'أذونات Android';

  @override
  String get androidPermissionsDesc =>
      'يمكن لـ FlutterClaw التحكم في شاشتك نيابةً عنك — الضغط على الأزرار، ملء النماذج، التمرير، وأتمتة المهام المتكررة عبر أي تطبيق.';

  @override
  String get twoPermissionsNeeded =>
      'يلزم إذنان للحصول على التجربة الكاملة. يمكنك تخطي هذا وتفعيلهما لاحقاً في الإعدادات.';

  @override
  String get accessibilityService => 'خدمة إمكانية الوصول';

  @override
  String get accessibilityServiceDesc =>
      'تسمح بالنقر والتمرير والكتابة وقراءة محتوى الشاشة';

  @override
  String get displayOverOtherApps => 'العرض فوق التطبيقات الأخرى';

  @override
  String get displayOverOtherAppsDesc =>
      'تعرض رقاقة حالة عائمة حتى تتمكن من رؤية ما يفعله الوكيل';

  @override
  String get changeDefaultModel => 'تغيير النموذج الافتراضي';

  @override
  String setModelAsDefault(String name) {
    return 'تعيين $name كنموذج افتراضي.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count وكيل',
      many: '$count وكيلاً',
      few: '$count وكلاء',
      two: 'وكيلين',
      one: 'وكيل واحد',
      zero: 'لا وكلاء',
    );
    return 'تحديث $_temp0 أيضاً';
  }

  @override
  String get startNewSessions => 'بدء جلسات جديدة';

  @override
  String get currentConversationsArchived => 'سيتم أرشفة المحادثات الحالية';

  @override
  String get applyAction => 'تطبيق';

  @override
  String applyModelQuestion(String name) {
    return 'تطبيق $name؟';
  }

  @override
  String get setAsDefaultModel => 'تعيين كنموذج افتراضي';

  @override
  String get usedByAgentsWithout => 'يُستخدم بواسطة الوكلاء دون نموذج محدد';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count وكيل',
      many: '$count وكيلاً',
      few: '$count وكلاء',
      two: 'وكيلين',
      one: 'وكيل واحد',
      zero: 'لا وكلاء',
    );
    return 'التطبيق على $_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'المزود مصادق عليه بالفعل — لا حاجة لمفتاح API.';

  @override
  String get selectFromList => 'الاختيار من القائمة';

  @override
  String get enterCustomModelId => 'إدخال معرف نموذج مخصص';

  @override
  String get removeSkillTitle => 'إزالة المهارة؟';

  @override
  String get browseClawHubToDiscover => 'تصفح ClawHub لاكتشاف وتثبيت المهارات';

  @override
  String get addDeviceTooltip => 'إضافة جهاز';

  @override
  String get addNumberTooltip => 'إضافة رقم';

  @override
  String get searchSkillsHint => 'البحث عن مهارات...';

  @override
  String get loginToClawHub => 'تسجيل الدخول إلى ClawHub';

  @override
  String get accountTooltip => 'الحساب';

  @override
  String get editAction => 'تعديل';

  @override
  String get setAsDefaultAction => 'تعيين كافتراضي';

  @override
  String get chooseProviderTitle => 'اختيار المزود';

  @override
  String get apiKeyTitle => 'مفتاح API';

  @override
  String get slackConfigSaved => 'تم حفظ Slack — أعد تشغيل البوابة للاتصال';

  @override
  String get signalConfigSaved => 'تم حفظ Signal — أعد تشغيل البوابة للاتصال';

  @override
  String idPrefix(String id) {
    return 'المعرف: $id';
  }

  @override
  String get addDeviceHint => 'إضافة جهاز';

  @override
  String get skipAction => 'تخطي';

  @override
  String get mcpServers => 'خوادم MCP';

  @override
  String get noMcpServersConfigured => 'لا توجد خوادم MCP مُهيأة';

  @override
  String get mcpServersEmptyHint =>
      'أضف خوادم MCP لتمكين وكيلك من الوصول إلى أدوات GitHub وNotion وSlack وقواعد البيانات والمزيد.';

  @override
  String get addMcpServer => 'إضافة خادم MCP';

  @override
  String get editMcpServer => 'تعديل خادم MCP';

  @override
  String get removeMcpServer => 'إزالة خادم MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return 'هل تريد إزالة \"$name\"؟ لن تكون أدواته متاحة بعد الآن.';
  }

  @override
  String get mcpTransport => 'بروتوكول النقل';

  @override
  String get testConnection => 'اختبار الاتصال';

  @override
  String get mcpServerNameLabel => 'اسم الخادم';

  @override
  String get mcpServerNameHint => 'مثال: GitHub أو Notion أو قاعدتي';

  @override
  String get mcpServerUrlLabel => 'رابط الخادم';

  @override
  String get mcpBearerTokenLabel => 'رمز Bearer (اختياري)';

  @override
  String get mcpBearerTokenHint => 'اتركه فارغاً إذا لم تكن هناك مصادقة مطلوبة';

  @override
  String get mcpCommandLabel => 'الأمر';

  @override
  String get mcpArgumentsLabel => 'المعطيات (مفصولة بمسافة)';

  @override
  String get mcpEnvVarsLabel => 'متغيرات البيئة (مفتاح=قيمة، واحد في كل سطر)';

  @override
  String get mcpStdioNotOnIos => 'stdio غير متوفر على iOS. استخدم HTTP أو SSE.';

  @override
  String get connectedStatus => 'متصل';

  @override
  String get mcpConnecting => 'جارٍ الاتصال...';

  @override
  String get mcpConnectionError => 'خطأ في الاتصال';

  @override
  String get mcpDisconnected => 'غير متصل';

  @override
  String mcpToolsCount(int count) {
    return '$count أدوات';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'ناجح — تم اكتشاف $count أدوات';
  }

  @override
  String get mcpTestOkNoTools => 'ناجح — متصل (0 أدوات)';

  @override
  String get mcpTestFailed => 'فشل الاتصال. تحقق من رابط/رمز الخادم.';

  @override
  String get mcpAddServer => 'إضافة خادم';

  @override
  String get mcpSaveChanges => 'حفظ التغييرات';

  @override
  String get urlIsRequired => 'الرابط مطلوب';

  @override
  String get enterValidUrl => 'أدخل رابطاً صحيحاً';

  @override
  String get commandIsRequired => 'الأمر مطلوب';

  @override
  String skillRemoved(String name) {
    return 'تمت إزالة المهارة \"$name\"';
  }

  @override
  String get editFileContentHint => 'تعديل محتوى الملف...';

  @override
  String get whatsAppPairSubtitle => 'اربط حساب WhatsApp الشخصي بمسح رمز QR';

  @override
  String get whatsAppPairingOptional =>
      'الربط اختياري. يمكنك إتمام الإعداد الآن وإكمال الربط لاحقاً.';

  @override
  String get whatsAppEnableToLink => 'فعّل WhatsApp لبدء ربط هذا الجهاز.';

  @override
  String get whatsAppLinkedOnboarding =>
      'تم ربط WhatsApp. سيتمكن FlutterClaw من الرد بعد الإعداد الأولي.';

  @override
  String get cancelLink => 'إلغاء الربط';
}
