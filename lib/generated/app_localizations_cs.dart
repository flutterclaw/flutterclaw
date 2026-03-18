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
}
