/// Core agent loop for processing user messages with tool execution.
///
/// Matches OpenClaw's agent loop: system prompt from workspace files,
/// full transcript persistence (including tool calls/results),
/// tool iteration loop, and LLM-powered compaction.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutterclaw/core/agent/link_understanding.dart';
import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/services/battery_service.dart';
import 'package:flutterclaw/services/connectivity_service.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/agent/token_budget_manager.dart';
import 'package:flutterclaw/core/providers/error_parser.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/services/hook_runner.dart';
import 'package:flutterclaw/services/ui_automation_service.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.agent_loop');

class AgentResponse {
  final String content;
  final int toolCallsExecuted;
  final UsageInfo? usage;
  final String sessionKey;
  final int? errorStatusCode;
  final String? errorTitle;
  final String? errorCtaUrl;
  final String? errorCtaLabel;
  /// The model name actually used (may differ from config when battery-aware
  /// switching or offline fallback kicks in).
  final String? modelUsed;

  const AgentResponse({
    required this.content,
    this.toolCallsExecuted = 0,
    this.usage,
    required this.sessionKey,
    this.errorStatusCode,
    this.errorTitle,
    this.errorCtaUrl,
    this.errorCtaLabel,
    this.modelUsed,
  });

  bool get isError => errorStatusCode != null;
}

class AgentStreamEvent {
  final String? textDelta;
  final String? toolName;
  final Map<String, dynamic>? toolArgs;
  final String? toolResult;
  /// Structured details from the tool result (e.g. interactive reply payload).
  /// Consumers like ChatNotifier use this to render rich UI beyond plain text.
  final Map<String, dynamic>? toolDetails;
  /// Incremental output chunk from a streaming tool (e.g. sandbox_exec).
  /// The UI appends this to the expandable tool result card in real time.
  final String? toolResultChunk;
  final bool isDone;
  final AgentResponse? finalResponse;

  const AgentStreamEvent({
    this.textDelta,
    this.toolName,
    this.toolArgs,
    this.toolResult,
    this.toolDetails,
    this.toolResultChunk,
    this.isDone = false,
    this.finalResponse,
  });
}

/// Callback invoked by [AgentLoop] when a tool starts or finishes.
/// [toolName] is the tool being called, [args] are its arguments.
/// [isDone] is true when the tool has finished executing.
typedef ToolStatusCallback = void Function(
  String toolName,
  Map<String, dynamic>? args, {
  bool isDone,
});

class AgentLoop {
  final ConfigManager configManager;
  final ProviderRouter providerRouter;
  final ToolRegistry toolRegistry;
  final SessionManager sessionManager;
  Future<String> Function()? skillsPromptGetter;

  /// Optional callback invoked for every tool call, regardless of caller
  /// (ChatNotifier, channels, subagents). Use for overlay/notification.
  ToolStatusCallback? onToolStatus;

  /// Optional hook runner for session lifecycle events.
  HookRunner? hookRunner;

  /// Optional connectivity service. When set, the agent loop checks network
  /// state before each LLM call and falls back to a local model when offline.
  ConnectivityService? connectivityService;

  /// Optional battery service. When set, injects battery context into the
  /// system prompt and prefers lighter models on low battery.
  BatteryService? batteryService;

  AgentLoop({
    required this.configManager,
    required this.providerRouter,
    required this.toolRegistry,
    required this.sessionManager,
    this.skillsPromptGetter,
    this.onToolStatus,
    this.hookRunner,
    this.connectivityService,
    this.batteryService,
  });

  // Cached device info for system prompt injection
  Map<String, dynamic>? _deviceInfo;

