// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Чат';

  @override
  String get channels => 'Каналы';

  @override
  String get agent => 'Агент';

  @override
  String get settings => 'Настройки';

  @override
  String get getStarted => 'Начать';

  @override
  String get yourPersonalAssistant => 'Ваш личный ИИ-ассистент';

  @override
  String get multiChannelChat => 'Мультиканальный чат';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat и другие';

  @override
  String get powerfulAIModels => 'Мощные модели ИИ';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok и бесплатные модели';

  @override
  String get localGateway => 'Локальный шлюз';

  @override
  String get localGatewayDesc =>
      'Работает на вашем устройстве, ваши данные остаются вашими';

  @override
  String get chooseProvider => 'Выбрать Провайдера';

  @override
  String get selectProviderDesc =>
      'Выберите, как вы хотите подключиться к моделям ИИ.';

  @override
  String get startForFree => 'Начать Бесплатно';

  @override
  String get freeProvidersDesc =>
      'Эти провайдеры предлагают бесплатные модели для начала работы без затрат.';

  @override
  String get free => 'БЕСПЛАТНО';

  @override
  String get otherProviders => 'Другие Провайдеры';

  @override
  String connectToProvider(String provider) {
    return 'Подключиться к $provider';
  }

  @override
  String get enterApiKeyDesc => 'Введите ваш API-ключ и выберите модель.';

  @override
  String get dontHaveApiKey => 'Нет API-ключа?';

  @override
  String get createAccountCopyKey =>
      'Создайте учетную запись и скопируйте ключ.';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get apiKey => 'API-ключ';

  @override
  String get pasteFromClipboard => 'Вставить из буфера обмена';

  @override
  String get apiBaseUrl => 'Базовый URL API';

  @override
  String get selectModel => 'Выбрать Модель';

  @override
  String get modelId => 'ID Модели';

  @override
  String get validateKey => 'Проверить Ключ';

  @override
  String get validating => 'Проверка...';

  @override
  String get invalidApiKey => 'Недействительный API-ключ';

  @override
  String get gatewayConfiguration => 'Конфигурация Шлюза';

  @override
  String get gatewayConfigDesc =>
      'Шлюз - это локальная плоскость управления вашего ассистента.';

  @override
  String get defaultSettingsNote =>
      'Настройки по умолчанию работают для большинства пользователей. Изменяйте только если знаете, что вам нужно.';

  @override
  String get host => 'Хост';

  @override
  String get port => 'Порт';

  @override
  String get autoStartGateway => 'Автозапуск шлюза';

  @override
  String get autoStartGatewayDesc =>
      'Запускать шлюз автоматически при запуске приложения.';

  @override
  String get channelsPageTitle => 'Каналы';

  @override
  String get channelsPageDesc =>
      'Подключите каналы обмена сообщениями опционально. Вы всегда можете настроить их позже в Настройках.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Подключите бота Telegram.';

  @override
  String get openBotFather => 'Открыть BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Подключите бота Discord.';

  @override
  String get developerPortal => 'Портал Разработчика';

  @override
  String get botToken => 'Токен Бота';

  @override
  String telegramBotToken(String platform) {
    return 'Токен Бота $platform';
  }

  @override
  String get readyToGo => 'Готово к Запуску';

  @override
  String get reviewConfiguration =>
      'Проверьте конфигурацию и запустите FlutterClaw.';

  @override
  String get model => 'Модель';

  @override
  String viaProvider(String provider) {
    return 'через $provider';
  }

  @override
  String get gateway => 'Шлюз';

  @override
  String get webChatOnly => 'Только WebChat (можете добавить больше позже)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Запуск...';

  @override
  String get startFlutterClaw => 'Запустить FlutterClaw';

  @override
  String get newSession => 'Новая сессия';

  @override
  String get photoLibrary => 'Библиотека Фото';

  @override
  String get camera => 'Камера';

  @override
  String get whatDoYouSeeInImage => 'Что вы видите на этом изображении?';

  @override
  String get imagePickerNotAvailable =>
      'Выбор изображений недоступен в симуляторе. Используйте реальное устройство.';

  @override
  String get couldNotOpenImagePicker => 'Не удалось открыть выбор изображений.';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get attachImage => 'Прикрепить изображение';

  @override
  String get messageFlutterClaw => 'Сообщение FlutterClaw...';

  @override
  String get channelsAndGateway => 'Каналы и Шлюз';

  @override
  String get stop => 'Остановить';

  @override
  String get start => 'Запустить';

  @override
  String status(String status) {
    return 'Статус: $status';
  }

  @override
  String get builtInChatInterface => 'Встроенный интерфейс чата';

  @override
  String get notConfigured => 'Не настроено';

  @override
  String get connected => 'Подключено';

  @override
  String get configuredStarting => 'Настроено (запуск...)';

  @override
  String get telegramConfiguration => 'Конфигурация Telegram';

  @override
  String get fromBotFather => 'От @BotFather';

  @override
  String get allowedUserIds => 'Разрешенные ID пользователей (через запятую)';

  @override
  String get leaveEmptyToAllowAll => 'Оставьте пустым, чтобы разрешить всем';

  @override
  String get cancel => 'Отмена';

  @override
  String get saveAndConnect => 'Сохранить и Подключить';

  @override
  String get discordConfiguration => 'Конфигурация Discord';

  @override
  String get pendingPairingRequests => 'Ожидающие Запросы на Сопряжение';

  @override
  String get approve => 'Одобрить';

  @override
  String get reject => 'Отклонить';

  @override
  String get expired => 'Истекло';

  @override
  String minutesLeft(int minutes) {
    return 'Осталось $minutesм';
  }

  @override
  String get workspaceFiles => 'Файлы Рабочего Пространства';

  @override
  String get personalAIAssistant => 'Личный ИИ-Ассистент';

  @override
  String sessionsCount(int count) {
    return 'Сессии ($count)';
  }

  @override
  String get noActiveSessions => 'Нет активных сессий';

  @override
  String get startConversationToCreate => 'Начните разговор, чтобы создать';

  @override
  String get startConversationToSee =>
      'Начните разговор, чтобы увидеть сессии здесь';

  @override
  String get reset => 'Сбросить';

  @override
  String get cronJobs => 'Запланированные Задачи';

  @override
  String get noCronJobs => 'Нет запланированных задач';

  @override
  String get addScheduledTasks =>
      'Добавьте запланированные задачи для вашего агента';

  @override
  String get runNow => 'Выполнить Сейчас';

  @override
  String get enable => 'Включить';

  @override
  String get disable => 'Отключить';

  @override
  String get delete => 'Удалить';

  @override
  String get skills => 'Навыки';

  @override
  String get browseClawHub => 'Просмотреть ClawHub';

  @override
  String get noSkillsInstalled => 'Навыки не установлены';

  @override
  String get browseClawHubToAdd => 'Просмотрите ClawHub, чтобы добавить навыки';

  @override
  String removeSkillConfirm(String name) {
    return 'Удалить \"$name\" из ваших навыков?';
  }

  @override
  String get clawHubSkills => 'Навыки ClawHub';

  @override
  String get searchSkills => 'Поиск навыков...';

  @override
  String get noSkillsFound => 'Навыки не найдены. Попробуйте другой поиск.';

  @override
  String installedSkill(String name) {
    return '$name установлено';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Не удалось установить $name';
  }

  @override
  String get addCronJob => 'Добавить Запланированную Задачу';

  @override
  String get jobName => 'Название Задачи';

  @override
  String get dailySummaryExample => 'напр. Ежедневная Сводка';

  @override
  String get taskPrompt => 'Описание Задачи';

  @override
  String get whatShouldAgentDo => 'Что должен делать агент?';

  @override
  String get interval => 'Интервал';

  @override
  String get every5Minutes => 'Каждые 5 минут';

  @override
  String get every15Minutes => 'Каждые 15 минут';

  @override
  String get every30Minutes => 'Каждые 30 минут';

  @override
  String get everyHour => 'Каждый час';

  @override
  String get every6Hours => 'Каждые 6 часов';

  @override
  String get every12Hours => 'Каждые 12 часов';

  @override
  String get every24Hours => 'Каждые 24 часа';

  @override
  String get add => 'Добавить';

  @override
  String get save => 'Сохранить';

  @override
  String get sessions => 'Сессии';

  @override
  String messagesCount(int count) {
    return '$count сообщений';
  }

  @override
  String tokensCount(int count) {
    return '$count токенов';
  }

  @override
  String get compact => 'Сжать';

  @override
  String get models => 'Модели';

  @override
  String get noModelsConfigured => 'Модели не настроены';

  @override
  String get addModelToStartChatting => 'Добавьте модель, чтобы начать общение';

  @override
  String get addModel => 'Добавить Модель';

  @override
  String get default_ => 'ПО УМОЛЧАНИЮ';

  @override
  String get autoStart => 'Автозапуск';

  @override
  String get startGatewayWhenLaunches =>
      'Запускать шлюз при запуске приложения';

  @override
  String get heartbeat => 'Сердцебиение';

  @override
  String get enabled => 'Включено';

  @override
  String get periodicAgentTasks =>
      'Периодические задачи агента из HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get about => 'О Программе';

  @override
  String get personalAIAssistantForIOS =>
      'Личный ИИ-Ассистент для iOS и Android';

  @override
  String get version => 'Версия';

  @override
  String get basedOnOpenClaw => 'Основано на OpenClaw';

  @override
  String get removeModel => 'Удалить модель?';

  @override
  String removeModelConfirm(String name) {
    return 'Удалить \"$name\" из ваших моделей?';
  }

  @override
  String get remove => 'Удалить';

  @override
  String get setAsDefault => 'Установить По Умолчанию';

  @override
  String get paste => 'Вставить';

  @override
  String get chooseProviderStep => '1. Выбрать Провайдера';

  @override
  String get selectModelStep => '2. Выбрать Модель';

  @override
  String get apiKeyStep => '3. API-ключ';

  @override
  String getApiKeyAt(String provider) {
    return 'Получить API-ключ в $provider';
  }

  @override
  String get justNow => 'только что';

  @override
  String minutesAgo(int minutes) {
    return '$minutesм назад';
  }

  @override
  String hoursAgo(int hours) {
    return '$hoursч назад';
  }

  @override
  String daysAgo(int days) {
    return '$daysд назад';
  }

  @override
  String get microphonePermissionDenied => 'Разрешение на микрофон отклонено';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Живая транскрипция недоступна: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Не удалось начать запись: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Использование транскрипции на устройстве';

  @override
  String get transcribingWithWhisper => 'Транскрибирование с Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API не удалось: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Транскрипция не захвачена';

  @override
  String failedToStopRecording(String error) {
    return 'Не удалось остановить запись: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Не удалось $action: $error';
  }

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Возобновить';

  @override
  String get send => 'Отправить';

  @override
  String get liveActivityActive => 'Live Activity активна';

  @override
  String get restartGateway => 'Перезапустить шлюз';

  @override
  String modelLabel(String model) {
    return 'Модель: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Время работы: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Фоновая поддержка активна - шлюз может продолжать отвечать';

  @override
  String get webChatBuiltIn => 'Встроенный интерфейс чата';

  @override
  String get configure => 'Настроить';

  @override
  String get disconnect => 'Отключить';

  @override
  String get agents => 'Агенты';

  @override
  String get agentFiles => 'Файлы Агента';

  @override
  String get createAgent => 'Создать Агента';

  @override
  String get editAgent => 'Редактировать Агента';

  @override
  String get noAgentsYet => 'Агентов пока нет';

  @override
  String get createYourFirstAgent => 'Создайте своего первого агента!';

  @override
  String get active => 'Активный';

  @override
  String get agentName => 'Имя Агента';

  @override
  String get emoji => 'Эмодзи';

  @override
  String get selectEmoji => 'Выберите Эмодзи';

  @override
  String get vibe => 'Стиль';

  @override
  String get vibeHint => 'напр. дружелюбный, формальный, язвительный';

  @override
  String get modelConfiguration => 'Конфигурация Модели';

  @override
  String get advancedSettings => 'Расширенные Настройки';

  @override
  String get agentCreated => 'Агент создан';

  @override
  String get agentUpdated => 'Агент обновлен';

  @override
  String get agentDeleted => 'Агент удален';

  @override
  String switchedToAgent(String name) {
    return 'Переключено на $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Удалить $name? Все данные рабочего пространства будут удалены.';
  }

  @override
  String get agentDetails => 'Детали Агента';

  @override
  String get createdAt => 'Создано';

  @override
  String get lastUsed => 'Последнее Использование';

  @override
  String get basicInformation => 'Основная Информация';

  @override
  String get switchToAgent => 'Переключить Агента';

  @override
  String get providers => 'Провайдеры';

  @override
  String get addProvider => 'Добавить провайдера';

  @override
  String get noProvidersConfigured => 'Провайдеры не настроены.';

  @override
  String get editCredentials => 'Редактировать учетные данные';

  @override
  String get defaultModelHint =>
      'Модель по умолчанию используется агентами, которые не указали свою.';

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
  String get firstHatchModeChoiceTitle => 'Как вы хотите начать?';

  @override
  String get firstHatchModeChoiceBody =>
      'Можно общаться с ассистентом текстом или начать голосовой разговор — как короткий звонок. Выберите то, что вам удобнее.';

  @override
  String get firstHatchModeChoiceChatButton => 'Писать в чате';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Говорить голосом';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault => 'Удерживайте для установки по умолчанию';

  @override
  String get integrations => 'Интеграции';

  @override
  String get shortcutsIntegrations => 'Интеграция Быстрых Команд';

  @override
  String get shortcutsIntegrationsDesc =>
      'Установите быстрые команды iOS для запуска действий сторонних приложений';

  @override
  String get dangerZone => 'Опасная Зона';

  @override
  String get resetOnboarding => 'Сбросить и перезапустить настройку';

  @override
  String get resetOnboardingDesc =>
      'Удаляет всю конфигурацию и возвращает к мастеру настройки.';

  @override
  String get resetAllConfiguration => 'Сбросить все настройки?';

  @override
  String get resetAllConfigurationDesc =>
      'Это удалит ваши API-ключи, модели и все настройки. Приложение вернется к мастеру настройки.\n\nИстория разговоров не удаляется.';

  @override
  String get removeProvider => 'Удалить провайдера';

  @override
  String removeProviderConfirm(String provider) {
    return 'Удалить учетные данные для $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name установлена как модель по умолчанию';
  }

  @override
  String get photoImage => 'Фото / Изображение';

  @override
  String get documentPdfTxt => 'Документ (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Не удалось открыть документ: $error';
  }

  @override
  String get retry => 'Повторить';

  @override
  String get gatewayStopped => 'Шлюз остановлен';

  @override
  String get gatewayStarted => 'Шлюз успешно запущен!';

  @override
  String gatewayFailed(String error) {
    return 'Ошибка шлюза: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Исключение: $error';
  }

  @override
  String get pairingRequestApproved => 'Запрос на сопряжение одобрен';

  @override
  String get pairingRequestRejected => 'Запрос на сопряжение отклонен';

  @override
  String get addDevice => 'Добавить Устройство';

  @override
  String get telegramConfigSaved => 'Конфигурация Telegram сохранена';

  @override
  String get discordConfigSaved => 'Конфигурация Discord сохранена';

  @override
  String get securityMethod => 'Метод Безопасности';

  @override
  String get pairingRecommended => 'Сопряжение (Рекомендуется)';

  @override
  String get pairingDescription =>
      'Новые пользователи получают код сопряжения. Вы одобряете или отклоняете их.';

  @override
  String get allowlistTitle => 'Список Разрешенных';

  @override
  String get allowlistDescription =>
      'Только определенные ID пользователей могут получить доступ к боту.';

  @override
  String get openAccess => 'Открытый';

  @override
  String get openAccessDescription =>
      'Любой может использовать бота немедленно (не рекомендуется).';

  @override
  String get disabledAccess => 'Отключено';

  @override
  String get disabledAccessDescription =>
      'Личные сообщения не разрешены. Бот не будет отвечать ни на какие сообщения.';

  @override
  String get approvedDevices => 'Одобренные Устройства';

  @override
  String get noApprovedDevicesYet => 'Одобренных устройств пока нет';

  @override
  String get devicesAppearAfterApproval =>
      'Устройства появятся здесь после одобрения их запросов на сопряжение';

  @override
  String get noAllowedUsersConfigured =>
      'Разрешенные пользователи не настроены';

  @override
  String get addUserIdsHint =>
      'Добавьте ID пользователей, чтобы разрешить им использовать бота';

  @override
  String get removeDevice => 'Удалить устройство?';

  @override
  String removeAccessFor(String name) {
    return 'Удалить доступ для $name?';
  }

  @override
  String get saving => 'Сохранение...';

  @override
  String get channelsLabel => 'Каналы';

  @override
  String get clawHubAccount => 'Учетная Запись ClawHub';

  @override
  String get loggedInToClawHub => 'Вы в данный момент авторизованы в ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Выход из ClawHub выполнен';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get connect => 'Подключить';

  @override
  String get pasteClawHubToken => 'Вставьте ваш токен ClawHub API';

  @override
  String get pleaseEnterApiToken => 'Пожалуйста, введите API-токен';

  @override
  String get successfullyConnected => 'Успешно подключено к ClawHub';

  @override
  String get browseSkillsButton => 'Просмотреть Навыки';

  @override
  String get installSkill => 'Установить Навык';

  @override
  String get incompatibleSkill => 'Несовместимый Навык';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Этот навык не может работать на мобильных (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Предупреждение о Совместимости';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Этот навык был разработан для настольных систем и может не работать на мобильных как есть.\n\n$reason\n\nХотите установить адаптированную версию, оптимизированную для мобильных?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Установить Оригинал';

  @override
  String get installAdapted => 'Установить Адаптированную';

  @override
  String get resetSession => 'Сбросить Сессию';

  @override
  String resetSessionConfirm(String key) {
    return 'Сбросить сессию \"$key\"? Все сообщения будут удалены.';
  }

  @override
  String get sessionReset => 'Сессия сброшена';

  @override
  String get activeSessions => 'Активные Сессии';

  @override
  String get scheduledTasks => 'Запланированные Задачи';

  @override
  String get defaultBadge => 'По умолчанию';

  @override
  String errorGeneric(String error) {
    return 'Ошибка: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName сохранен';
  }

  @override
  String errorSavingFile(String error) {
    return 'Ошибка сохранения файла: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Нельзя удалить последнего агента';

  @override
  String get close => 'Закрыть';

  @override
  String get nameIsRequired => 'Имя обязательно';

  @override
  String get pleaseSelectModel => 'Пожалуйста, выберите модель';

  @override
  String temperatureLabel(String value) {
    return 'Температура: $value';
  }

  @override
  String get maxTokens => 'Макс. Токенов';

  @override
  String get maxTokensRequired => 'Макс. токенов обязательно';

  @override
  String get mustBePositiveNumber => 'Должно быть положительным числом';

  @override
  String get maxToolIterations => 'Макс. Итераций Инструмента';

  @override
  String get maxIterationsRequired => 'Макс. итераций обязательно';

  @override
  String get restrictToWorkspace => 'Ограничить Рабочим Пространством';

  @override
  String get restrictToWorkspaceDesc =>
      'Ограничить файловые операции рабочим пространством агента';

  @override
  String get noModelsConfiguredLong =>
      'Пожалуйста, добавьте хотя бы одну модель в Настройках перед созданием агента.';

  @override
  String get selectProviderFirst => 'Сначала выберите провайдера';

  @override
  String get skip => 'Пропустить';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get uiAutomation => 'Автоматизация UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw может управлять экраном от вашего имени — нажимать кнопки, заполнять формы, прокручивать и автоматизировать повторяющиеся задачи в любом приложении.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Для этого необходимо включить Службу Доступности в настройках Android. Вы можете пропустить это и включить позже.';

  @override
  String get openAccessibilitySettings => 'Открыть Настройки Доступности';

  @override
  String get skipForNow => 'Пропустить пока';

  @override
  String get checkingPermission => 'Проверка разрешения…';

  @override
  String get accessibilityEnabled => 'Служба Доступности включена';

  @override
  String get accessibilityNotEnabled => 'Служба Доступности не включена';

  @override
  String get exploreIntegrations => 'Исследовать Интеграции';

  @override
  String get requestTimedOut => 'Время запроса истекло';

  @override
  String get myShortcuts => 'Мои Быстрые Команды';

  @override
  String get addShortcut => 'Добавить Быструю Команду';

  @override
  String get noShortcutsYet => 'Быстрых команд пока нет';

  @override
  String get shortcutsInstructions =>
      'Создайте быструю команду в приложении iOS Быстрые Команды, добавьте действие обратного вызова в конце, затем зарегистрируйте ее здесь, чтобы ИИ мог ее запускать.';

  @override
  String get shortcutName => 'Название быстрой команды';

  @override
  String get shortcutNameHint =>
      'Точное название из приложения Быстрые Команды';

  @override
  String get descriptionOptional => 'Описание (необязательно)';

  @override
  String get whatDoesShortcutDo => 'Что делает эта быстрая команда?';

  @override
  String get callbackSetup => 'Настройка обратного вызова';

  @override
  String get callbackInstructions =>
      'Каждая быстрая команда должна заканчиваться:\n① Получить значение ключа → \"callbackUrl\" (из входных данных быстрой команды, разобранных как словарь)\n② Открыть URL ← результат ①';

  @override
  String get channelApp => 'Приложение';

  @override
  String get channelHeartbeat => 'Сердцебиение';

  @override
  String get channelCron => 'По расписанию';

  @override
  String get channelSubagent => 'Подагент';

  @override
  String get channelSystem => 'Система';

  @override
  String secondsAgo(int seconds) {
    return '$secondsс назад';
  }

  @override
  String get messagesAbbrev => 'сообщ.';

  @override
  String get modelAlreadyAdded => 'Эта модель уже есть в вашем списке';

  @override
  String get bothTokensRequired => 'Оба токена обязательны';

  @override
  String get slackSavedRestart =>
      'Slack сохранен — перезапустите шлюз для подключения';

  @override
  String get slackConfiguration => 'Конфигурация Slack';

  @override
  String get setupTitle => 'Настройка';

  @override
  String get slackSetupInstructions =>
      '1. Создайте приложение Slack на api.slack.com/apps\n2. Включите Socket Mode → сгенерируйте App-Level Token (xapp-…)\n   с областью: connections:write\n3. Добавьте Bot Token Scopes: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Установите приложение в workspace → скопируйте Bot Token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'URL API и номер телефона обязательны';

  @override
  String get signalSavedRestart =>
      'Signal сохранен — перезапустите шлюз для подключения';

  @override
  String get signalConfiguration => 'Конфигурация Signal';

  @override
  String get requirementsTitle => 'Требования';

  @override
  String get signalRequirements =>
      'Требуется signal-cli-rest-api, работающий на сервере:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nЗарегистрируйте/привяжите свой номер Signal через REST API, затем введите URL и номер телефона ниже.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Ваш номер телефона Signal';

  @override
  String get userIdLabel => 'ID Пользователя';

  @override
  String get enterDiscordUserId => 'Введите ID пользователя Discord';

  @override
  String get enterTelegramUserId => 'Введите ID пользователя Telegram';

  @override
  String get fromDiscordDevPortal => 'Из Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Разрешенные ID Пользователей';

  @override
  String get approvedDevice => 'Одобренное устройство';

  @override
  String get allowedUser => 'Разрешенный пользователь';

  @override
  String get howToGetBotToken => 'Как получить токен бота';

  @override
  String get discordTokenInstructions =>
      '1. Перейдите в Discord Developer Portal\n2. Создайте новое приложение и бота\n3. Скопируйте токен и вставьте его выше\n4. Включите Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Откройте Telegram и найдите @BotFather\n2. Отправьте /newbot и следуйте инструкциям\n3. Скопируйте токен и вставьте его выше';

  @override
  String get fromBotFatherHint => 'Получите от @BotFather';

  @override
  String get accessTokenLabel => 'Токен доступа';

  @override
  String get notSetOpenAccess =>
      'Не установлен — открытый доступ (только loopback)';

  @override
  String get gatewayAccessToken => 'Токен доступа к шлюзу';

  @override
  String get tokenFieldLabel => 'Токен';

  @override
  String get leaveEmptyDisableAuth =>
      'Оставьте пустым, чтобы отключить аутентификацию';

  @override
  String get toolPolicies => 'Политики Инструментов';

  @override
  String get toolPoliciesDesc =>
      'Контролируйте, к чему может получить доступ агент. Отключенные инструменты скрыты от ИИ и заблокированы во время выполнения.';

  @override
  String get privacySensors => 'Конфиденциальность и Датчики';

  @override
  String get networkCategory => 'Сеть';

  @override
  String get systemCategory => 'Система';

  @override
  String get toolTakePhotos => 'Делать Фотографии';

  @override
  String get toolTakePhotosDesc =>
      'Разрешить агенту делать фотографии с помощью камеры';

  @override
  String get toolRecordVideo => 'Записывать Видео';

  @override
  String get toolRecordVideoDesc => 'Разрешить агенту записывать видео';

  @override
  String get toolLocation => 'Местоположение';

  @override
  String get toolLocationDesc =>
      'Разрешить агенту читать ваше текущее GPS-местоположение';

  @override
  String get toolHealthData => 'Данные о Здоровье';

  @override
  String get toolHealthDataDesc =>
      'Разрешить агенту читать данные о здоровье/фитнесе';

  @override
  String get toolContacts => 'Контакты';

  @override
  String get toolContactsDesc => 'Разрешить агенту искать в ваших контактах';

  @override
  String get toolScreenshots => 'Скриншоты';

  @override
  String get toolScreenshotsDesc => 'Разрешить агенту делать скриншоты экрана';

  @override
  String get toolWebFetch => 'Загрузка Веб-страниц';

  @override
  String get toolWebFetchDesc => 'Разрешить агенту загружать контент с URL';

  @override
  String get toolWebSearch => 'Поиск в Интернете';

  @override
  String get toolWebSearchDesc => 'Разрешить агенту искать в интернете';

  @override
  String get toolHttpRequests => 'HTTP-Запросы';

  @override
  String get toolHttpRequestsDesc =>
      'Разрешить агенту выполнять произвольные HTTP-запросы';

  @override
  String get toolSandboxShell => 'Оболочка Песочницы';

  @override
  String get toolSandboxShellDesc =>
      'Разрешить агенту выполнять команды оболочки в песочнице';

  @override
  String get toolImageGeneration => 'Генерация Изображений';

  @override
  String get toolImageGenerationDesc =>
      'Разрешить агенту генерировать изображения с помощью ИИ';

  @override
  String get toolLaunchApps => 'Запуск Приложений';

  @override
  String get toolLaunchAppsDesc =>
      'Разрешить агенту открывать установленные приложения';

  @override
  String get toolLaunchIntents => 'Запуск Интентов';

  @override
  String get toolLaunchIntentsDesc =>
      'Разрешить агенту запускать интенты Android (глубокие ссылки, системные экраны)';

  @override
  String get renameSession => 'Переименовать сессию';

  @override
  String get myConversationName => 'Название моей беседы';

  @override
  String get renameAction => 'Переименовать';

  @override
  String get couldNotTranscribeAudio => 'Не удалось транскрибировать аудио';

  @override
  String get stopRecording => 'Остановить запись';

  @override
  String get voiceInput => 'Голосовой ввод';

  @override
  String get speakMessage => 'Озвучить';

  @override
  String get stopSpeaking => 'Остановить озвучку';

  @override
  String get selectText => 'Выделить текст';

  @override
  String get messageCopied => 'Сообщение скопировано';

  @override
  String get copyTooltip => 'Копировать';

  @override
  String get commandsTooltip => 'Команды';

  @override
  String get providersAndModels => 'Провайдеры и Модели';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count моделей настроено',
      many: '$count моделей настроено',
      few: '$count модели настроены',
      one: '1 модель настроена',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Автозапуск включен';

  @override
  String get autoStartOffLabel => 'Автозапуск выключен';

  @override
  String get allToolsEnabled => 'Все инструменты включены';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count инструментов отключено',
      many: '$count инструментов отключено',
      few: '$count инструмента отключено',
      one: '1 инструмент отключен',
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
  String get officialWebsite => 'Официальный сайт';

  @override
  String get noPendingPairingRequests => 'Нет ожидающих запросов на сопряжение';

  @override
  String get pairingRequestsTitle => 'Запросы на Сопряжение';

  @override
  String get gatewayStartingStatus => 'Запуск шлюза...';

  @override
  String get gatewayRetryingStatus => 'Повтор запуска шлюза...';

  @override
  String get errorStartingGateway => 'Ошибка запуска шлюза';

  @override
  String get runningStatus => 'Работает';

  @override
  String get stoppedStatus => 'Остановлен';

  @override
  String get notSetUpStatus => 'Не настроен';

  @override
  String get configuredStatus => 'Настроен';

  @override
  String get whatsAppConfigSaved => 'Конфигурация WhatsApp сохранена';

  @override
  String get whatsAppDisconnected => 'WhatsApp отключен';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Применение...';

  @override
  String get reconnectWhatsApp => 'Переподключить WhatsApp';

  @override
  String get saveSettingsLabel => 'Сохранить Настройки';

  @override
  String get applySettingsRestart => 'Применить Настройки и Перезапустить';

  @override
  String get whatsAppMode => 'Режим WhatsApp';

  @override
  String get myPersonalNumber => 'Мой личный номер';

  @override
  String get myPersonalNumberDesc =>
      'Сообщения, которые вы отправляете в свой собственный чат WhatsApp, пробуждают агента.';

  @override
  String get dedicatedBotAccount => 'Выделенный аккаунт бота';

  @override
  String get dedicatedBotAccountDesc =>
      'Сообщения, отправленные с привязанного аккаунта, игнорируются как исходящие.';

  @override
  String get allowedNumbers => 'Разрешенные Номера';

  @override
  String get addNumberTitle => 'Добавить Номер';

  @override
  String get phoneNumberJid => 'Номер телефона / JID';

  @override
  String get noAllowedNumbersConfigured => 'Разрешенные номера не настроены';

  @override
  String get devicesAppearAfterPairing =>
      'Устройства появятся здесь после одобрения запросов на сопряжение';

  @override
  String get addPhoneNumbersHint =>
      'Добавьте номера телефонов, чтобы разрешить им использовать бота';

  @override
  String get allowedNumber => 'Разрешенный номер';

  @override
  String get howToConnect => 'Как подключиться';

  @override
  String get whatsAppConnectInstructions =>
      '1. Нажмите \"Подключить WhatsApp\" выше\n2. Появится QR-код — отсканируйте его с помощью WhatsApp\n   (Настройки → Связанные устройства → Связать устройство)\n3. После подключения входящие сообщения автоматически\n   перенаправляются вашему активному агенту ИИ';

  @override
  String get whatsAppPairingDesc =>
      'Новые отправители получают код сопряжения. Вы их одобряете.';

  @override
  String get whatsAppAllowlistDesc =>
      'Только определенные номера телефонов могут писать боту.';

  @override
  String get whatsAppOpenDesc =>
      'Любой, кто пишет вам, может использовать бота.';

  @override
  String get whatsAppDisabledDesc =>
      'Бот не будет отвечать на входящие сообщения.';

  @override
  String get sessionExpiredRelink =>
      'Сессия истекла. Нажмите \"Переподключить\" ниже, чтобы отсканировать новый QR-код.';

  @override
  String get connectWhatsAppBelow =>
      'Нажмите \"Подключить WhatsApp\" ниже, чтобы привязать аккаунт.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp принял QR-код. Завершение привязки...';

  @override
  String get waitingForWhatsApp => 'Ожидание завершения привязки WhatsApp...';

  @override
  String get focusedLabel => 'Фокусированная';

  @override
  String get balancedLabel => 'Сбалансированная';

  @override
  String get creativeLabel => 'Креативная';

  @override
  String get preciseLabel => 'Точная';

  @override
  String get expressiveLabel => 'Выразительная';

  @override
  String get browseLabel => 'Просмотр';

  @override
  String get apiTokenLabel => 'API Токен';

  @override
  String get connectToClawHub => 'Подключиться к ClawHub';

  @override
  String get clawHubLoginHint =>
      'Войдите в ClawHub, чтобы получить доступ к премиум-навыкам и установке пакетов';

  @override
  String get howToGetApiToken => 'Как получить ваш API-токен:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Посетите clawhub.ai и войдите через GitHub\n2. Выполните \"clawhub login\" в терминале\n3. Скопируйте токен и вставьте его сюда';

  @override
  String connectionFailed(String error) {
    return 'Ошибка подключения: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count запусков';
  }

  @override
  String nextRunLabel(String time) {
    return 'Следующий запуск: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Последняя ошибка: $error';
  }

  @override
  String get cronJobHintText =>
      'Инструкции для агента при срабатывании этой задачи…';

  @override
  String get androidPermissions => 'Разрешения Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw может управлять экраном от вашего имени — нажимать кнопки, заполнять формы, прокручивать и автоматизировать повторяющиеся задачи в любом приложении.';

  @override
  String get twoPermissionsNeeded =>
      'Для полного опыта необходимы два разрешения. Вы можете пропустить это и включить их позже в Настройках.';

  @override
  String get accessibilityService => 'Служба Доступности';

  @override
  String get accessibilityServiceDesc =>
      'Позволяет нажимать, проводить пальцем, печатать и читать содержимое экрана';

  @override
  String get displayOverOtherApps => 'Отображение Поверх Других Приложений';

  @override
  String get displayOverOtherAppsDesc =>
      'Показывает плавающий чип статуса, чтобы вы могли видеть, что делает агент';

  @override
  String get changeDefaultModel => 'Изменить модель по умолчанию';

  @override
  String setModelAsDefault(String name) {
    return 'Установить $name в качестве модели по умолчанию.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'агентов',
      many: 'агентов',
      few: 'агента',
      one: 'агента',
    );
    return 'Также обновить $count $_temp0';
  }

  @override
  String get startNewSessions => 'Начать новые сессии';

  @override
  String get currentConversationsArchived =>
      'Текущие беседы будут архивированы';

  @override
  String get applyAction => 'Применить';

  @override
  String applyModelQuestion(String name) {
    return 'Применить $name?';
  }

  @override
  String get setAsDefaultModel => 'Установить в качестве модели по умолчанию';

  @override
  String get usedByAgentsWithout =>
      'Используется агентами без конкретной модели';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'агентам',
      many: 'агентам',
      few: 'агентам',
      one: 'агенту',
    );
    return 'Применить к $count $_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Провайдер уже аутентифицирован — API-ключ не нужен.';

  @override
  String get selectFromList => 'Выбрать из списка';

  @override
  String get enterCustomModelId => 'Ввести пользовательский ID модели';

  @override
  String get removeSkillTitle => 'Удалить навык?';

  @override
  String get browseClawHubToDiscover =>
      'Просматривайте ClawHub, чтобы обнаруживать и устанавливать навыки';

  @override
  String get addDeviceTooltip => 'Добавить устройство';

  @override
  String get addNumberTooltip => 'Добавить номер';

  @override
  String get searchSkillsHint => 'Поиск навыков...';

  @override
  String get loginToClawHub => 'Войти в ClawHub';

  @override
  String get accountTooltip => 'Аккаунт';

  @override
  String get editAction => 'Редактировать';

  @override
  String get setAsDefaultAction => 'Установить по умолчанию';

  @override
  String get chooseProviderTitle => 'Выберите провайдера';

  @override
  String get apiKeyTitle => 'API-ключ';

  @override
  String get slackConfigSaved =>
      'Slack сохранен — перезапустите шлюз для подключения';

  @override
  String get signalConfigSaved =>
      'Signal сохранен — перезапустите шлюз для подключения';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Добавить устройство';

  @override
  String get skipAction => 'Пропустить';

  @override
  String get mcpServers => 'MCP-серверы';

  @override
  String get noMcpServersConfigured => 'MCP-серверы не настроены';

  @override
  String get mcpServersEmptyHint =>
      'Добавьте MCP-серверы, чтобы дать агенту доступ к инструментам GitHub, Notion, Slack, баз данных и других сервисов.';

  @override
  String get addMcpServer => 'Добавить MCP-сервер';

  @override
  String get editMcpServer => 'Редактировать MCP-сервер';

  @override
  String get removeMcpServer => 'Удалить MCP-сервер';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Удалить «$name»? Его инструменты станут недоступны.';
  }

  @override
  String get mcpTransport => 'Транспорт';

  @override
  String get testConnection => 'Проверить соединение';

  @override
  String get mcpServerNameLabel => 'Имя сервера';

  @override
  String get mcpServerNameHint => 'напр. GitHub, Notion, Моя БД';

  @override
  String get mcpServerUrlLabel => 'URL сервера';

  @override
  String get mcpBearerTokenLabel => 'Bearer-токен (необязательно)';

  @override
  String get mcpBearerTokenHint => 'Оставьте пустым, если авторизация не нужна';

  @override
  String get mcpCommandLabel => 'Команда';

  @override
  String get mcpArgumentsLabel => 'Аргументы (через пробел)';

  @override
  String get mcpEnvVarsLabel =>
      'Переменные окружения (КЛЮЧ=ЗНАЧЕНИЕ, по одной на строку)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio недоступен на iOS. Используйте HTTP или SSE.';

  @override
  String get connectedStatus => 'Подключено';

  @override
  String get mcpConnecting => 'Подключение...';

  @override
  String get mcpConnectionError => 'Ошибка подключения';

  @override
  String get mcpDisconnected => 'Отключено';

  @override
  String mcpToolsCount(int count) {
    return '$count инструментов';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — обнаружено $count инструментов';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Подключено (0 инструментов)';

  @override
  String get mcpTestFailed =>
      'Ошибка подключения. Проверьте URL/токен сервера.';

  @override
  String get mcpAddServer => 'Добавить сервер';

  @override
  String get mcpSaveChanges => 'Сохранить изменения';

  @override
  String get urlIsRequired => 'URL обязателен';

  @override
  String get enterValidUrl => 'Введите корректный URL';

  @override
  String get commandIsRequired => 'Команда обязательна';

  @override
  String skillRemoved(String name) {
    return 'Навык «$name» удалён';
  }

  @override
  String get editFileContentHint => 'Редактировать содержимое файла...';

  @override
  String get whatsAppPairSubtitle =>
      'Привяжите личный аккаунт WhatsApp с помощью QR-кода';

  @override
  String get whatsAppPairingOptional =>
      'Привязка необязательна. Вы можете завершить настройку сейчас и добавить привязку позже.';

  @override
  String get whatsAppEnableToLink =>
      'Включите WhatsApp, чтобы начать привязку устройства.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp привязан. FlutterClaw сможет отвечать после завершения настройки.';

  @override
  String get cancelLink => 'Отменить привязку';
}
