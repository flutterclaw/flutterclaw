import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/services/ios_background_audio_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/services/live_activity_service.dart';
import 'package:logging/logging.dart';
import 'package:flutterclaw/channels/channel_interface.dart';
import 'package:flutterclaw/channels/discord.dart';
import 'package:flutterclaw/channels/router.dart';
import 'package:flutterclaw/channels/telegram.dart';
import 'package:flutterclaw/channels/webchat.dart';
import 'package:flutterclaw/channels/whatsapp.dart';
import 'package:flutterclaw/channels/slack.dart';
import 'package:flutterclaw/core/agent/chat_commands.dart';
import 'package:flutterclaw/core/agent/message_queue.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/services/cron_service.dart';
import 'package:flutterclaw/services/heartbeat_runner.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'package:flutterclaw/services/skills_service.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/providers/openai_provider.dart';
import 'package:flutterclaw/core/providers/provider_router.dart'
    as model_router;
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/core/agent/subagent_registry.dart';
import 'package:flutterclaw/tools/agent_management_tools.dart';
import 'package:flutterclaw/tools/agent_tools.dart';
import 'package:flutterclaw/tools/camera_tools.dart';
import 'package:flutterclaw/tools/calendar_tools.dart';
import 'package:flutterclaw/tools/contacts_tools.dart';
import 'package:flutterclaw/tools/device_tools.dart';
import 'package:flutterclaw/tools/fs_tools.dart';
import 'package:flutterclaw/tools/health_tools.dart';
import 'package:flutterclaw/tools/location_tools.dart';
import 'package:flutterclaw/tools/media_tools.dart';
import 'package:flutterclaw/tools/memory_tools.dart';
import 'package:flutterclaw/tools/message_tool.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:flutterclaw/tools/session_tools.dart';
import 'package:flutterclaw/tools/subagent_tools.dart';
import 'package:flutterclaw/tools/cron_tools.dart';
import 'package:flutterclaw/tools/shortcut_tools.dart';
import 'package:flutterclaw/tools/ui_automation_tools.dart';
import 'package:flutterclaw/tools/http_tools.dart';
import 'package:flutterclaw/tools/web_tools.dart';
import 'package:flutterclaw/tools/headless_browser_tool.dart';
import 'package:flutterclaw/services/deep_link_service.dart';
import 'package:flutterclaw/services/notification_service.dart';
import 'package:flutterclaw/services/sandbox_service.dart';
import 'package:flutterclaw/services/ui_automation_service.dart';
import 'package:flutterclaw/tools/sandbox_tools.dart';
import 'package:flutterclaw/tools/image_gen_tools.dart';
import 'package:flutterclaw/services/voice_recording_service.dart';
import 'package:flutterclaw/services/audio_transcription_service.dart';

final configManagerProvider = Provider<ConfigManager>((ref) {
  return ConfigManager();
});

/// Provider for list of all agent profiles
final agentProfilesProvider = Provider<List<AgentProfile>>((ref) {
  final configManager = ref.watch(configManagerProvider);
  return configManager.config.agentProfiles;
});

/// Provider for currently active agent
final activeAgentProvider = Provider<AgentProfile?>((ref) {
  final configManager = ref.watch(configManagerProvider);
  return configManager.config.activeAgent;
});

/// Provider for active agent's workspace path
final activeWorkspacePathProvider = FutureProvider<String>((ref) async {
  final configManager = ref.read(configManagerProvider);
  return await configManager.workspacePath;
});

/// Resolves the model name for a given session key.
/// Priority: session-level modelOverride → agent modelName → global default.
String resolveSessionModelName(
  String sessionKey,
  ConfigManager configManager,
  SessionManager sessionManager,
) {
  final defaults = configManager.config.agents.defaults;
  final parts = sessionKey.split(':');
  final channelType = parts.isNotEmpty ? parts[0] : sessionKey;
  final chatId = parts.length > 1 ? parts.sublist(1).join(':') : '';

  // Session-level override wins
  final meta = sessionManager
      .listSessions()
      .where((s) => s.key == sessionKey)
      .firstOrNull;
  if (meta?.modelOverride != null && meta!.modelOverride!.isNotEmpty) {
    return meta.modelOverride!;
  }

  // webchat sessions embed the agentId in chatId
  if (channelType == 'webchat') {
    final agent = configManager.config.agentProfiles
        .where((a) => a.id == chatId)
        .firstOrNull;
    if (agent != null) return agent.modelName;
  }

  // Fall back to the currently active agent, then global default
  return configManager.config.activeAgent?.modelName ?? defaults.modelName;
}

/// Returns whether the currently viewed session's model supports image input.
///
/// Resolution order:
/// 1. Session-level modelOverride
/// 2. Agent modelName (for webchat sessions)
/// 3. Active agent modelName
/// 4. Global default model
/// Vision check: ModelEntry.input explicit > ModelCatalog lookup > false
final activeModelSupportsVisionProvider = Provider<bool>((ref) {
  final configManager = ref.watch(configManagerProvider);
  final sessionManager = ref.watch(sessionManagerProvider);
  final activeKey = ref.watch(activeSessionKeyProvider);

  final modelName = resolveSessionModelName(
    activeKey,
    configManager,
    sessionManager,
  );
  final entry = configManager.config.getModel(modelName);
  if (entry == null) return false;

  if (entry.input != null) return entry.supportsVision;

  final catalogInput = ModelCatalog.inputFor(entry.model);
  if (catalogInput != null) return catalogInput.contains('image');

  return false;
});

final sessionManagerProvider = Provider<SessionManager>((ref) {
  final configManager = ref.watch(configManagerProvider);
  final sm = SessionManager(configManager);
  ref.onDispose(sm.dispose);
  return sm;
});

final subagentRegistryProvider = Provider<SubagentRegistry>((ref) {
  final registry = SubagentRegistry();
  ref.onDispose(registry.dispose);
  return registry;
});

final uiAutomationServiceProvider = Provider<UiAutomationService>((ref) {
  return UiAutomationService();
});

final sandboxServiceProvider = Provider<SandboxService>((ref) {
  return SandboxService();
});

/// Late-binder so MessageTool can send to channels without a circular provider dep.
void Function(ChannelRouter)? _pendingChannelRouterBinder;