  /// Build the Android UI automation guidance section, including device-specific
  /// navigation tips based on the actual hardware and Android version.
  Future<String> _buildUiAutomationGuidance() async {
    // Fetch device info once and cache
    if (_deviceInfo == null) {
      try {
        final uiSvc = UiAutomationService();
        _deviceInfo = await uiSvc.deviceInfo();
      } catch (_) {
        _deviceInfo = {};
      }
    }
    final d = _deviceInfo!;
    final manufacturer = (d['manufacturer'] as String? ?? 'unknown').toLowerCase();
    final brand = (d['brand'] as String? ?? '').toLowerCase();
    final model = d['model'] as String? ?? 'unknown';
    final androidVer = d['androidVersion'] as String? ?? 'unknown';
    final sdkInt = d['sdkInt'] as int? ?? 0;
    final screenW = d['screenWidthPx'] as int? ?? 0;
    final screenH = d['screenHeightPx'] as int? ?? 0;
    final deviceLang = d['displayLanguage'] as String? ?? '';
    final deviceLocale = d['locale'] as String? ?? '';

    final buf = StringBuffer();
    buf.writeln('# Android UI Automation');
    buf.writeln();
    buf.writeln('## Device');
    buf.writeln('You are controlling a **$model** by **${d['manufacturer']}** (brand: ${d['brand']}).');
    buf.writeln('- Android $androidVer (API $sdkInt)');
    buf.writeln('- Screen: ${screenW}x${screenH} px');
    buf.writeln('- **Device language: $deviceLang ($deviceLocale)**');
    buf.writeln();
    buf.writeln('You are the user\'s personal Android expert. You have used this exact $model '
        'every single day for years. You know every screen, every menu, every shortcut, '
        'every gesture, and every quirk of ${d['manufacturer']}\'s software. You navigate '
        'this phone faster than any human could. You NEVER get lost, you NEVER hesitate, '
        'and you ALWAYS know the fastest path to any setting, app, or feature.');
    buf.writeln();
    buf.writeln('You have tools to control the device screen (tap, swipe, type, find/click elements, screenshot, global actions).');
    buf.writeln();
    buf.writeln('## ABSOLUTE RULES');
    buf.writeln('1. **USE THE DEVICE LANGUAGE for all UI element searches.** This phone is set to **$deviceLang**. '
        'All buttons, menus, labels, and system UI are in $deviceLang. When searching for elements with '
        '`ui_click_element` or `ui_find_elements`, ALWAYS use $deviceLang text. Examples: '
        '${_getLocalizedExamples(d['language'] as String? ?? 'en')}');
    buf.writeln('2. **NEVER ask the user if you should continue.** If you haven\'t reached the objective, KEEP GOING. '
        'The user asked you to do something — do it completely, start to finish, without stopping to ask for permission or confirmation.');
    buf.writeln('3. **NEVER say "I couldn\'t find X" or "would you like me to try..." or "shall I continue?"** — '
        'just try another approach silently and keep working.');
    buf.writeln('4. **NEVER give up.** If one path doesn\'t work, try another. Scroll, go back, try a different menu. '
        'You are an expert — experts find solutions, they don\'t report failure.');
    buf.writeln('5. **Only talk to the user when the task is DONE** or when you need information you truly cannot infer '
        '(e.g., a password, a specific contact name, a choice between options). Navigation decisions are YOURS to make.');
    buf.writeln();

    // Manufacturer-specific launcher / UI guidance
    buf.writeln('## Launcher & UI Skin');
    if (manufacturer.contains('samsung') || brand.contains('samsung')) {
      buf.writeln('This is a **Samsung** device running **One UI**.');
      buf.writeln('- Home screen: swipe up from bottom for App Drawer (all apps).');
      buf.writeln('- Settings: gear icon in App Drawer or pull down notification shade → tap gear icon (top right).');
      buf.writeln('- Quick Settings: swipe down once for notifications, twice for full Quick Settings tiles.');
      buf.writeln('- Recent apps: swipe up and hold from the bottom (gesture nav) or tap the square button.');
      buf.writeln('- Samsung apps folder: common apps grouped in a "Samsung" folder on home screen or app drawer.');
      buf.writeln('- Edge Panel: swipe inward from the right edge for Edge Panel shortcuts.');
      buf.writeln('- Settings search: has a search bar at the very top of Settings.');
    } else if (manufacturer.contains('google') || brand.contains('google') || model.toLowerCase().contains('pixel')) {
      buf.writeln('This is a **Google Pixel** running **stock Android / Pixel Launcher**.');
      buf.writeln('- Home screen: swipe up for App Drawer. Google search bar at bottom.');
      buf.writeln('- Settings: App Drawer → "Settings", or swipe down twice → gear icon.');
      buf.writeln('- Quick Settings: swipe down once for compact, twice for expanded tiles.');
      buf.writeln('- Recent apps: swipe up and hold from bottom edge.');
      buf.writeln('- At a Glance widget at top of home screen shows date/weather.');
      buf.writeln('- Pixel-specific features: Now Playing, Live Caption, Call Screen accessible in Settings.');
    } else if (manufacturer.contains('xiaomi') || brand.contains('redmi') || brand.contains('poco') || brand.contains('xiaomi')) {
      buf.writeln('This is a **Xiaomi/Redmi/POCO** device running **MIUI / HyperOS**.');
      buf.writeln('- Home screen: by default NO app drawer — all apps are on the home screen pages. Swipe left/right to find apps.');
      buf.writeln('- To enable App Drawer (if enabled): swipe up from bottom center.');
      buf.writeln('- Settings: look for "Settings" gear icon on home screen, or pull down notification shade → gear icon.');
      buf.writeln('- Control Center: swipe down from top-right for Control Center, top-left for notifications (MIUI 13+).');
      buf.writeln('- Security app: contains cleaner, battery, permissions — important hub.');
    } else if (manufacturer.contains('huawei') || brand.contains('honor')) {
      buf.writeln('This is a **Huawei/Honor** device running **EMUI / HarmonyOS**.');
      buf.writeln('- Home screen: swipe up for App Drawer (if enabled), otherwise apps on pages.');
      buf.writeln('- Settings: gear icon on home screen or swipe down → gear icon.');
      buf.writeln('- Quick Settings: swipe down from top, swipe again for full tiles.');
      buf.writeln('- AppGallery instead of Play Store for Huawei-exclusive apps.');
    } else if (manufacturer.contains('oneplus') || brand.contains('oneplus')) {
      buf.writeln('This is a **OnePlus** device running **OxygenOS**.');
      buf.writeln('- Very close to stock Android with App Drawer on swipe up.');
      buf.writeln('- Settings: App Drawer → "Settings", or swipe down → gear.');
      buf.writeln('- Shelf: swipe down on home screen (sometimes left).');
      buf.writeln('- Alert Slider: physical switch for Ring/Vibrate/Silent — not controllable via UI.');
    } else if (manufacturer.contains('oppo') || brand.contains('realme') || manufacturer.contains('vivo')) {
      buf.writeln('This is an **OPPO/Realme/vivo** device running **ColorOS / Funtouch OS**.');
      buf.writeln('- Home screen: may or may not have app drawer (check by swiping up).');
      buf.writeln('- Settings: gear icon on home screen or notification shade.');
      buf.writeln('- Control Center may be separate from notifications (like MIUI).');
    } else {
      buf.writeln('Manufacturer: ${d['manufacturer']}. Assume near-stock Android launcher with App Drawer on swipe up.');
    }
    buf.writeln();

    // Gesture navigation awareness
    buf.writeln('## Navigation');
    if (sdkInt >= 29) { // Android 10+
      buf.writeln('Android ${androidVer} likely uses **gesture navigation** (no visible nav buttons):');
      buf.writeln('- Back: swipe from left or right edge toward center.');
      buf.writeln('- Home: swipe up from bottom edge.');
      buf.writeln('- Recents: swipe up from bottom and hold.');
      buf.writeln('- BUT use `ui_global_action` for these — it works regardless of nav mode.');
    } else {
      buf.writeln('Likely uses **3-button navigation**: Back (triangle), Home (circle), Recents (square).');
      buf.writeln('Use `ui_global_action` for back/home/recents — it always works.');
    }
    buf.writeln();

    buf.writeln(r'''## CRITICAL: Always use screenshots

`ui_screenshot` is your eyes. You MUST call it:
- **Before ANY action** — you cannot interact with something you haven't seen. Always screenshot first to understand what is currently on screen.
- **After EVERY action** — every tap, click, swipe, type, or navigation MUST be followed by a screenshot to verify the result. Never assume an action succeeded.
- **When stuck** — if something didn't work, screenshot to see what actually happened.

Do NOT chain multiple actions without screenshots in between. The correct pattern is always: screenshot → act → screenshot → act → screenshot → ...

## Workflow
1. `ui_screenshot` — see what's on screen
2. Analyze the screenshot and decide what to do
3. Act — use the appropriate tool
4. `ui_screenshot` — verify the action worked
5. Repeat until the task is complete

## Status narration (MANDATORY)
Before each action, call `ui_status` with a short message (max ~8 words) describing what you're about to do. The user sees this on a floating overlay and it's the ONLY way they know what you're doing. Without it, they just see a generic "working..." message.

Call `ui_status` BEFORE every action tool call. Pattern: `ui_status` → action → `ui_screenshot` → `ui_status` → action → ...

Examples: "Opening Settings", "Looking for Wi-Fi", "Scrolling down", "Typing the password", "Going back", "Checking the result".

Write in the user's language. Keep it natural and specific to the step. Do NOT skip this — the user is watching the overlay.

## Tool priority (prefer higher)
1. `ui_launch_app` — open any app directly by package name or search by label. FASTEST way to open an app.
2. `ui_launch_intent` — fire Android intents (deep links, system settings screens, share, dial, etc.)
3. `ui_click_element` (by text/description/id) — most reliable for on-screen elements
4. `ui_global_action` (back, home, recents, notifications, quick_settings)
5. `ui_batch_actions` — execute multiple actions rapidly in one call (rapid taps, Easter eggs, form fill combos)
6. `ui_find_elements` — discover what's on screen when screenshot is ambiguous
7. `ui_tap` / `ui_swipe` — coordinate-based, use when semantic tools can't target the element
8. `ui_type_text` — type into the focused field (tap the field first)
9. `ui_list_apps` — discover installed apps and their package names
10. `ui_app_intents` — discover what intents/activities an app exports (use before ui_launch_intent)

## Rapid / repeated actions
When you need to tap repeatedly, do fast combos, or perform any sequence that requires speed (e.g., triggering Android Easter eggs, rapid multi-tap, quick navigation sequences), use `ui_batch_actions`. It executes an array of actions with minimal delay and takes a screenshot only AFTER all actions complete. Example:
```json
{"actions": [
  {"action":"tap","x":540,"y":1200},
  {"action":"tap","x":540,"y":1200},
  {"action":"tap","x":540,"y":1200},
  {"action":"tap","x":540,"y":1200},
  {"action":"tap","x":540,"y":1200}
], "delay_ms": 50}
```

## Common patterns
- **Open ANY app (fastest)**: `ui_launch_app` with package name or search. Examples: `{"package": "com.android.settings"}`, `{"search": "Chrome"}`, `{"search": "WhatsApp"}`. ALWAYS try this first before navigating manually.
- **Open Settings (fastest)**: `ui_launch_app` `{"package": "com.android.settings"}` → screenshot. Or for specific settings: `ui_launch_intent` `{"action": "android.settings.WIFI_SETTINGS"}`.
- **Open a URL**: `ui_launch_intent` `{"uri": "https://example.com"}` → screenshot
- **Call a number**: `ui_launch_intent` `{"action": "android.intent.action.DIAL", "uri": "tel:+1234567890"}`
- **Send email**: `ui_launch_intent` `{"action": "android.intent.action.SENDTO", "uri": "mailto:user@example.com"}`
- **Maps search**: `ui_launch_intent` `{"uri": "geo:0,0?q=restaurants+nearby"}`
- **Open Settings (manual fallback)**: `ui_global_action` "quick_settings" → screenshot → tap gear icon → screenshot
- **Open an app (manual fallback)**: global_action "home" → screenshot → swipe up for App Drawer → find & click → screenshot
- **Discover app capabilities**: `ui_list_apps` → find package → `ui_app_intents` → craft `ui_launch_intent`
- **Open notification shade**: `ui_global_action` "notifications" → screenshot
- **Open Quick Settings**: `ui_global_action` "quick_settings" → screenshot. Tiles for Wi-Fi, Bluetooth, flashlight, etc. are here. Gear icon opens full Settings.
- **Search within an app**: screenshot → click the search icon/bar → screenshot → type query → screenshot
- **Navigate back**: `ui_global_action` "back" → screenshot
- **Scroll to find content**: screenshot → `ui_swipe` from center-bottom to center-top → screenshot → repeat if needed
- **Fill a form**: screenshot → tap field → screenshot → `ui_type_text` → screenshot → tap next field → ...
- **Find a specific setting**: Open Settings → use the Settings search bar at the top → type the setting name → screenshot → click result
- **Toggle a Quick Setting** (Wi-Fi, Bluetooth, etc.): `ui_global_action` "quick_settings" → screenshot → tap the tile → screenshot

## When something isn't where you expect it
DO NOT STOP. Work through this checklist autonomously:
1. **Scroll**: swipe up/down at least 3-4 times — most content is below the fold.
2. **Go back and try another path**: `ui_global_action` "back", then try a different menu, tab, or button.
3. **Use search**: almost every app and Settings has a search bar — use it. This is often the fastest path.
4. **Swipe horizontally**: home screens and some apps have multiple pages.
5. **Open App Drawer**: swipe up from bottom center to see all installed apps.
6. **Check folders**: apps are often grouped in folders — tap groups to expand.
7. **Try alternative labels**: elements may use different text, icons, or contentDescription than expected.
8. **Try Quick Settings path**: `ui_global_action` "quick_settings" → gear icon is always a fast path to Settings.
9. **Screenshot and re-read**: sometimes you missed something — look at the screenshot again carefully.

You are an expert. Experts don't give up after one or two tries. Keep going until you reach the objective or have genuinely exhausted every possible approach (minimum 8-10 different attempts).

## Asking the user for help
If you have exhausted ALL approaches above (minimum 8-10 different attempts) and genuinely cannot proceed, OR if you need information only the user knows (passwords, PINs, specific names, addresses, or messages to type), use `ui_ask_user` to show a question on the floating overlay.
- Use `input_type: "buttons"` for multiple-choice questions (e.g., "Which Wi-Fi network?" with network names as options).
- Use `input_type: "text"` when you need free-form input (e.g., "What's the Wi-Fi password?").
- Keep questions short and clear. The overlay is small.
- NEVER use `ui_ask_user` for progress updates or "should I continue?" — just continue autonomously.
- If the user responds with "timeout" or "dismissed", accept it gracefully and try an alternative approach or report what you accomplished so far.

## Important
- Coordinates are in screen pixels. Use `centerX`/`centerY` from `ui_find_elements` results.
- Prefer clicking buttons by their text label or content description over raw coordinates.
- The `run_shell_command` sandbox is Alpine Linux, NOT the Android system. Never use `am`, `input`, `monkey`, or `dumpsys` there — use `ui_*` tools instead.
''');

    return buf.toString();
  }

