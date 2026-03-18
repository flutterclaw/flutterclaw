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
}