final toolRegistryProvider = Provider<ToolRegistry>((ref) {
  final configManager = ref.read(configManagerProvider);
  final sessionManager = ref.read(sessionManagerProvider);

  final registry = ToolRegistry();

  // Apply tool policies from config
  registry.setDisabledTools(configManager.config.tools.disabled);

  Future<String> wsPath() => configManager.workspacePath;

  registry.register(ReadFileTool(wsPath));
  registry.register(WriteFileTool(wsPath));
  registry.register(EditFileTool(wsPath));
  registry.register(ListDirTool(wsPath));
  registry.register(AppendFileTool(wsPath));
  registry.register(WebSearchTool(config: configManager.config));
  final headlessBrowser = HeadlessBrowserTool();
  registry.register(WebFetchTool(headlessBrowser: headlessBrowser));
  registry.register(HttpRequestTool());
  registry.register(ImageGenTool(configManager: configManager));
  registry.register(headlessBrowser);
  registry.register(MemorySearchTool(wsPath));
  registry.register(MemoryGetTool(wsPath));
  registry.register(MemoryWriteTool(wsPath));
  registry.register(
    SessionStatusTool((key) async {
      final sessions = sessionManager.listSessions();
      final meta = sessions
          .where((s) => s.key == (key ?? 'webchat:default'))
          .firstOrNull;
      if (meta == null) return null;
      return {
        'key': meta.key,
        'channel': meta.channelType,
        'messages': meta.messageCount,
        'tokens': meta.totalTokens,
        'inputTokens': meta.inputTokens,
        'outputTokens': meta.outputTokens,
        'model':
            meta.modelOverride ??
            configManager.config.agents.defaults.modelName,
      };
    }),
  );
  registry.register(
    SessionsListTool(({int? limit}) async {
      final sessions = sessionManager.listActiveSessions();
      final capped = limit != null ? sessions.take(limit).toList() : sessions;
      return capped
          .map(
            (s) => {
              'key': s.key,
              'channel': s.channelType,
              'messages': s.messageCount,
              'tokens': s.totalTokens,
            },
          )
          .toList();
    }),
  );
  registry.register(DeviceStatusTool());
  registry.register(ClipboardReadTool());
  registry.register(ClipboardWriteTool());
  registry.register(ShareContentTool());
  registry.register(CameraTakePhotoTool());
  registry.register(CameraRecordVideoTool());
  registry.register(GetLocationTool());
  registry.register(CalendarListEventsTool());
  registry.register(CalendarCreateEventTool());
  registry.register(ContactsSearchTool());
  registry.register(GetHealthDataTool());
  registry.register(MediaPlayTool());
  registry.register(MediaControlTool());
  registry.register(
    SendNotificationTool(
      notificationService: ref.read(notificationServiceProvider),
      // Provide the active session key so tapping the notification opens that chat.
      sessionKeyGetter: () {
        final activeAgent = configManager.config.activeAgent;
        return activeAgent != null
            ? 'webchat:${activeAgent.id}'
            : 'webchat:default';
      },
    ),
  );
  registry.register(
    ScheduleReminderTool(
      notificationService: ref.read(notificationServiceProvider),
    ),
  );
  registry.register(
    CancelReminderTool(
      notificationService: ref.read(notificationServiceProvider),
    ),
  );
  // ChannelRouter is bound later (after channelRouterProvider is created) to
  // break the circular dep: toolRegistry → channelRouter → agentLoop → toolRegistry.
  ChannelRouter? channelRouter;
  registry.register(
    MessageTool(({
      required String channel,
      required String target,
      required String text,
      String? action,
      String? targetMessageId,
      String? emoji,
      String? participantId,
      bool? fromMe,
    }) async {
      final router = channelRouter;
      if (router == null) {
        throw StateError('ChannelRouter not yet initialized');
      }
      await router.sendMessage(
        OutgoingMessage(
          channelType: channel,
          chatId: target,
          text: text,
          action: action,
          targetMessageId: targetMessageId,
          emoji: emoji,
          participantId: participantId,
          fromMe: fromMe,
        ),
      );
    }),
  );
  // Expose setter so channelStartupProvider can bind it after creation.
  ref.onDispose(() => channelRouter = null);
  _pendingChannelRouterBinder = (r) => channelRouter = r;
  registry.register(
    ChannelSessionsTool(
      sessionManager: ref.read(sessionManagerProvider),
      pairingService: ref.read(pairingServiceProvider),
    ),
  );

  // Agent management tools (create/update/delete/switch permanent agents)
  void onConfigChanged() {
    ref.invalidate(agentProfilesProvider);
    ref.invalidate(activeAgentProvider);
    ref.invalidate(activeWorkspacePathProvider);
    ref.invalidate(activeModelSupportsVisionProvider);
  }

  registry.register(
    AgentCreateTool(
      configManager: configManager,
      onConfigChanged: onConfigChanged,
    ),
  );
  registry.register(
    AgentUpdateTool(
      configManager: configManager,
      onConfigChanged: onConfigChanged,
    ),
  );
  registry.register(
    AgentDeleteTool(
      configManager: configManager,
      onConfigChanged: onConfigChanged,
    ),
  );
  registry.register(
    AgentSwitchTool(
      configManager: configManager,
      onConfigChanged: onConfigChanged,
    ),
  );

  // Subagent orchestration tools — declared first so AgentSendTool can share them
  final subagentRegistry = ref.read(subagentRegistryProvider);
  final loopProxy = SubagentLoopProxy.instance;

  String currentSessionKey() {
    final activeAgent = configManager.config.activeAgent;
    return activeAgent != null
        ? 'webchat:${activeAgent.id}'
        : 'webchat:default';
  }

  // Agent communication tools
  registry.register(AgentsListTool(configManager: configManager));
  registry.register(
    AgentSendTool(
      configManager: configManager,
      loopProxy: loopProxy,
      registry: subagentRegistry,
      parentSessionKeyGetter: currentSessionKey,
      sendMessageCallback: (sourceId, targetId, message) async {
        await sessionManager.sendAgentMessage(
          sourceAgentId: sourceId,
          targetAgentId: targetId,
          message: message,
        );
      },
    ),
  );
  registry.register(
    AgentMessagesTool(
      configManager: configManager,
      getMessagesCallback: (agentId) async {
        return await sessionManager.getAgentMessages(agentId);
      },
    ),
  );

  registry.register(
    SessionsSpawnTool(
      registry: subagentRegistry,
      loopProxy: loopProxy,
      sessionManager: sessionManager,
      parentSessionKeyGetter: currentSessionKey,
    ),
  );
  registry.register(SessionsYieldTool());
  registry.register(
    SubagentsTool(
      registry: subagentRegistry,
      loopProxy: loopProxy,
      parentSessionKeyGetter: currentSessionKey,
    ),
  );
  registry.register(
    SessionsHistoryTool(
      sessionManager: sessionManager,
      currentSessionKeyGetter: currentSessionKey,
    ),
  );
  registry.register(
    SessionsSendTool(
      loopProxy: loopProxy,
      sessionManager: sessionManager,
      currentSessionKeyGetter: currentSessionKey,
    ),
  );

  // Cron job management tools
  final cronService = ref.read(cronServiceProvider);
  registry.register(
    CronCreateTool(
      cronService: cronService,
      notificationService: ref.read(notificationServiceProvider),
    ),
  );
  registry.register(CronListTool(cronService: cronService));
  registry.register(CronDeleteTool(cronService: cronService));
  registry.register(CronUpdateTool(cronService: cronService));

  // Shortcut tools
  final shortcutTools = ref.read(shortcutToolsServiceProvider);
  registry.register(RunShortcutTool(service: shortcutTools));

  // UI Automation tools (Android: full device automation via AccessibilityService;
  // iOS: screenshot only)
  final uiSvc = ref.read(uiAutomationServiceProvider);
  registry.register(UiCheckPermissionTool(uiSvc));
  registry.register(UiRequestPermissionTool(uiSvc));
  registry.register(UiTapTool(uiSvc));
  registry.register(UiSwipeTool(uiSvc));
  registry.register(UiTypeTextTool(uiSvc));
  registry.register(UiFindElementsTool(uiSvc));
  registry.register(UiClickElementTool(uiSvc));
  registry.register(UiScreenshotTool(uiSvc));
  registry.register(UiGlobalActionTool(uiSvc));

  // Sandbox shell tool (Android: PRoot + Alpine rootfs; iOS: unavailable stub)
  final sandboxSvc = ref.read(sandboxServiceProvider);
  registry.register(RunShellCommandTool(sandboxSvc));

  return registry;
});