  static String _getLocalizedExamples(String langCode) {
    switch (langCode) {
      case 'es':
        return 'Search "Ajustes" not "Settings", "Aceptar" not "OK", "Atrás" not "Back", '
            '"Configuración" not "Configuration", "Conexiones" not "Connections", '
            '"Pantalla" not "Display", "Batería" not "Battery", "Almacenamiento" not "Storage", '
            '"Acerca del teléfono" not "About phone", "Cuenta" not "Account".';
      case 'pt':
        return 'Search "Configurações" not "Settings", "Aceitar" not "OK", '
            '"Tela" not "Display", "Bateria" not "Battery", "Sobre o telefone" not "About phone".';
      case 'fr':
        return 'Search "Paramètres" not "Settings", "Accepter" not "OK", '
            '"Affichage" not "Display", "Batterie" not "Battery", "À propos du téléphone" not "About phone".';
      case 'de':
        return 'Search "Einstellungen" not "Settings", "Akzeptieren" not "OK", '
            '"Anzeige" not "Display", "Akku" not "Battery", "Über das Telefon" not "About phone".';
      case 'it':
        return 'Search "Impostazioni" not "Settings", "Accetta" not "OK", '
            '"Display" not "Display", "Batteria" not "Battery", "Info sul telefono" not "About phone".';
      case 'ja':
        return 'Search "設定" not "Settings", "OK" not "OK" (may be same), '
            '"ディスプレイ" not "Display", "バッテリー" not "Battery", "端末情報" not "About phone".';
      case 'ko':
        return 'Search "설정" not "Settings", "확인" not "OK", '
            '"디스플레이" not "Display", "배터리" not "Battery", "휴대전화 정보" not "About phone".';
      case 'zh':
        return 'Search "设置" not "Settings", "确定" not "OK", '
            '"显示" not "Display", "电池" not "Battery", "关于手机" not "About phone".';
      case 'ru':
        return 'Search "Настройки" not "Settings", "ОК"/"Принять" not "OK", '
            '"Экран" not "Display", "Батарея" not "Battery", "О телефоне" not "About phone".';
      case 'ar':
        return 'Search "الإعدادات" not "Settings", "موافق" not "OK", '
            '"الشاشة" not "Display", "البطارية" not "Battery", "حول الهاتف" not "About phone".';
      default:
        return 'All UI labels are in the device language — never search for English text '
            'unless you have confirmed on screen that elements actually use English.';
    }
  }

