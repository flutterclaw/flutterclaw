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
  String get webChatOnly => 'Solo chat (puoi aggiungerne altri dopo)';

  @override
  String get webChat => 'Chat';

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
  String get agents => 'Agenti';

  @override
  String get agentFiles => 'File Agente';

  @override
  String get createAgent => 'Crea Agente';

  @override
  String get editAgent => 'Modifica Agente';

  @override
  String get noAgentsYet => 'Nessun agente ancora';

  @override
  String get createYourFirstAgent => 'Crea il tuo primo agente!';

  @override
  String get active => 'Attivo';

  @override
  String get agentName => 'Nome Agente';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Seleziona Emoji';

  @override
  String get vibe => 'Atmosfera';

  @override
  String get vibeHint => 'es. amichevole, formale, sarcastico';

  @override
  String get modelConfiguration => 'Configurazione Modello';

  @override
  String get advancedSettings => 'Impostazioni Avanzate';

  @override
  String get agentCreated => 'Agente creato';

  @override
  String get agentUpdated => 'Agente aggiornato';

  @override
  String get agentDeleted => 'Agente eliminato';

  @override
  String switchedToAgent(String name) {
    return 'Passato a $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Eliminare $name? Tutti i dati dell\'area di lavoro saranno rimossi.';
  }

  @override
  String get agentDetails => 'Dettagli Agente';

  @override
  String get createdAt => 'Creato';

  @override
  String get lastUsed => 'Ultimo Utilizzo';

  @override
  String get basicInformation => 'Informazioni di Base';

  @override
  String get switchToAgent => 'Cambia Agente';

  @override
  String get providers => 'Fornitori';

  @override
  String get addProvider => 'Aggiungi fornitore';

  @override
  String get noProvidersConfigured => 'Nessun fornitore configurato.';

  @override
  String get editCredentials => 'Modifica credenziali';

  @override
  String get defaultModelHint =>
      'Il modello predefinito è utilizzato dagli agenti che non specificano il proprio.';

  @override
  String get holdToSetAsDefault =>
      'Tieni premuto per impostare come predefinito';

  @override
  String get integrations => 'Integrazioni';

  @override
  String get shortcutsIntegrations => 'Integrazioni Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'Installa Shortcuts iOS per eseguire azioni di app di terze parti';

  @override
  String get dangerZone => 'Zona pericolosa';

  @override
  String get resetOnboarding => 'Reimposta e riesegui onboarding';

  @override
  String get resetOnboardingDesc =>
      'Elimina tutta la configurazione e torna alla procedura guidata di configurazione.';

  @override
  String get resetAllConfiguration => 'Reimpostare tutta la configurazione?';

  @override
  String get resetAllConfigurationDesc =>
      'Questo eliminerà le chiavi API, i modelli e tutte le impostazioni. L\'app tornerà alla procedura guidata di configurazione.\n\nLa cronologia delle conversazioni non verrà eliminata.';

  @override
  String get removeProvider => 'Rimuovi fornitore';

  @override
  String removeProviderConfirm(String provider) {
    return 'Rimuovere le credenziali per $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name impostato come modello predefinito';
  }

  @override
  String get photoImage => 'Foto / Immagine';

  @override
  String get documentPdfTxt => 'Documento (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Impossibile aprire il documento: $error';
  }

  @override
  String get retry => 'Riprova';

  @override
  String get gatewayStopped => 'Gateway fermato';

  @override
  String get gatewayStarted => 'Gateway avviato con successo!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway fallito: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Eccezione: $error';
  }

  @override
  String get pairingRequestApproved => 'Richiesta di abbinamento approvata';

  @override
  String get pairingRequestRejected => 'Richiesta di abbinamento rifiutata';

  @override
  String get addDevice => 'Aggiungi Dispositivo';

  @override
  String get telegramConfigSaved => 'Configurazione Telegram salvata';

  @override
  String get discordConfigSaved => 'Configurazione Discord salvata';

  @override
  String get securityMethod => 'Metodo di Sicurezza';

  @override
  String get pairingRecommended => 'Abbinamento (Consigliato)';

  @override
  String get pairingDescription =>
      'I nuovi utenti ricevono un codice di abbinamento. Li approvi o rifiuti.';

  @override
  String get allowlistTitle => 'Lista Consentiti';

  @override
  String get allowlistDescription =>
      'Solo ID utente specifici possono accedere al bot.';

  @override
  String get openAccess => 'Aperto';

  @override
  String get openAccessDescription =>
      'Chiunque può utilizzare il bot immediatamente (non consigliato).';

  @override
  String get disabledAccess => 'Disabilitato';

  @override
  String get disabledAccessDescription =>
      'Nessun messaggio diretto consentito. Il bot non risponderà a nessun messaggio.';

  @override
  String get approvedDevices => 'Dispositivi Approvati';

  @override
  String get noApprovedDevicesYet => 'Nessun dispositivo approvato ancora';

  @override
  String get devicesAppearAfterApproval =>
      'I dispositivi appariranno qui dopo aver approvato le loro richieste di abbinamento';

  @override
  String get noAllowedUsersConfigured => 'Nessun utente consentito configurato';

  @override
  String get addUserIdsHint =>
      'Aggiungi ID utente per consentire loro di utilizzare il bot';

  @override
  String get removeDevice => 'Rimuovere dispositivo?';

  @override
  String removeAccessFor(String name) {
    return 'Rimuovere l\'accesso per $name?';
  }

  @override
  String get saving => 'Salvataggio...';

  @override
  String get channelsLabel => 'Canali';

  @override
  String get clawHubAccount => 'Account ClawHub';

  @override
  String get loggedInToClawHub => 'Sei attualmente connesso a ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Disconnesso da ClawHub';

  @override
  String get login => 'Accedi';

  @override
  String get logout => 'Disconnetti';

  @override
  String get connect => 'Connetti';

  @override
  String get pasteClawHubToken => 'Incolla il tuo token API ClawHub';

  @override
  String get pleaseEnterApiToken => 'Inserisci un token API';

  @override
  String get successfullyConnected => 'Connesso con successo a ClawHub';

  @override
  String get browseSkillsButton => 'Sfoglia Abilità';

  @override
  String get installSkill => 'Installa Abilità';

  @override
  String get incompatibleSkill => 'Abilità Incompatibile';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Questa abilità non può funzionare su mobile (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Avviso di Compatibilità';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Questa abilità è stata progettata per desktop e potrebbe non funzionare su mobile.\n\n$reason\n\nVuoi installare una versione adattata ottimizzata per mobile?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Installa Originale';

  @override
  String get installAdapted => 'Installa Adattato';

  @override
  String get resetSession => 'Reimposta Sessione';

  @override
  String resetSessionConfirm(String key) {
    return 'Reimpostare la sessione \"$key\"? Tutti i messaggi saranno cancellati.';
  }

  @override
  String get sessionReset => 'Sessione reimpostata';

  @override
  String get activeSessions => 'Sessioni Attive';

  @override
  String get scheduledTasks => 'Attività Programmate';

  @override
  String get defaultBadge => 'Predefinito';

  @override
  String errorGeneric(String error) {
    return 'Errore: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName salvato';
  }

  @override
  String errorSavingFile(String error) {
    return 'Errore nel salvataggio del file: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Impossibile eliminare l\'ultimo agente';

  @override
  String get close => 'Chiudi';

  @override
  String get nameIsRequired => 'Il nome è obbligatorio';

  @override
  String get pleaseSelectModel => 'Seleziona un modello';

  @override
  String temperatureLabel(String value) {
    return 'Temperatura: $value';
  }

  @override
  String get maxTokens => 'Token Massimi';

  @override
  String get maxTokensRequired => 'Token massimi è obbligatorio';

  @override
  String get mustBePositiveNumber => 'Deve essere un numero positivo';

  @override
  String get maxToolIterations => 'Iterazioni Tool Massime';

  @override
  String get maxIterationsRequired => 'Iterazioni massime è obbligatorio';

  @override
  String get restrictToWorkspace => 'Limita all\'Area di Lavoro';

  @override
  String get restrictToWorkspaceDesc =>
      'Limita le operazioni sui file all\'area di lavoro dell\'agente';

  @override
  String get noModelsConfiguredLong =>
      'Aggiungi almeno un modello nelle Impostazioni prima di creare un agente.';

  @override
  String get selectProviderFirst => 'Seleziona prima un fornitore';

  @override
  String get skip => 'Salta';

  @override
  String get continueButton => 'Continua';

  @override
  String get uiAutomation => 'Automazione UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw può controllare il tuo schermo per tuo conto — toccare pulsanti, compilare moduli, scorrere e automatizzare attività ripetitive in qualsiasi app.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Questo richiede l\'abilitazione del Servizio di Accessibilità nelle Impostazioni Android. Puoi saltare e abilitarlo più tardi.';

  @override
  String get openAccessibilitySettings => 'Apri Impostazioni Accessibilità';

  @override
  String get skipForNow => 'Salta per ora';

  @override
  String get checkingPermission => 'Controllo permesso…';

  @override
  String get accessibilityEnabled => 'Il Servizio di Accessibilità è abilitato';

  @override
  String get accessibilityNotEnabled =>
      'Il Servizio di Accessibilità non è abilitato';

  @override
  String get exploreIntegrations => 'Esplora Integrazioni';

  @override
  String get requestTimedOut => 'Richiesta scaduta';

  @override
  String get myShortcuts => 'I Miei Shortcuts';

  @override
  String get addShortcut => 'Aggiungi Shortcut';

  @override
  String get noShortcutsYet => 'Nessun shortcut ancora';

  @override
  String get shortcutsInstructions =>
      'Crea uno shortcut nell\'app Shortcuts iOS, aggiungi l\'azione callback alla fine, quindi registralo qui così l\'IA può eseguirlo.';

  @override
  String get shortcutName => 'Nome shortcut';

  @override
  String get shortcutNameHint => 'Nome esatto dall\'app Shortcuts';

  @override
  String get descriptionOptional => 'Descrizione (opzionale)';

  @override
  String get whatDoesShortcutDo => 'Cosa fa questo shortcut?';

  @override
  String get callbackSetup => 'Configurazione callback';

  @override
  String get callbackInstructions =>
      'Ogni shortcut deve terminare con:\n① Get Value for Key → \"callbackUrl\" (da Shortcut Input analizzato come dict)\n② Open URLs ← output di ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Battito';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Sottoagente';

  @override
  String get channelSystem => 'Sistema';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s fa';
  }

  @override
  String get messagesAbbrev => 'msg';

  @override
  String get modelAlreadyAdded => 'Questo modello è già nella tua lista';

  @override
  String get bothTokensRequired => 'Entrambi i token sono obbligatori';

  @override
  String get slackSavedRestart =>
      'Slack salvato — riavvia il gateway per connetterti';

  @override
  String get slackConfiguration => 'Configurazione Slack';

  @override
  String get setupTitle => 'Configurazione';

  @override
  String get slackSetupInstructions =>
      '1. Crea un\'app Slack su api.slack.com/apps\n2. Abilita Socket Mode → genera App-Level Token (xapp-…)\n   con scope: connections:write\n3. Aggiungi Bot Token Scopes: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Installa app nel workspace → copia Bot Token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'URL API e numero di telefono sono obbligatori';

  @override
  String get signalSavedRestart =>
      'Signal salvato — riavvia gateway per connetterti';

  @override
  String get signalConfiguration => 'Configurazione Signal';

  @override
  String get requirementsTitle => 'Requisiti';

  @override
  String get signalRequirements =>
      'Richiede signal-cli-rest-api in esecuzione su un server:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegistra/collega il tuo numero Signal tramite REST API, quindi inserisci URL e numero di telefono qui sotto.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Il tuo numero di telefono Signal';

  @override
  String get userIdLabel => 'ID Utente';

  @override
  String get enterDiscordUserId => 'Inserisci ID utente Discord';

  @override
  String get enterTelegramUserId => 'Inserisci ID utente Telegram';

  @override
  String get fromDiscordDevPortal => 'Dal Portale Sviluppatori Discord';

  @override
  String get allowedUserIdsTitle => 'ID Utente Consentiti';

  @override
  String get approvedDevice => 'Dispositivo approvato';

  @override
  String get allowedUser => 'Utente consentito';

  @override
  String get howToGetBotToken => 'Come ottenere il tuo token bot';

  @override
  String get discordTokenInstructions =>
      '1. Vai al Portale Sviluppatori Discord\n2. Crea una nuova applicazione e un bot\n3. Copia il token e incollalo sopra\n4. Abilita Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Apri Telegram e cerca @BotFather\n2. Invia /newbot e segui le istruzioni\n3. Copia il token e incollalo sopra';

  @override
  String get fromBotFatherHint => 'Ottieni da @BotFather';

  @override
  String get accessTokenLabel => 'Token di accesso';

  @override
  String get notSetOpenAccess =>
      'Non impostato — accesso aperto (solo loopback)';

  @override
  String get gatewayAccessToken => 'Token di accesso gateway';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Lascia vuoto per disabilitare l\'autenticazione';

  @override
  String get toolPolicies => 'Politiche Tool';

  @override
  String get toolPoliciesDesc =>
      'Controlla a cosa può accedere l\'agente. I tool disabilitati sono nascosti all\'IA e bloccati in esecuzione.';

  @override
  String get privacySensors => 'Privacy & Sensori';

  @override
  String get networkCategory => 'Rete';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get toolTakePhotos => 'Scatta Foto';

  @override
  String get toolTakePhotosDesc =>
      'Consenti all\'agente di scattare foto con la fotocamera';

  @override
  String get toolRecordVideo => 'Registra Video';

  @override
  String get toolRecordVideoDesc => 'Consenti all\'agente di registrare video';

  @override
  String get toolLocation => 'Posizione';

  @override
  String get toolLocationDesc =>
      'Consenti all\'agente di leggere la tua posizione GPS attuale';

  @override
  String get toolHealthData => 'Dati Salute';

  @override
  String get toolHealthDataDesc =>
      'Consenti all\'agente di leggere i dati salute/fitness';

  @override
  String get toolContacts => 'Contatti';

  @override
  String get toolContactsDesc =>
      'Consenti all\'agente di cercare nei tuoi contatti';

  @override
  String get toolScreenshots => 'Screenshot';

  @override
  String get toolScreenshotsDesc =>
      'Consenti all\'agente di catturare screenshot dello schermo';

  @override
  String get toolWebFetch => 'Recupero Web';

  @override
  String get toolWebFetchDesc =>
      'Consenti all\'agente di recuperare contenuti da URL';

  @override
  String get toolWebSearch => 'Ricerca Web';

  @override
  String get toolWebSearchDesc => 'Consenti all\'agente di cercare sul web';

  @override
  String get toolHttpRequests => 'Richieste HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Consenti all\'agente di effettuare richieste HTTP arbitrarie';

  @override
  String get toolSandboxShell => 'Shell Sandbox';

  @override
  String get toolSandboxShellDesc =>
      'Consenti all\'agente di eseguire comandi shell nella sandbox';

  @override
  String get toolImageGeneration => 'Generazione Immagini';

  @override
  String get toolImageGenerationDesc =>
      'Consenti all\'agente di generare immagini tramite IA';

  @override
  String get toolLaunchApps => 'Avvia App';

  @override
  String get toolLaunchAppsDesc =>
      'Consenti all\'agente di aprire app installate';

  @override
  String get toolLaunchIntents => 'Avvia Intent';

  @override
  String get toolLaunchIntentsDesc =>
      'Consenti all\'agente di attivare intent Android (deep link, schermate di sistema)';

  @override
  String get renameSession => 'Rinomina sessione';

  @override
  String get myConversationName => 'Nome della mia conversazione';

  @override
  String get renameAction => 'Rinomina';

  @override
  String get couldNotTranscribeAudio => 'Impossibile trascrivere l\'audio';

  @override
  String get stopRecording => 'Ferma registrazione';

  @override
  String get voiceInput => 'Input vocale';

  @override
  String get copyTooltip => 'Copia';

  @override
  String get commandsTooltip => 'Comandi';

  @override
  String get providersAndModels => 'Fornitori & Modelli';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modelli configurati',
      one: '1 modello configurato',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Avvio automatico abilitato';

  @override
  String get autoStartOffLabel => 'Avvio automatico disattivato';

  @override
  String get allToolsEnabled => 'Tutti i tool abilitati';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tool disabilitati',
      one: '1 tool disabilitato',
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
  String get officialWebsite => 'Sito web ufficiale';

  @override
  String get noPendingPairingRequests =>
      'Nessuna richiesta di abbinamento in sospeso';

  @override
  String get pairingRequestsTitle => 'Richieste di Abbinamento';

  @override
  String get gatewayStartingStatus => 'Avvio gateway...';

  @override
  String get gatewayRetryingStatus => 'Nuovo tentativo di avvio gateway...';

  @override
  String get errorStartingGateway => 'Errore nell\'avvio del gateway';

  @override
  String get runningStatus => 'In esecuzione';

  @override
  String get stoppedStatus => 'Fermato';

  @override
  String get notSetUpStatus => 'Non configurato';

  @override
  String get configuredStatus => 'Configurato';

  @override
  String get whatsAppConfigSaved => 'Configurazione WhatsApp salvata';

  @override
  String get whatsAppDisconnected => 'WhatsApp disconnesso';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Applicazione...';

  @override
  String get reconnectWhatsApp => 'Riconnetti WhatsApp';

  @override
  String get saveSettingsLabel => 'Salva Impostazioni';

  @override
  String get applySettingsRestart => 'Applica Impostazioni & Riavvia';

  @override
  String get whatsAppMode => 'Modalità WhatsApp';

  @override
  String get myPersonalNumber => 'Il mio numero personale';

  @override
  String get myPersonalNumberDesc =>
      'I messaggi che invii alla tua chat WhatsApp attivano l\'agente.';

  @override
  String get dedicatedBotAccount => 'Account bot dedicato';

  @override
  String get dedicatedBotAccountDesc =>
      'I messaggi inviati dall\'account collegato stesso sono ignorati come in uscita.';

  @override
  String get allowedNumbers => 'Numeri Consentiti';

  @override
  String get addNumberTitle => 'Aggiungi Numero';

  @override
  String get phoneNumberJid => 'Numero di telefono / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Nessun numero consentito configurato';

  @override
  String get devicesAppearAfterPairing =>
      'I dispositivi appaiono qui dopo aver approvato le richieste di abbinamento';

  @override
  String get addPhoneNumbersHint =>
      'Aggiungi numeri di telefono per consentire loro di usare il bot';

  @override
  String get allowedNumber => 'Numero consentito';

  @override
  String get howToConnect => 'Come connettersi';

  @override
  String get whatsAppConnectInstructions =>
      '1. Tocca \"Connetti WhatsApp\" sopra\n2. Apparirà un codice QR — scansionalo con WhatsApp\n   (Impostazioni → Dispositivi Collegati → Collega un Dispositivo)\n3. Una volta connesso, i messaggi in arrivo sono instradati\n   automaticamente al tuo agente IA attivo';

  @override
  String get whatsAppPairingDesc =>
      'I nuovi mittenti ricevono un codice di abbinamento. Li approvi.';

  @override
  String get whatsAppAllowlistDesc =>
      'Solo numeri di telefono specifici possono inviare messaggi al bot.';

  @override
  String get whatsAppOpenDesc =>
      'Chiunque ti invii un messaggio può usare il bot.';

  @override
  String get whatsAppDisabledDesc =>
      'Il bot non risponderà a nessun messaggio in arrivo.';

  @override
  String get sessionExpiredRelink =>
      'Sessione scaduta. Tocca \"Riconnetti\" qui sotto per scansionare un nuovo codice QR.';

  @override
  String get connectWhatsAppBelow =>
      'Tocca \"Connetti WhatsApp\" qui sotto per collegare il tuo account.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp ha accettato il QR. Finalizzazione del collegamento...';

  @override
  String get waitingForWhatsApp =>
      'In attesa che WhatsApp completi il collegamento...';

  @override
  String get focusedLabel => 'Focalizzato';

  @override
  String get balancedLabel => 'Bilanciato';

  @override
  String get creativeLabel => 'Creativo';

  @override
  String get preciseLabel => 'Preciso';

  @override
  String get expressiveLabel => 'Espressivo';

  @override
  String get browseLabel => 'Sfoglia';

  @override
  String get apiTokenLabel => 'Token API';

  @override
  String get connectToClawHub => 'Connetti a ClawHub';

  @override
  String get clawHubLoginHint =>
      'Accedi a ClawHub per accedere ad abilità premium e installare pacchetti';

  @override
  String get howToGetApiToken => 'Come ottenere il tuo token API:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Visita clawhub.ai e accedi con GitHub\n2. Esegui \"clawhub login\" nel terminale\n3. Copia il tuo token e incollalo qui';

  @override
  String connectionFailed(String error) {
    return 'Connessione fallita: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count esecuzioni';
  }

  @override
  String nextRunLabel(String time) {
    return 'Prossima esecuzione: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Ultimo errore: $error';
  }

  @override
  String get cronJobHintText =>
      'Istruzioni per l\'agente quando questa attività si attiva…';

  @override
  String get androidPermissions => 'Permessi Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw può controllare il tuo schermo per tuo conto — toccare pulsanti, compilare moduli, scorrere e automatizzare attività ripetitive in qualsiasi app.';

  @override
  String get twoPermissionsNeeded =>
      'Sono necessari due permessi per l\'esperienza completa. Puoi saltare e abilitarli più tardi nelle Impostazioni.';

  @override
  String get accessibilityService => 'Servizio di Accessibilità';

  @override
  String get accessibilityServiceDesc =>
      'Consente di toccare, scorrere, digitare e leggere il contenuto dello schermo';

  @override
  String get displayOverOtherApps => 'Visualizza sopra Altre App';

  @override
  String get displayOverOtherAppsDesc =>
      'Mostra un chip di stato fluttuante così puoi vedere cosa sta facendo l\'agente';

  @override
  String get changeDefaultModel => 'Cambia modello predefinito';

  @override
  String setModelAsDefault(String name) {
    return 'Imposta $name come modello predefinito.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'i',
      one: 'e',
    );
    return 'Aggiorna anche $count agent$_temp0';
  }

  @override
  String get startNewSessions => 'Avvia nuove sessioni';

  @override
  String get currentConversationsArchived =>
      'Le conversazioni correnti saranno archiviate';

  @override
  String get applyAction => 'Applica';

  @override
  String applyModelQuestion(String name) {
    return 'Applicare $name?';
  }

  @override
  String get setAsDefaultModel => 'Imposta come modello predefinito';

  @override
  String get usedByAgentsWithout =>
      'Usato dagli agenti senza un modello specifico';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'i',
      one: 'e',
    );
    return 'Applica a $count agent$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Fornitore già autenticato — nessuna chiave API necessaria.';

  @override
  String get selectFromList => 'Seleziona dalla lista';

  @override
  String get enterCustomModelId => 'Inserisci un ID modello personalizzato';

  @override
  String get removeSkillTitle => 'Rimuovere abilità?';

  @override
  String get browseClawHubToDiscover =>
      'Sfoglia ClawHub per scoprire e installare abilità';

  @override
  String get addDeviceTooltip => 'Aggiungi dispositivo';

  @override
  String get addNumberTooltip => 'Aggiungi numero';

  @override
  String get searchSkillsHint => 'Cerca abilità...';

  @override
  String get loginToClawHub => 'Accedi a ClawHub';

  @override
  String get accountTooltip => 'Account';

  @override
  String get editAction => 'Modifica';

  @override
  String get setAsDefaultAction => 'Imposta come predefinito';

  @override
  String get chooseProviderTitle => 'Scegli fornitore';

  @override
  String get apiKeyTitle => 'Chiave API';

  @override
  String get slackConfigSaved =>
      'Slack salvato — riavvia il gateway per connetterti';

  @override
  String get signalConfigSaved =>
      'Signal salvato — riavvia gateway per connetterti';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Aggiungi dispositivo';

  @override
  String get skipAction => 'Salta';
}
