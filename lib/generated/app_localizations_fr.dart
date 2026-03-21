// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Canaux';

  @override
  String get agent => 'Agent';

  @override
  String get settings => 'Paramètres';

  @override
  String get getStarted => 'Commencer';

  @override
  String get yourPersonalAssistant => 'Votre assistant personnel IA';

  @override
  String get multiChannelChat => 'Chat multicanal';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat et plus';

  @override
  String get powerfulAIModels => 'Modèles IA puissants';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok et modèles gratuits';

  @override
  String get localGateway => 'Passerelle locale';

  @override
  String get localGatewayDesc =>
      'Fonctionne sur votre appareil, vos données restent les vôtres';

  @override
  String get chooseProvider => 'Choisir un Fournisseur';

  @override
  String get selectProviderDesc =>
      'Sélectionnez comment vous souhaitez vous connecter aux modèles IA.';

  @override
  String get startForFree => 'Commencer Gratuitement';

  @override
  String get freeProvidersDesc =>
      'Ces fournisseurs offrent des modèles gratuits pour commencer sans frais.';

  @override
  String get free => 'GRATUIT';

  @override
  String get otherProviders => 'Autres Fournisseurs';

  @override
  String connectToProvider(String provider) {
    return 'Se connecter à $provider';
  }

  @override
  String get enterApiKeyDesc =>
      'Entrez votre clé API et sélectionnez un modèle.';

  @override
  String get dontHaveApiKey => 'Vous n\'avez pas de clé API?';

  @override
  String get createAccountCopyKey => 'Créez un compte et copiez votre clé.';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get apiKey => 'Clé API';

  @override
  String get pasteFromClipboard => 'Coller du presse-papiers';

  @override
  String get apiBaseUrl => 'URL de Base API';

  @override
  String get selectModel => 'Sélectionner Modèle';

  @override
  String get modelId => 'ID du Modèle';

  @override
  String get validateKey => 'Valider la Clé';

  @override
  String get validating => 'Validation...';

  @override
  String get invalidApiKey => 'Clé API invalide';

  @override
  String get gatewayConfiguration => 'Configuration de la Passerelle';

  @override
  String get gatewayConfigDesc =>
      'La passerelle est le plan de contrôle local pour votre assistant.';

  @override
  String get defaultSettingsNote =>
      'Les paramètres par défaut fonctionnent pour la plupart des utilisateurs. Ne les modifiez que si vous savez ce dont vous avez besoin.';

  @override
  String get host => 'Hôte';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Démarrage automatique de la passerelle';

  @override
  String get autoStartGatewayDesc =>
      'Démarrer la passerelle automatiquement au lancement de l\'application.';

  @override
  String get channelsPageTitle => 'Canaux';

  @override
  String get channelsPageDesc =>
      'Connectez des canaux de messagerie en option. Vous pouvez toujours les configurer plus tard dans les Paramètres.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Connectez un bot Telegram.';

  @override
  String get openBotFather => 'Ouvrir BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Connectez un bot Discord.';

  @override
  String get developerPortal => 'Portail Développeur';

  @override
  String get botToken => 'Jeton du Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Jeton du Bot $platform';
  }

  @override
  String get readyToGo => 'Prêt à Démarrer';

  @override
  String get reviewConfiguration =>
      'Vérifiez votre configuration et démarrez FlutterClaw.';

  @override
  String get model => 'Modèle';

  @override
  String viaProvider(String provider) {
    return 'via $provider';
  }

  @override
  String get gateway => 'Passerelle';

  @override
  String get webChatOnly =>
      'WebChat uniquement (vous pouvez en ajouter plus tard)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Démarrage...';

  @override
  String get startFlutterClaw => 'Démarrer FlutterClaw';

  @override
  String get newSession => 'Nouvelle session';

  @override
  String get photoLibrary => 'Bibliothèque de photos';

  @override
  String get camera => 'Caméra';

  @override
  String get whatDoYouSeeInImage => 'Que voyez-vous dans cette image?';

  @override
  String get imagePickerNotAvailable =>
      'Le sélecteur d\'images n\'est pas disponible sur le Simulateur. Utilisez un appareil réel.';

  @override
  String get couldNotOpenImagePicker =>
      'Impossible d\'ouvrir le sélecteur d\'images.';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get attachImage => 'Joindre une image';

  @override
  String get messageFlutterClaw => 'Message à FlutterClaw...';

  @override
  String get channelsAndGateway => 'Canaux et Passerelle';

  @override
  String get stop => 'Arrêter';

  @override
  String get start => 'Démarrer';

  @override
  String status(String status) {
    return 'Statut: $status';
  }

  @override
  String get builtInChatInterface => 'Interface de chat intégrée';

  @override
  String get notConfigured => 'Non configuré';

  @override
  String get connected => 'Connecté';

  @override
  String get configuredStarting => 'Configuré (démarrage...)';

  @override
  String get telegramConfiguration => 'Configuration Telegram';

  @override
  String get fromBotFather => 'De @BotFather';

  @override
  String get allowedUserIds =>
      'IDs d\'utilisateurs autorisés (séparés par des virgules)';

  @override
  String get leaveEmptyToAllowAll => 'Laisser vide pour autoriser tous';

  @override
  String get cancel => 'Annuler';

  @override
  String get saveAndConnect => 'Enregistrer et Connecter';

  @override
  String get discordConfiguration => 'Configuration Discord';

  @override
  String get pendingPairingRequests => 'Demandes d\'Appairage en Attente';

  @override
  String get approve => 'Approuver';

  @override
  String get reject => 'Rejeter';

  @override
  String get expired => 'Expiré';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m restantes';
  }

  @override
  String get workspaceFiles => 'Fichiers de l\'Espace de Travail';

  @override
  String get personalAIAssistant => 'Assistant Personnel IA';

  @override
  String sessionsCount(int count) {
    return 'Sessions ($count)';
  }

  @override
  String get noActiveSessions => 'Aucune session active';

  @override
  String get startConversationToCreate =>
      'Démarrez une conversation pour en créer une';

  @override
  String get startConversationToSee =>
      'Démarrez une conversation pour voir les sessions ici';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get cronJobs => 'Tâches Planifiées';

  @override
  String get noCronJobs => 'Aucune tâche planifiée';

  @override
  String get addScheduledTasks =>
      'Ajoutez des tâches planifiées pour votre agent';

  @override
  String get runNow => 'Exécuter Maintenant';

  @override
  String get enable => 'Activer';

  @override
  String get disable => 'Désactiver';

  @override
  String get delete => 'Supprimer';

  @override
  String get skills => 'Compétences';

  @override
  String get browseClawHub => 'Parcourir ClawHub';

  @override
  String get noSkillsInstalled => 'Aucune compétence installée';

  @override
  String get browseClawHubToAdd =>
      'Parcourez ClawHub pour ajouter des compétences';

  @override
  String removeSkillConfirm(String name) {
    return 'Supprimer \"$name\" de vos compétences?';
  }

  @override
  String get clawHubSkills => 'Compétences ClawHub';

  @override
  String get searchSkills => 'Rechercher des compétences...';

  @override
  String get noSkillsFound =>
      'Aucune compétence trouvée. Essayez une recherche différente.';

  @override
  String installedSkill(String name) {
    return '$name installé';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Échec de l\'installation de $name';
  }

  @override
  String get addCronJob => 'Ajouter une Tâche Planifiée';

  @override
  String get jobName => 'Nom de la Tâche';

  @override
  String get dailySummaryExample => 'ex. Résumé Quotidien';

  @override
  String get taskPrompt => 'Instruction de la Tâche';

  @override
  String get whatShouldAgentDo => 'Que doit faire l\'agent?';

  @override
  String get interval => 'Intervalle';

  @override
  String get every5Minutes => 'Toutes les 5 minutes';

  @override
  String get every15Minutes => 'Toutes les 15 minutes';

  @override
  String get every30Minutes => 'Toutes les 30 minutes';

  @override
  String get everyHour => 'Toutes les heures';

  @override
  String get every6Hours => 'Toutes les 6 heures';

  @override
  String get every12Hours => 'Toutes les 12 heures';

  @override
  String get every24Hours => 'Toutes les 24 heures';

  @override
  String get add => 'Ajouter';

  @override
  String get save => 'Enregistrer';

  @override
  String get sessions => 'Sessions';

  @override
  String messagesCount(int count) {
    return '$count messages';
  }

  @override
  String tokensCount(int count) {
    return '$count jetons';
  }

  @override
  String get compact => 'Compacter';

  @override
  String get models => 'Modèles';

  @override
  String get noModelsConfigured => 'Aucun modèle configuré';

  @override
  String get addModelToStartChatting =>
      'Ajoutez un modèle pour commencer à discuter';

  @override
  String get addModel => 'Ajouter un Modèle';

  @override
  String get default_ => 'PAR DÉFAUT';

  @override
  String get autoStart => 'Démarrage automatique';

  @override
  String get startGatewayWhenLaunches =>
      'Démarrer la passerelle au lancement de l\'application';

  @override
  String get heartbeat => 'Battement de Coeur';

  @override
  String get enabled => 'Activé';

  @override
  String get periodicAgentTasks =>
      'Tâches périodiques de l\'agent depuis HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'À Propos';

  @override
  String get personalAIAssistantForIOS =>
      'Assistant Personnel IA pour iOS et Android';

  @override
  String get version => 'Version';

  @override
  String get basedOnOpenClaw => 'Basé sur OpenClaw';

  @override
  String get removeModel => 'Supprimer le modèle?';

  @override
  String removeModelConfirm(String name) {
    return 'Supprimer \"$name\" de vos modèles?';
  }

  @override
  String get remove => 'Supprimer';

  @override
  String get setAsDefault => 'Définir par Défaut';

  @override
  String get paste => 'Coller';

  @override
  String get chooseProviderStep => '1. Choisir le Fournisseur';

  @override
  String get selectModelStep => '2. Sélectionner le Modèle';

  @override
  String get apiKeyStep => '3. Clé API';

  @override
  String getApiKeyAt(String provider) {
    return 'Obtenir la clé API chez $provider';
  }

  @override
  String get justNow => 'à l\'instant';

  @override
  String minutesAgo(int minutes) {
    return 'il y a ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'il y a ${hours}h';
  }

  @override
  String daysAgo(int days) {
    return 'il y a ${days}j';
  }

  @override
  String get microphonePermissionDenied => 'Permission du microphone refusée';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Transcription en direct indisponible: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Échec du démarrage de l\'enregistrement: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Utilisation de la transcription sur l\'appareil';

  @override
  String get transcribingWithWhisper => 'Transcription avec Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API a échoué: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Aucune transcription capturée';

  @override
  String failedToStopRecording(String error) {
    return 'Échec de l\'arrêt de l\'enregistrement: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Échec de $action: $error';
  }

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Reprendre';

  @override
  String get send => 'Envoyer';

  @override
  String get liveActivityActive => 'Live Activity active';

  @override
  String get restartGateway => 'Redémarrer Gateway';

  @override
  String modelLabel(String model) {
    return 'Modèle: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Temps de fonctionnement: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Prise en charge en arrière-plan active - la passerelle peut continuer à répondre';

  @override
  String get webChatBuiltIn => 'Interface de chat intégrée';

  @override
  String get configure => 'Configurer';

  @override
  String get disconnect => 'Déconnecter';

  @override
  String get agents => 'Agents';

  @override
  String get agentFiles => 'Fichiers de l\'Agent';

  @override
  String get createAgent => 'Créer un Agent';

  @override
  String get editAgent => 'Modifier l\'Agent';

  @override
  String get noAgentsYet => 'Aucun agent pour l\'instant';

  @override
  String get createYourFirstAgent => 'Créez votre premier agent !';

  @override
  String get active => 'Actif';

  @override
  String get agentName => 'Nom de l\'Agent';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Sélectionner un Emoji';

  @override
  String get vibe => 'Style';

  @override
  String get vibeHint => 'ex., amical, formel, sarcastique';

  @override
  String get modelConfiguration => 'Configuration du Modèle';

  @override
  String get advancedSettings => 'Paramètres Avancés';

  @override
  String get agentCreated => 'Agent créé';

  @override
  String get agentUpdated => 'Agent mis à jour';

  @override
  String get agentDeleted => 'Agent supprimé';

  @override
  String switchedToAgent(String name) {
    return 'Basculé vers $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Supprimer $name ? Cela supprimera toutes les données de l\'espace de travail.';
  }

  @override
  String get agentDetails => 'Détails de l\'Agent';

  @override
  String get createdAt => 'Créé';

  @override
  String get lastUsed => 'Dernière Utilisation';

  @override
  String get basicInformation => 'Informations de Base';

  @override
  String get switchToAgent => 'Changer d\'Agent';

  @override
  String get providers => 'Fournisseurs';

  @override
  String get addProvider => 'Ajouter un fournisseur';

  @override
  String get noProvidersConfigured => 'Aucun fournisseur configuré.';

  @override
  String get editCredentials => 'Modifier les identifiants';

  @override
  String get defaultModelHint =>
      'Le modèle par défaut est utilisé par les agents qui ne spécifient pas le leur.';

  @override
  String get holdToSetAsDefault => 'Maintenez pour définir par défaut';

  @override
  String get integrations => 'Intégrations';

  @override
  String get shortcutsIntegrations => 'Intégrations de Raccourcis';

  @override
  String get shortcutsIntegrationsDesc =>
      'Installez des Raccourcis iOS pour exécuter des actions d\'applications tierces';

  @override
  String get dangerZone => 'Zone de danger';

  @override
  String get resetOnboarding => 'Réinitialiser et relancer la configuration';

  @override
  String get resetOnboardingDesc =>
      'Supprime toute la configuration et retourne à l\'assistant de configuration.';

  @override
  String get resetAllConfiguration => 'Réinitialiser toute la configuration ?';

  @override
  String get resetAllConfigurationDesc =>
      'Cela supprimera vos clés API, modèles et tous les paramètres. L\'application retournera à l\'assistant de configuration.\n\nVotre historique de conversations n\'est pas supprimé.';

  @override
  String get removeProvider => 'Supprimer le fournisseur';

  @override
  String removeProviderConfirm(String provider) {
    return 'Supprimer les identifiants de $provider ?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name défini comme modèle par défaut';
  }

  @override
  String get photoImage => 'Photo / Image';

  @override
  String get documentPdfTxt => 'Document (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Impossible d\'ouvrir le document : $error';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get gatewayStopped => 'Passerelle arrêtée';

  @override
  String get gatewayStarted => 'Passerelle démarrée avec succès !';

  @override
  String gatewayFailed(String error) {
    return 'Échec de la passerelle : $error';
  }

  @override
  String exceptionError(String error) {
    return 'Exception : $error';
  }

  @override
  String get pairingRequestApproved => 'Demande d\'appairage approuvée';

  @override
  String get pairingRequestRejected => 'Demande d\'appairage rejetée';

  @override
  String get addDevice => 'Ajouter un Appareil';

  @override
  String get telegramConfigSaved => 'Configuration Telegram enregistrée';

  @override
  String get discordConfigSaved => 'Configuration Discord enregistrée';

  @override
  String get securityMethod => 'Méthode de Sécurité';

  @override
  String get pairingRecommended => 'Appairage (Recommandé)';

  @override
  String get pairingDescription =>
      'Les nouveaux utilisateurs reçoivent un code d\'appairage. Vous les approuvez ou les rejetez.';

  @override
  String get allowlistTitle => 'Liste autorisée';

  @override
  String get allowlistDescription =>
      'Seuls des IDs d\'utilisateurs spécifiques peuvent accéder au bot.';

  @override
  String get openAccess => 'Ouvert';

  @override
  String get openAccessDescription =>
      'N\'importe qui peut utiliser le bot immédiatement (non recommandé).';

  @override
  String get disabledAccess => 'Désactivé';

  @override
  String get disabledAccessDescription =>
      'Aucun message direct autorisé. Le bot ne répondra à aucun message.';

  @override
  String get approvedDevices => 'Appareils Approuvés';

  @override
  String get noApprovedDevicesYet => 'Aucun appareil approuvé pour l\'instant';

  @override
  String get devicesAppearAfterApproval =>
      'Les appareils apparaîtront ici après l\'approbation de leurs demandes d\'appairage';

  @override
  String get noAllowedUsersConfigured => 'Aucun utilisateur autorisé configuré';

  @override
  String get addUserIdsHint =>
      'Ajoutez des IDs d\'utilisateurs pour les autoriser à utiliser le bot';

  @override
  String get removeDevice => 'Supprimer l\'appareil ?';

  @override
  String removeAccessFor(String name) {
    return 'Supprimer l\'accès pour $name ?';
  }

  @override
  String get saving => 'Enregistrement...';

  @override
  String get channelsLabel => 'Canaux';

  @override
  String get clawHubAccount => 'Compte ClawHub';

  @override
  String get loggedInToClawHub => 'Vous êtes actuellement connecté à ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Déconnecté de ClawHub';

  @override
  String get login => 'Connexion';

  @override
  String get logout => 'Déconnexion';

  @override
  String get connect => 'Connecter';

  @override
  String get pasteClawHubToken => 'Collez votre jeton API ClawHub';

  @override
  String get pleaseEnterApiToken => 'Veuillez entrer un jeton API';

  @override
  String get successfullyConnected => 'Connecté à ClawHub avec succès';

  @override
  String get browseSkillsButton => 'Parcourir les Compétences';

  @override
  String get installSkill => 'Installer la Compétence';

  @override
  String get incompatibleSkill => 'Compétence Incompatible';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Cette compétence ne peut pas s\'exécuter sur mobile (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Avertissement de Compatibilité';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Cette compétence a été conçue pour le bureau et peut ne pas fonctionner telle quelle sur mobile.\n\n$reason\n\nSouhaitez-vous installer une version adaptée optimisée pour mobile ?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Installer l\'Original';

  @override
  String get installAdapted => 'Installer l\'Adaptée';

  @override
  String get resetSession => 'Réinitialiser la Session';

  @override
  String resetSessionConfirm(String key) {
    return 'Réinitialiser la session \"$key\" ? Cela supprimera tous les messages.';
  }

  @override
  String get sessionReset => 'Session réinitialisée';

  @override
  String get activeSessions => 'Sessions Actives';

  @override
  String get scheduledTasks => 'Tâches Planifiées';

  @override
  String get defaultBadge => 'Par défaut';

  @override
  String errorGeneric(String error) {
    return 'Erreur : $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName enregistré';
  }

  @override
  String errorSavingFile(String error) {
    return 'Erreur lors de l\'enregistrement du fichier : $error';
  }

  @override
  String get cannotDeleteLastAgent =>
      'Impossible de supprimer le dernier agent';

  @override
  String get close => 'Fermer';

  @override
  String get nameIsRequired => 'Le nom est obligatoire';

  @override
  String get pleaseSelectModel => 'Veuillez sélectionner un modèle';

  @override
  String temperatureLabel(String value) {
    return 'Température : $value';
  }

  @override
  String get maxTokens => 'Tokens Maximum';

  @override
  String get maxTokensRequired => 'Les tokens maximum sont obligatoires';

  @override
  String get mustBePositiveNumber => 'Doit être un nombre positif';

  @override
  String get maxToolIterations => 'Itérations Maximum d\'Outil';

  @override
  String get maxIterationsRequired =>
      'Les itérations maximum sont obligatoires';

  @override
  String get restrictToWorkspace => 'Restreindre à l\'Espace de Travail';

  @override
  String get restrictToWorkspaceDesc =>
      'Limiter les opérations sur les fichiers à l\'espace de travail de l\'agent';

  @override
  String get noModelsConfiguredLong =>
      'Veuillez ajouter au moins un modèle dans les Paramètres avant de créer un agent.';

  @override
  String get selectProviderFirst => 'Sélectionnez d\'abord un fournisseur';

  @override
  String get skip => 'Passer';

  @override
  String get continueButton => 'Continuer';

  @override
  String get uiAutomation => 'Automatisation de l\'UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw peut contrôler votre écran en votre nom — appuyer sur des boutons, remplir des formulaires, faire défiler et automatiser des tâches répétitives dans n\'importe quelle application.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Cela nécessite l\'activation du Service d\'Accessibilité dans les Paramètres Android. Vous pouvez passer cette étape et l\'activer plus tard.';

  @override
  String get openAccessibilitySettings =>
      'Ouvrir les Paramètres d\'Accessibilité';

  @override
  String get skipForNow => 'Passer pour l\'instant';

  @override
  String get checkingPermission => 'Vérification de la permission…';

  @override
  String get accessibilityEnabled => 'Service d\'Accessibilité activé';

  @override
  String get accessibilityNotEnabled => 'Service d\'Accessibilité non activé';

  @override
  String get exploreIntegrations => 'Explorer les Intégrations';

  @override
  String get requestTimedOut => 'La requête a expiré';

  @override
  String get myShortcuts => 'Mes Raccourcis';

  @override
  String get addShortcut => 'Ajouter un Raccourci';

  @override
  String get noShortcutsYet => 'Aucun raccourci pour l\'instant';

  @override
  String get shortcutsInstructions =>
      'Créez un raccourci dans l\'app Raccourcis iOS, ajoutez l\'action de callback à la fin, puis enregistrez-le ici pour que l\'IA puisse l\'exécuter.';

  @override
  String get shortcutName => 'Nom du raccourci';

  @override
  String get shortcutNameHint => 'Nom exact de l\'app Raccourcis';

  @override
  String get descriptionOptional => 'Description (optionnel)';

  @override
  String get whatDoesShortcutDo => 'Que fait ce raccourci ?';

  @override
  String get callbackSetup => 'Configuration du callback';

  @override
  String get callbackInstructions =>
      'Chaque raccourci doit se terminer par :\n① Obtenir la Valeur pour la Clé → \"callbackUrl\" (de l\'Entrée du Raccourci parsée comme dictionnaire)\n② Ouvrir les URLs ← sortie de ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Heartbeat';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Sous-agent';

  @override
  String get channelSystem => 'Système';

  @override
  String secondsAgo(int seconds) {
    return 'il y a ${seconds}s';
  }

  @override
  String get messagesAbbrev => 'msgs';

  @override
  String get modelAlreadyAdded => 'This model is already in your list';
}
