import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/providers/error_parser.dart';
import 'package:flutterclaw/services/ios_background_audio_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/services/live_activity_service.dart';
import 'package:logging/logging.dart';
import 'package:flutterclaw/channels/channel_interface.dart';
import 'package:flutterclaw/data/models/interactive_reply.dart';
import 'package:flutterclaw/channels/discord.dart';
import 'package:flutterclaw/channels/router.dart';
import 'package:flutterclaw/channels/telegram.dart';
import 'package:flutterclaw/channels/webchat.dart';
import 'package:flutterclaw/channels/whatsapp.dart';
import 'package:flutterclaw/channels/slack.dart';
import 'package:flutterclaw/channels/signal.dart';
import 'package:flutterclaw/core/agent/chat_commands.dart';
import 'package:flutterclaw/core/agent/message_queue.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/services/cron_service.dart';
import 'package:flutterclaw/services/heartbeat_runner.dart';
import 'package:flutterclaw/services/pairing_service.dart';
import 'package:flutterclaw/services/hook_runner.dart';
import 'package:flutterclaw/services/plugin_service.dart';
import 'package:flutterclaw/services/skills_service.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/core/agent/agent_loop.dart';
import 'package:flutterclaw/core/agent/token_budget_manager.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/live_session_transcript.dart';
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
import 'package:flutterclaw/tools/email_tools.dart';
import 'package:flutterclaw/tools/qr_tools.dart';
import 'package:flutterclaw/tools/oauth_tools.dart';
import 'package:flutterclaw/services/oauth_service.dart';
import 'package:flutterclaw/services/event_bus.dart';
import 'package:flutterclaw/services/automation_service.dart';
import 'package:flutterclaw/services/geofence_service.dart';
import 'package:flutterclaw/services/watcher_service.dart';
import 'package:flutterclaw/tools/automation_tools.dart';
import 'package:flutterclaw/tools/geofence_tools.dart';
import 'package:flutterclaw/tools/watcher_tools.dart';
import 'package:flutterclaw/tools/spreadsheet_tools.dart';
import 'package:flutterclaw/tools/routing_tools.dart';
import 'package:flutterclaw/services/action_center_service.dart';
import 'package:flutterclaw/tools/action_center_tools.dart';
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
import 'package:flutterclaw/tools/skill_tools.dart';
import 'package:flutterclaw/tools/ui_automation_tools.dart';
import 'package:flutterclaw/tools/http_tools.dart';
import 'package:flutterclaw/tools/web_tools.dart';
import 'package:flutterclaw/tools/workspace_pick_tools.dart';
import 'package:flutterclaw/tools/headless_browser_tool.dart';
import 'package:flutterclaw/ui/widgets/browser_overlay.dart';
import 'package:flutterclaw/app.dart';
import 'package:flutterclaw/services/deep_link_service.dart';
import 'package:flutterclaw/services/notification_service.dart';
import 'package:flutterclaw/services/sandbox_service.dart';
import 'package:flutterclaw/services/ui_automation_service.dart';
import 'package:flutterclaw/tools/sandbox_tools.dart';
import 'package:flutterclaw/tools/image_gen_tools.dart';
import 'package:flutterclaw/services/voice_recording_service.dart';
import 'package:flutterclaw/services/audio_transcription_service.dart';
import 'package:flutterclaw/services/overlay_service.dart';
import 'package:flutterclaw/services/text_to_speech_service.dart';
import 'package:flutterclaw/services/speech_to_text_service.dart';
import 'package:flutterclaw/tools/tool_status_formatter.dart';
import 'package:flutterclaw/services/mcp/mcp_client_manager.dart';
import 'package:flutterclaw/tools/mcp_proxy_tool.dart';
import 'package:flutterclaw/tools/mcp_management_tools.dart';
import 'package:flutterclaw/tools/tts_tool.dart';
import 'package:flutterclaw/tools/pdf_tool.dart';
import 'package:flutterclaw/tools/live_voice_tool.dart';
import 'package:flutterclaw/services/connectivity_service.dart';
import 'package:flutterclaw/services/battery_service.dart';
import 'package:flutterclaw/services/auth_profile_service.dart';
import 'package:flutterclaw/services/secrets_resolver.dart';
import 'package:flutterclaw/services/secure_key_store.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutterclaw/services/gemini_live/gemini_live_service.dart';
import 'package:flutterclaw/services/gemini_live/live_event.dart';
import 'package:flutterclaw/services/gemini_live/live_session_config.dart';
import 'package:flutterclaw/services/gemini_live/gemini_tool_translator.dart';
import 'package:flutterclaw/services/pcm_audio_stream_service.dart';
import 'package:flutterclaw/core/agent/live_agent_loop.dart';

