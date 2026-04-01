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
  String get liveActivityActive => 'Activité en direct active';

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
  String get voiceCallModelSection => 'Appel vocal (Live)';

  @override
  String get voiceCallModelDescription =>
      'Utilisé uniquement lorsque vous appuyez sur le bouton d’appel. Le chat, les agents et les tâches en arrière-plan utilisent votre modèle habituel.';

  @override
  String get voiceCallModelLabel => 'Modèle Live';

  @override
  String get voiceCallModelAutomatic => 'Automatique';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Démarrer via appel vocal';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'Dans un nouveau chat vide avec BOOTSTRAP.md, démarrez un appel vocal plutôt qu’un bootstrap silencieux par texte (lorsque Live est disponible).';

  @override
  String get liveVoiceNameLabel => 'Voix';

  @override
  String get firstHatchModeChoiceTitle => 'Comment souhaitez-vous commencer ?';

  @override
  String get firstHatchModeChoiceBody =>
      'Vous pouvez discuter par écrit avec votre assistant ou lancer une conversation vocale, comme un appel rapide. Choisissez ce qui vous semble le plus simple.';

  @override
  String get firstHatchModeChoiceChatButton => 'Écrire dans le chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Parler à voix haute';

  @override
  String get liveVoiceBargeInHint =>
      'Parlez quand l’assistant a terminé (l’écho les interrompait en plein discours).';

  @override
  String get liveVoiceFallbackTitle => 'En direct';

  @override
  String get liveVoiceEndConversationTooltip => 'Terminer la conversation';

  @override
  String get liveVoiceStatusConnecting => 'Connexion…';

  @override
  String get liveVoiceStatusRunning => 'Exécution…';

  @override
  String get liveVoiceStatusSpeaking => 'Parle…';

  @override
  String get liveVoiceStatusListening => 'Écoute…';

  @override
  String get liveVoiceBadge => 'DIRECT';

  @override
  String get cannotAddLiveModelAsChat =>
      'Ce modèle est réservé aux appels vocaux. Choisissez un modèle de chat dans la liste.';

  @override
  String get authBearerTokenLabel => 'Jeton Bearer';

  @override
  String get authAccessKeysLabel => 'Clés d’accès';

  @override
  String authModelsFoundCount(int count) {
    return '$count modèles trouvés';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count de plus — saisissez l’ID manuellement';
  }

  @override
  String get scanQrBarcodeTitle => 'Scanner QR / code-barres';

  @override
  String get oauthSignInTitle => 'Connexion';

  @override
  String get browserOverlayDone => 'Terminé';

  @override
  String appInitializationError(String error) {
    return 'Erreur d’initialisation : $error';
  }

  @override
  String get credentialsScreenTitle => 'Identifiants';

  @override
  String get credentialsIntroBody =>
      'Ajoutez plusieurs clés API par fournisseur. FlutterClaw les fait tourner automatiquement et met en pause celles qui atteignent les limites.';

  @override
  String get credentialsNoProvidersBody =>
      'Aucun fournisseur configuré.\nAllez dans Réglages → Fournisseurs et modèles pour en ajouter un.';

  @override
  String get credentialsAddKeyTooltip => 'Ajouter une clé';

  @override
  String get credentialsNoExtraKeysMessage =>
      'Pas de clés supplémentaires — utilisation de la clé définie dans Fournisseurs et modèles.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'Ajouter une clé $provider';
  }

  @override
  String get credentialsKeyLabelHint => 'Libellé (ex. « Clé pro »)';

  @override
  String get credentialsApiKeyFieldLabel => 'Clé API';

  @override
  String get securitySettingsTitle => 'Sécurité';

  @override
  String get securitySettingsIntro =>
      'Contrôlez les vérifications de sécurité contre les opérations dangereuses. Elles s’appliquent à la session en cours.';

  @override
  String get securitySectionToolExecution => 'EXÉCUTION DES OUTILS';

  @override
  String get securityPatternDetectionTitle => 'Détection de motifs de sécurité';

  @override
  String get securityPatternDetectionSubtitle =>
      'Bloque les motifs dangereux : injection shell, traversée de chemins, eval/exec, XSS, désérialisation.';

  @override
  String get securityUnsafeModeBanner =>
      'Les vérifications de sécurité sont désactivées. Les appels d’outils s’exécuteront sans validation. Réactivez-les ensuite.';

  @override
  String get securitySectionHowItWorks => 'FONCTIONNEMENT';

  @override
  String get securityHowItWorksBlocked =>
      'Lorsqu’un appel correspond à un motif dangereux, il est bloqué et l’agent en est informé.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'Utilisez /unsafe dans le chat pour une exception ponctuelle autorisant un appel bloqué, puis les vérifications reprennent.';

  @override
  String get securityHowItWorksToggleSession =>
      'Désactivez ici « Détection de motifs de sécurité » pour désactiver les vérifications pour toute la session.';

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
  String get modelAlreadyAdded => 'Ce modèle est déjà dans votre liste';

  @override
  String get bothTokensRequired => 'Les deux jetons sont requis';

  @override
  String get slackSavedRestart =>
      'Slack enregistré — redémarrez la passerelle pour connecter';

  @override
  String get slackConfiguration => 'Configuration Slack';

  @override
  String get setupTitle => 'Configuration';

  @override
  String get slackSetupInstructions =>
      '1. Créez une App Slack sur api.slack.com/apps\n2. Activez le Mode Socket → générez un Jeton au Niveau de l\'App (xapp-…)\n   avec la portée: connections:write\n3. Ajoutez des Portées de Jeton Bot: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Installez l\'app dans l\'espace de travail → copiez le Jeton Bot (xoxb-…)';

  @override
  String get botTokenXoxb => 'Jeton Bot (xoxb-…)';

  @override
  String get appLevelToken => 'Jeton au Niveau de l\'App (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'L\'URL API et le numéro de téléphone sont requis';

  @override
  String get signalSavedRestart =>
      'Signal enregistré — redémarrez la passerelle pour connecter';

  @override
  String get signalConfiguration => 'Configuration Signal';

  @override
  String get requirementsTitle => 'Exigences';

  @override
  String get signalRequirements =>
      'Nécessite signal-cli-rest-api en cours d\'exécution sur un serveur:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nEnregistrez/liez votre numéro Signal via l\'API REST, puis entrez l\'URL et votre numéro de téléphone ci-dessous.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Votre numéro de téléphone Signal';

  @override
  String get userIdLabel => 'ID d\'Utilisateur';

  @override
  String get enterDiscordUserId => 'Entrez l\'ID d\'utilisateur Discord';

  @override
  String get enterTelegramUserId => 'Entrez l\'ID d\'utilisateur Telegram';

  @override
  String get fromDiscordDevPortal => 'Du Portail Développeur Discord';

  @override
  String get allowedUserIdsTitle => 'IDs d\'Utilisateurs Autorisés';

  @override
  String get approvedDevice => 'Appareil approuvé';

  @override
  String get allowedUser => 'Utilisateur autorisé';

  @override
  String get howToGetBotToken => 'Comment obtenir votre jeton bot';

  @override
  String get discordTokenInstructions =>
      '1. Allez au Portail Développeur Discord\n2. Créez une nouvelle application et un bot\n3. Copiez le jeton et collez-le ci-dessus\n4. Activez l\'Intent de Contenu de Message';

  @override
  String get telegramTokenInstructions =>
      '1. Ouvrez Telegram et cherchez @BotFather\n2. Envoyez /newbot et suivez les instructions\n3. Copiez le jeton et collez-le ci-dessus';

  @override
  String get fromBotFatherHint => 'Obtenir de @BotFather';

  @override
  String get accessTokenLabel => 'Jeton d\'accès';

  @override
  String get notSetOpenAccess =>
      'Non défini — accès ouvert (loopback uniquement)';

  @override
  String get gatewayAccessToken => 'Jeton d\'accès de la passerelle';

  @override
  String get tokenFieldLabel => 'Jeton';

  @override
  String get leaveEmptyDisableAuth =>
      'Laisser vide pour désactiver l\'authentification';

  @override
  String get toolPolicies => 'Politiques des Outils';

  @override
  String get toolPoliciesDesc =>
      'Contrôlez ce que l\'agent peut accéder. Les outils désactivés sont cachés de l\'IA et bloqués à l\'exécution.';

  @override
  String get privacySensors => 'Confidentialité et Capteurs';

  @override
  String get networkCategory => 'Réseau';

  @override
  String get systemCategory => 'Système';

  @override
  String get toolTakePhotos => 'Prendre des Photos';

  @override
  String get toolTakePhotosDesc =>
      'Autoriser l\'agent à prendre des photos avec la caméra';

  @override
  String get toolRecordVideo => 'Enregistrer une Vidéo';

  @override
  String get toolRecordVideoDesc =>
      'Autoriser l\'agent à enregistrer des vidéos';

  @override
  String get toolLocation => 'Localisation';

  @override
  String get toolLocationDesc =>
      'Autoriser l\'agent à lire votre localisation GPS actuelle';

  @override
  String get toolHealthData => 'Données de Santé';

  @override
  String get toolHealthDataDesc =>
      'Autoriser l\'agent à lire les données de santé/fitness';

  @override
  String get toolContacts => 'Contacts';

  @override
  String get toolContactsDesc =>
      'Autoriser l\'agent à rechercher dans vos contacts';

  @override
  String get toolScreenshots => 'Captures d\'Écran';

  @override
  String get toolScreenshotsDesc =>
      'Autoriser l\'agent à prendre des captures d\'écran';

  @override
  String get toolWebFetch => 'Récupération Web';

  @override
  String get toolWebFetchDesc =>
      'Autoriser l\'agent à récupérer du contenu depuis des URLs';

  @override
  String get toolWebSearch => 'Recherche Web';

  @override
  String get toolWebSearchDesc => 'Autoriser l\'agent à rechercher sur le web';

  @override
  String get toolHttpRequests => 'Requêtes HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Autoriser l\'agent à effectuer des requêtes HTTP arbitraires';

  @override
  String get toolSandboxShell => 'Shell Sandbox';

  @override
  String get toolSandboxShellDesc =>
      'Autoriser l\'agent à exécuter des commandes shell dans le sandbox';

  @override
  String get toolImageGeneration => 'Génération d\'Images';

  @override
  String get toolImageGenerationDesc =>
      'Autoriser l\'agent à générer des images via IA';

  @override
  String get toolLaunchApps => 'Lancer des Apps';

  @override
  String get toolLaunchAppsDesc =>
      'Autoriser l\'agent à ouvrir des applications installées';

  @override
  String get toolLaunchIntents => 'Lancer des Intents';

  @override
  String get toolLaunchIntentsDesc =>
      'Autoriser l\'agent à lancer des intents Android (liens profonds, écrans système)';

  @override
  String get renameSession => 'Renommer la session';

  @override
  String get myConversationName => 'Mon nom de conversation';

  @override
  String get renameAction => 'Renommer';

  @override
  String get couldNotTranscribeAudio => 'Impossible de transcrire l\'audio';

  @override
  String get stopRecording => 'Arrêter l\'enregistrement';

  @override
  String get voiceInput => 'Saisie vocale';

  @override
  String get speakMessage => 'Lire à voix haute';

  @override
  String get stopSpeaking => 'Arrêter la lecture';

  @override
  String get selectText => 'Sélectionner le texte';

  @override
  String get messageCopied => 'Message copié';

  @override
  String get copyTooltip => 'Copier';

  @override
  String get commandsTooltip => 'Commandes';

  @override
  String get providersAndModels => 'Fournisseurs et Modèles';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modèles configurés',
      one: '1 modèle configuré',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Démarrage automatique activé';

  @override
  String get autoStartOffLabel => 'Démarrage automatique désactivé';

  @override
  String get allToolsEnabled => 'Tous les outils activés';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outils désactivés',
      one: '1 outil désactivé',
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
  String get officialWebsite => 'Site officiel';

  @override
  String get noPendingPairingRequests =>
      'Aucune demande d\'appairage en attente';

  @override
  String get pairingRequestsTitle => 'Demandes d\'Appairage';

  @override
  String get gatewayStartingStatus => 'Démarrage de la passerelle...';

  @override
  String get gatewayRetryingStatus =>
      'Nouvelle tentative de démarrage de la passerelle...';

  @override
  String get errorStartingGateway =>
      'Erreur lors du démarrage de la passerelle';

  @override
  String get runningStatus => 'En cours d\'exécution';

  @override
  String get stoppedStatus => 'Arrêté';

  @override
  String get notSetUpStatus => 'Non configuré';

  @override
  String get configuredStatus => 'Configuré';

  @override
  String get whatsAppConfigSaved => 'Configuration WhatsApp enregistrée';

  @override
  String get whatsAppDisconnected => 'WhatsApp déconnecté';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Application...';

  @override
  String get reconnectWhatsApp => 'Reconnecter WhatsApp';

  @override
  String get saveSettingsLabel => 'Enregistrer les Paramètres';

  @override
  String get applySettingsRestart => 'Appliquer les Paramètres et Redémarrer';

  @override
  String get whatsAppMode => 'Mode WhatsApp';

  @override
  String get myPersonalNumber => 'Mon numéro personnel';

  @override
  String get myPersonalNumberDesc =>
      'Les messages que vous envoyez à votre propre chat WhatsApp réveillent l\'agent.';

  @override
  String get dedicatedBotAccount => 'Compte bot dédié';

  @override
  String get dedicatedBotAccountDesc =>
      'Les messages envoyés depuis le compte lié lui-même sont ignorés comme sortants.';

  @override
  String get allowedNumbers => 'Numéros Autorisés';

  @override
  String get addNumberTitle => 'Ajouter un Numéro';

  @override
  String get phoneNumberJid => 'Numéro de téléphone / JID';

  @override
  String get noAllowedNumbersConfigured => 'Aucun numéro autorisé configuré';

  @override
  String get devicesAppearAfterPairing =>
      'Les appareils apparaissent ici après l\'approbation des demandes d\'appairage';

  @override
  String get addPhoneNumbersHint =>
      'Ajoutez des numéros de téléphone pour les autoriser à utiliser le bot';

  @override
  String get allowedNumber => 'Numéro autorisé';

  @override
  String get howToConnect => 'Comment se connecter';

  @override
  String get whatsAppConnectInstructions =>
      '1. Appuyez sur \"Connecter WhatsApp\" ci-dessus\n2. Un code QR apparaîtra — scannez-le avec WhatsApp\n   (Paramètres → Appareils Liés → Lier un Appareil)\n3. Une fois connecté, les messages entrants sont automatiquement\n   dirigés vers votre agent IA actif';

  @override
  String get whatsAppPairingDesc =>
      'Les nouveaux expéditeurs reçoivent un code d\'appairage. Vous les approuvez.';

  @override
  String get whatsAppAllowlistDesc =>
      'Seuls des numéros de téléphone spécifiques peuvent envoyer des messages au bot.';

  @override
  String get whatsAppOpenDesc =>
      'Toute personne qui vous envoie un message peut utiliser le bot.';

  @override
  String get whatsAppDisabledDesc =>
      'Le bot ne répondra à aucun message entrant.';

  @override
  String get sessionExpiredRelink =>
      'Session expirée. Appuyez sur \"Reconnecter\" ci-dessous pour scanner un nouveau code QR.';

  @override
  String get connectWhatsAppBelow =>
      'Appuyez sur \"Connecter WhatsApp\" ci-dessous pour lier votre compte.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp a accepté le QR. Finalisation du lien...';

  @override
  String get waitingForWhatsApp =>
      'En attente que WhatsApp complète le lien...';

  @override
  String get focusedLabel => 'Concentré';

  @override
  String get balancedLabel => 'Équilibré';

  @override
  String get creativeLabel => 'Créatif';

  @override
  String get preciseLabel => 'Précis';

  @override
  String get expressiveLabel => 'Expressif';

  @override
  String get browseLabel => 'Parcourir';

  @override
  String get apiTokenLabel => 'Jeton API';

  @override
  String get connectToClawHub => 'Connecter à ClawHub';

  @override
  String get clawHubLoginHint =>
      'Connectez-vous à ClawHub pour accéder aux compétences premium et installer des packages';

  @override
  String get howToGetApiToken => 'Comment obtenir votre jeton API:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Visitez clawhub.ai et connectez-vous avec GitHub\n2. Exécutez \"clawhub login\" dans le terminal\n3. Copiez votre jeton et collez-le ici';

  @override
  String connectionFailed(String error) {
    return 'Connexion échouée: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count exécutions';
  }

  @override
  String nextRunLabel(String time) {
    return 'Prochaine exécution: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Dernière erreur: $error';
  }

  @override
  String get cronJobHintText =>
      'Instructions pour l\'agent lorsque cette tâche se déclenche…';

  @override
  String get androidPermissions => 'Permissions Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw peut contrôler votre écran en votre nom — appuyer sur des boutons, remplir des formulaires, faire défiler et automatiser des tâches répétitives dans n\'importe quelle application.';

  @override
  String get twoPermissionsNeeded =>
      'Deux permissions sont nécessaires pour l\'expérience complète. Vous pouvez passer cette étape et les activer plus tard dans les Paramètres.';

  @override
  String get accessibilityService => 'Service d\'Accessibilité';

  @override
  String get accessibilityServiceDesc =>
      'Permet d\'appuyer, de glisser, de taper et de lire le contenu de l\'écran';

  @override
  String get displayOverOtherApps => 'Afficher par-dessus d\'Autres Apps';

  @override
  String get displayOverOtherAppsDesc =>
      'Affiche une pastille de statut flottante pour voir ce que fait l\'agent';

  @override
  String get changeDefaultModel => 'Changer le modèle par défaut';

  @override
  String setModelAsDefault(String name) {
    return 'Définir $name comme modèle par défaut.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Mettre également à jour $count agent$_temp0';
  }

  @override
  String get startNewSessions => 'Démarrer de nouvelles sessions';

  @override
  String get currentConversationsArchived =>
      'Les conversations actuelles seront archivées';

  @override
  String get applyAction => 'Appliquer';

  @override
  String applyModelQuestion(String name) {
    return 'Appliquer $name?';
  }

  @override
  String get setAsDefaultModel => 'Définir comme modèle par défaut';

  @override
  String get usedByAgentsWithout =>
      'Utilisé par les agents sans modèle spécifique';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Appliquer à $count agent$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Fournisseur déjà authentifié — aucune clé API nécessaire.';

  @override
  String get selectFromList => 'Sélectionner dans la liste';

  @override
  String get enterCustomModelId => 'Entrer un ID de modèle personnalisé';

  @override
  String get removeSkillTitle => 'Supprimer la compétence?';

  @override
  String get browseClawHubToDiscover =>
      'Parcourez ClawHub pour découvrir et installer des compétences';

  @override
  String get addDeviceTooltip => 'Ajouter un appareil';

  @override
  String get addNumberTooltip => 'Ajouter un numéro';

  @override
  String get searchSkillsHint => 'Rechercher des compétences...';

  @override
  String get loginToClawHub => 'Se connecter à ClawHub';

  @override
  String get accountTooltip => 'Compte';

  @override
  String get editAction => 'Modifier';

  @override
  String get setAsDefaultAction => 'Définir par défaut';

  @override
  String get chooseProviderTitle => 'Choisir le fournisseur';

  @override
  String get apiKeyTitle => 'Clé API';

  @override
  String get slackConfigSaved =>
      'Slack enregistré — redémarrez la passerelle pour connecter';

  @override
  String get signalConfigSaved =>
      'Signal enregistré — redémarrez la passerelle pour connecter';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Ajouter un appareil';

  @override
  String get skipAction => 'Passer';

  @override
  String get mcpServers => 'Serveurs MCP';

  @override
  String get noMcpServersConfigured => 'Aucun serveur MCP configuré';

  @override
  String get mcpServersEmptyHint =>
      'Ajoutez des serveurs MCP pour donner à votre agent accès aux outils de GitHub, Notion, Slack, bases de données et plus.';

  @override
  String get addMcpServer => 'Ajouter un serveur MCP';

  @override
  String get editMcpServer => 'Modifier le serveur MCP';

  @override
  String get removeMcpServer => 'Supprimer le serveur MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Supprimer \"$name\" ? Ses outils ne seront plus disponibles.';
  }

  @override
  String get mcpTransport => 'Transport';

  @override
  String get testConnection => 'Tester la connexion';

  @override
  String get mcpServerNameLabel => 'Nom du serveur';

  @override
  String get mcpServerNameHint => 'ex. GitHub, Notion, Ma BD';

  @override
  String get mcpServerUrlLabel => 'URL du serveur';

  @override
  String get mcpBearerTokenLabel => 'Token Bearer (optionnel)';

  @override
  String get mcpBearerTokenHint =>
      'Laisser vide si aucune authentification requise';

  @override
  String get mcpCommandLabel => 'Commande';

  @override
  String get mcpArgumentsLabel => 'Arguments (séparés par des espaces)';

  @override
  String get mcpEnvVarsLabel =>
      'Variables d\'environnement (CLÉ=VALEUR, une par ligne)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio n\'est pas disponible sur iOS. Utilisez HTTP ou SSE.';

  @override
  String get connectedStatus => 'Connecté';

  @override
  String get mcpConnecting => 'Connexion...';

  @override
  String get mcpConnectionError => 'Erreur de connexion';

  @override
  String get mcpDisconnected => 'Déconnecté';

  @override
  String mcpToolsCount(int count) {
    return '$count outils';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — $count outils découverts';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Connecté (0 outil)';

  @override
  String get mcpTestFailed =>
      'Échec de la connexion. Vérifiez l\'URL/token du serveur.';

  @override
  String get mcpAddServer => 'Ajouter un serveur';

  @override
  String get mcpSaveChanges => 'Enregistrer les modifications';

  @override
  String get urlIsRequired => 'L\'URL est obligatoire';

  @override
  String get enterValidUrl => 'Entrez une URL valide';

  @override
  String get commandIsRequired => 'La commande est obligatoire';

  @override
  String skillRemoved(String name) {
    return 'Compétence \"$name\" supprimée';
  }

  @override
  String get editFileContentHint => 'Modifier le contenu du fichier...';

  @override
  String get whatsAppPairSubtitle =>
      'Associez votre compte WhatsApp personnel avec un code QR';

  @override
  String get whatsAppPairingOptional =>
      'L\'association est optionnelle. Vous pouvez terminer le processus maintenant et compléter le lien plus tard.';

  @override
  String get whatsAppEnableToLink =>
      'Activez WhatsApp pour commencer à lier cet appareil.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp est lié. FlutterClaw pourra répondre après la configuration initiale.';

  @override
  String get cancelLink => 'Annuler le lien';
}
