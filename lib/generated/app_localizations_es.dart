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
  String get workspaceFiles => 'Archivos del Espacio de Trabajo';

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
  String get modelAlreadyAdded => 'This model is already in your list';
}