final configManagerProvider = Provider<ConfigManager>((ref) {
  final mgr = ConfigManager();
  // Wire secrets resolver so $ref values in API keys are resolved at use time.
  mgr.secretsResolver = (ref_) => SecureKeyStore.getSecret(
        ref_.startsWith(r'{"$ref":"secrets/')
            ? ref_.substring(r'{"$ref":"secrets/'.length).replaceAll('"}}', '').replaceAll('"}', '')
            : ref_,
      );
  return mgr;
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

/// Whether Live voice mode is available — true whenever a Google API key is
/// configured (either at provider level or on any Google model entry).
///
/// Live mode is a call mode layered on top of any agent, not tied to the
/// active model. The notifier picks the best available Live model automatically.
final activeModelSupportsLiveProvider = Provider<bool>((ref) {
  final agent = ref.watch(activeAgentProvider);
  if (agent == null) return false;

  final config = ref.watch(configManagerProvider).config;

  // Active model entry must exist.
  final modelEntry = config.modelList
      .cast<ModelEntry?>()
      .firstWhere((m) => m!.modelName == agent.modelName, orElse: () => null);
  if (modelEntry == null) return false;

  // Catalog must have at least one Live (call-mode) model for this provider.
  final hasLiveModel = ModelCatalog.models
      .any((m) => m.providerId == modelEntry.provider && m.isLiveModel);
  if (!hasLiveModel) return false;

  // An API key must be configured for this provider.
  if (config.providerCredentials[modelEntry.provider]?.apiKey.isNotEmpty ==
      true) {
    return true;
  }
  return modelEntry.apiKey?.isNotEmpty == true;
});

/// True when the active agent's **chat** model is WebSocket/Live-only (no REST).
/// Distinct from [activeModelSupportsLiveProvider] (whether voice call is available).
final activeAgentChatModelIsLiveOnlyProvider = Provider<bool>((ref) {
  final agent = ref.watch(activeAgentProvider);
  if (agent == null) return false;
  final config = ref.watch(configManagerProvider).config;
  final modelEntry = config.modelList
      .cast<ModelEntry?>()
      .firstWhere((m) => m!.modelName == agent.modelName, orElse: () => null);
  return modelEntry?.isLiveOnly ?? false;
});

final sessionManagerProvider = Provider<SessionManager>((ref) {
  final configManager = ref.watch(configManagerProvider);
  final sm = SessionManager(configManager);
  ref.onDispose(sm.dispose);
  return sm;
});

/// Estimated context usage for the active session as a value 0.0–1.0.
///
/// Computes: (system_prompt_estimate + actual_context_messages) / context_window.
/// Used by [ContextUsageBar] to show a progress indicator above the input.
final contextUsageProvider = Provider<double>((ref) {
  final configManager = ref.watch(configManagerProvider);
  final sessionManager = ref.watch(sessionManagerProvider);
  final activeKey = ref.watch(activeSessionKeyProvider);
  // Watch chatProvider only for reactivity — when a message is added the chat
  // state changes, which invalidates this provider and triggers a recompute.
  ref.watch(chatProvider);

  // Derive model name for this session
  final modelName = resolveSessionModelName(
    activeKey,
    configManager,
    sessionManager,
  );
  final contextWindow = TokenBudgetManager.getContextWindow(
    modelName,
    configManager,
  );
  if (contextWindow <= 0) return 0.0;

  // Use the actual LLM context messages (from in-memory cache) rather than
  // the rendered chat bubbles. This includes the full content of every message
  // including tool results, which can be large and is what actually consumes
  // the context window.
  final contextMessages = sessionManager.getContextMessages(activeKey);
  final messageTokens = TokenBudgetManager.estimateConversationTokens(
    contextMessages.map((m) => {'content': m.content}).toList(),
  );

  // Fixed estimate for the system prompt (workspace files + runtime context
  // + device guidance). Typical agent workspace = ~25K tokens.
  const kSystemPromptEstimate = 25000;

  final totalEstimate = kSystemPromptEstimate + messageTokens;
  final ratio = totalEstimate / contextWindow;
  return ratio.clamp(0.0, 1.0);
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

/// MCP client manager — connects to configured MCP servers and exposes their
/// tools. Connection happens asynchronously after the registry is set up.
final mcpClientManagerProvider = Provider<McpClientManager>((ref) {
  final manager = McpClientManager();
  ref.onDispose(() => manager.disconnectAll());
  return manager;
});

/// Late-binder so MessageTool can send to channels without a circular provider dep.
void Function(ChannelRouter)? _pendingChannelRouterBinder;
// Late-bound channel router for the browser overlay callback.
// Set by _pendingChannelRouterBinder to avoid a circular provider dependency.
ChannelRouter? _browserOverlayChannelRouter;

/// Shared hook runner — register built-in and user-defined hooks here.
final hookRunnerProvider = Provider<HookRunner>((ref) {
  return HookRunner();
});

final toolRegistryProvider = Provider<ToolRegistry>((ref) {
  final configManager = ref.read(configManagerProvider);
  final sessionManager = ref.read(sessionManagerProvider);

  final registry = ToolRegistry();

  // Set config manager for token budget management
  registry.setConfigManager(configManager);

  // Wire the shared hook runner into the tool registry
  registry.setHookRunner(ref.read(hookRunnerProvider));

  // Apply tool policies from config
  registry.setDisabledTools(configManager.config.tools.disabled);

  Future<String> wsPath() => configManager.workspacePath;

  registry.register(ReadFileTool(wsPath));
  registry.register(WriteFileTool(wsPath));
  registry.register(EditFileTool(wsPath));
  registry.register(ListDirTool(wsPath));
  registry.register(AppendFileTool(wsPath));
  registry.register(WebSearchTool(config: configManager.config));
  // Late reference so the callback can access the browser's current user agent
  // (the closure is defined inside the constructor, before the variable is assigned).
  late final HeadlessBrowserTool headlessBrowser;
  headlessBrowser = HeadlessBrowserTool(
    config: configManager.config.tools.browser,
    onRequestUserAction: (url, message, sessionKey) async {
      final agentName = configManager.config.activeAgent?.name ?? 'Agent';

      // 1. Send a message through the originating channel (Telegram, Discord, etc.)
      //    so the user gets an actual channel notification — not just a push alert.
      //    This is the GUARANTEED signal that fires before the overlay blocks.
      //    Skip for webchat (user is already in the app).
      if (sessionKey != null && !sessionKey.startsWith('webchat')) {
        try {
          final colonIdx = sessionKey.indexOf(':');
          if (colonIdx > 0) {
            final channelType = sessionKey.substring(0, colonIdx);
            final chatId = sessionKey.substring(colonIdx + 1);
            // Use the late-bound reference to avoid a circular provider dependency
            // (toolRegistryProvider → channelRouterProvider → agentLoopProvider → toolRegistryProvider).
            final router = _browserOverlayChannelRouter;
            await router?.sendMessage(OutgoingMessage(
              channelType: channelType,
              chatId: chatId,
              text: '🌐 $agentName needs your help in the app:\n\n$message',
            ));
          }
        } catch (_) {}
      }

      // 2. Push notification as backup (works even if the channel message fails
      //    or when sessionKey is null). Wrapped in try-catch for reliability.
      try {
        final notifService = ref.read(notificationServiceProvider);
        await notifService.showMessageNotification(
          'browser',
          '🌐 $agentName — Action Required in App',
          message,
          payload: 'browser_overlay',
        );
      } catch (_) {}

      // 3. Show the visible browser overlay — blocks until user taps Done.
      final nav = FlutterClawApp.navigatorKey.currentState;
      if (nav == null) return;
      await nav.push<void>(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (_) => BrowserOverlay(
            url: url,
            message: message,
            userAgent: headlessBrowser.currentUserAgent,
          ),
        ),
      );
    },
    onDescribeImage: (bytes, mimeType) async {
      // Parallel vision call to describe the screenshot without polluting
      // the main conversation context with base64 data.
      try {
        final router = ref.read(providerRouterProvider);
        final config = configManager.config;
        final modelName = config.agents.defaults.modelName;
        final modelEntry = config.getModel(modelName);
        if (modelEntry == null || !modelEntry.supportsVision) return null;

        final base64Data = base64.encode(bytes);
        final request = LlmRequest(
          model: modelEntry.model,
          apiKey: config.resolveApiKey(modelEntry),
          apiBase: config.resolveApiBase(modelEntry),
          messages: [
            LlmMessage(
              role: 'user',
              content: [
                {'type': 'image', 'data': base64Data, 'mimeType': mimeType},
                {
                  'type': 'text',
                  'text': 'Describe this screenshot concisely (2-4 sentences). '
                      'Include: page type, main visible content, key UI elements, '
                      'any text/buttons, and overall state (login form, feed, error, etc.).',
                },
              ],
            ),
          ],
          maxTokens: 512,
          temperature: 0.1,
          supportsVision: true,
        );
        final response = await router.chatCompletion(request);
        return response.content;
      } catch (_) {
        return null;
      }
    },
  );
  registry.register(WebFetchTool(headlessBrowser: headlessBrowser));
  registry.register(HttpRequestTool());
  registry.register(ImageGenTool(configManager: configManager));
  registry.register(TtsTool(ref.read(textToSpeechServiceProvider)));
  registry.register(PdfTool(configManager: configManager));
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
  registry.register(OpenExternalUriTool());
  registry.register(PickFileToWorkspaceTool(wsPath));
  registry.register(PickImageToWorkspaceTool(wsPath));
  registry.register(CameraTakePhotoTool());
  registry.register(QrScanTool());
  registry.register(CameraRecordVideoTool());
  registry.register(GetLocationTool());
  registry.register(CalendarListEventsTool());
  registry.register(CalendarCreateEventTool());
  registry.register(ContactsSearchTool());
  registry.register(ContactsCreateTool());
  registry.register(ContactsUpdateTool());
  registry.register(EmailSendTool(() => configManager.config.emailAccounts));
  registry.register(EmailReadTool(() => configManager.config.emailAccounts));
  registry.register(EmailFoldersTool(() => configManager.config.emailAccounts));
  final oauthService = OAuthService();
  registry.register(OAuthAuthorizeTool(
    () => configManager.config.oauthConnections,
    oauthService,
  ));
  registry.register(OAuthTokenTool(
    () => configManager.config.oauthConnections,
    oauthService,
  ));
  registry.register(GetHealthDataTool());
  registry.register(HealthStatusTool());
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
  _pendingChannelRouterBinder = (r) {
    channelRouter = r;
    _browserOverlayChannelRouter = r;
  };
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

  // Automation rules tools
  final automationService = ref.read(automationServiceProvider);
  registry.register(AutomationCreateTool(automationService: automationService));
  registry.register(AutomationListTool(automationService: automationService));
  registry.register(AutomationDeleteTool(automationService: automationService));
  registry.register(AutomationUpdateTool(automationService: automationService));

  // Geofence tools
  final geofenceService = ref.read(geofenceServiceProvider);
  registry.register(GeofenceCreateTool(geofenceService: geofenceService));
  registry.register(GeofenceListTool(geofenceService: geofenceService));
  registry.register(GeofenceDeleteTool(geofenceService: geofenceService));
  registry.register(GeofenceUpdateTool(geofenceService: geofenceService));

  // Watcher tools
  final watcherService = ref.read(watcherServiceProvider);
  registry.register(WatchCreateTool(watcherService: watcherService));
  registry.register(WatchListTool(watcherService: watcherService));
  registry.register(WatchDeleteTool(watcherService: watcherService));
  registry.register(WatchUpdateTool(watcherService: watcherService));
  registry.register(WatchCheckTool(watcherService: watcherService));

  // Spreadsheet/CSV tools
  registry.register(SpreadsheetReadTool(configManager: configManager));
  registry.register(SpreadsheetWriteTool(configManager: configManager));

  // Cross-channel routing tools
  registry.register(RouteCreateTool(automationService: automationService));
  registry.register(RouteListTool(automationService: automationService));

  // Action center tools
  final actionCenterService = ref.read(actionCenterServiceProvider);
  registry.register(ActionCenterAddTool(actionCenterService: actionCenterService));
  registry.register(ActionCenterListTool(actionCenterService: actionCenterService));
  registry.register(ActionCenterReadTool(actionCenterService: actionCenterService));
  registry.register(ActionCenterDismissTool(actionCenterService: actionCenterService));

  // Shortcut tools
  final shortcutTools = ref.read(shortcutToolsServiceProvider);
  registry.register(RunShortcutTool(service: shortcutTools));

  // UI Automation tools (Android: full device automation via AccessibilityService;
  // iOS: screenshot only)
  final uiSvc = ref.read(uiAutomationServiceProvider);
  final uiOverlay = ref.read(overlayServiceProvider);
  registry.register(UiCheckPermissionTool(uiSvc));
  registry.register(UiRequestPermissionTool(uiSvc));
  registry.register(UiTapTool(uiSvc, uiOverlay));
  registry.register(UiSwipeTool(uiSvc, uiOverlay));
  registry.register(UiTypeTextTool(uiSvc, uiOverlay));
  registry.register(UiFindElementsTool(uiSvc));
  registry.register(UiClickElementTool(uiSvc, uiOverlay));
  registry.register(UiScreenshotTool(uiSvc));
  registry.register(UiGlobalActionTool(uiSvc));
  registry.register(UiLaunchAppTool(uiSvc));
  registry.register(UiLaunchIntentTool(uiSvc));
  registry.register(UiListAppsTool(uiSvc));
  registry.register(UiAppIntentsTool(uiSvc));
  registry.register(UiBatchActionsTool(uiSvc, uiOverlay));
  registry.register(UiAskUserTool(uiOverlay));
  registry.register(UiStatusTool(uiOverlay));

  // Sandbox shell tool (Android: PRoot + Alpine rootfs; iOS: unavailable stub)
  final sandboxSvc = ref.read(sandboxServiceProvider);
  registry.register(RunShellCommandTool(sandboxSvc));

  // Skill management tools (search/install from ClawHub, create, list, remove)
  final skillsSvc = ref.read(skillsServiceProvider);
  registry.register(SkillSearchTool(skillsService: skillsSvc));
  registry.register(SkillInstallTool(skillsService: skillsSvc));
  registry.register(SkillCreateTool(skillsService: skillsSvc));
  registry.register(SkillListTool(skillsService: skillsSvc));
  registry.register(SkillRemoveTool(skillsService: skillsSvc));

  // MCP server management tools — let the agent configure MCP servers conversationally.
  final mcpManager = ref.read(mcpClientManagerProvider);
  registry.register(SetLiveVoiceTool(configManager));

  registry.register(McpServerListTool(
      configManager: configManager, mcpManager: mcpManager));
  registry.register(
      McpServerAddTool(configManager: configManager, mcpManager: mcpManager));
  registry.register(McpServerRemoveTool(
      configManager: configManager, mcpManager: mcpManager));

  // MCP server tools — dynamically registered when servers connect/disconnect.
  mcpManager.onToolsChanged = (serverId, entry, tools) {
    // Remove old proxy tools for this server, then register the new ones.
    registry.unregisterPrefix('mcp_${McpProxyTool.sanitizeName(entry.name)}_');
    for (final toolInfo in tools) {
      registry.register(McpProxyTool(
        serverId: serverId,
        serverName: entry.name,
        toolName: toolInfo.name,
        toolDescription: toolInfo.description,
        inputSchema: toolInfo.inputSchema,
        manager: mcpManager,
      ));
    }
  };
  // Connect enabled MCP servers in the background (non-blocking).
  unawaited(
    mcpManager.connectAll(configManager.config.mcpServers),
  );

  return registry;
});

final providerRouterProvider = Provider<ProviderRouter>((ref) {
  final configManager = ref.read(configManagerProvider);
  return FailoverProviderRouter(
    primary: OpenAiProvider(),
    configManager: configManager,
  );
});

final agentLoopProvider = Provider<AgentLoop>((ref) {
  final skillsService = ref.read(skillsServiceProvider);
  final notifService = ref.read(notificationServiceProvider);
  final overlayService = ref.read(overlayServiceProvider);
  final configManager = ref.watch(configManagerProvider);

  // Set agent identity on the overlay so the pill shows emoji + name.
  final activeAgent = configManager.config.activeAgent;
  if (activeAgent != null) {
    overlayService
        .setAgent(activeAgent.name, activeAgent.emoji)
        .catchError((_) {});
  }

  final loop = AgentLoop(
    configManager: configManager,
    providerRouter: ref.watch(providerRouterProvider),
    toolRegistry: ref.watch(toolRegistryProvider),
    sessionManager: ref.watch(sessionManagerProvider),
    hookRunner: ref.read(hookRunnerProvider),
    connectivityService: ref.read(connectivityServiceProvider),
    batteryService: ref.read(batteryServiceProvider),
    skillsPromptGetter: () async {
      await skillsService.loadSkills();
      return skillsService.getSkillsPrompt();
    },
    onToolStatus: (toolName, args, {bool isDone = false}) {
      final log = Logger('flutterclaw.tool_status');
      try {
        if (isDone) {
          log.info('Tool done: $toolName');
          // Don't revert to generic "working…" — let the next thinking
          // status or tool status update the overlay naturally. This avoids
          // flashing "Nova is working..." over the step narration text.
          return;
        }
        final label = formatFriendlyToolStatus(toolName, args);
        final agentName = configManager.config.activeAgent?.name ?? 'Agent';
        log.info('Tool start: $toolName → overlay.show("$label")');
        overlayService.show(label).catchError((e) {
          log.warning('Overlay show failed: $e');
        });
        notifService.showToolStatusNotification(agentName, label).catchError((e) {
          log.warning('Notification failed: $e');
        });
      } catch (e) {
        log.severe('onToolStatus error: $e');
      }
    },
  );
  // Bind the singleton proxy so sessions_spawn / subagents steer can call
  // the agent loop without a circular provider dependency.
  SubagentLoopProxy.instance.bind((sessionKey, task) async {
    final response = await loop.processMessage(sessionKey, task);
    return response.content;
  });
  return loop;
});

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  final svc = ConnectivityService();
  unawaited(svc.init());
  ref.onDispose(svc.dispose);
  return svc;
});

final batteryServiceProvider = Provider<BatteryService>((ref) {
  return BatteryService();
});

final authProfileServiceProvider = FutureProvider<AuthProfileService>((ref) async {
  final configManager = ref.read(configManagerProvider);
  final base = await configManager.configDir;
  final svc = AuthProfileService(
    profilesFilePath: '$base/auth_profiles.json',
    readKey: (id) => SecureKeyStore.getSecret('profile_$id'),
    writeKey: (id, key) => SecureKeyStore.saveSecret('profile_$id', key),
    deleteKey: (id) => SecureKeyStore.deleteSecret('profile_$id'),
  );
  await svc.load();
  return svc;
});

final secretsResolverProvider = Provider<SecretsResolver>((ref) {
  return SecretsResolver(
    readSecret: (name) => SecureKeyStore.getSecret(name),
  );
});

final webChatAdapterProvider = Provider<WebChatChannelAdapter>((ref) {
  return WebChatChannelAdapter();
});

final textToSpeechServiceProvider = Provider<TextToSpeechService>((ref) {
  final svc = TextToSpeechService();
  ref.onDispose(svc.dispose);
  return svc;
});

/// Builds an [AudioTranscriptionService] using the currently active model's
/// API key and base URL. Returns null if no API key is configured.
AudioTranscriptionService? _buildTranscriptionService(ConfigManager configManager) {
  final config = configManager.config;
  final modelName =
      config.activeAgent?.modelName ?? config.agents.defaults.modelName;
  final entry = config.getModel(modelName);
  if (entry == null) return null;

  final apiKey = config.resolveApiKey(entry);
  if (apiKey.isEmpty) return null;

  final rawBase = config.resolveApiBase(entry);
  final apiBase = rawBase.contains('anthropic.com')
      ? 'https://api.openai.com/v1'
      : rawBase;

  return AudioTranscriptionService(apiKey: apiKey, apiBase: apiBase);
}

final channelRouterProvider = Provider<ChannelRouter>((ref) {
  final agentLoop = ref.read(agentLoopProvider);
  final webChat = ref.read(webChatAdapterProvider);
  final configManager = ref.read(configManagerProvider);
  final tts = ref.read(textToSpeechServiceProvider);

  late final ChannelRouter router;
  router = ChannelRouter(
    transcriptionServiceFactory: () => _buildTranscriptionService(configManager),
    agentHandler: (IncomingMessage msg) async {
      try {
        final response = await agentLoop.processMessage(
          msg.sessionKey,
          msg.text,
          channelType: msg.channelType,
          chatId: msg.chatId,
          contentBlocks: msg.contentBlocks,
          channelContext: msg.channelContext,
          onIntermediateMessage: (text) => router.sendMessage(
            OutgoingMessage(
              channelType: msg.channelType,
              chatId: msg.chatId,
              text: text,
            ),
          ),
        );

        // If the user sent a voice message, reply with audio (voice-to-voice).
        final wasVoice = msg.channelContext?['isVoiceMessage'] == true;
        List<int>? voiceBytes;
        if (wasVoice && msg.channelType != 'webchat') {
          final audioPath = await tts.synthesizeToFile(response.content);
          if (audioPath != null) {
            try {
              voiceBytes = await File(audioPath).readAsBytes();
            } finally {
              await File(audioPath).delete().catchError((_) => File(audioPath));
            }
          }
        }

        await router.sendMessage(
          OutgoingMessage(
            channelType: msg.channelType,
            chatId: msg.chatId,
            text: response.content,
            audioBytes: voiceBytes != null
                ? Uint8List.fromList(voiceBytes)
                : null,
            audioMimeType: 'audio/wav',
            isVoiceNote: true,
          ),
        );
      } catch (e, st) {
        Logger('agentHandler').severe(
            'Failed processing ${msg.channelType} message', e, st);
        try {
          await router.sendMessage(
            OutgoingMessage(
              channelType: msg.channelType,
              chatId: msg.chatId,
              text: 'Sorry, something went wrong processing your message. '
                  'Please try again.',
            ),
          );
        } catch (_) {
          // Best-effort — if sending the error also fails, already logged above.
        }
      }
    },
  );

  router.registerAdapter(webChat);
  return router;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final overlayServiceProvider = Provider<OverlayService>((ref) {
  return OverlayService();
});

final cronServiceProvider = Provider<CronService>((ref) {
  return CronService(configManager: ref.read(configManagerProvider));
});

final automationServiceProvider = Provider<AutomationService>((ref) {
  return AutomationService(configManager: ref.read(configManagerProvider));
});

final geofenceServiceProvider = Provider<GeofenceService>((ref) {
  return GeofenceService(configManager: ref.read(configManagerProvider));
});

final watcherServiceProvider = Provider<WatcherService>((ref) {
  return WatcherService(configManager: ref.read(configManagerProvider));
});

final actionCenterServiceProvider = Provider<ActionCenterService>((ref) {
  return ActionCenterService(configManager: ref.read(configManagerProvider));
});

final eventBusProvider = FutureProvider<EventBus>((ref) async {
  final configManager = ref.read(configManagerProvider);
  final ws = await configManager.workspacePath;
  final bus = EventBus(workspacePath: ws);
  ref.onDispose(bus.dispose);
  return bus;
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
    providerRouter: ref.read(providerRouterProvider),
    sandboxService: ref.read(sandboxServiceProvider),
    toolRegistry: ref.read(toolRegistryProvider),
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
      final vendorConfig = router.getVendorConfig(entry.provider);
      final apiBase =
          entry.apiBase ??
          vendorConfig?.defaultApiBase ??
          'https://api.openai.com/v1';
      final modelForApi = entry.provider == 'openrouter'
          ? entry.model
          : entry.provider == 'bedrock'
              ? entry.model
              : entry.modelId;

      final cred = config.providerCredentials[entry.provider];
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
        awsSecretKey: cred?.awsSecretKey,
        awsRegion: cred?.awsRegion,
        awsAuthMode: cred?.awsAuthMode,
      );

      final response = await provider.chatCompletion(request);
      return response.content;
    },
  );
});

