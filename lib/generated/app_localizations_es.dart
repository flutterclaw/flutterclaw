// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Chat';

  @override
  String get channels => 'Canales';

  @override
  String get agent => 'Agente';

  @override
  String get settings => 'Ajustes';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get yourPersonalAssistant => 'Tu asistente personal de IA';

  @override
  String get multiChannelChat => 'Chat multicanal';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, Chat y más';

  @override
  String get powerfulAIModels => 'Modelos de IA potentes';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok y modelos gratuitos';

  @override
  String get localGateway => 'Gateway local';

  @override
  String get localGatewayDesc =>
      'Se ejecuta en tu dispositivo, tus datos son tuyos';

  @override
  String get chooseProvider => 'Elige un Proveedor';

  @override
  String get selectProviderDesc =>
      'Selecciona cómo quieres conectarte a modelos de IA.';

  @override
  String get startForFree => 'Comienza Gratis';

  @override
  String get freeProvidersDesc =>
      'Estos proveedores ofrecen modelos gratuitos para que empieces sin costo.';

  @override
  String get free => 'GRATIS';

  @override
  String get otherProviders => 'Otros Proveedores';

  @override
  String connectToProvider(String provider) {
    return 'Conectar a $provider';
  }

  @override
  String get enterApiKeyDesc => 'Ingresa tu clave API y selecciona un modelo.';

  @override
  String get dontHaveApiKey => '¿No tienes una clave API?';

  @override
  String get createAccountCopyKey => 'Crea una cuenta y copia tu clave.';

  @override
  String get signUp => 'Registrarse';

  @override
  String get apiKey => 'Clave API';

  @override
  String get pasteFromClipboard => 'Pegar del portapapeles';

  @override
  String get apiBaseUrl => 'URL Base de API';

  @override
  String get selectModel => 'Seleccionar Modelo';

  @override
  String get modelId => 'ID del Modelo';

  @override
  String get validateKey => 'Validar Clave';

  @override
  String get validating => 'Validando...';

  @override
  String get invalidApiKey => 'Clave API inválida';

  @override
  String get gatewayConfiguration => 'Configuración del Gateway';

  @override
  String get gatewayConfigDesc =>
      'El gateway es el plano de control local para tu asistente.';

  @override
  String get defaultSettingsNote =>
      'La configuración predeterminada funciona para la mayoría de los usuarios. Cámbiala solo si sabes qué necesitas.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Puerto';

  @override
  String get autoStartGateway => 'Iniciar gateway automáticamente';

  @override
  String get autoStartGatewayDesc =>
      'Iniciar el gateway automáticamente cuando la aplicación se inicie.';

  @override
  String get channelsPageTitle => 'Canales';

  @override
  String get channelsPageDesc =>
      'Conecta canales de mensajería opcionalmente. Siempre puedes configurarlos más tarde en Ajustes.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Conecta un bot de Telegram.';

  @override
  String get openBotFather => 'Abrir BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Conecta un bot de Discord.';

  @override
  String get developerPortal => 'Portal de Desarrolladores';

  @override
  String get botToken => 'Token del Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Token del Bot de $platform';
  }

  @override
  String get readyToGo => 'Listo para Empezar';

  @override
  String get reviewConfiguration =>
      'Revisa tu configuración e inicia FlutterClaw.';

  @override
  String get model => 'Modelo';

  @override
  String viaProvider(String provider) {
    return 'vía $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly => 'Solo Chat (puedes agregar más después)';

  @override
  String get webChat => 'Chat';

  @override
  String get starting => 'Iniciando...';

  @override
  String get startFlutterClaw => 'Iniciar FlutterClaw';

  @override
  String get newSession => 'Nueva sesión';

  @override
  String get photoLibrary => 'Biblioteca de Fotos';

  @override
  String get camera => 'Cámara';

  @override
  String get whatDoYouSeeInImage => '¿Qué ves en esta imagen?';

  @override
  String get imagePickerNotAvailable =>
      'El selector de imágenes no está disponible en el Simulador. Usa un dispositivo real.';

  @override
  String get couldNotOpenImagePicker =>
      'No se pudo abrir el selector de imágenes.';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get attachImage => 'Adjuntar imagen';

  @override
  String get messageFlutterClaw => 'Mensaje a FlutterClaw...';

  @override
  String get channelsAndGateway => 'Canales y Gateway';

  @override
  String get stop => 'Detener';

  @override
  String get start => 'Iniciar';

  @override
  String status(String status) {
    return 'Estado: $status';
  }

  @override
  String get builtInChatInterface => 'Interfaz de chat integrada';

  @override
  String get notConfigured => 'No configurado';

  @override
  String get connected => 'Conectado';

  @override
  String get configuredStarting => 'Configurado (iniciando...)';

  @override
  String get telegramConfiguration => 'Configuración de Telegram';

  @override
  String get fromBotFather => 'De @BotFather';

  @override
  String get allowedUserIds =>
      'IDs de Usuario Permitidos (separados por comas)';

  @override
  String get leaveEmptyToAllowAll => 'Dejar vacío para permitir todos';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saveAndConnect => 'Guardar y Conectar';

  @override
  String get discordConfiguration => 'Configuración de Discord';

  @override
  String get pendingPairingRequests =>
      'Solicitudes de Emparejamiento Pendientes';

  @override
  String get approve => 'Aprobar';

  @override
  String get reject => 'Rechazar';

  @override
  String get expired => 'Expirado';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}m restantes';
  }

  @override
  String get workspaceFiles => 'Espacio de Trabajo';

  @override
  String get personalAIAssistant => 'Asistente Personal de IA';

  @override
  String sessionsCount(int count) {
    return 'Sesiones ($count)';
  }

  @override
  String get noActiveSessions => 'No hay sesiones activas';

  @override
  String get startConversationToCreate =>
      'Inicia una conversación para crear una';

  @override
  String get startConversationToSee =>
      'Inicia una conversación para ver sesiones aquí';

  @override
  String get reset => 'Restablecer';

  @override
  String get cronJobs => 'Tareas Programadas';

  @override
  String get noCronJobs => 'No hay tareas programadas';

  @override
  String get addScheduledTasks => 'Agrega tareas programadas para tu agente';

  @override
  String get runNow => 'Ejecutar Ahora';

  @override
  String get enable => 'Habilitar';

  @override
  String get disable => 'Deshabilitar';

  @override
  String get delete => 'Eliminar';

  @override
  String get skills => 'Habilidades';

  @override
  String get browseClawHub => 'Explorar ClawHub';

  @override
  String get noSkillsInstalled => 'No hay habilidades instaladas';

  @override
  String get browseClawHubToAdd => 'Explora ClawHub para agregar habilidades';

  @override
  String removeSkillConfirm(String name) {
    return '¿Eliminar \"$name\" de tus habilidades?';
  }

  @override
  String get clawHubSkills => 'Habilidades de ClawHub';

  @override
  String get searchSkills => 'Buscar habilidades...';

  @override
  String get noSkillsFound =>
      'No se encontraron habilidades. Intenta con una búsqueda diferente.';

  @override
  String installedSkill(String name) {
    return 'Se instaló $name';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'No se pudo instalar $name';
  }

  @override
  String get addCronJob => 'Agregar Tarea Programada';

  @override
  String get jobName => 'Nombre de la Tarea';

  @override
  String get dailySummaryExample => 'ej. Resumen Diario';

  @override
  String get taskPrompt => 'Instrucción de la Tarea';

  @override
  String get whatShouldAgentDo => '¿Qué debería hacer el agente?';

  @override
  String get interval => 'Intervalo';

  @override
  String get every5Minutes => 'Cada 5 minutos';

  @override
  String get every15Minutes => 'Cada 15 minutos';

  @override
  String get every30Minutes => 'Cada 30 minutos';

  @override
  String get everyHour => 'Cada hora';

  @override
  String get every6Hours => 'Cada 6 horas';

  @override
  String get every12Hours => 'Cada 12 horas';

  @override
  String get every24Hours => 'Cada 24 horas';

  @override
  String get add => 'Agregar';

  @override
  String get save => 'Guardar';

  @override
  String get sessions => 'Sesiones';

  @override
  String messagesCount(int count) {
    return '$count mensajes';
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
  String get noModelsConfigured => 'No hay modelos configurados';

  @override
  String get addModelToStartChatting =>
      'Agrega un modelo para empezar a chatear';

  @override
  String get addModel => 'Agregar Modelo';

  @override
  String get default_ => 'PREDETERMINADO';

  @override
  String get autoStart => 'Inicio automático';

  @override
  String get startGatewayWhenLaunches =>
      'Iniciar gateway cuando la aplicación se inicie';

  @override
  String get heartbeat => 'Latido';

  @override
  String get enabled => 'Habilitado';

  @override
  String get periodicAgentTasks =>
      'Tareas periódicas del agente desde HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get about => 'Acerca de';

  @override
  String get personalAIAssistantForIOS =>
      'Asistente Personal de IA para iOS y Android';

  @override
  String get version => 'Versión';

  @override
  String get basedOnOpenClaw => 'Basado en OpenClaw';

  @override
  String get removeModel => '¿Eliminar modelo?';

  @override
  String removeModelConfirm(String name) {
    return '¿Eliminar \"$name\" de tus modelos?';
  }

  @override
  String get remove => 'Eliminar';

  @override
  String get setAsDefault => 'Establecer como Predeterminado';

  @override
  String get paste => 'Pegar';

  @override
  String get chooseProviderStep => '1. Elegir Proveedor';

  @override
  String get selectModelStep => '2. Seleccionar Modelo';

  @override
  String get apiKeyStep => '3. Clave API';

  @override
  String getApiKeyAt(String provider) {
    return 'Obtener clave API en $provider';
  }

  @override
  String get justNow => 'justo ahora';

  @override
  String minutesAgo(int minutes) {
    return 'hace ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'hace ${hours}h';
  }

  @override
  String daysAgo(int days) {
    return 'hace ${days}d';
  }

  @override
  String get microphonePermissionDenied => 'Permiso de micrófono denegado';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Transcripción en vivo no disponible: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Error al iniciar grabación: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Usando transcripción en el dispositivo';

  @override
  String get transcribingWithWhisper => 'Transcribiendo con Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API falló: $error';
  }

  @override
  String get noTranscriptionCaptured => 'No se capturó transcripción';

  @override
  String failedToStopRecording(String error) {
    return 'Error al detener grabación: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Error al $action: $error';
  }

  @override
  String get pause => 'Pausar';

  @override
  String get resume => 'Reanudar';

  @override
  String get send => 'Enviar';

  @override
  String get liveActivityActive => 'Live Activity activa';

  @override
  String get restartGateway => 'Reiniciar Gateway';

  @override
  String modelLabel(String model) {
    return 'Modelo: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Tiempo activo: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Soporte en segundo plano activo - el gateway puede seguir respondiendo';

  @override
  String get webChatBuiltIn => 'Interfaz de chat integrada';

  @override
  String get configure => 'Configurar';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get agents => 'Agentes';

  @override
  String get agentFiles => 'Archivos del Agente';

  @override
  String get createAgent => 'Crear Agente';

  @override
  String get editAgent => 'Editar Agente';

  @override
  String get noAgentsYet => 'Aún no hay agentes';

  @override
  String get createYourFirstAgent => '¡Crea tu primer agente!';

  @override
  String get active => 'Activo';

  @override
  String get agentName => 'Nombre del Agente';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Seleccionar Emoji';

  @override
  String get vibe => 'Estilo';

  @override
  String get vibeHint => 'ej., amigable, formal, sarcástico';

  @override
  String get modelConfiguration => 'Configuración del Modelo';

  @override
  String get advancedSettings => 'Ajustes Avanzados';

  @override
  String get agentCreated => 'Agente creado';

  @override
  String get agentUpdated => 'Agente actualizado';

  @override
  String get agentDeleted => 'Agente eliminado';

  @override
  String switchedToAgent(String name) {
    return 'Cambiado a $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '¿Eliminar $name? Esto eliminará todos los datos del espacio de trabajo.';
  }

  @override
  String get agentDetails => 'Detalles del Agente';

  @override
  String get createdAt => 'Creado';

  @override
  String get lastUsed => 'Último Uso';

  @override
  String get basicInformation => 'Información Básica';

  @override
  String get switchToAgent => 'Cambiar de Agente';

  @override
  String get providers => 'Proveedores';

  @override
  String get addProvider => 'Agregar proveedor';

  @override
  String get noProvidersConfigured => 'No hay proveedores configurados.';

  @override
  String get editCredentials => 'Editar credenciales';

  @override
  String get defaultModelHint =>
      'El modelo predeterminado es usado por agentes que no especifican el suyo.';

  @override
  String get voiceCallModelSection => 'Llamada de voz (Live)';

  @override
  String get voiceCallModelDescription =>
      'Solo se usa al tocar el botón de llamada. El chat, agentes y tareas en segundo plano usan tu modelo habitual.';

  @override
  String get voiceCallModelLabel => 'Modelo Live';

  @override
  String get voiceCallModelAutomatic => 'Automático';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Arrancar en llamada de voz';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'En un chat nuevo y vacío con BOOTSTRAP.md, inicia una llamada de voz en lugar de un arranque silencioso por texto (cuando Live esté disponible).';

  @override
  String get liveVoiceNameLabel => 'Voz';

  @override
  String get firstHatchModeChoiceTitle => '¿Cómo te gustaría empezar?';

  @override
  String get firstHatchModeChoiceBody =>
      'Puedes chatear por texto con tu asistente o pasar a una conversación de voz, como una llamada rápida. Elige lo que te resulte más fácil.';

  @override
  String get firstHatchModeChoiceChatButton => 'Escribir en el chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Hablar por voz';

  @override
  String get liveVoiceBargeInHint =>
      'Habla cuando el asistente termine (el eco los interrumpía a mitad de frase).';

  @override
  String get liveVoiceFallbackTitle => 'En vivo';

  @override
  String get liveVoiceEndConversationTooltip => 'Finalizar conversación';

  @override
  String get liveVoiceStatusConnecting => 'Conectando…';

  @override
  String get liveVoiceStatusRunning => 'Ejecutando…';

  @override
  String get liveVoiceStatusSpeaking => 'Hablando…';

  @override
  String get liveVoiceStatusListening => 'Escuchando…';

  @override
  String get liveVoiceBadge => 'EN VIVO';

  @override
  String get cannotAddLiveModelAsChat =>
      'Este modelo es solo para llamadas de voz. Elige un modelo de chat de la lista.';

  @override
  String get authBearerTokenLabel => 'Token Bearer';

  @override
  String get authAccessKeysLabel => 'Claves de acceso';

  @override
  String authModelsFoundCount(int count) {
    return '$count modelos encontrados';
  }

  @override
  String authModelsFoundMoreManual(int count) {
    return '+ $count más — introduce el ID manualmente';
  }

  @override
  String get scanQrBarcodeTitle => 'Escanear QR / código de barras';

  @override
  String get oauthSignInTitle => 'Iniciar sesión';

  @override
  String get browserOverlayDone => 'Listo';

  @override
  String appInitializationError(String error) {
    return 'Error de inicialización: $error';
  }

  @override
  String get credentialsScreenTitle => 'Credenciales';

  @override
  String get credentialsIntroBody =>
      'Añade varias claves API por proveedor. FlutterClaw las rota automáticamente y enfría las que alcanzan límites de uso.';

  @override
  String get credentialsNoProvidersBody =>
      'No hay proveedores configurados.\nVe a Ajustes → Proveedores y modelos para añadir uno.';

  @override
  String get credentialsAddKeyTooltip => 'Añadir clave';

  @override
  String get credentialsNoExtraKeysMessage =>
      'Sin claves extra — se usa la clave de Proveedores y modelos.';

  @override
  String credentialsAddProviderKeyTitle(String provider) {
    return 'Añadir clave de $provider';
  }

  @override
  String get credentialsKeyLabelHint => 'Etiqueta (p. ej. «Clave del trabajo»)';

  @override
  String get credentialsApiKeyFieldLabel => 'Clave API';

  @override
  String get securitySettingsTitle => 'Seguridad';

  @override
  String get securitySettingsIntro =>
      'Controla las comprobaciones de seguridad frente a operaciones peligrosas. Se aplican a la sesión actual.';

  @override
  String get securitySectionToolExecution => 'EJECUCIÓN DE HERRAMIENTAS';

  @override
  String get securityPatternDetectionTitle =>
      'Detección de patrones de seguridad';

  @override
  String get securityPatternDetectionSubtitle =>
      'Bloquea patrones peligrosos: inyección de shell, path traversal, eval/exec, XSS, deserialización.';

  @override
  String get securityUnsafeModeBanner =>
      'Las comprobaciones de seguridad están desactivadas. Las llamadas a herramientas se ejecutarán sin validación. Reactívalas al terminar.';

  @override
  String get securitySectionHowItWorks => 'CÓMO FUNCIONA';

  @override
  String get securityHowItWorksBlocked =>
      'Si una llamada coincide con un patrón peligroso, se bloquea y se informa al agente del motivo.';

  @override
  String get securityHowItWorksUnsafeCmd =>
      'Usa /unsafe en el chat para una excepción puntual que permite una llamada bloqueada y luego reactiva las comprobaciones.';

  @override
  String get securityHowItWorksToggleSession =>
      'Desactiva aquí «Detección de patrones de seguridad» para deshabilitar las comprobaciones en toda la sesión.';

  @override
  String get holdToSetAsDefault =>
      'Mantén presionado para establecer como predeterminado';

  @override
  String get integrations => 'Integraciones';

  @override
  String get shortcutsIntegrations => 'Integraciones de Atajos';

  @override
  String get shortcutsIntegrationsDesc =>
      'Instala Atajos de iOS para ejecutar acciones de aplicaciones de terceros';

  @override
  String get dangerZone => 'Zona de peligro';

  @override
  String get resetOnboarding => 'Restablecer y reiniciar configuración inicial';

  @override
  String get resetOnboardingDesc =>
      'Elimina toda la configuración y regresa al asistente de configuración.';

  @override
  String get resetAllConfiguration => '¿Restablecer toda la configuración?';

  @override
  String get resetAllConfigurationDesc =>
      'Esto eliminará tus claves API, modelos y todos los ajustes. La aplicación regresará al asistente de configuración.\n\nTu historial de conversaciones no se elimina.';

  @override
  String get removeProvider => 'Eliminar proveedor';

  @override
  String removeProviderConfirm(String provider) {
    return '¿Eliminar credenciales de $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name establecido como modelo predeterminado';
  }

  @override
  String get photoImage => 'Foto / Imagen';

  @override
  String get documentPdfTxt => 'Documento (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'No se pudo abrir el documento: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get gatewayStopped => 'Gateway detenido';

  @override
  String get gatewayStarted => '¡Gateway iniciado exitosamente!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway falló: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Excepción: $error';
  }

  @override
  String get pairingRequestApproved => 'Solicitud de emparejamiento aprobada';

  @override
  String get pairingRequestRejected => 'Solicitud de emparejamiento rechazada';

  @override
  String get addDevice => 'Agregar Dispositivo';

  @override
  String get telegramConfigSaved => 'Configuración de Telegram guardada';

  @override
  String get discordConfigSaved => 'Configuración de Discord guardada';

  @override
  String get securityMethod => 'Método de Seguridad';

  @override
  String get pairingRecommended => 'Emparejamiento (Recomendado)';

  @override
  String get pairingDescription =>
      'Los nuevos usuarios reciben un código de emparejamiento. Tú los apruebas o rechazas.';

  @override
  String get allowlistTitle => 'Lista de permitidos';

  @override
  String get allowlistDescription =>
      'Solo IDs de usuario específicos pueden acceder al bot.';

  @override
  String get openAccess => 'Abierto';

  @override
  String get openAccessDescription =>
      'Cualquiera puede usar el bot inmediatamente (no recomendado).';

  @override
  String get disabledAccess => 'Deshabilitado';

  @override
  String get disabledAccessDescription =>
      'No se permiten mensajes directos. El bot no responderá a ningún mensaje.';

  @override
  String get approvedDevices => 'Dispositivos Aprobados';

  @override
  String get noApprovedDevicesYet => 'Aún no hay dispositivos aprobados';

  @override
  String get devicesAppearAfterApproval =>
      'Los dispositivos aparecerán aquí después de que apruebes sus solicitudes de emparejamiento';

  @override
  String get noAllowedUsersConfigured =>
      'No hay usuarios permitidos configurados';

  @override
  String get addUserIdsHint =>
      'Agrega IDs de usuario para permitirles usar el bot';

  @override
  String get removeDevice => '¿Eliminar dispositivo?';

  @override
  String removeAccessFor(String name) {
    return '¿Eliminar acceso para $name?';
  }

  @override
  String get saving => 'Guardando...';

  @override
  String get channelsLabel => 'Canales';

  @override
  String get clawHubAccount => 'Cuenta de ClawHub';

  @override
  String get loggedInToClawHub =>
      'Actualmente tienes sesión iniciada en ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Sesión cerrada de ClawHub';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get connect => 'Conectar';

  @override
  String get pasteClawHubToken => 'Pega tu token API de ClawHub';

  @override
  String get pleaseEnterApiToken => 'Por favor ingresa un token API';

  @override
  String get successfullyConnected => 'Conectado exitosamente a ClawHub';

  @override
  String get browseSkillsButton => 'Explorar Habilidades';

  @override
  String get installSkill => 'Instalar Habilidad';

  @override
  String get incompatibleSkill => 'Habilidad Incompatible';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Esta habilidad no puede ejecutarse en móvil (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Advertencia de Compatibilidad';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Esta habilidad fue diseñada para escritorio y puede no funcionar tal cual en móvil.\n\n$reason\n\n¿Te gustaría instalar una versión adaptada optimizada para móvil?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Instalar Original';

  @override
  String get installAdapted => 'Instalar Adaptada';

  @override
  String get resetSession => 'Restablecer Sesión';

  @override
  String resetSessionConfirm(String key) {
    return '¿Restablecer sesión \"$key\"? Esto eliminará todos los mensajes.';
  }

  @override
  String get sessionReset => 'Sesión restablecida';

  @override
  String get activeSessions => 'Sesiones Activas';

  @override
  String get scheduledTasks => 'Tareas Programadas';

  @override
  String get defaultBadge => 'Predeterminado';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName guardado';
  }

  @override
  String errorSavingFile(String error) {
    return 'Error al guardar archivo: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'No se puede eliminar el último agente';

  @override
  String get close => 'Cerrar';

  @override
  String get nameIsRequired => 'El nombre es obligatorio';

  @override
  String get pleaseSelectModel => 'Por favor selecciona un modelo';

  @override
  String temperatureLabel(String value) {
    return 'Temperatura: $value';
  }

  @override
  String get maxTokens => 'Tokens Máximos';

  @override
  String get maxTokensRequired => 'Los tokens máximos son obligatorios';

  @override
  String get mustBePositiveNumber => 'Debe ser un número positivo';

  @override
  String get maxToolIterations => 'Iteraciones Máximas de Herramienta';

  @override
  String get maxIterationsRequired =>
      'Las iteraciones máximas son obligatorias';

  @override
  String get restrictToWorkspace => 'Restringir al Espacio de Trabajo';

  @override
  String get restrictToWorkspaceDesc =>
      'Limitar operaciones de archivos al espacio de trabajo del agente';

  @override
  String get noModelsConfiguredLong =>
      'Por favor agrega al menos un modelo en Ajustes antes de crear un agente.';

  @override
  String get selectProviderFirst => 'Selecciona un proveedor primero';

  @override
  String get skip => 'Omitir';

  @override
  String get continueButton => 'Continuar';

  @override
  String get uiAutomation => 'Automatización de UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw puede controlar tu pantalla en tu nombre — presionando botones, completando formularios, desplazándose y automatizando tareas repetitivas en cualquier aplicación.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Esto requiere habilitar el Servicio de Accesibilidad en los Ajustes de Android. Puedes omitir esto y habilitarlo después.';

  @override
  String get openAccessibilitySettings => 'Abrir Ajustes de Accesibilidad';

  @override
  String get skipForNow => 'Omitir por ahora';

  @override
  String get checkingPermission => 'Verificando permiso…';

  @override
  String get accessibilityEnabled => 'Servicio de Accesibilidad habilitado';

  @override
  String get accessibilityNotEnabled =>
      'Servicio de Accesibilidad no habilitado';

  @override
  String get exploreIntegrations => 'Explorar Integraciones';

  @override
  String get requestTimedOut => 'La solicitud expiró';

  @override
  String get myShortcuts => 'Mis Atajos';

  @override
  String get addShortcut => 'Agregar Atajo';

  @override
  String get noShortcutsYet => 'Aún no hay atajos';

  @override
  String get shortcutsInstructions =>
      'Crea un atajo en la app Atajos de iOS, agrega la acción de callback al final, luego regístralo aquí para que la IA pueda ejecutarlo.';

  @override
  String get shortcutName => 'Nombre del atajo';

  @override
  String get shortcutNameHint => 'Nombre exacto de la app Atajos';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get whatDoesShortcutDo => '¿Qué hace este atajo?';

  @override
  String get callbackSetup => 'Configuración de callback';

  @override
  String get callbackInstructions =>
      'Cada atajo debe terminar con:\n① Obtener Valor para Clave → \"callbackUrl\" (de la Entrada del Atajo parseada como diccionario)\n② Abrir URLs ← salida de ①';

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
    return 'hace ${seconds}s';
  }

  @override
  String get messagesAbbrev => 'msgs';

  @override
  String get modelAlreadyAdded => 'Este modelo ya está en tu lista';

  @override
  String get bothTokensRequired => 'Se requieren ambos tokens';

  @override
  String get slackSavedRestart =>
      'Slack guardado — reinicia el gateway para conectar';

  @override
  String get slackConfiguration => 'Configuración de Slack';

  @override
  String get setupTitle => 'Configuración';

  @override
  String get slackSetupInstructions =>
      '1. Crea una App de Slack en api.slack.com/apps\n2. Habilita el Modo Socket → genera un Token a Nivel de App (xapp-…)\n   con alcance: connections:write\n3. Agrega Alcances de Token de Bot: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Instala la app en el espacio de trabajo → copia el Token del Bot (xoxb-…)';

  @override
  String get botTokenXoxb => 'Token del Bot (xoxb-…)';

  @override
  String get appLevelToken => 'Token a Nivel de App (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'Se requiere URL de API y número de teléfono';

  @override
  String get signalSavedRestart =>
      'Signal guardado — reinicia el gateway para conectar';

  @override
  String get signalConfiguration => 'Configuración de Signal';

  @override
  String get requirementsTitle => 'Requisitos';

  @override
  String get signalRequirements =>
      'Requiere signal-cli-rest-api ejecutándose en un servidor:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nRegistra/vincula tu número de Signal vía la REST API, luego ingresa la URL y tu número de teléfono a continuación.';

  @override
  String get signalApiUrl => 'URL de signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Tu número de teléfono de Signal';

  @override
  String get userIdLabel => 'ID de Usuario';

  @override
  String get enterDiscordUserId => 'Ingresa el ID de usuario de Discord';

  @override
  String get enterTelegramUserId => 'Ingresa el ID de usuario de Telegram';

  @override
  String get fromDiscordDevPortal => 'Del Portal de Desarrolladores de Discord';

  @override
  String get allowedUserIdsTitle => 'IDs de Usuario Permitidos';

  @override
  String get approvedDevice => 'Dispositivo aprobado';

  @override
  String get allowedUser => 'Usuario permitido';

  @override
  String get howToGetBotToken => 'Cómo obtener tu token del bot';

  @override
  String get discordTokenInstructions =>
      '1. Ve al Portal de Desarrolladores de Discord\n2. Crea una nueva aplicación y bot\n3. Copia el token y pégalo arriba\n4. Habilita el Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Abre Telegram y busca @BotFather\n2. Envía /newbot y sigue las instrucciones\n3. Copia el token y pégalo arriba';

  @override
  String get fromBotFatherHint => 'Obtener de @BotFather';

  @override
  String get accessTokenLabel => 'Token de acceso';

  @override
  String get notSetOpenAccess =>
      'No configurado — acceso abierto (solo loopback)';

  @override
  String get gatewayAccessToken => 'Token de acceso del gateway';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Dejar vacío para deshabilitar autenticación';

  @override
  String get toolPolicies => 'Políticas de Herramientas';

  @override
  String get toolPoliciesDesc =>
      'Controla a qué puede acceder el agente. Las herramientas deshabilitadas están ocultas de la IA y bloqueadas en tiempo de ejecución.';

  @override
  String get privacySensors => 'Privacidad y Sensores';

  @override
  String get networkCategory => 'Red';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get toolTakePhotos => 'Tomar Fotos';

  @override
  String get toolTakePhotosDesc =>
      'Permitir que el agente tome fotos usando la cámara';

  @override
  String get toolRecordVideo => 'Grabar Video';

  @override
  String get toolRecordVideoDesc => 'Permitir que el agente grabe video';

  @override
  String get toolLocation => 'Ubicación';

  @override
  String get toolLocationDesc =>
      'Permitir que el agente lea tu ubicación GPS actual';

  @override
  String get toolHealthData => 'Datos de Salud';

  @override
  String get toolHealthDataDesc =>
      'Permitir que el agente lea datos de salud/fitness';

  @override
  String get toolContacts => 'Contactos';

  @override
  String get toolContactsDesc =>
      'Permitir que el agente busque en tus contactos';

  @override
  String get toolScreenshots => 'Capturas de Pantalla';

  @override
  String get toolScreenshotsDesc =>
      'Permitir que el agente tome capturas de pantalla';

  @override
  String get toolWebFetch => 'Obtención Web';

  @override
  String get toolWebFetchDesc =>
      'Permitir que el agente obtenga contenido desde URLs';

  @override
  String get toolWebSearch => 'Búsqueda Web';

  @override
  String get toolWebSearchDesc => 'Permitir que el agente busque en la web';

  @override
  String get toolHttpRequests => 'Solicitudes HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Permitir que el agente haga solicitudes HTTP arbitrarias';

  @override
  String get toolSandboxShell => 'Shell de Sandbox';

  @override
  String get toolSandboxShellDesc =>
      'Permitir que el agente ejecute comandos de shell en el sandbox';

  @override
  String get toolImageGeneration => 'Generación de Imágenes';

  @override
  String get toolImageGenerationDesc =>
      'Permitir que el agente genere imágenes vía IA';

  @override
  String get toolLaunchApps => 'Lanzar Apps';

  @override
  String get toolLaunchAppsDesc =>
      'Permitir que el agente abra aplicaciones instaladas';

  @override
  String get toolLaunchIntents => 'Lanzar Intents';

  @override
  String get toolLaunchIntentsDesc =>
      'Permitir que el agente lance intents de Android (enlaces profundos, pantallas del sistema)';

  @override
  String get renameSession => 'Renombrar sesión';

  @override
  String get myConversationName => 'Mi nombre de conversación';

  @override
  String get renameAction => 'Renombrar';

  @override
  String get couldNotTranscribeAudio => 'No se pudo transcribir el audio';

  @override
  String get stopRecording => 'Detener grabación';

  @override
  String get voiceInput => 'Entrada de voz';

  @override
  String get speakMessage => 'Leer en voz alta';

  @override
  String get stopSpeaking => 'Detener lectura';

  @override
  String get selectText => 'Seleccionar texto';

  @override
  String get messageCopied => 'Mensaje copiado';

  @override
  String get copyTooltip => 'Copiar';

  @override
  String get commandsTooltip => 'Comandos';

  @override
  String get providersAndModels => 'Proveedores y Modelos';

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
  String get autoStartEnabledLabel => 'Inicio automático habilitado';

  @override
  String get autoStartOffLabel => 'Inicio automático desactivado';

  @override
  String get allToolsEnabled => 'Todas las herramientas habilitadas';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count herramientas deshabilitadas',
      one: '1 herramienta deshabilitada',
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
  String get officialWebsite => 'Sitio web oficial';

  @override
  String get noPendingPairingRequests =>
      'No hay solicitudes de emparejamiento pendientes';

  @override
  String get pairingRequestsTitle => 'Solicitudes de Emparejamiento';

  @override
  String get gatewayStartingStatus => 'Iniciando gateway...';

  @override
  String get gatewayRetryingStatus => 'Reintentando inicio del gateway...';

  @override
  String get errorStartingGateway => 'Error al iniciar gateway';

  @override
  String get runningStatus => 'En ejecución';

  @override
  String get stoppedStatus => 'Detenido';

  @override
  String get notSetUpStatus => 'No configurado';

  @override
  String get configuredStatus => 'Configurado';

  @override
  String get whatsAppConfigSaved => 'Configuración de WhatsApp guardada';

  @override
  String get whatsAppDisconnected => 'WhatsApp desconectado';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Aplicando...';

  @override
  String get reconnectWhatsApp => 'Reconectar WhatsApp';

  @override
  String get saveSettingsLabel => 'Guardar Configuración';

  @override
  String get applySettingsRestart => 'Aplicar Configuración y Reiniciar';

  @override
  String get whatsAppMode => 'Modo WhatsApp';

  @override
  String get myPersonalNumber => 'Mi número personal';

  @override
  String get myPersonalNumberDesc =>
      'Los mensajes que envíes a tu propio chat de WhatsApp despiertan al agente.';

  @override
  String get dedicatedBotAccount => 'Cuenta de bot dedicada';

  @override
  String get dedicatedBotAccountDesc =>
      'Los mensajes enviados desde la cuenta vinculada misma se ignoran como salientes.';

  @override
  String get allowedNumbers => 'Números Permitidos';

  @override
  String get addNumberTitle => 'Agregar Número';

  @override
  String get phoneNumberJid => 'Número de teléfono / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'No hay números permitidos configurados';

  @override
  String get devicesAppearAfterPairing =>
      'Los dispositivos aparecen aquí después de aprobar solicitudes de emparejamiento';

  @override
  String get addPhoneNumbersHint =>
      'Agrega números de teléfono para permitirles usar el bot';

  @override
  String get allowedNumber => 'Número permitido';

  @override
  String get howToConnect => 'Cómo conectar';

  @override
  String get whatsAppConnectInstructions =>
      '1. Toca \"Conectar WhatsApp\" arriba\n2. Aparecerá un código QR — escanéalo con WhatsApp\n   (Configuración → Dispositivos Vinculados → Vincular un Dispositivo)\n3. Una vez conectado, los mensajes entrantes se enrutan\n   automáticamente a tu agente de IA activo';

  @override
  String get whatsAppPairingDesc =>
      'Los nuevos remitentes reciben un código de emparejamiento. Tú los apruebas.';

  @override
  String get whatsAppAllowlistDesc =>
      'Solo números de teléfono específicos pueden enviar mensajes al bot.';

  @override
  String get whatsAppOpenDesc =>
      'Cualquiera que te envíe un mensaje puede usar el bot.';

  @override
  String get whatsAppDisabledDesc =>
      'El bot no responderá a ningún mensaje entrante.';

  @override
  String get sessionExpiredRelink =>
      'Sesión expirada. Toca \"Reconectar\" abajo para escanear un código QR nuevo.';

  @override
  String get connectWhatsAppBelow =>
      'Toca \"Conectar WhatsApp\" abajo para vincular tu cuenta.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp aceptó el QR. Finalizando el vínculo...';

  @override
  String get waitingForWhatsApp =>
      'Esperando a que WhatsApp complete el vínculo...';

  @override
  String get focusedLabel => 'Enfocado';

  @override
  String get balancedLabel => 'Equilibrado';

  @override
  String get creativeLabel => 'Creativo';

  @override
  String get preciseLabel => 'Preciso';

  @override
  String get expressiveLabel => 'Expresivo';

  @override
  String get browseLabel => 'Explorar';

  @override
  String get apiTokenLabel => 'Token API';

  @override
  String get connectToClawHub => 'Conectar a ClawHub';

  @override
  String get clawHubLoginHint =>
      'Inicia sesión en ClawHub para acceder a habilidades premium e instalar paquetes';

  @override
  String get howToGetApiToken => 'Cómo obtener tu token API:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Visita clawhub.ai e inicia sesión con GitHub\n2. Ejecuta \"clawhub login\" en la terminal\n3. Copia tu token y pégalo aquí';

  @override
  String connectionFailed(String error) {
    return 'Conexión fallida: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count ejecuciones';
  }

  @override
  String nextRunLabel(String time) {
    return 'Próxima ejecución: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Último error: $error';
  }

  @override
  String get cronJobHintText =>
      'Instrucciones para el agente cuando se active esta tarea…';

  @override
  String get androidPermissions => 'Permisos de Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw puede controlar tu pantalla en tu nombre — presionando botones, completando formularios, desplazándose y automatizando tareas repetitivas en cualquier aplicación.';

  @override
  String get twoPermissionsNeeded =>
      'Se necesitan dos permisos para la experiencia completa. Puedes omitir esto y habilitarlos después en Configuración.';

  @override
  String get accessibilityService => 'Servicio de Accesibilidad';

  @override
  String get accessibilityServiceDesc =>
      'Permite tocar, deslizar, escribir y leer contenido de pantalla';

  @override
  String get displayOverOtherApps => 'Mostrar Sobre Otras Apps';

  @override
  String get displayOverOtherAppsDesc =>
      'Muestra un chip de estado flotante para que puedas ver qué está haciendo el agente';

  @override
  String get changeDefaultModel => 'Cambiar modelo predeterminado';

  @override
  String setModelAsDefault(String name) {
    return 'Establecer $name como el modelo predeterminado.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return 'También actualizar $count agente$_temp0';
  }

  @override
  String get startNewSessions => 'Iniciar nuevas sesiones';

  @override
  String get currentConversationsArchived =>
      'Las conversaciones actuales se archivarán';

  @override
  String get applyAction => 'Aplicar';

  @override
  String applyModelQuestion(String name) {
    return '¿Aplicar $name?';
  }

  @override
  String get setAsDefaultModel => 'Establecer como modelo predeterminado';

  @override
  String get usedByAgentsWithout =>
      'Usado por agentes sin un modelo específico';

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
      'Proveedor ya autenticado — no se necesita clave API.';

  @override
  String get selectFromList => 'Seleccionar de la lista';

  @override
  String get enterCustomModelId => 'Ingresar un ID de modelo personalizado';

  @override
  String get removeSkillTitle => '¿Eliminar habilidad?';

  @override
  String get browseClawHubToDiscover =>
      'Explora ClawHub para descubrir e instalar habilidades';

  @override
  String get addDeviceTooltip => 'Agregar dispositivo';

  @override
  String get addNumberTooltip => 'Agregar número';

  @override
  String get searchSkillsHint => 'Buscar habilidades...';

  @override
  String get loginToClawHub => 'Iniciar sesión en ClawHub';

  @override
  String get accountTooltip => 'Cuenta';

  @override
  String get editAction => 'Editar';

  @override
  String get setAsDefaultAction => 'Establecer como predeterminado';

  @override
  String get chooseProviderTitle => 'Elegir proveedor';

  @override
  String get apiKeyTitle => 'Clave API';

  @override
  String get slackConfigSaved =>
      'Slack guardado — reinicia el gateway para conectar';

  @override
  String get signalConfigSaved =>
      'Signal guardado — reinicia el gateway para conectar';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Agregar dispositivo';

  @override
  String get skipAction => 'Omitir';

  @override
  String get mcpServers => 'Servidores MCP';

  @override
  String get noMcpServersConfigured => 'No hay servidores MCP configurados';

  @override
  String get mcpServersEmptyHint =>
      'Agrega servidores MCP para dar a tu agente acceso a herramientas de GitHub, Notion, Slack, bases de datos y más.';

  @override
  String get addMcpServer => 'Agregar servidor MCP';

  @override
  String get editMcpServer => 'Editar servidor MCP';

  @override
  String get removeMcpServer => 'Eliminar servidor MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return '¿Eliminar \"$name\"? Sus herramientas ya no estarán disponibles.';
  }

  @override
  String get mcpTransport => 'Transporte';

  @override
  String get testConnection => 'Probar conexión';

  @override
  String get mcpServerNameLabel => 'Nombre del servidor';

  @override
  String get mcpServerNameHint => 'ej. GitHub, Notion, Mi BD';

  @override
  String get mcpServerUrlLabel => 'URL del servidor';

  @override
  String get mcpBearerTokenLabel => 'Token Bearer (opcional)';

  @override
  String get mcpBearerTokenHint =>
      'Déjalo en blanco si no requiere autenticación';

  @override
  String get mcpCommandLabel => 'Comando';

  @override
  String get mcpArgumentsLabel => 'Argumentos (separados por espacios)';

  @override
  String get mcpEnvVarsLabel =>
      'Variables de entorno (CLAVE=VALOR, una por línea)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio no está disponible en iOS. Usa HTTP o SSE.';

  @override
  String get connectedStatus => 'Conectado';

  @override
  String get mcpConnecting => 'Conectando...';

  @override
  String get mcpConnectionError => 'Error de conexión';

  @override
  String get mcpDisconnected => 'Desconectado';

  @override
  String mcpToolsCount(int count) {
    return '$count herramientas';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — $count herramientas descubiertas';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Conectado (0 herramientas)';

  @override
  String get mcpTestFailed =>
      'Conexión fallida. Verifica la URL/token del servidor.';

  @override
  String get mcpAddServer => 'Agregar servidor';

  @override
  String get mcpSaveChanges => 'Guardar cambios';

  @override
  String get urlIsRequired => 'La URL es obligatoria';

  @override
  String get enterValidUrl => 'Ingresa una URL válida';

  @override
  String get commandIsRequired => 'El comando es obligatorio';

  @override
  String skillRemoved(String name) {
    return 'Habilidad \"$name\" eliminada';
  }

  @override
  String get editFileContentHint => 'Editar contenido del archivo...';

  @override
  String get whatsAppPairSubtitle =>
      'Vincula tu cuenta personal de WhatsApp con un código QR';

  @override
  String get whatsAppPairingOptional =>
      'La vinculación es opcional. Puedes terminar el proceso ahora y completar el enlace más tarde.';

  @override
  String get whatsAppEnableToLink =>
      'Activa WhatsApp para comenzar a vincular este dispositivo.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp está vinculado. FlutterClaw podrá responder después del proceso inicial.';

  @override
  String get cancelLink => 'Cancelar enlace';
}
