// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Canais';

  @override
  String get agent => 'Agente';

  @override
  String get settings => 'Configurações';

  @override
  String get getStarted => 'Começar';

  @override
  String get yourPersonalAssistant => 'Seu assistente pessoal de IA';

  @override
  String get multiChannelChat => 'Chat multicanal';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, Chat e mais';

  @override
  String get powerfulAIModels => 'Modelos de IA poderosos';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok e modelos gratuitos';

  @override
  String get localGateway => 'Gateway local';

  @override
  String get localGatewayDesc =>
      'Executa no seu dispositivo, seus dados permanecem seus';

  @override
  String get chooseProvider => 'Escolha um Provedor';

  @override
  String get selectProviderDesc =>
      'Selecione como você deseja se conectar aos modelos de IA.';

  @override
  String get startForFree => 'Comece Gratuitamente';

  @override
  String get freeProvidersDesc =>
      'Estes provedores oferecem modelos gratuitos para você começar sem custo.';

  @override
  String get free => 'GRÁTIS';

  @override
  String get otherProviders => 'Outros Provedores';

  @override
  String connectToProvider(String provider) {
    return 'Conectar ao $provider';
  }

  @override
  String get enterApiKeyDesc => 'Digite sua chave API e selecione um modelo.';

  @override
  String get dontHaveApiKey => 'Não tem uma chave API?';

  @override
  String get createAccountCopyKey => 'Crie uma conta e copie sua chave.';

  @override
  String get signUp => 'Cadastrar-se';

  @override
  String get apiKey => 'Chave API';

  @override
  String get pasteFromClipboard => 'Colar da área de transferência';

  @override
  String get apiBaseUrl => 'URL Base da API';

  @override
  String get selectModel => 'Selecionar Modelo';

  @override
  String get modelId => 'ID do Modelo';

  @override
  String get validateKey => 'Validar Chave';

  @override
  String get validating => 'Validando...';

  @override
  String get invalidApiKey => 'Chave API inválida';

  @override
  String get gatewayConfiguration => 'Configuração do Gateway';

  @override
  String get gatewayConfigDesc =>
      'O gateway é o plano de controle local para seu assistente.';

  @override
  String get defaultSettingsNote =>
      'As configurações padrão funcionam para a maioria dos usuários. Altere apenas se souber o que precisa.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Porta';

  @override
  String get autoStartGateway => 'Iniciar gateway automaticamente';

  @override
  String get autoStartGatewayDesc =>
      'Iniciar o gateway automaticamente quando o aplicativo for iniciado.';

  @override
  String get channelsPageTitle => 'Canais';

  @override
  String get channelsPageDesc =>
      'Conecte canais de mensagens opcionalmente. Você sempre pode configurá-los mais tarde nas Configurações.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Conecte um bot do Telegram.';

  @override
  String get openBotFather => 'Abrir BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Conecte um bot do Discord.';

  @override
  String get developerPortal => 'Portal do Desenvolvedor';

  @override
  String get botToken => 'Token do Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Token do Bot $platform';
  }

  @override
  String get readyToGo => 'Pronto para Começar';

  @override
  String get reviewConfiguration =>
      'Revise sua configuração e inicie o FlutterClaw.';

  @override
  String get model => 'Modelo';

  @override
  String viaProvider(String provider) {
    return 'via $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Apenas Chat (você pode adicionar mais depois)';

  @override
  String get webChat => 'Chat';

  @override
  String get starting => 'Iniciando...';

  @override
  String get startFlutterClaw => 'Iniciar FlutterClaw';

  @override
  String get newSession => 'Nova sessão';

  @override
  String get photoLibrary => 'Biblioteca de Fotos';

  @override
  String get camera => 'Câmera';

  @override
  String get whatDoYouSeeInImage => 'O que você vê nesta imagem?';

  @override
  String get imagePickerNotAvailable =>
      'Seletor de imagens não disponível no Simulador. Use um dispositivo real.';

  @override
  String get couldNotOpenImagePicker =>
      'Não foi possível abrir o seletor de imagens.';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get attachImage => 'Anexar imagem';

  @override
  String get messageFlutterClaw => 'Mensagem para FlutterClaw...';

  @override
  String get channelsAndGateway => 'Canais e Gateway';

  @override
  String get stop => 'Parar';

  @override
  String get start => 'Iniciar';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Interface de chat integrada';

  @override
  String get notConfigured => 'Não configurado';

  @override
  String get connected => 'Conectado';

  @override
  String get configuredStarting => 'Configurado (iniciando...)';

  @override
  String get telegramConfiguration => 'Configuração do Telegram';

  @override
  String get fromBotFather => 'Do @BotFather';

  @override
  String get allowedUserIds =>
      'IDs de Usuário Permitidos (separados por vírgula)';

  @override
  String get leaveEmptyToAllowAll => 'Deixe vazio para permitir todos';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saveAndConnect => 'Salvar e Conectar';

  @override
  String get discordConfiguration => 'Configuração do Discord';

  @override
  String get pendingPairingRequests =>
      'Solicitações de Emparelhamento Pendentes';

  @override
  String get approve => 'Aprovar';

  @override
  String get reject => 'Rejeitar';

  @override
  String get expired => 'Expirado';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m restantes';
  }

  @override
  String get workspaceFiles => 'Arquivos do Espaço de Trabalho';

  @override
  String get personalAIAssistant => 'Assistente Pessoal de IA';

  @override
  String sessionsCount(int count) {
    return 'Sessões ($count)';
  }

  @override
  String get noActiveSessions => 'Nenhuma sessão ativa';

  @override
  String get startConversationToCreate => 'Inicie uma conversa para criar uma';

  @override
  String get startConversationToSee =>
      'Inicie uma conversa para ver sessões aqui';

  @override
  String get reset => 'Redefinir';

  @override
  String get cronJobs => 'Tarefas Agendadas';

  @override
  String get noCronJobs => 'Nenhuma tarefa agendada';

  @override
  String get addScheduledTasks => 'Adicione tarefas agendadas para seu agente';

  @override
  String get runNow => 'Executar Agora';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String get delete => 'Excluir';

  @override
  String get skills => 'Habilidades';

  @override
  String get browseClawHub => 'Explorar ClawHub';

  @override
  String get noSkillsInstalled => 'Nenhuma habilidade instalada';

  @override
  String get browseClawHubToAdd =>
      'Explore o ClawHub para adicionar habilidades';

  @override
  String removeSkillConfirm(String name) {
    return 'Remover \"$name\" de suas habilidades?';
  }

  @override
  String get clawHubSkills => 'Habilidades do ClawHub';

  @override
  String get searchSkills => 'Pesquisar habilidades...';

  @override
  String get noSkillsFound =>
      'Nenhuma habilidade encontrada. Tente uma pesquisa diferente.';

  @override
  String installedSkill(String name) {
    return '$name instalado';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Falha ao instalar $name';
  }

  @override
  String get addCronJob => 'Adicionar Tarefa Agendada';

  @override
  String get jobName => 'Nome da Tarefa';

  @override
  String get dailySummaryExample => 'ex. Resumo Diário';

  @override
  String get taskPrompt => 'Instrução da Tarefa';

  @override
  String get whatShouldAgentDo => 'O que o agente deve fazer?';

  @override
  String get interval => 'Intervalo';

  @override
  String get every5Minutes => 'A cada 5 minutos';

  @override
  String get every15Minutes => 'A cada 15 minutos';

  @override
  String get every30Minutes => 'A cada 30 minutos';

  @override
  String get everyHour => 'A cada hora';

  @override
  String get every6Hours => 'A cada 6 horas';

  @override
  String get every12Hours => 'A cada 12 horas';

  @override
  String get every24Hours => 'A cada 24 horas';

  @override
  String get add => 'Adicionar';

  @override
  String get save => 'Salvar';

  @override
  String get sessions => 'Sessões';

  @override
  String messagesCount(int count) {
    return '$count mensagens';
  }

  @override
  String tokensCount(int count) {
    return '$count tokens';
  }

  @override
  String get compact => 'Compactar';

  @override
  String get models => 'Modelos';

  @override
  String get noModelsConfigured => 'Nenhum modelo configurado';

  @override
  String get addModelToStartChatting =>
      'Adicione um modelo para começar a conversar';

  @override
  String get addModel => 'Adicionar Modelo';

  @override
  String get default_ => 'PADRÃO';

  @override
  String get autoStart => 'Início automático';

  @override
  String get startGatewayWhenLaunches =>
      'Iniciar gateway quando o aplicativo for iniciado';

  @override
  String get heartbeat => 'Batimento';

  @override
  String get enabled => 'Ativado';

  @override
  String get periodicAgentTasks =>
      'Tarefas periódicas do agente do HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'Sobre';

  @override
  String get personalAIAssistantForIOS =>
      'Assistente Pessoal de IA para iOS e Android';

  @override
  String get version => 'Versão';

  @override
  String get basedOnOpenClaw => 'Baseado em OpenClaw';

  @override
  String get removeModel => 'Remover modelo?';

  @override
  String removeModelConfirm(String name) {
    return 'Remover \"$name\" de seus modelos?';
  }

  @override
  String get remove => 'Remover';

  @override
  String get setAsDefault => 'Definir como Padrão';

  @override
  String get paste => 'Colar';

  @override
  String get chooseProviderStep => '1. Escolher Provedor';

  @override
  String get selectModelStep => '2. Selecionar Modelo';

  @override
  String get apiKeyStep => '3. Chave API';

  @override
  String getApiKeyAt(String provider) {
    return 'Obter chave API em $provider';
  }

  @override
  String get justNow => 'agora mesmo';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m atrás';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String daysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String get microphonePermissionDenied => 'Permissão de microfone negada';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Transcrição ao vivo indisponível: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Falha ao iniciar gravação: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Usando transcrição no dispositivo';

  @override
  String get transcribingWithWhisper => 'Transcrevendo com Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API falhou: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Nenhuma transcrição capturada';

  @override
  String failedToStopRecording(String error) {
    return 'Falha ao parar gravação: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Falha ao $action: $error';
  }

  @override
  String get pause => 'Pausar';

  @override
  String get resume => 'Retomar';

  @override
  String get send => 'Enviar';

  @override
  String get liveActivityActive => 'Live Activity ativa';

  @override
  String get restartGateway => 'Reiniciar Gateway';

  @override
  String modelLabel(String model) {
    return 'Modelo: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Tempo ativo: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Suporte em segundo plano ativo - o gateway pode continuar respondendo';

  @override
  String get webChatBuiltIn => 'Interface de chat integrada';

  @override
  String get configure => 'Configurar';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get agents => 'Agentes';

  @override
  String get agentFiles => 'Arquivos do Agente';

  @override
  String get createAgent => 'Criar Agente';

  @override
  String get editAgent => 'Editar Agente';

  @override
  String get noAgentsYet => 'Nenhum agente ainda';

  @override
  String get createYourFirstAgent => 'Crie seu primeiro agente!';

  @override
  String get active => 'Ativo';

  @override
  String get agentName => 'Nome do Agente';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Selecionar Emoji';

  @override
  String get vibe => 'Estilo';

  @override
  String get vibeHint => 'ex., amigável, formal, sarcástico';

  @override
  String get modelConfiguration => 'Configuração do Modelo';

  @override
  String get advancedSettings => 'Configurações Avançadas';

  @override
  String get agentCreated => 'Agente criado';

  @override
  String get agentUpdated => 'Agente atualizado';

  @override
  String get agentDeleted => 'Agente excluído';

  @override
  String switchedToAgent(String name) {
    return 'Alternado para $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Excluir $name? Isso removerá todos os dados do espaço de trabalho.';
  }

  @override
  String get agentDetails => 'Detalhes do Agente';

  @override
  String get createdAt => 'Criado';

  @override
  String get lastUsed => 'Último Uso';

  @override
  String get basicInformation => 'Informações Básicas';

  @override
  String get switchToAgent => 'Trocar de Agente';

  @override
  String get providers => 'Provedores';

  @override
  String get addProvider => 'Adicionar provedor';

  @override
  String get noProvidersConfigured => 'Nenhum provedor configurado.';

  @override
  String get editCredentials => 'Editar credenciais';

  @override
  String get defaultModelHint =>
      'O modelo padrão é usado por agentes que não especificam o seu próprio.';

  @override
  String get voiceCallModelSection => 'Voice call (Live)';

  @override
  String get voiceCallModelDescription =>
      'Used only when you tap the call button. Chat, agents, and background tasks use your normal model.';

  @override
  String get voiceCallModelLabel => 'Live model';

  @override
  String get voiceCallModelAutomatic => 'Automatic';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Bootstrap in voice call';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'On a new empty chat with BOOTSTRAP.md, start a voice call instead of a silent text hatch (when Live is available).';

  @override
  String get liveVoiceNameLabel => 'Voice';

  @override
  String get firstHatchModeChoiceTitle => 'Como você quer começar?';

  @override
  String get firstHatchModeChoiceBody =>
      'Você pode conversar por texto com seu assistente ou começar uma conversa por voz, como uma ligação rápida. Escolha o que for mais fácil para você.';

  @override
  String get firstHatchModeChoiceChatButton => 'Escrever no chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Falar por voz';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault =>
      'Mantenha pressionado para definir como padrão';

  @override
  String get integrations => 'Integrações';

  @override
  String get shortcutsIntegrations => 'Integrações de Atalhos';

  @override
  String get shortcutsIntegrationsDesc =>
      'Instale Atalhos do iOS para executar ações de aplicativos de terceiros';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get resetOnboarding => 'Redefinir e reiniciar configuração inicial';

  @override
  String get resetOnboardingDesc =>
      'Exclui toda a configuração e retorna ao assistente de configuração.';

  @override
  String get resetAllConfiguration => 'Redefinir toda a configuração?';

  @override
  String get resetAllConfigurationDesc =>
      'Isso excluirá suas chaves API, modelos e todas as configurações. O aplicativo retornará ao assistente de configuração.\n\nSeu histórico de conversas não é excluído.';

  @override
  String get removeProvider => 'Remover provedor';

  @override
  String removeProviderConfirm(String provider) {
    return 'Remover credenciais de $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name definido como modelo padrão';
  }

  @override
  String get photoImage => 'Foto / Imagem';

  @override
  String get documentPdfTxt => 'Documento (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Não foi possível abrir o documento: $error';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get gatewayStopped => 'Gateway parado';

  @override
  String get gatewayStarted => 'Gateway iniciado com sucesso!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway falhou: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Exceção: $error';
  }

  @override
  String get pairingRequestApproved => 'Solicitação de emparelhamento aprovada';

  @override
  String get pairingRequestRejected =>
      'Solicitação de emparelhamento rejeitada';

  @override
  String get addDevice => 'Adicionar Dispositivo';

  @override
  String get telegramConfigSaved => 'Configuração do Telegram salva';

  @override
  String get discordConfigSaved => 'Configuração do Discord salva';

  @override
  String get securityMethod => 'Método de Segurança';

  @override
  String get pairingRecommended => 'Emparelhamento (Recomendado)';

  @override
  String get pairingDescription =>
      'Novos usuários recebem um código de emparelhamento. Você aprova ou rejeita.';

  @override
  String get allowlistTitle => 'Lista de permitidos';

  @override
  String get allowlistDescription =>
      'Apenas IDs de usuário específicos podem acessar o bot.';

  @override
  String get openAccess => 'Aberto';

  @override
  String get openAccessDescription =>
      'Qualquer pessoa pode usar o bot imediatamente (não recomendado).';

  @override
  String get disabledAccess => 'Desativado';

  @override
  String get disabledAccessDescription =>
      'Nenhuma mensagem direta permitida. O bot não responderá a nenhuma mensagem.';

  @override
  String get approvedDevices => 'Dispositivos Aprovados';

  @override
  String get noApprovedDevicesYet => 'Nenhum dispositivo aprovado ainda';

  @override
  String get devicesAppearAfterApproval =>
      'Dispositivos aparecerão aqui após você aprovar suas solicitações de emparelhamento';

  @override
  String get noAllowedUsersConfigured => 'Nenhum usuário permitido configurado';

  @override
  String get addUserIdsHint =>
      'Adicione IDs de usuário para permitir que usem o bot';

  @override
  String get removeDevice => 'Remover dispositivo?';

  @override
  String removeAccessFor(String name) {
    return 'Remover acesso para $name?';
  }

  @override
  String get saving => 'Salvando...';

  @override
  String get channelsLabel => 'Canais';

  @override
  String get clawHubAccount => 'Conta ClawHub';

  @override
  String get loggedInToClawHub => 'Você está conectado ao ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Desconectado do ClawHub';

  @override
  String get login => 'Entrar';

  @override
  String get logout => 'Sair';

  @override
  String get connect => 'Conectar';

  @override
  String get pasteClawHubToken => 'Cole seu token API do ClawHub';

  @override
  String get pleaseEnterApiToken => 'Por favor insira um token API';

  @override
  String get successfullyConnected => 'Conectado ao ClawHub com sucesso';

  @override
  String get browseSkillsButton => 'Explorar Habilidades';

  @override
  String get installSkill => 'Instalar Habilidade';

  @override
  String get incompatibleSkill => 'Habilidade Incompatível';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Esta habilidade não pode ser executada em dispositivo móvel (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Aviso de Compatibilidade';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Esta habilidade foi projetada para desktop e pode não funcionar como está em dispositivo móvel.\n\n$reason\n\nDeseja instalar uma versão adaptada e otimizada para dispositivo móvel?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Instalar Original';

  @override
  String get installAdapted => 'Instalar Adaptada';

  @override
  String get resetSession => 'Redefinir Sessão';

  @override
  String resetSessionConfirm(String key) {
    return 'Redefinir sessão \"$key\"? Isso limpará todas as mensagens.';
  }

  @override
  String get sessionReset => 'Sessão redefinida';

  @override
  String get activeSessions => 'Sessões Ativas';

  @override
  String get scheduledTasks => 'Tarefas Agendadas';

  @override
  String get defaultBadge => 'Padrão';

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName salvo';
  }

  @override
  String errorSavingFile(String error) {
    return 'Erro ao salvar arquivo: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Não é possível excluir o último agente';

  @override
  String get close => 'Fechar';

  @override
  String get nameIsRequired => 'O nome é obrigatório';

  @override
  String get pleaseSelectModel => 'Por favor selecione um modelo';

  @override
  String temperatureLabel(String value) {
    return 'Temperatura: $value';
  }

  @override
  String get maxTokens => 'Tokens Máximos';

  @override
  String get maxTokensRequired => 'Tokens máximos são obrigatórios';

  @override
  String get mustBePositiveNumber => 'Deve ser um número positivo';

  @override
  String get maxToolIterations => 'Iterações Máximas de Ferramenta';

  @override
  String get maxIterationsRequired => 'Iterações máximas são obrigatórias';

  @override
  String get restrictToWorkspace => 'Restringir ao Espaço de Trabalho';

  @override
  String get restrictToWorkspaceDesc =>
      'Limitar operações de arquivo ao espaço de trabalho do agente';

  @override
  String get noModelsConfiguredLong =>
      'Por favor adicione pelo menos um modelo nas Configurações antes de criar um agente.';

  @override
  String get selectProviderFirst => 'Selecione um provedor primeiro';

  @override
  String get skip => 'Pular';

  @override
  String get continueButton => 'Continuar';

  @override
  String get uiAutomation => 'Automação de UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw pode controlar sua tela em seu nome — tocando botões, preenchendo formulários, rolando e automatizando tarefas repetitivas em qualquer aplicativo.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Isso requer a ativação do Serviço de Acessibilidade nas Configurações do Android. Você pode pular isso e ativá-lo depois.';

  @override
  String get openAccessibilitySettings =>
      'Abrir Configurações de Acessibilidade';

  @override
  String get skipForNow => 'Pular por enquanto';

  @override
  String get checkingPermission => 'Verificando permissão…';

  @override
  String get accessibilityEnabled => 'Serviço de Acessibilidade ativado';

  @override
  String get accessibilityNotEnabled => 'Serviço de Acessibilidade não ativado';

  @override
  String get exploreIntegrations => 'Explorar Integrações';

  @override
  String get requestTimedOut => 'A solicitação expirou';

  @override
  String get myShortcuts => 'Meus Atalhos';

  @override
  String get addShortcut => 'Adicionar Atalho';

  @override
  String get noShortcutsYet => 'Nenhum atalho ainda';

  @override
  String get shortcutsInstructions =>
      'Crie um atalho no app Atalhos do iOS, adicione a ação de callback no final, depois registre-o aqui para que a IA possa executá-lo.';

  @override
  String get shortcutName => 'Nome do atalho';

  @override
  String get shortcutNameHint => 'Nome exato do app Atalhos';

  @override
  String get descriptionOptional => 'Descrição (opcional)';

  @override
  String get whatDoesShortcutDo => 'O que este atalho faz?';

  @override
  String get callbackSetup => 'Configuração de callback';

  @override
  String get callbackInstructions =>
      'Cada atalho deve terminar com:\n① Obter Valor para Chave → \"callbackUrl\" (da Entrada do Atalho parseada como dicionário)\n② Abrir URLs ← saída de ①';

  @override
  String get channelApp => 'App';

  @override
  String get channelHeartbeat => 'Heartbeat';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagente';

  @override
  String get channelSystem => 'Sistema';

  @override
  String secondsAgo(int seconds) {
    return 'há ${seconds}s';
  }

  @override
  String get messagesAbbrev => 'msgs';

  @override
  String get modelAlreadyAdded => 'Este modelo já está na sua lista';

  @override
  String get bothTokensRequired => 'Ambos os tokens são necessários';

  @override
  String get slackSavedRestart =>
      'Slack salvo — reinicie o gateway para conectar';

  @override
  String get slackConfiguration => 'Configuração do Slack';

  @override
  String get setupTitle => 'Configuração';

  @override
  String get slackSetupInstructions =>
      '1. Crie um App Slack em api.slack.com/apps\n2. Ative o Modo Socket → gere um Token de Nível de App (xapp-…)\n   com escopo: connections:write\n3. Adicione Escopos de Token Bot: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Instale o app no espaço de trabalho → copie o Token Bot (xoxb-…)';

  @override
  String get botTokenXoxb => 'Token Bot (xoxb-…)';

  @override
  String get appLevelToken => 'Token de Nível de App (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'URL da API e número de telefone são necessários';

  @override
  String get signalSavedRestart =>
      'Signal salvo — reinicie o gateway para conectar';

  @override
  String get signalConfiguration => 'Configuração do Signal';

  @override
  String get requirementsTitle => 'Requisitos';

  @override
  String get signalRequirements =>
      'Requer signal-cli-rest-api em execução em um servidor:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegistre/vincule seu número Signal via a API REST, depois insira a URL e seu número de telefone abaixo.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Seu número de telefone Signal';

  @override
  String get userIdLabel => 'ID de Usuário';

  @override
  String get enterDiscordUserId => 'Digite o ID de usuário do Discord';

  @override
  String get enterTelegramUserId => 'Digite o ID de usuário do Telegram';

  @override
  String get fromDiscordDevPortal => 'Do Portal do Desenvolvedor Discord';

  @override
  String get allowedUserIdsTitle => 'IDs de Usuário Permitidos';

  @override
  String get approvedDevice => 'Dispositivo aprovado';

  @override
  String get allowedUser => 'Usuário permitido';

  @override
  String get howToGetBotToken => 'Como obter seu token do bot';

  @override
  String get discordTokenInstructions =>
      '1. Vá ao Portal do Desenvolvedor Discord\n2. Crie uma nova aplicação e bot\n3. Copie o token e cole acima\n4. Ative o Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Abra o Telegram e procure por @BotFather\n2. Envie /newbot e siga as instruções\n3. Copie o token e cole acima';

  @override
  String get fromBotFatherHint => 'Obter de @BotFather';

  @override
  String get accessTokenLabel => 'Token de acesso';

  @override
  String get notSetOpenAccess =>
      'Não configurado — acesso aberto (apenas loopback)';

  @override
  String get gatewayAccessToken => 'Token de acesso do gateway';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth => 'Deixe vazio para desativar autenticação';

  @override
  String get toolPolicies => 'Políticas de Ferramentas';

  @override
  String get toolPoliciesDesc =>
      'Controle o que o agente pode acessar. Ferramentas desativadas ficam ocultas da IA e bloqueadas em tempo de execução.';

  @override
  String get privacySensors => 'Privacidade e Sensores';

  @override
  String get networkCategory => 'Rede';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get toolTakePhotos => 'Tirar Fotos';

  @override
  String get toolTakePhotosDesc =>
      'Permitir que o agente tire fotos usando a câmera';

  @override
  String get toolRecordVideo => 'Gravar Vídeo';

  @override
  String get toolRecordVideoDesc => 'Permitir que o agente grave vídeos';

  @override
  String get toolLocation => 'Localização';

  @override
  String get toolLocationDesc =>
      'Permitir que o agente leia sua localização GPS atual';

  @override
  String get toolHealthData => 'Dados de Saúde';

  @override
  String get toolHealthDataDesc =>
      'Permitir que o agente leia dados de saúde/fitness';

  @override
  String get toolContacts => 'Contatos';

  @override
  String get toolContactsDesc => 'Permitir que o agente pesquise seus contatos';

  @override
  String get toolScreenshots => 'Capturas de Tela';

  @override
  String get toolScreenshotsDesc =>
      'Permitir que o agente tire capturas de tela';

  @override
  String get toolWebFetch => 'Busca Web';

  @override
  String get toolWebFetchDesc =>
      'Permitir que o agente busque conteúdo de URLs';

  @override
  String get toolWebSearch => 'Pesquisa Web';

  @override
  String get toolWebSearchDesc => 'Permitir que o agente pesquise na web';

  @override
  String get toolHttpRequests => 'Requisições HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Permitir que o agente faça requisições HTTP arbitrárias';

  @override
  String get toolSandboxShell => 'Shell Sandbox';

  @override
  String get toolSandboxShellDesc =>
      'Permitir que o agente execute comandos shell no sandbox';

  @override
  String get toolImageGeneration => 'Geração de Imagens';

  @override
  String get toolImageGenerationDesc =>
      'Permitir que o agente gere imagens via IA';

  @override
  String get toolLaunchApps => 'Lançar Apps';

  @override
  String get toolLaunchAppsDesc =>
      'Permitir que o agente abra aplicativos instalados';

  @override
  String get toolLaunchIntents => 'Lançar Intents';

  @override
  String get toolLaunchIntentsDesc =>
      'Permitir que o agente lance intents Android (links profundos, telas do sistema)';

  @override
  String get renameSession => 'Renomear sessão';

  @override
  String get myConversationName => 'Meu nome de conversa';

  @override
  String get renameAction => 'Renomear';

  @override
  String get couldNotTranscribeAudio => 'Não foi possível transcrever o áudio';

  @override
  String get stopRecording => 'Parar gravação';

  @override
  String get voiceInput => 'Entrada de voz';

  @override
  String get speakMessage => 'Ler em voz alta';

  @override
  String get stopSpeaking => 'Parar leitura';

  @override
  String get selectText => 'Selecionar texto';

  @override
  String get messageCopied => 'Mensagem copiada';

  @override
  String get copyTooltip => 'Copiar';

  @override
  String get commandsTooltip => 'Comandos';

  @override
  String get providersAndModels => 'Provedores e Modelos';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modelos configurados',
      one: '1 modelo configurado',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Início automático ativado';

  @override
  String get autoStartOffLabel => 'Início automático desativado';

  @override
  String get allToolsEnabled => 'Todas as ferramentas ativadas';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ferramentas desativadas',
      one: '1 ferramenta desativada',
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
  String get officialWebsite => 'Site oficial';

  @override
  String get noPendingPairingRequests =>
      'Nenhuma solicitação de emparelhamento pendente';

  @override
  String get pairingRequestsTitle => 'Solicitações de Emparelhamento';

  @override
  String get gatewayStartingStatus => 'Iniciando gateway...';

  @override
  String get gatewayRetryingStatus => 'Tentando reiniciar gateway...';

  @override
  String get errorStartingGateway => 'Erro ao iniciar gateway';

  @override
  String get runningStatus => 'Em execução';

  @override
  String get stoppedStatus => 'Parado';

  @override
  String get notSetUpStatus => 'Não configurado';

  @override
  String get configuredStatus => 'Configurado';

  @override
  String get whatsAppConfigSaved => 'Configuração do WhatsApp salva';

  @override
  String get whatsAppDisconnected => 'WhatsApp desconectado';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Aplicando...';

  @override
  String get reconnectWhatsApp => 'Reconectar WhatsApp';

  @override
  String get saveSettingsLabel => 'Salvar Configurações';

  @override
  String get applySettingsRestart => 'Aplicar Configurações e Reiniciar';

  @override
  String get whatsAppMode => 'Modo WhatsApp';

  @override
  String get myPersonalNumber => 'Meu número pessoal';

  @override
  String get myPersonalNumberDesc =>
      'Mensagens que você envia para seu próprio chat do WhatsApp despertam o agente.';

  @override
  String get dedicatedBotAccount => 'Conta de bot dedicada';

  @override
  String get dedicatedBotAccountDesc =>
      'Mensagens enviadas da própria conta vinculada são ignoradas como saída.';

  @override
  String get allowedNumbers => 'Números Permitidos';

  @override
  String get addNumberTitle => 'Adicionar Número';

  @override
  String get phoneNumberJid => 'Número de telefone / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Nenhum número permitido configurado';

  @override
  String get devicesAppearAfterPairing =>
      'Dispositivos aparecem aqui após aprovar solicitações de emparelhamento';

  @override
  String get addPhoneNumbersHint =>
      'Adicione números de telefone para permitir que usem o bot';

  @override
  String get allowedNumber => 'Número permitido';

  @override
  String get howToConnect => 'Como conectar';

  @override
  String get whatsAppConnectInstructions =>
      '1. Toque em \"Conectar WhatsApp\" acima\n2. Um código QR aparecerá — escaneie com WhatsApp\n   (Configurações → Dispositivos Conectados → Conectar Dispositivo)\n3. Uma vez conectado, mensagens recebidas são automaticamente\n   encaminhadas para seu agente IA ativo';

  @override
  String get whatsAppPairingDesc =>
      'Novos remetentes recebem um código de emparelhamento. Você os aprova.';

  @override
  String get whatsAppAllowlistDesc =>
      'Apenas números de telefone específicos podem enviar mensagens ao bot.';

  @override
  String get whatsAppOpenDesc =>
      'Qualquer pessoa que envie mensagem pode usar o bot.';

  @override
  String get whatsAppDisabledDesc =>
      'O bot não responderá a nenhuma mensagem recebida.';

  @override
  String get sessionExpiredRelink =>
      'Sessão expirada. Toque em \"Reconectar\" abaixo para escanear um novo código QR.';

  @override
  String get connectWhatsAppBelow =>
      'Toque em \"Conectar WhatsApp\" abaixo para vincular sua conta.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp aceitou o QR. Finalizando a vinculação...';

  @override
  String get waitingForWhatsApp =>
      'Aguardando WhatsApp completar a vinculação...';

  @override
  String get focusedLabel => 'Focado';

  @override
  String get balancedLabel => 'Equilibrado';

  @override
  String get creativeLabel => 'Criativo';

  @override
  String get preciseLabel => 'Preciso';

  @override
  String get expressiveLabel => 'Expressivo';

  @override
  String get browseLabel => 'Explorar';

  @override
  String get apiTokenLabel => 'Token API';

  @override
  String get connectToClawHub => 'Conectar ao ClawHub';

  @override
  String get clawHubLoginHint =>
      'Faça login no ClawHub para acessar habilidades premium e instalar pacotes';

  @override
  String get howToGetApiToken => 'Como obter seu token API:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Visite clawhub.ai e faça login com GitHub\n2. Execute \"clawhub login\" no terminal\n3. Copie seu token e cole aqui';

  @override
  String connectionFailed(String error) {
    return 'Conexão falhou: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count execuções';
  }

  @override
  String nextRunLabel(String time) {
    return 'Próxima execução: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Último erro: $error';
  }

  @override
  String get cronJobHintText =>
      'Instruções para o agente quando esta tarefa disparar…';

  @override
  String get androidPermissions => 'Permissões Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw pode controlar sua tela em seu nome — tocando botões, preenchendo formulários, rolando e automatizando tarefas repetitivas em qualquer aplicativo.';

  @override
  String get twoPermissionsNeeded =>
      'Duas permissões são necessárias para a experiência completa. Você pode pular isso e ativá-las depois nas Configurações.';

  @override
  String get accessibilityService => 'Serviço de Acessibilidade';

  @override
  String get accessibilityServiceDesc =>
      'Permite tocar, deslizar, digitar e ler conteúdo da tela';

  @override
  String get displayOverOtherApps => 'Exibir Sobre Outros Apps';

  @override
  String get displayOverOtherAppsDesc =>
      'Mostra um chip de status flutuante para você ver o que o agente está fazendo';

  @override
  String get changeDefaultModel => 'Alterar modelo padrão';

  @override
  String setModelAsDefault(String name) {
    return 'Definir $name como o modelo padrão.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Também atualizar $count agente$_temp0';
  }

  @override
  String get startNewSessions => 'Iniciar novas sessões';

  @override
  String get currentConversationsArchived =>
      'Conversas atuais serão arquivadas';

  @override
  String get applyAction => 'Aplicar';

  @override
  String applyModelQuestion(String name) {
    return 'Aplicar $name?';
  }

  @override
  String get setAsDefaultModel => 'Definir como modelo padrão';

  @override
  String get usedByAgentsWithout =>
      'Usado por agentes sem um modelo específico';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'Aplicar a $count agente$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Provedor já autenticado — nenhuma chave API necessária.';

  @override
  String get selectFromList => 'Selecionar da lista';

  @override
  String get enterCustomModelId => 'Digite um ID de modelo personalizado';

  @override
  String get removeSkillTitle => 'Remover habilidade?';

  @override
  String get browseClawHubToDiscover =>
      'Explore o ClawHub para descobrir e instalar habilidades';

  @override
  String get addDeviceTooltip => 'Adicionar dispositivo';

  @override
  String get addNumberTooltip => 'Adicionar número';

  @override
  String get searchSkillsHint => 'Pesquisar habilidades...';

  @override
  String get loginToClawHub => 'Entrar no ClawHub';

  @override
  String get accountTooltip => 'Conta';

  @override
  String get editAction => 'Editar';

  @override
  String get setAsDefaultAction => 'Definir como padrão';

  @override
  String get chooseProviderTitle => 'Escolher provedor';

  @override
  String get apiKeyTitle => 'Chave API';

  @override
  String get slackConfigSaved =>
      'Slack salvo — reinicie o gateway para conectar';

  @override
  String get signalConfigSaved =>
      'Signal salvo — reinicie o gateway para conectar';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Adicionar dispositivo';

  @override
  String get skipAction => 'Pular';

  @override
  String get mcpServers => 'Servidores MCP';

  @override
  String get noMcpServersConfigured => 'Nenhum servidor MCP configurado';

  @override
  String get mcpServersEmptyHint =>
      'Adicione servidores MCP para dar ao seu agente acesso a ferramentas do GitHub, Notion, Slack, bancos de dados e mais.';

  @override
  String get addMcpServer => 'Adicionar servidor MCP';

  @override
  String get editMcpServer => 'Editar servidor MCP';

  @override
  String get removeMcpServer => 'Remover servidor MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Remover \"$name\"? Suas ferramentas não estarão mais disponíveis.';
  }

  @override
  String get mcpTransport => 'Transporte';

  @override
  String get testConnection => 'Testar conexão';

  @override
  String get mcpServerNameLabel => 'Nome do servidor';

  @override
  String get mcpServerNameHint => 'ex. GitHub, Notion, Meu BD';

  @override
  String get mcpServerUrlLabel => 'URL do servidor';

  @override
  String get mcpBearerTokenLabel => 'Token Bearer (opcional)';

  @override
  String get mcpBearerTokenHint => 'Deixe em branco se não requer autenticação';

  @override
  String get mcpCommandLabel => 'Comando';

  @override
  String get mcpArgumentsLabel => 'Argumentos (separados por espaço)';

  @override
  String get mcpEnvVarsLabel =>
      'Variáveis de ambiente (CHAVE=VALOR, uma por linha)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio não está disponível no iOS. Use HTTP ou SSE.';

  @override
  String get connectedStatus => 'Conectado';

  @override
  String get mcpConnecting => 'Conectando...';

  @override
  String get mcpConnectionError => 'Erro de conexão';

  @override
  String get mcpDisconnected => 'Desconectado';

  @override
  String mcpToolsCount(int count) {
    return '$count ferramentas';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — $count ferramentas descobertas';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Conectado (0 ferramentas)';

  @override
  String get mcpTestFailed =>
      'Falha na conexão. Verifique a URL/token do servidor.';

  @override
  String get mcpAddServer => 'Adicionar servidor';

  @override
  String get mcpSaveChanges => 'Salvar alterações';

  @override
  String get urlIsRequired => 'A URL é obrigatória';

  @override
  String get enterValidUrl => 'Insira uma URL válida';

  @override
  String get commandIsRequired => 'O comando é obrigatório';

  @override
  String skillRemoved(String name) {
    return 'Habilidade \"$name\" removida';
  }

  @override
  String get editFileContentHint => 'Editar conteúdo do arquivo...';

  @override
  String get whatsAppPairSubtitle =>
      'Vincule sua conta pessoal do WhatsApp com um código QR';

  @override
  String get whatsAppPairingOptional =>
      'A vinculação é opcional. Você pode terminar o processo agora e completar o link depois.';

  @override
  String get whatsAppEnableToLink =>
      'Ative o WhatsApp para começar a vincular este dispositivo.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp está vinculado. FlutterClaw poderá responder após a configuração inicial.';

  @override
  String get cancelLink => 'Cancelar link';
}
