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
}