final providerRouterProvider = Provider<ProviderRouter>((ref) {
  final configManager = ref.read(configManagerProvider);
  final models = configManager.config.modelList;

  final providers = <LlmProvider>[];
  for (var i = 0; i < models.length; i++) {
    providers.add(OpenAiProvider());
  }

  if (providers.isEmpty) {
    providers.add(OpenAiProvider());
  }

  return FailoverProviderRouter(
    primary: OpenAiProvider(),
    fallbacks: providers.length > 1 ? providers.sublist(1) : [],
    configManager: configManager,
  );
});

final agentLoopProvider = Provider<AgentLoop>((ref) {
  final skillsService = ref.read(skillsServiceProvider);
  final loop = AgentLoop(
    configManager: ref.watch(configManagerProvider),
    providerRouter: ref.watch(providerRouterProvider),
    toolRegistry: ref.watch(toolRegistryProvider),
    sessionManager: ref.watch(sessionManagerProvider),
    skillsPromptGetter: () => skillsService.getSkillsPrompt(),
  );
  // Bind the singleton proxy so sessions_spawn / subagents steer can call
  // the agent loop without a circular provider dependency.
  SubagentLoopProxy.instance.bind((sessionKey, task) async {
    final response = await loop.processMessage(sessionKey, task);
    return response.content;
  });
  return loop;
});

final webChatAdapterProvider = Provider<WebChatChannelAdapter>((ref) {
  return WebChatChannelAdapter();
});