/// Plugin lifecycle service — loads plugins from workspace/plugins/.
final pluginServiceProvider = Provider<PluginService>((ref) {
  return PluginService(
    configManager: ref.read(configManagerProvider),
    hookRunner: ref.read(hookRunnerProvider),
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
      typingMode: config.agents.defaults.typingMode,
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
      dmPolicy: config.channels.discord.dmPolicy,
      pairingService: pairingService,
      chatCommandHandler: (sessionKey, command) async {
        final result = await commandHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
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

  // Wire Signal adapter (via signal-cli-rest-api proxy)
  if (config.channels.signal.enabled &&
      config.channels.signal.apiUrl != null &&
      config.channels.signal.apiUrl!.isNotEmpty &&
      config.channels.signal.account != null &&
      config.channels.signal.account!.isNotEmpty) {
    final signal = SignalChannelAdapter(
      apiUrl: config.channels.signal.apiUrl!,
      account: config.channels.signal.account!,
      allowedNumbers: config.channels.signal.allowFrom,
      chatCommandHandler: (sessionKey, command) async {
        final result = await commandHandler.handle(sessionKey, command);
        return result.handled ? result.response : null;
      },
    );
    router.registerAdapter(signal);
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

  // Initialize notification service eagerly so tool status notifications work
  await ref.read(notificationServiceProvider).initialize();

  // Start cron service with event bus
  final cronService = ref.read(cronServiceProvider);
  final eventBus = await ref.read(eventBusProvider.future);
  cronService.eventBus = eventBus;
  await cronService.start();

  // Start automation service with event bus
  final automationService = ref.read(automationServiceProvider);
  automationService.eventBus = eventBus;
  await automationService.start();

  // Start geofence service with event bus
  final geofenceService = ref.read(geofenceServiceProvider);
  geofenceService.eventBus = eventBus;
  await geofenceService.start();

  // Start watcher service with event bus
  final watcherService = ref.read(watcherServiceProvider);
  watcherService.eventBus = eventBus;
  await watcherService.start();

  // Notification service was already initialized above.

  // Start heartbeat runner (never blocks: first tick runs in background)
  final heartbeat = ref.read(heartbeatRunnerProvider);
  await heartbeat.start();

  // Load skills and plugins
  final skillsService = ref.read(skillsServiceProvider);
  await skillsService.loadSkills();

  final pluginService = ref.read(pluginServiceProvider);
  await pluginService.loadPlugins();
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

  // Error message fields
  final bool isError;
  final int? errorStatusCode;
  final String? errorTitle;
  final String? errorCtaUrl;
  final String? errorCtaLabel;

  // Shell command message (for terminal-style rendering)
  final bool isShellCommand;

  // Ephemeral /btw side-question — shown with dashed border, not saved to transcript
  final bool isBtw;

  /// Optional interactive reply blocks (buttons, selects) emitted by a tool.
  /// The chat UI renders these below the message text as touch-friendly widgets.
  final InteractiveReply? interactiveReply;

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
    this.isError = false,
    this.errorStatusCode,
    this.errorTitle,
    this.errorCtaUrl,
    this.errorCtaLabel,
    this.isShellCommand = false,
    this.isBtw = false,
    this.interactiveReply,
  });

  ChatMessage copyWith({
    String? text,
    bool? isStreaming,
    String? toolResultText,
    String? imageData,
    String? imageMimeType,
    bool? isError,
    int? errorStatusCode,
    String? errorTitle,
    String? errorCtaUrl,
    String? errorCtaLabel,
    InteractiveReply? interactiveReply,
  }) => ChatMessage(
    text: text ?? this.text,
    isUser: isUser,
    timestamp: timestamp,
    isStreaming: isStreaming ?? this.isStreaming,
    isToolStatus: isToolStatus,
    toolResultText: toolResultText ?? this.toolResultText,
    imageData: imageData ?? this.imageData,
    imageMimeType: imageMimeType ?? this.imageMimeType,
    isDocumentMessage: isDocumentMessage,
    documentData: documentData,
    documentMimeType: documentMimeType,
    documentFileName: documentFileName,
    isError: isError ?? this.isError,
    errorStatusCode: errorStatusCode ?? this.errorStatusCode,
    errorTitle: errorTitle ?? this.errorTitle,
    errorCtaUrl: errorCtaUrl ?? this.errorCtaUrl,
    errorCtaLabel: errorCtaLabel ?? this.errorCtaLabel,
    interactiveReply: interactiveReply ?? this.interactiveReply,
  );
}

/// Parses a caught exception into a user-friendly error [ChatMessage].
ChatMessage _buildErrorMessage(Object e) {
  final parsed = parseLlmError(e);
  return ChatMessage(
    text: parsed.friendlyMessage,
    isUser: false,
    timestamp: DateTime.now(),
    isError: true,
    errorStatusCode: parsed.statusCode,
    errorTitle: parsed.errorTitle,
    errorCtaUrl: parsed.ctaUrl,
    errorCtaLabel: parsed.ctaLabel,
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

/// The SessionMeta for the currently active session key.
/// Rebuilds whenever session data changes (e.g. after /think command).
final activeSessionMetaProvider = Provider<SessionMeta?>((ref) {
  final key = ref.watch(activeSessionKeyProvider);
  // Subscribe to session changes so this provider rebuilds when meta updates.
  final sessions = ref.watch(activeSessionsProvider);
  final list = sessions.asData?.value;
  return list?.where((s) => s.key == key).firstOrNull;
});

/// Whether persistent unsafe mode (security bypass) is currently enabled.
/// Synced with [ToolRegistry.persistentUnsafeMode].
final unsafeModeProvider =
    NotifierProvider<_UnsafeModeNotifier, bool>(_UnsafeModeNotifier.new);

class _UnsafeModeNotifier extends Notifier<bool> {
  @override
  bool build() => false; // always off on app start

  void set(bool value) {
    state = value;
    ref.read(toolRegistryProvider).setPersistentUnsafeMode(value);
  }
}

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

/// Singleton offline speech-to-text service (iOS SFSpeechRecognizer / Android SpeechRecognizer).
final speechToTextServiceProvider = Provider<SpeechToTextService>((ref) {
  return SpeechToTextService();
});

/// Tracks which message text is currently being spoken by TTS (null = idle).
/// Set to the message text when Speak is tapped; cleared when speech ends.
final ttsSpeakingMsgProvider =
    NotifierProvider<TtsSpeakingMsgNotifier, String?>(
      TtsSpeakingMsgNotifier.new,
    );

class TtsSpeakingMsgNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? msg) => state = msg;
}

class ChatNotifier extends Notifier<List<ChatMessage>> {
  bool _processing = false;
  bool get isProcessing => _processing;
  bool _cancelled = false;
  StreamSubscription<AgentStreamEvent>? _activeSubscription;
  Timer? _liveTranscriptFlushTimer;
  final StringBuffer _liveUserDeltaBuf = StringBuffer();
  final StringBuffer _liveModelDeltaBuf = StringBuffer();
  bool _hatchTriggered = false;
  String? _historyLoadedForAgent; // agentId whose history is currently loaded
  bool _isAppInBackground = false;

  /// Cancel the current streaming response. The active stream loop checks this
  /// flag on each event and breaks early, finalising the partial response.
  void cancelProcessing() {
    if (!_processing) return;
    _cancelled = true;
    _activeSubscription?.cancel();
    _activeSubscription = null;
    // Immediately mark the last assistant bubble as done so the UI updates.
    final updated = List<ChatMessage>.from(state);
    if (updated.isNotEmpty && !updated.last.isUser) {
      updated[updated.length - 1] = updated.last.copyWith(isStreaming: false);
    }
    // Also close any open tool pills left in streaming state.
    for (var i = updated.length - 1; i >= 0; i--) {
      if (updated[i].isToolStatus && updated[i].isStreaming == true) {
        updated[i] = updated[i].copyWith(isStreaming: false);
      }
    }
    state = updated;
  }

  /// Kill the currently running sandbox process and mark the tool pill as done.
  Future<void> killCurrentProcess() async {
    final svc = ref.read(sandboxServiceProvider);
    await svc.kill();
    final updated = List<ChatMessage>.from(state);
    for (var i = updated.length - 1; i >= 0; i--) {
      if (updated[i].isToolStatus && updated[i].isStreaming == true) {
        final existing = updated[i].toolResultText ?? '';
        updated[i] = updated[i].copyWith(
          isStreaming: false,
          toolResultText: existing.isEmpty ? '(process killed)' : existing,
        );
        break;
      }
    }
    state = updated;
  }

  /// Consume [stream] through a [StreamSubscription] stored in
  /// [_activeSubscription] so that [cancelProcessing] can cancel it
  /// immediately — even when the stream is idle between events.
  Future<void> _forEachCancellable(
    Stream<AgentStreamEvent> stream,
    void Function(AgentStreamEvent event) onData,
  ) async {
    final completer = Completer<void>();
    final sub = stream.listen(
      (event) {
        if (_cancelled) return;
        onData(event);
      },
      onDone: () {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (Object e, StackTrace st) {
        if (!completer.isCompleted) completer.completeError(e, st);
      },
      cancelOnError: true,
    );
    _activeSubscription = sub;
    try {
      await completer.future;
    } finally {
      _activeSubscription = null;
    }
  }

  /// Returns the session key currently being viewed in the chat screen.
  String _getSessionKey() => ref.read(activeSessionKeyProvider);

  /// Parse a session key like "telegram:12345" into (channelType, chatId).
  /// Falls back to ('webchat', 'default') for webchat sessions.
  (String channelType, String chatId) _parseSessionKey(String key) {
    final colonIdx = key.indexOf(':');
    if (colonIdx < 0) return ('webchat', 'default');
    final channelType = key.substring(0, colonIdx);
    final chatId = key.substring(colonIdx + 1);
    return (channelType, chatId);
  }

  bool _liveVoiceChatActive() {
    final s = ref.read(liveSessionProvider).status;
    return s == LiveSessionStatus.connecting || s == LiveSessionStatus.ready;
  }

  void _cancelLiveTranscriptUi() {
    _liveTranscriptFlushTimer?.cancel();
    _liveTranscriptFlushTimer = null;
    _liveUserDeltaBuf.clear();
    _liveModelDeltaBuf.clear();
  }

  void _armLiveTranscriptFlushTimer() {
    if (_liveTranscriptFlushTimer?.isActive == true) return;
    _liveTranscriptFlushTimer = Timer(const Duration(milliseconds: 33), () {
      _liveTranscriptFlushTimer = null;
      if (!_liveVoiceChatActive()) return;
      _flushLiveTranscriptDeltaBuffers();
    });
  }

  /// Applies batched user/model transcript deltas to [state] (voice call UI).
  void _flushLiveTranscriptDeltaBuffers() {
    final userChunk = _liveUserDeltaBuf.toString();
    final modelChunk = _liveModelDeltaBuf.toString();
    _liveUserDeltaBuf.clear();
    _liveModelDeltaBuf.clear();
    if (userChunk.isEmpty && modelChunk.isEmpty) return;

    var list = List<ChatMessage>.from(state);

    if (userChunk.isNotEmpty) {
      final i = list.lastIndexWhere(
        (m) => m.isUser && !m.isToolStatus && m.isStreaming,
      );
      if (i < 0) {
        list.add(
          ChatMessage(
            text: userChunk,
            isUser: true,
            timestamp: DateTime.now(),
            isStreaming: true,
          ),
        );
      } else {
        final m = list[i];
        list[i] = m.copyWith(text: m.text + userChunk);
      }
    }

    if (modelChunk.isNotEmpty) {
      var i = list.lastIndexWhere(
        (m) => !m.isUser && !m.isToolStatus && m.isStreaming,
      );
      if (i < 0) {
        final uIdx = list.lastIndexWhere(
          (m) => m.isUser && !m.isToolStatus && m.isStreaming,
        );
        if (uIdx < 0) {
          list.add(
            ChatMessage(
              text: '',
              isUser: true,
              timestamp: DateTime.now(),
              isStreaming: true,
            ),
          );
        }
        list.add(
          ChatMessage(
            text: modelChunk,
            isUser: false,
            timestamp: DateTime.now(),
            isStreaming: true,
          ),
        );
      } else {
        final m = list[i];
        list[i] = m.copyWith(text: m.text + modelChunk);
      }
    }

    state = list;
  }

  void _finalizeLiveStreamingBubbles({bool assistantsOnly = false}) {
    final list = List<ChatMessage>.from(state);
    var changed = false;
    for (var i = 0; i < list.length; i++) {
      final m = list[i];
      if (!m.isStreaming || m.isToolStatus) continue;
      if (assistantsOnly && m.isUser) continue;
      list[i] = m.copyWith(isStreaming: false);
      changed = true;
    }
    if (changed) state = list;
  }

  void _handleLiveAgentEvent(LiveAgentEvent event) {
    switch (event) {
      case LiveUserTranscript(:final text):
        if (!_liveVoiceChatActive()) return;
        _liveUserDeltaBuf.write(text);
        _armLiveTranscriptFlushTimer();
      case LiveModelTranscript(:final text):
        if (!_liveVoiceChatActive()) return;
        _liveModelDeltaBuf.write(text);
        _armLiveTranscriptFlushTimer();
      case LiveTurnComplete():
        _liveTranscriptFlushTimer?.cancel();
        _liveTranscriptFlushTimer = null;
        if (_liveVoiceChatActive()) {
          _flushLiveTranscriptDeltaBuffers();
          _finalizeLiveStreamingBubbles();
        }
      case LiveInterrupted():
        _liveTranscriptFlushTimer?.cancel();
        _liveTranscriptFlushTimer = null;
        if (_liveVoiceChatActive()) {
          _flushLiveTranscriptDeltaBuffers();
          _finalizeLiveStreamingBubbles(assistantsOnly: true);
        }
      case LiveSessionDisconnected():
        _cancelLiveTranscriptUi();
      case LiveAudioOutput():
      case LiveToolStarted():
      case LiveToolCompleted():
      case LiveSessionReady():
      case LiveAgentError():
        break;
    }
  }

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

    final liveEvSub =
        ref.read(liveSessionProvider.notifier).agentEvents.listen(
              _handleLiveAgentEvent,
            );
    ref.onDispose(() {
      liveEvSub.cancel();
      _cancelLiveTranscriptUi();
    });

    ref.listen(liveSessionProvider, (prev, next) {
      if (next.status != LiveSessionStatus.idle) return;
      if (prev == null) return;
      if (prev.status == LiveSessionStatus.idle) return;
      _cancelLiveTranscriptUi();
    });

    // Subscribe to session manager message stream. When a foreign session
    // (Telegram, cron, heartbeat, subagent) receives a new message and the
    // user is watching it, append the message to the visible chat in real-time.
    final sessionManager = ref.read(sessionManagerProvider);
    final messageSub = sessionManager.messageStream.listen((event) {
      final (sessionKey, message) = event;
      if (sessionKey != _getSessionKey()) return;
      final liveOn = _liveVoiceChatActive();
      if (_processing && !liveOn) return; // We are already managing state ourselves.
      if (message.role == 'system') return;

      // Tool result written by SessionManager (e.g. Gemini Live) — close the pill.
      if (message.role == 'tool' && message.toolCallId != null) {
        final toolName = message.name;
        final result = message.content?.toString() ?? '';
        final updated = List<ChatMessage>.from(state);
        for (var i = updated.length - 1; i >= 0; i--) {
          if (!updated[i].isToolStatus || updated[i].isStreaming != true) {
            continue;
          }
          if (toolName != null && toolName.isNotEmpty) {
            final label = updated[i].text;
            if (label != toolName && !label.startsWith('$toolName:')) {
              continue;
            }
          }
          updated[i] = updated[i].copyWith(
            isStreaming: false,
            toolResultText: result,
          );
          state = updated;
          return;
        }
        return;
      }
      if (message.role == 'tool') return;

      // Assistant message with tool calls (Live / foreign injectors): mirror loadHistory pills.
      if (message.role == 'assistant' &&
          (message.toolCalls?.isNotEmpty ?? false)) {
        final text = _extractTextFromContent(message.content);
        final updated = List<ChatMessage>.from(state);
        for (final tc in message.toolCalls!) {
          Map<String, dynamic>? args;
          try {
            args = jsonDecode(tc.function.arguments) as Map<String, dynamic>?;
          } catch (_) {}
          updated.add(
            ChatMessage(
              text: _formatToolStatus(tc.function.name, args),
              isUser: false,
              timestamp: DateTime.now(),
              isToolStatus: true,
              isStreaming: true,
            ),
          );
        }
        if (text.trim().isNotEmpty) {
          updated.add(
            ChatMessage(
              text: text,
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
        }
        state = updated;
        return;
      }

      final text = _extractTextFromContent(message.content);
      if (text.trim().isEmpty) return;

      // During a voice call, plain user/assistant rows are streamed via
      // [LiveUserTranscript]/[LiveModelTranscript]; session persist would duplicate.
      final plainAssistant = message.role == 'assistant' &&
          (message.toolCalls == null || message.toolCalls!.isEmpty);
      if (liveOn && (message.role == 'user' || plainAssistant)) {
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

  /// Force-reload history from storage (e.g. after a Live call adds transcripts).
  Future<void> reloadHistory() async {
    _historyLoadedForAgent = null;
    await loadHistory();
  }

  Future<void> loadHistory() async {
    final sessionKey = _getSessionKey();
    if (_historyLoadedForAgent == sessionKey) return;
    _historyLoadedForAgent = sessionKey;

    final sessionManager = ref.read(sessionManagerProvider);

    final history = sessionManager.getContextMessages(sessionKey);

    if (history.isEmpty) {
      state = [];
      return;
    }

    // First pass: build a map of tool_call_id → tool result content
    final toolResults = <String, String>{};
    for (final msg in history) {
      if (msg.role == 'tool' && msg.toolCallId != null) {
        toolResults[msg.toolCallId!] = msg.content?.toString() ?? '';
      }
    }

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

          // Get the tool result if available
          final toolResult = toolResults[tc.id];

          messages.add(
            ChatMessage(
              text: _formatToolStatus(tc.function.name, args),
              isUser: false,
              timestamp: DateTime.now(),
              isToolStatus: true,
              toolResultText: toolResult,
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

      final isError = msg.metadata?['error'] == true;
      final errorStatusCode = msg.metadata?['errorStatusCode'] as int?;
      final errorTitle = msg.metadata?['errorTitle'] as String?;
      final errorCtaUrl = msg.metadata?['errorCtaUrl'] as String?;
      final errorCtaLabel = msg.metadata?['errorCtaLabel'] as String?;

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
          isError: isError,
          errorStatusCode: errorStatusCode,
          errorTitle: errorTitle,
          errorCtaUrl: errorCtaUrl,
          errorCtaLabel: errorCtaLabel,
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

    final preferLive =
        configManager.config.agents.defaults.preferLiveVoiceBootstrap;
    final liveOk = ref.read(activeModelSupportsLiveProvider);
    if (preferLive && liveOk) {
      await ref.read(liveSessionProvider.notifier).startSession(
            voiceBootstrap: true,
            userLanguage: userLanguage,
          );
      return;
    }

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

    final overlayService = ref.read(overlayServiceProvider);
    final agentName =
        ref.read(configManagerProvider).config.activeAgent?.name ?? 'Agent';
    overlayService.show('$agentName is working...').catchError((_) {});

    bool startedAudio = false;
    if (Platform.isIOS && !IosBackgroundAudioService.isPlaying) {
      startedAudio = await IosBackgroundAudioService.start();
    }

    try {
      final buffer = StringBuffer();
      await _forEachCancellable(
        agentLoop.processMessageStream(
          _getSessionKey(),
          '', // empty user message — the system prompt drives the hatch
          channelType: 'webchat',
          chatId: 'default',
          userLanguage: userLanguage,
        ),
        (event) {
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

          // If a tool returned an interactive payload, inject an interactive
          // message into the chat so the user can tap buttons/selects.
          if (event.toolDetails != null) {
            final interactive = parseInteractiveReply(event.toolDetails!['interactive']);
            if (interactive != null) {
              final updated = List<ChatMessage>.from(state);
              updated.insert(
                updated.length - 1,
                ChatMessage(
                  text: '',
                  isUser: false,
                  timestamp: DateTime.now(),
                  interactiveReply: interactive,
                ),
              );
              state = updated;
            }
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
            final resp = event.finalResponse;
            final finalText = resp?.content ?? buffer.toString();
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: finalText,
              isStreaming: false,
              isError: resp?.isError ?? false,
              errorStatusCode: resp?.errorStatusCode,
              errorTitle: resp?.errorTitle,
              errorCtaUrl: resp?.errorCtaUrl,
              errorCtaLabel: resp?.errorCtaLabel,
            );
            state = updated;

            // If battery-aware or offline switching changed the model, sync
            // the actual model used to the Live Activity so it shows correctly.
            if (resp?.modelUsed != null) {
              final gwNotifier = ref.read(gatewayStateProvider.notifier);
              if (resp!.modelUsed != ref.read(gatewayStateProvider).currentModel) {
                gwNotifier.setModel(resp.modelUsed!);
              }
            }

            if (_isAppInBackground && finalText.trim().isNotEmpty) {
              _sendBackgroundNotification(finalText);
            }
          }
        },
      );
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      if (updated.isNotEmpty) {
        final errorMsg = _buildErrorMessage(e);
        updated[updated.length - 1] = updated.last.copyWith(
          text: errorMsg.text,
          isStreaming: false,
          isError: true,
          errorStatusCode: errorMsg.errorStatusCode,
          errorTitle: errorMsg.errorTitle,
          errorCtaUrl: errorMsg.errorCtaUrl,
          errorCtaLabel: errorMsg.errorCtaLabel,
        );
      }
      state = updated;
    } finally {
      overlayService.showDone().catchError((_) {});
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
    final overlayService = ref.read(overlayServiceProvider);
    final agentName =
        ref.read(configManagerProvider).config.activeAgent?.name ?? 'Agent';
    overlayService.show('$agentName is working...').catchError((_) {});

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
      await _forEachCancellable(
        agentLoop.processMessageStream(
          _getSessionKey(),
          caption,
          channelType: 'webchat',
          chatId: 'default',
          contentBlocks: contentBlocks,
        ),
        (event) {
          if (event.textDelta != null) {
            buffer.write(event.textDelta);
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: buffer.toString(),
            );
            state = updated;
          }
          if (event.isDone) {
            final resp = event.finalResponse;
            final finalText = resp?.content ?? buffer.toString();
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: finalText,
              isStreaming: false,
              isError: resp?.isError ?? false,
              errorStatusCode: resp?.errorStatusCode,
              errorTitle: resp?.errorTitle,
              errorCtaUrl: resp?.errorCtaUrl,
              errorCtaLabel: resp?.errorCtaLabel,
            );
            state = updated;

            if (_isAppInBackground && finalText.trim().isNotEmpty) {
              _sendBackgroundNotification(finalText);
            }
          }
        },
      );
    } catch (e) {
      final errorMsg = _buildErrorMessage(e);
      final updated = List<ChatMessage>.from(state);
      updated[updated.length - 1] = updated.last.copyWith(
        text: errorMsg.text,
        isStreaming: false,
        isError: true,
        errorStatusCode: errorMsg.errorStatusCode,
        errorTitle: errorMsg.errorTitle,
        errorCtaUrl: errorMsg.errorCtaUrl,
        errorCtaLabel: errorMsg.errorCtaLabel,
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
      overlayService.showDone().catchError((_) {});
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
    final overlayService = ref.read(overlayServiceProvider);
    final agentName =
        ref.read(configManagerProvider).config.activeAgent?.name ?? 'Agent';
    overlayService.show('$agentName is working...').catchError((_) {});

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
      await _forEachCancellable(
        agentLoop.processMessageStream(
          _getSessionKey(),
          caption.isNotEmpty ? caption : fileName,
          channelType: 'webchat',
          chatId: 'default',
          contentBlocks: contentBlocks,
        ),
        (event) {
          if (event.textDelta != null) {
            buffer.write(event.textDelta);
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: buffer.toString(),
            );
            state = updated;
          }
          if (event.isDone) {
            final resp = event.finalResponse;
            final finalText = resp?.content ?? buffer.toString();
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: finalText,
              isStreaming: false,
              isError: resp?.isError ?? false,
              errorStatusCode: resp?.errorStatusCode,
              errorTitle: resp?.errorTitle,
              errorCtaUrl: resp?.errorCtaUrl,
              errorCtaLabel: resp?.errorCtaLabel,
            );
            state = updated;

            if (_isAppInBackground && finalText.trim().isNotEmpty) {
              _sendBackgroundNotification(finalText);
            }
          }
        },
      );
    } catch (e) {
      final errorMsg = _buildErrorMessage(e);
      final updated = List<ChatMessage>.from(state);
      updated[updated.length - 1] = updated.last.copyWith(
        text: errorMsg.text,
        isStreaming: false,
        isError: true,
        errorStatusCode: errorMsg.errorStatusCode,
        errorTitle: errorMsg.errorTitle,
        errorCtaUrl: errorMsg.errorCtaUrl,
        errorCtaLabel: errorMsg.errorCtaLabel,
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
      overlayService.showDone().catchError((_) {});
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
        if (result.clearChatUi) {
          state = [];
          _historyLoadedForAgent = _getSessionKey();
          _hatchTriggered = false;
          return;
        }
        final isShellCmd = text.trim().startsWith('/sh ');
        state = [
          ...state,
          ChatMessage(text: text, isUser: true, timestamp: DateTime.now()),
          ChatMessage(
            text: result.response!,
            isUser: false,
            timestamp: DateTime.now(),
            isShellCommand: isShellCmd,
            isBtw: result.isBtw,
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

    final overlayService = ref.read(overlayServiceProvider);
    final agentName =
        ref.read(configManagerProvider).config.activeAgent?.name ?? 'Agent';
    overlayService.show('$agentName is working...').catchError((_) {});

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

      final sessionKey = _getSessionKey();
      final (channelType, chatId) = _parseSessionKey(sessionKey);

      await _forEachCancellable(
        agentLoop.processMessageStream(
          sessionKey,
          text,
          channelType: channelType,
          chatId: chatId,
        ),
        (event) {
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

          // Streaming tool output chunk — update the live result text on the pill.
          if (event.toolResultChunk != null) {
            final chunk = event.toolResultChunk!;
            final isClear = chunk.startsWith('\x00CLEAR\x00');
            print('[ChatNotifier] toolResultChunk len=${chunk.length} isClear=$isClear');
            final updated = List<ChatMessage>.from(state);
            bool found = false;
            for (var i = updated.length - 1; i >= 0; i--) {
              if (updated[i].isToolStatus && updated[i].isStreaming == true) {
                found = true;
                final String newText;
                if (isClear) {
                  // Replace accumulated text with the final authoritative output.
                  newText = chunk.substring(7); // \x00CLEAR\x00 is 7 chars
                } else {
                  newText = (updated[i].toolResultText ?? '') + chunk;
                }
                print('[ChatNotifier] → updating pill at i=$i, newText len=${newText.length}');
                updated[i] = updated[i].copyWith(toolResultText: newText);
                break;
              }
            }
            if (!found) print('[ChatNotifier] ⚠ no streaming pill found for chunk!');
            state = updated;
          }

          if (event.toolResult != null) {
            print('[ChatNotifier] toolResult len=${event.toolResult!.length}');
            final updated = List<ChatMessage>.from(state);
            bool found = false;
            for (var i = updated.length - 1; i >= 0; i--) {
              if (updated[i].isToolStatus && updated[i].isStreaming == true) {
                found = true;
                print('[ChatNotifier] → marking pill at i=$i as done');
                updated[i] = updated[i].copyWith(
                  isStreaming: false,
                  toolResultText: event.toolResult,
                );
                break;
              }
            }
            if (!found) print('[ChatNotifier] ⚠ no streaming pill found for toolResult!');
            state = updated;
          }

          if (event.textDelta != null) {
            buffer.write(event.textDelta);
            if (DateTime.now().difference(lastFlush) >= flushInterval) {
              flushBuffer();
            }
          }

          if (event.isDone) {
            final resp = event.finalResponse;
            final finalText = resp?.content ?? buffer.toString();
            final updated = List<ChatMessage>.from(state);
            updated[updated.length - 1] = updated.last.copyWith(
              text: finalText,
              isStreaming: false,
              isError: resp?.isError ?? false,
              errorStatusCode: resp?.errorStatusCode,
              errorTitle: resp?.errorTitle,
              errorCtaUrl: resp?.errorCtaUrl,
              errorCtaLabel: resp?.errorCtaLabel,
            );
            state = updated;

            // Route the response back to the originating channel (Telegram,
            // Discord, etc.) so the user sees it there too — not just in the
            // app UI. Webchat sessions don't need this because the UI *is*
            // the channel.
            if (channelType != 'webchat' && finalText.trim().isNotEmpty) {
              try {
                final router = ref.read(channelRouterProvider);
                // ignore: unawaited_futures
                router.sendMessage(
                  OutgoingMessage(
                    channelType: channelType,
                    chatId: chatId,
                    text: finalText,
                  ),
                );
              } catch (e) {
                Logger('ChatNotifier').warning(
                    'Failed to route response to $channelType', e);
              }
            }

            if (_isAppInBackground && finalText.trim().isNotEmpty) {
              _sendBackgroundNotification(finalText);
            }
          }
        },
      );
      // Flush any remaining buffered text if stream ended without isDone
      if (buffer.isNotEmpty && state.isNotEmpty && state.last.isStreaming) {
        flushBuffer();
      }
    } catch (e) {
      final updated = List<ChatMessage>.from(state);
      if (_cancelled) {
        updated[updated.length - 1] = updated.last.copyWith(
          text: state.last.text.isEmpty ? '_(cancelled)_' : state.last.text,
          isStreaming: false,
          isError: false,
          errorStatusCode: null,
          errorTitle: null,
          errorCtaUrl: null,
          errorCtaLabel: null,
        );
      } else {
        final errorMsg = _buildErrorMessage(e);
        updated[updated.length - 1] = updated.last.copyWith(
          text: errorMsg.text,
          isStreaming: false,
          isError: true,
          errorStatusCode: errorMsg.errorStatusCode,
          errorTitle: errorMsg.errorTitle,
          errorCtaUrl: errorMsg.errorCtaUrl,
          errorCtaLabel: errorMsg.errorCtaLabel,
        );
      }
      state = updated;
    } finally {
      // Signal agent run completed — show brief "Done" then auto-hide.
      overlayService.showDone().catchError((_) {});
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
    // Keep currentModel in sync when the active agent or its model changes.
    ref.listen<AgentProfile?>(activeAgentProvider, (_, next) {
      final newModel = next?.modelName;
      if (newModel != null && newModel.isNotEmpty && newModel != state.currentModel) {
        setModel(newModel);
      }
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
    String? modelOnStart;
    if (running) {
      final config = ref.read(configManagerProvider).config;
      modelOnStart = config.activeAgent?.modelName ?? config.agents.defaults.modelName;
    }
    state = state.copyWith(
      isRunning: running,
      status: running ? 'running' : 'stopped',
      state: running ? 'running' : 'stopped',
      startedAt: running ? DateTime.now() : null,
      uptimeSeconds: 0,
      tokensProcessed: 0,
      sessionCount: 0,
      currentModel: modelOnStart,
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

// ---------------------------------------------------------------------------
// Gemini Live API providers
// ---------------------------------------------------------------------------

/// Tools that mutate agent config / active agent. Excluded from the Live API
/// tool list so the voice model cannot call `agent_update` on a casual reply
/// (that invalidates Riverpod and was correlating with dead mic / disconnects).
const _liveVoiceExcludedToolNames = <String>{
  'agent_update',
  'agent_create',
  'agent_delete',
  'agent_switch',
};

List<Map<String, dynamic>> _toolDefsForLiveVoiceSession(ToolRegistry registry) {
  return registry.toProviderDefs().where((t) {
    final fn = t['function'] as Map<String, dynamic>?;
    final name = fn?['name'] as String?;
    if (name == null) return true;
    return !_liveVoiceExcludedToolNames.contains(name);
  }).toList();
}

/// Gemini Live WebSocket service (singleton per app lifecycle).
final geminiLiveServiceProvider = Provider<GeminiLiveService>((ref) {
  final svc = GeminiLiveService();
  ref.onDispose(svc.dispose);
  return svc;
});

/// PCM microphone stream service for Live API audio input.
final pcmAudioStreamServiceProvider = Provider<PcmAudioStreamService>((ref) {
  final svc = PcmAudioStreamService();
  ref.onDispose(svc.dispose);
  return svc;
});

/// State for the Live voice session.
enum LiveSessionStatus { idle, connecting, ready, error }

class LiveSessionState {
  final LiveSessionStatus status;
  final String? errorMessage;

  const LiveSessionState({
    this.status = LiveSessionStatus.idle,
    this.errorMessage,
  });

  LiveSessionState copyWith({LiveSessionStatus? status, String? errorMessage}) =>
      LiveSessionState(
        status: status ?? this.status,
        errorMessage: errorMessage,
      );
}

/// Orchestrates the full Gemini Live session lifecycle.
final liveSessionProvider =
    NotifierProvider<LiveSessionNotifier, LiveSessionState>(
  LiveSessionNotifier.new,
);

class LiveSessionNotifier extends Notifier<LiveSessionState> {
  LiveAgentLoop? _agentLoop;
  StreamSubscription? _audioInputSub;
  StreamSubscription? _agentEventSub;

  /// While true, mic PCM is not sent — avoids speaker bleed being treated as
  /// user speech (self-interrupt loop). Cleared after local playback ends.
  bool _suppressMicForLocalPlayback = false;
  Timer? _playbackUnsuppressTimer;
  Timer? _micSuppressFailsafeTimer;

  /// Permanent broadcast stream for the UI. Created once in build(), survives
  /// across connect/disconnect cycles so the overlay can subscribe immediately
  /// at status=connecting (before _agentLoop exists).
  final _eventCtrl = StreamController<LiveAgentEvent>.broadcast();

  /// Events for UI consumption (audio output, transcripts, tool status).
  /// Always non-null — the overlay can subscribe at any time.
  Stream<LiveAgentEvent> get agentEvents => _eventCtrl.stream;

  @override
  LiveSessionState build() {
    // Clean up the stream controller when the provider is disposed.
    ref.onDispose(() {
      _playbackUnsuppressTimer?.cancel();
      _micSuppressFailsafeTimer?.cancel();
      _agentEventSub?.cancel();
      _eventCtrl.close();
    });
    return const LiveSessionState();
  }

  static final _liveLog = Logger('GeminiLive.session');

  /// Start a Live voice session with the currently active agent.
  ///
  /// [voiceBootstrap]: after setup, send a one-shot text nudge so the model
  /// begins the BOOTSTRAP / first-contact ritual aloud. System prompt and
  /// transcript always match REST chat regardless of this flag.
  Future<void> startSession({
    bool voiceBootstrap = false,
    String? userLanguage,
  }) async {
    if (state.status == LiveSessionStatus.connecting ||
        state.status == LiveSessionStatus.ready) {
      _liveLog.info('startSession: already connecting/ready, ignoring tap');
      return;
    }

    _liveLog.info(
      'startSession: initiated voiceBootstrap=$voiceBootstrap',
    );
    state = state.copyWith(status: LiveSessionStatus.connecting);

    try {
      final configManager = ref.read(configManagerProvider);
      final sessionManager = ref.read(sessionManagerProvider);
      final toolRegistry = ref.read(toolRegistryProvider);
      final liveService = ref.read(geminiLiveServiceProvider);
      final pcmService = ref.read(pcmAudioStreamServiceProvider);

      // --- Resolve call-mode model and API key ---
      // Live is a provider-agnostic call overlay. The Live model is looked up
      // from the catalog by matching the active agent's provider — not from the
      // user's model list (Live models are hidden from the picker).
      final activeKey = ref.read(activeSessionKeyProvider);
      _liveLog.info('startSession: activeKey=$activeKey');

      final activeAgent = ref.read(activeAgentProvider);
      final agentModelEntry = configManager.config.modelList
          .cast<ModelEntry?>()
          .firstWhere(
            (m) => m!.modelName == activeAgent?.modelName,
            orElse: () => null,
          );
      final provider = agentModelEntry?.provider ?? 'google';

      // Find the Live model: optional user override, else first catalog Live for provider.
      const fallbackLiveModelId = 'gemini-2.5-flash-preview-native-audio-dialog';
      final overrideId =
          configManager.config.agents.defaults.liveVoiceModelId;
      CatalogModel? overrideCatalog;
      if (overrideId != null && overrideId.isNotEmpty) {
        final cm = ModelCatalog.tryGetModelFlexible(overrideId);
        if (cm != null &&
            cm.providerId == provider &&
            cm.isLiveModel) {
          overrideCatalog = cm;
        }
      }
      final liveModelId = overrideCatalog?.id ??
          ModelCatalog.models
              .cast<CatalogModel?>()
              .firstWhere(
                (m) => m!.providerId == provider && m.isLiveModel,
                orElse: () => null,
              )
              ?.id ??
          fallbackLiveModelId;

      // Resolve API key for this provider.
      final apiKey = configManager.config.providerCredentials[provider]?.apiKey
                  .isNotEmpty ==
              true
          ? configManager.config.providerCredentials[provider]!.apiKey
          : (agentModelEntry?.apiKey?.isNotEmpty == true
              ? agentModelEntry!.apiKey!
              : configManager.config.modelList
                      .cast<ModelEntry?>()
                      .firstWhere(
                        (m) =>
                            m!.provider == provider &&
                            m.apiKey?.isNotEmpty == true,
                        orElse: () => null,
                      )
                      ?.apiKey ??
                  '');

      _liveLog.info(
        'startSession: liveModel=$liveModelId '
        'apiKey=${apiKey.isEmpty ? "EMPTY" : "***${apiKey.substring(apiKey.length - 4)}"}',
      );

      if (apiKey.isEmpty) {
        _liveLog.severe('startSession: no Google API key found');
        state = state.copyWith(
          status: LiveSessionStatus.error,
          errorMessage: 'Configure a Google API key to use Live voice',
        );
        return;
      }

      // Same system prompt + transcript semantics as REST chat (AgentLoop).
      final agentLoop = ref.read(agentLoopProvider);
      final fullPrompt = await agentLoop.buildSystemPromptForAgent(
        agentId: activeAgent?.id,
        userLanguage: userLanguage,
      );
      const voiceNote = '\n\n# Voice session\n'
          'You are in a real-time voice call. Animate naturally — speak in the '
          'same manner as if you were in text chat. Follow workspace instructions, '
          'BOOTSTRAP when it applies (e.g. first hatch), and use tools when the '
          'user asks for something that tools can do.\n\n'
          'IMPORTANT — tools that require user interaction (e.g. web_browse with '
          'action "request_user_action" to solve a CAPTCHA or complete a login): '
          'ALWAYS speak to the user FIRST to explain what you need them to do and '
          'why, THEN call the tool. Never open the browser silently.';
      const liveSystemMaxChars = 150000;
      var transcriptBudget =
          liveSystemMaxChars - fullPrompt.length - voiceNote.length - 2;
      if (transcriptBudget < 0) transcriptBudget = 0;
      final contextMsgs = sessionManager.getContextMessages(activeKey);
      final transcriptBlock = transcriptBudget > 0
          ? formatContextMessagesForLiveSystemInstruction(
              contextMsgs,
              maxChars: transcriptBudget,
            )
          : '';
      var combined = transcriptBlock.isEmpty
          ? '$fullPrompt$voiceNote'
          : '$fullPrompt$voiceNote\n\n$transcriptBlock';
      if (combined.length > liveSystemMaxChars) {
        combined =
            '${combined.substring(0, liveSystemMaxChars)}\n\n[... truncated ...]';
      }
      final systemInstruction = combined;

      // Translate tools to Gemini format (omit agent CRUD — see
      // [_liveVoiceExcludedToolNames]).
      final geminiTools = GeminiToolTranslator.toGeminiTools(
        _toolDefsForLiveVoiceSession(toolRegistry),
      );

      // Build session config.
      final config = LiveSessionConfig(
        apiKey: apiKey,
        model: 'models/$liveModelId',
        systemInstruction: systemInstruction,
        tools: geminiTools.isNotEmpty ? geminiTools : null,
        voiceName: configManager.config.agents.defaults.liveVoiceName,
        responseModalities: const ['AUDIO'],
      );

      // Connect WebSocket.
      await liveService.connect(config: config);

      // Ensure the webchat session exists before LiveAgentLoop writes to it.
      // addMessage silently drops messages if _meta[key] is null (session never created).
      final keyParts = activeKey.split(':');
      await sessionManager.getOrCreate(
        activeKey,
        keyParts[0],
        keyParts.length > 1 ? keyParts.sublist(1).join(':') : 'default',
      );

      // Create and start the agent loop.
      _agentLoop = LiveAgentLoop(
        liveService: liveService,
        toolRegistry: toolRegistry,
        sessionManager: sessionManager,
      );
      _agentLoop!.start(activeKey);

      // Pipe LiveAgentLoop events into the permanent broadcast controller
      // so the overlay can receive them regardless of when it subscribed.
      _agentEventSub = _agentLoop!.events.listen((e) {
        if (!_eventCtrl.isClosed) _eventCtrl.add(e);
      });

      // Wait for setup complete or error.
      final firstEvent = await liveService.events.first;
      if (firstEvent is! SetupComplete) {
        final msg = firstEvent is LiveError ? firstEvent.message : 'Setup failed';
        state = state.copyWith(
          status: LiveSessionStatus.error,
          errorMessage: msg,
        );
        await _cleanup();
        return;
      }

      if (voiceBootstrap) {
        liveService.sendText(
          'Begin your bootstrap / first-contact ritual per your workspace '
          'instructions (for example BOOTSTRAP.md). Greet the user aloud.',
        );
      }

      // Configure iOS audio session to playAndRecord so we can simultaneously
      // record mic input and play back the model's audio output.
      try {
        final audioSession = await AudioSession.instance;
        await audioSession.configure(AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
          avAudioSessionCategoryOptions:
              AVAudioSessionCategoryOptions.defaultToSpeaker |
              AVAudioSessionCategoryOptions.allowBluetooth,
          avAudioSessionMode: AVAudioSessionMode.voiceChat,
          avAudioSessionSetActiveOptions:
              AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
        ));
        await audioSession.setActive(true);
        _liveLog.info('startSession: audio session configured (playAndRecord)');
      } catch (e) {
        _liveLog.warning('startSession: audio session config failed: $e');
      }

      // Stream mic whenever not suppressed. Suppression is tied to *local*
      // speaker playback (see [setLivePlaybackSuppressMic]): sending mic while
      // the assistant audio plays on-device causes Gemini to hear itself and
      // fire spurious interruptions.
      final audioStream = await pcmService.startStreaming();
      if (audioStream != null) {
        _audioInputSub = audioStream.listen((chunk) {
          if (!_suppressMicForLocalPlayback) {
            liveService.sendAudio(chunk);
          }
        });
      }

      state = state.copyWith(status: LiveSessionStatus.ready);
    } catch (e, st) {
      _liveLog.severe('startSession: unexpected error', e, st);
      state = state.copyWith(
        status: LiveSessionStatus.error,
        errorMessage: '$e',
      );
      await _cleanup();
    }
  }

  /// Stop the Live session.
  ///
  /// Callers that need fresh transcript rows should run
  /// [ChatNotifier.reloadHistory] from the widget layer (e.g. after `await
  /// stopSession()`), not from here — that avoids Riverpod circular deps with
  /// [ChatNotifier] which listens to [liveSessionProvider].
  Future<void> stopSession() async {
    await _cleanup();
    state = const LiveSessionState();
  }

  /// Called by [LiveVoiceOverlay] when local TTS playback starts/stops.
  void setLivePlaybackSuppressMic(bool suppress) {
    _playbackUnsuppressTimer?.cancel();
    _playbackUnsuppressTimer = null;
    _micSuppressFailsafeTimer?.cancel();
    _micSuppressFailsafeTimer = null;
    if (!suppress) {
      _suppressMicForLocalPlayback = false;
      return;
    }
    _suppressMicForLocalPlayback = true;
    // If [processingState.completed] never fires, the mic would stay dead.
    _micSuppressFailsafeTimer = Timer(const Duration(seconds: 45), () {
      _micSuppressFailsafeTimer = null;
      _suppressMicForLocalPlayback = false;
      _liveLog.warning(
        'live voice: mic suppress failsafe fired (playback completion missed?)',
      );
    });
  }

  /// After a concatenated turn finishes playing, wait for speaker tail before
  /// sending mic again.
  void scheduleMicUnsuppressAfterLocalPlayback({
    Duration delay = const Duration(milliseconds: 400),
  }) {
    _playbackUnsuppressTimer?.cancel();
    _playbackUnsuppressTimer = Timer(delay, () {
      _playbackUnsuppressTimer = null;
      _micSuppressFailsafeTimer?.cancel();
      _micSuppressFailsafeTimer = null;
      _suppressMicForLocalPlayback = false;
    });
  }

  Future<void> _cleanup() async {
    _playbackUnsuppressTimer?.cancel();
    _playbackUnsuppressTimer = null;
    _micSuppressFailsafeTimer?.cancel();
    _micSuppressFailsafeTimer = null;
    _suppressMicForLocalPlayback = false;
    await _audioInputSub?.cancel();
    _audioInputSub = null;
    await _agentEventSub?.cancel();
    _agentEventSub = null;
    await ref.read(pcmAudioStreamServiceProvider).stopStreaming();
    await _agentLoop?.stop();
    _agentLoop = null;
    await ref.read(geminiLiveServiceProvider).disconnect();
  }
}
