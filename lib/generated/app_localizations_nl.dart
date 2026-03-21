// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Kanalen';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Instellingen';

  @override
  String get getStarted => 'Aan de slag';

  @override
  String get yourPersonalAssistant => 'Uw persoonlijke AI-assistent';

  @override
  String get multiChannelChat => 'Multikanaalchat';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat en meer';

  @override
  String get powerfulAIModels => 'Krachtige AI-modellen';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok en gratis modellen';

  @override
  String get localGateway => 'Lokale gateway';

  @override
  String get localGatewayDesc =>
      'Draait op uw apparaat, uw gegevens blijven van u';

  @override
  String get chooseProvider => 'Kies een Provider';

  @override
  String get selectProviderDesc =>
      'Selecteer hoe u verbinding wilt maken met AI-modellen.';

  @override
  String get startForFree => 'Start Gratis';

  @override
  String get freeProvidersDesc =>
      'Deze providers bieden gratis modellen om zonder kosten te beginnen.';

  @override
  String get free => 'GRATIS';

  @override
  String get otherProviders => 'Andere Providers';

  @override
  String connectToProvider(String provider) {
    return 'Verbind met $provider';
  }

  @override
  String get enterApiKeyDesc =>
      'Voer uw API-sleutel in en selecteer een model.';

  @override
  String get dontHaveApiKey => 'Heeft u geen API-sleutel?';

  @override
  String get createAccountCopyKey =>
      'Maak een account aan en kopieer uw sleutel.';

  @override
  String get signUp => 'Aanmelden';

  @override
  String get apiKey => 'API-sleutel';

  @override
  String get pasteFromClipboard => 'Plakken vanaf klembord';

  @override
  String get apiBaseUrl => 'API Basis-URL';

  @override
  String get selectModel => 'Selecteer Model';

  @override
  String get modelId => 'Model-ID';

  @override
  String get validateKey => 'Valideer Sleutel';

  @override
  String get validating => 'Valideren...';

  @override
  String get invalidApiKey => 'Ongeldige API-sleutel';

  @override
  String get gatewayConfiguration => 'Gateway Configuratie';

  @override
  String get gatewayConfigDesc =>
      'De gateway is het lokale controlevlak voor uw assistent.';

  @override
  String get defaultSettingsNote =>
      'De standaardinstellingen werken voor de meeste gebruikers. Wijzig alleen als u weet wat u nodig heeft.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Poort';

  @override
  String get autoStartGateway => 'Gateway automatisch starten';

  @override
  String get autoStartGatewayDesc =>
      'Start de gateway automatisch wanneer de app wordt gestart.';

  @override
  String get channelsPageTitle => 'Kanalen';

  @override
  String get channelsPageDesc =>
      'Verbind optioneel berichtkanalen. U kunt deze altijd later configureren in Instellingen.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Verbind een Telegram-bot.';

  @override
  String get openBotFather => 'Open BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Verbind een Discord-bot.';

  @override
  String get developerPortal => 'Ontwikkelaarsportaal';

  @override
  String get botToken => 'Bot-token';

  @override
  String telegramBotToken(String platform) {
    return '$platform Bot-token';
  }

  @override
  String get readyToGo => 'Klaar om te Beginnen';

  @override
  String get reviewConfiguration =>
      'Controleer uw configuratie en start FlutterClaw.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return 'via $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Alleen WebChat (u kunt later meer toevoegen)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Starten...';

  @override
  String get startFlutterClaw => 'Start FlutterClaw';

  @override
  String get newSession => 'Nieuwe sessie';

  @override
  String get photoLibrary => 'Fotobibliotheek';

  @override
  String get camera => 'Camera';

  @override
  String get whatDoYouSeeInImage => 'Wat ziet u in deze afbeelding?';

  @override
  String get imagePickerNotAvailable =>
      'Afbeeldingskiezer niet beschikbaar op Simulator. Gebruik een echt apparaat.';

  @override
  String get couldNotOpenImagePicker => 'Kon afbeeldingskiezer niet openen.';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get attachImage => 'Afbeelding bijvoegen';

  @override
  String get messageFlutterClaw => 'Bericht aan FlutterClaw...';

  @override
  String get channelsAndGateway => 'Kanalen en Gateway';

  @override
  String get stop => 'Stop';

  @override
  String get start => 'Start';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Ingebouwde chatinterface';

  @override
  String get notConfigured => 'Niet geconfigureerd';

  @override
  String get connected => 'Verbonden';

  @override
  String get configuredStarting => 'Geconfigureerd (starten...)';

  @override
  String get telegramConfiguration => 'Telegram Configuratie';

  @override
  String get fromBotFather => 'Van @BotFather';

  @override
  String get allowedUserIds => 'Toegestane Gebruikers-ID\'s (kommagescheiden)';

  @override
  String get leaveEmptyToAllowAll => 'Laat leeg om iedereen toe te staan';

  @override
  String get cancel => 'Annuleren';

  @override
  String get saveAndConnect => 'Opslaan en Verbinden';

  @override
  String get discordConfiguration => 'Discord Configuratie';

  @override
  String get pendingPairingRequests => 'Openstaande Koppelingaanvragen';

  @override
  String get approve => 'Goedkeuren';

  @override
  String get reject => 'Afwijzen';

  @override
  String get expired => 'Verlopen';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m over';
  }

  @override
  String get workspaceFiles => 'Werkruimtebestanden';

  @override
  String get personalAIAssistant => 'Persoonlijke AI-assistent';

  @override
  String sessionsCount(int count) {
    return 'Sessies ($count)';
  }

  @override
  String get noActiveSessions => 'Geen actieve sessies';

  @override
  String get startConversationToCreate =>
      'Start een gesprek om er een te maken';

  @override
  String get startConversationToSee =>
      'Start een gesprek om sessies hier te zien';

  @override
  String get reset => 'Resetten';

  @override
  String get cronJobs => 'Geplande Taken';

  @override
  String get noCronJobs => 'Geen geplande taken';

  @override
  String get addScheduledTasks => 'Voeg geplande taken toe voor uw agent';

  @override
  String get runNow => 'Nu Uitvoeren';

  @override
  String get enable => 'Inschakelen';

  @override
  String get disable => 'Uitschakelen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get skills => 'Vaardigheden';

  @override
  String get browseClawHub => 'Blader door ClawHub';

  @override
  String get noSkillsInstalled => 'Geen vaardigheden geïnstalleerd';

  @override
  String get browseClawHubToAdd =>
      'Blader door ClawHub om vaardigheden toe te voegen';

  @override
  String removeSkillConfirm(String name) {
    return '\"$name\" verwijderen uit uw vaardigheden?';
  }

  @override
  String get clawHubSkills => 'ClawHub Vaardigheden';

  @override
  String get searchSkills => 'Zoek vaardigheden...';

  @override
  String get noSkillsFound =>
      'Geen vaardigheden gevonden. Probeer een andere zoekopdracht.';

  @override
  String installedSkill(String name) {
    return '$name geïnstalleerd';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Installeren van $name mislukt';
  }

  @override
  String get addCronJob => 'Geplande Taak Toevoegen';

  @override
  String get jobName => 'Taaknaam';

  @override
  String get dailySummaryExample => 'bijv. Dagelijkse Samenvatting';

  @override
  String get taskPrompt => 'Taakprompt';

  @override
  String get whatShouldAgentDo => 'Wat moet de agent doen?';

  @override
  String get interval => 'Interval';

  @override
  String get every5Minutes => 'Elke 5 minuten';

  @override
  String get every15Minutes => 'Elke 15 minuten';

  @override
  String get every30Minutes => 'Elke 30 minuten';

  @override
  String get everyHour => 'Elk uur';

  @override
  String get every6Hours => 'Elke 6 uur';

  @override
  String get every12Hours => 'Elke 12 uur';

  @override
  String get every24Hours => 'Elke 24 uur';

  @override
  String get add => 'Toevoegen';

  @override
  String get save => 'Opslaan';

  @override
  String get sessions => 'Sessies';

  @override
  String messagesCount(int count) {
    return '$count berichten';
  }

  @override
  String tokensCount(int count) {
    return '$count tokens';
  }

  @override
  String get compact => 'Comprimeren';

  @override
  String get models => 'Modellen';

  @override
  String get noModelsConfigured => 'Geen modellen geconfigureerd';

  @override
  String get addModelToStartChatting =>
      'Voeg een model toe om te beginnen met chatten';

  @override
  String get addModel => 'Model Toevoegen';

  @override
  String get default_ => 'STANDAARD';

  @override
  String get autoStart => 'Automatisch starten';

  @override
  String get startGatewayWhenLaunches =>
      'Start gateway wanneer app wordt gestart';

  @override
  String get heartbeat => 'Hartslag';

  @override
  String get enabled => 'Ingeschakeld';

  @override
  String get periodicAgentTasks => 'Periodieke agenttaken van HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'Over';

  @override
  String get personalAIAssistantForIOS =>
      'Persoonlijke AI-assistent voor iOS en Android';

  @override
  String get version => 'Versie';

  @override
  String get basedOnOpenClaw => 'Gebaseerd op OpenClaw';

  @override
  String get removeModel => 'Model verwijderen?';

  @override
  String removeModelConfirm(String name) {
    return '\"$name\" verwijderen uit uw modellen?';
  }

  @override
  String get remove => 'Verwijderen';

  @override
  String get setAsDefault => 'Instellen als Standaard';

  @override
  String get paste => 'Plakken';

  @override
  String get chooseProviderStep => '1. Kies Provider';

  @override
  String get selectModelStep => '2. Selecteer Model';

  @override
  String get apiKeyStep => '3. API-sleutel';

  @override
  String getApiKeyAt(String provider) {
    return 'Verkrijg API-sleutel bij $provider';
  }

  @override
  String get justNow => 'zojuist';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m geleden';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}u geleden';
  }

  @override
  String daysAgo(int days) {
    return '${days}d geleden';
  }

  @override
  String get microphonePermissionDenied => 'Microfoontoestemming geweigerd';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Live transcriptie niet beschikbaar: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Kan opname niet starten: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Gebruik van apparaat-transcriptie';

  @override
  String get transcribingWithWhisper => 'Transcriberen met Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API mislukt: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Geen transcriptie vastgelegd';

  @override
  String failedToStopRecording(String error) {
    return 'Kan opname niet stoppen: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Kan niet $action: $error';
  }

  @override
  String get pause => 'Pauzeren';

  @override
  String get resume => 'Hervatten';

  @override
  String get send => 'Verzenden';

  @override
  String get liveActivityActive => 'Live Activity actief';

  @override
  String get restartGateway => 'Gateway opnieuw starten';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Uptime: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Achtergrondondersteuning actief - gateway kan blijven reageren';

  @override
  String get webChatBuiltIn => 'Ingebouwde chat-interface';

  @override
  String get configure => 'Configureren';

  @override
  String get disconnect => 'Verbinding verbreken';

  @override
  String get agents => 'Agenten';

  @override
  String get agentFiles => 'Agentbestanden';

  @override
  String get createAgent => 'Agent Aanmaken';

  @override
  String get editAgent => 'Agent Bewerken';

  @override
  String get noAgentsYet => 'Nog geen agenten';

  @override
  String get createYourFirstAgent => 'Maak uw eerste agent!';

  @override
  String get active => 'Actief';

  @override
  String get agentName => 'Agentnaam';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Emoji Selecteren';

  @override
  String get vibe => 'Sfeer';

  @override
  String get vibeHint => 'bijv. vriendelijk, formeel, sarcastisch';

  @override
  String get modelConfiguration => 'Modelconfiguratie';

  @override
  String get advancedSettings => 'Geavanceerde Instellingen';

  @override
  String get agentCreated => 'Agent aangemaakt';

  @override
  String get agentUpdated => 'Agent bijgewerkt';

  @override
  String get agentDeleted => 'Agent verwijderd';

  @override
  String switchedToAgent(String name) {
    return 'Overgeschakeld naar $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$name verwijderen? Alle werkruimtegegevens worden verwijderd.';
  }

  @override
  String get agentDetails => 'Agentdetails';

  @override
  String get createdAt => 'Aangemaakt';

  @override
  String get lastUsed => 'Laatst Gebruikt';

  @override
  String get basicInformation => 'Basisinformatie';

  @override
  String get switchToAgent => 'Agent Wisselen';

  @override
  String get providers => 'Providers';

  @override
  String get addProvider => 'Provider toevoegen';

  @override
  String get noProvidersConfigured => 'Geen providers geconfigureerd.';

  @override
  String get editCredentials => 'Inloggegevens bewerken';

  @override
  String get defaultModelHint =>
      'Het standaardmodel wordt gebruikt door agenten die geen eigen model opgeven.';

  @override
  String get holdToSetAsDefault =>
      'Houd ingedrukt om als standaard in te stellen';

  @override
  String get integrations => 'Integraties';

  @override
  String get shortcutsIntegrations => 'Shortcuts Integraties';

  @override
  String get shortcutsIntegrationsDesc =>
      'Installeer iOS Shortcuts om acties van externe apps uit te voeren';

  @override
  String get dangerZone => 'Gevarenzone';

  @override
  String get resetOnboarding => 'Onboarding resetten en opnieuw uitvoeren';

  @override
  String get resetOnboardingDesc =>
      'Verwijdert alle configuratie en keert terug naar de installatiewizard.';

  @override
  String get resetAllConfiguration => 'Alle configuratie resetten?';

  @override
  String get resetAllConfigurationDesc =>
      'Dit verwijdert uw API-sleutels, modellen en alle instellingen. De app keert terug naar de installatiewizard.\n\nUw gespreksgeschiedenis wordt niet verwijderd.';

  @override
  String get removeProvider => 'Provider verwijderen';

  @override
  String removeProviderConfirm(String provider) {
    return 'Inloggegevens voor $provider verwijderen?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name ingesteld als standaardmodel';
  }

  @override
  String get photoImage => 'Foto / Afbeelding';

  @override
  String get documentPdfTxt => 'Document (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Kon document niet openen: $error';
  }

  @override
  String get retry => 'Opnieuw Proberen';

  @override
  String get gatewayStopped => 'Gateway gestopt';

  @override
  String get gatewayStarted => 'Gateway succesvol gestart!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway mislukt: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Uitzondering: $error';
  }

  @override
  String get pairingRequestApproved => 'Koppelingsverzoek goedgekeurd';

  @override
  String get pairingRequestRejected => 'Koppelingsverzoek afgewezen';

  @override
  String get addDevice => 'Apparaat Toevoegen';

  @override
  String get telegramConfigSaved => 'Telegram configuratie opgeslagen';

  @override
  String get discordConfigSaved => 'Discord configuratie opgeslagen';

  @override
  String get securityMethod => 'Beveiligingsmethode';

  @override
  String get pairingRecommended => 'Koppeling (Aanbevolen)';

  @override
  String get pairingDescription =>
      'Nieuwe gebruikers krijgen een koppelingscode. U keurt ze goed of wijst ze af.';

  @override
  String get allowlistTitle => 'Toelatingslijst';

  @override
  String get allowlistDescription =>
      'Alleen specifieke gebruikers-ID\'s hebben toegang tot de bot.';

  @override
  String get openAccess => 'Open Toegang';

  @override
  String get openAccessDescription =>
      'Iedereen kan de bot direct gebruiken (niet aanbevolen).';

  @override
  String get disabledAccess => 'Uitgeschakeld';

  @override
  String get disabledAccessDescription =>
      'Geen DM\'s toegestaan. Bot reageert niet op berichten.';

  @override
  String get approvedDevices => 'Goedgekeurde Apparaten';

  @override
  String get noApprovedDevicesYet => 'Nog geen goedgekeurde apparaten';

  @override
  String get devicesAppearAfterApproval =>
      'Apparaten verschijnen hier nadat u hun koppelingsverzoeken hebt goedgekeurd';

  @override
  String get noAllowedUsersConfigured =>
      'Geen toegestane gebruikers geconfigureerd';

  @override
  String get addUserIdsHint =>
      'Voeg gebruikers-ID\'s toe om hen toegang te geven tot de bot';

  @override
  String get removeDevice => 'Apparaat verwijderen?';

  @override
  String removeAccessFor(String name) {
    return 'Toegang verwijderen voor $name?';
  }

  @override
  String get saving => 'Opslaan...';

  @override
  String get channelsLabel => 'Kanalen';

  @override
  String get clawHubAccount => 'ClawHub Account';

  @override
  String get loggedInToClawHub => 'U bent momenteel ingelogd bij ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Uitgelogd bij ClawHub';

  @override
  String get login => 'Inloggen';

  @override
  String get logout => 'Uitloggen';

  @override
  String get connect => 'Verbinden';

  @override
  String get pasteClawHubToken => 'Plak uw ClawHub API-token';

  @override
  String get pleaseEnterApiToken => 'Voer een API-token in';

  @override
  String get successfullyConnected => 'Succesvol verbonden met ClawHub';

  @override
  String get browseSkillsButton => 'Vaardigheden Bekijken';

  @override
  String get installSkill => 'Vaardigheid Installeren';

  @override
  String get incompatibleSkill => 'Incompatibele Vaardigheid';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Deze vaardigheid kan niet draaien op mobiel (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Compatibiliteitswaarschuwing';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Deze vaardigheid is ontworpen voor desktop en werkt mogelijk niet op mobiel.\n\n$reason\n\nWilt u een aangepaste versie installeren die is geoptimaliseerd voor mobiel?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Origineel Installeren';

  @override
  String get installAdapted => 'Aangepast Installeren';

  @override
  String get resetSession => 'Sessie Resetten';

  @override
  String resetSessionConfirm(String key) {
    return 'Sessie \"$key\" resetten? Alle berichten worden gewist.';
  }

  @override
  String get sessionReset => 'Sessie gereset';

  @override
  String get activeSessions => 'Actieve Sessies';

  @override
  String get scheduledTasks => 'Geplande Taken';

  @override
  String get defaultBadge => 'Standaard';

  @override
  String errorGeneric(String error) {
    return 'Fout: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName opgeslagen';
  }

  @override
  String errorSavingFile(String error) {
    return 'Fout bij opslaan bestand: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Kan de laatste agent niet verwijderen';

  @override
  String get close => 'Sluiten';

  @override
  String get nameIsRequired => 'Naam is verplicht';

  @override
  String get pleaseSelectModel => 'Selecteer een model';

  @override
  String temperatureLabel(String value) {
    return 'Temperatuur: $value';
  }

  @override
  String get maxTokens => 'Max Tokens';

  @override
  String get maxTokensRequired => 'Max tokens is verplicht';

  @override
  String get mustBePositiveNumber => 'Moet een positief getal zijn';

  @override
  String get maxToolIterations => 'Max Tool Iteraties';

  @override
  String get maxIterationsRequired => 'Max iteraties is verplicht';

  @override
  String get restrictToWorkspace => 'Beperken tot Werkruimte';

  @override
  String get restrictToWorkspaceDesc =>
      'Beperk bestandsbewerkingen tot de agentwerkruimte';

  @override
  String get noModelsConfiguredLong =>
      'Voeg ten minste één model toe in Instellingen voordat u een agent aanmaakt.';

  @override
  String get selectProviderFirst => 'Selecteer eerst een provider';

  @override
  String get skip => 'Overslaan';

  @override
  String get continueButton => 'Doorgaan';

  @override
  String get uiAutomation => 'UI Automatisering';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw kan uw scherm bedienen namens u — knoppen indrukken, formulieren invullen, scrollen en herhalende taken automatiseren in elke app.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Dit vereist het inschakelen van de Toegankelijkheidsservice in Android Instellingen. U kunt dit overslaan en later inschakelen.';

  @override
  String get openAccessibilitySettings =>
      'Toegankelijkheidsinstellingen Openen';

  @override
  String get skipForNow => 'Nu overslaan';

  @override
  String get checkingPermission => 'Toestemming controleren…';

  @override
  String get accessibilityEnabled => 'Toegankelijkheidsservice is ingeschakeld';

  @override
  String get accessibilityNotEnabled =>
      'Toegankelijkheidsservice is niet ingeschakeld';

  @override
  String get exploreIntegrations => 'Integraties Verkennen';

  @override
  String get requestTimedOut => 'Verzoek verlopen';

  @override
  String get myShortcuts => 'Mijn Snelkoppelingen';

  @override
  String get addShortcut => 'Snelkoppeling Toevoegen';

  @override
  String get noShortcutsYet => 'Nog geen snelkoppelingen';

  @override
  String get shortcutsInstructions =>
      'Maak een snelkoppeling in de iOS Shortcuts-app, voeg de callback-actie toe aan het einde en registreer deze hier zodat de AI deze kan uitvoeren.';

  @override
  String get shortcutName => 'Naam snelkoppeling';

  @override
  String get shortcutNameHint => 'Exacte naam uit de Shortcuts-app';

  @override
  String get descriptionOptional => 'Beschrijving (optioneel)';

  @override
  String get whatDoesShortcutDo => 'Wat doet deze snelkoppeling?';

  @override
  String get callbackSetup => 'Callback-instelling';

  @override
  String get callbackInstructions =>
      'Elke snelkoppeling moet eindigen met:\n① Get Value for Key → \"callbackUrl\" (van Shortcut Input als woordenboek geparsed)\n② Open URLs ← uitvoer van ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Hartslag';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagent';

  @override
  String get channelSystem => 'Systeem';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s geleden';
  }

  @override
  String get messagesAbbrev => 'ber.';

  @override
  String get modelAlreadyAdded => 'This model is already in your list';
}