final channelRouterProvider = Provider<ChannelRouter>((ref) {
  final agentLoop = ref.read(agentLoopProvider);
  final webChat = ref.read(webChatAdapterProvider);

  late final ChannelRouter router;
  router = ChannelRouter(
    agentHandler: (IncomingMessage msg) async {
      final response = await agentLoop.processMessage(
        msg.sessionKey,
        msg.text,
        channelType: msg.channelType,
        chatId: msg.chatId,
        contentBlocks: msg.contentBlocks,
        channelContext: msg.channelContext,
      );

      await router.sendMessage(
        OutgoingMessage(
          channelType: msg.channelType,
          chatId: msg.chatId,
          text: response.content,
        ),
      );
    },
  );

  router.registerAdapter(webChat);
  return router;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final cronServiceProvider = Provider<CronService>((ref) {
  return CronService(configManager: ref.read(configManagerProvider));
});

final deepLinkServiceProvider = Provider<DeepLinkService>((ref) {
  final service = DeepLinkService();
  service.init();
  ref.onDispose(service.dispose);
  return service;
});

final shortcutToolsServiceProvider = Provider<ShortcutToolsService>((ref) {
  final service = ShortcutToolsService();
  service.listenToDeepLinks(ref.read(deepLinkServiceProvider));
  return service;
});

final chatCommandHandlerProvider = Provider<ChatCommandHandler>((ref) {
  return ChatCommandHandler(
    sessionManager: ref.read(sessionManagerProvider),
    configManager: ref.read(configManagerProvider),
    agentLoop: ref.read(agentLoopProvider),
  );
});

final messageQueueProvider = Provider<MessageQueue>((ref) {
  final agentLoop = ref.read(agentLoopProvider);
  return MessageQueue(
    onRun: (sessionKey, text, channelType, chatId) async {
      await agentLoop.processMessage(
        sessionKey,
        text,
        channelType: channelType,
        chatId: chatId,
      );
    },
  );
});

final heartbeatRunnerProvider = Provider<HeartbeatRunner>((ref) {
  return HeartbeatRunner(
    configManager: ref.read(configManagerProvider),
    agentLoop: ref.read(agentLoopProvider),
  );
});

final pairingServiceProvider = Provider<PairingService>((ref) {
  return PairingService(configManager: ref.read(configManagerProvider));
});

final skillsServiceProvider = Provider<SkillsService>((ref) {
  final configManager = ref.read(configManagerProvider);
  return SkillsService(
    configManager: configManager,
    llmCall: (systemPrompt, userPrompt) async {
      final config = configManager.config;
      final modelName =
          config.activeAgent?.modelName ?? config.agents.defaults.modelName;
      final entry = config.getModel(modelName);
      if (entry == null) return null;

      // Resolve API key from providerCredentials (not just entry.apiKey)
      final apiKey = config.resolveApiKey(entry);
      if (apiKey.isEmpty) return null;

      final router = model_router.ProviderRouter(config: config);
      final vendorConfig = router.getVendorConfig(entry.vendor);
      final apiBase =
          entry.apiBase ??
          vendorConfig?.defaultApiBase ??
          'https://api.openai.com/v1';
      final modelForApi = entry.vendor == 'openrouter'
          ? entry.model
          : entry.modelId;

      final provider = vendorConfig?.provider ?? OpenAiProvider();
      final request = LlmRequest(
        model: modelForApi,
        apiKey: apiKey,
        apiBase: apiBase,
        messages: [
          LlmMessage(role: 'system', content: systemPrompt),
          LlmMessage(role: 'user', content: userPrompt),
        ],
        maxTokens: 4096,
        temperature: 0.2,
        timeoutSeconds: entry.requestTimeout,
      );

      final response = await provider.chatCompletion(request);
      return response.content;
    },
  );
});

/// Starts channels and cron after app initialization.
final channelStartupProvider = FutureProvider<void>((ref) async {
  final config = ref.read(configManagerProvider).config;
  final router = ref.read(channelRouterProvider);

  // Bind the channel router to MessageTool (deferred to break circular dep).
  _pendingChannelRouterBinder?.call(router);
  _pendingChannelRouterBinder = null;

  final pairingService = ref.read(pairingServiceProvider);
  final commandHandler = ref.read(chatCommandHandlerProvider);

  // Wire Telegram adapter if configured
  if (config.channels.telegram.enabled &&
      config.channels.telegram.token != null &&
      config.channels.telegram.token!.isNotEmpty) {
    final telegram = TelegramChannelAdapter(
      token: config.channels.telegram.token!,
      allowedUserIds: config.channels.telegram.allowFrom,
      dmPolicy: config.channels.telegram.dmPolicy,
      pairingService: pairingService,
      chatCommandHandler: (sessionKey, command) async {
        final result = await commandHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
    );
    router.registerAdapter(telegram);
  }

  // Wire Discord adapter if configured
  if (config.channels.discord.enabled &&
      config.channels.discord.token != null &&
      config.channels.discord.token!.isNotEmpty) {
    final discord = DiscordChannelAdapter(
      token: config.channels.discord.token!,
      allowedUserIds: config.channels.discord.allowFrom,
    );
    router.registerAdapter(discord);
  }

  // Wire WhatsApp adapter if configured
  if (config.channels.whatsapp.enabled &&
      await WhatsAppChannelAdapter.hasLinkedAuth(
        config.channels.whatsapp.authDir,
      )) {
    final whatsapp = WhatsAppChannelAdapter(
      authDir: config.channels.whatsapp.authDir,
      allowedUserIds: config.channels.whatsapp.allowFrom,
      dmPolicy: config.channels.whatsapp.dmPolicy,
      selfChatMode: config.channels.whatsapp.selfChatMode,
      pairingService: pairingService,
      chatCommandHandler: (sessionKey, command) async {
        final result = await commandHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
    );
    router.registerAdapter(whatsapp);
  } else if (config.channels.whatsapp.enabled) {
    Logger('ChannelRouter').info(
      'Skipping WhatsApp startup: channel enabled but no linked auth found yet',
    );
  }

  // Wire Slack adapter if configured (Socket Mode — no public URL needed)
  if (config.channels.slack.enabled &&
      config.channels.slack.botToken != null &&
      config.channels.slack.botToken!.isNotEmpty &&
      config.channels.slack.appToken != null &&
      config.channels.slack.appToken!.isNotEmpty) {
    final slack = SlackChannelAdapter(
      botToken: config.channels.slack.botToken!,
      appToken: config.channels.slack.appToken!,
      allowedUserIds: config.channels.slack.allowFrom,
      chatCommandHandler: (sessionKey, command) async {
        final result = await commandHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
    );
    router.registerAdapter(slack);
  }

  // Start all registered adapters
  await router.start();

  // Ensure AgentLoop (and SubagentLoopProxy binding) is created before cron fires.
  // agentLoopProvider is lazy; reading it here guarantees the proxy is bound
  // before the first cron tick (which happens 60s after cronService.start()).
  ref.read(agentLoopProvider);

  // Ensure deep link service is initialized before first message, so any
  // flutterclaw://callback URL that arrives early is not missed.
  ref.read(deepLinkServiceProvider);
  ref.read(shortcutToolsServiceProvider);

  // Start cron service
  final cronService = ref.read(cronServiceProvider);
  await cronService.start();

  // If there are cron jobs configured, request notification permissions now —
  // cron jobs almost always need to send a push when they complete.
  if (cronService.jobs.isNotEmpty) {
    await ref.read(notificationServiceProvider).initialize();
  }

  // Start heartbeat runner (never blocks: first tick runs in background)
  final heartbeat = ref.read(heartbeatRunnerProvider);
  await heartbeat.start();

  // Load skills
  final skillsService = ref.read(skillsServiceProvider);
  await skillsService.loadSkills();
});

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isStreaming;
  final bool isToolStatus;
  /// When non-null, the tool result that can be shown on expand.
  final String? toolResultText;

  // Image message fields
  final String? imageData; // base64-encoded image bytes
  final String? imageMimeType;

  // Document message fields
  final bool isDocumentMessage;
  final String? documentData; // base64-encoded document bytes
  final String? documentMimeType; // e.g. 'application/pdf' or 'text/plain'
  final String? documentFileName;

  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isStreaming = false,
    this.isToolStatus = false,
    this.toolResultText,
    this.imageData,
    this.imageMimeType,
    this.isDocumentMessage = false,
    this.documentData,
    this.documentMimeType,
    this.documentFileName,
  });

  ChatMessage copyWith({
    String? text,
    bool? isStreaming,
    String? toolResultText,
    String? imageData,
    String? imageMimeType,
  }) => ChatMessage(
    text: text ?? this.text,
    isUser: isUser,
    timestamp: timestamp,
    isStreaming: isStreaming ?? this.isStreaming,
    isToolStatus: isToolStatus,
    toolResultText: toolResultText ?? this.toolResultText,
    imageData: imageData ?? this.imageData,
    imageMimeType: imageMimeType ?? this.imageMimeType,
  );
}

/// The session key currently displayed in the chat screen.
/// Defaults to the webchat session of the active agent.
final activeSessionKeyProvider =
    NotifierProvider<ActiveSessionKeyNotifier, String>(
      ActiveSessionKeyNotifier.new,
    );

class ActiveSessionKeyNotifier extends Notifier<String> {
  @override
  String build() {
    final configManager = ref.read(configManagerProvider);
    final activeAgent = configManager.config.activeAgent;
    return activeAgent != null
        ? 'webchat:${activeAgent.id}'
        : 'webchat:default';
  }

  void setKey(String key) => state = key;
}

/// Reactive list of active sessions (activity within 24 h), sorted by
/// most-recent activity first. Rebuilds on every session change.
final activeSessionsProvider = StreamProvider<List<SessionMeta>>((ref) async* {
  final sessionManager = ref.watch(sessionManagerProvider);

  yield sessionManager.listActiveSessions();
  await for (final _ in sessionManager.sessionsChanged) {
    yield sessionManager.listActiveSessions();
  }
});

final chatProvider = NotifierProvider<ChatNotifier, List<ChatMessage>>(
  ChatNotifier.new,
);

/// Singleton voice recorder — shared between the provider and UI so
/// [isRecording] can be read without extra state.
final voiceRecordingServiceProvider = Provider<VoiceRecordingService>((ref) {
  final svc = VoiceRecordingService();
  ref.onDispose(svc.dispose);
  return svc;
});

class ChatNotifier extends Notifier<List<ChatMessage>> {
  bool _processing = false;
  bool get isProcessing => _processing;
  bool _cancelled = false;
  bool _hatchTriggered = false;
  String? _historyLoadedForAgent; // agentId whose history is currently loaded
  bool _isAppInBackground = false;

  /// Cancel the current streaming response. The active stream loop checks this
  /// flag on each event and breaks early, finalising the partial response.
  void cancelProcessing() {
    if (!_processing) return;
    _cancelled = true;
    // Immediately mark the last assistant bubble as done so the UI updates.
    final updated = List<ChatMessage>.from(state);
    if (updated.isNotEmpty && !updated.last.isUser) {
      updated[updated.length - 1] = updated.last.copyWith(isStreaming: false);
      state = updated;
    }
  }

  /// Returns the session key currently being viewed in the chat screen.
  String _getSessionKey() => ref.read(activeSessionKeyProvider);

  @override
  List<ChatMessage> build() {
    // Subscribe to subagent completion events. When a subagent belonging to
    // the current session finishes, inject its result as a new user turn and
    // let the parent agent respond to it — mirroring OpenClaw's push-based
    // completion announce system.
    final registry = ref.read(subagentRegistryProvider);
    final subagentSub = registry.completionEvents.listen((completion) {
      if (completion.run.parentSessionKey != _getSessionKey()) return;
      // Add the completion as a user message in the session transcript so the
      // agent loop sees it in context, then stream the agent's response.
      final sessionManager = ref.read(sessionManagerProvider);
      sessionManager.addMessage(
        completion.run.parentSessionKey,
        LlmMessage(role: 'user', content: completion.message),
      );
      // Only trigger agent response if we are not already processing.
      if (!_processing) {
        _streamAgentResponse(completion.message, showUserMessage: true);
      }
    });
    ref.onDispose(subagentSub.cancel);

    // Subscribe to session manager message stream. When a foreign session
    // (Telegram, cron, heartbeat, subagent) receives a new message and the
    // user is watching it, append the message to the visible chat in real-time.
    final sessionManager = ref.read(sessionManagerProvider);
    final messageSub = sessionManager.messageStream.listen((event) {
      final (sessionKey, message) = event;
      if (sessionKey != _getSessionKey()) return;
      if (_processing) return; // We are already managing state ourselves.
      if (message.role == 'system' || message.role == 'tool') return;
      final text = _extractTextFromContent(message.content);
      if (text.trim().isEmpty) return;
      // Skip pure tool-call assistant stubs (no visible text).
      if (message.role == 'assistant' &&
          (message.toolCalls?.isNotEmpty ?? false) &&
          text.isEmpty) {
        return;
      }
      // Notify the user if the app is backgrounded and an assistant message arrives.
      if (_isAppInBackground &&
          message.role == 'assistant' &&
          text.trim().isNotEmpty) {
        _sendBackgroundNotification(text);
      }

      state = [
        ...state,
        ChatMessage(
          text: text,
          isUser: message.role == 'user',
          timestamp: DateTime.now(),
        ),
      ];
    });
    ref.onDispose(messageSub.cancel);

    return [];
  }

  // ---------------------------------------------------------------------------
  // App lifecycle (called from ChatScreen's WidgetsBindingObserver)
  // ---------------------------------------------------------------------------

  void onAppBackgrounded() {
    _isAppInBackground = true;
  }

  Future<void> onAppResumed() async {
    _isAppInBackground = false;
    if (!_processing) {
      // Force history reload to pick up messages that completed while backgrounded.
      _historyLoadedForAgent = null;
      await loadHistory();
    }
  }

  void _sendBackgroundNotification(String responseText) {
    try {
      final notifService = ref.read(notificationServiceProvider);
      final configManager = ref.read(configManagerProvider);
      final agentName = configManager.config.activeAgent?.name ?? 'Agent';
      final preview = responseText.length > 200
          ? '${responseText.substring(0, 200)}...'
          : responseText;
      notifService.showMessageNotification(
        'webchat',
        agentName,
        preview,
        payload: _getSessionKey(),
      );
    } catch (_) {
      // Non-fatal — notification failure must not break agent processing.
    }
  }

  Future<void> loadHistory() async {
    final sessionKey = _getSessionKey();
    if (_historyLoadedForAgent == sessionKey) return;
    _historyLoadedForAgent = sessionKey;

    final sessionManager = ref.read(sessionManagerProvider);

    final history = sessionManager.getContextMessages(sessionKey);

    if (history.isEmpty) return;

    final messages = <ChatMessage>[];
    for (final msg in history) {
      if (msg.role == 'system') continue;
      if (msg.role == 'tool') continue;

      // Reconstruct tool status pills from persisted tool calls
      if (msg.role == 'assistant' &&
          msg.toolCalls != null &&
          msg.toolCalls!.isNotEmpty) {
        for (final tc in msg.toolCalls!) {
          Map<String, dynamic>? args;
          try {
            args = jsonDecode(tc.function.arguments) as Map<String, dynamic>?;
          } catch (_) {}
          messages.add(
            ChatMessage(
              text: _formatToolStatus(tc.function.name, args),
              isUser: false,
              timestamp: DateTime.now(),
              isToolStatus: true,
            ),
          );
        }
        // If the assistant message also has text content, add it too
        final text = _extractTextFromContent(msg.content);
        if (text.trim().isNotEmpty) {
          messages.add(
            ChatMessage(text: text, isUser: false, timestamp: DateTime.now()),
          );
        }
        continue;
      }

      final text = _extractTextFromContent(msg.content);
      final imageInfo = _extractImageFromContent(msg.content);
      final docInfo = _extractDocumentFromContent(msg.content);

      if (text.trim().isEmpty && imageInfo == null && docInfo == null) continue;

      messages.add(
        ChatMessage(
          text: text,
          isUser: msg.role == 'user',
          timestamp: DateTime.now(),
          imageData: imageInfo?.$1,
          imageMimeType: imageInfo?.$2,
          isDocumentMessage: docInfo != null,
          documentData: docInfo?.$1,
          documentMimeType: docInfo?.$2,
          documentFileName: docInfo?.$3,
        ),
      );
    }

    if (messages.isNotEmpty) {
      state = messages;
    }
  }

  Future<void> triggerHatch({String? userLanguage}) async {
    if (_hatchTriggered || _processing) return;
    _hatchTriggered = true;

    if (state.isNotEmpty) return;

    final configManager = ref.read(configManagerProvider);
    final hasBootstrap = await configManager.hasBootstrap();
    if (!hasBootstrap) return;

    // Hatch: trigger the agent without persisting a visible user message.
    // The BOOTSTRAP.md in the system prompt tells the agent what to do.
    _cancelled = false;
    _processing = true;
    state = [
      ChatMessage(
        text: '',
        isUser: false,
        timestamp: DateTime.now(),
        isStreaming: true,
      ),
    ];

    final agentLoop = ref.read(agentLoopProvider);

    bool startedAudio = false;
    if (Platform.isIOS && !IosBackgroundAudioService.isPlaying) {
      startedAudio = await IosBackgroundAudioService.start();
    }

    try {
      final buffer = StringBuffer();
      await for (final event in agentLoop.processMessageStream(
        _getSessionKey(),
        '', // empty user message — the system prompt drives the hatch
        channelType: 'webchat',
        chatId: 'default',
        userLanguage: userLanguage,
      )) {
        if (_cancelled) break;

        if (event.toolName != null) {
          final updated = List<ChatMessage>.from(state);
          updated.insert(
            updated.length - 1,
            ChatMessage(
              text: _formatToolStatus(event.toolName!, event.toolArgs),
              isUser: false,
              timestamp: DateTime.now(),
              isToolStatus: true,
              isStreaming: true,
            ),
          );
          state = updated;
        }

        if (event.textDelta != null) {
          buffer.write(event.textDelta);
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: buffer.toString(),
          );
          state = updated;
        }

        if (event.isDone) {
          final finalText = event.finalResponse?.content ?? buffer.toString();
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: finalText,
            isStreaming: false,
          );
          state = updated;

          if (_isAppInBackground && finalText.trim().isNotEmpty) {
            _sendBackgroundNotification(finalText);
          }
        }
      }
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      if (updated.isNotEmpty) {
        updated[updated.length - 1] = updated.last.copyWith(
          text: 'Error: $e',
          isStreaming: false,
        );
      }
      state = updated;
    } finally {
      _cancelled = false;
      _processing = false;
      if (startedAudio && !IosGatewayService.isRunning) {
        Future.delayed(const Duration(seconds: 30), () {
          if (!_processing && !IosGatewayService.isRunning) {
            IosBackgroundAudioService.stop();
          }
        });
      }
      unawaited(_syncActiveAgentIdentity());
    }
  }

  Future<void> sendImageMessage({
    required String base64Image,
    required String mimeType,
    required String caption,
    required String fileName,
  }) async {
    if (_processing) return;

    // Show user message with the image inline
    state = [
      ...state,
      ChatMessage(
        text: caption,
        isUser: true,
        timestamp: DateTime.now(),
        imageData: base64Image,
        imageMimeType: mimeType,
      ),
    ];

    _processing = true;

    state = [
      ...state,
      ChatMessage(
        text: '',
        isUser: false,
        timestamp: DateTime.now(),
        isStreaming: true,
      ),
    ];

    final agentLoop = ref.read(agentLoopProvider);

    bool startedAudio = false;
    if (Platform.isIOS && !IosBackgroundAudioService.isPlaying) {
      startedAudio = await IosBackgroundAudioService.start();
    }

    try {
      // Build a multimodal message using the neutral format.
      // AnthropicProvider converts {type:"image", data, mimeType} →
      //   {type:"image", source:{type:"base64", media_type, data}}
      // OpenAiProvider converts the same blocks →
      //   {type:"image_url", image_url:{url:"data:mimeType;base64,data"}}
      final contentBlocks = [
        {'type': 'image', 'data': base64Image, 'mimeType': mimeType},
        {'type': 'text', 'text': caption},
      ];

      final buffer = StringBuffer();
      await for (final event in agentLoop.processMessageStream(
        _getSessionKey(),
        caption,
        channelType: 'webchat',
        chatId: 'default',
        contentBlocks: contentBlocks,
      )) {
        if (_cancelled) break;
        if (event.textDelta != null) {
          buffer.write(event.textDelta);
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: buffer.toString(),
          );
          state = updated;
        }
        if (event.isDone) {
          final finalText = event.finalResponse?.content ?? buffer.toString();
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: finalText,
            isStreaming: false,
          );
          state = updated;

          if (_isAppInBackground && finalText.trim().isNotEmpty) {
            _sendBackgroundNotification(finalText);
          }
        }
      }
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      updated[updated.length - 1] = updated.last.copyWith(
        text: 'Error: $e',
        isStreaming: false,
      );
      state = updated;
    } finally {
      _cancelled = false;
      _processing = false;
      if (startedAudio && !IosGatewayService.isRunning) {
        Future.delayed(const Duration(seconds: 30), () {
          if (!_processing && !IosGatewayService.isRunning) {
            IosBackgroundAudioService.stop();
          }
        });
      }
      unawaited(_syncActiveAgentIdentity());
    }
  }

  Future<void> sendDocumentMessage({
    required String base64Data,
    required String mimeType,
    required String fileName,
    String caption = '',
  }) async {
    if (_processing) return;

    // Show user message with document info
    state = [
      ...state,
      ChatMessage(
        text: caption.isNotEmpty ? caption : fileName,
        isUser: true,
        timestamp: DateTime.now(),
        isDocumentMessage: true,
        documentData: base64Data,
        documentMimeType: mimeType,
        documentFileName: fileName,
      ),
    ];

    _cancelled = false;
    _processing = true;

    state = [
      ...state,
      ChatMessage(
        text: '',
        isUser: false,
        timestamp: DateTime.now(),
        isStreaming: true,
      ),
    ];

    final agentLoop = ref.read(agentLoopProvider);

    bool startedAudio = false;
    if (Platform.isIOS && !IosBackgroundAudioService.isPlaying) {
      startedAudio = await IosBackgroundAudioService.start();
    }

    try {
      // Build neutral document block.
      // AnthropicProvider converts to {type:"document", source:{type:"base64", ...}}
      // OpenAiProvider: text/plain → decoded text block; PDF → placeholder text
      final contentBlocks = [
        {
          'type': 'document',
          'data': base64Data,
          'mimeType': mimeType,
          'fileName': fileName,
        },
        if (caption.isNotEmpty) {'type': 'text', 'text': caption},
      ];

      final buffer = StringBuffer();
      await for (final event in agentLoop.processMessageStream(
        _getSessionKey(),
        caption.isNotEmpty ? caption : fileName,
        channelType: 'webchat',
        chatId: 'default',
        contentBlocks: contentBlocks,
      )) {
        if (_cancelled) break;
        if (event.textDelta != null) {
          buffer.write(event.textDelta);
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: buffer.toString(),
          );
          state = updated;
        }
        if (event.isDone) {
          final finalText = event.finalResponse?.content ?? buffer.toString();
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: finalText,
            isStreaming: false,
          );
          state = updated;

          if (_isAppInBackground && finalText.trim().isNotEmpty) {
            _sendBackgroundNotification(finalText);
          }
        }
      }
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      updated[updated.length - 1] = updated.last.copyWith(
        text: 'Error: $e',
        isStreaming: false,
      );
      state = updated;
    } finally {
      _cancelled = false;
      _processing = false;
      if (startedAudio && !IosGatewayService.isRunning) {
        Future.delayed(const Duration(seconds: 30), () {
          if (!_processing && !IosGatewayService.isRunning) {
            IosBackgroundAudioService.stop();
          }
        });
      }
      unawaited(_syncActiveAgentIdentity());
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || _processing) return;

    // Handle chat commands (slash commands)
    if (text.startsWith('/')) {
      final handler = ref.read(chatCommandHandlerProvider);
      final result = await handler.handle(_getSessionKey(), text);
      if (result.handled && result.response != null) {
        state = [
          ...state,
          ChatMessage(text: text, isUser: true, timestamp: DateTime.now()),
          ChatMessage(
            text: result.response!,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        ];
        return;
      }
    }

    await _streamAgentResponse(text, showUserMessage: true);
  }

  Future<void> _streamAgentResponse(
    String text, {
    required bool showUserMessage,
  }) async {
    if (_processing) return;
    _cancelled = false;

    if (showUserMessage) {
      state = [
        ...state,
        ChatMessage(text: text, isUser: true, timestamp: DateTime.now()),
      ];
    }

    _processing = true;

    state = [
      ...state,
      ChatMessage(
        text: '',
        isUser: false,
        timestamp: DateTime.now(),
        isStreaming: true,
      ),
    ];

    final agentLoop = ref.read(agentLoopProvider);

    // On iOS, enable temporary background support so a response can finish
    // even if the user switches apps mid-message (no-op if already active).
    bool startedAudio = false;
    if (Platform.isIOS && !IosBackgroundAudioService.isPlaying) {
      startedAudio = await IosBackgroundAudioService.start();
    }

    try {
      final buffer = StringBuffer();
      // Throttle text-delta state updates to ~30 fps to avoid rebuilding the
      // full message list on every streamed character. Tool events and isDone
      // always flush immediately regardless of the throttle.
      var lastFlush = DateTime.now();
      const flushInterval = Duration(milliseconds: 33);

      void flushBuffer() {
        if (state.isEmpty) return;
        final updated = List<ChatMessage>.from(state);
        updated[updated.length - 1] = updated.last.copyWith(
          text: buffer.toString(),
        );
        state = updated;
        lastFlush = DateTime.now();
      }

      await for (final event in agentLoop.processMessageStream(
        _getSessionKey(),
        text,
        channelType: 'webchat',
        chatId: 'default',
      )) {
        if (_cancelled) break;

        if (event.toolName != null) {
          flushBuffer(); // flush pending text before inserting tool pill
          final updated = List<ChatMessage>.from(state);
          updated.insert(
            updated.length - 1,
            ChatMessage(
              text: _formatToolStatus(event.toolName!, event.toolArgs),
              isUser: false,
              timestamp: DateTime.now(),
              isToolStatus: true,
              isStreaming: true,
            ),
          );
          state = updated;
        }

        if (event.toolResult != null) {
          final updated = List<ChatMessage>.from(state);
          for (var i = updated.length - 1; i >= 0; i--) {
            if (updated[i].isToolStatus && updated[i].isStreaming == true) {
              updated[i] = updated[i].copyWith(
                isStreaming: false,
                toolResultText: event.toolResult,
              );
              break;
            }
          }
          state = updated;
        }

        if (event.textDelta != null) {
          buffer.write(event.textDelta);
          if (DateTime.now().difference(lastFlush) >= flushInterval) {
            flushBuffer();
          }
        }

        if (event.isDone) {
          final finalText = event.finalResponse?.content ?? buffer.toString();
          final updated = List<ChatMessage>.from(state);
          updated[updated.length - 1] = updated.last.copyWith(
            text: finalText,
            isStreaming: false,
          );
          state = updated;

          if (_isAppInBackground && finalText.trim().isNotEmpty) {
            _sendBackgroundNotification(finalText);
          }
        }
      }
      // Flush any remaining buffered text if stream ended without isDone
      if (buffer.isNotEmpty && state.isNotEmpty && state.last.isStreaming) {
        flushBuffer();
      }
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      updated[updated.length - 1] = updated.last.copyWith(
        text: _cancelled ? (state.last.text.isEmpty ? '_(cancelled)_' : state.last.text) : 'Error: $e',
        isStreaming: false,
      );
      state = updated;
    } finally {
      _cancelled = false;
      _processing = false;
      // Stop background audio if we started it just for this request and the
      // gateway isn't running (which manages its own audio lifecycle). Grace
      // period avoids start/stop churn for consecutive messages.
      if (startedAudio && !IosGatewayService.isRunning) {
        Future.delayed(const Duration(seconds: 30), () {
          if (!_processing && !IosGatewayService.isRunning) {
            IosBackgroundAudioService.stop();
          }
        });
      }
      unawaited(_syncActiveAgentIdentity());
    }
  }

  /// Transcribe the given audio file and send the result as a chat message.
  ///
  /// Uses the configured model's API base (falls back to OpenAI). If the API
  /// key is for a provider that doesn't support Whisper (e.g. Anthropic), the
  /// transcription will fail gracefully and return false.
  Future<bool> transcribeAndSend(String audioFilePath, {String? language}) async {
    if (_processing) return false;

    final config = ref.read(configManagerProvider).config;
    final modelName =
        config.activeAgent?.modelName ?? config.agents.defaults.modelName;
    final entry = config.getModel(modelName);
    if (entry == null) return false;

    final apiKey = config.resolveApiKey(entry);
    if (apiKey.isEmpty) return false;

    // Use the model's configured API base; Anthropic doesn't have Whisper so
    // fall back to OpenAI for transcription in that case.
    final rawBase = config.resolveApiBase(entry);
    final apiBase = rawBase.contains('anthropic.com')
        ? 'https://api.openai.com/v1'
        : rawBase;

    final svc = AudioTranscriptionService(apiKey: apiKey, apiBase: apiBase);
    final text = await svc.transcribe(audioFilePath, language: language);
    await VoiceRecordingService.deleteFile(audioFilePath);

    if (text == null || text.isEmpty) return false;

    await sendMessage(text);
    return true;
  }

  /// Builds a human-readable label for a tool status pill.
  /// Shows the tool name plus the most relevant argument when available.
  static String _formatToolStatus(String name, Map<String, dynamic>? args) {
    if (args == null || args.isEmpty) return name;
    // Priority: path > query > url > key > first string value
    final raw =
        args['path'] ??
        args['query'] ??
        args['url'] ??
        args['key'] ??
        args.values.whereType<String>().firstOrNull;
    if (raw == null) return name;
    final label = raw.toString();
    // For paths, show only the last component
    final display = label.contains('/')
        ? label.split('/').where((s) => s.isNotEmpty).last
        : label;
    final truncated = display.length > 40
        ? '${display.substring(0, 40)}…'
        : display;
    return '$name: $truncated';
  }

  /// Extracts displayable text from a message content value.
  /// Handles plain strings and multimodal content lists (picks text blocks).
  static String _extractTextFromContent(dynamic content) {
    if (content is String) return content;
    if (content is List) {
      final parts = <String>[];
      for (final item in content) {
        if (item is Map) {
          final type = item['type'];
          if (type == 'text') {
            final t = item['text'];
            if (t is String && t.isNotEmpty) parts.add(t);
          }
          // image blocks are handled by _extractImageFromContent
        }
      }
      return parts.join(' ');
    }
    return content?.toString() ?? '';
  }

  /// Extracts the first image block from a multimodal content list.
  /// Returns (base64Data, mimeType) or null if no image block is present.
  static (String, String)? _extractImageFromContent(dynamic content) {
    if (content is! List) return null;
    for (final item in content) {
      if (item is Map && item['type'] == 'image') {
        final data = item['data'];
        final mime = item['mimeType'] ?? 'image/jpeg';
        if (data is String && data.isNotEmpty) return (data, mime as String);
      }
    }
    return null;
  }

  /// Extracts the first document block from a multimodal content list.
  /// Returns (base64Data, mimeType, fileName) or null if none present.
  static (String, String, String?)? _extractDocumentFromContent(
    dynamic content,
  ) {
    if (content is! List) return null;
    for (final item in content) {
      if (item is Map && item['type'] == 'document') {
        final data = item['data'];
        final mime = item['mimeType'] ?? 'application/pdf';
        final fileName = item['fileName'] as String?;
        if (data is String && data.isNotEmpty) {
          return (data, mime as String, fileName);
        }
      }
    }
    return null;
  }

  void clear() {
    state = [];
    _historyLoadedForAgent =
        _getSessionKey(); // prevent reloading cleared history
  }

  /// Switch to any session by key. Clears the UI and loads that session's history.
  Future<void> switchToSession(String sessionKey) async {
    ref.read(activeSessionKeyProvider.notifier).setKey(sessionKey);
    state = [];
    _historyLoadedForAgent = null;
    _hatchTriggered = false;
    await loadHistory();
  }

  /// Switch to a different agent's webchat session (called from agent switcher).
  Future<void> switchToAgent() async {
    final configManager = ref.read(configManagerProvider);
    final activeAgent = configManager.config.activeAgent;
    final key = activeAgent != null
        ? 'webchat:${activeAgent.id}'
        : 'webchat:default';
    await switchToSession(key);
  }

  /// After a response completes, re-read IDENTITY.md and update the agent
  /// profile if the agent changed its name or emoji.
  Future<void> _syncActiveAgentIdentity() async {
    final configManager = ref.read(configManagerProvider);
    final activeAgent = configManager.config.activeAgent;
    if (activeAgent == null) return;
    try {
      final ws = await configManager.workspacePath;
      final content = await File('$ws/IDENTITY.md').readAsString();
      final newName = _parseIdentityName(content);
      final newEmoji = _parseIdentityEmoji(content);
      if ((newName.isEmpty || newName == activeAgent.name) &&
          (newEmoji.isEmpty || newEmoji == activeAgent.emoji)) {
        return;
      }
      final updated = configManager.config.agentProfiles.map((a) {
        if (a.id != activeAgent.id) return a;
        return a.copyWith(
          name: newName.isNotEmpty ? newName : null,
          emoji: newEmoji.isNotEmpty ? newEmoji : null,
        );
      }).toList();
      configManager.update(
        configManager.config.copyWith(agentProfiles: updated),
      );
      await configManager.save();
      ref.invalidate(activeAgentProvider);
      ref.invalidate(agentProfilesProvider);
    } catch (_) {}
  }

  static String _parseIdentityName(String content) {
    final m = RegExp(r'(?:Name|name)[:\s]+(.+)').firstMatch(content);
    return m?.group(1)?.trim() ?? '';
  }

  static String _parseIdentityEmoji(String content) {
    final m = RegExp(r'(?:Emoji|emoji)[:\s]+(.+)').firstMatch(content);
    var raw = m?.group(1)?.trim() ?? '';
    return raw.replaceAll('*', '').replaceAll('_', '').trim();
  }
}

