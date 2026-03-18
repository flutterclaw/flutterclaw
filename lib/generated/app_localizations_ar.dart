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
}
