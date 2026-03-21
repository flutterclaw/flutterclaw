/// Core agent loop for processing user messages with tool execution.
///
/// Matches OpenClaw's agent loop: system prompt from workspace files,
/// full transcript persistence (including tool calls/results),
/// tool iteration loop, and LLM-powered compaction.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutterclaw/core/agent/provider_router.dart';
import 'package:flutterclaw/core/agent/session_manager.dart';
import 'package:flutterclaw/core/providers/error_parser.dart';
import 'package:flutterclaw/core/providers/provider_interface.dart';
import 'package:flutterclaw/data/models/agent_profile.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/tools/registry.dart';
import 'package:logging/logging.dart';

final _log = Logger('flutterclaw.agent_loop');

class AgentResponse {
  final String content;
  final int toolCallsExecuted;
  final UsageInfo? usage;
  final String sessionKey;
  final int? errorStatusCode;

  const AgentResponse({
    required this.content,
    this.toolCallsExecuted = 0,
    this.usage,
    required this.sessionKey,
    this.errorStatusCode,
  });

  bool get isError => errorStatusCode != null;
}

class AgentStreamEvent {
  final String? textDelta;
  final String? toolName;
  final Map<String, dynamic>? toolArgs;
  final String? toolResult;
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
    this.toolResultChunk,
    this.isDone = false,
    this.finalResponse,
  });
}

class AgentLoop {
  final ConfigManager configManager;
  final ProviderRouter providerRouter;
  final ToolRegistry toolRegistry;
  final SessionManager sessionManager;
  String Function()? skillsPromptGetter;

  AgentLoop({
    required this.configManager,
    required this.providerRouter,
    required this.toolRegistry,
    required this.sessionManager,
    this.skillsPromptGetter,
  });