final appInitializedProvider = FutureProvider<bool>((ref) async {
  final configManager = ref.read(configManagerProvider);
  await configManager.ensureDirectories();
  await configManager.load();

  final sessionManager = ref.read(sessionManagerProvider);
  await sessionManager.load();

  // Start channels and cron if onboarding is complete
  // Gateway will be started separately after UI is ready
  if (configManager.config.onboardingCompleted) {
    await ref.read(channelStartupProvider.future);
  }

  return true;
});

final onboardingRequiredProvider = Provider<bool>((ref) {
  final configManager = ref.watch(configManagerProvider);
  return !configManager.config.onboardingCompleted;
});

class GatewayState {
  final bool isRunning;
  final int tokensProcessed;
  final String status;
  final String currentModel;
  final int sessionCount;
  final DateTime? lastMessageAt;
  final int uptimeSeconds;
  final DateTime? startedAt;
  final String? lastError;
  final String state; // 'stopped', 'starting', 'running', 'error', 'retrying'

  const GatewayState({
    this.isRunning = false,
    this.tokensProcessed = 0,
    this.status = 'stopped',
    this.currentModel = '',
    this.sessionCount = 0,
    this.lastMessageAt,
    this.uptimeSeconds = 0,
    this.startedAt,
    this.lastError,
    this.state = 'stopped',
  });

