// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Canali';

  @override
  String get agent => 'Agente';

  @override
  String get settings => 'Impostazioni';

  @override
  String get getStarted => 'Inizia';

  @override
  String get yourPersonalAssistant => 'Il tuo assistente personale IA';

  @override
  String get multiChannelChat => 'Chat multicanale';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat e altro';

  @override
  String get powerfulAIModels => 'Modelli IA potenti';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok e modelli gratuiti';

  @override
  String get localGateway => 'Gateway locale';

  @override
  String get localGatewayDesc =>
      'Funziona sul tuo dispositivo, i tuoi dati restano tuoi';

  @override
  String get chooseProvider => 'Scegli un Fornitore';

  @override
  String get selectProviderDesc =>
      'Seleziona come vuoi connetterti ai modelli IA.';

  @override
  String get startForFree => 'Inizia Gratuitamente';

  @override
  String get freeProvidersDesc =>
      'Questi fornitori offrono modelli gratuiti per iniziare senza costi.';

  @override
  String get free => 'GRATIS';

  @override
  String get otherProviders => 'Altri Fornitori';

  @override
  String connectToProvider(String provider) {
    return 'Connetti a $provider';
  }

  @override
  String get enterApiKeyDesc =>
      'Inserisci la tua chiave API e seleziona un modello.';

  @override
  String get dontHaveApiKey => 'Non hai una chiave API?';

  @override
  String get createAccountCopyKey => 'Crea un account e copia la tua chiave.';

  @override
  String get signUp => 'Registrati';

  @override
  String get apiKey => 'Chiave API';

  @override
  String get pasteFromClipboard => 'Incolla dagli appunti';

  @override
  String get apiBaseUrl => 'URL Base API';

  @override
  String get selectModel => 'Seleziona Modello';

  @override
  String get modelId => 'ID Modello';

  @override
  String get validateKey => 'Valida Chiave';

  @override
  String get validating => 'Validazione...';

  @override
  String get invalidApiKey => 'Chiave API non valida';

  @override
  String get gatewayConfiguration => 'Configurazione Gateway';

  @override
  String get gatewayConfigDesc =>
      'Il gateway è il piano di controllo locale per il tuo assistente.';

  @override
  String get defaultSettingsNote =>
      'Le impostazioni predefinite funzionano per la maggior parte degli utenti. Modificale solo se sai cosa ti serve.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Porta';

  @override
  String get autoStartGateway => 'Avvio automatico gateway';

  @override
  String get autoStartGatewayDesc =>
      'Avvia il gateway automaticamente all\'avvio dell\'app.';

  @override
  String get channelsPageTitle => 'Canali';

  @override
  String get channelsPageDesc =>
      'Connetti canali di messaggistica opzionalmente. Puoi sempre configurarli più tardi nelle Impostazioni.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Connetti un bot Telegram.';

  @override
  String get openBotFather => 'Apri BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Connetti un bot Discord.';

  @override
  String get developerPortal => 'Portale Sviluppatore';

  @override
  String get botToken => 'Token Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Token Bot $platform';
  }

  @override
  String get readyToGo => 'Pronto per Iniziare';

  @override
  String get reviewConfiguration =>
      'Rivedi la tua configurazione e avvia FlutterClaw.';

  @override
  String get model => 'Modello';

  @override
  String viaProvider(String provider) {
    return 'tramite $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Solo WebChat (puoi aggiungerne altri dopo)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Avvio...';

  @override
  String get startFlutterClaw => 'Avvia FlutterClaw';

  @override
  String get newSession => 'Nuova sessione';

  @override
  String get photoLibrary => 'Libreria Foto';

  @override
  String get camera => 'Fotocamera';

  @override
  String get whatDoYouSeeInImage => 'Cosa vedi in questa immagine?';

  @override
  String get imagePickerNotAvailable =>
      'Selettore immagini non disponibile sul Simulatore. Usa un dispositivo reale.';

  @override
  String get couldNotOpenImagePicker =>
      'Impossibile aprire il selettore immagini.';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get attachImage => 'Allega immagine';

  @override
  String get messageFlutterClaw => 'Messaggio a FlutterClaw...';

  @override
  String get channelsAndGateway => 'Canali e Gateway';

  @override
  String get stop => 'Ferma';

  @override
  String get start => 'Avvia';

  @override
  String status(String status) {
    return 'Stato: $status';
  }

  @override
  String get builtInChatInterface => 'Interfaccia chat integrata';

  @override
  String get notConfigured => 'Non configurato';

  @override
  String get connected => 'Connesso';

  @override
  String get configuredStarting => 'Configurato (avvio...)';

  @override
  String get telegramConfiguration => 'Configurazione Telegram';

  @override
  String get fromBotFather => 'Da @BotFather';

  @override
  String get allowedUserIds => 'ID Utente Consentiti (separati da virgola)';

  @override
  String get leaveEmptyToAllowAll => 'Lascia vuoto per consentire tutti';

  @override
  String get cancel => 'Annulla';

  @override
  String get saveAndConnect => 'Salva e Connetti';

  @override
  String get discordConfiguration => 'Configurazione Discord';

  @override
  String get pendingPairingRequests => 'Richieste di Abbinamento in Sospeso';

  @override
  String get approve => 'Approva';

  @override
  String get reject => 'Rifiuta';

  @override
  String get expired => 'Scaduto';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m rimanenti';
  }

  @override
  String get workspaceFiles => 'File dell\'Area di Lavoro';

  @override
  String get personalAIAssistant => 'Assistente Personale IA';

  @override
  String sessionsCount(int count) {
    return 'Sessioni ($count)';
  }

  @override
  String get noActiveSessions => 'Nessuna sessione attiva';

  @override
  String get startConversationToCreate =>
      'Avvia una conversazione per crearne una';

  @override
  String get startConversationToSee =>
      'Avvia una conversazione per vedere le sessioni qui';

  @override
  String get reset => 'Reimposta';

  @override
  String get cronJobs => 'Attività Programmate';

  @override
  String get noCronJobs => 'Nessuna attività programmata';

  @override
  String get addScheduledTasks =>
      'Aggiungi attività programmate per il tuo agente';

  @override
  String get runNow => 'Esegui Ora';

  @override
  String get enable => 'Abilita';

  @override
  String get disable => 'Disabilita';

  @override
  String get delete => 'Elimina';

  @override
  String get skills => 'Abilità';

  @override
  String get browseClawHub => 'Sfoglia ClawHub';

  @override
  String get noSkillsInstalled => 'Nessuna abilità installata';

  @override
  String get browseClawHubToAdd => 'Sfoglia ClawHub per aggiungere abilità';

  @override
  String removeSkillConfirm(String name) {
    return 'Rimuovere \"$name\" dalle tue abilità?';
  }

  @override
  String get clawHubSkills => 'Abilità ClawHub';

  @override
  String get searchSkills => 'Cerca abilità...';

  @override
  String get noSkillsFound =>
      'Nessuna abilità trovata. Prova una ricerca diversa.';

  @override
  String installedSkill(String name) {
    return '$name installato';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Installazione di $name non riuscita';
  }

  @override
  String get addCronJob => 'Aggiungi Attività Programmata';

  @override
  String get jobName => 'Nome Attività';

  @override
  String get dailySummaryExample => 'es. Riepilogo Giornaliero';

  @override
  String get taskPrompt => 'Istruzione Attività';

  @override
  String get whatShouldAgentDo => 'Cosa dovrebbe fare l\'agente?';

  @override
  String get interval => 'Intervallo';

  @override
  String get every5Minutes => 'Ogni 5 minuti';

  @override
  String get every15Minutes => 'Ogni 15 minuti';

  @override
  String get every30Minutes => 'Ogni 30 minuti';

  @override
  String get everyHour => 'Ogni ora';

  @override
  String get every6Hours => 'Ogni 6 ore';

  @override
  String get every12Hours => 'Ogni 12 ore';

  @override
  String get every24Hours => 'Ogni 24 ore';

  @override
  String get add => 'Aggiungi';

  @override
  String get save => 'Salva';

  @override
  String get sessions => 'Sessioni';

  @override
  String messagesCount(int count) {
    return '$count messaggi';
  }

  @override
  String tokensCount(int count) {
    return '$count token';
  }

  @override
  String get compact => 'Compatta';

  @override
  String get models => 'Modelli';

  @override
  String get noModelsConfigured => 'Nessun modello configurato';

  @override
  String get addModelToStartChatting =>
      'Aggiungi un modello per iniziare a chattare';

  @override
  String get addModel => 'Aggiungi Modello';

  @override
  String get default_ => 'PREDEFINITO';

  @override
  String get autoStart => 'Avvio automatico';

  @override
  String get startGatewayWhenLaunches => 'Avvia gateway all\'avvio dell\'app';

  @override
  String get heartbeat => 'Battito Cardiaco';

  @override
  String get enabled => 'Abilitato';

  @override
  String get periodicAgentTasks =>
      'Attività periodiche dell\'agente da HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'Informazioni';

  @override
  String get personalAIAssistantForIOS =>
      'Assistente Personale IA per iOS e Android';

  @override
  String get version => 'Versione';

  @override
  String get basedOnOpenClaw => 'Basato su OpenClaw';

  @override
  String get removeModel => 'Rimuovere modello?';

  @override
  String removeModelConfirm(String name) {
    return 'Rimuovere \"$name\" dai tuoi modelli?';
  }

  @override
  String get remove => 'Rimuovi';

  @override
  String get setAsDefault => 'Imposta come Predefinito';

  @override
  String get paste => 'Incolla';

  @override
  String get chooseProviderStep => '1. Scegli Fornitore';

  @override
  String get selectModelStep => '2. Seleziona Modello';

  @override
  String get apiKeyStep => '3. Chiave API';

  @override
  String getApiKeyAt(String provider) {
    return 'Ottieni chiave API su $provider';
  }

  @override
  String get justNow => 'proprio ora';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m fa';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}h fa';
  }

  @override
  String daysAgo(int days) {
    return '${days}g fa';
  }

  @override
  String get microphonePermissionDenied => 'Permesso microfono negato';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Trascrizione dal vivo non disponibile: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Impossibile avviare la registrazione: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Utilizzo trascrizione sul dispositivo';

  @override
  String get transcribingWithWhisper => 'Trascrizione con Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API fallito: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Nessuna trascrizione catturata';

  @override
  String failedToStopRecording(String error) {
    return 'Impossibile fermare la registrazione: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Impossibile $action: $error';
  }

  @override
  String get pause => 'Pausa';

  @override
  String get resume => 'Riprendi';

  @override
  String get send => 'Invia';

  @override
  String get liveActivityActive => 'Live Activity attiva';

  @override
  String get restartGateway => 'Riavvia Gateway';

  @override
  String modelLabel(String model) {
    return 'Modello: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Tempo attivo: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Supporto in background attivo - il gateway può continuare a rispondere';

  @override
  String get webChatBuiltIn => 'Interfaccia chat integrata';

  @override
  String get configure => 'Configura';

  @override
  String get disconnect => 'Disconnetti';

  @override
  String get agents => 'Agents';

  @override
  String get agentFiles => 'Agent Files';

  @override
  String get createAgent => 'Create Agent';

  @override
  String get editAgent => 'Edit Agent';

  @override
  String get noAgentsYet => 'No agents yet';

  @override
  String get createYourFirstAgent => 'Create your first agent!';

  @override
  String get active => 'Active';

  @override
  String get agentName => 'Agent Name';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Select Emoji';

  @override
  String get vibe => 'Vibe';

  @override
  String get vibeHint => 'e.g., friendly, formal, snarky';

  @override
  String get modelConfiguration => 'Model Configuration';

  @override
  String get advancedSettings => 'Advanced Settings';

  @override
  String get agentCreated => 'Agent created';

  @override
  String get agentUpdated => 'Agent updated';

  @override
  String get agentDeleted => 'Agent deleted';

  @override
  String switchedToAgent(String name) {
    return 'Switched to $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Delete $name? This will remove all workspace data.';
  }

  @override
  String get agentDetails => 'Agent Details';

  @override
  String get createdAt => 'Created';

  @override
  String get lastUsed => 'Last Used';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get switchToAgent => 'Switch Agent';

  @override
  String get providers => 'Providers';

  @override
  String get addProvider => 'Add provider';

  @override
  String get noProvidersConfigured => 'No providers configured.';

  @override
  String get editCredentials => 'Edit credentials';

  @override
  String get defaultModelHint =>
      'The default model is used by agents that don\'t specify their own.';

  @override
  String get holdToSetAsDefault => 'Hold to set as default';

  @override
  String get integrations => 'Integrations';

  @override
  String get shortcutsIntegrations => 'Shortcuts Integrations';

  @override
  String get shortcutsIntegrationsDesc =>
      'Install iOS Shortcuts to run third-party app actions';

  @override
  String get dangerZone => 'Danger zone';

  @override
  String get resetOnboarding => 'Reset & re-run onboarding';

  @override
  String get resetOnboardingDesc =>
      'Deletes all configuration and returns to the setup wizard.';

  @override
  String get resetAllConfiguration => 'Reset all configuration?';

  @override
  String get resetAllConfigurationDesc =>
      'This will delete your API keys, models, and all settings. The app will return to the setup wizard.\n\nYour conversation history is not deleted.';

  @override
  String get removeProvider => 'Remove provider';

  @override
  String removeProviderConfirm(String provider) {
    return 'Remove credentials for $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name set as default model';
  }

  @override
  String get photoImage => 'Photo / Image';

  @override
  String get documentPdfTxt => 'Document (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Could not open document: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get gatewayStopped => 'Gateway stopped';

  @override
  String get gatewayStarted => 'Gateway started successfully!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway failed: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Exception: $error';
  }

  @override
  String get pairingRequestApproved => 'Pairing request approved';

  @override
  String get pairingRequestRejected => 'Pairing request rejected';

  @override
  String get addDevice => 'Add Device';

  @override
  String get telegramConfigSaved => 'Telegram configuration saved';

  @override
  String get discordConfigSaved => 'Discord configuration saved';

  @override
  String get securityMethod => 'Security Method';

  @override
  String get pairingRecommended => 'Pairing (Recommended)';

  @override
  String get pairingDescription =>
      'New users get a pairing code. You approve or reject them.';

  @override
  String get allowlistTitle => 'Allowlist';

  @override
  String get allowlistDescription =>
      'Only specific user IDs can access the bot.';

  @override
  String get openAccess => 'Open';

  @override
  String get openAccessDescription =>
      'Anyone can use the bot immediately (not recommended).';

  @override
  String get disabledAccess => 'Disabled';

  @override
  String get disabledAccessDescription =>
      'No DMs allowed. Bot will not respond to any messages.';

  @override
  String get approvedDevices => 'Approved Devices';

  @override
  String get noApprovedDevicesYet => 'No approved devices yet';

  @override
  String get devicesAppearAfterApproval =>
      'Devices will appear here after you approve their pairing requests';

  @override
  String get noAllowedUsersConfigured => 'No allowed users configured';

  @override
  String get addUserIdsHint => 'Add user IDs to allow them to use the bot';

  @override
  String get removeDevice => 'Remove device?';

  @override
  String removeAccessFor(String name) {
    return 'Remove access for $name?';
  }

  @override
  String get saving => 'Saving...';

  @override
  String get channelsLabel => 'Channels';

  @override
  String get clawHubAccount => 'ClawHub Account';

  @override
  String get loggedInToClawHub => 'You are currently logged in to ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Logged out from ClawHub';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get connect => 'Connect';

  @override
  String get pasteClawHubToken => 'Paste your ClawHub API token';

  @override
  String get pleaseEnterApiToken => 'Please enter an API token';

  @override
  String get successfullyConnected => 'Successfully connected to ClawHub';

  @override
  String get browseSkillsButton => 'Browse Skills';

  @override
  String get installSkill => 'Install Skill';

  @override
  String get incompatibleSkill => 'Incompatible Skill';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'This skill cannot run on mobile (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Compatibility Warning';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'This skill was designed for desktop and may not work as-is on mobile.\n\n$reason\n\nWould you like to install an adapted version optimized for mobile?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Install Original';

  @override
  String get installAdapted => 'Install Adapted';

  @override
  String get resetSession => 'Reset Session';

  @override
  String resetSessionConfirm(String key) {
    return 'Reset session \"$key\"? This will clear all messages.';
  }

  @override
  String get sessionReset => 'Session reset';

  @override
  String get activeSessions => 'Active Sessions';

  @override
  String get scheduledTasks => 'Scheduled Tasks';

  @override
  String get defaultBadge => 'Default';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName saved';
  }

  @override
  String errorSavingFile(String error) {
    return 'Error saving file: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Cannot delete the last agent';

  @override
  String get close => 'Close';

  @override
  String get nameIsRequired => 'Name is required';

  @override
  String get pleaseSelectModel => 'Please select a model';

  @override
  String temperatureLabel(String value) {
    return 'Temperature: $value';
  }

  @override
  String get maxTokens => 'Max Tokens';

  @override
  String get maxTokensRequired => 'Max tokens is required';

  @override
  String get mustBePositiveNumber => 'Must be a positive number';

  @override
  String get maxToolIterations => 'Max Tool Iterations';

  @override
  String get maxIterationsRequired => 'Max iterations is required';

  @override
  String get restrictToWorkspace => 'Restrict to Workspace';

  @override
  String get restrictToWorkspaceDesc =>
      'Limit file operations to agent workspace';

  @override
  String get noModelsConfiguredLong =>
      'Please add at least one model in Settings before creating an agent.';

  @override
  String get selectProviderFirst => 'Select a provider first';

  @override
  String get skip => 'Skip';

  @override
  String get continueButton => 'Continue';

  @override
  String get uiAutomation => 'UI Automation';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw can control your screen on your behalf — tapping buttons, filling forms, scrolling, and automating repetitive tasks across any app.';

  @override
  String get uiAutomationAccessibilityNote =>
      'This requires enabling the Accessibility Service in Android Settings. You can skip this and enable it later.';

  @override
  String get openAccessibilitySettings => 'Open Accessibility Settings';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get checkingPermission => 'Checking permission…';

  @override
  String get accessibilityEnabled => 'Accessibility Service is enabled';

  @override
  String get accessibilityNotEnabled => 'Accessibility Service is not enabled';

  @override
  String get exploreIntegrations => 'Explore Integrations';

  @override
  String get requestTimedOut => 'Request timed out';

  @override
  String get myShortcuts => 'My Shortcuts';

  @override
  String get addShortcut => 'Add Shortcut';

  @override
  String get noShortcutsYet => 'No shortcuts yet';

  @override
  String get shortcutsInstructions =>
      'Create a shortcut in the iOS Shortcuts app, add the callback action at the end, then register it here so the AI can run it.';

  @override
  String get shortcutName => 'Shortcut name';

  @override
  String get shortcutNameHint => 'Exact name from the Shortcuts app';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get whatDoesShortcutDo => 'What does this shortcut do?';

  @override
  String get callbackSetup => 'Callback setup';

  @override
  String get callbackInstructions =>
      'Each shortcut must end with:\n① Get Value for Key → \"callbackUrl\" (from Shortcut Input parsed as dict)\n② Open URLs ← output of ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Heartbeat';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagent';

  @override
  String get channelSystem => 'System';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s ago';
  }

  @override
  String get messagesAbbrev => 'msgs';

  @override
  String get modelAlreadyAdded => 'This model is already in your list';
}
