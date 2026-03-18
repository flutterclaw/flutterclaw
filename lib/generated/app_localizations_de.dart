// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Kanäle';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Einstellungen';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get yourPersonalAssistant => 'Ihr persönlicher KI-Assistent';

  @override
  String get multiChannelChat => 'Multi-Kanal-Chat';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat und mehr';

  @override
  String get powerfulAIModels => 'Leistungsstarke KI-Modelle';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok und kostenlose Modelle';

  @override
  String get localGateway => 'Lokales Gateway';

  @override
  String get localGatewayDesc =>
      'Läuft auf Ihrem Gerät, Ihre Daten bleiben Ihre';

  @override
  String get chooseProvider => 'Anbieter Wählen';

  @override
  String get selectProviderDesc =>
      'Wählen Sie aus, wie Sie sich mit KI-Modellen verbinden möchten.';

  @override
  String get startForFree => 'Kostenlos Starten';

  @override
  String get freeProvidersDesc =>
      'Diese Anbieter bieten kostenlose Modelle zum kostenlosen Einstieg.';

  @override
  String get free => 'KOSTENLOS';

  @override
  String get otherProviders => 'Andere Anbieter';

  @override
  String connectToProvider(String provider) {
    return 'Verbinden mit $provider';
  }

  @override
  String get enterApiKeyDesc =>
      'Geben Sie Ihren API-Schlüssel ein und wählen Sie ein Modell.';

  @override
  String get dontHaveApiKey => 'Haben Sie keinen API-Schlüssel?';

  @override
  String get createAccountCopyKey =>
      'Erstellen Sie ein Konto und kopieren Sie Ihren Schlüssel.';

  @override
  String get signUp => 'Registrieren';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get pasteFromClipboard => 'Aus Zwischenablage einfügen';

  @override
  String get apiBaseUrl => 'API-Basis-URL';

  @override
  String get selectModel => 'Modell Auswählen';

  @override
  String get modelId => 'Modell-ID';

  @override
  String get validateKey => 'Schlüssel Validieren';

  @override
  String get validating => 'Validierung...';

  @override
  String get invalidApiKey => 'Ungültiger API-Schlüssel';

  @override
  String get gatewayConfiguration => 'Gateway-Konfiguration';

  @override
  String get gatewayConfigDesc =>
      'Das Gateway ist die lokale Steuerungsebene für Ihren Assistenten.';

  @override
  String get defaultSettingsNote =>
      'Die Standardeinstellungen funktionieren für die meisten Benutzer. Ändern Sie sie nur, wenn Sie wissen, was Sie brauchen.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Gateway automatisch starten';

  @override
  String get autoStartGatewayDesc =>
      'Gateway automatisch starten, wenn die App gestartet wird.';

  @override
  String get channelsPageTitle => 'Kanäle';

  @override
  String get channelsPageDesc =>
      'Verbinden Sie optional Messaging-Kanäle. Sie können diese später in den Einstellungen einrichten.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Verbinden Sie einen Telegram-Bot.';

  @override
  String get openBotFather => 'BotFather Öffnen';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Verbinden Sie einen Discord-Bot.';

  @override
  String get developerPortal => 'Entwicklerportal';

  @override
  String get botToken => 'Bot-Token';

  @override
  String telegramBotToken(String platform) {
    return '$platform Bot-Token';
  }

  @override
  String get readyToGo => 'Bereit zum Start';

  @override
  String get reviewConfiguration =>
      'Überprüfen Sie Ihre Konfiguration und starten Sie FlutterClaw.';

  @override
  String get model => 'Modell';

  @override
  String viaProvider(String provider) {
    return 'über $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Nur WebChat (Sie können später mehr hinzufügen)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Startet...';

  @override
  String get startFlutterClaw => 'FlutterClaw Starten';

  @override
  String get newSession => 'Neue Sitzung';

  @override
  String get photoLibrary => 'Fotobibliothek';

  @override
  String get camera => 'Kamera';

  @override
  String get whatDoYouSeeInImage => 'Was sehen Sie in diesem Bild?';

  @override
  String get imagePickerNotAvailable =>
      'Bildauswahl im Simulator nicht verfügbar. Verwenden Sie ein echtes Gerät.';

  @override
  String get couldNotOpenImagePicker =>
      'Bildauswahl konnte nicht geöffnet werden.';

  @override
  String get copiedToClipboard => 'In Zwischenablage kopiert';

  @override
  String get attachImage => 'Bild anhängen';

  @override
  String get messageFlutterClaw => 'Nachricht an FlutterClaw...';

  @override
  String get channelsAndGateway => 'Kanäle und Gateway';

  @override
  String get stop => 'Stoppen';

  @override
  String get start => 'Starten';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Integrierte Chat-Oberfläche';

  @override
  String get notConfigured => 'Nicht konfiguriert';

  @override
  String get connected => 'Verbunden';

  @override
  String get configuredStarting => 'Konfiguriert (startet...)';

  @override
  String get telegramConfiguration => 'Telegram-Konfiguration';

  @override
  String get fromBotFather => 'Von @BotFather';

  @override
  String get allowedUserIds => 'Erlaubte Benutzer-IDs (durch Komma getrennt)';

  @override
  String get leaveEmptyToAllowAll => 'Leer lassen, um alle zuzulassen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get saveAndConnect => 'Speichern und Verbinden';

  @override
  String get discordConfiguration => 'Discord-Konfiguration';

  @override
  String get pendingPairingRequests => 'Ausstehende Kopplungsanfragen';

  @override
  String get approve => 'Genehmigen';

  @override
  String get reject => 'Ablehnen';

  @override
  String get expired => 'Abgelaufen';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m übrig';
  }

  @override
  String get workspaceFiles => 'Arbeitsbereich-Dateien';

  @override
  String get personalAIAssistant => 'Persönlicher KI-Assistent';

  @override
  String sessionsCount(int count) {
    return 'Sitzungen ($count)';
  }

  @override
  String get noActiveSessions => 'Keine aktiven Sitzungen';

  @override
  String get startConversationToCreate =>
      'Starten Sie eine Konversation, um eine zu erstellen';

  @override
  String get startConversationToSee =>
      'Starten Sie eine Konversation, um Sitzungen hier zu sehen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get cronJobs => 'Geplante Aufgaben';

  @override
  String get noCronJobs => 'Keine geplanten Aufgaben';

  @override
  String get addScheduledTasks =>
      'Fügen Sie geplante Aufgaben für Ihren Agenten hinzu';

  @override
  String get runNow => 'Jetzt Ausführen';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get delete => 'Löschen';

  @override
  String get skills => 'Fähigkeiten';

  @override
  String get browseClawHub => 'ClawHub Durchsuchen';

  @override
  String get noSkillsInstalled => 'Keine Fähigkeiten installiert';

  @override
  String get browseClawHubToAdd =>
      'Durchsuchen Sie ClawHub, um Fähigkeiten hinzuzufügen';

  @override
  String removeSkillConfirm(String name) {
    return '\"$name\" aus Ihren Fähigkeiten entfernen?';
  }

  @override
  String get clawHubSkills => 'ClawHub-Fähigkeiten';

  @override
  String get searchSkills => 'Fähigkeiten suchen...';

  @override
  String get noSkillsFound =>
      'Keine Fähigkeiten gefunden. Versuchen Sie eine andere Suche.';

  @override
  String installedSkill(String name) {
    return '$name installiert';
  }

  @override
  String failedToInstallSkill(String name) {
    return '$name konnte nicht installiert werden';
  }

  @override
  String get addCronJob => 'Geplante Aufgabe Hinzufügen';

  @override
  String get jobName => 'Aufgabenname';

  @override
  String get dailySummaryExample => 'z.B. Tägliche Zusammenfassung';

  @override
  String get taskPrompt => 'Aufgabenanweisung';

  @override
  String get whatShouldAgentDo => 'Was soll der Agent tun?';

  @override
  String get interval => 'Intervall';

  @override
  String get every5Minutes => 'Alle 5 Minuten';

  @override
  String get every15Minutes => 'Alle 15 Minuten';

  @override
  String get every30Minutes => 'Alle 30 Minuten';

  @override
  String get everyHour => 'Jede Stunde';

  @override
  String get every6Hours => 'Alle 6 Stunden';

  @override
  String get every12Hours => 'Alle 12 Stunden';

  @override
  String get every24Hours => 'Alle 24 Stunden';

  @override
  String get add => 'Hinzufügen';

  @override
  String get save => 'Speichern';

  @override
  String get sessions => 'Sitzungen';

  @override
  String messagesCount(int count) {
    return '$count Nachrichten';
  }

  @override
  String tokensCount(int count) {
    return '$count Token';
  }

  @override
  String get compact => 'Kompaktieren';

  @override
  String get models => 'Modelle';

  @override
  String get noModelsConfigured => 'Keine Modelle konfiguriert';

  @override
  String get addModelToStartChatting =>
      'Fügen Sie ein Modell hinzu, um mit dem Chatten zu beginnen';

  @override
  String get addModel => 'Modell Hinzufügen';

  @override
  String get default_ => 'STANDARD';

  @override
  String get autoStart => 'Autostart';

  @override
  String get startGatewayWhenLaunches => 'Gateway beim App-Start starten';

  @override
  String get heartbeat => 'Herzschlag';

  @override
  String get enabled => 'Aktiviert';

  @override
  String get periodicAgentTasks =>
      'Periodische Agenten-Aufgaben aus HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes Min';
  }

  @override
  String get about => 'Über';

  @override
  String get personalAIAssistantForIOS =>
      'Persönlicher KI-Assistent für iOS und Android';

  @override
  String get version => 'Version';

  @override
  String get basedOnOpenClaw => 'Basierend auf OpenClaw';

  @override
  String get removeModel => 'Modell entfernen?';

  @override
  String removeModelConfirm(String name) {
    return '\"$name\" aus Ihren Modellen entfernen?';
  }

  @override
  String get remove => 'Entfernen';

  @override
  String get setAsDefault => 'Als Standard Festlegen';

  @override
  String get paste => 'Einfügen';

  @override
  String get chooseProviderStep => '1. Anbieter Wählen';

  @override
  String get selectModelStep => '2. Modell Auswählen';

  @override
  String get apiKeyStep => '3. API-Schlüssel';

  @override
  String getApiKeyAt(String provider) {
    return 'API-Schlüssel bei $provider erhalten';
  }

  @override
  String get justNow => 'gerade eben';

  @override
  String minutesAgo(int minutes) {
    return 'vor ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'vor ${hours}h';
  }

  @override
  String daysAgo(int days) {
    return 'vor ${days}T';
  }

  @override
  String get microphonePermissionDenied => 'Mikrofonberechtigung verweigert';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Live-Transkription nicht verfügbar: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Aufnahme konnte nicht gestartet werden: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Verwende Geräte-Transkription';

  @override
  String get transcribingWithWhisper => 'Transkribiere mit Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API fehlgeschlagen: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Keine Transkription erfasst';

  @override
  String failedToStopRecording(String error) {
    return 'Aufnahme konnte nicht gestoppt werden: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Fehler beim $action: $error';
  }

  @override
  String get pause => 'Pausieren';

  @override
  String get resume => 'Fortsetzen';

  @override
  String get send => 'Senden';

  @override
  String get liveActivityActive => 'Live Activity aktiv';

  @override
  String get restartGateway => 'Gateway neu starten';

  @override
  String modelLabel(String model) {
    return 'Modell: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Betriebszeit: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Hintergrundunterstützung aktiv - Gateway kann weiter antworten';

  @override
  String get webChatBuiltIn => 'Integrierte Chat-Oberfläche';

  @override
  String get configure => 'Konfigurieren';

  @override
  String get disconnect => 'Trennen';

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
}