  GatewayState copyWith({
    bool? isRunning,
    int? tokensProcessed,
    String? status,
    String? currentModel,
    int? sessionCount,
    DateTime? lastMessageAt,
    int? uptimeSeconds,
    DateTime? startedAt,
    String? lastError,
    String? state,
  }) => GatewayState(
    isRunning: isRunning ?? this.isRunning,
    tokensProcessed: tokensProcessed ?? this.tokensProcessed,
    status: status ?? this.status,
    currentModel: currentModel ?? this.currentModel,
    sessionCount: sessionCount ?? this.sessionCount,
    lastMessageAt: lastMessageAt ?? this.lastMessageAt,
    uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
    startedAt: startedAt ?? this.startedAt,
    lastError: lastError ?? this.lastError,
    state: state ?? this.state,
  );
}

final gatewayStateProvider =
    NotifierProvider<GatewayStateNotifier, GatewayState>(
      GatewayStateNotifier.new,
    );

class GatewayStateNotifier extends Notifier<GatewayState> {
  Timer? _uptimeTimer;
  StreamSubscription<Map<String, dynamic>>? _watchdogSub;

  @override
  GatewayState build() {
    ref.onDispose(() {
      _uptimeTimer?.cancel();
      _uptimeTimer = null;
      _watchdogSub?.cancel();
      _watchdogSub = null;
    });
    return const GatewayState();
  }

