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
  String get webChatOnly => 'Nur Chat (Sie können später mehr hinzufügen)';

  @override
  String get webChat => 'Chat';

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
  String get agents => 'Agenten';

  @override
  String get agentFiles => 'Agentendateien';

  @override
  String get createAgent => 'Agent Erstellen';

  @override
  String get editAgent => 'Agent Bearbeiten';

  @override
  String get noAgentsYet => 'Noch keine Agenten';

  @override
  String get createYourFirstAgent => 'Erstellen Sie Ihren ersten Agenten!';

  @override
  String get active => 'Aktiv';

  @override
  String get agentName => 'Agentenname';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Emoji Auswählen';

  @override
  String get vibe => 'Stimmung';

  @override
  String get vibeHint => 'z.B. freundlich, förmlich, sarkastisch';

  @override
  String get modelConfiguration => 'Modellkonfiguration';

  @override
  String get advancedSettings => 'Erweiterte Einstellungen';

  @override
  String get agentCreated => 'Agent erstellt';

  @override
  String get agentUpdated => 'Agent aktualisiert';

  @override
  String get agentDeleted => 'Agent gelöscht';

  @override
  String switchedToAgent(String name) {
    return 'Zu $name gewechselt';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$name löschen? Alle Arbeitsbereichsdaten werden entfernt.';
  }

  @override
  String get agentDetails => 'Agentendetails';

  @override
  String get createdAt => 'Erstellt';

  @override
  String get lastUsed => 'Zuletzt Verwendet';

  @override
  String get basicInformation => 'Grundlegende Informationen';

  @override
  String get switchToAgent => 'Agent Wechseln';

  @override
  String get providers => 'Anbieter';

  @override
  String get addProvider => 'Anbieter hinzufügen';

  @override
  String get noProvidersConfigured => 'Keine Anbieter konfiguriert.';

  @override
  String get editCredentials => 'Anmeldedaten bearbeiten';

  @override
  String get defaultModelHint =>
      'Das Standardmodell wird von Agenten verwendet, die kein eigenes Modell angeben.';

  @override
  String get holdToSetAsDefault =>
      'Halten Sie gedrückt, um als Standard festzulegen';

  @override
  String get integrations => 'Integrationen';

  @override
  String get shortcutsIntegrations => 'Shortcuts-Integrationen';

  @override
  String get shortcutsIntegrationsDesc =>
      'Installieren Sie iOS Shortcuts, um Aktionen von Drittanbieter-Apps auszuführen';

  @override
  String get dangerZone => 'Gefahrenzone';

  @override
  String get resetOnboarding => 'Onboarding zurücksetzen und erneut ausführen';

  @override
  String get resetOnboardingDesc =>
      'Löscht alle Konfigurationen und kehrt zum Einrichtungsassistenten zurück.';

  @override
  String get resetAllConfiguration => 'Alle Konfigurationen zurücksetzen?';

  @override
  String get resetAllConfigurationDesc =>
      'Dies löscht Ihre API-Schlüssel, Modelle und alle Einstellungen. Die App kehrt zum Einrichtungsassistenten zurück.\n\nIhr Gesprächsverlauf wird nicht gelöscht.';

  @override
  String get removeProvider => 'Anbieter entfernen';

  @override
  String removeProviderConfirm(String provider) {
    return 'Anmeldedaten für $provider entfernen?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name als Standardmodell festgelegt';
  }

  @override
  String get photoImage => 'Foto / Bild';

  @override
  String get documentPdfTxt => 'Dokument (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Dokument konnte nicht geöffnet werden: $error';
  }

  @override
  String get retry => 'Wiederholen';

  @override
  String get gatewayStopped => 'Gateway gestoppt';

  @override
  String get gatewayStarted => 'Gateway erfolgreich gestartet!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway fehlgeschlagen: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Ausnahme: $error';
  }

  @override
  String get pairingRequestApproved => 'Kopplungsanfrage genehmigt';

  @override
  String get pairingRequestRejected => 'Kopplungsanfrage abgelehnt';

  @override
  String get addDevice => 'Gerät Hinzufügen';

  @override
  String get telegramConfigSaved => 'Telegram-Konfiguration gespeichert';

  @override
  String get discordConfigSaved => 'Discord-Konfiguration gespeichert';

  @override
  String get securityMethod => 'Sicherheitsmethode';

  @override
  String get pairingRecommended => 'Kopplung (Empfohlen)';

  @override
  String get pairingDescription =>
      'Neue Benutzer erhalten einen Kopplungscode. Sie genehmigen oder lehnen sie ab.';

  @override
  String get allowlistTitle => 'Zulassungsliste';

  @override
  String get allowlistDescription =>
      'Nur bestimmte Benutzer-IDs können auf den Bot zugreifen.';

  @override
  String get openAccess => 'Offen';

  @override
  String get openAccessDescription =>
      'Jeder kann den Bot sofort verwenden (nicht empfohlen).';

  @override
  String get disabledAccess => 'Deaktiviert';

  @override
  String get disabledAccessDescription =>
      'Keine Direktnachrichten erlaubt. Bot antwortet auf keine Nachrichten.';

  @override
  String get approvedDevices => 'Genehmigte Geräte';

  @override
  String get noApprovedDevicesYet => 'Noch keine genehmigten Geräte';

  @override
  String get devicesAppearAfterApproval =>
      'Geräte erscheinen hier, nachdem Sie ihre Kopplungsanfragen genehmigt haben';

  @override
  String get noAllowedUsersConfigured =>
      'Keine erlaubten Benutzer konfiguriert';

  @override
  String get addUserIdsHint =>
      'Fügen Sie Benutzer-IDs hinzu, um ihnen die Nutzung des Bots zu ermöglichen';

  @override
  String get removeDevice => 'Gerät entfernen?';

  @override
  String removeAccessFor(String name) {
    return 'Zugriff für $name entfernen?';
  }

  @override
  String get saving => 'Speichern...';

  @override
  String get channelsLabel => 'Kanäle';

  @override
  String get clawHubAccount => 'ClawHub-Konto';

  @override
  String get loggedInToClawHub => 'Sie sind derzeit bei ClawHub angemeldet.';

  @override
  String get loggedOutFromClawHub => 'Von ClawHub abgemeldet';

  @override
  String get login => 'Anmelden';

  @override
  String get logout => 'Abmelden';

  @override
  String get connect => 'Verbinden';

  @override
  String get pasteClawHubToken => 'Fügen Sie Ihr ClawHub API-Token ein';

  @override
  String get pleaseEnterApiToken => 'Bitte geben Sie ein API-Token ein';

  @override
  String get successfullyConnected => 'Erfolgreich mit ClawHub verbunden';

  @override
  String get browseSkillsButton => 'Fähigkeiten Durchsuchen';

  @override
  String get installSkill => 'Fähigkeit Installieren';

  @override
  String get incompatibleSkill => 'Inkompatible Fähigkeit';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Diese Fähigkeit kann nicht auf Mobilgeräten (iOS/Android) ausgeführt werden.\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Kompatibilitätswarnung';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Diese Fähigkeit wurde für Desktop entwickelt und funktioniert möglicherweise nicht auf Mobilgeräten.\n\n$reason\n\nMöchten Sie eine angepasste Version installieren, die für Mobilgeräte optimiert ist?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Original Installieren';

  @override
  String get installAdapted => 'Angepasst Installieren';

  @override
  String get resetSession => 'Sitzung Zurücksetzen';

  @override
  String resetSessionConfirm(String key) {
    return 'Sitzung \"$key\" zurücksetzen? Alle Nachrichten werden gelöscht.';
  }

  @override
  String get sessionReset => 'Sitzung zurückgesetzt';

  @override
  String get activeSessions => 'Aktive Sitzungen';

  @override
  String get scheduledTasks => 'Geplante Aufgaben';

  @override
  String get defaultBadge => 'Standard';

  @override
  String errorGeneric(String error) {
    return 'Fehler: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName gespeichert';
  }

  @override
  String errorSavingFile(String error) {
    return 'Fehler beim Speichern der Datei: $error';
  }

  @override
  String get cannotDeleteLastAgent =>
      'Der letzte Agent kann nicht gelöscht werden';

  @override
  String get close => 'Schließen';

  @override
  String get nameIsRequired => 'Name ist erforderlich';

  @override
  String get pleaseSelectModel => 'Bitte wählen Sie ein Modell aus';

  @override
  String temperatureLabel(String value) {
    return 'Temperatur: $value';
  }

  @override
  String get maxTokens => 'Maximale Token';

  @override
  String get maxTokensRequired => 'Maximale Token ist erforderlich';

  @override
  String get mustBePositiveNumber => 'Muss eine positive Zahl sein';

  @override
  String get maxToolIterations => 'Maximale Tool-Iterationen';

  @override
  String get maxIterationsRequired => 'Maximale Iterationen ist erforderlich';

  @override
  String get restrictToWorkspace => 'Auf Arbeitsbereich Beschränken';

  @override
  String get restrictToWorkspaceDesc =>
      'Dateioperationen auf Agenten-Arbeitsbereich beschränken';

  @override
  String get noModelsConfiguredLong =>
      'Bitte fügen Sie mindestens ein Modell in den Einstellungen hinzu, bevor Sie einen Agenten erstellen.';

  @override
  String get selectProviderFirst => 'Wählen Sie zuerst einen Anbieter aus';

  @override
  String get skip => 'Überspringen';

  @override
  String get continueButton => 'Fortfahren';

  @override
  String get uiAutomation => 'UI-Automatisierung';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw kann Ihren Bildschirm in Ihrem Namen steuern — Schaltflächen drücken, Formulare ausfüllen, scrollen und sich wiederholende Aufgaben in jeder App automatisieren.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Dies erfordert die Aktivierung des Bedienungshilfen-Dienstes in den Android-Einstellungen. Sie können dies überspringen und später aktivieren.';

  @override
  String get openAccessibilitySettings =>
      'Bedienungshilfen-Einstellungen Öffnen';

  @override
  String get skipForNow => 'Vorerst überspringen';

  @override
  String get checkingPermission => 'Berechtigung wird überprüft…';

  @override
  String get accessibilityEnabled => 'Bedienungshilfen-Dienst ist aktiviert';

  @override
  String get accessibilityNotEnabled =>
      'Bedienungshilfen-Dienst ist nicht aktiviert';

  @override
  String get exploreIntegrations => 'Integrationen Erkunden';

  @override
  String get requestTimedOut => 'Anfrage Zeitüberschreitung';

  @override
  String get myShortcuts => 'Meine Shortcuts';

  @override
  String get addShortcut => 'Shortcut Hinzufügen';

  @override
  String get noShortcutsYet => 'Noch keine Shortcuts';

  @override
  String get shortcutsInstructions =>
      'Erstellen Sie einen Shortcut in der iOS Shortcuts-App, fügen Sie die Callback-Aktion am Ende hinzu und registrieren Sie ihn hier, damit die KI ihn ausführen kann.';

  @override
  String get shortcutName => 'Shortcut-Name';

  @override
  String get shortcutNameHint => 'Genauer Name aus der Shortcuts-App';

  @override
  String get descriptionOptional => 'Beschreibung (optional)';

  @override
  String get whatDoesShortcutDo => 'Was macht dieser Shortcut?';

  @override
  String get callbackSetup => 'Callback-Einrichtung';

  @override
  String get callbackInstructions =>
      'Jeder Shortcut muss enden mit:\n① Get Value for Key → \"callbackUrl\" (von Shortcut Input als dict geparst)\n② Open URLs ← Ausgabe von ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Herzschlag';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Unteragent';

  @override
  String get channelSystem => 'System';

  @override
  String secondsAgo(int seconds) {
    return 'vor ${seconds}s';
  }

  @override
  String get messagesAbbrev => 'Nachr.';

  @override
  String get modelAlreadyAdded => 'Dieses Modell ist bereits in Ihrer Liste';

  @override
  String get bothTokensRequired => 'Beide Token sind erforderlich';

  @override
  String get slackSavedRestart =>
      'Slack gespeichert — Gateway neu starten, um zu verbinden';

  @override
  String get slackConfiguration => 'Slack-Konfiguration';

  @override
  String get setupTitle => 'Einrichtung';

  @override
  String get slackSetupInstructions =>
      '1. Erstellen Sie eine Slack-App unter api.slack.com/apps\n2. Socket-Modus aktivieren → App-Level-Token generieren (xapp-…)\n   mit Scope: connections:write\n3. Bot-Token-Scopes hinzufügen: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. App im Workspace installieren → Bot-Token kopieren (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot-Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level-Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'API-URL und Telefonnummer sind erforderlich';

  @override
  String get signalSavedRestart =>
      'Signal gespeichert — Gateway neu starten, um zu verbinden';

  @override
  String get signalConfiguration => 'Signal-Konfiguration';

  @override
  String get requirementsTitle => 'Anforderungen';

  @override
  String get signalRequirements =>
      'Erfordert signal-cli-rest-api auf einem Server:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegistrieren/verknüpfen Sie Ihre Signal-Nummer über die REST-API und geben Sie dann unten die URL und Ihre Telefonnummer ein.';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL';

  @override
  String get signalPhoneNumber => 'Ihre Signal-Telefonnummer';

  @override
  String get userIdLabel => 'Benutzer-ID';

  @override
  String get enterDiscordUserId => 'Discord-Benutzer-ID eingeben';

  @override
  String get enterTelegramUserId => 'Telegram-Benutzer-ID eingeben';

  @override
  String get fromDiscordDevPortal => 'Vom Discord-Entwicklerportal';

  @override
  String get allowedUserIdsTitle => 'Erlaubte Benutzer-IDs';

  @override
  String get approvedDevice => 'Genehmigtes Gerät';

  @override
  String get allowedUser => 'Erlaubter Benutzer';

  @override
  String get howToGetBotToken => 'So erhalten Sie Ihr Bot-Token';

  @override
  String get discordTokenInstructions =>
      '1. Gehen Sie zum Discord-Entwicklerportal\n2. Erstellen Sie eine neue Anwendung und einen Bot\n3. Kopieren Sie das Token und fügen Sie es oben ein\n4. Aktivieren Sie Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Öffnen Sie Telegram und suchen Sie nach @BotFather\n2. Senden Sie /newbot und folgen Sie den Anweisungen\n3. Kopieren Sie das Token und fügen Sie es oben ein';

  @override
  String get fromBotFatherHint => 'Von @BotFather erhalten';

  @override
  String get accessTokenLabel => 'Zugriffstoken';

  @override
  String get notSetOpenAccess =>
      'Nicht festgelegt — offener Zugriff (nur Loopback)';

  @override
  String get gatewayAccessToken => 'Gateway-Zugriffstoken';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Leer lassen, um Authentifizierung zu deaktivieren';

  @override
  String get toolPolicies => 'Tool-Richtlinien';

  @override
  String get toolPoliciesDesc =>
      'Steuern Sie, worauf der Agent zugreifen kann. Deaktivierte Tools werden vor der KI verborgen und zur Laufzeit blockiert.';

  @override
  String get privacySensors => 'Datenschutz & Sensoren';

  @override
  String get networkCategory => 'Netzwerk';

  @override
  String get systemCategory => 'System';

  @override
  String get toolTakePhotos => 'Fotos Aufnehmen';

  @override
  String get toolTakePhotosDesc =>
      'Erlauben Sie dem Agenten, Fotos mit der Kamera aufzunehmen';

  @override
  String get toolRecordVideo => 'Video Aufnehmen';

  @override
  String get toolRecordVideoDesc =>
      'Erlauben Sie dem Agenten, Videos aufzunehmen';

  @override
  String get toolLocation => 'Standort';

  @override
  String get toolLocationDesc =>
      'Erlauben Sie dem Agenten, Ihren aktuellen GPS-Standort zu lesen';

  @override
  String get toolHealthData => 'Gesundheitsdaten';

  @override
  String get toolHealthDataDesc =>
      'Erlauben Sie dem Agenten, Gesundheits-/Fitnessdaten zu lesen';

  @override
  String get toolContacts => 'Kontakte';

  @override
  String get toolContactsDesc =>
      'Erlauben Sie dem Agenten, Ihre Kontakte zu durchsuchen';

  @override
  String get toolScreenshots => 'Screenshots';

  @override
  String get toolScreenshotsDesc =>
      'Erlauben Sie dem Agenten, Screenshots des Bildschirms aufzunehmen';

  @override
  String get toolWebFetch => 'Web-Abruf';

  @override
  String get toolWebFetchDesc =>
      'Erlauben Sie dem Agenten, Inhalte von URLs abzurufen';

  @override
  String get toolWebSearch => 'Websuche';

  @override
  String get toolWebSearchDesc => 'Erlauben Sie dem Agenten, im Web zu suchen';

  @override
  String get toolHttpRequests => 'HTTP-Anfragen';

  @override
  String get toolHttpRequestsDesc =>
      'Erlauben Sie dem Agenten, beliebige HTTP-Anfragen zu stellen';

  @override
  String get toolSandboxShell => 'Sandbox-Shell';

  @override
  String get toolSandboxShellDesc =>
      'Erlauben Sie dem Agenten, Shell-Befehle in der Sandbox auszuführen';

  @override
  String get toolImageGeneration => 'Bildgenerierung';

  @override
  String get toolImageGenerationDesc =>
      'Erlauben Sie dem Agenten, Bilder über KI zu generieren';

  @override
  String get toolLaunchApps => 'Apps Starten';

  @override
  String get toolLaunchAppsDesc =>
      'Erlauben Sie dem Agenten, installierte Apps zu öffnen';

  @override
  String get toolLaunchIntents => 'Intents Starten';

  @override
  String get toolLaunchIntentsDesc =>
      'Erlauben Sie dem Agenten, Android-Intents auszulösen (Deep-Links, Systembildschirme)';

  @override
  String get renameSession => 'Sitzung umbenennen';

  @override
  String get myConversationName => 'Mein Gesprächsname';

  @override
  String get renameAction => 'Umbenennen';

  @override
  String get couldNotTranscribeAudio =>
      'Audio konnte nicht transkribiert werden';

  @override
  String get stopRecording => 'Aufnahme stoppen';

  @override
  String get voiceInput => 'Spracheingabe';

  @override
  String get copyTooltip => 'Kopieren';

  @override
  String get commandsTooltip => 'Befehle';

  @override
  String get providersAndModels => 'Anbieter & Modelle';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Modelle konfiguriert',
      one: '1 Modell konfiguriert',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Autostart aktiviert';

  @override
  String get autoStartOffLabel => 'Autostart aus';

  @override
  String get allToolsEnabled => 'Alle Tools aktiviert';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tools deaktiviert',
      one: '1 Tool deaktiviert',
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
  String get officialWebsite => 'Offizielle Website';

  @override
  String get noPendingPairingRequests => 'Keine ausstehenden Kopplungsanfragen';

  @override
  String get pairingRequestsTitle => 'Kopplungsanfragen';

  @override
  String get gatewayStartingStatus => 'Gateway wird gestartet...';

  @override
  String get gatewayRetryingStatus => 'Gateway-Start wird wiederholt...';

  @override
  String get errorStartingGateway => 'Fehler beim Starten des Gateways';

  @override
  String get runningStatus => 'Läuft';

  @override
  String get stoppedStatus => 'Gestoppt';

  @override
  String get notSetUpStatus => 'Nicht eingerichtet';

  @override
  String get configuredStatus => 'Konfiguriert';

  @override
  String get whatsAppConfigSaved => 'WhatsApp-Konfiguration gespeichert';

  @override
  String get whatsAppDisconnected => 'WhatsApp getrennt';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Wird angewendet...';

  @override
  String get reconnectWhatsApp => 'WhatsApp erneut verbinden';

  @override
  String get saveSettingsLabel => 'Einstellungen Speichern';

  @override
  String get applySettingsRestart => 'Einstellungen Anwenden & Neu Starten';

  @override
  String get whatsAppMode => 'WhatsApp-Modus';

  @override
  String get myPersonalNumber => 'Meine persönliche Nummer';

  @override
  String get myPersonalNumberDesc =>
      'Nachrichten, die Sie an Ihren eigenen WhatsApp-Chat senden, aktivieren den Agenten.';

  @override
  String get dedicatedBotAccount => 'Dediziertes Bot-Konto';

  @override
  String get dedicatedBotAccountDesc =>
      'Nachrichten, die vom verknüpften Konto selbst gesendet werden, werden als ausgehend ignoriert.';

  @override
  String get allowedNumbers => 'Erlaubte Nummern';

  @override
  String get addNumberTitle => 'Nummer Hinzufügen';

  @override
  String get phoneNumberJid => 'Telefonnummer / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Keine erlaubten Nummern konfiguriert';

  @override
  String get devicesAppearAfterPairing =>
      'Geräte erscheinen hier, nachdem Sie Kopplungsanfragen genehmigt haben';

  @override
  String get addPhoneNumbersHint =>
      'Fügen Sie Telefonnummern hinzu, um ihnen die Nutzung des Bots zu ermöglichen';

  @override
  String get allowedNumber => 'Erlaubte Nummer';

  @override
  String get howToConnect => 'So verbinden';

  @override
  String get whatsAppConnectInstructions =>
      '1. Tippen Sie oben auf \"WhatsApp Verbinden\"\n2. Ein QR-Code erscheint — scannen Sie ihn mit WhatsApp\n   (Einstellungen → Verknüpfte Geräte → Gerät Verknüpfen)\n3. Nach der Verbindung werden eingehende Nachrichten automatisch\n   an Ihren aktiven KI-Agenten weitergeleitet';

  @override
  String get whatsAppPairingDesc =>
      'Neue Absender erhalten einen Kopplungscode. Sie genehmigen sie.';

  @override
  String get whatsAppAllowlistDesc =>
      'Nur bestimmte Telefonnummern können dem Bot Nachrichten senden.';

  @override
  String get whatsAppOpenDesc =>
      'Jeder, der Ihnen eine Nachricht sendet, kann den Bot verwenden.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot antwortet auf keine eingehenden Nachrichten.';

  @override
  String get sessionExpiredRelink =>
      'Sitzung abgelaufen. Tippen Sie unten auf \"Erneut verbinden\", um einen neuen QR-Code zu scannen.';

  @override
  String get connectWhatsAppBelow =>
      'Tippen Sie unten auf \"WhatsApp Verbinden\", um Ihr Konto zu verknüpfen.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp hat den QR-Code akzeptiert. Die Verknüpfung wird abgeschlossen...';

  @override
  String get waitingForWhatsApp =>
      'Warten auf WhatsApp, um die Verknüpfung abzuschließen...';

  @override
  String get focusedLabel => 'Fokussiert';

  @override
  String get balancedLabel => 'Ausgewogen';

  @override
  String get creativeLabel => 'Kreativ';

  @override
  String get preciseLabel => 'Präzise';

  @override
  String get expressiveLabel => 'Ausdrucksstark';

  @override
  String get browseLabel => 'Durchsuchen';

  @override
  String get apiTokenLabel => 'API-Token';

  @override
  String get connectToClawHub => 'Mit ClawHub Verbinden';

  @override
  String get clawHubLoginHint =>
      'Melden Sie sich bei ClawHub an, um auf Premium-Fähigkeiten zuzugreifen und Pakete zu installieren';

  @override
  String get howToGetApiToken => 'So erhalten Sie Ihr API-Token:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Besuchen Sie clawhub.ai und melden Sie sich mit GitHub an\n2. Führen Sie \"clawhub login\" im Terminal aus\n3. Kopieren Sie Ihr Token und fügen Sie es hier ein';

  @override
  String connectionFailed(String error) {
    return 'Verbindung fehlgeschlagen: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count Ausführungen';
  }

  @override
  String nextRunLabel(String time) {
    return 'Nächste Ausführung: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Letzter Fehler: $error';
  }

  @override
  String get cronJobHintText =>
      'Anweisungen für den Agenten, wenn diese Aufgabe ausgelöst wird…';

  @override
  String get androidPermissions => 'Android-Berechtigungen';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw kann Ihren Bildschirm in Ihrem Namen steuern — Schaltflächen drücken, Formulare ausfüllen, scrollen und sich wiederholende Aufgaben in jeder App automatisieren.';

  @override
  String get twoPermissionsNeeded =>
      'Zwei Berechtigungen sind für die vollständige Erfahrung erforderlich. Sie können dies überspringen und später in den Einstellungen aktivieren.';

  @override
  String get accessibilityService => 'Bedienungshilfen-Dienst';

  @override
  String get accessibilityServiceDesc =>
      'Ermöglicht Tippen, Wischen, Tippen und Lesen von Bildschirminhalten';

  @override
  String get displayOverOtherApps => 'Über Anderen Apps Anzeigen';

  @override
  String get displayOverOtherAppsDesc =>
      'Zeigt ein schwebendes Status-Chip an, damit Sie sehen können, was der Agent tut';

  @override
  String get changeDefaultModel => 'Standardmodell ändern';

  @override
  String setModelAsDefault(String name) {
    return '$name als Standardmodell festlegen.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en',
      one: '',
    );
    return 'Auch $count Agent$_temp0 aktualisieren';
  }

  @override
  String get startNewSessions => 'Neue Sitzungen starten';

  @override
  String get currentConversationsArchived =>
      'Aktuelle Gespräche werden archiviert';

  @override
  String get applyAction => 'Anwenden';

  @override
  String applyModelQuestion(String name) {
    return '$name anwenden?';
  }

  @override
  String get setAsDefaultModel => 'Als Standardmodell festlegen';

  @override
  String get usedByAgentsWithout =>
      'Wird von Agenten ohne spezifisches Modell verwendet';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en',
      one: '',
    );
    return 'Auf $count Agent$_temp0 anwenden';
  }

  @override
  String get providerAlreadyAuth =>
      'Anbieter bereits authentifiziert — kein API-Schlüssel erforderlich.';

  @override
  String get selectFromList => 'Aus Liste auswählen';

  @override
  String get enterCustomModelId => 'Benutzerdefinierte Modell-ID eingeben';

  @override
  String get removeSkillTitle => 'Fähigkeit entfernen?';

  @override
  String get browseClawHubToDiscover =>
      'Durchsuchen Sie ClawHub, um Fähigkeiten zu entdecken und zu installieren';

  @override
  String get addDeviceTooltip => 'Gerät hinzufügen';

  @override
  String get addNumberTooltip => 'Nummer hinzufügen';

  @override
  String get searchSkillsHint => 'Fähigkeiten suchen...';

  @override
  String get loginToClawHub => 'Bei ClawHub Anmelden';

  @override
  String get accountTooltip => 'Konto';

  @override
  String get editAction => 'Bearbeiten';

  @override
  String get setAsDefaultAction => 'Als Standard festlegen';

  @override
  String get chooseProviderTitle => 'Anbieter wählen';

  @override
  String get apiKeyTitle => 'API-Schlüssel';

  @override
  String get slackConfigSaved =>
      'Slack gespeichert — Gateway neu starten, um zu verbinden';

  @override
  String get signalConfigSaved =>
      'Signal gespeichert — Gateway neu starten, um zu verbinden';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Gerät hinzufügen';

  @override
  String get skipAction => 'Überspringen';
}
