# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FlutterClaw is a standalone AI assistant for iOS and Android — a mobile port of OpenClaw written in Flutter/Dart. It runs entirely on-device with an embedded WebSocket gateway (localhost:18789), multi-provider LLM support, 40+ agent tools, and channel adapters for Telegram, Discord, WhatsApp, Slack, Signal, and in-app WebChat.

## Build & Run Commands

```bash
flutter pub get                          # Install dependencies
flutter run                              # Debug run on connected device
flutter analyze                          # Static analysis (linting)
flutter test                             # Run tests
flutter pub get && flutter analyze && flutter test  # Pre-flight checks
```

### Release Builds

```bash
./scripts/build-release.sh               # Both platforms
./scripts/build-release.sh android       # Android only (APK + AAB)
./scripts/build-release.sh ios           # iOS only (IPA)
./scripts/build-release.sh --bump        # Auto-increment version
```

### Platform-Specific Build Scripts

```bash
./scripts/build-proot.sh                 # Cross-compile PRoot for Android (ARM64, ARMv7, x86_64)
./scripts/build-wamr-ios.sh              # Build WAMR xcframework for iOS
./scripts/build-c2wnet-ios.sh            # Build C2WNet xcframework for iOS
```

### Localization

ARB files are in `lib/l10n/`, template is `app_en.arb`. Generated output goes to `lib/generated/app_localizations.dart`. Flutter regenerates localizations automatically on build. 18+ languages supported.

## Architecture

### Core Layers

```
UI (Flutter widgets + Riverpod)
  ↕
State Management (app_providers.dart — all Riverpod providers)
  ↕
Agent Core (AgentLoop — message processing + tool execution loop)
  ↕
┌────────────────┬──────────────┬────────────────┐
│ LLM Providers  │ Tool Registry│ Channel Router  │
│ (provider_     │ (40+ tools)  │ (Telegram,      │
│  router.dart)  │              │  Discord, etc.) │
└────────────────┴──────────────┴────────────────┘
```

### Key Files

| File | Role |
|------|------|
| `lib/main.dart` | Entry point — Firebase, audio service, foreground task init |
| `lib/app.dart` | Root widget with ProviderScope, Material 3 theming |
| `lib/core/app_providers.dart` | **All Riverpod providers** (~2400 lines). ChatNotifier, service providers, lifecycle providers. This is the central wiring file. |
| `lib/core/agent/agent_loop.dart` | **Core agent loop** (~1950 lines). Orchestrates LLM calls, tool execution, transcript management, and session compaction. |
| `lib/core/agent/session_manager.dart` | JSONL-based transcript persistence with compaction |
| `lib/core/agent/provider_router.dart` | LLM selection with failover, retry, and exponential backoff |
| `lib/data/models/config.dart` | Config model + ConfigManager — agents, models, channels, credentials |
| `lib/tools/registry.dart` | Tool base class, ToolRegistry, ToolResult |

### State Management

All state flows through Riverpod providers defined in `app_providers.dart`:

- **ConfigManager**: Agents, models, channel credentials, tool policies
- **SessionManager**: Multi-session transcript storage (one JSONL per session)
- **ChatNotifier**: UI-facing chat state with streaming support
- **AgentLoop**: Non-streaming (`processMessage`) and streaming (`processMessageStream`) message processing
- **ProviderRouter**: Detects provider type from `apiBase` URL, routes to AnthropicProvider or OpenAiProvider

Circular dependency between ChannelRouter and MessageTool is broken via `_pendingChannelRouterBinder` late binding. SubagentLoopProxy singleton breaks the AgentLoop ↔ subagent circular dep.

### LLM Provider Abstraction

`LlmProvider` interface in `lib/core/providers/provider_interface.dart` defines `chatCompletion()` and `chatCompletionStream()`. Implementations:

- **AnthropicProvider** — `/v1/messages` with SSE streaming
- **OpenAiProvider** — `/chat/completions` (OpenAI, OpenRouter, Groq, DeepSeek, Ollama, etc.)
- **BedrockProvider** — AWS Bedrock with SigV4 auth

Provider detection is automatic from the API base URL.

### Multimodal Content

Internal format uses provider-neutral content blocks in `LlmMessage.content`:
```dart
[
  {'type': 'image', 'data': '<base64>', 'mimeType': 'image/jpeg'},
  {'type': 'text', 'text': '<caption>'},
]
```
Each provider converts to its native format at send time.

### Tool System

Tools extend the `Tool` base class with `name`, `description`, `parameters` (JSON Schema), and `execute()`. Optional `executeStream()` for incremental output. Tools are registered in `toolRegistryProvider`. MCP server tools are dynamically proxied via `McpProxyTool` (name format: `mcp_{serverName}_{toolName}`).

### Channel Architecture

`ChannelAdapter` interface with `start()`, `sendMessage()`, `stop()`. Session key = `{channelType}:{chatId}`. Each channel+chat combo gets an isolated session with its own transcript.

### Sandbox

- **Android**: PRoot + Alpine 3.21 (native ARM64 speed, full internet)
- **iOS**: Dual backend — C2WNet/wazero (preferred, has networking) or WAMR (fallback, no networking). Both run TinyEMU → Alpine 3.21 in WASM. Compile flags: `#if C2WNET_AVAILABLE` / `#elseif WAMR_AVAILABLE`.

## Platform Requirements

- **Dart SDK**: ^3.11.0
- **Android**: minSdk 26 (Android 8.0), Java 17
- **iOS**: 15.0 minimum, Xcode 15+
- **Signing**: Android uses `android/key.properties` (git-ignored); iOS standard provisioning

## Environment

Firebase config loaded from `.env` (git-ignored). See `.env.example` for required variables. API keys stored in platform keychain via Flutter Secure Storage.

## Version

Single source of truth: `pubspec.yaml` `version:` field (format: `MAJOR.MINOR.PATCH+BUILD_NUMBER`). Both Android and iOS read from this.
