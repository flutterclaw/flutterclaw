// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Kanály';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Nastavení';

  @override
  String get getStarted => 'Začít';

  @override
  String get yourPersonalAssistant => 'Váš osobní AI asistent';

  @override
  String get multiChannelChat => 'Vícekanalový chat';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat a další';

  @override
  String get powerfulAIModels => 'Výkonné AI modely';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok a bezplatné modely';

  @override
  String get localGateway => 'Lokální brána';

  @override
  String get localGatewayDesc =>
      'Běží na vašem zařízení, vaše data zůstávají vaše';

  @override
  String get chooseProvider => 'Vyberte Poskytovatele';

  @override
  String get selectProviderDesc =>
      'Vyberte, jak se chcete připojit k AI modelům.';

  @override
  String get startForFree => 'Začít Zdarma';

  @override
  String get freeProvidersDesc =>
      'Tito poskytovatelé nabízejí bezplatné modely pro start bez nákladů.';

  @override
  String get free => 'ZDARMA';

  @override
  String get otherProviders => 'Další Poskytovatelé';

  @override
  String connectToProvider(String provider) {
    return 'Připojit k $provider';
  }

  @override
  String get enterApiKeyDesc => 'Zadejte svůj API klíč a vyberte model.';

  @override
  String get dontHaveApiKey => 'Nemáte API klíč?';

  @override
  String get createAccountCopyKey => 'Vytvořte účet a zkopírujte svůj klíč.';

  @override
  String get signUp => 'Zaregistrovat se';

  @override
  String get apiKey => 'API klíč';

  @override
  String get pasteFromClipboard => 'Vložit ze schránky';

  @override
  String get apiBaseUrl => 'Základní URL API';

  @override
  String get selectModel => 'Vybrat Model';

  @override
  String get modelId => 'ID Modelu';

  @override
  String get validateKey => 'Ověřit Klíč';

  @override
  String get validating => 'Ověřování...';

  @override
  String get invalidApiKey => 'Neplatný API klíč';

  @override
  String get gatewayConfiguration => 'Konfigurace Brány';

  @override
  String get gatewayConfigDesc =>
      'Brána je lokální řídicí rovina vašeho asistenta.';

  @override
  String get defaultSettingsNote =>
      'Výchozí nastavení funguje pro většinu uživatelů. Měňte pouze pokud víte, co potřebujete.';

  @override
  String get host => 'Hostitel';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Automatické spuštění brány';

  @override
  String get autoStartGatewayDesc =>
      'Spustit bránu automaticky při spuštění aplikace.';

  @override
  String get channelsPageTitle => 'Kanály';

  @override
  String get channelsPageDesc =>
      'Volitelně připojte kanály zpráv. Můžete je vždy nastavit později v Nastavení.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Připojte bota Telegram.';

  @override
  String get openBotFather => 'Otevřít BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Připojte bota Discord.';

  @override
  String get developerPortal => 'Portál Vývojáře';

  @override
  String get botToken => 'Token Bota';

  @override
  String telegramBotToken(String platform) {
    return 'Token Bota $platform';
  }

  @override
  String get readyToGo => 'Připraveno ke Spuštění';

  @override
  String get reviewConfiguration =>
      'Zkontrolujte svou konfiguraci a spusťte FlutterClaw.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return 'přes $provider';
  }

  @override
  String get gateway => 'Brána';

  @override
  String get webChatOnly => 'Pouze WebChat (můžete přidat více později)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Spouštění...';

  @override
  String get startFlutterClaw => 'Spustit FlutterClaw';

  @override
  String get newSession => 'Nová relace';

  @override
  String get photoLibrary => 'Knihovna Fotek';

  @override
  String get camera => 'Fotoaparát';

  @override
  String get whatDoYouSeeInImage => 'Co vidíte na tomto obrázku?';

  @override
  String get imagePickerNotAvailable =>
      'Výběr obrázku není k dispozici na Simulátoru. Použijte skutečné zařízení.';

  @override
  String get couldNotOpenImagePicker => 'Nelze otevřít výběr obrázku.';

  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';

  @override
  String get attachImage => 'Připojit obrázek';

  @override
  String get messageFlutterClaw => 'Zpráva pro FlutterClaw...';

  @override
  String get channelsAndGateway => 'Kanály a Brána';

  @override
  String get stop => 'Zastavit';

  @override
  String get start => 'Spustit';

  @override
  String status(String status) {
    return 'Stav: $status';
  }

  @override
  String get builtInChatInterface => 'Vestavěné rozhraní chatu';

  @override
  String get notConfigured => 'Není nakonfigurováno';

  @override
  String get connected => 'Připojeno';

  @override
  String get configuredStarting => 'Nakonfigurováno (spouštění...)';

  @override
  String get telegramConfiguration => 'Konfigurace Telegram';

  @override
  String get fromBotFather => 'Od @BotFather';

  @override
  String get allowedUserIds => 'Povolená ID uživatelů (oddělená čárkami)';

  @override
  String get leaveEmptyToAllowAll => 'Ponechte prázdné pro povolení všem';

  @override
  String get cancel => 'Zrušit';

  @override
  String get saveAndConnect => 'Uložit a Připojit';

  @override
  String get discordConfiguration => 'Konfigurace Discord';

  @override
  String get pendingPairingRequests => 'Čekající Žádosti o Párování';

  @override
  String get approve => 'Schválit';

  @override
  String get reject => 'Odmítnout';

  @override
  String get expired => 'Vypršelo';

  @override
  String minutesLeft(int minutes) {
    return 'Zbývá ${minutes}m';
  }

  @override
  String get workspaceFiles => 'Soubory Pracovního Prostoru';

  @override
  String get personalAIAssistant => 'Osobní AI Asistent';

  @override
  String sessionsCount(int count) {
    return 'Relace ($count)';
  }

  @override
  String get noActiveSessions => 'Žádné aktivní relace';

  @override
  String get startConversationToCreate => 'Začněte konverzaci pro vytvoření';

  @override
  String get startConversationToSee =>
      'Začněte konverzaci pro zobrazení relací zde';

  @override
  String get reset => 'Resetovat';

  @override
  String get cronJobs => 'Naplánované Úlohy';

  @override
  String get noCronJobs => 'Žádné naplánované úlohy';

  @override
  String get addScheduledTasks => 'Přidejte naplánované úlohy pro svého agenta';

  @override
  String get runNow => 'Spustit Nyní';

  @override
  String get enable => 'Povolit';

  @override
  String get disable => 'Zakázat';

  @override
  String get delete => 'Smazat';

  @override
  String get skills => 'Dovednosti';

  @override
  String get browseClawHub => 'Procházet ClawHub';

  @override
  String get noSkillsInstalled => 'Žádné nainstalované dovednosti';

  @override
  String get browseClawHubToAdd => 'Procházejte ClawHub pro přidání dovedností';

  @override
  String removeSkillConfirm(String name) {
    return 'Odstranit \"$name\" z vašich dovedností?';
  }

  @override
  String get clawHubSkills => 'Dovednosti ClawHub';

  @override
  String get searchSkills => 'Hledat dovednosti...';

  @override
  String get noSkillsFound =>
      'Žádné dovednosti nenalezeny. Zkuste jiné hledání.';

  @override
  String installedSkill(String name) {
    return '$name nainstalováno';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Instalace $name selhala';
  }

  @override
  String get addCronJob => 'Přidat Naplánovanou Úlohu';

  @override
  String get jobName => 'Název Úlohy';

  @override
  String get dailySummaryExample => 'např. Denní Souhrn';

  @override
  String get taskPrompt => 'Popis Úlohy';

  @override
  String get whatShouldAgentDo => 'Co by měl agent dělat?';

  @override
  String get interval => 'Interval';

  @override
  String get every5Minutes => 'Každých 5 minut';

  @override
  String get every15Minutes => 'Každých 15 minut';

  @override
  String get every30Minutes => 'Každých 30 minut';

  @override
  String get everyHour => 'Každou hodinu';

  @override
  String get every6Hours => 'Každých 6 hodin';

  @override
  String get every12Hours => 'Každých 12 hodin';

  @override
  String get every24Hours => 'Každých 24 hodin';

  @override
  String get add => 'Přidat';

  @override
  String get save => 'Uložit';

  @override
  String get sessions => 'Relace';

  @override
  String messagesCount(int count) {
    return '$count zpráv';
  }

  @override
  String tokensCount(int count) {
    return '$count tokenů';
  }

  @override
  String get compact => 'Kompaktovat';

  @override
  String get models => 'Modely';

  @override
  String get noModelsConfigured => 'Žádné nakonfigurované modely';

  @override
  String get addModelToStartChatting => 'Přidejte model pro zahájení chatu';

  @override
  String get addModel => 'Přidat Model';

  @override
  String get default_ => 'VÝCHOZÍ';

  @override
  String get autoStart => 'Automatické spuštění';

  @override
  String get startGatewayWhenLaunches => 'Spustit bránu při spuštění aplikace';

  @override
  String get heartbeat => 'Tep Srdce';

  @override
  String get enabled => 'Povoleno';

  @override
  String get periodicAgentTasks => 'Periodické úlohy agenta z HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'O Aplikaci';

  @override
  String get personalAIAssistantForIOS =>
      'Osobní AI Asistent pro iOS a Android';

  @override
  String get version => 'Verze';

  @override
  String get basedOnOpenClaw => 'Založeno na OpenClaw';

  @override
  String get removeModel => 'Odstranit model?';

  @override
  String removeModelConfirm(String name) {
    return 'Odstranit \"$name\" z vašich modelů?';
  }

  @override
  String get remove => 'Odstranit';

  @override
  String get setAsDefault => 'Nastavit jako Výchozí';

  @override
  String get paste => 'Vložit';

  @override
  String get chooseProviderStep => '1. Vybrat Poskytovatele';

  @override
  String get selectModelStep => '2. Vybrat Model';

  @override
  String get apiKeyStep => '3. API klíč';

  @override
  String getApiKeyAt(String provider) {
    return 'Získat API klíč na $provider';
  }

  @override
  String get justNow => 'právě teď';

  @override
  String minutesAgo(int minutes) {
    return 'před ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'před ${hours}h';
  }

  @override
  String daysAgo(int days) {
    return 'před ${days}d';
  }

  @override
  String get microphonePermissionDenied => 'Povolení mikrofonu zamítnuto';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Živý přepis není k dispozici: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Nepodařilo se spustit nahrávání: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Použití přepisu na zařízení';

  @override
  String get transcribingWithWhisper => 'Přepisování pomocí Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API selhalo: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Nebyl zachycen žádný přepis';

  @override
  String failedToStopRecording(String error) {
    return 'Nepodařilo se zastavit nahrávání: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Nepodařilo se $action: $error';
  }

  @override
  String get pause => 'Pozastavit';

  @override
  String get resume => 'Pokračovat';

  @override
  String get send => 'Odeslat';

  @override
  String get liveActivityActive => 'Živá aktivita aktivní';

  @override
  String get restartGateway => 'Restartovat bránu';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Doba provozu: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Podpora na pozadí aktivní - brána může dál odpovídat';

  @override
  String get webChatBuiltIn => 'Vestavěné chatovací rozhraní';

  @override
  String get configure => 'Konfigurovat';

  @override
  String get disconnect => 'Odpojit';

  @override
  String get agents => 'Agenti';

  @override
  String get agentFiles => 'Soubory Agenta';

  @override
  String get createAgent => 'Vytvořit Agenta';

  @override
  String get editAgent => 'Upravit Agenta';

  @override
  String get noAgentsYet => 'Zatím žádní agenti';

  @override
  String get createYourFirstAgent => 'Vytvořte svého prvního agenta!';

  @override
  String get active => 'Aktivní';

  @override
  String get agentName => 'Jméno Agenta';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Vybrat Emoji';

  @override
  String get vibe => 'Styl';

  @override
  String get vibeHint => 'např. přátelský, formální, sarkastický';

  @override
  String get modelConfiguration => 'Konfigurace Modelu';

  @override
  String get advancedSettings => 'Pokročilé Nastavení';

  @override
  String get agentCreated => 'Agent vytvořen';

  @override
  String get agentUpdated => 'Agent aktualizován';

  @override
  String get agentDeleted => 'Agent smazán';

  @override
  String switchedToAgent(String name) {
    return 'Přepnuto na $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Smazat $name? Tím se odstraní všechna data pracovního prostoru.';
  }

  @override
  String get agentDetails => 'Detail Agenta';

  @override
  String get createdAt => 'Vytvořeno';

  @override
  String get lastUsed => 'Naposledy použito';

  @override
  String get basicInformation => 'Základní Informace';

  @override
  String get switchToAgent => 'Přepnout Agenta';

  @override
  String get providers => 'Poskytovatelé';

  @override
  String get addProvider => 'Přidat poskytovatele';

  @override
  String get noProvidersConfigured =>
      'Žádní poskytovatelé nejsou nakonfigurováni.';

  @override
  String get editCredentials => 'Upravit přihlašovací údaje';

  @override
  String get defaultModelHint =>
      'Výchozí model je používán agenty, kteří neurčují svůj vlastní.';

  @override
  String get voiceCallModelSection => 'Hlasový hovor (Live)';

  @override
  String get voiceCallModelDescription =>
      'Použije se jen když klepnete na tlačítko hovoru. Chat, agenti i úlohy na pozadí používají váš běžný model.';

  @override
  String get voiceCallModelLabel => 'Model Live';

  @override
  String get voiceCallModelAutomatic => 'Automaticky';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Spouštět bootstrap v hovoru';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'V nové prázdné konverzaci s BOOTSTRAP.md spustit hlasový hovor místo tichého textového bootstrappingu (když je Live k dispozici).';

  @override
  String get liveVoiceNameLabel => 'Hlas';

  @override
  String get firstHatchModeChoiceTitle => 'Jak chcete začít?';

  @override
  String get firstHatchModeChoiceBody =>
      'Můžete si s asistentem psát v chatu nebo začít hlasovou konverzaci — jako krátký hovor. Vyberte si, co vám vyhovuje víc.';

  @override
  String get firstHatchModeChoiceChatButton => 'Psát v chatu';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Mluvit hlasem';

  @override
  String get liveVoiceBargeInHint =>
      'Mluvte až když asistent domluví (ozvěna je dřív přerušovala uprostřed řeči).';

  @override
  String get liveVoiceFallbackTitle => 'Živě';

  @override
  String get liveVoiceEndConversationTooltip => 'Ukončit hovor';

  @override
  String get liveVoiceStatusConnecting => 'Připojování…';

  @override
  String get liveVoiceStatusRunning => 'Probíhá…';

  @override
  String get liveVoiceStatusSpeaking => 'Mluví…';

  @override
  String get liveVoiceStatusListening => 'Naslouchá…';

  @override
  String get liveVoiceBadge => 'ŽIVĚ';

  @override
  String get cannotAddLiveModelAsChat =>
      'Tento model je jen pro hlasové hovory. Vyberte chatovací model ze seznamu.';

  @override
  String get authBearerTokenLabel => 'Bearer token';

  @override
  String get authAccessKeysLabel => 'Přístupové klíče';

  @override
  String authModelsFoundCount(int count) {
    return 'Nalezeno $count modelů';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count dalších — zadejte ID ručně';
  }

  @override
  String get scanQrBarcodeTitle => 'Naskenovat QR / čárový kód';

  @override
  String get oauthSignInTitle => 'Přihlásit se';

  @override
  String get browserOverlayDone => 'Hotovo';

  @override
  String appInitializationError(String error) {
    return 'Chyba inicializace: $error';
  }

  @override
  String get credentialsScreenTitle => 'Přihlašovací údaje';

  @override
  String get credentialsIntroBody =>
      'Přidejte více API klíčů na poskytovatele. FlutterClaw je střídá a při limitech je dočasně vyřadí.';

  @override
  String get credentialsNoProvidersBody =>
      'Žádní poskytovatelé.\nPřejděte do Nastavení → Poskytovatelé a modely a přidejte jednoho.';

  @override
  String get credentialsAddKeyTooltip => 'Přidat klíč';

  @override
  String get credentialsNoExtraKeysMessage =>
      'Žádné další klíče — používá se klíč z Poskytovatelé a modely.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'Přidat klíč $provider';
  }

  @override
  String get credentialsKeyLabelHint => 'Štítek (např. „Pracovní klíč“)';

  @override
  String get credentialsApiKeyFieldLabel => 'API klíč';

  @override
  String get securitySettingsTitle => 'Zabezpečení';

  @override
  String get securitySettingsIntro =>
      'Ovládejte kontroly proti nebezpečným operacím. Platí pro aktuální relaci.';

  @override
  String get securitySectionToolExecution => 'PROVOZENÍ NÁSTROJŮ';

  @override
  String get securityPatternDetectionTitle => 'Detekce bezpečnostních vzorů';

  @override
  String get securityPatternDetectionSubtitle =>
      'Blokuje nebezpečné vzory: shell injection, path traversal, eval/exec, XSS, deserializace.';

  @override
  String get securityUnsafeModeBanner =>
      'Kontroly zabezpečení jsou vypnuté. Volání nástrojů bez validace. Po dokončení znovu zapněte.';

  @override
  String get securitySectionHowItWorks => 'JAK TO FUNGUJE';

  @override
  String get securityHowItWorksBlocked =>
      'Shoduje-li se volání s nebezpečným vzorem, je zablokováno a agent se dozví důvod.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'V chatu použijte /unsafe pro jednorázovou výjimku u zablokovaného volání, pak se kontroly obnoví.';

  @override
  String get securityHowItWorksToggleSession =>
      'Vypněte zde „Detekce bezpečnostních vzorů“, abyste kontroly vypnuli pro celou relaci.';

  @override
  String get holdToSetAsDefault => 'Podržte pro nastavení jako výchozí';

  @override
  String get integrations => 'Integrace';

  @override
  String get shortcutsIntegrations => 'Integrace Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'Nainstalujte iOS Shortcuts pro spouštění akcí aplikací třetích stran';

  @override
  String get dangerZone => 'Nebezpečná zóna';

  @override
  String get resetOnboarding => 'Resetovat a znovu spustit průvodce';

  @override
  String get resetOnboardingDesc =>
      'Smaže veškerou konfiguraci a vrátí se k průvodci nastavením.';

  @override
  String get resetAllConfiguration => 'Resetovat veškerou konfiguraci?';

  @override
  String get resetAllConfigurationDesc =>
      'Tím se smažou vaše API klíče, modely a všechna nastavení. Aplikace se vrátí k průvodci nastavením.\n\nHistorie konverzací není smazána.';

  @override
  String get removeProvider => 'Odebrat poskytovatele';

  @override
  String removeProviderConfirm(String provider) {
    return 'Odebrat přihlašovací údaje pro $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name nastaven jako výchozí model';
  }

  @override
  String get photoImage => 'Foto / Obrázek';

  @override
  String get documentPdfTxt => 'Dokument (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Nelze otevřít dokument: $error';
  }

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get gatewayStopped => 'Brána zastavena';

  @override
  String get gatewayStarted => 'Brána úspěšně spuštěna!';

  @override
  String gatewayFailed(String error) {
    return 'Brána selhala: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Výjimka: $error';
  }

  @override
  String get pairingRequestApproved => 'Žádost o párování schválena';

  @override
  String get pairingRequestRejected => 'Žádost o párování odmítnuta';

  @override
  String get addDevice => 'Přidat Zařízení';

  @override
  String get telegramConfigSaved => 'Konfigurace Telegram uložena';

  @override
  String get discordConfigSaved => 'Konfigurace Discord uložena';

  @override
  String get securityMethod => 'Metoda Zabezpečení';

  @override
  String get pairingRecommended => 'Párování (Doporučeno)';

  @override
  String get pairingDescription =>
      'Noví uživatelé dostanou párovací kód. Vy je schválíte nebo odmítnete.';

  @override
  String get allowlistTitle => 'Seznam povolených';

  @override
  String get allowlistDescription =>
      'Pouze konkrétní ID uživatelů mohou přistupovat k botovi.';

  @override
  String get openAccess => 'Otevřený';

  @override
  String get openAccessDescription =>
      'Kdokoli může bota okamžitě používat (nedoporučeno).';

  @override
  String get disabledAccess => 'Zakázáno';

  @override
  String get disabledAccessDescription =>
      'Žádné přímé zprávy nejsou povoleny. Bot nebude odpovídat na žádné zprávy.';

  @override
  String get approvedDevices => 'Schválená Zařízení';

  @override
  String get noApprovedDevicesYet => 'Zatím žádná schválená zařízení';

  @override
  String get devicesAppearAfterApproval =>
      'Zařízení se zde zobrazí po schválení jejich žádostí o párování';

  @override
  String get noAllowedUsersConfigured =>
      'Žádní povolení uživatelé nejsou nakonfigurováni';

  @override
  String get addUserIdsHint =>
      'Přidejte ID uživatelů pro povolení používat bota';

  @override
  String get removeDevice => 'Odebrat zařízení?';

  @override
  String removeAccessFor(String name) {
    return 'Odebrat přístup pro $name?';
  }

  @override
  String get saving => 'Ukládání...';

  @override
  String get channelsLabel => 'Kanály';

  @override
  String get clawHubAccount => 'Účet ClawHub';

  @override
  String get loggedInToClawHub => 'Jste aktuálně přihlášeni do ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Odhlášeno z ClawHub';

  @override
  String get login => 'Přihlásit';

  @override
  String get logout => 'Odhlásit';

  @override
  String get connect => 'Připojit';

  @override
  String get pasteClawHubToken => 'Vložte svůj token API ClawHub';

  @override
  String get pleaseEnterApiToken => 'Prosím zadejte token API';

  @override
  String get successfullyConnected => 'Úspěšně připojeno ke ClawHub';

  @override
  String get browseSkillsButton => 'Procházet Dovednosti';

  @override
  String get installSkill => 'Nainstalovat Dovednost';

  @override
  String get incompatibleSkill => 'Nekompatibilní Dovednost';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Tato dovednost nemůže běžet na mobilním zařízení (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Upozornění na Kompatibilitu';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Tato dovednost byla navržena pro desktop a nemusí fungovat na mobilním zařízení.\n\n$reason\n\nChcete nainstalovat upravenou verzi optimalizovanou pro mobilní zařízení?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Nainstalovat Originál';

  @override
  String get installAdapted => 'Nainstalovat Upravenou';

  @override
  String get resetSession => 'Resetovat Relaci';

  @override
  String resetSessionConfirm(String key) {
    return 'Resetovat relaci \"$key\"? Tím se smažou všechny zprávy.';
  }

  @override
  String get sessionReset => 'Relace resetována';

  @override
  String get activeSessions => 'Aktivní Relace';

  @override
  String get scheduledTasks => 'Naplánované Úlohy';

  @override
  String get defaultBadge => 'Výchozí';

  @override
  String errorGeneric(String error) {
    return 'Chyba: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName uloženo';
  }

  @override
  String errorSavingFile(String error) {
    return 'Chyba při ukládání souboru: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Nelze smazat posledního agenta';

  @override
  String get close => 'Zavřít';

  @override
  String get nameIsRequired => 'Jméno je povinné';

  @override
  String get pleaseSelectModel => 'Prosím vyberte model';

  @override
  String temperatureLabel(String value) {
    return 'Teplota: $value';
  }

  @override
  String get maxTokens => 'Maximální Tokeny';

  @override
  String get maxTokensRequired => 'Maximální tokeny jsou povinné';

  @override
  String get mustBePositiveNumber => 'Musí být kladné číslo';

  @override
  String get maxToolIterations => 'Maximální Iterace Nástrojů';

  @override
  String get maxIterationsRequired => 'Maximální iterace jsou povinné';

  @override
  String get restrictToWorkspace => 'Omezit na Pracovní Prostor';

  @override
  String get restrictToWorkspaceDesc =>
      'Omezit operace se soubory na pracovní prostor agenta';

  @override
  String get noModelsConfiguredLong =>
      'Prosím přidejte alespoň jeden model v Nastavení před vytvořením agenta.';

  @override
  String get selectProviderFirst => 'Nejprve vyberte poskytovatele';

  @override
  String get skip => 'Přeskočit';

  @override
  String get continueButton => 'Pokračovat';

  @override
  String get uiAutomation => 'Automatizace Rozhraní';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw může ovládat vaši obrazovku — klepat na tlačítka, vyplňovat formuláře, posouvat a automatizovat opakující se úlohy v jakékoli aplikaci.';

  @override
  String get uiAutomationAccessibilityNote =>
      'To vyžaduje povolení Služby Přístupnosti v nastavení Android. Můžete to přeskočit a povolit později.';

  @override
  String get openAccessibilitySettings => 'Otevřít Nastavení Přístupnosti';

  @override
  String get skipForNow => 'Přeskočit prozatím';

  @override
  String get checkingPermission => 'Kontrola oprávnění…';

  @override
  String get accessibilityEnabled => 'Služba Přístupnosti je povolena';

  @override
  String get accessibilityNotEnabled => 'Služba Přístupnosti není povolena';

  @override
  String get exploreIntegrations => 'Prozkoumat Integrace';

  @override
  String get requestTimedOut => 'Požadavek vypršel';

  @override
  String get myShortcuts => 'Moje Zkratky';

  @override
  String get addShortcut => 'Přidat Zkratku';

  @override
  String get noShortcutsYet => 'Zatím žádné zkratky';

  @override
  String get shortcutsInstructions =>
      'Vytvořte zkratku v aplikaci iOS Shortcuts, přidejte akci zpětného volání na konec, poté ji zde zaregistrujte, aby ji AI mohl spustit.';

  @override
  String get shortcutName => 'Název zkratky';

  @override
  String get shortcutNameHint => 'Přesný název z aplikace Shortcuts';

  @override
  String get descriptionOptional => 'Popis (volitelný)';

  @override
  String get whatDoesShortcutDo => 'Co tato zkratka dělá?';

  @override
  String get callbackSetup => 'Nastavení zpětného volání';

  @override
  String get callbackInstructions =>
      'Každá zkratka musí končit:\n① Získat Hodnotu pro Klíč → \"callbackUrl\" (ze Vstupu Zkratky analyzovaného jako dict)\n② Otevřít URL ← výstup z ①';

  @override
  String get channelApp => 'Aplikace';

  @override
  String get channelHeartbeat => 'Tep Srdce';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagent';

  @override
  String get channelSystem => 'Systém';

  @override
  String secondsAgo(int seconds) {
    return 'před ${seconds}s';
  }

  @override
  String get messagesAbbrev => 'zpr';

  @override
  String get modelAlreadyAdded => 'Tento model je již ve vašem seznamu';

  @override
  String get bothTokensRequired => 'Oba tokeny jsou povinné';

  @override
  String get slackSavedRestart =>
      'Slack uložen — restartujte bránu pro připojení';

  @override
  String get slackConfiguration => 'Konfigurace Slack';

  @override
  String get setupTitle => 'Nastavení';

  @override
  String get slackSetupInstructions =>
      '1. Vytvořte aplikaci Slack na api.slack.com/apps\n2. Povolte Socket Mode → vygenerujte token na úrovni aplikace (xapp-…)\n   s rozsahem: connections:write\n3. Přidejte rozsahy tokenu bota: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Nainstalujte aplikaci do workspace → zkopírujte token bota (xoxb-…)';

  @override
  String get botTokenXoxb => 'Token bota (xoxb-…)';

  @override
  String get appLevelToken => 'Token na úrovni aplikace (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'URL API a telefonní číslo jsou povinné';

  @override
  String get signalSavedRestart =>
      'Signal uložen — restartujte bránu pro připojení';

  @override
  String get signalConfiguration => 'Konfigurace Signal';

  @override
  String get requirementsTitle => 'Požadavky';

  @override
  String get signalRequirements =>
      'Vyžaduje signal-cli-rest-api běžící na serveru:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nZaregistrujte/propojte své číslo Signal přes REST API, poté zadejte URL a telefonní číslo níže.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Vaše telefonní číslo Signal';

  @override
  String get userIdLabel => 'ID Uživatele';

  @override
  String get enterDiscordUserId => 'Zadejte ID uživatele Discord';

  @override
  String get enterTelegramUserId => 'Zadejte ID uživatele Telegram';

  @override
  String get fromDiscordDevPortal => 'Z Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Povolená ID Uživatelů';

  @override
  String get approvedDevice => 'Schválené zařízení';

  @override
  String get allowedUser => 'Povolený uživatel';

  @override
  String get howToGetBotToken => 'Jak získat token bota';

  @override
  String get discordTokenInstructions =>
      '1. Přejděte do Discord Developer Portal\n2. Vytvořte novou aplikaci a bota\n3. Zkopírujte token a vložte jej výše\n4. Povolte Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Otevřete Telegram a vyhledejte @BotFather\n2. Pošlete /newbot a postupujte podle pokynů\n3. Zkopírujte token a vložte jej výše';

  @override
  String get fromBotFatherHint => 'Získejte od @BotFather';

  @override
  String get accessTokenLabel => 'Přístupový token';

  @override
  String get notSetOpenAccess =>
      'Není nastaven — otevřený přístup (pouze loopback)';

  @override
  String get gatewayAccessToken => 'Přístupový token brány';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Ponechte prázdné pro zakázání autentizace';

  @override
  String get toolPolicies => 'Zásady Nástrojů';

  @override
  String get toolPoliciesDesc =>
      'Kontrolujte, k čemu má agent přístup. Zakázané nástroje jsou skryty před AI a zablokovány za běhu.';

  @override
  String get privacySensors => 'Soukromí a Senzory';

  @override
  String get networkCategory => 'Síť';

  @override
  String get systemCategory => 'Systém';

  @override
  String get toolTakePhotos => 'Pořizovat Fotografie';

  @override
  String get toolTakePhotosDesc =>
      'Povolit agentovi pořizovat fotografie pomocí kamery';

  @override
  String get toolRecordVideo => 'Nahrávat Video';

  @override
  String get toolRecordVideoDesc => 'Povolit agentovi nahrávat video';

  @override
  String get toolLocation => 'Poloha';

  @override
  String get toolLocationDesc =>
      'Povolit agentovi číst vaši aktuální GPS polohu';

  @override
  String get toolHealthData => 'Zdravotní Data';

  @override
  String get toolHealthDataDesc =>
      'Povolit agentovi číst zdravotní/fitness data';

  @override
  String get toolContacts => 'Kontakty';

  @override
  String get toolContactsDesc => 'Povolit agentovi prohledávat vaše kontakty';

  @override
  String get toolScreenshots => 'Snímky Obrazovky';

  @override
  String get toolScreenshotsDesc =>
      'Povolit agentovi pořizovat snímky obrazovky';

  @override
  String get toolWebFetch => 'Stahování z Webu';

  @override
  String get toolWebFetchDesc => 'Povolit agentovi stahovat obsah z URL';

  @override
  String get toolWebSearch => 'Vyhledávání na Webu';

  @override
  String get toolWebSearchDesc => 'Povolit agentovi vyhledávat na internetu';

  @override
  String get toolHttpRequests => 'HTTP Požadavky';

  @override
  String get toolHttpRequestsDesc =>
      'Povolit agentovi provádět libovolné HTTP požadavky';

  @override
  String get toolSandboxShell => 'Shell v Sandboxu';

  @override
  String get toolSandboxShellDesc =>
      'Povolit agentovi spouštět shell příkazy v sandboxu';

  @override
  String get toolImageGeneration => 'Generování Obrázků';

  @override
  String get toolImageGenerationDesc =>
      'Povolit agentovi generovat obrázky pomocí AI';

  @override
  String get toolLaunchApps => 'Spouštění Aplikací';

  @override
  String get toolLaunchAppsDesc =>
      'Povolit agentovi otevírat nainstalované aplikace';

  @override
  String get toolLaunchIntents => 'Spouštění Intentů';

  @override
  String get toolLaunchIntentsDesc =>
      'Povolit agentovi spouštět Android intenty (hluboké odkazy, systémové obrazovky)';

  @override
  String get renameSession => 'Přejmenovat relaci';

  @override
  String get myConversationName => 'Název mé konverzace';

  @override
  String get renameAction => 'Přejmenovat';

  @override
  String get couldNotTranscribeAudio => 'Nelze přepsat zvuk';

  @override
  String get stopRecording => 'Zastavit nahrávání';

  @override
  String get voiceInput => 'Hlasový vstup';

  @override
  String get speakMessage => 'Přečíst nahlas';

  @override
  String get stopSpeaking => 'Zastavit čtení';

  @override
  String get selectText => 'Vybrat text';

  @override
  String get messageCopied => 'Zpráva zkopírována';

  @override
  String get copyTooltip => 'Kopírovat';

  @override
  String get commandsTooltip => 'Příkazy';

  @override
  String get providersAndModels => 'Poskytovatelé a Modely';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modelů nakonfigurováno',
      few: '$count modely nakonfigurovány',
      one: '1 model nakonfigurován',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Automatické spuštění povoleno';

  @override
  String get autoStartOffLabel => 'Automatické spuštění vypnuto';

  @override
  String get allToolsEnabled => 'Všechny nástroje povoleny';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nástrojů zakázáno',
      few: '$count nástroje zakázány',
      one: '1 nástroj zakázán',
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
  String get officialWebsite => 'Oficiální web';

  @override
  String get noPendingPairingRequests => 'Žádné čekající žádosti o párování';

  @override
  String get pairingRequestsTitle => 'Žádosti o Párování';

  @override
  String get gatewayStartingStatus => 'Spouštění brány...';

  @override
  String get gatewayRetryingStatus => 'Opakování spuštění brány...';

  @override
  String get errorStartingGateway => 'Chyba při spuštění brány';

  @override
  String get runningStatus => 'Běží';

  @override
  String get stoppedStatus => 'Zastaveno';

  @override
  String get notSetUpStatus => 'Není nastaveno';

  @override
  String get configuredStatus => 'Nakonfigurováno';

  @override
  String get whatsAppConfigSaved => 'Konfigurace WhatsApp uložena';

  @override
  String get whatsAppDisconnected => 'WhatsApp odpojeno';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Aplikování...';

  @override
  String get reconnectWhatsApp => 'Znovu připojit WhatsApp';

  @override
  String get saveSettingsLabel => 'Uložit Nastavení';

  @override
  String get applySettingsRestart => 'Použít Nastavení a Restartovat';

  @override
  String get whatsAppMode => 'Režim WhatsApp';

  @override
  String get myPersonalNumber => 'Moje osobní číslo';

  @override
  String get myPersonalNumberDesc =>
      'Zprávy, které posíláte do svého vlastního WhatsApp chatu, probudí agenta.';

  @override
  String get dedicatedBotAccount => 'Vyhrazený bot účet';

  @override
  String get dedicatedBotAccountDesc =>
      'Zprávy odeslané z propojeného účtu samotného jsou ignorovány jako odchozí.';

  @override
  String get allowedNumbers => 'Povolená Čísla';

  @override
  String get addNumberTitle => 'Přidat Číslo';

  @override
  String get phoneNumberJid => 'Telefonní číslo / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Žádná povolená čísla nejsou nakonfigurována';

  @override
  String get devicesAppearAfterPairing =>
      'Zařízení se zobrazí zde po schválení žádostí o párování';

  @override
  String get addPhoneNumbersHint =>
      'Přidejte telefonní čísla pro povolení používat bota';

  @override
  String get allowedNumber => 'Povolené číslo';

  @override
  String get howToConnect => 'Jak se připojit';

  @override
  String get whatsAppConnectInstructions =>
      '1. Klepněte na \"Připojit WhatsApp\" výše\n2. Zobrazí se QR kód — naskenujte jej pomocí WhatsApp\n   (Nastavení → Propojená Zařízení → Propojit Zařízení)\n3. Po připojení jsou příchozí zprávy automaticky\n   směrovány k vašemu aktivnímu AI agentovi';

  @override
  String get whatsAppPairingDesc =>
      'Noví odesílatelé dostanou párovací kód. Vy je schvalujete.';

  @override
  String get whatsAppAllowlistDesc =>
      'Pouze konkrétní telefonní čísla mohou psát botovi.';

  @override
  String get whatsAppOpenDesc => 'Kdokoli, kdo vám napíše, může používat bota.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot nebude odpovídat na žádné příchozí zprávy.';

  @override
  String get sessionExpiredRelink =>
      'Relace vypršela. Klepněte na \"Znovu připojit\" níže pro naskenování nového QR kódu.';

  @override
  String get connectWhatsAppBelow =>
      'Klepněte na \"Připojit WhatsApp\" níže pro propojení účtu.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp přijal QR kód. Dokončování propojení...';

  @override
  String get waitingForWhatsApp => 'Čekání na dokončení propojení WhatsApp...';

  @override
  String get focusedLabel => 'Zaměřená';

  @override
  String get balancedLabel => 'Vyvážená';

  @override
  String get creativeLabel => 'Kreativní';

  @override
  String get preciseLabel => 'Přesná';

  @override
  String get expressiveLabel => 'Výrazná';

  @override
  String get browseLabel => 'Procházet';

  @override
  String get apiTokenLabel => 'API token';

  @override
  String get connectToClawHub => 'Připojit ke ClawHub';

  @override
  String get clawHubLoginHint =>
      'Přihlaste se do ClawHub pro přístup k prémiové dovednosti a instalaci balíčků';

  @override
  String get howToGetApiToken => 'Jak získat váš API token:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Navštivte clawhub.ai a přihlaste se pomocí GitHub\n2. Spusťte \"clawhub login\" v terminálu\n3. Zkopírujte token a vložte jej sem';

  @override
  String connectionFailed(String error) {
    return 'Připojení selhalo: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count spuštění';
  }

  @override
  String nextRunLabel(String time) {
    return 'Další spuštění: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Poslední chyba: $error';
  }

  @override
  String get cronJobHintText => 'Instrukce pro agenta při spuštění této úlohy…';

  @override
  String get androidPermissions => 'Oprávnění Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw může ovládat vaši obrazovku — klepat na tlačítka, vyplňovat formuláře, posouvat a automatizovat opakující se úlohy v jakékoli aplikaci.';

  @override
  String get twoPermissionsNeeded =>
      'Pro plný zážitek jsou potřeba dvě oprávnění. Můžete to přeskočit a povolit je později v Nastavení.';

  @override
  String get accessibilityService => 'Služba Přístupnosti';

  @override
  String get accessibilityServiceDesc =>
      'Umožňuje klepání, přejetí prstem, psaní a čtení obsahu obrazovky';

  @override
  String get displayOverOtherApps => 'Zobrazení Nad Jinými Aplikacemi';

  @override
  String get displayOverOtherAppsDesc =>
      'Zobrazuje plovoucí stavový čip, abyste viděli, co agent dělá';

  @override
  String get changeDefaultModel => 'Změnit výchozí model';

  @override
  String setModelAsDefault(String name) {
    return 'Nastavit $name jako výchozí model.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'agentů',
      few: 'agenty',
      one: 'agenta',
    );
    return 'Také aktualizovat $count $_temp0';
  }

  @override
  String get startNewSessions => 'Zahájit nové relace';

  @override
  String get currentConversationsArchived =>
      'Aktuální konverzace budou archivovány';

  @override
  String get applyAction => 'Použít';

  @override
  String applyModelQuestion(String name) {
    return 'Použít $name?';
  }

  @override
  String get setAsDefaultModel => 'Nastavit jako výchozí model';

  @override
  String get usedByAgentsWithout => 'Používáno agenty bez konkrétního modelu';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'agentů',
      few: 'agenty',
      one: 'agenta',
    );
    return 'Použít na $count $_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Poskytovatel je již autentizován — API klíč není potřeba.';

  @override
  String get selectFromList => 'Vybrat ze seznamu';

  @override
  String get enterCustomModelId => 'Zadat vlastní ID modelu';

  @override
  String get removeSkillTitle => 'Odstranit dovednost?';

  @override
  String get browseClawHubToDiscover =>
      'Procházejte ClawHub pro objevování a instalaci dovedností';

  @override
  String get addDeviceTooltip => 'Přidat zařízení';

  @override
  String get addNumberTooltip => 'Přidat číslo';

  @override
  String get searchSkillsHint => 'Hledat dovednosti...';

  @override
  String get loginToClawHub => 'Přihlásit se do ClawHub';

  @override
  String get accountTooltip => 'Účet';

  @override
  String get editAction => 'Upravit';

  @override
  String get setAsDefaultAction => 'Nastavit jako výchozí';

  @override
  String get chooseProviderTitle => 'Vyberte poskytovatele';

  @override
  String get apiKeyTitle => 'API Klíč';

  @override
  String get slackConfigSaved =>
      'Slack uložen — restartujte bránu pro připojení';

  @override
  String get signalConfigSaved =>
      'Signal uložen — restartujte bránu pro připojení';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Přidat zařízení';

  @override
  String get skipAction => 'Přeskočit';

  @override
  String get mcpServers => 'MCP servery';

  @override
  String get noMcpServersConfigured =>
      'Žádné MCP servery nejsou nakonfigurovány';

  @override
  String get mcpServersEmptyHint =>
      'Přidejte MCP servery, abyste svému agentovi umožnili přístup k nástrojům z GitHubu, Notionu, Slacku, databází a dalších.';

  @override
  String get addMcpServer => 'Přidat MCP server';

  @override
  String get editMcpServer => 'Upravit MCP server';

  @override
  String get removeMcpServer => 'Odstranit MCP server';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Odstranit \"$name\"? Jeho nástroje již nebudou dostupné.';
  }

  @override
  String get mcpTransport => 'Přenos';

  @override
  String get testConnection => 'Otestovat připojení';

  @override
  String get mcpServerNameLabel => 'Název serveru';

  @override
  String get mcpServerNameHint => 'např. GitHub, Notion, Moje DB';

  @override
  String get mcpServerUrlLabel => 'URL serveru';

  @override
  String get mcpBearerTokenLabel => 'Bearer token (volitelné)';

  @override
  String get mcpBearerTokenHint =>
      'Nechte prázdné, pokud autentizace není vyžadována';

  @override
  String get mcpCommandLabel => 'Příkaz';

  @override
  String get mcpArgumentsLabel => 'Argumenty (oddělené mezerami)';

  @override
  String get mcpEnvVarsLabel =>
      'Proměnné prostředí (KLÍČ=HODNOTA, jeden na řádek)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio není na iOS k dispozici. Použijte HTTP nebo SSE.';

  @override
  String get connectedStatus => 'Připojeno';

  @override
  String get mcpConnecting => 'Připojování...';

  @override
  String get mcpConnectionError => 'Chyba připojení';

  @override
  String get mcpDisconnected => 'Odpojeno';

  @override
  String mcpToolsCount(int count) {
    return '$count nástrojů';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — nalezeno $count nástrojů';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Připojeno (0 nástrojů)';

  @override
  String get mcpTestFailed =>
      'Připojení selhalo. Zkontrolujte URL/token serveru.';

  @override
  String get mcpAddServer => 'Přidat server';

  @override
  String get mcpSaveChanges => 'Uložit změny';

  @override
  String get urlIsRequired => 'URL je povinná';

  @override
  String get enterValidUrl => 'Zadejte platnou URL';

  @override
  String get commandIsRequired => 'Příkaz je povinný';

  @override
  String skillRemoved(String name) {
    return 'Dovednost \"$name\" odebrána';
  }

  @override
  String get editFileContentHint => 'Upravit obsah souboru...';

  @override
  String get whatsAppPairSubtitle =>
      'Propojte svůj osobní účet WhatsApp pomocí QR kódu';

  @override
  String get whatsAppPairingOptional =>
      'Párování je volitelné. Můžete dokončit onboarding nyní a odkaz přidat později.';

  @override
  String get whatsAppEnableToLink =>
      'Zapněte WhatsApp a začněte propojovat toto zařízení.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp je propojen. FlutterClaw bude moci odpovídat po dokončení onboardingu.';

  @override
  String get cancelLink => 'Zrušit propojení';
}