  void _cancelUptimeTimer() {
    _uptimeTimer?.cancel();
    _uptimeTimer = null;
  }

  void setRunning(bool running) {
    _cancelUptimeTimer();
    _watchdogSub?.cancel();
    _watchdogSub = null;
    state = state.copyWith(
      isRunning: running,
      status: running ? 'running' : 'stopped',
      state: running ? 'running' : 'stopped',
      startedAt: running ? DateTime.now() : null,
      uptimeSeconds: 0,
      tokensProcessed: 0,
      sessionCount: 0,
    );
    _syncLiveActivity();
    if (running) {
      _uptimeTimer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _tickStats(),
      );
      if (Platform.isIOS) {
        _subscribeToWatchdog();
      }
    }
  }

  void _subscribeToWatchdog() {
    _watchdogSub = IosGatewayService.events.listen((event) {
      final eventState = event['state'] as String?;
      switch (eventState) {
        case 'restarting':
          _cancelUptimeTimer();
          state = state.copyWith(
            isRunning: false,
            state: 'restarting',
            status: 'restarting',
          );
          _syncLiveActivity();
        case 'running':
          // Watchdog successfully restarted the gateway — reset uptime timer
          state = state.copyWith(
            isRunning: true,
            state: 'running',
            status: 'running',
            startedAt: DateTime.now(),
            uptimeSeconds: 0,
            lastError: null,
          );
          _syncLiveActivity();
          _cancelUptimeTimer();
          _uptimeTimer = Timer.periodic(
            const Duration(seconds: 1),
            (_) => _tickStats(),
          );
        case 'error':
          final msg = event['error'] as String? ?? 'Gateway crashed';
          setError(msg);
        default:
          break;
      }
    });
  }

  void setStatus(String status) {
    state = state.copyWith(status: status);
    _syncLiveActivity();
  }

  void setModel(String model) {
    state = state.copyWith(currentModel: model);
    _syncLiveActivity();
  }

  void _tickStats() {
    final sm = ref.read(sessionManagerProvider);
    final sessions = sm.listSessions();
    final tokens = sessions.fold(0, (sum, s) => sum + s.totalTokens);
    updateStats(tokensProcessed: tokens, sessionCount: sessions.length);
  }

  void updateStats({
    int? tokensProcessed,
    int? sessionCount,
    DateTime? lastMessageAt,
  }) {
    final uptime = state.startedAt != null
        ? DateTime.now().difference(state.startedAt!).inSeconds
        : 0;
    state = state.copyWith(
      tokensProcessed: tokensProcessed,
      sessionCount: sessionCount,
      lastMessageAt: lastMessageAt,
      uptimeSeconds: uptime,
    );
    _syncLiveActivity();
  }

  void setError(String errorMessage) {
    _cancelUptimeTimer();
    state = state.copyWith(
      lastError: errorMessage,
      state: 'error',
      isRunning: false,
    );
    _syncLiveActivity();
  }

  void setState(String newState) {
    state = state.copyWith(state: newState);
    _syncLiveActivity();
  }

  void clearError() {
    state = state.copyWith(lastError: null);
    _syncLiveActivity();
  }

  void _syncLiveActivity() {
    if (state.isRunning) {
      LiveActivityService.updateActivity(
        isRunning: true,
        status: state.status,
        tokensProcessed: state.tokensProcessed,
        model: state.currentModel,
        sessionCount: state.sessionCount,
        lastMessageAt: state.lastMessageAt,
        uptimeSeconds: state.uptimeSeconds,
        errorMessage: state.lastError,
      );
    } else if (state.state == 'error' || state.state == 'restarting') {
      // Push offline/error state to lock screen so user sees it even in background
      LiveActivityService.updateActivity(
        isRunning: false,
        status: state.state,
        tokensProcessed: 0,
        model: state.currentModel,
        sessionCount: 0,
        uptimeSeconds: 0,
        errorMessage: state.lastError,
      );
    }
  }
}