  /// Non-streaming: process a message and return the final response.
  Future<AgentResponse> processMessage(
    String sessionKey,
    String message, {
    String channelType = 'webchat',
    String chatId = 'default',
    List<Map<String, dynamic>>? contentBlocks,
    Map<String, dynamic>? channelContext,
  }) async {
    await hookRunner?.runLifecycle(HookEvent.sessionStart, sessionKey);
    await sessionManager.getOrCreate(sessionKey, channelType, chatId);
    final session = sessionManager.getSession(sessionKey);
    // Use the agent that owns this session (e.g. Agent B when B is being called)
    final sessionAgent =
        _resolveSessionAgent(sessionKey) ?? configManager.config.activeAgent;
    final systemPrompt = await _buildSystemPrompt(agentId: sessionAgent?.id);

    final userContent = contentBlocks ?? message;
    final shouldPersist = contentBlocks != null || message.trim().isNotEmpty;

    // Persist user message to JSONL (only if not empty or has content blocks)
    if (shouldPersist) {
      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'user', content: userContent),
      );
    }

    var context = sessionManager.getContextMessages(sessionKey);
    final messages = <LlmMessage>[];
    if (systemPrompt.isNotEmpty) {
      messages.add(LlmMessage(role: 'system', content: systemPrompt));
    }
    final ephemeralContext = _buildChannelContextPrompt(channelContext);
    if (ephemeralContext != null) {
      messages.add(LlmMessage(role: 'system', content: ephemeralContext));
    }
    messages.addAll(context);

    if (!messages.any((m) => m.role == 'user' || m.role == 'assistant')) {
      messages.add(const LlmMessage(role: 'user', content: '.'));
    }

    // Use the session's agent settings, fall back to defaults
    final defaults = configManager.config.agents.defaults;
    final modelName =
        session?.modelOverride ?? sessionAgent?.modelName ?? defaults.modelName;
    final temperature = sessionAgent?.temperature ?? defaults.temperature;
    final maxTokens = sessionAgent?.maxTokens ?? defaults.maxTokens;
    final maxToolIterations =
        sessionAgent?.maxToolIterations ?? defaults.maxToolIterations;

    _log.info(
      'AgentLoop: using model=$modelName (sessionAgent=${sessionAgent?.name}, sessionAgent.model=${sessionAgent?.modelName}, defaults.model=${defaults.modelName})',
    );
    _log.info(
      'AgentLoop: available models in config: ${configManager.config.modelList.map((m) => m.modelName).join(", ")}',
    );

    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry == null) {
      _log.severe('Model "$modelName" not found in config');
      return AgentResponse(
        content: 'Error: Model "$modelName" is not configured.',
        sessionKey: sessionKey,
      );
    }

    // Pre-request token validation: check if context approaching limit
    final totalTokens = _estimateContextTokens(context, systemPrompt);
    final contextWindow =
        TokenBudgetManager.getContextWindow(modelName, configManager);
    final safeLimit = TokenBudgetManager.getSafeContextLimit(
      modelName,
      configManager,
    );

    if (totalTokens > safeLimit) {
      _log.warning(
        'Context approaching limit: $totalTokens tokens > $safeLimit threshold '
        '(model: $modelName, limit: $contextWindow)',
      );

      // Option A: Auto-compact if enabled and session is eligible
      if (await _shouldAutoCompact(sessionKey)) {
        _log.info('Auto-compacting session $sessionKey');
        final compacted = await compactSession(sessionKey);
        if (compacted != null) {
          _log.info('Compaction successful: $compacted');
          // Reload context after compaction
          context = sessionManager.getContextMessages(sessionKey);
          // Rebuild messages list with new context
          messages.clear();
          if (systemPrompt.isNotEmpty) {
            messages.add(LlmMessage(role: 'system', content: systemPrompt));
          }
          if (ephemeralContext != null) {
            messages.add(LlmMessage(role: 'system', content: ephemeralContext));
          }
          messages.addAll(context);
        }
      }

      // Option B: If still too large, emergency truncate tool results
      final reestimatedTokens = _estimateContextTokens(context, systemPrompt);
      if (reestimatedTokens > safeLimit) {
        _log.warning(
          'Context still too large after compaction ($reestimatedTokens tokens), '
          'applying emergency truncation',
        );
        _truncateOldestToolResults(context, contextWindow);

        // Rebuild messages with truncated context
        messages.clear();
        if (systemPrompt.isNotEmpty) {
          messages.add(LlmMessage(role: 'system', content: systemPrompt));
        }
        if (ephemeralContext != null) {
          messages.add(LlmMessage(role: 'system', content: ephemeralContext));
        }
        messages.addAll(context);
      }
    }

    final tools = toolRegistry.toProviderDefs();
    var toolCallsExecuted = 0;
    UsageInfo? totalUsage;
    var loopMessages = List<LlmMessage>.from(messages);
    var continuationRound = 0;
    const maxContinuations = 2; // up to 3 rounds × maxToolIterations total
    final provCred = configManager.config.providerCredentials[modelEntry.provider];

    // Resolve thinking/effort settings: keyword detection → session level → model default.
    final sessionMeta = sessionManager.getMeta(sessionKey);
    final turnKeyword = _detectThinkingKeyword(message);
    final thinkingLevel = _resolveThinkingLevel(
      sessionMeta?.thinkingLevel,
      modelEntry,
      turnOverride: turnKeyword,
    );
    final thinking = _buildThinkingParams(thinkingLevel, modelEntry);

    // Look up CatalogModel for cost tracking.
    final catalogModel = ModelCatalog.models
        .where((m) => m.id == modelEntry.model)
        .firstOrNull;

    continuation: while (true) {
      var maxIter = maxToolIterations;

      while (maxIter-- > 0) {
        final request = LlmRequest(
          model: modelEntry.model,
          apiKey: configManager.config.resolveApiKey(modelEntry),
          apiBase: configManager.config.resolveApiBase(modelEntry),
          messages: loopMessages,
          tools: tools.isNotEmpty ? tools : null,
          maxTokens: maxTokens,
          temperature: temperature,
          timeoutSeconds: modelEntry.requestTimeout,
          supportsVision: modelEntry.supportsVision,
          awsSecretKey: provCred?.awsSecretKey,
          awsRegion: provCred?.awsRegion,
          awsAuthMode: provCred?.awsAuthMode,
          thinkingBudget: thinking.thinkingBudget,
          effort: thinking.effort,
        );

        LlmResponse response;
        try {
          response = await providerRouter.chatCompletion(request);
        } catch (e, st) {
          _log.severe('LLM chatCompletion failed', e, st);
          final parsed = parseLlmError(e);
          await sessionManager.addMessage(
            sessionKey,
            LlmMessage(
              role: 'assistant',
              content: parsed.friendlyMessage,
              metadata: {
                'error': true,
                if (parsed.statusCode != null) 'errorStatusCode': parsed.statusCode,
                if (parsed.errorTitle != null) 'errorTitle': parsed.errorTitle,
                if (parsed.ctaUrl != null) 'errorCtaUrl': parsed.ctaUrl,
                if (parsed.ctaLabel != null) 'errorCtaLabel': parsed.ctaLabel,
              },
            ),
          );
          return AgentResponse(
            content: parsed.friendlyMessage,
            toolCallsExecuted: toolCallsExecuted,
            usage: totalUsage,
            sessionKey: sessionKey,
            errorStatusCode: parsed.statusCode,
            errorTitle: parsed.errorTitle,
            errorCtaUrl: parsed.ctaUrl,
            errorCtaLabel: parsed.ctaLabel,
          );
        }

        if (response.usage != null) {
          totalUsage = _mergeUsage(totalUsage, response.usage!);
          final costUsd = catalogModel?.computeCostUsd(
                inputTokens: response.usage!.promptTokens,
                outputTokens: response.usage!.completionTokens,
                cacheReadTokens: response.usage!.cacheReadTokens,
                cacheWriteTokens: response.usage!.cacheWriteTokens,
              ) ??
              0.0;
          await sessionManager.updateTokens(sessionKey, response.usage!,
              costUsd: costUsd);
        }

        if (response.toolCalls != null && response.toolCalls!.isNotEmpty) {
          // Persist assistant message with tool calls
          final assistantMsg = LlmMessage(
            role: 'assistant',
            content: response.content ?? '',
            toolCalls: response.toolCalls,
          );
          await sessionManager.addMessage(sessionKey, assistantMsg);
          loopMessages.add(assistantMsg);

          for (final tc in response.toolCalls!) {
            final args = _parseToolArgs(tc.function.arguments);
            _log.info('Tool start: ${tc.function.name} (onToolStatus=${onToolStatus != null})');
            onToolStatus?.call(tc.function.name, args, isDone: false);
            final result = await toolRegistry.execute(tc.function.name, args);
            onToolStatus?.call(tc.function.name, args, isDone: true);
            toolCallsExecuted++;

            // Persist tool result
            final toolMsg = LlmMessage(
              role: 'tool',
              content: result.content,
              toolCallId: tc.id,
              name: tc.function.name,
            );
            await sessionManager.addMessage(sessionKey, toolMsg);
            loopMessages.add(toolMsg);
          }
          continue;
        }

        // Final assistant response (no tool calls) — task complete
        final content = response.content ?? '';
        await sessionManager.addMessage(
          sessionKey,
          LlmMessage(role: 'assistant', content: content),
        );

        // Auto-title: after the first real user+assistant exchange, generate a
        // short descriptive title for the session so the sessions list is useful.
        final sessionMeta = sessionManager.listSessions()
            .where((s) => s.key == sessionKey)
            .firstOrNull;
        if (sessionMeta != null &&
            sessionMeta.displayName == null &&
            sessionMeta.messageCount <= 4) {
          _autoTitleSession(sessionKey, message, content, modelEntry);
        }

        return AgentResponse(
          content: content,
          toolCallsExecuted: toolCallsExecuted,
          usage: totalUsage,
          sessionKey: sessionKey,
        );
      }

      // Inner loop exhausted. If mid-task and rounds remain, auto-continue
      // by resetting the iteration budget (the transcript carries full context).
      if (loopMessages.isNotEmpty &&
          loopMessages.last.role == 'tool' &&
          continuationRound < maxContinuations) {
        continuationRound++;
        _log.info(
          'AgentLoop: auto-continuing (round $continuationRound/$maxContinuations, '
          '$toolCallsExecuted calls so far)',
        );
        final contMsg = LlmMessage(
          role: 'user',
          content: '[Auto-continuing ($continuationRound/$maxContinuations). Resume the task.]',
        );
        await sessionManager.addMessage(sessionKey, contMsg);
        loopMessages.add(contMsg);
        continue continuation;
      }

      break continuation;
    }

    // All continuation rounds exhausted while still mid-task: make one final
    // call without tools so the agent can summarize and tell the user to continue.
    if (loopMessages.isNotEmpty && loopMessages.last.role == 'tool') {
      final limitMsg = LlmMessage(
        role: 'user',
        content: '[Tool call limit reached after $toolCallsExecuted calls total '
            '(${1 + maxContinuations} rounds). Summarize what you accomplished, '
            'what still needs to be done, and tell the user they can ask you to continue.]',
      );
      await sessionManager.addMessage(sessionKey, limitMsg);
      loopMessages.add(limitMsg);
      try {
        final gracefulReq = LlmRequest(
          model: modelEntry.model,
          apiKey: configManager.config.resolveApiKey(modelEntry),
          apiBase: configManager.config.resolveApiBase(modelEntry),
          messages: loopMessages,
          tools: null,
          maxTokens: maxTokens,
          temperature: temperature,
          timeoutSeconds: modelEntry.requestTimeout,
          supportsVision: modelEntry.supportsVision,
          awsSecretKey: provCred?.awsSecretKey,
          awsRegion: provCred?.awsRegion,
          awsAuthMode: provCred?.awsAuthMode,
        );
        final gracefulResp = await providerRouter.chatCompletion(gracefulReq);
        final gracefulContent = gracefulResp.content ?? '';
        await sessionManager.addMessage(
          sessionKey,
          LlmMessage(role: 'assistant', content: gracefulContent),
        );
        return AgentResponse(
          content: gracefulContent,
          toolCallsExecuted: toolCallsExecuted,
          usage: totalUsage,
          sessionKey: sessionKey,
        );
      } catch (_) {
        // Graceful call failed — fall through to return last known content
      }
    }

    final lastAssistant = loopMessages.lastWhere(
      (m) => m.role == 'assistant',
      orElse: () => const LlmMessage(role: 'assistant', content: ''),
    );
    await hookRunner?.runLifecycle(HookEvent.sessionStop, sessionKey);
    return AgentResponse(
      content: lastAssistant.content is String
          ? lastAssistant.content as String
          : '',
      toolCallsExecuted: toolCallsExecuted,
      usage: totalUsage,
      sessionKey: sessionKey,
    );
  }

  /// Streaming version for real-time UI updates.
  Stream<AgentStreamEvent> processMessageStream(
    String sessionKey,
    String message, {
    String channelType = 'webchat',
    String chatId = 'default',
    List<Map<String, dynamic>>? contentBlocks,
    String? userLanguage,
    Map<String, dynamic>? channelContext,
  }) async* {
    await sessionManager.getOrCreate(sessionKey, channelType, chatId);
    final session = sessionManager.getSession(sessionKey);
    // Use the agent that owns this session so its identity/workspace is loaded
    final sessionAgent =
        _resolveSessionAgent(sessionKey) ?? configManager.config.activeAgent;
    final systemPrompt = await _buildSystemPrompt(
      userLanguage: userLanguage,
      agentId: sessionAgent?.id,
    );

    // Persist user message (only if not empty or has content blocks)
    final userContent = contentBlocks ?? message;
    final shouldPersist = contentBlocks != null || message.trim().isNotEmpty;

    if (shouldPersist) {
      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'user', content: userContent),
      );
    }

    var context = sessionManager.getContextMessages(sessionKey);
    final messages = <LlmMessage>[];
    if (systemPrompt.isNotEmpty) {
      messages.add(LlmMessage(role: 'system', content: systemPrompt));
    }
    final ephemeralContext = _buildChannelContextPrompt(channelContext);
    if (ephemeralContext != null) {
      messages.add(LlmMessage(role: 'system', content: ephemeralContext));
    }

    // Auto-fetch any URLs in the user message and inject as ephemeral context.
    // Only runs for plain-text messages (not multimodal content blocks).
    if (contentBlocks == null && message.trim().isNotEmpty) {
      final webFetch = toolRegistry.get('web_fetch');
      if (webFetch != null) {
        final linkContext = await runLinkUnderstanding(
          message,
          fetchUrl: (url) async {
            final result = await webFetch.execute({'url': url, 'max_chars': 2000});
            return result.isError ? null : result.content;
          },
        );
        if (linkContext != null) {
          messages.add(LlmMessage(
            role: 'system',
            content: '[Link context auto-fetched from message]\n\n$linkContext',
          ));
        }
      }
    }

    messages.addAll(context);

    // Most APIs require at least one user message. When the hatch fires with an
    // empty message and there is no prior context, the list would only contain
    // the system prompt, causing a 400. Add a minimal synthetic user message
    // just for the API call (it is never persisted to the session transcript).
    if (!messages.any((m) => m.role == 'user' || m.role == 'assistant')) {
      messages.add(const LlmMessage(role: 'user', content: '.'));
    }

    // Use the session's agent settings, fall back to defaults
    final defaults = configManager.config.agents.defaults;
    var modelName =
        session?.modelOverride ?? sessionAgent?.modelName ?? defaults.modelName;
    final temperature = sessionAgent?.temperature ?? defaults.temperature;
    final maxTokens = sessionAgent?.maxTokens ?? defaults.maxTokens;
    final maxToolIterations =
        sessionAgent?.maxToolIterations ?? defaults.maxToolIterations;

    // ── Battery-aware model selection ────────────────────────────────────────
    if (batteryService != null) {
      final batteryCtx = await batteryService!.buildRuntimeContext();
      if (batteryCtx != null) {
        messages.add(LlmMessage(role: 'system', content: batteryCtx));
      }
      final level = await batteryService!.getBatteryLevel();
      final charging = await batteryService!.isCharging();
      if (!charging && level <= 10) {
        // Critically low battery: prefer fastest/cheapest available model
        final lowModel = _findLowestCostModel();
        if (lowModel != null && lowModel != modelName) {
          _log.info('Battery critical ($level%): switching from $modelName to $lowModel');
          modelName = lowModel;
        }
      }
    }

    // ── Connectivity / offline fallback ──────────────────────────────────────
    if (connectivityService != null && !connectivityService!.isOnline) {
      final ollamaModel = _findOllamaModel();
      if (ollamaModel != null) {
        _log.info('Offline: falling back to local model $ollamaModel');
        modelName = ollamaModel;
      } else {
        yield AgentStreamEvent(
          isDone: true,
          finalResponse: AgentResponse(
            content: 'No internet connection and no local model configured. '
                'Connect to the internet or set up Ollama in Settings → Providers.',
            sessionKey: sessionKey,
          ),
        );
        return;
      }
    }

    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry == null) {
      yield AgentStreamEvent(
        isDone: true,
        finalResponse: AgentResponse(
          content: 'Error: Model "$modelName" is not configured.',
          sessionKey: sessionKey,
        ),
      );
      return;
    }

    // Pre-request token validation: check if context approaching limit
    final totalTokens = _estimateContextTokens(context, systemPrompt);
    final contextWindow =
        TokenBudgetManager.getContextWindow(modelName, configManager);
    final safeLimit = TokenBudgetManager.getSafeContextLimit(
      modelName,
      configManager,
    );

    if (totalTokens > safeLimit) {
      _log.warning(
        'Context approaching limit: $totalTokens tokens > $safeLimit threshold '
        '(model: $modelName, limit: $contextWindow)',
      );

      // Option A: Auto-compact if enabled and session is eligible
      if (await _shouldAutoCompact(sessionKey)) {
        _log.info('Auto-compacting session $sessionKey');
        final compacted = await compactSession(sessionKey);
        if (compacted != null) {
          _log.info('Compaction successful: $compacted');
          // Reload context after compaction
          context = sessionManager.getContextMessages(sessionKey);
          // Rebuild messages list with new context
          messages.clear();
          if (systemPrompt.isNotEmpty) {
            messages.add(LlmMessage(role: 'system', content: systemPrompt));
          }
          if (ephemeralContext != null) {
            messages.add(LlmMessage(role: 'system', content: ephemeralContext));
          }
          messages.addAll(context);
        }
      }

      // Option B: If still too large, emergency truncate tool results
      final reestimatedTokens = _estimateContextTokens(context, systemPrompt);
      if (reestimatedTokens > safeLimit) {
        _log.warning(
          'Context still too large after compaction ($reestimatedTokens tokens), '
          'applying emergency truncation',
        );
        _truncateOldestToolResults(context, contextWindow);

        // Rebuild messages with truncated context
        messages.clear();
        if (systemPrompt.isNotEmpty) {
          messages.add(LlmMessage(role: 'system', content: systemPrompt));
        }
        if (ephemeralContext != null) {
          messages.add(LlmMessage(role: 'system', content: ephemeralContext));
        }
        messages.addAll(context);
      }
    }

    final tools = toolRegistry.toProviderDefs();
    var toolCallsExecuted = 0;
    UsageInfo? totalUsage;
    var loopMessages = List<LlmMessage>.from(messages);
    var contentBuffer = '';
    var continuationRound = 0;
    const maxContinuations = 2; // up to 3 rounds × maxToolIterations total
    final provCredStream = configManager.config.providerCredentials[modelEntry.provider];

    // Resolve thinking/effort settings: keyword detection → session level → model default.
    final sessionMetaStream = sessionManager.getMeta(sessionKey);
    final turnKeywordStream = _detectThinkingKeyword(message);
    final thinkingLevelStream = _resolveThinkingLevel(
      sessionMetaStream?.thinkingLevel,
      modelEntry,
      turnOverride: turnKeywordStream,
    );
    final thinkingStream = _buildThinkingParams(thinkingLevelStream, modelEntry);

    // Look up CatalogModel for cost tracking.
    final catalogModelStream = ModelCatalog.models
        .where((m) => m.id == modelEntry.model)
        .firstOrNull;

    continuation: while (true) {
      var maxIter = maxToolIterations;

      while (maxIter-- > 0) {
        contentBuffer = '';
        final request = LlmRequest(
          model: modelEntry.model,
          apiKey: configManager.config.resolveApiKey(modelEntry),
          apiBase: configManager.config.resolveApiBase(modelEntry),
          messages: loopMessages,
          tools: tools.isNotEmpty ? tools : null,
          maxTokens: maxTokens,
          temperature: temperature,
          timeoutSeconds: modelEntry.requestTimeout,
          supportsVision: modelEntry.supportsVision,
          awsSecretKey: provCredStream?.awsSecretKey,
          awsRegion: provCredStream?.awsRegion,
          awsAuthMode: provCredStream?.awsAuthMode,
          thinkingBudget: thinkingStream.thinkingBudget,
          effort: thinkingStream.effort,
        );

        final toolCallsBuffer = <ToolCall>[];

        try {
          await for (final event in providerRouter.chatCompletionStream(
            request,
          )) {
            if (event.contentDelta != null) {
              contentBuffer += event.contentDelta!;
              yield AgentStreamEvent(textDelta: event.contentDelta);
            }
            if (event.toolCallDelta != null) {
              toolCallsBuffer.add(event.toolCallDelta!);
            }
            if (event.usage != null) {
              totalUsage = _mergeUsage(totalUsage, event.usage!);
            }
          }
        } catch (e, st) {
          _log.severe(
            'LLM stream failed: sessionKey=$sessionKey modelName=$modelName '
            'entry.model=${modelEntry.model} provider=${modelEntry.provider} '
            'apiBase=${request.apiBase} messages=${request.messages.length} '
            'tools=${request.tools?.length ?? 0}',
            e,
            st,
          );
          final parsed = parseLlmError(e);
          await sessionManager.addMessage(
            sessionKey,
            LlmMessage(
              role: 'assistant',
              content: parsed.friendlyMessage,
              metadata: {
                'error': true,
                if (parsed.statusCode != null) 'errorStatusCode': parsed.statusCode,
                if (parsed.errorTitle != null) 'errorTitle': parsed.errorTitle,
                if (parsed.ctaUrl != null) 'errorCtaUrl': parsed.ctaUrl,
                if (parsed.ctaLabel != null) 'errorCtaLabel': parsed.ctaLabel,
              },
            ),
          );
          yield AgentStreamEvent(
            isDone: true,
            finalResponse: AgentResponse(
              content: parsed.friendlyMessage,
              toolCallsExecuted: toolCallsExecuted,
              usage: totalUsage,
              sessionKey: sessionKey,
              errorStatusCode: parsed.statusCode,
              errorTitle: parsed.errorTitle,
              errorCtaUrl: parsed.ctaUrl,
              errorCtaLabel: parsed.ctaLabel,
            ),
          );
          return;
        }

        if (totalUsage != null) {
          final costUsd = catalogModelStream?.computeCostUsd(
                inputTokens: totalUsage.promptTokens,
                outputTokens: totalUsage.completionTokens,
                cacheReadTokens: totalUsage.cacheReadTokens,
                cacheWriteTokens: totalUsage.cacheWriteTokens,
              ) ??
              0.0;
          await sessionManager.updateTokens(sessionKey, totalUsage,
              costUsd: costUsd);
        }

        if (toolCallsBuffer.isNotEmpty) {
          // Persist assistant message with tool calls
          final assistantMsg = LlmMessage(
            role: 'assistant',
            content: contentBuffer,
            toolCalls: toolCallsBuffer,
          );
          await sessionManager.addMessage(sessionKey, assistantMsg);
          loopMessages.add(assistantMsg);

          for (final tc in toolCallsBuffer) {
            final args = _parseToolArgs(tc.function.arguments);
            onToolStatus?.call(tc.function.name, args, isDone: false);
            yield AgentStreamEvent(toolName: tc.function.name, toolArgs: args);

            // Use streaming execution when the tool supports it so incremental
            // output is shown in the expandable tool card as it arrives.
            final StreamController<AgentStreamEvent> chunkCtrl =
                StreamController<AgentStreamEvent>();
            final chunkFuture = Stream.fromFuture(
              toolRegistry.executeWithProgress(
                tc.function.name,
                args,
                onChunk: (chunk) => chunkCtrl.add(
                  AgentStreamEvent(toolResultChunk: chunk),
                ),
              ),
            ).first.then((result) {
              chunkCtrl.close();
              return result;
            });

            await for (final chunkEvent in chunkCtrl.stream) {
              yield chunkEvent;
            }
            final result = await chunkFuture;
            onToolStatus?.call(tc.function.name, args, isDone: true);
            toolCallsExecuted++;
            yield AgentStreamEvent(
              toolResult: result.content,
              toolDetails: result.details,
            );

            // Persist tool result
            final toolMsg = LlmMessage(
              role: 'tool',
              content: result.content,
              toolCallId: tc.id,
              name: tc.function.name,
            );
            await sessionManager.addMessage(sessionKey, toolMsg);
            loopMessages.add(toolMsg);
          }
          continue;
        }

        // Final assistant response (no tool calls) — task complete
        await sessionManager.addMessage(
          sessionKey,
          LlmMessage(role: 'assistant', content: contentBuffer),
        );

        // Auto-title: mirror the non-streaming path trigger
        final streamSessionMeta = sessionManager.listSessions()
            .where((s) => s.key == sessionKey)
            .firstOrNull;
        if (streamSessionMeta != null &&
            streamSessionMeta.displayName == null &&
            streamSessionMeta.messageCount <= 4) {
          _autoTitleSession(sessionKey, message, contentBuffer, modelEntry);
        }

        yield AgentStreamEvent(
          isDone: true,
          finalResponse: AgentResponse(
            content: contentBuffer,
            toolCallsExecuted: toolCallsExecuted,
            usage: totalUsage,
            sessionKey: sessionKey,
            modelUsed: modelName,
          ),
        );
        return;
      }

      // Inner loop exhausted. If mid-task and rounds remain, auto-continue
      // by resetting the iteration budget (the transcript carries full context).
      if (loopMessages.isNotEmpty &&
          loopMessages.last.role == 'tool' &&
          continuationRound < maxContinuations) {
        continuationRound++;
        _log.info(
          'AgentLoop: auto-continuing (round $continuationRound/$maxContinuations, '
          '$toolCallsExecuted calls so far)',
        );
        final contMsg = LlmMessage(
          role: 'user',
          content: '[Auto-continuing ($continuationRound/$maxContinuations). Resume the task.]',
        );
        await sessionManager.addMessage(sessionKey, contMsg);
        loopMessages.add(contMsg);
        continue continuation;
      }

      break continuation;
    }

    // All continuation rounds exhausted while still mid-task: stream one final
    // call without tools so the agent can summarize and tell the user to continue.
    if (loopMessages.isNotEmpty && loopMessages.last.role == 'tool') {
      final limitMsg = LlmMessage(
        role: 'user',
        content: '[Tool call limit reached after $toolCallsExecuted calls total '
            '(${1 + maxContinuations} rounds). Summarize what you accomplished, '
            'what still needs to be done, and tell the user they can ask you to continue.]',
      );
      await sessionManager.addMessage(sessionKey, limitMsg);
      loopMessages.add(limitMsg);
      try {
        final gracefulReq = LlmRequest(
          model: modelEntry.model,
          apiKey: configManager.config.resolveApiKey(modelEntry),
          apiBase: configManager.config.resolveApiBase(modelEntry),
          messages: loopMessages,
          tools: null,
          maxTokens: maxTokens,
          temperature: temperature,
          timeoutSeconds: modelEntry.requestTimeout,
          supportsVision: modelEntry.supportsVision,
          awsSecretKey: provCredStream?.awsSecretKey,
          awsRegion: provCredStream?.awsRegion,
          awsAuthMode: provCredStream?.awsAuthMode,
        );
        contentBuffer = '';
        await for (final event in providerRouter.chatCompletionStream(gracefulReq)) {
          if (event.contentDelta != null) {
            contentBuffer += event.contentDelta!;
            yield AgentStreamEvent(textDelta: event.contentDelta);
          }
        }
        await sessionManager.addMessage(
          sessionKey,
          LlmMessage(role: 'assistant', content: contentBuffer),
        );
      } catch (_) {
        // Graceful stream failed — fall through to emit isDone with last buffer
      }
    }

    yield AgentStreamEvent(
      isDone: true,
      finalResponse: AgentResponse(
        content: contentBuffer,
        toolCallsExecuted: toolCallsExecuted,
        usage: totalUsage,
        sessionKey: sessionKey,
        modelUsed: modelName,
      ),
    );
  }

  String? _buildChannelContextPrompt(Map<String, dynamic>? channelContext) {
    if (channelContext == null || channelContext.isEmpty) return null;

    final lines = <String>['# Ephemeral Channel Context'];
    final channel = channelContext['channel']?.toString();
    final chatId = channelContext['chat_id']?.toString();
    final messageId = channelContext['message_id']?.toString();
    final participantId = channelContext['participant_id']?.toString();

    if (channel != null && channel.isNotEmpty) {
      lines.add('- channel: $channel');
    }
    if (chatId != null && chatId.isNotEmpty) {
      lines.add('- chat_id: $chatId');
    }
    if (messageId != null && messageId.isNotEmpty) {
      lines.add('- message_id: $messageId');
    }
    if (participantId != null && participantId.isNotEmpty) {
      lines.add('- participant_id: $participantId');
    }

    for (final entry in channelContext.entries) {
      if (entry.key == 'channel' ||
          entry.key == 'chat_id' ||
          entry.key == 'message_id' ||
          entry.key == 'participant_id') {
        continue;
      }
      final value = entry.value?.toString();
      if (value == null || value.isEmpty) continue;
      lines.add('- ${entry.key}: $value');
    }

    lines.add(
      '- This metadata is for the current turn only. Use it when a tool needs channel-specific IDs such as WhatsApp reactions.',
    );
    return lines.join('\n');
  }

  // Per-session compaction failure counters (resets on success).
  // Used by the compaction safeguard to disable auto-compact after
  // repeated failures so a broken session doesn't loop forever.
  final Map<String, int> _compactionFailures = {};
  static const _kMaxCompactionFailures = 3;

  /// Summarize old messages and compact the session.
  ///
  /// [customInstructions] can be provided by the user via `/compact <text>`
  /// to guide what the summary should focus on.
  Future<String?> compactSession(
    String sessionKey, {
    String? customInstructions,
  }) async {
    // -- Compaction safeguard -------------------------------------------------
    // If this session has failed compaction _kMaxCompactionFailures times in
    // a row, disable auto-compact to prevent infinite retry loops.
    final failures = _compactionFailures[sessionKey] ?? 0;
    if (failures >= _kMaxCompactionFailures) {
      _log.warning(
        'Compaction safeguard: $sessionKey has failed $failures times, '
        'skipping auto-compact',
      );
      return null;
    }

    final session = sessionManager.getSession(sessionKey);
    if (session == null) return null;

    final context = sessionManager.getContextMessages(sessionKey);
    if (context.length < 10) return null;

    final defaults = configManager.config.agents.defaults;
    final modelName = session.modelOverride ?? defaults.modelName;
    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry == null) return null;

    // -- Memory flush (pre-compaction) ----------------------------------------
    // Before discarding old messages, run a silent agentic turn that gives the
    // model a chance to persist any important facts via memory_write.  This
    // mirrors OpenClaw's `compaction.memoryFlush` behavior and prevents
    // valuable context (user preferences, decisions, URLs, etc.) from being
    // silently lost when old messages are summarized away.
    if (defaults.memoryFlushEnabled) {
      await _runMemoryFlush(sessionKey, context, modelEntry);
    }

    // Keep the last ~6 messages, summarize everything before.
    // Adjust the boundary so we never split a tool-call group: if the first
    // kept message is a tool result, walk backwards to include its parent
    // assistant message (with tool_calls) so the pair stays intact.
    var keepRecent = 6;
    while (keepRecent < context.length) {
      final firstKeptIdx = context.length - keepRecent;
      final firstKept = context[firstKeptIdx];
      if (firstKept.role == 'tool' ||
          (firstKept.role == 'assistant' &&
              firstKept.toolCalls != null &&
              firstKept.toolCalls!.isNotEmpty)) {
        keepRecent++;
      } else {
        break;
      }
    }
    // Re-read context: the memory flush (PR #18) may have appended messages.
    final freshContext = sessionManager.getContextMessages(sessionKey);
    final toSummarize = freshContext.sublist(0, freshContext.length - keepRecent);

    if (toSummarize.isEmpty) return null;

    // -- Real conversation filtering ------------------------------------------
    // Remove noise before summarizing: pure system injections, empty messages,
    // and failed/empty tool results that add no informational value.
    // This produces tighter, more useful summaries and saves tokens.
    final realConversation = _filterRealConversation(toSummarize);
    if (realConversation.isEmpty) return null;

    // Build the summary prompt, incorporating any custom instructions
    final systemInstruction = StringBuffer(
      'Summarize the following conversation in 2-3 concise paragraphs. '
      'Preserve key facts, decisions, user preferences, and tool results. '
      'Do not include greetings or filler.',
    );
    if (customInstructions != null && customInstructions.trim().isNotEmpty) {
      systemInstruction.write('\n\nAdditional instructions: $customInstructions');
    }

    final summaryMessages = <LlmMessage>[
      LlmMessage(role: 'system', content: systemInstruction.toString()),
      ...realConversation,
      const LlmMessage(
        role: 'user',
        content: 'Summarize the conversation above.',
      ),
    ];

    try {
      final summCred =
          configManager.config.providerCredentials[modelEntry.provider];
      final request = LlmRequest(
        model: modelEntry.model,
        apiKey: configManager.config.resolveApiKey(modelEntry),
        apiBase: configManager.config.resolveApiBase(modelEntry),
        messages: summaryMessages,
        maxTokens: 1024,
        temperature: 0.3,
        timeoutSeconds: modelEntry.requestTimeout,
        supportsVision: modelEntry.supportsVision,
        awsSecretKey: summCred?.awsSecretKey,
        awsRegion: summCred?.awsRegion,
        awsAuthMode: summCred?.awsAuthMode,
      );

      final response = await providerRouter.chatCompletion(request);
      final summary = response.content ?? '';

      if (summary.isEmpty) {
        _compactionFailures[sessionKey] = failures + 1;
        return null;
      }

      // Find the entry ID of the first kept message from the transcript
      final transcript = await sessionManager.loadTranscript(sessionKey);
      final messageEntries = transcript
          .where((e) => e.type == 'message')
          .toList();
      final keptStartIndex = messageEntries.length - keepRecent;
      final firstKeptId =
          keptStartIndex >= 0 && keptStartIndex < messageEntries.length
              ? messageEntries[keptStartIndex].id
              : messageEntries.last.id;

      final tokensBefore = toSummarize.fold<int>(
        0,
        (sum, m) => sum + ((m.content?.toString().length ?? 0) ~/ 4),
      );

      await sessionManager.addCompaction(
        sessionKey,
        summary: summary,
        firstKeptEntryId: firstKeptId,
        tokensBefore: tokensBefore,
      );

      // Success — reset failure counter
      _compactionFailures.remove(sessionKey);
      _log.info(
        'Compacted session $sessionKey: summarized ${toSummarize.length} msgs '
        '(${realConversation.length} real msgs after filtering)',
      );
      return summary;
    } catch (e) {
      _compactionFailures[sessionKey] = failures + 1;
      _log.warning('Compaction failed for $sessionKey (attempt ${failures + 1}): $e');
      return null;
    }
  }

  // -- Auto-title -----------------------------------------------------------

  /// Generates a short descriptive title for a new session after the first
  /// user+assistant exchange and saves it via [SessionManager.renameSession].
  ///
  /// Runs fire-and-forget (not awaited by the caller) so it never blocks the
  /// chat response. Failures are silently ignored.
  void _autoTitleSession(
    String sessionKey,
    String userMessage,
    String assistantReply,
    dynamic modelEntry,
  ) {
    Future(() async {
      try {
        final cred = configManager.config.providerCredentials[
            modelEntry.provider as String?];
        final request = LlmRequest(
          model: modelEntry.model as String,
          apiKey: configManager.config.resolveApiKey(modelEntry),
          apiBase: configManager.config.resolveApiBase(modelEntry),
          messages: [
            const LlmMessage(
              role: 'system',
              content:
                  'Generate a short session title (3-6 words max) that describes '
                  'what this conversation is about. Reply with ONLY the title, '
                  'no punctuation, no quotes.',
            ),
            LlmMessage(
              role: 'user',
              content: 'User: ${userMessage.substring(0, userMessage.length.clamp(0, 300))}\n'
                  'Assistant: ${assistantReply.substring(0, assistantReply.length.clamp(0, 200))}',
            ),
            const LlmMessage(
              role: 'user',
              content: 'Session title:',
            ),
          ],
          maxTokens: 20,
          temperature: 0.3,
          timeoutSeconds: (modelEntry.requestTimeout as int?) ?? 30,
          supportsVision: false,
          awsSecretKey: cred?.awsSecretKey,
          awsRegion: cred?.awsRegion,
          awsAuthMode: cred?.awsAuthMode,
        );

        final response = await providerRouter.chatCompletion(request);
        final rawTitle = response.content?.trim() ?? '';
        if (rawTitle.isEmpty) return;

        final title = rawTitle
            .replaceAll('"', '')
            .replaceAll("'", '')
            .trim();
        if (title.isNotEmpty && title.length <= 80) {
          await sessionManager.renameSession(sessionKey, title);
          _log.info('Auto-titled session $sessionKey: "$title"');
        }
      } catch (e) {
        _log.fine('Auto-title failed for $sessionKey: $e');
      }
    });
  }

  /// Filters a message list down to "real conversation" — removing noise
  /// that adds no informational value to a summary:
  ///   • System injections (role == 'system')
  ///   • Empty or whitespace-only messages
  ///   • Tool results that are empty, error-only, or just truncation markers
  List<LlmMessage> _filterRealConversation(List<LlmMessage> messages) {
    return messages.where((m) {
      if (m.role == 'system') return false;

      final content = m.content;
      final text = content is String ? content : content?.toString() ?? '';

      if (text.trim().isEmpty) return false;

      if (m.role == 'tool' && text.contains('[... TOOL RESULT TRUNCATED')) {
        final withoutMarker = text.replaceAll(
          RegExp(r'\[\.{3} TOOL RESULT TRUNCATED.*?\]', dotAll: true),
          '',
        );
        return withoutMarker.trim().length > 50;
      }

      return true;
    }).toList();
  }

  /// Silent agentic turn that runs before compaction to let the model persist
  /// important information to memory before old messages are summarized away.
  Future<void> _runMemoryFlush(
    String sessionKey,
    List<LlmMessage> context,
    dynamic modelEntry,
  ) async {
    _log.info('Memory flush: checking for important facts before compaction');
    try {
      final agentProfile = _resolveSessionAgent(sessionKey);
      final workspacePath = agentProfile != null
          ? await configManager.getAgentWorkspace(agentProfile.id)
          : await configManager.workspacePath;

      final memoryTool = toolRegistry.get('memory_write');
      final flushTools = memoryTool != null
          ? [
              {
                'type': 'function',
                'function': {
                  'name': memoryTool.name,
                  'description': memoryTool.description,
                  'parameters': memoryTool.parameters,
                },
              }
            ]
          : <Map<String, dynamic>>[];

      final flushSystemPrompt =
          'You are performing a memory consolidation pass before this '
          'conversation is compacted. Your ONLY task is to identify and save '
          'any important information that is NOT already in MEMORY.md or '
          "today's episodic log. Use memory_write for each fact worth keeping."
          '\n\nWorkspace: $workspacePath\n\n'
          'If there is nothing new to save, respond with "Nothing to save." '
          'and do NOT call any tools.';

      final flushMessages = <LlmMessage>[
        LlmMessage(role: 'system', content: flushSystemPrompt),
        ...context,
        const LlmMessage(
          role: 'user',
          content:
              'Review the conversation above. Save any important facts, '
              'decisions, user preferences, or task context that should be '
              'remembered long-term but are not already in memory. '
              'Then reply with a brief confirmation.',
        ),
      ];

      final flushCred = configManager.config.providerCredentials[modelEntry.provider as String?];
      final request = LlmRequest(
        model: modelEntry.model as String,
        apiKey: configManager.config.resolveApiKey(modelEntry),
        apiBase: configManager.config.resolveApiBase(modelEntry),
        messages: flushMessages,
        tools: flushTools.isNotEmpty ? flushTools : null,
        maxTokens: 512,
        temperature: 0.1,
        timeoutSeconds: modelEntry.requestTimeout as int?,
        supportsVision: false,
        awsSecretKey: flushCred?.awsSecretKey,
        awsRegion: flushCred?.awsRegion,
        awsAuthMode: flushCred?.awsAuthMode,
      );

      final response = await providerRouter.chatCompletion(request);

      if (response.toolCalls != null) {
        for (final tc in response.toolCalls!) {
          if (tc.function.name == 'memory_write') {
            try {
              final args = _parseToolArgs(tc.function.arguments);
              await toolRegistry.execute('memory_write', args);
              _log.info('Memory flush: wrote entry via memory_write');
            } catch (e) {
              _log.warning('Memory flush: memory_write failed: $e');
            }
          }
        }
      }

      _log.info('Memory flush complete for $sessionKey');
    } catch (e) {
      _log.warning('Memory flush failed (continuing with compaction): $e');
    }
  }

  // -- Session agent resolution ---------------------------------------------

  /// Resolves which [AgentProfile] "owns" a given session key.
  ///
  /// Format rules:
  ///   `webchat:<agentId>`                  → agent with that ID
  ///   `agent:<agentId>:<runId>`            → agent with that ID (async inter-agent)
  ///   `subagent:webchat:<agentId>:<runId>` → agent with that ID (inherited from parent)
  ///
  /// Returns null if no matching agent is found (falls back to active agent).
  AgentProfile? _resolveSessionAgent(String sessionKey) {
    final parts = sessionKey.split(':');
    String? agentId;
    if (parts.length >= 2 && parts[0] == 'webchat') {
      agentId = parts[1];
    } else if (parts.length >= 3 && parts[0] == 'agent') {
      // 'agent:<agentId>:<shortId>' — spawned via sessions_spawn(agent_id:...) or agent_send async
      agentId = parts[1];
    } else if (parts.length >= 4 &&
        parts[0] == 'subagent' &&
        parts[1] == 'webchat') {
      agentId = parts[2];
    }
    if (agentId == null || agentId.isEmpty) return null;
    return configManager.config.agentProfiles
        .where((a) => a.id == agentId)
        .firstOrNull;
  }

  // -- Public helpers -------------------------------------------------------

  /// Returns a minimal system prompt suitable for `/btw` ephemeral queries.
  ///
  /// Includes the agent's runtime context and identity (IDENTITY.md, SOUL.md,
  /// USER.md) but skips the full workspace file set and episodic memory so
  /// the call is fast and cheap.  No history is attached — the caller provides
  /// only the user question.
  Future<String> buildBtwSystemPrompt(String sessionKey) async {
    final agentProfile = _resolveSessionAgent(sessionKey);
    final agentId = agentProfile?.id;

    String workspace;
    try {
      workspace = agentId != null
          ? await configManager.getAgentWorkspace(agentId)
          : await configManager.workspacePath;
    } catch (_) {
      workspace = await configManager.workspacePath;
    }

    final now = DateTime.now();
    final tz = now.timeZoneName;
    final buf = StringBuffer();

    buf.writeln('# Runtime');
    buf.writeln('- Platform: ${Platform.operatingSystem}');
    buf.writeln('- Current date/time: ${now.toIso8601String()} ($tz)');
    buf.writeln('- Workspace: $workspace');
    buf.writeln('- Engine: FlutterClaw (btw/side-channel mode)');
    buf.writeln();
    buf.writeln('You are answering a quick side question. Be concise.');

    // Include identity/soul if available — gives the answer the right persona
    for (final name in ['IDENTITY.md', 'SOUL.md', 'USER.md']) {
      final content = await _readFile('$workspace/$name');
      if (content != null && content.trim().isNotEmpty) {
        buf.writeln('\n## $name\n${content.trim()}');
      }
    }

    return buf.toString();
  }

  // -- System prompt --------------------------------------------------------

  Future<String> _buildSystemPrompt({
    String? userLanguage,
    String? agentId,
  }) async {
    String workspace;
    if (agentId != null) {
      try {
        workspace = await configManager.getAgentWorkspace(agentId);
      } catch (_) {
        workspace = await configManager.workspacePath;
      }
    } else {
      workspace = await configManager.workspacePath;
    }
    final sections = <String>[];

    final now = DateTime.now();
    final tz = now.timeZoneName;

    final runtimeSection = StringBuffer('# Runtime\n');
    runtimeSection.writeln(
      '- Platform: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}',
    );
    runtimeSection.writeln(
      '- Current date/time: ${now.toIso8601String()} ($tz)',
    );
    runtimeSection.writeln('- Workspace: $workspace');
    runtimeSection.writeln(
      '- Engine: FlutterClaw (OpenClaw-compatible mobile port)',
    );

    if (userLanguage != null && userLanguage.isNotEmpty) {
      runtimeSection.writeln('- User language: $userLanguage');
      runtimeSection.writeln(
        '  IMPORTANT: Respond in ${_getLanguageName(userLanguage)} unless the user explicitly requests another language.',
      );
    }

    runtimeSection.writeln();
    runtimeSection.writeln('# Message Formatting');
    runtimeSection.writeln(
      'Your messages are rendered with full markdown support. Use markdown to enhance readability and structure:',
    );
    runtimeSection.writeln('- **Bold text** for emphasis: `**bold**`');
    runtimeSection.writeln('- *Italic text* for subtle emphasis: `*italic*`');
    runtimeSection.writeln('- Code blocks with syntax highlighting: \\`\\`\\`language\\ncode\\n\\`\\`\\`');
    runtimeSection.writeln('- Inline code: \\`code\\`');
    runtimeSection.writeln('- Lists (ordered and unordered)');
    runtimeSection.writeln('- Headers (# H1, ## H2, ### H3)');
    runtimeSection.writeln('- Links: `[text](url)`');
    runtimeSection.writeln('- Blockquotes: `> quote`');
    runtimeSection.writeln();
    runtimeSection.writeln('## Images and Media');
    runtimeSection.writeln(
      'Display images and GIFs inline using standard markdown image syntax:',
    );
    runtimeSection.writeln(
      '- URL: ![description](https://example.com/image.png)',
    );
    runtimeSection.writeln(
      '- Base64: ![description](data:image/png;base64,iVBOR...)',
    );
    runtimeSection.writeln(
      'Use visual content (diagrams, photos, GIFs, illustrations) whenever it would enhance your response.',
    );

    sections.add(runtimeSection.toString().trim());

    // Android UI automation strategy guidance (includes device-specific tips)
    if (Platform.isAndroid) {
      sections.add(await _buildUiAutomationGuidance());
    }

    // Workspace files in OpenClaw injection order
    final bootstrapFiles = <String, String>{};
    final fileOrder = [
      'memory/MEMORY.md',
      'BOOTSTRAP.md',
      'HEARTBEAT.md',
      'USER.md',
      'IDENTITY.md',
      'TOOLS.md',
      'SOUL.md',
      'AGENTS.md',
    ];

    for (final name in fileOrder) {
      final content = await _readFile('$workspace/$name');
      if (content != null && content.trim().isNotEmpty) {
        bootstrapFiles[name] = content.trim();
      }
    }

    // Inject today's and yesterday's episodic memory
    final today = _dateString(now);
    final yesterday = _dateString(now.subtract(const Duration(days: 1)));
    for (final date in [yesterday, today]) {
      final content = await _readFile('$workspace/memory/$date.md');
      if (content != null && content.trim().isNotEmpty) {
        bootstrapFiles['memory/$date.md'] = content.trim();
      }
    }

    if (bootstrapFiles.isNotEmpty) {
      sections.add('# Project Context\n');
      for (final entry in bootstrapFiles.entries) {
        sections.add('## ${entry.key}\n\n${entry.value}');
      }
    }

    // Inject skills
    if (skillsPromptGetter != null) {
      final skillsPrompt = await skillsPromptGetter!();
      if (skillsPrompt.isNotEmpty) {
        sections.add(skillsPrompt);
      }
    }

    final joined = sections.join('\n\n');

    // Total system prompt cap: 150,000 chars (~110K tokens) matching OpenClaw's
    // agents.defaults.bootstrapTotalMaxChars default. Prevents exceeding model
    // context limits when many large workspace files are present.
    const totalLimit = 150000;
    if (joined.length > totalLimit) {
      return '${joined.substring(0, totalLimit)}\n\n[... system prompt truncated at 150,000 chars ...]';
    }
    return joined;
  }

  String _dateString(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';

  Future<String?> _readFile(String path) async {
    final f = File(path);
    if (await f.exists()) {
      final content = await f.readAsString();
      if (content.length > 20000) {
        return '${content.substring(0, 20000)}\n\n[... truncated at 20,000 chars ...]';
      }
      return content;
    }
    return null;
  }

  Map<String, dynamic> _parseToolArgs(String json) {
    try {
      return jsonDecode(json) as Map<String, dynamic>? ?? {};
    } catch (_) {
      return {};
    }
  }

  UsageInfo _mergeUsage(UsageInfo? a, UsageInfo b) {
    if (a == null) return b;
    return UsageInfo(
      promptTokens: a.promptTokens + b.promptTokens,
      completionTokens: a.completionTokens + b.completionTokens,
      totalTokens: a.totalTokens + b.totalTokens,
    );
  }

  /// Resolves the effective thinking level for a request.
  ///
  /// Priority order:
  /// 1. Turn-level keyword override (think / think harder / ultrathink)
  /// 2. Session-level explicit setting (/think command)
  /// 3. Model default for adaptive-thinking models (uses CatalogModel.defaultEffort)
  /// 4. null → no thinking for non-Anthropic models
  String? _resolveThinkingLevel(
    String? sessionLevel,
    ModelEntry modelEntry, {
    String? turnOverride,
  }) {
    // Turn-level keyword takes highest priority
    if (turnOverride != null) return turnOverride;

    // Session-level explicit ('off' means the user disabled it)
    if (sessionLevel != null) {
      return sessionLevel == 'off' ? null : sessionLevel;
    }

    // For models with adaptive thinking, use the model's default effort level
    final catalog = ModelCatalog.models
        .where((m) => m.id == modelEntry.model)
        .firstOrNull;
    if (catalog != null && catalog.supportsAdaptiveThinking) {
      return catalog.defaultEffort;
    }

    return null;
  }

  /// Detects thinking keyword triggers in a user message.
  ///
  /// Returns a one-turn effort override, or null if no keyword is present.
  /// Mirrors OpenClaw's keyword detection: "think" → medium, "think harder"
  /// / "think more" → high, "ultrathink" → high, "don't think" → off.
  String? _detectThinkingKeyword(String message) {
    final lower = message.toLowerCase();
    // Negative first so "don't think harder" doesn't trigger high
    if (RegExp(r"\bdon'?t\s+think\b").hasMatch(lower) ||
        RegExp(r'\bno\s+thinking\b').hasMatch(lower) ||
        RegExp(r'\bstop\s+thinking\b').hasMatch(lower)) {
      return 'off';
    }
    if (lower.contains('ultrathink') ||
        RegExp(r'\bthink\s+(harder|more|deeply|carefully)\b').hasMatch(lower) ||
        RegExp(r'\bthink\s+a\s+lot\b').hasMatch(lower)) {
      return 'high';
    }
    if (RegExp(r'\bthink\b').hasMatch(lower) ||
        RegExp(r'\breason\s+(through|about)\b').hasMatch(lower)) {
      return 'medium';
    }
    return null;
  }

  /// Builds thinking params for the LlmRequest based on the resolved level
  /// and the model's thinking capabilities.
  ///
  /// For adaptive-thinking models: sets [effort] (Anthropic effort API).
  /// For extended-thinking-only models: sets [thinkingBudget].
  /// For other models: sets [effort] as OpenAI reasoning_effort.
  ({int? thinkingBudget, String? effort}) _buildThinkingParams(
    String? level,
    ModelEntry modelEntry,
  ) {
    if (level == null || level == 'off') {
      return (thinkingBudget: null, effort: null);
    }

    final catalog = ModelCatalog.models
        .where((m) => m.id == modelEntry.model)
        .firstOrNull;

    final isAnthropicProvider = modelEntry.provider == 'anthropic' ||
        modelEntry.provider == 'bedrock';

    if (isAnthropicProvider) {
      if (catalog?.supportsAdaptiveThinking == true) {
        // Use the modern effort API — model decides thinking budget adaptively
        return (thinkingBudget: null, effort: level);
      } else if (catalog?.supportsExtendedThinking == true) {
        // Older extended thinking: explicit budget
        final budget = switch (level) {
          'low' => 1024,
          'medium' => 5000,
          'high' => 16000,
          _ => null,
        };
        return (thinkingBudget: budget, effort: null);
      }
    } else {
      // OpenAI o-series: reasoning_effort
      return (thinkingBudget: null, effort: level);
    }

    return (thinkingBudget: null, effort: null);
  }


  String _getLanguageName(String languageCode) {
    const languageNames = {
      'en': 'English',
      'es': 'Spanish',
      'pt': 'Portuguese',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'zh': 'Chinese',
      'ja': 'Japanese',
      'ko': 'Korean',
      'ru': 'Russian',
      'ar': 'Arabic',
      'hi': 'Hindi',
      'tr': 'Turkish',
      'nl': 'Dutch',
      'pl': 'Polish',
      'th': 'Thai',
      'vi': 'Vietnamese',
      'id': 'Indonesian',
      'uk': 'Ukrainian',
      'cs': 'Czech',
    };
    return languageNames[languageCode] ?? languageCode;
  }

  /// Estimate total tokens in a conversation context.
  int _estimateContextTokens(List<LlmMessage> context, String systemPrompt) {
    var total = TokenBudgetManager.estimateTokens(systemPrompt);
    for (final msg in context) {
      total += TokenBudgetManager.estimateTokens(msg.content ?? '');
    }
    return total;
  }

  /// Check if auto-compaction should trigger.
  ///
  /// Returns false if:
  /// - Auto-compact is disabled in config
  /// - Session not found
  /// - Context too short (< 15 messages)
  /// - Recently compacted (within last 10 messages)
  Future<bool> _shouldAutoCompact(String sessionKey) async {
    // Check if auto-compact is enabled in config
    if (!configManager.config.agents.defaults.autoCompactEnabled) {
      return false;
    }

    // Compaction safeguard: don't auto-compact if repeated failures
    final failures = _compactionFailures[sessionKey] ?? 0;
    if (failures >= _kMaxCompactionFailures) {
      return false;
    }

    final session = sessionManager.getSession(sessionKey);
    if (session == null) return false;

    final context = sessionManager.getContextMessages(sessionKey);
    if (context.length < 15) return false; // Too short to compact

    // Check if last compaction was recent
    final lastCompactEntry =
        await sessionManager.getLastCompactionEntry(sessionKey);
    if (lastCompactEntry != null) {
      // Don't compact if recently compacted (within last 10 messages)
      if (context.length < 20) {
        return false; // Recently compacted, context still small
      }
    }

    return true; // Safe to compact
  }

  /// Truncate oldest tool results in context (emergency measure).
  ///
  /// Walks backwards through context, truncating tool results
  /// until total tokens are under the target (70% of context window).
  ///
  /// Note: Modifies messages in place by creating new LlmMessage objects
  /// since content is final.
  void _truncateOldestToolResults(
    List<LlmMessage> context,
    int contextWindow,
  ) {
    final targetTokens = (contextWindow * 0.70).toInt();
    var currentTokens = context.fold<int>(
      0,
      (sum, msg) =>
          sum + TokenBudgetManager.estimateTokens(msg.content ?? ''),
    );

    _log.warning(
      'Emergency truncation: current=$currentTokens tokens, '
      'target=$targetTokens tokens',
    );

    // Walk backwards, replace tool results until under budget
    for (var i = context.length - 1; i >= 0 && currentTokens > targetTokens;
        i--) {
      final msg = context[i];
      if (msg.role == 'tool' && (msg.content?.length ?? 0) > 5000) {
        final originalTokens =
            TokenBudgetManager.estimateTokens(msg.content ?? '');

        // Create new message with truncated content
        final truncatedContent =
            '[Tool result truncated to fit context budget]\n'
            '${msg.content?.substring(0, 1000) ?? ''}...';

        context[i] = LlmMessage(
          role: msg.role,
          content: truncatedContent,
          name: msg.name,
          toolCallId: msg.toolCallId,
        );

        final newTokens = TokenBudgetManager.estimateTokens(truncatedContent);
        currentTokens -= (originalTokens - newTokens);

        _log.info('Truncated tool result at index $i');
      }
    }

    _log.info('After emergency truncation: $currentTokens tokens');
  }

  // ── Connectivity / Battery helpers ────────────────────────────────────────

  /// Returns the model name of the first configured Ollama model, or null.
  String? _findOllamaModel() {
    for (final m in configManager.config.modelList) {
      if (m.provider == 'ollama' ||
          (m.apiBase?.contains('localhost') ?? false) ||
          (m.apiBase?.contains('11434') ?? false)) {
        return m.modelName;
      }
    }
    return null;
  }

  /// Returns the model name considered "lightest" — prefers free/small models.
  /// Falls back to the first configured model if nothing specific is found.
  String? _findLowestCostModel() {
    final models = configManager.config.modelList;
    if (models.isEmpty) return null;
    // Prefer explicitly free models
    final free = models.where((m) => m.isFree).toList();
    if (free.isNotEmpty) return free.first.modelName;
    // Prefer models with "mini", "haiku", "flash", "small", "nano" in their ID
    final small = models.where((m) {
      final id = m.model.toLowerCase();
      return id.contains('mini') || id.contains('haiku') ||
             id.contains('flash') || id.contains('small') || id.contains('nano');
    }).toList();
    if (small.isNotEmpty) return small.first.modelName;
    return models.first.modelName;
  }
}
