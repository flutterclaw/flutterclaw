// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Czat';

  @override
  String get channels => 'Kanały';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Ustawienia';

  @override
  String get getStarted => 'Rozpocznij';

  @override
  String get yourPersonalAssistant => 'Twój osobisty asystent AI';

  @override
  String get multiChannelChat => 'Czat wielokanałowy';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat i więcej';

  @override
  String get powerfulAIModels => 'Potężne modele AI';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok i darmowe modele';

  @override
  String get localGateway => 'Lokalna brama';

  @override
  String get localGatewayDesc =>
      'Działa na Twoim urządzeniu, Twoje dane pozostają Twoje';

  @override
  String get chooseProvider => 'Wybierz Dostawcę';

  @override
  String get selectProviderDesc =>
      'Wybierz, jak chcesz połączyć się z modelami AI.';

  @override
  String get startForFree => 'Zacznij Za Darmo';

  @override
  String get freeProvidersDesc =>
      'Ci dostawcy oferują darmowe modele, aby rozpocząć bez kosztów.';

  @override
  String get free => 'DARMOWE';

  @override
  String get otherProviders => 'Inni Dostawcy';

  @override
  String connectToProvider(String provider) {
    return 'Połącz z $provider';
  }

  @override
  String get enterApiKeyDesc => 'Wprowadź swój klucz API i wybierz model.';

  @override
  String get dontHaveApiKey => 'Nie masz klucza API?';

  @override
  String get createAccountCopyKey => 'Utwórz konto i skopiuj swój klucz.';

  @override
  String get signUp => 'Zarejestruj się';

  @override
  String get apiKey => 'Klucz API';

  @override
  String get pasteFromClipboard => 'Wklej ze schowka';

  @override
  String get apiBaseUrl => 'Bazowy URL API';

  @override
  String get selectModel => 'Wybierz Model';

  @override
  String get modelId => 'ID Modelu';

  @override
  String get validateKey => 'Sprawdź Klucz';

  @override
  String get validating => 'Sprawdzanie...';

  @override
  String get invalidApiKey => 'Nieprawidłowy klucz API';

  @override
  String get gatewayConfiguration => 'Konfiguracja Bramy';

  @override
  String get gatewayConfigDesc =>
      'Brama jest lokalną płaszczyzną kontroli Twojego asystenta.';

  @override
  String get defaultSettingsNote =>
      'Domyślne ustawienia działają dla większości użytkowników. Zmieniaj tylko jeśli wiesz, czego potrzebujesz.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Automatyczne uruchamianie bramy';

  @override
  String get autoStartGatewayDesc =>
      'Uruchom bramę automatycznie po uruchomieniu aplikacji.';

  @override
  String get channelsPageTitle => 'Kanały';

  @override
  String get channelsPageDesc =>
      'Opcjonalnie podłącz kanały komunikacyjne. Zawsze możesz je skonfigurować później w Ustawieniach.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Podłącz bota Telegram.';

  @override
  String get openBotFather => 'Otwórz BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Podłącz bota Discord.';

  @override
  String get developerPortal => 'Portal Dewelopera';

  @override
  String get botToken => 'Token Bota';

  @override
  String telegramBotToken(String platform) {
    return 'Token Bota $platform';
  }

  @override
  String get readyToGo => 'Gotowe do Startu';

  @override
  String get reviewConfiguration =>
      'Przejrzyj konfigurację i uruchom FlutterClaw.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return 'przez $provider';
  }

  @override
  String get gateway => 'Brama';

  @override
  String get webChatOnly => 'Tylko WebChat (możesz dodać więcej później)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Uruchamianie...';

  @override
  String get startFlutterClaw => 'Uruchom FlutterClaw';

  @override
  String get newSession => 'Nowa sesja';

  @override
  String get photoLibrary => 'Biblioteka Zdjęć';

  @override
  String get camera => 'Kamera';

  @override
  String get whatDoYouSeeInImage => 'Co widzisz na tym obrazie?';

  @override
  String get imagePickerNotAvailable =>
      'Wybór obrazu niedostępny na Symulatorze. Użyj prawdziwego urządzenia.';

  @override
  String get couldNotOpenImagePicker => 'Nie można otworzyć wyboru obrazu.';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get attachImage => 'Dołącz obraz';

  @override
  String get messageFlutterClaw => 'Wiadomość do FlutterClaw...';

  @override
  String get channelsAndGateway => 'Kanały i Brama';

  @override
  String get stop => 'Zatrzymaj';

  @override
  String get start => 'Uruchom';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Wbudowany interfejs czatu';

  @override
  String get notConfigured => 'Nieskonfigurowane';

  @override
  String get connected => 'Połączono';

  @override
  String get configuredStarting => 'Skonfigurowane (uruchamianie...)';

  @override
  String get telegramConfiguration => 'Konfiguracja Telegram';

  @override
  String get fromBotFather => 'Od @BotFather';

  @override
  String get allowedUserIds =>
      'Dozwolone ID Użytkowników (oddzielone przecinkami)';

  @override
  String get leaveEmptyToAllowAll => 'Pozostaw puste, aby zezwolić wszystkim';

  @override
  String get cancel => 'Anuluj';

  @override
  String get saveAndConnect => 'Zapisz i Połącz';

  @override
  String get discordConfiguration => 'Konfiguracja Discord';

  @override
  String get pendingPairingRequests => 'Oczekujące Żądania Parowania';

  @override
  String get approve => 'Zatwierdź';

  @override
  String get reject => 'Odrzuć';

  @override
  String get expired => 'Wygasło';

  @override
  String minutesLeft(int minutes) {
    return 'Pozostało ${minutes}m';
  }

  @override
  String get workspaceFiles => 'Pliki Przestrzeni Roboczej';

  @override
  String get personalAIAssistant => 'Osobisty Asystent AI';

  @override
  String sessionsCount(int count) {
    return 'Sesje ($count)';
  }

  @override
  String get noActiveSessions => 'Brak aktywnych sesji';

  @override
  String get startConversationToCreate => 'Rozpocznij rozmowę, aby utworzyć';

  @override
  String get startConversationToSee =>
      'Rozpocznij rozmowę, aby zobaczyć sesje tutaj';

  @override
  String get reset => 'Resetuj';

  @override
  String get cronJobs => 'Zadania Zaplanowane';

  @override
  String get noCronJobs => 'Brak zaplanowanych zadań';

  @override
  String get addScheduledTasks =>
      'Dodaj zaplanowane zadania dla swojego agenta';

  @override
  String get runNow => 'Uruchom Teraz';

  @override
  String get enable => 'Włącz';

  @override
  String get disable => 'Wyłącz';

  @override
  String get delete => 'Usuń';

  @override
  String get skills => 'Umiejętności';

  @override
  String get browseClawHub => 'Przeglądaj ClawHub';

  @override
  String get noSkillsInstalled => 'Brak zainstalowanych umiejętności';

  @override
  String get browseClawHubToAdd => 'Przeglądaj ClawHub, aby dodać umiejętności';

  @override
  String removeSkillConfirm(String name) {
    return 'Usunąć \"$name\" z Twoich umiejętności?';
  }

  @override
  String get clawHubSkills => 'Umiejętności ClawHub';

  @override
  String get searchSkills => 'Szukaj umiejętności...';

  @override
  String get noSkillsFound =>
      'Nie znaleziono umiejętności. Spróbuj innego wyszukiwania.';

  @override
  String installedSkill(String name) {
    return 'Zainstalowano $name';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Nie udało się zainstalować $name';
  }

  @override
  String get addCronJob => 'Dodaj Zadanie Zaplanowane';

  @override
  String get jobName => 'Nazwa Zadania';

  @override
  String get dailySummaryExample => 'np. Codzienne Podsumowanie';

  @override
  String get taskPrompt => 'Polecenie Zadania';

  @override
  String get whatShouldAgentDo => 'Co powinien zrobić agent?';

  @override
  String get interval => 'Interwał';

  @override
  String get every5Minutes => 'Co 5 minut';

  @override
  String get every15Minutes => 'Co 15 minut';

  @override
  String get every30Minutes => 'Co 30 minut';

  @override
  String get everyHour => 'Co godzinę';

  @override
  String get every6Hours => 'Co 6 godzin';

  @override
  String get every12Hours => 'Co 12 godzin';

  @override
  String get every24Hours => 'Co 24 godziny';

  @override
  String get add => 'Dodaj';

  @override
  String get save => 'Zapisz';

  @override
  String get sessions => 'Sesje';

  @override
  String messagesCount(int count) {
    return '$count wiadomości';
  }

  @override
  String tokensCount(int count) {
    return '$count tokenów';
  }

  @override
  String get compact => 'Kompaktuj';

  @override
  String get models => 'Modele';

  @override
  String get noModelsConfigured => 'Brak skonfigurowanych modeli';

  @override
  String get addModelToStartChatting => 'Dodaj model, aby rozpocząć czat';

  @override
  String get addModel => 'Dodaj Model';

  @override
  String get default_ => 'DOMYŚLNY';

  @override
  String get autoStart => 'Automatyczne uruchamianie';

  @override
  String get startGatewayWhenLaunches =>
      'Uruchom bramę po uruchomieniu aplikacji';

  @override
  String get heartbeat => 'Bicie Serca';

  @override
  String get enabled => 'Włączone';

  @override
  String get periodicAgentTasks => 'Okresowe zadania agenta z HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'O Programie';

  @override
  String get personalAIAssistantForIOS =>
      'Osobisty Asystent AI dla iOS i Android';

  @override
  String get version => 'Wersja';

  @override
  String get basedOnOpenClaw => 'Oparty na OpenClaw';

  @override
  String get removeModel => 'Usunąć model?';

  @override
  String removeModelConfirm(String name) {
    return 'Usunąć \"$name\" z Twoich modeli?';
  }

  @override
  String get remove => 'Usuń';

  @override
  String get setAsDefault => 'Ustaw jako Domyślny';

  @override
  String get paste => 'Wklej';

  @override
  String get chooseProviderStep => '1. Wybierz Dostawcę';

  @override
  String get selectModelStep => '2. Wybierz Model';

  @override
  String get apiKeyStep => '3. Klucz API';

  @override
  String getApiKeyAt(String provider) {
    return 'Uzyskaj klucz API na $provider';
  }

  @override
  String get justNow => 'właśnie teraz';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m temu';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}g temu';
  }

  @override
  String daysAgo(int days) {
    return '${days}d temu';
  }

  @override
  String get microphonePermissionDenied => 'Odmówiono dostępu do mikrofonu';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Transkrypcja na żywo niedostępna: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Nie udało się rozpocząć nagrywania: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Korzystanie z transkrypcji na urządzeniu';

  @override
  String get transcribingWithWhisper => 'Transkrypcja za pomocą Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API nie powiodło się: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Nie przechwycono transkrypcji';

  @override
  String failedToStopRecording(String error) {
    return 'Nie udało się zatrzymać nagrywania: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Nie udało się $action: $error';
  }

  @override
  String get pause => 'Wstrzymaj';

  @override
  String get resume => 'Wznów';

  @override
  String get send => 'Wyślij';

  @override
  String get liveActivityActive => 'Aktywność na żywo aktywna';

  @override
  String get restartGateway => 'Uruchom ponownie bramę';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Czas pracy: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Obsługa w tle aktywna - brama może dalej odpowiadać';

  @override
  String get webChatBuiltIn => 'Wbudowany interfejs czatu';

  @override
  String get configure => 'Konfiguruj';

  @override
  String get disconnect => 'Rozłącz';

  @override
  String get agents => 'Agenci';

  @override
  String get agentFiles => 'Pliki Agenta';

  @override
  String get createAgent => 'Utwórz Agenta';

  @override
  String get editAgent => 'Edytuj Agenta';

  @override
  String get noAgentsYet => 'Brak agentów';

  @override
  String get createYourFirstAgent => 'Utwórz swojego pierwszego agenta!';

  @override
  String get active => 'Aktywny';

  @override
  String get agentName => 'Nazwa Agenta';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Wybierz Emoji';

  @override
  String get vibe => 'Styl';

  @override
  String get vibeHint => 'np. przyjacielski, formalny, sarkastyczny';

  @override
  String get modelConfiguration => 'Konfiguracja Modelu';

  @override
  String get advancedSettings => 'Zaawansowane Ustawienia';

  @override
  String get agentCreated => 'Agent utworzony';

  @override
  String get agentUpdated => 'Agent zaktualizowany';

  @override
  String get agentDeleted => 'Agent usunięty';

  @override
  String switchedToAgent(String name) {
    return 'Przełączono na $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Usunąć $name? Wszystkie dane przestrzeni roboczej zostaną usunięte.';
  }

  @override
  String get agentDetails => 'Szczegóły Agenta';

  @override
  String get createdAt => 'Utworzono';

  @override
  String get lastUsed => 'Ostatnie Użycie';

  @override
  String get basicInformation => 'Podstawowe Informacje';

  @override
  String get switchToAgent => 'Przełącz Agenta';

  @override
  String get providers => 'Dostawcy';

  @override
  String get addProvider => 'Dodaj dostawcę';

  @override
  String get noProvidersConfigured => 'Brak skonfigurowanych dostawców.';

  @override
  String get editCredentials => 'Edytuj dane uwierzytelniające';

  @override
  String get defaultModelHint =>
      'Domyślny model jest używany przez agentów, którzy nie określają własnego.';

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
  String get firstHatchModeChoiceTitle => 'Jak chcesz zacząć?';

  @override
  String get firstHatchModeChoiceBody =>
      'Możesz pisać z asystentem na czacie albo zacząć rozmowę głosową — jak krótki telefon. Wybierz to, co jest dla ciebie wygodniejsze.';

  @override
  String get firstHatchModeChoiceChatButton => 'Pisać na czacie';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Rozmawiać głosowo';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault => 'Przytrzymaj, aby ustawić jako domyślny';

  @override
  String get integrations => 'Integracje';

  @override
  String get shortcutsIntegrations => 'Integracje Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'Zainstaluj iOS Shortcuts, aby uruchamiać akcje aplikacji innych firm';

  @override
  String get dangerZone => 'Strefa zagrożenia';

  @override
  String get resetOnboarding => 'Resetuj i ponownie uruchom wdrażanie';

  @override
  String get resetOnboardingDesc =>
      'Usuwa całą konfigurację i powraca do kreatora konfiguracji.';

  @override
  String get resetAllConfiguration => 'Zresetować całą konfigurację?';

  @override
  String get resetAllConfigurationDesc =>
      'Spowoduje to usunięcie kluczy API, modeli i wszystkich ustawień. Aplikacja powróci do kreatora konfiguracji.\n\nHistoria rozmów nie zostanie usunięta.';

  @override
  String get removeProvider => 'Usuń dostawcę';

  @override
  String removeProviderConfirm(String provider) {
    return 'Usunąć dane uwierzytelniające dla $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name ustawiono jako domyślny model';
  }

  @override
  String get photoImage => 'Zdjęcie / Obraz';

  @override
  String get documentPdfTxt => 'Dokument (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Nie można otworzyć dokumentu: $error';
  }

  @override
  String get retry => 'Ponów';

  @override
  String get gatewayStopped => 'Brama zatrzymana';

  @override
  String get gatewayStarted => 'Brama uruchomiona pomyślnie!';

  @override
  String gatewayFailed(String error) {
    return 'Brama nie powiodła się: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Wyjątek: $error';
  }

  @override
  String get pairingRequestApproved => 'Żądanie parowania zatwierdzone';

  @override
  String get pairingRequestRejected => 'Żądanie parowania odrzucone';

  @override
  String get addDevice => 'Dodaj Urządzenie';

  @override
  String get telegramConfigSaved => 'Konfiguracja Telegram zapisana';

  @override
  String get discordConfigSaved => 'Konfiguracja Discord zapisana';

  @override
  String get securityMethod => 'Metoda Zabezpieczeń';

  @override
  String get pairingRecommended => 'Parowanie (Zalecane)';

  @override
  String get pairingDescription =>
      'Nowi użytkownicy otrzymują kod parowania. Zatwierdzasz lub odrzucasz ich.';

  @override
  String get allowlistTitle => 'Lista Dozwolonych';

  @override
  String get allowlistDescription =>
      'Tylko określone ID użytkowników mają dostęp do bota.';

  @override
  String get openAccess => 'Otwarty Dostęp';

  @override
  String get openAccessDescription =>
      'Każdy może natychmiast korzystać z bota (niezalecane).';

  @override
  String get disabledAccess => 'Wyłączony';

  @override
  String get disabledAccessDescription =>
      'Brak dozwolonych DM. Bot nie odpowie na żadne wiadomości.';

  @override
  String get approvedDevices => 'Zatwierdzone Urządzenia';

  @override
  String get noApprovedDevicesYet => 'Brak zatwierdzonych urządzeń';

  @override
  String get devicesAppearAfterApproval =>
      'Urządzenia pojawią się tutaj po zatwierdzeniu ich żądań parowania';

  @override
  String get noAllowedUsersConfigured =>
      'Brak skonfigurowanych dozwolonych użytkowników';

  @override
  String get addUserIdsHint =>
      'Dodaj ID użytkowników, aby umożliwić im korzystanie z bota';

  @override
  String get removeDevice => 'Usunąć urządzenie?';

  @override
  String removeAccessFor(String name) {
    return 'Usunąć dostęp dla $name?';
  }

  @override
  String get saving => 'Zapisywanie...';

  @override
  String get channelsLabel => 'Kanały';

  @override
  String get clawHubAccount => 'Konto ClawHub';

  @override
  String get loggedInToClawHub => 'Jesteś obecnie zalogowany w ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Wylogowano z ClawHub';

  @override
  String get login => 'Zaloguj się';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get connect => 'Połącz';

  @override
  String get pasteClawHubToken => 'Wklej swój token API ClawHub';

  @override
  String get pleaseEnterApiToken => 'Proszę wprowadzić token API';

  @override
  String get successfullyConnected => 'Pomyślnie połączono z ClawHub';

  @override
  String get browseSkillsButton => 'Przeglądaj Umiejętności';

  @override
  String get installSkill => 'Zainstaluj Umiejętność';

  @override
  String get incompatibleSkill => 'Niezgodna Umiejętność';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Ta umiejętność nie może działać na urządzeniu mobilnym (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Ostrzeżenie o Kompatybilności';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Ta umiejętność została zaprojektowana na komputer i może nie działać na urządzeniu mobilnym.\n\n$reason\n\nCzy chcesz zainstalować dostosowaną wersję zoptymalizowaną dla urządzeń mobilnych?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Zainstaluj Oryginał';

  @override
  String get installAdapted => 'Zainstaluj Dostosowaną';

  @override
  String get resetSession => 'Resetuj Sesję';

  @override
  String resetSessionConfirm(String key) {
    return 'Zresetować sesję \"$key\"? Wszystkie wiadomości zostaną usunięte.';
  }

  @override
  String get sessionReset => 'Sesja zresetowana';

  @override
  String get activeSessions => 'Aktywne Sesje';

  @override
  String get scheduledTasks => 'Zaplanowane Zadania';

  @override
  String get defaultBadge => 'Domyślny';

  @override
  String errorGeneric(String error) {
    return 'Błąd: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName zapisano';
  }

  @override
  String errorSavingFile(String error) {
    return 'Błąd zapisu pliku: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Nie można usunąć ostatniego agenta';

  @override
  String get close => 'Zamknij';

  @override
  String get nameIsRequired => 'Nazwa jest wymagana';

  @override
  String get pleaseSelectModel => 'Proszę wybrać model';

  @override
  String temperatureLabel(String value) {
    return 'Temperatura: $value';
  }

  @override
  String get maxTokens => 'Maks. Tokenów';

  @override
  String get maxTokensRequired => 'Maks. tokenów jest wymagane';

  @override
  String get mustBePositiveNumber => 'Musi być liczbą dodatnią';

  @override
  String get maxToolIterations => 'Maks. Iteracji Narzędzi';

  @override
  String get maxIterationsRequired => 'Maks. iteracji jest wymagane';

  @override
  String get restrictToWorkspace => 'Ogranicz do Przestrzeni Roboczej';

  @override
  String get restrictToWorkspaceDesc =>
      'Ogranicz operacje na plikach do przestrzeni roboczej agenta';

  @override
  String get noModelsConfiguredLong =>
      'Proszę dodać co najmniej jeden model w Ustawieniach przed utworzeniem agenta.';

  @override
  String get selectProviderFirst => 'Najpierw wybierz dostawcę';

  @override
  String get skip => 'Pomiń';

  @override
  String get continueButton => 'Kontynuuj';

  @override
  String get uiAutomation => 'Automatyzacja UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw może kontrolować ekran w Twoim imieniu — dotykać przycisków, wypełniać formularze, przewijać i automatyzować powtarzalne zadania w dowolnej aplikacji.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Wymaga to włączenia Usługi Dostępności w Ustawieniach Android. Możesz to pominąć i włączyć później.';

  @override
  String get openAccessibilitySettings => 'Otwórz Ustawienia Dostępności';

  @override
  String get skipForNow => 'Pomiń na razie';

  @override
  String get checkingPermission => 'Sprawdzanie uprawnień…';

  @override
  String get accessibilityEnabled => 'Usługa Dostępności jest włączona';

  @override
  String get accessibilityNotEnabled => 'Usługa Dostępności nie jest włączona';

  @override
  String get exploreIntegrations => 'Odkryj Integracje';

  @override
  String get requestTimedOut => 'Przekroczono limit czasu żądania';

  @override
  String get myShortcuts => 'Moje Skróty';

  @override
  String get addShortcut => 'Dodaj Skrót';

  @override
  String get noShortcutsYet => 'Brak skrótów';

  @override
  String get shortcutsInstructions =>
      'Utwórz skrót w aplikacji iOS Shortcuts, dodaj akcję wywołania zwrotnego na końcu, a następnie zarejestruj go tutaj, aby AI mógł go uruchomić.';

  @override
  String get shortcutName => 'Nazwa skrótu';

  @override
  String get shortcutNameHint => 'Dokładna nazwa z aplikacji Shortcuts';

  @override
  String get descriptionOptional => 'Opis (opcjonalnie)';

  @override
  String get whatDoesShortcutDo => 'Co robi ten skrót?';

  @override
  String get callbackSetup => 'Konfiguracja wywołania zwrotnego';

  @override
  String get callbackInstructions =>
      'Każdy skrót musi kończyć się:\n① Get Value for Key → \"callbackUrl\" (z Shortcut Input sparsowanego jako słownik)\n② Open URLs ← wyjście z ①';

  @override
  String get channelApp => 'Aplikacja';

  @override
  String get channelHeartbeat => 'Bicie Serca';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Podagent';

  @override
  String get channelSystem => 'System';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s temu';
  }

  @override
  String get messagesAbbrev => 'wiad.';

  @override
  String get modelAlreadyAdded => 'Ten model jest już na Twojej liście';

  @override
  String get bothTokensRequired => 'Oba tokeny są wymagane';

  @override
  String get slackSavedRestart =>
      'Slack zapisany — uruchom ponownie bramę, aby połączyć';

  @override
  String get slackConfiguration => 'Konfiguracja Slack';

  @override
  String get setupTitle => 'Konfiguracja';

  @override
  String get slackSetupInstructions =>
      '1. Utwórz aplikację Slack na api.slack.com/apps\n2. Włącz Socket Mode → wygeneruj App-Level Token (xapp-…)\n   z zakresem: connections:write\n3. Dodaj Bot Token Scopes: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Zainstaluj aplikację w workspace → skopiuj Bot Token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'URL API i numer telefonu są wymagane';

  @override
  String get signalSavedRestart =>
      'Signal zapisany — uruchom ponownie bramę, aby połączyć';

  @override
  String get signalConfiguration => 'Konfiguracja Signal';

  @override
  String get requirementsTitle => 'Wymagania';

  @override
  String get signalRequirements =>
      'Wymaga signal-cli-rest-api działającego na serwerze:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nZarejestruj/połącz swój numer Signal przez REST API, następnie wprowadź URL i numer telefonu poniżej.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Twój numer telefonu Signal';

  @override
  String get userIdLabel => 'ID Użytkownika';

  @override
  String get enterDiscordUserId => 'Wprowadź ID użytkownika Discord';

  @override
  String get enterTelegramUserId => 'Wprowadź ID użytkownika Telegram';

  @override
  String get fromDiscordDevPortal => 'Z Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Dozwolone ID Użytkowników';

  @override
  String get approvedDevice => 'Zatwierdzone urządzenie';

  @override
  String get allowedUser => 'Dozwolony użytkownik';

  @override
  String get howToGetBotToken => 'Jak uzyskać token bota';

  @override
  String get discordTokenInstructions =>
      '1. Przejdź do Discord Developer Portal\n2. Utwórz nową aplikację i bota\n3. Skopiuj token i wklej go powyżej\n4. Włącz Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Otwórz Telegram i wyszukaj @BotFather\n2. Wyślij /newbot i postępuj zgodnie z instrukcjami\n3. Skopiuj token i wklej go powyżej';

  @override
  String get fromBotFatherHint => 'Uzyskaj od @BotFather';

  @override
  String get accessTokenLabel => 'Token dostępu';

  @override
  String get notSetOpenAccess =>
      'Nie ustawiony — otwarty dostęp (tylko loopback)';

  @override
  String get gatewayAccessToken => 'Token dostępu do bramy';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Pozostaw puste, aby wyłączyć uwierzytelnianie';

  @override
  String get toolPolicies => 'Zasady Narzędzi';

  @override
  String get toolPoliciesDesc =>
      'Kontroluj, do czego agent ma dostęp. Wyłączone narzędzia są ukryte przed AI i zablokowane w czasie wykonywania.';

  @override
  String get privacySensors => 'Prywatność i Czujniki';

  @override
  String get networkCategory => 'Sieć';

  @override
  String get systemCategory => 'System';

  @override
  String get toolTakePhotos => 'Robienie Zdjęć';

  @override
  String get toolTakePhotosDesc =>
      'Zezwalaj agentowi na robienie zdjęć przy użyciu aparatu';

  @override
  String get toolRecordVideo => 'Nagrywanie Wideo';

  @override
  String get toolRecordVideoDesc => 'Zezwalaj agentowi na nagrywanie wideo';

  @override
  String get toolLocation => 'Lokalizacja';

  @override
  String get toolLocationDesc =>
      'Zezwalaj agentowi na odczyt Twojej aktualnej lokalizacji GPS';

  @override
  String get toolHealthData => 'Dane Zdrowotne';

  @override
  String get toolHealthDataDesc =>
      'Zezwalaj agentowi na odczyt danych zdrowotnych/fitness';

  @override
  String get toolContacts => 'Kontakty';

  @override
  String get toolContactsDesc =>
      'Zezwalaj agentowi na przeszukiwanie Twoich kontaktów';

  @override
  String get toolScreenshots => 'Zrzuty Ekranu';

  @override
  String get toolScreenshotsDesc =>
      'Zezwalaj agentowi na robienie zrzutów ekranu';

  @override
  String get toolWebFetch => 'Pobieranie z Internetu';

  @override
  String get toolWebFetchDesc => 'Zezwalaj agentowi na pobieranie treści z URL';

  @override
  String get toolWebSearch => 'Wyszukiwanie w Internecie';

  @override
  String get toolWebSearchDesc =>
      'Zezwalaj agentowi na wyszukiwanie w internecie';

  @override
  String get toolHttpRequests => 'Żądania HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Zezwalaj agentowi na wykonywanie dowolnych żądań HTTP';

  @override
  String get toolSandboxShell => 'Powłoka Piaskownicy';

  @override
  String get toolSandboxShellDesc =>
      'Zezwalaj agentowi na uruchamianie poleceń powłoki w piaskownicy';

  @override
  String get toolImageGeneration => 'Generowanie Obrazów';

  @override
  String get toolImageGenerationDesc =>
      'Zezwalaj agentowi na generowanie obrazów za pomocą AI';

  @override
  String get toolLaunchApps => 'Uruchamianie Aplikacji';

  @override
  String get toolLaunchAppsDesc =>
      'Zezwalaj agentowi na otwieranie zainstalowanych aplikacji';

  @override
  String get toolLaunchIntents => 'Uruchamianie Intentów';

  @override
  String get toolLaunchIntentsDesc =>
      'Zezwalaj agentowi na uruchamianie intentów Android (głębokie linki, ekrany systemowe)';

  @override
  String get renameSession => 'Zmień nazwę sesji';

  @override
  String get myConversationName => 'Nazwa mojej rozmowy';

  @override
  String get renameAction => 'Zmień nazwę';

  @override
  String get couldNotTranscribeAudio => 'Nie można przetworzyć audio';

  @override
  String get stopRecording => 'Zatrzymaj nagrywanie';

  @override
  String get voiceInput => 'Wprowadzanie głosowe';

  @override
  String get speakMessage => 'Czytaj na głos';

  @override
  String get stopSpeaking => 'Zatrzymaj czytanie';

  @override
  String get selectText => 'Zaznacz tekst';

  @override
  String get messageCopied => 'Wiadomość skopiowana';

  @override
  String get copyTooltip => 'Kopiuj';

  @override
  String get commandsTooltip => 'Polecenia';

  @override
  String get providersAndModels => 'Dostawcy i Modele';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modeli skonfigurowanych',
      few: '$count modele skonfigurowane',
      one: '1 model skonfigurowany',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Automatyczne uruchamianie włączone';

  @override
  String get autoStartOffLabel => 'Automatyczne uruchamianie wyłączone';

  @override
  String get allToolsEnabled => 'Wszystkie narzędzia włączone';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count narzędzi wyłączonych',
      few: '$count narzędzia wyłączone',
      one: '1 narzędzie wyłączone',
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
  String get officialWebsite => 'Oficjalna strona';

  @override
  String get noPendingPairingRequests => 'Brak oczekujących żądań parowania';

  @override
  String get pairingRequestsTitle => 'Żądania Parowania';

  @override
  String get gatewayStartingStatus => 'Uruchamianie bramy...';

  @override
  String get gatewayRetryingStatus => 'Ponowne uruchamianie bramy...';

  @override
  String get errorStartingGateway => 'Błąd uruchamiania bramy';

  @override
  String get runningStatus => 'Działa';

  @override
  String get stoppedStatus => 'Zatrzymana';

  @override
  String get notSetUpStatus => 'Nie skonfigurowane';

  @override
  String get configuredStatus => 'Skonfigurowane';

  @override
  String get whatsAppConfigSaved => 'Konfiguracja WhatsApp zapisana';

  @override
  String get whatsAppDisconnected => 'WhatsApp rozłączony';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Stosowanie...';

  @override
  String get reconnectWhatsApp => 'Połącz ponownie WhatsApp';

  @override
  String get saveSettingsLabel => 'Zapisz Ustawienia';

  @override
  String get applySettingsRestart => 'Zastosuj Ustawienia i Uruchom Ponownie';

  @override
  String get whatsAppMode => 'Tryb WhatsApp';

  @override
  String get myPersonalNumber => 'Mój osobisty numer';

  @override
  String get myPersonalNumberDesc =>
      'Wiadomości wysyłane do własnego czatu WhatsApp budzą agenta.';

  @override
  String get dedicatedBotAccount => 'Dedykowane konto bota';

  @override
  String get dedicatedBotAccountDesc =>
      'Wiadomości wysłane z połączonego konta są ignorowane jako wychodzące.';

  @override
  String get allowedNumbers => 'Dozwolone Numery';

  @override
  String get addNumberTitle => 'Dodaj Numer';

  @override
  String get phoneNumberJid => 'Numer telefonu / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Brak skonfigurowanych dozwolonych numerów';

  @override
  String get devicesAppearAfterPairing =>
      'Urządzenia pojawią się tutaj po zatwierdzeniu żądań parowania';

  @override
  String get addPhoneNumbersHint =>
      'Dodaj numery telefonów, aby umożliwić im korzystanie z bota';

  @override
  String get allowedNumber => 'Dozwolony numer';

  @override
  String get howToConnect => 'Jak się połączyć';

  @override
  String get whatsAppConnectInstructions =>
      '1. Dotknij \"Połącz WhatsApp\" powyżej\n2. Pojawi się kod QR — zeskanuj go za pomocą WhatsApp\n   (Ustawienia → Połączone Urządzenia → Połącz Urządzenie)\n3. Po połączeniu przychodzące wiadomości są automatycznie\n   kierowane do Twojego aktywnego agenta AI';

  @override
  String get whatsAppPairingDesc =>
      'Nowi nadawcy otrzymują kod parowania. Zatwierdzasz ich.';

  @override
  String get whatsAppAllowlistDesc =>
      'Tylko określone numery telefonów mogą pisać do bota.';

  @override
  String get whatsAppOpenDesc =>
      'Każdy, kto napisze do Ciebie, może korzystać z bota.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot nie odpowie na żadne przychodzące wiadomości.';

  @override
  String get sessionExpiredRelink =>
      'Sesja wygasła. Dotknij \"Połącz ponownie\" poniżej, aby zeskanować nowy kod QR.';

  @override
  String get connectWhatsAppBelow =>
      'Dotknij \"Połącz WhatsApp\" poniżej, aby połączyć konto.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp zaakceptował kod QR. Finalizowanie połączenia...';

  @override
  String get waitingForWhatsApp =>
      'Oczekiwanie na zakończenie połączenia WhatsApp...';

  @override
  String get focusedLabel => 'Skoncentrowana';

  @override
  String get balancedLabel => 'Zrównoważona';

  @override
  String get creativeLabel => 'Kreatywna';

  @override
  String get preciseLabel => 'Precyzyjna';

  @override
  String get expressiveLabel => 'Wyrazista';

  @override
  String get browseLabel => 'Przeglądaj';

  @override
  String get apiTokenLabel => 'Token API';

  @override
  String get connectToClawHub => 'Połącz z ClawHub';

  @override
  String get clawHubLoginHint =>
      'Zaloguj się do ClawHub, aby uzyskać dostęp do umiejętności premium i instalacji pakietów';

  @override
  String get howToGetApiToken => 'Jak uzyskać token API:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Odwiedź clawhub.ai i zaloguj się przez GitHub\n2. Uruchom \"clawhub login\" w terminalu\n3. Skopiuj token i wklej go tutaj';

  @override
  String connectionFailed(String error) {
    return 'Połączenie nie powiodło się: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count uruchomień';
  }

  @override
  String nextRunLabel(String time) {
    return 'Następne uruchomienie: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Ostatni błąd: $error';
  }

  @override
  String get cronJobHintText =>
      'Instrukcje dla agenta przy uruchomieniu tego zadania…';

  @override
  String get androidPermissions => 'Uprawnienia Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw może kontrolować ekran w Twoim imieniu — dotykać przycisków, wypełniać formularze, przewijać i automatyzować powtarzalne zadania w dowolnej aplikacji.';

  @override
  String get twoPermissionsNeeded =>
      'Do pełnego doświadczenia potrzebne są dwa uprawnienia. Możesz to pominąć i włączyć je później w Ustawieniach.';

  @override
  String get accessibilityService => 'Usługa Dostępności';

  @override
  String get accessibilityServiceDesc =>
      'Umożliwia dotykanie, przesuwanie palcem, pisanie i odczyt zawartości ekranu';

  @override
  String get displayOverOtherApps => 'Wyświetlanie Nad Innymi Aplikacjami';

  @override
  String get displayOverOtherAppsDesc =>
      'Pokazuje pływający chip statusu, abyś mógł zobaczyć, co robi agent';

  @override
  String get changeDefaultModel => 'Zmień model domyślny';

  @override
  String setModelAsDefault(String name) {
    return 'Ustaw $name jako model domyślny.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'agentów',
      few: 'agentów',
      one: 'agenta',
    );
    return 'Również zaktualizuj $count $_temp0';
  }

  @override
  String get startNewSessions => 'Rozpocznij nowe sesje';

  @override
  String get currentConversationsArchived =>
      'Bieżące rozmowy zostaną zarchiwizowane';

  @override
  String get applyAction => 'Zastosuj';

  @override
  String applyModelQuestion(String name) {
    return 'Zastosować $name?';
  }

  @override
  String get setAsDefaultModel => 'Ustaw jako model domyślny';

  @override
  String get usedByAgentsWithout =>
      'Używany przez agentów bez określonego modelu';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'agentów',
      few: 'agentów',
      one: 'agenta',
    );
    return 'Zastosuj do $count $_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Dostawca jest już uwierzytelniony — klucz API nie jest potrzebny.';

  @override
  String get selectFromList => 'Wybierz z listy';

  @override
  String get enterCustomModelId => 'Wprowadź niestandardowy ID modelu';

  @override
  String get removeSkillTitle => 'Usunąć umiejętność?';

  @override
  String get browseClawHubToDiscover =>
      'Przeglądaj ClawHub, aby odkrywać i instalować umiejętności';

  @override
  String get addDeviceTooltip => 'Dodaj urządzenie';

  @override
  String get addNumberTooltip => 'Dodaj numer';

  @override
  String get searchSkillsHint => 'Szukaj umiejętności...';

  @override
  String get loginToClawHub => 'Zaloguj się do ClawHub';

  @override
  String get accountTooltip => 'Konto';

  @override
  String get editAction => 'Edytuj';

  @override
  String get setAsDefaultAction => 'Ustaw jako domyślny';

  @override
  String get chooseProviderTitle => 'Wybierz dostawcę';

  @override
  String get apiKeyTitle => 'Klucz API';

  @override
  String get slackConfigSaved =>
      'Slack zapisany — uruchom ponownie bramę, aby połączyć';

  @override
  String get signalConfigSaved =>
      'Signal zapisany — uruchom ponownie bramę, aby połączyć';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Dodaj urządzenie';

  @override
  String get skipAction => 'Pomiń';

  @override
  String get mcpServers => 'Serwery MCP';

  @override
  String get noMcpServersConfigured => 'Brak skonfigurowanych serwerów MCP';

  @override
  String get mcpServersEmptyHint =>
      'Dodaj serwery MCP, aby dać agentowi dostęp do narzędzi GitHub, Notion, Slack, baz danych i innych.';

  @override
  String get addMcpServer => 'Dodaj serwer MCP';

  @override
  String get editMcpServer => 'Edytuj serwer MCP';

  @override
  String get removeMcpServer => 'Usuń serwer MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Usunąć \"$name\"? Jego narzędzia nie będą już dostępne.';
  }

  @override
  String get mcpTransport => 'Transport';

  @override
  String get testConnection => 'Testuj połączenie';

  @override
  String get mcpServerNameLabel => 'Nazwa serwera';

  @override
  String get mcpServerNameHint => 'np. GitHub, Notion, Moja baza';

  @override
  String get mcpServerUrlLabel => 'URL serwera';

  @override
  String get mcpBearerTokenLabel => 'Token Bearer (opcjonalnie)';

  @override
  String get mcpBearerTokenHint =>
      'Zostaw puste, jeśli uwierzytelnianie nie jest wymagane';

  @override
  String get mcpCommandLabel => 'Polecenie';

  @override
  String get mcpArgumentsLabel => 'Argumenty (oddzielone spacjami)';

  @override
  String get mcpEnvVarsLabel =>
      'Zmienne środowiskowe (KLUCZ=WARTOŚĆ, jedna na wiersz)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio nie jest dostępne na iOS. Użyj HTTP lub SSE.';

  @override
  String get connectedStatus => 'Połączono';

  @override
  String get mcpConnecting => 'Łączenie...';

  @override
  String get mcpConnectionError => 'Błąd połączenia';

  @override
  String get mcpDisconnected => 'Rozłączono';

  @override
  String mcpToolsCount(int count) {
    return '$count narzędzi';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — odkryto $count narzędzi';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Połączono (0 narzędzi)';

  @override
  String get mcpTestFailed => 'Połączenie nieudane. Sprawdź URL/token serwera.';

  @override
  String get mcpAddServer => 'Dodaj serwer';

  @override
  String get mcpSaveChanges => 'Zapisz zmiany';

  @override
  String get urlIsRequired => 'URL jest wymagany';

  @override
  String get enterValidUrl => 'Wpisz prawidłowy URL';

  @override
  String get commandIsRequired => 'Polecenie jest wymagane';

  @override
  String skillRemoved(String name) {
    return 'Umiejętność \"$name\" usunięta';
  }

  @override
  String get editFileContentHint => 'Edytuj zawartość pliku...';

  @override
  String get whatsAppPairSubtitle =>
      'Połącz swoje osobiste konto WhatsApp kodem QR';

  @override
  String get whatsAppPairingOptional =>
      'Parowanie jest opcjonalne. Możesz teraz zakończyć konfigurację i dodać połączenie później.';

  @override
  String get whatsAppEnableToLink =>
      'Włącz WhatsApp, aby zacząć łączyć to urządzenie.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp połączony. FlutterClaw będzie mógł odpowiadać po konfiguracji.';

  @override
  String get cancelLink => 'Anuluj połączenie';
}