  /// Non-streaming: process a message and return the final response.
  Future<AgentResponse> processMessage(
    String sessionKey,
    String message, {
    String channelType = 'webchat',
    String chatId = 'default',
    List<Map<String, dynamic>>? contentBlocks,
    Map<String, dynamic>? channelContext,
  }) async {
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

    final context = sessionManager.getContextMessages(sessionKey);
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

    final tools = toolRegistry.toProviderDefs();
    var toolCallsExecuted = 0;
    UsageInfo? totalUsage;
    var loopMessages = List<LlmMessage>.from(messages);
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
            metadata: {'error': true, if (parsed.statusCode != null) 'errorStatusCode': parsed.statusCode},
          ),
        );
        return AgentResponse(
          content: parsed.friendlyMessage,
          toolCallsExecuted: toolCallsExecuted,
          usage: totalUsage,
          sessionKey: sessionKey,
          errorStatusCode: parsed.statusCode,
        );
      }

      if (response.usage != null) {
        totalUsage = _mergeUsage(totalUsage, response.usage!);
        await sessionManager.updateTokens(sessionKey, response.usage!);
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
          final result = await toolRegistry.execute(tc.function.name, args);
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

      // Final assistant response (no tool calls)
      final content = response.content ?? '';
      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'assistant', content: content),
      );

      return AgentResponse(
        content: content,
        toolCallsExecuted: toolCallsExecuted,
        usage: totalUsage,
        sessionKey: sessionKey,
      );
    }

    final lastAssistant = loopMessages.lastWhere(
      (m) => m.role == 'assistant',
      orElse: () => const LlmMessage(role: 'assistant', content: ''),
    );
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

    final context = sessionManager.getContextMessages(sessionKey);
    final messages = <LlmMessage>[];
    if (systemPrompt.isNotEmpty) {
      messages.add(LlmMessage(role: 'system', content: systemPrompt));
    }
    final ephemeralContext = _buildChannelContextPrompt(channelContext);
    if (ephemeralContext != null) {
      messages.add(LlmMessage(role: 'system', content: ephemeralContext));
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
    final modelName =
        session?.modelOverride ?? sessionAgent?.modelName ?? defaults.modelName;
    final temperature = sessionAgent?.temperature ?? defaults.temperature;
    final maxTokens = sessionAgent?.maxTokens ?? defaults.maxTokens;
    final maxToolIterations =
        sessionAgent?.maxToolIterations ?? defaults.maxToolIterations;

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

    final tools = toolRegistry.toProviderDefs();
    var toolCallsExecuted = 0;
    UsageInfo? totalUsage;
    var loopMessages = List<LlmMessage>.from(messages);
    var maxIter = maxToolIterations;
    var contentBuffer = '';

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
        _log.severe('LLM stream failed', e, st);
        final parsed = parseLlmError(e);
        await sessionManager.addMessage(
          sessionKey,
          LlmMessage(
            role: 'assistant',
            content: parsed.friendlyMessage,
            metadata: {'error': true, if (parsed.statusCode != null) 'errorStatusCode': parsed.statusCode},
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
          ),
        );
        return;
      }

      if (totalUsage != null) {
        await sessionManager.updateTokens(sessionKey, totalUsage);
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
          toolCallsExecuted++;
          yield AgentStreamEvent(toolResult: result.content);

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

      // Final assistant response
      await sessionManager.addMessage(
        sessionKey,
        LlmMessage(role: 'assistant', content: contentBuffer),
      );

      yield AgentStreamEvent(
        isDone: true,
        finalResponse: AgentResponse(
          content: contentBuffer,
          toolCallsExecuted: toolCallsExecuted,
          usage: totalUsage,
          sessionKey: sessionKey,
        ),
      );
      return;
    }

    yield AgentStreamEvent(
      isDone: true,
      finalResponse: AgentResponse(
        content: contentBuffer,
        toolCallsExecuted: toolCallsExecuted,
        usage: totalUsage,
        sessionKey: sessionKey,
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

  /// Summarize old messages and compact the session.
  Future<String?> compactSession(String sessionKey) async {
    final session = sessionManager.getSession(sessionKey);
    if (session == null) return null;

    final context = sessionManager.getContextMessages(sessionKey);
    if (context.length < 10) return null;

    // Keep the last ~6 messages, summarize everything before
    const keepRecent = 6;
    final toSummarize = context.sublist(0, context.length - keepRecent);

    if (toSummarize.isEmpty) return null;

    // Build a summary prompt
    final summaryMessages = <LlmMessage>[
      const LlmMessage(
        role: 'system',
        content:
            'Summarize the following conversation in 2-3 concise paragraphs. '
            'Preserve key facts, decisions, user preferences, and tool results. '
            'Do not include greetings or filler.',
      ),
      ...toSummarize,
      const LlmMessage(
        role: 'user',
        content: 'Summarize the conversation above.',
      ),
    ];

    final defaults = configManager.config.agents.defaults;
    final modelName = session.modelOverride ?? defaults.modelName;
    final modelEntry = configManager.config.getModel(modelName);
    if (modelEntry == null) return null;

    try {
      final request = LlmRequest(
        model: modelEntry.model,
        apiKey: configManager.config.resolveApiKey(modelEntry),
        apiBase: configManager.config.resolveApiBase(modelEntry),
        messages: summaryMessages,
        maxTokens: 1024,
        temperature: 0.3,
        timeoutSeconds: modelEntry.requestTimeout,
        supportsVision: modelEntry.supportsVision,
      );

      final response = await providerRouter.chatCompletion(request);
      final summary = response.content ?? '';

      if (summary.isEmpty) return null;

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

      // Estimate tokens summarized
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

      _log.info(
        'Compacted session $sessionKey: summarized ${toSummarize.length} messages',
      );
      return summary;
    } catch (e) {
      _log.warning('Compaction failed for $sessionKey: $e');
      return null;
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
      final skillsPrompt = skillsPromptGetter!();
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
}
