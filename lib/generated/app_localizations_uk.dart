// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Чат';

  @override
  String get channels => 'Канали';

  @override
  String get agent => 'Агент';

  @override
  String get settings => 'Налаштування';

  @override
  String get getStarted => 'Почати';

  @override
  String get yourPersonalAssistant => 'Ваш особистий AI-асистент';

  @override
  String get multiChannelChat => 'Багатоканальний чат';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat та інше';

  @override
  String get powerfulAIModels => 'Потужні моделі AI';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok та безкоштовні моделі';

  @override
  String get localGateway => 'Локальний шлюз';

  @override
  String get localGatewayDesc =>
      'Працює на вашому пристрої, ваші дані залишаються вашими';

  @override
  String get chooseProvider => 'Виберіть Провайдера';

  @override
  String get selectProviderDesc =>
      'Виберіть, як ви хочете підключитися до моделей AI.';

  @override
  String get startForFree => 'Почати Безкоштовно';

  @override
  String get freeProvidersDesc =>
      'Ці провайдери пропонують безкоштовні моделі для початку без витрат.';

  @override
  String get free => 'БЕЗКОШТОВНО';

  @override
  String get otherProviders => 'Інші Провайдери';

  @override
  String connectToProvider(String provider) {
    return 'Підключитися до $provider';
  }

  @override
  String get enterApiKeyDesc => 'Введіть ваш API-ключ і виберіть модель.';

  @override
  String get dontHaveApiKey => 'Немає API-ключа?';

  @override
  String get createAccountCopyKey =>
      'Створіть обліковий запис і скопіюйте ключ.';

  @override
  String get signUp => 'Зареєструватися';

  @override
  String get apiKey => 'API-ключ';

  @override
  String get pasteFromClipboard => 'Вставити з буфера обміну';

  @override
  String get apiBaseUrl => 'Базова URL API';

  @override
  String get selectModel => 'Вибрати Модель';

  @override
  String get modelId => 'ID Моделі';

  @override
  String get validateKey => 'Перевірити Ключ';

  @override
  String get validating => 'Перевірка...';

  @override
  String get invalidApiKey => 'Недійсний API-ключ';

  @override
  String get gatewayConfiguration => 'Конфігурація Шлюзу';

  @override
  String get gatewayConfigDesc =>
      'Шлюз - це локальна площина управління вашого асистента.';

  @override
  String get defaultSettingsNote =>
      'Налаштування за замовчуванням працюють для більшості користувачів. Змінюйте лише якщо знаєте, що вам потрібно.';

  @override
  String get host => 'Хост';

  @override
  String get port => 'Порт';

  @override
  String get autoStartGateway => 'Автозапуск шлюзу';

  @override
  String get autoStartGatewayDesc =>
      'Запускати шлюз автоматично при запуску додатку.';

  @override
  String get channelsPageTitle => 'Канали';

  @override
  String get channelsPageDesc =>
      'Підключіть канали обміну повідомленнями за бажанням. Ви завжди можете налаштувати їх пізніше в Налаштуваннях.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Підключіть бота Telegram.';

  @override
  String get openBotFather => 'Відкрити BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Підключіть бота Discord.';

  @override
  String get developerPortal => 'Портал Розробника';

  @override
  String get botToken => 'Токен Бота';

  @override
  String telegramBotToken(String platform) {
    return 'Токен Бота $platform';
  }

  @override
  String get readyToGo => 'Готово до Запуску';

  @override
  String get reviewConfiguration =>
      'Перевірте конфігурацію і запустіть FlutterClaw.';

  @override
  String get model => 'Модель';

  @override
  String viaProvider(String provider) {
    return 'через $provider';
  }

  @override
  String get gateway => 'Шлюз';

  @override
  String get webChatOnly => 'Тільки WebChat (можете додати більше пізніше)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Запуск...';

  @override
  String get startFlutterClaw => 'Запустити FlutterClaw';

  @override
  String get newSession => 'Нова сесія';

  @override
  String get photoLibrary => 'Бібліотека Фото';

  @override
  String get camera => 'Камера';

  @override
  String get whatDoYouSeeInImage => 'Що ви бачите на цьому зображенні?';

  @override
  String get imagePickerNotAvailable =>
      'Вибір зображень недоступний у симуляторі. Використовуйте реальний пристрій.';

  @override
  String get couldNotOpenImagePicker => 'Не вдалося відкрити вибір зображень.';

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get attachImage => 'Прикріпити зображення';

  @override
  String get messageFlutterClaw => 'Повідомлення FlutterClaw...';

  @override
  String get channelsAndGateway => 'Канали та Шлюз';

  @override
  String get stop => 'Зупинити';

  @override
  String get start => 'Запустити';

  @override
  String status(String status) {
    return 'Статус: $status';
  }

  @override
  String get builtInChatInterface => 'Вбудований інтерфейс чату';

  @override
  String get notConfigured => 'Не налаштовано';

  @override
  String get connected => 'Підключено';

  @override
  String get configuredStarting => 'Налаштовано (запуск...)';

  @override
  String get telegramConfiguration => 'Конфігурація Telegram';

  @override
  String get fromBotFather => 'Від @BotFather';

  @override
  String get allowedUserIds => 'Дозволені ID користувачів (через кому)';

  @override
  String get leaveEmptyToAllowAll => 'Залиште порожнім, щоб дозволити всім';

  @override
  String get cancel => 'Скасувати';

  @override
  String get saveAndConnect => 'Зберегти та Підключити';

  @override
  String get discordConfiguration => 'Конфігурація Discord';

  @override
  String get pendingPairingRequests => 'Очікувані Запити на Парування';

  @override
  String get approve => 'Затвердити';

  @override
  String get reject => 'Відхилити';

  @override
  String get expired => 'Закінчився';

  @override
  String minutesLeft(int minutes) {
    return 'Залишилось $minutesхв';
  }

  @override
  String get workspaceFiles => 'Файли Робочого Простору';

  @override
  String get personalAIAssistant => 'Особистий AI-Асистент';

  @override
  String sessionsCount(int count) {
    return 'Сесії ($count)';
  }

  @override
  String get noActiveSessions => 'Немає активних сесій';

  @override
  String get startConversationToCreate => 'Почніть розмову, щоб створити';

  @override
  String get startConversationToSee =>
      'Почніть розмову, щоб побачити сесії тут';

  @override
  String get reset => 'Скинути';

  @override
  String get cronJobs => 'Заплановані Завдання';

  @override
  String get noCronJobs => 'Немає запланованих завдань';

  @override
  String get addScheduledTasks =>
      'Додайте заплановані завдання для вашого агента';

  @override
  String get runNow => 'Виконати Зараз';

  @override
  String get enable => 'Увімкнути';

  @override
  String get disable => 'Вимкнути';

  @override
  String get delete => 'Видалити';

  @override
  String get skills => 'Навички';

  @override
  String get browseClawHub => 'Переглянути ClawHub';

  @override
  String get noSkillsInstalled => 'Навички не встановлені';

  @override
  String get browseClawHubToAdd => 'Перегляньте ClawHub, щоб додати навички';

  @override
  String removeSkillConfirm(String name) {
    return 'Видалити \"$name\" з ваших навичок?';
  }

  @override
  String get clawHubSkills => 'Навички ClawHub';

  @override
  String get searchSkills => 'Пошук навичок...';

  @override
  String get noSkillsFound => 'Навички не знайдені. Спробуйте інший пошук.';

  @override
  String installedSkill(String name) {
    return '$name встановлено';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Не вдалося встановити $name';
  }

  @override
  String get addCronJob => 'Додати Заплановане Завдання';

  @override
  String get jobName => 'Назва Завдання';

  @override
  String get dailySummaryExample => 'напр. Щоденна Зведення';

  @override
  String get taskPrompt => 'Опис Завдання';

  @override
  String get whatShouldAgentDo => 'Що має робити агент?';

  @override
  String get interval => 'Інтервал';

  @override
  String get every5Minutes => 'Кожні 5 хвилин';

  @override
  String get every15Minutes => 'Кожні 15 хвилин';

  @override
  String get every30Minutes => 'Кожні 30 хвилин';

  @override
  String get everyHour => 'Щогодини';

  @override
  String get every6Hours => 'Кожні 6 годин';

  @override
  String get every12Hours => 'Кожні 12 годин';

  @override
  String get every24Hours => 'Кожні 24 години';

  @override
  String get add => 'Додати';

  @override
  String get save => 'Зберегти';

  @override
  String get sessions => 'Сесії';

  @override
  String messagesCount(int count) {
    return '$count повідомлень';
  }

  @override
  String tokensCount(int count) {
    return '$count токенів';
  }

  @override
  String get compact => 'Стиснути';

  @override
  String get models => 'Моделі';

  @override
  String get noModelsConfigured => 'Моделі не налаштовані';

  @override
  String get addModelToStartChatting =>
      'Додайте модель, щоб почати спілкування';

  @override
  String get addModel => 'Додати Модель';

  @override
  String get default_ => 'ЗА ЗАМОВЧУВАННЯМ';

  @override
  String get autoStart => 'Автозапуск';

  @override
  String get startGatewayWhenLaunches => 'Запускати шлюз при запуску додатку';

  @override
  String get heartbeat => 'Серцебиття';

  @override
  String get enabled => 'Увімкнено';

  @override
  String get periodicAgentTasks => 'Періодичні завдання агента з HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String get about => 'Про Програму';

  @override
  String get personalAIAssistantForIOS =>
      'Особистий AI-Асистент для iOS та Android';

  @override
  String get version => 'Версія';

  @override
  String get basedOnOpenClaw => 'Засновано на OpenClaw';

  @override
  String get removeModel => 'Видалити модель?';

  @override
  String removeModelConfirm(String name) {
    return 'Видалити \"$name\" з ваших моделей?';
  }

  @override
  String get remove => 'Видалити';

  @override
  String get setAsDefault => 'Встановити За Замовчуванням';

  @override
  String get paste => 'Вставити';

  @override
  String get chooseProviderStep => '1. Вибрати Провайдера';

  @override
  String get selectModelStep => '2. Вибрати Модель';

  @override
  String get apiKeyStep => '3. API-ключ';

  @override
  String getApiKeyAt(String provider) {
    return 'Отримати API-ключ на $provider';
  }

  @override
  String get justNow => 'щойно';

  @override
  String minutesAgo(int minutes) {
    return '$minutesхв тому';
  }

  @override
  String hoursAgo(int hours) {
    return '$hoursгод тому';
  }

  @override
  String daysAgo(int days) {
    return '$daysд тому';
  }

  @override
  String get microphonePermissionDenied => 'Дозвіл на мікрофон відхилено';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Живе транскрибування недоступне: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Не вдалося розпочати запис: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Використання транскрибування на пристрої';

  @override
  String get transcribingWithWhisper =>
      'Транскрибування за допомогою Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API не вдалося: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Транскрибування не захоплено';

  @override
  String failedToStopRecording(String error) {
    return 'Не вдалося зупинити запис: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Не вдалося $action: $error';
  }

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Відновити';

  @override
  String get send => 'Надіслати';

  @override
  String get liveActivityActive => 'Жива активність активна';

  @override
  String get restartGateway => 'Перезапустити шлюз';

  @override
  String modelLabel(String model) {
    return 'Модель: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Час роботи: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Фонова підтримка активна - шлюз може продовжувати відповідати';

  @override
  String get webChatBuiltIn => 'Вбудований інтерфейс чату';

  @override
  String get configure => 'Налаштувати';

  @override
  String get disconnect => 'Від\'єднати';

  @override
  String get agents => 'Агенти';

  @override
  String get agentFiles => 'Файли Агента';

  @override
  String get createAgent => 'Створити Агента';

  @override
  String get editAgent => 'Редагувати Агента';

  @override
  String get noAgentsYet => 'Агентів ще немає';

  @override
  String get createYourFirstAgent => 'Створіть свого першого агента!';

  @override
  String get active => 'Активний';

  @override
  String get agentName => 'Ім\'я Агента';

  @override
  String get emoji => 'Емодзі';

  @override
  String get selectEmoji => 'Вибрати Емодзі';

  @override
  String get vibe => 'Стиль';

  @override
  String get vibeHint => 'напр. дружній, формальний, саркастичний';

  @override
  String get modelConfiguration => 'Конфігурація Моделі';

  @override
  String get advancedSettings => 'Розширені Налаштування';

  @override
  String get agentCreated => 'Агента створено';

  @override
  String get agentUpdated => 'Агента оновлено';

  @override
  String get agentDeleted => 'Агента видалено';

  @override
  String switchedToAgent(String name) {
    return 'Перемкнуто на $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Видалити $name? Це видалить усі дані робочого простору.';
  }

  @override
  String get agentDetails => 'Деталі Агента';

  @override
  String get createdAt => 'Створено';

  @override
  String get lastUsed => 'Останнє використання';

  @override
  String get basicInformation => 'Основна Інформація';

  @override
  String get switchToAgent => 'Змінити Агента';

  @override
  String get providers => 'Провайдери';

  @override
  String get addProvider => 'Додати провайдера';

  @override
  String get noProvidersConfigured => 'Провайдери не налаштовані.';

  @override
  String get editCredentials => 'Редагувати облікові дані';

  @override
  String get defaultModelHint =>
      'Модель за замовчуванням використовується агентами, які не вказують власну.';

  @override
  String get voiceCallModelSection => 'Голосовий дзвінок (Live)';

  @override
  String get voiceCallModelDescription =>
      'Використовується лише коли ви натискаєте кнопку дзвінка. Чат, агенти та фонові задачі використовують вашу звичайну модель.';

  @override
  String get voiceCallModelLabel => 'Live-модель';

  @override
  String get voiceCallModelAutomatic => 'Автоматично';

  @override
  String get preferLiveVoiceBootstrapTitle =>
      'Bootstrap через голосовий дзвінок';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'У новому порожньому чаті з BOOTSTRAP.md запускайте голосовий дзвінок замість «тихого» текстового bootstrap (коли Live доступний).';

  @override
  String get liveVoiceNameLabel => 'Голос';

  @override
  String get firstHatchModeChoiceTitle => 'Як ви хочете почати?';

  @override
  String get firstHatchModeChoiceBody =>
      'Можна спілкуватися текстом у чаті або почати голосову розмову — як короткий дзвінок. Оберіть те, що вам зручніше.';

  @override
  String get firstHatchModeChoiceChatButton => 'Писати в чаті';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Говорити голосом';

  @override
  String get liveVoiceBargeInHint =>
      'Говоріть після того, як асистент закінчить (ехо раніше перебивало їх посеред мовлення).';

  @override
  String get liveVoiceFallbackTitle => 'Наживо';

  @override
  String get liveVoiceEndConversationTooltip => 'Завершити розмову';

  @override
  String get liveVoiceStatusConnecting => 'Підключення…';

  @override
  String get liveVoiceStatusRunning => 'Виконується…';

  @override
  String get liveVoiceStatusSpeaking => 'Говорить…';

  @override
  String get liveVoiceStatusListening => 'Слухає…';

  @override
  String get liveVoiceBadge => 'НАЖИВО';

  @override
  String get cannotAddLiveModelAsChat =>
      'Ця модель лише для голосових дзвінків. Оберіть модель чату зі списку.';

  @override
  String get authBearerTokenLabel => 'Bearer-токен';

  @override
  String get authAccessKeysLabel => 'Ключі доступу';

  @override
  String authModelsFoundCount(int count) {
    return 'Знайдено моделей: $count';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return 'Ще $count — введіть ID вручну';
  }

  @override
  String get scanQrBarcodeTitle => 'Сканувати QR / штрихкод';

  @override
  String get oauthSignInTitle => 'Увійти';

  @override
  String get browserOverlayDone => 'Готово';

  @override
  String appInitializationError(String error) {
    return 'Помилка ініціалізації: $error';
  }

  @override
  String get credentialsScreenTitle => 'Облікові дані';

  @override
  String get credentialsIntroBody =>
      'Додайте кілька API-ключів на провайдера. FlutterClaw чергує їх і охолоджує при лімітах.';

  @override
  String get credentialsNoProvidersBody =>
      'Провайдерів не налаштовано.\nПерейдіть у Налаштування → Провайдери та моделі, щоб додати.';

  @override
  String get credentialsAddKeyTooltip => 'Додати ключ';

  @override
  String get credentialsNoExtraKeysMessage =>
      'Додаткових ключів немає — використовується ключ із Провайдери та моделі.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'Додати ключ $provider';
  }

  @override
  String get credentialsKeyLabelHint => 'Мітка (наприклад «Робочий ключ»)';

  @override
  String get credentialsApiKeyFieldLabel => 'API-ключ';

  @override
  String get securitySettingsTitle => 'Безпека';

  @override
  String get securitySettingsIntro =>
      'Керування перевірками безпеки від небезпечних операцій. Діють у поточній сесії.';

  @override
  String get securitySectionToolExecution => 'ВИКОНАННЯ ІНСТРУМЕНТІВ';

  @override
  String get securityPatternDetectionTitle => 'Виявлення небезпечних шаблонів';

  @override
  String get securityPatternDetectionSubtitle =>
      'Блокує небезпечні шаблони: ін\'єкція в shell, path traversal, eval/exec, XSS, десеріалізація.';

  @override
  String get securityUnsafeModeBanner =>
      'Перевірки безпеки вимкнено. Виклики інструментів без валідації. Увімкніть знову після роботи.';

  @override
  String get securitySectionHowItWorks => 'ЯК ЦЕ ПРАЦЮЄ';

  @override
  String get securityHowItWorksBlocked =>
      'Якщо виклик збігається з небезпечним шаблоном, він блокується, агенту повідомляють чому.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'Команда /unsafe у чаті — разове дозволення заблокованого виклику, далі перевірки знову вмикаються.';

  @override
  String get securityHowItWorksToggleSession =>
      'Вимкніть тут «Виявлення небезпечних шаблонів», щоб вимкнути перевірки на всю сесію.';

  @override
  String get holdToSetAsDefault => 'Утримуйте, щоб встановити за замовчуванням';

  @override
  String get integrations => 'Інтеграції';

  @override
  String get shortcutsIntegrations => 'Інтеграції Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'Встановіть iOS Shortcuts для запуску дій сторонніх додатків';

  @override
  String get dangerZone => 'Небезпечна зона';

  @override
  String get resetOnboarding => 'Скинути і перезапустити налаштування';

  @override
  String get resetOnboardingDesc =>
      'Видаляє всю конфігурацію і повертає до майстра налаштування.';

  @override
  String get resetAllConfiguration => 'Скинути всю конфігурацію?';

  @override
  String get resetAllConfigurationDesc =>
      'Це видалить ваші API-ключі, моделі та всі налаштування. Додаток повернеться до майстра налаштування.\n\nІсторія розмов не видаляється.';

  @override
  String get removeProvider => 'Видалити провайдера';

  @override
  String removeProviderConfirm(String provider) {
    return 'Видалити облікові дані для $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name встановлено як модель за замовчуванням';
  }

  @override
  String get photoImage => 'Фото / Зображення';

  @override
  String get documentPdfTxt => 'Документ (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Не вдалося відкрити документ: $error';
  }

  @override
  String get retry => 'Повторити';

  @override
  String get gatewayStopped => 'Шлюз зупинено';

  @override
  String get gatewayStarted => 'Шлюз успішно запущено!';

  @override
  String gatewayFailed(String error) {
    return 'Шлюз не вдалося: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Виняток: $error';
  }

  @override
  String get pairingRequestApproved => 'Запит на парування затверджено';

  @override
  String get pairingRequestRejected => 'Запит на парування відхилено';

  @override
  String get addDevice => 'Додати Пристрій';

  @override
  String get telegramConfigSaved => 'Конфігурацію Telegram збережено';

  @override
  String get discordConfigSaved => 'Конфігурацію Discord збережено';

  @override
  String get securityMethod => 'Метод Безпеки';

  @override
  String get pairingRecommended => 'Парування (Рекомендовано)';

  @override
  String get pairingDescription =>
      'Нові користувачі отримують код парування. Ви затверджуєте або відхиляєте їх.';

  @override
  String get allowlistTitle => 'Список дозволених';

  @override
  String get allowlistDescription =>
      'Лише конкретні ID користувачів можуть отримати доступ до бота.';

  @override
  String get openAccess => 'Відкритий';

  @override
  String get openAccessDescription =>
      'Будь-хто може використовувати бота негайно (не рекомендовано).';

  @override
  String get disabledAccess => 'Вимкнено';

  @override
  String get disabledAccessDescription =>
      'Приватні повідомлення заборонені. Бот не відповідатиме на жодні повідомлення.';

  @override
  String get approvedDevices => 'Затверджені Пристрої';

  @override
  String get noApprovedDevicesYet => 'Затверджених пристроїв ще немає';

  @override
  String get devicesAppearAfterApproval =>
      'Пристрої з\'являться тут після затвердження запитів на парування';

  @override
  String get noAllowedUsersConfigured => 'Дозволені користувачі не налаштовані';

  @override
  String get addUserIdsHint =>
      'Додайте ID користувачів, щоб дозволити їм використовувати бота';

  @override
  String get removeDevice => 'Видалити пристрій?';

  @override
  String removeAccessFor(String name) {
    return 'Видалити доступ для $name?';
  }

  @override
  String get saving => 'Збереження...';

  @override
  String get channelsLabel => 'Канали';

  @override
  String get clawHubAccount => 'Обліковий запис ClawHub';

  @override
  String get loggedInToClawHub => 'Ви зараз увійшли в ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Вийшли з ClawHub';

  @override
  String get login => 'Увійти';

  @override
  String get logout => 'Вийти';

  @override
  String get connect => 'Підключити';

  @override
  String get pasteClawHubToken => 'Вставте ваш токен API ClawHub';

  @override
  String get pleaseEnterApiToken => 'Будь ласка, введіть токен API';

  @override
  String get successfullyConnected => 'Успішно підключено до ClawHub';

  @override
  String get browseSkillsButton => 'Переглянути Навички';

  @override
  String get installSkill => 'Встановити Навичку';

  @override
  String get incompatibleSkill => 'Несумісна Навичка';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Ця навичка не може працювати на мобільному пристрої (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Попередження про Сумісність';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Ця навичка була розроблена для десктопу і може не працювати на мобільному.\n\n$reason\n\nБажаєте встановити адаптовану версію, оптимізовану для мобільного?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Встановити Оригінал';

  @override
  String get installAdapted => 'Встановити Адаптовану';

  @override
  String get resetSession => 'Скинути Сесію';

  @override
  String resetSessionConfirm(String key) {
    return 'Скинути сесію \"$key\"? Це видалить усі повідомлення.';
  }

  @override
  String get sessionReset => 'Сесію скинуто';

  @override
  String get activeSessions => 'Активні Сесії';

  @override
  String get scheduledTasks => 'Заплановані Завдання';

  @override
  String get defaultBadge => 'За замовчуванням';

  @override
  String errorGeneric(String error) {
    return 'Помилка: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName збережено';
  }

  @override
  String errorSavingFile(String error) {
    return 'Помилка збереження файлу: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Неможливо видалити останнього агента';

  @override
  String get close => 'Закрити';

  @override
  String get nameIsRequired => 'Ім\'я обов\'язкове';

  @override
  String get pleaseSelectModel => 'Будь ласка, виберіть модель';

  @override
  String temperatureLabel(String value) {
    return 'Температура: $value';
  }

  @override
  String get maxTokens => 'Максимум Токенів';

  @override
  String get maxTokensRequired => 'Максимум токенів обов\'язковий';

  @override
  String get mustBePositiveNumber => 'Має бути додатним числом';

  @override
  String get maxToolIterations => 'Максимум Ітерацій Інструментів';

  @override
  String get maxIterationsRequired => 'Максимум ітерацій обов\'язковий';

  @override
  String get restrictToWorkspace => 'Обмежити Робочим Простором';

  @override
  String get restrictToWorkspaceDesc =>
      'Обмежити файлові операції робочим простором агента';

  @override
  String get noModelsConfiguredLong =>
      'Будь ласка, додайте хоча б одну модель у Налаштуваннях перед створенням агента.';

  @override
  String get selectProviderFirst => 'Спочатку виберіть провайдера';

  @override
  String get skip => 'Пропустити';

  @override
  String get continueButton => 'Продовжити';

  @override
  String get uiAutomation => 'Автоматизація Інтерфейсу';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw може керувати вашим екраном — натискати кнопки, заповнювати форми, прокручувати та автоматизувати повторювані завдання в будь-якому додатку.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Це вимагає увімкнення Служби Доступності в налаштуваннях Android. Ви можете пропустити це і увімкнути пізніше.';

  @override
  String get openAccessibilitySettings => 'Відкрити Налаштування Доступності';

  @override
  String get skipForNow => 'Пропустити зараз';

  @override
  String get checkingPermission => 'Перевірка дозволу…';

  @override
  String get accessibilityEnabled => 'Службу Доступності увімкнено';

  @override
  String get accessibilityNotEnabled => 'Службу Доступності не увімкнено';

  @override
  String get exploreIntegrations => 'Огляд Інтеграцій';

  @override
  String get requestTimedOut => 'Час очікування запиту вичерпано';

  @override
  String get myShortcuts => 'Мої Ярлики';

  @override
  String get addShortcut => 'Додати Ярлик';

  @override
  String get noShortcutsYet => 'Ярликів ще немає';

  @override
  String get shortcutsInstructions =>
      'Створіть ярлик у додатку iOS Shortcuts, додайте дію зворотного виклику в кінці, потім зареєструйте тут, щоб AI міг його запускати.';

  @override
  String get shortcutName => 'Назва ярлика';

  @override
  String get shortcutNameHint => 'Точна назва з додатку Shortcuts';

  @override
  String get descriptionOptional => 'Опис (необов\'язково)';

  @override
  String get whatDoesShortcutDo => 'Що робить цей ярлик?';

  @override
  String get callbackSetup => 'Налаштування зворотного виклику';

  @override
  String get callbackInstructions =>
      'Кожен ярлик повинен закінчуватися:\n① Отримати Значення за Ключем → \"callbackUrl\" (з Вхідних даних Ярлика, розібраних як dict)\n② Відкрити URL ← вихід з ①';

  @override
  String get channelApp => 'Додаток';

  @override
  String get channelHeartbeat => 'Серцебиття';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Субагент';

  @override
  String get channelSystem => 'Система';

  @override
  String secondsAgo(int seconds) {
    return '$secondsс тому';
  }

  @override
  String get messagesAbbrev => 'пов';

  @override
  String get modelAlreadyAdded => 'Ця модель уже є у вашому списку';

  @override
  String get bothTokensRequired => 'Обидва токени обов\'язкові';

  @override
  String get slackSavedRestart =>
      'Slack збережено — перезапустіть шлюз для підключення';

  @override
  String get slackConfiguration => 'Конфігурація Slack';

  @override
  String get setupTitle => 'Налаштування';

  @override
  String get slackSetupInstructions =>
      '1. Створіть додаток Slack на api.slack.com/apps\n2. Увімкніть Socket Mode → згенеруйте токен рівня застосунку (xapp-…)\n   з областю: connections:write\n3. Додайте області токена бота: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Встановіть додаток у workspace → скопіюйте токен бота (xoxb-…)';

  @override
  String get botTokenXoxb => 'Токен бота (xoxb-…)';

  @override
  String get appLevelToken => 'Токен рівня застосунку (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'URL API та номер телефону обов\'язкові';

  @override
  String get signalSavedRestart =>
      'Signal збережено — перезапустіть шлюз для підключення';

  @override
  String get signalConfiguration => 'Конфігурація Signal';

  @override
  String get requirementsTitle => 'Вимоги';

  @override
  String get signalRequirements =>
      'Потрібен signal-cli-rest-api, що працює на сервері:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nЗареєструйте/прив\'яжіть ваш номер Signal через REST API, потім введіть URL і номер телефону нижче.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Ваш номер телефону Signal';

  @override
  String get userIdLabel => 'ID Користувача';

  @override
  String get enterDiscordUserId => 'Введіть ID користувача Discord';

  @override
  String get enterTelegramUserId => 'Введіть ID користувача Telegram';

  @override
  String get fromDiscordDevPortal => 'З Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Дозволені ID Користувачів';

  @override
  String get approvedDevice => 'Затверджений пристрій';

  @override
  String get allowedUser => 'Дозволений користувач';

  @override
  String get howToGetBotToken => 'Як отримати токен бота';

  @override
  String get discordTokenInstructions =>
      '1. Перейдіть у Discord Developer Portal\n2. Створіть новий додаток і бота\n3. Скопіюйте токен і вставте його вище\n4. Увімкніть Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Відкрийте Telegram і знайдіть @BotFather\n2. Надішліть /newbot і дотримуйтесь інструкцій\n3. Скопіюйте токен і вставте його вище';

  @override
  String get fromBotFatherHint => 'Отримайте від @BotFather';

  @override
  String get accessTokenLabel => 'Токен доступу';

  @override
  String get notSetOpenAccess =>
      'Не встановлено — відкритий доступ (лише loopback)';

  @override
  String get gatewayAccessToken => 'Токен доступу до шлюзу';

  @override
  String get tokenFieldLabel => 'Токен';

  @override
  String get leaveEmptyDisableAuth =>
      'Залиште порожнім, щоб вимкнути автентифікацію';

  @override
  String get toolPolicies => 'Політики Інструментів';

  @override
  String get toolPoliciesDesc =>
      'Контролюйте, до чого агент може отримати доступ. Вимкнені інструменти приховані від AI і заблоковані під час виконання.';

  @override
  String get privacySensors => 'Конфіденційність і Датчики';

  @override
  String get networkCategory => 'Мережа';

  @override
  String get systemCategory => 'Система';

  @override
  String get toolTakePhotos => 'Робити Фотографії';

  @override
  String get toolTakePhotosDesc =>
      'Дозволити агенту робити фотографії за допомогою камери';

  @override
  String get toolRecordVideo => 'Записувати Відео';

  @override
  String get toolRecordVideoDesc => 'Дозволити агенту записувати відео';

  @override
  String get toolLocation => 'Місцезнаходження';

  @override
  String get toolLocationDesc =>
      'Дозволити агенту читати ваше поточне GPS-місцезнаходження';

  @override
  String get toolHealthData => 'Дані про Здоров\'я';

  @override
  String get toolHealthDataDesc =>
      'Дозволити агенту читати дані про здоров\'я/фітнес';

  @override
  String get toolContacts => 'Контакти';

  @override
  String get toolContactsDesc => 'Дозволити агенту шукати у ваших контактах';

  @override
  String get toolScreenshots => 'Скріншоти';

  @override
  String get toolScreenshotsDesc => 'Дозволити агенту робити скріншоти екрана';

  @override
  String get toolWebFetch => 'Завантаження Веб-сторінок';

  @override
  String get toolWebFetchDesc => 'Дозволити агенту завантажувати контент з URL';

  @override
  String get toolWebSearch => 'Пошук в Інтернеті';

  @override
  String get toolWebSearchDesc => 'Дозволити агенту шукати в інтернеті';

  @override
  String get toolHttpRequests => 'HTTP-Запити';

  @override
  String get toolHttpRequestsDesc =>
      'Дозволити агенту виконувати довільні HTTP-запити';

  @override
  String get toolSandboxShell => 'Оболонка Пісочниці';

  @override
  String get toolSandboxShellDesc =>
      'Дозволити агенту виконувати команди оболонки в пісочниці';

  @override
  String get toolImageGeneration => 'Генерація Зображень';

  @override
  String get toolImageGenerationDesc =>
      'Дозволити агенту генерувати зображення за допомогою AI';

  @override
  String get toolLaunchApps => 'Запуск Додатків';

  @override
  String get toolLaunchAppsDesc =>
      'Дозволити агенту відкривати встановлені додатки';

  @override
  String get toolLaunchIntents => 'Запуск Інтентів';

  @override
  String get toolLaunchIntentsDesc =>
      'Дозволити агенту запускати інтенти Android (глибокі посилання, системні екрани)';

  @override
  String get renameSession => 'Перейменувати сесію';

  @override
  String get myConversationName => 'Назва моєї розмови';

  @override
  String get renameAction => 'Перейменувати';

  @override
  String get couldNotTranscribeAudio => 'Не вдалося транскрибувати аудіо';

  @override
  String get stopRecording => 'Зупинити запис';

  @override
  String get voiceInput => 'Голосове введення';

  @override
  String get speakMessage => 'Озвучити';

  @override
  String get stopSpeaking => 'Зупинити озвучення';

  @override
  String get selectText => 'Вибрати текст';

  @override
  String get messageCopied => 'Повідомлення скопійовано';

  @override
  String get copyTooltip => 'Копіювати';

  @override
  String get commandsTooltip => 'Команди';

  @override
  String get providersAndModels => 'Провайдери та Моделі';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count моделей налаштовано',
      many: '$count моделей налаштовано',
      few: '$count моделі налаштовано',
      one: '1 модель налаштована',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Автозапуск увімкнено';

  @override
  String get autoStartOffLabel => 'Автозапуск вимкнено';

  @override
  String get allToolsEnabled => 'Усі інструменти увімкнено';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count інструментів вимкнено',
      many: '$count інструментів вимкнено',
      few: '$count інструменти вимкнено',
      one: '1 інструмент вимкнено',
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
  String get officialWebsite => 'Офіційний вебсайт';

  @override
  String get noPendingPairingRequests =>
      'Немає очікуваних запитів на парування';

  @override
  String get pairingRequestsTitle => 'Запити на Парування';

  @override
  String get gatewayStartingStatus => 'Запуск шлюзу...';

  @override
  String get gatewayRetryingStatus => 'Повторний запуск шлюзу...';

  @override
  String get errorStartingGateway => 'Помилка запуску шлюзу';

  @override
  String get runningStatus => 'Працює';

  @override
  String get stoppedStatus => 'Зупинено';

  @override
  String get notSetUpStatus => 'Не налаштовано';

  @override
  String get configuredStatus => 'Налаштовано';

  @override
  String get whatsAppConfigSaved => 'Конфігурацію WhatsApp збережено';

  @override
  String get whatsAppDisconnected => 'WhatsApp від\'єднано';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Застосування...';

  @override
  String get reconnectWhatsApp => 'Перепідключити WhatsApp';

  @override
  String get saveSettingsLabel => 'Зберегти Налаштування';

  @override
  String get applySettingsRestart =>
      'Застосувати Налаштування та Перезапустити';

  @override
  String get whatsAppMode => 'Режим WhatsApp';

  @override
  String get myPersonalNumber => 'Мій особистий номер';

  @override
  String get myPersonalNumberDesc =>
      'Повідомлення, які ви надсилаєте у власний чат WhatsApp, будять агента.';

  @override
  String get dedicatedBotAccount => 'Виділений акаунт бота';

  @override
  String get dedicatedBotAccountDesc =>
      'Повідомлення, надіслані з прив\'язаного акаунта, ігноруються як вихідні.';

  @override
  String get allowedNumbers => 'Дозволені Номери';

  @override
  String get addNumberTitle => 'Додати Номер';

  @override
  String get phoneNumberJid => 'Номер телефону / JID';

  @override
  String get noAllowedNumbersConfigured => 'Дозволені номери не налаштовані';

  @override
  String get devicesAppearAfterPairing =>
      'Пристрої з\'являться тут після затвердження запитів на парування';

  @override
  String get addPhoneNumbersHint =>
      'Додайте номери телефонів, щоб дозволити їм використовувати бота';

  @override
  String get allowedNumber => 'Дозволений номер';

  @override
  String get howToConnect => 'Як підключитися';

  @override
  String get whatsAppConnectInstructions =>
      '1. Натисніть \"Підключити WhatsApp\" вище\n2. З\'явиться QR-код — відскануйте його за допомогою WhatsApp\n   (Налаштування → Пов\'язані пристрої → Прив\'язати пристрій)\n3. Після підключення вхідні повідомлення автоматично\n   перенаправляються вашому активному агенту AI';

  @override
  String get whatsAppPairingDesc =>
      'Нові відправники отримують код парування. Ви їх затверджуєте.';

  @override
  String get whatsAppAllowlistDesc =>
      'Лише певні номери телефонів можуть писати боту.';

  @override
  String get whatsAppOpenDesc =>
      'Будь-хто, хто пише вам, може використовувати бота.';

  @override
  String get whatsAppDisabledDesc =>
      'Бот не відповідатиме на вхідні повідомлення.';

  @override
  String get sessionExpiredRelink =>
      'Сесія закінчилася. Натисніть \"Перепідключити\" нижче, щоб відсканувати новий QR-код.';

  @override
  String get connectWhatsAppBelow =>
      'Натисніть \"Підключити WhatsApp\" нижче, щоб прив\'язати акаунт.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp прийняв QR-код. Завершення прив\'язки...';

  @override
  String get waitingForWhatsApp =>
      'Очікування завершення прив\'язки WhatsApp...';

  @override
  String get focusedLabel => 'Сфокусована';

  @override
  String get balancedLabel => 'Збалансована';

  @override
  String get creativeLabel => 'Креативна';

  @override
  String get preciseLabel => 'Точна';

  @override
  String get expressiveLabel => 'Виразна';

  @override
  String get browseLabel => 'Перегляд';

  @override
  String get apiTokenLabel => 'API Токен';

  @override
  String get connectToClawHub => 'Підключитися до ClawHub';

  @override
  String get clawHubLoginHint =>
      'Увійдіть у ClawHub, щоб отримати доступ до преміум-навичок та встановлення пакетів';

  @override
  String get howToGetApiToken => 'Як отримати ваш API-токен:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Відвідайте clawhub.ai та увійдіть через GitHub\n2. Виконайте \"clawhub login\" у терміналі\n3. Скопіюйте токен і вставте його сюди';

  @override
  String connectionFailed(String error) {
    return 'Помилка підключення: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count запусків';
  }

  @override
  String nextRunLabel(String time) {
    return 'Наступний запуск: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Остання помилка: $error';
  }

  @override
  String get cronJobHintText =>
      'Інструкції для агента при спрацюванні цього завдання…';

  @override
  String get androidPermissions => 'Дозволи Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw може керувати вашим екраном — натискати кнопки, заповнювати форми, прокручувати та автоматизувати повторювані завдання в будь-якому додатку.';

  @override
  String get twoPermissionsNeeded =>
      'Для повного досвіду потрібні два дозволи. Ви можете пропустити це і увімкнути їх пізніше в Налаштуваннях.';

  @override
  String get accessibilityService => 'Служба Доступності';

  @override
  String get accessibilityServiceDesc =>
      'Дозволяє натискати, проводити пальцем, друкувати та читати вміст екрана';

  @override
  String get displayOverOtherApps => 'Відображення Поверх Інших Додатків';

  @override
  String get displayOverOtherAppsDesc =>
      'Показує плаваючий чіп статусу, щоб ви могли бачити, що робить агент';

  @override
  String get changeDefaultModel => 'Змінити модель за замовчуванням';

  @override
  String setModelAsDefault(String name) {
    return 'Встановити $name як модель за замовчуванням.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'агентів',
      many: 'агентів',
      few: 'агента',
      one: 'агента',
    );
    return 'Також оновити $count $_temp0';
  }

  @override
  String get startNewSessions => 'Почати нові сесії';

  @override
  String get currentConversationsArchived =>
      'Поточні розмови будуть заархівовані';

  @override
  String get applyAction => 'Застосувати';

  @override
  String applyModelQuestion(String name) {
    return 'Застосувати $name?';
  }

  @override
  String get setAsDefaultModel => 'Встановити як модель за замовчуванням';

  @override
  String get usedByAgentsWithout =>
      'Використовується агентами без конкретної моделі';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'агентів',
      many: 'агентів',
      few: 'агентів',
      one: 'агента',
    );
    return 'Застосувати до $count $_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Провайдер вже автентифіковано — API-ключ не потрібен.';

  @override
  String get selectFromList => 'Вибрати зі списку';

  @override
  String get enterCustomModelId => 'Ввести власний ID моделі';

  @override
  String get removeSkillTitle => 'Видалити навичку?';

  @override
  String get browseClawHubToDiscover =>
      'Переглядайте ClawHub, щоб виявляти та встановлювати навички';

  @override
  String get addDeviceTooltip => 'Додати пристрій';

  @override
  String get addNumberTooltip => 'Додати номер';

  @override
  String get searchSkillsHint => 'Пошук навичок...';

  @override
  String get loginToClawHub => 'Увійти в ClawHub';

  @override
  String get accountTooltip => 'Акаунт';

  @override
  String get editAction => 'Редагувати';

  @override
  String get setAsDefaultAction => 'Встановити за замовчуванням';

  @override
  String get chooseProviderTitle => 'Виберіть провайдера';

  @override
  String get apiKeyTitle => 'API-ключ';

  @override
  String get slackConfigSaved =>
      'Slack збережено — перезапустіть шлюз для підключення';

  @override
  String get signalConfigSaved =>
      'Signal збережено — перезапустіть шлюз для підключення';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Додати пристрій';

  @override
  String get skipAction => 'Пропустити';

  @override
  String get mcpServers => 'MCP-сервери';

  @override
  String get noMcpServersConfigured => 'MCP-сервери не налаштовані';

  @override
  String get mcpServersEmptyHint =>
      'Додайте MCP-сервери, щоб надати агенту доступ до інструментів GitHub, Notion, Slack, баз даних та інших сервісів.';

  @override
  String get addMcpServer => 'Додати MCP-сервер';

  @override
  String get editMcpServer => 'Редагувати MCP-сервер';

  @override
  String get removeMcpServer => 'Видалити MCP-сервер';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Видалити \"$name\"? Його інструменти стануть недоступними.';
  }

  @override
  String get mcpTransport => 'Транспорт';

  @override
  String get testConnection => 'Перевірити з\'єднання';

  @override
  String get mcpServerNameLabel => 'Назва сервера';

  @override
  String get mcpServerNameHint => 'напр. GitHub, Notion, Моя БД';

  @override
  String get mcpServerUrlLabel => 'URL сервера';

  @override
  String get mcpBearerTokenLabel => 'Bearer-токен (необов\'язково)';

  @override
  String get mcpBearerTokenHint =>
      'Залишіть порожнім, якщо авторизація не потрібна';

  @override
  String get mcpCommandLabel => 'Команда';

  @override
  String get mcpArgumentsLabel => 'Аргументи (через пробіл)';

  @override
  String get mcpEnvVarsLabel =>
      'Змінні середовища (КЛЮЧ=ЗНАЧЕННЯ, по одному на рядок)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio недоступний на iOS. Використовуйте HTTP або SSE.';

  @override
  String get connectedStatus => 'Підключено';

  @override
  String get mcpConnecting => 'Підключення...';

  @override
  String get mcpConnectionError => 'Помилка підключення';

  @override
  String get mcpDisconnected => 'Відключено';

  @override
  String mcpToolsCount(int count) {
    return '$count інструментів';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — знайдено $count інструментів';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Підключено (0 інструментів)';

  @override
  String get mcpTestFailed =>
      'Помилка підключення. Перевірте URL/токен сервера.';

  @override
  String get mcpAddServer => 'Додати сервер';

  @override
  String get mcpSaveChanges => 'Зберегти зміни';

  @override
  String get urlIsRequired => 'URL є обов\'язковим';

  @override
  String get enterValidUrl => 'Введіть коректний URL';

  @override
  String get commandIsRequired => 'Команда є обов\'язковою';

  @override
  String skillRemoved(String name) {
    return 'Навичку \"$name\" видалено';
  }

  @override
  String get editFileContentHint => 'Редагувати вміст файлу...';

  @override
  String get whatsAppPairSubtitle =>
      'Прив\'яжіть особистий акаунт WhatsApp за допомогою QR-коду';

  @override
  String get whatsAppPairingOptional =>
      'Прив\'язка необов\'язкова. Ви можете завершити налаштування зараз і додати прив\'язку пізніше.';

  @override
  String get whatsAppEnableToLink =>
      'Увімкніть WhatsApp, щоб почати прив\'язку пристрою.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp прив\'язано. FlutterClaw зможе відповідати після завершення налаштування.';

  @override
  String get cancelLink => 'Скасувати прив\'язку';
}
