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
  String get multiChannelChatDesc => 'Telegram, Discord, Chat en meer';

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
  String get webChatOnly => 'Alleen chat (u kunt later meer toevoegen)';

  @override
  String get webChat => 'Chat';

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
  String get voiceCallModelSection => 'Spraakoproep (Live)';

  @override
  String get voiceCallModelDescription =>
      'Wordt alleen gebruikt wanneer u op de belknop tikt. Chat, agenten en achtergrondtaken gebruiken uw normale model.';

  @override
  String get voiceCallModelLabel => 'Live-model';

  @override
  String get voiceCallModelAutomatic => 'Automatisch';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Bootstrap in spraakoproep';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'Start in een nieuwe lege chat met BOOTSTRAP.md een spraakoproep in plaats van een stille tekst-bootstrap (wanneer Live beschikbaar is).';

  @override
  String get liveVoiceNameLabel => 'Stem';

  @override
  String get firstHatchModeChoiceTitle => 'Hoe wil je beginnen?';

  @override
  String get firstHatchModeChoiceBody =>
      'Je kunt met je assistent chatten via tekst of een gesprek starten met je stem, als een kort telefoongesprek. Kies wat het makkelijkst voor je voelt.';

  @override
  String get firstHatchModeChoiceChatButton => 'Typen in de chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Praten met stem';

  @override
  String get liveVoiceBargeInHint =>
      'Spreek nadat de assistent klaar is (echo onderbrak hen eerder midden in hun zin).';

  @override
  String get liveVoiceFallbackTitle => 'Live';

  @override
  String get liveVoiceEndConversationTooltip => 'Gesprek beëindigen';

  @override
  String get liveVoiceStatusConnecting => 'Verbinden…';

  @override
  String get liveVoiceStatusRunning => 'Bezig…';

  @override
  String get liveVoiceStatusSpeaking => 'Spreekt…';

  @override
  String get liveVoiceStatusListening => 'Luistert…';

  @override
  String get liveVoiceBadge => 'LIVE';

  @override
  String get cannotAddLiveModelAsChat =>
      'Dit model is alleen voor spraakoproepen. Kies een chatmodel uit de lijst.';

  @override
  String get authBearerTokenLabel => 'Bearer-token';

  @override
  String get authAccessKeysLabel => 'Toegangssleutels';

  @override
  String authModelsFoundCount(int count) {
    return '$count modellen gevonden';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count meer — voer ID handmatig in';
  }

  @override
  String get scanQrBarcodeTitle => 'QR / streepjescode scannen';

  @override
  String get oauthSignInTitle => 'Inloggen';

  @override
  String get browserOverlayDone => 'Gereed';

  @override
  String appInitializationError(String error) {
    return 'Initialisatiefout: $error';
  }

  @override
  String get credentialsScreenTitle => 'Inloggegevens';

  @override
  String get credentialsIntroBody =>
      'Voeg meerdere API-sleutels per provider toe. FlutterClaw wisselt automatisch en koelt sleutels af bij ratelimits.';

  @override
  String get credentialsNoProvidersBody =>
      'Geen providers geconfigureerd.\nGa naar Instellingen → Providers en modellen om er een toe te voegen.';

  @override
  String get credentialsAddKeyTooltip => 'Sleutel toevoegen';

  @override
  String get credentialsNoExtraKeysMessage =>
      'Geen extra sleutels — de sleutel uit Providers en modellen wordt gebruikt.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return '$provider-sleutel toevoegen';
  }

  @override
  String get credentialsKeyLabelHint => 'Label (bijv. \"Werksleutel\")';

  @override
  String get credentialsApiKeyFieldLabel => 'API-sleutel';

  @override
  String get securitySettingsTitle => 'Beveiliging';

  @override
  String get securitySettingsIntro =>
      'Beheer beveiligingscontroles tegen gevaarlijke acties. Ze gelden voor de huidige sessie.';

  @override
  String get securitySectionToolExecution => 'TOOL-UITVOERING';

  @override
  String get securityPatternDetectionTitle => 'Detectie van onveilige patronen';

  @override
  String get securityPatternDetectionSubtitle =>
      'Blokkeert gevaarlijke patronen: shell-injectie, path traversal, eval/exec, XSS, deserialisatie.';

  @override
  String get securityUnsafeModeBanner =>
      'Beveiligingscontroles uit. Toolaanroepen worden zonder validatie uitgevoerd. Schakel ze daarna weer in.';

  @override
  String get securitySectionHowItWorks => 'HOE HET WERKT';

  @override
  String get securityHowItWorksBlocked =>
      'Als een aanroep overeenkomt met een gevaarlijk patroon, wordt deze geblokkeerd en krijgt de agent de reden.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'Gebruik /unsafe in de chat voor een eenmalige uitzondering voor een geblokkeerde aanroep; daarna zijn controles weer actief.';

  @override
  String get securityHowItWorksToggleSession =>
      'Schakel hier \"Detectie van onveilige patronen\" uit om controles voor de hele sessie uit te zetten.';

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
  String get openAccess => 'Open';

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
  String get modelAlreadyAdded => 'Dit model staat al in uw lijst';

  @override
  String get bothTokensRequired => 'Beide tokens zijn verplicht';

  @override
  String get slackSavedRestart =>
      'Slack opgeslagen — herstart de gateway om te verbinden';

  @override
  String get slackConfiguration => 'Slack Configuratie';

  @override
  String get setupTitle => 'Instelling';

  @override
  String get slackSetupInstructions =>
      '1. Maak een Slack-app aan op api.slack.com/apps\n2. Schakel Socket Mode in → genereer app-level token (xapp-…)\n   met scope: connections:write\n3. Voeg bot-token scopes toe: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Installeer de app in de workspace → kopieer bot-token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot-token (xoxb-…)';

  @override
  String get appLevelToken => 'App-level token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'API-URL en telefoonnummer zijn verplicht';

  @override
  String get signalSavedRestart =>
      'Signal opgeslagen — herstart gateway om te verbinden';

  @override
  String get signalConfiguration => 'Signal Configuratie';

  @override
  String get requirementsTitle => 'Vereisten';

  @override
  String get signalRequirements =>
      'Vereist signal-cli-rest-api draaiend op een server:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegistreer/koppel uw Signal-nummer via de REST API, voer dan de URL en uw telefoonnummer hieronder in.';

  @override
  String get signalApiUrl => 'signal-cli-rest-api-URL';

  @override
  String get signalPhoneNumber => 'Uw Signal-telefoonnummer';

  @override
  String get userIdLabel => 'Gebruikers-ID';

  @override
  String get enterDiscordUserId => 'Voer Discord gebruikers-ID in';

  @override
  String get enterTelegramUserId => 'Voer Telegram gebruikers-ID in';

  @override
  String get fromDiscordDevPortal => 'Van Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'Toegestane Gebruikers-ID\'s';

  @override
  String get approvedDevice => 'Goedgekeurd apparaat';

  @override
  String get allowedUser => 'Toegestane gebruiker';

  @override
  String get howToGetBotToken => 'Hoe u uw bot-token krijgt';

  @override
  String get discordTokenInstructions =>
      '1. Ga naar Discord Developer Portal\n2. Maak een nieuwe applicatie en bot aan\n3. Kopieer het token en plak het hierboven\n4. Schakel Message Content Intent in';

  @override
  String get telegramTokenInstructions =>
      '1. Open Telegram en zoek naar @BotFather\n2. Stuur /newbot en volg de instructies\n3. Kopieer het token en plak het hierboven';

  @override
  String get fromBotFatherHint => 'Verkrijg van @BotFather';

  @override
  String get accessTokenLabel => 'Toegangstoken';

  @override
  String get notSetOpenAccess =>
      'Niet ingesteld — open toegang (alleen loopback)';

  @override
  String get gatewayAccessToken => 'Gateway toegangstoken';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Laat leeg om authenticatie uit te schakelen';

  @override
  String get toolPolicies => 'Tool Beleid';

  @override
  String get toolPoliciesDesc =>
      'Bepaal waar de agent toegang toe heeft. Uitgeschakelde tools worden verborgen voor de AI en geblokkeerd tijdens runtime.';

  @override
  String get privacySensors => 'Privacy & Sensoren';

  @override
  String get networkCategory => 'Netwerk';

  @override
  String get systemCategory => 'Systeem';

  @override
  String get toolTakePhotos => 'Foto\'s Maken';

  @override
  String get toolTakePhotosDesc =>
      'Sta de agent toe foto\'s te maken met de camera';

  @override
  String get toolRecordVideo => 'Video Opnemen';

  @override
  String get toolRecordVideoDesc => 'Sta de agent toe video op te nemen';

  @override
  String get toolLocation => 'Locatie';

  @override
  String get toolLocationDesc =>
      'Sta de agent toe uw huidige GPS-locatie te lezen';

  @override
  String get toolHealthData => 'Gezondheidsgegevens';

  @override
  String get toolHealthDataDesc =>
      'Sta de agent toe gezondheids-/fitnessgegevens te lezen';

  @override
  String get toolContacts => 'Contacten';

  @override
  String get toolContactsDesc => 'Sta de agent toe uw contacten te doorzoeken';

  @override
  String get toolScreenshots => 'Screenshots';

  @override
  String get toolScreenshotsDesc =>
      'Sta de agent toe screenshots van het scherm te maken';

  @override
  String get toolWebFetch => 'Web Ophalen';

  @override
  String get toolWebFetchDesc =>
      'Sta de agent toe inhoud van URL\'s op te halen';

  @override
  String get toolWebSearch => 'Webzoeken';

  @override
  String get toolWebSearchDesc => 'Sta de agent toe op het web te zoeken';

  @override
  String get toolHttpRequests => 'HTTP-Verzoeken';

  @override
  String get toolHttpRequestsDesc =>
      'Sta de agent toe willekeurige HTTP-verzoeken te doen';

  @override
  String get toolSandboxShell => 'Sandbox Shell';

  @override
  String get toolSandboxShellDesc =>
      'Sta de agent toe shell-opdrachten uit te voeren in de sandbox';

  @override
  String get toolImageGeneration => 'Afbeelding Genereren';

  @override
  String get toolImageGenerationDesc =>
      'Sta de agent toe afbeeldingen te genereren via AI';

  @override
  String get toolLaunchApps => 'Apps Starten';

  @override
  String get toolLaunchAppsDesc =>
      'Sta de agent toe geïnstalleerde apps te openen';

  @override
  String get toolLaunchIntents => 'Intents Starten';

  @override
  String get toolLaunchIntentsDesc =>
      'Sta de agent toe Android-intents te activeren (deep links, systeemschermen)';

  @override
  String get renameSession => 'Sessie hernoemen';

  @override
  String get myConversationName => 'Mijn gespreksnaam';

  @override
  String get renameAction => 'Hernoemen';

  @override
  String get couldNotTranscribeAudio => 'Kon audio niet transcriberen';

  @override
  String get stopRecording => 'Stop opname';

  @override
  String get voiceInput => 'Spraakinvoer';

  @override
  String get speakMessage => 'Voorlezen';

  @override
  String get stopSpeaking => 'Stop met voorlezen';

  @override
  String get selectText => 'Tekst selecteren';

  @override
  String get messageCopied => 'Bericht gekopieerd';

  @override
  String get copyTooltip => 'Kopiëren';

  @override
  String get commandsTooltip => 'Opdrachten';

  @override
  String get providersAndModels => 'Providers & Modellen';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modellen geconfigureerd',
      one: '1 model geconfigureerd',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Automatisch starten ingeschakeld';

  @override
  String get autoStartOffLabel => 'Automatisch starten uit';

  @override
  String get allToolsEnabled => 'Alle tools ingeschakeld';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tools uitgeschakeld',
      one: '1 tool uitgeschakeld',
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
  String get officialWebsite => 'Officiële website';

  @override
  String get noPendingPairingRequests => 'Geen openstaande koppelingsverzoeken';

  @override
  String get pairingRequestsTitle => 'Koppelingsverzoeken';

  @override
  String get gatewayStartingStatus => 'Gateway wordt gestart...';

  @override
  String get gatewayRetryingStatus =>
      'Gateway-start wordt opnieuw geprobeerd...';

  @override
  String get errorStartingGateway => 'Fout bij starten gateway';

  @override
  String get runningStatus => 'Actief';

  @override
  String get stoppedStatus => 'Gestopt';

  @override
  String get notSetUpStatus => 'Niet ingesteld';

  @override
  String get configuredStatus => 'Geconfigureerd';

  @override
  String get whatsAppConfigSaved => 'WhatsApp configuratie opgeslagen';

  @override
  String get whatsAppDisconnected => 'WhatsApp verbinding verbroken';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Toepassen...';

  @override
  String get reconnectWhatsApp => 'WhatsApp Opnieuw Verbinden';

  @override
  String get saveSettingsLabel => 'Instellingen Opslaan';

  @override
  String get applySettingsRestart => 'Instellingen Toepassen & Herstarten';

  @override
  String get whatsAppMode => 'WhatsApp Modus';

  @override
  String get myPersonalNumber => 'Mijn persoonlijke nummer';

  @override
  String get myPersonalNumberDesc =>
      'Berichten die u naar uw eigen WhatsApp-chat stuurt, activeren de agent.';

  @override
  String get dedicatedBotAccount => 'Toegewijd bot-account';

  @override
  String get dedicatedBotAccountDesc =>
      'Berichten verzonden vanaf het gekoppelde account zelf worden genegeerd als uitgaand.';

  @override
  String get allowedNumbers => 'Toegestane Nummers';

  @override
  String get addNumberTitle => 'Nummer Toevoegen';

  @override
  String get phoneNumberJid => 'Telefoonnummer / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Geen toegestane nummers geconfigureerd';

  @override
  String get devicesAppearAfterPairing =>
      'Apparaten verschijnen hier nadat u koppelingsverzoeken hebt goedgekeurd';

  @override
  String get addPhoneNumbersHint =>
      'Voeg telefoonnummers toe om hen toegang te geven tot de bot';

  @override
  String get allowedNumber => 'Toegestaan nummer';

  @override
  String get howToConnect => 'Hoe te verbinden';

  @override
  String get whatsAppConnectInstructions =>
      '1. Tik hierboven op \"Verbind WhatsApp\"\n2. Er verschijnt een QR-code — scan deze met WhatsApp\n   (Instellingen → Gekoppelde Apparaten → Koppel een Apparaat)\n3. Eenmaal verbonden worden inkomende berichten automatisch\n   doorgestuurd naar uw actieve AI-agent';

  @override
  String get whatsAppPairingDesc =>
      'Nieuwe afzenders krijgen een koppelingscode. U keurt ze goed.';

  @override
  String get whatsAppAllowlistDesc =>
      'Alleen specifieke telefoonnummers kunnen berichten sturen naar de bot.';

  @override
  String get whatsAppOpenDesc =>
      'Iedereen die u een bericht stuurt kan de bot gebruiken.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot reageert niet op inkomende berichten.';

  @override
  String get sessionExpiredRelink =>
      'Sessie verlopen. Tik hieronder op \"Opnieuw verbinden\" om een nieuwe QR-code te scannen.';

  @override
  String get connectWhatsAppBelow =>
      'Tik hieronder op \"Verbind WhatsApp\" om uw account te koppelen.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp heeft de QR geaccepteerd. De koppeling wordt afgerond...';

  @override
  String get waitingForWhatsApp =>
      'Wachten tot WhatsApp de koppeling voltooit...';

  @override
  String get focusedLabel => 'Gefocust';

  @override
  String get balancedLabel => 'Gebalanceerd';

  @override
  String get creativeLabel => 'Creatief';

  @override
  String get preciseLabel => 'Precies';

  @override
  String get expressiveLabel => 'Expressief';

  @override
  String get browseLabel => 'Bladeren';

  @override
  String get apiTokenLabel => 'API-token';

  @override
  String get connectToClawHub => 'Verbind met ClawHub';

  @override
  String get clawHubLoginHint =>
      'Log in bij ClawHub voor toegang tot premium vaardigheden en installeer pakketten';

  @override
  String get howToGetApiToken => 'Hoe u uw API-token krijgt:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Bezoek clawhub.ai en log in met GitHub\n2. Voer \"clawhub login\" uit in terminal\n3. Kopieer uw token en plak het hier';

  @override
  String connectionFailed(String error) {
    return 'Verbinding mislukt: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count uitvoeringen';
  }

  @override
  String nextRunLabel(String time) {
    return 'Volgende uitvoering: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Laatste fout: $error';
  }

  @override
  String get cronJobHintText =>
      'Instructies voor de agent wanneer deze taak wordt geactiveerd…';

  @override
  String get androidPermissions => 'Android Toestemmingen';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw kan uw scherm bedienen namens u — knoppen indrukken, formulieren invullen, scrollen en herhalende taken automatiseren in elke app.';

  @override
  String get twoPermissionsNeeded =>
      'Twee toestemmingen zijn nodig voor de volledige ervaring. U kunt dit overslaan en later inschakelen in Instellingen.';

  @override
  String get accessibilityService => 'Toegankelijkheidsservice';

  @override
  String get accessibilityServiceDesc =>
      'Maakt tikken, vegen, typen en lezen van scherminhoud mogelijk';

  @override
  String get displayOverOtherApps => 'Weergeven Boven Andere Apps';

  @override
  String get displayOverOtherAppsDesc =>
      'Toont een zwevende statuschip zodat u kunt zien wat de agent doet';

  @override
  String get changeDefaultModel => 'Standaardmodel wijzigen';

  @override
  String setModelAsDefault(String name) {
    return 'Stel $name in als het standaardmodel.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en',
      one: '',
    );
    return 'Ook $count agent$_temp0 bijwerken';
  }

  @override
  String get startNewSessions => 'Nieuwe sessies starten';

  @override
  String get currentConversationsArchived =>
      'Huidige gesprekken worden gearchiveerd';

  @override
  String get applyAction => 'Toepassen';

  @override
  String applyModelQuestion(String name) {
    return '$name toepassen?';
  }

  @override
  String get setAsDefaultModel => 'Instellen als standaardmodel';

  @override
  String get usedByAgentsWithout =>
      'Gebruikt door agenten zonder een specifiek model';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en',
      one: '',
    );
    return 'Toepassen op $count agent$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Provider al geauthenticeerd — geen API-sleutel nodig.';

  @override
  String get selectFromList => 'Selecteer uit lijst';

  @override
  String get enterCustomModelId => 'Voer een aangepaste model-ID in';

  @override
  String get removeSkillTitle => 'Vaardigheid verwijderen?';

  @override
  String get browseClawHubToDiscover =>
      'Blader door ClawHub om vaardigheden te ontdekken en installeren';

  @override
  String get addDeviceTooltip => 'Apparaat toevoegen';

  @override
  String get addNumberTooltip => 'Nummer toevoegen';

  @override
  String get searchSkillsHint => 'Zoek vaardigheden...';

  @override
  String get loginToClawHub => 'Inloggen bij ClawHub';

  @override
  String get accountTooltip => 'Account';

  @override
  String get editAction => 'Bewerken';

  @override
  String get setAsDefaultAction => 'Instellen als standaard';

  @override
  String get chooseProviderTitle => 'Kies provider';

  @override
  String get apiKeyTitle => 'API-sleutel';

  @override
  String get slackConfigSaved =>
      'Slack opgeslagen — herstart de gateway om te verbinden';

  @override
  String get signalConfigSaved =>
      'Signal opgeslagen — herstart gateway om te verbinden';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Apparaat toevoegen';

  @override
  String get skipAction => 'Overslaan';

  @override
  String get mcpServers => 'MCP-servers';

  @override
  String get noMcpServersConfigured => 'Geen MCP-servers geconfigureerd';

  @override
  String get mcpServersEmptyHint =>
      'Voeg MCP-servers toe om uw agent toegang te geven tot tools van GitHub, Notion, Slack, databases en meer.';

  @override
  String get addMcpServer => 'MCP-server toevoegen';

  @override
  String get editMcpServer => 'MCP-server bewerken';

  @override
  String get removeMcpServer => 'MCP-server verwijderen';

  @override
  String removeMcpServerConfirm(String name) {
    return '\"$name\" verwijderen? De tools ervan zijn dan niet meer beschikbaar.';
  }

  @override
  String get mcpTransport => 'Transport';

  @override
  String get testConnection => 'Verbinding testen';

  @override
  String get mcpServerNameLabel => 'Servernaam';

  @override
  String get mcpServerNameHint => 'bijv. GitHub, Notion, Mijn DB';

  @override
  String get mcpServerUrlLabel => 'Server-URL';

  @override
  String get mcpBearerTokenLabel => 'Bearer-token (optioneel)';

  @override
  String get mcpBearerTokenHint => 'Leeg laten als geen authenticatie vereist';

  @override
  String get mcpCommandLabel => 'Opdracht';

  @override
  String get mcpArgumentsLabel => 'Argumenten (gescheiden door spaties)';

  @override
  String get mcpEnvVarsLabel =>
      'Omgevingsvariabelen (SLEUTEL=WAARDE, één per regel)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio is niet beschikbaar op iOS. Gebruik HTTP of SSE.';

  @override
  String get connectedStatus => 'Verbonden';

  @override
  String get mcpConnecting => 'Verbinden...';

  @override
  String get mcpConnectionError => 'Verbindingsfout';

  @override
  String get mcpDisconnected => 'Verbroken';

  @override
  String mcpToolsCount(int count) {
    return '$count tools';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — $count tools ontdekt';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Verbonden (0 tools)';

  @override
  String get mcpTestFailed =>
      'Verbinding mislukt. Controleer de server-URL/token.';

  @override
  String get mcpAddServer => 'Server toevoegen';

  @override
  String get mcpSaveChanges => 'Wijzigingen opslaan';

  @override
  String get urlIsRequired => 'URL is vereist';

  @override
  String get enterValidUrl => 'Voer een geldige URL in';

  @override
  String get commandIsRequired => 'Opdracht is vereist';

  @override
  String skillRemoved(String name) {
    return 'Vaardigheid \"$name\" verwijderd';
  }

  @override
  String get editFileContentHint => 'Bestandsinhoud bewerken...';

  @override
  String get whatsAppPairSubtitle =>
      'Koppel uw persoonlijke WhatsApp-account met een QR-code';

  @override
  String get whatsAppPairingOptional =>
      'Koppelen is optioneel. U kunt de onboarding nu afronden en de koppeling later voltooien.';

  @override
  String get whatsAppEnableToLink =>
      'Schakel WhatsApp in om dit apparaat te koppelen.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp is gekoppeld. FlutterClaw kan reageren na de onboarding.';

  @override
  String get cancelLink => 'Koppeling annuleren';
}
