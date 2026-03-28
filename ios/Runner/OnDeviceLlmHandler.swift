/// On-device LLM platform channel bridge.
///
/// iOS 26+ (device only): delegates to Apple Foundation Models.
/// Simulator / older iOS: returns available=false gracefully.
///
/// Channels:
///   MethodChannel  — ai.flutterclaw/on_device_llm
///   EventChannel   — ai.flutterclaw/on_device_llm_stream
import Flutter
import UIKit

// FoundationModels only exists on real devices with iOS 26+.
// The simulator has a stub TBD in the SDK but no runtime binary,
// so we must gate the import on !targetEnvironment(simulator).
#if !targetEnvironment(simulator) && canImport(FoundationModels)
import FoundationModels
#endif

class OnDeviceLlmHandler: NSObject, FlutterStreamHandler {

  private let methodChannel: FlutterMethodChannel
  private var streamTask: Task<Void, Never>?

  init(messenger: FlutterBinaryMessenger) {
    methodChannel = FlutterMethodChannel(
      name: "ai.flutterclaw/on_device_llm",
      binaryMessenger: messenger
    )
    super.init()
    methodChannel.setMethodCallHandler(handle(_:result:))
  }

  // MARK: - MethodChannel

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "check_availability":
      handleCheckAvailability(result: result)
    case "generate":
      guard let args = call.arguments as? [String: Any] else {
        result(FlutterError(code: "INVALID_ARG", message: "Expected Map args", details: nil))
        return
      }
      handleGenerate(args: args, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Availability

  private func handleCheckAvailability(result: @escaping FlutterResult) {
    #if targetEnvironment(simulator)
    result([
      "available": false,
      "platform": "ios",
      "reason": "Apple Foundation Models not available in iOS Simulator. Run on a real device.",
    ] as [String: Any])
    #elseif canImport(FoundationModels)
    if #available(iOS 26.0, *) {
      let model = SystemLanguageModel(useCase: .general)
      let langs = model.supportedLanguages.map { $0.maximalIdentifier }.joined(separator: ", ")
      switch model.availability {
      case .available:
        result([
          "available": true,
          "platform": "ios",
          "model_name": "apple-foundation",
          "context_window": 4096,
          "supports_streaming": true,
          "supports_tool_calling": false,
          "supported_languages": langs,
        ] as [String: Any])
      case .unavailable(let reason):
        let reasonStr: String
        switch reason {
        case .deviceNotEligible:
          reasonStr = "deviceNotEligible — device does not support Apple Intelligence (requires iPhone 15 Pro / iPhone 16+). Supported languages: \(langs)"
        case .appleIntelligenceNotEnabled:
          reasonStr = "appleIntelligenceNotEnabled — toggle is off or language not supported. Device language must match a supported language. Supported: \(langs)"
        case .modelNotReady:
          reasonStr = "modelNotReady — model still downloading. Check Settings → Apple Intelligence & Siri."
        @unknown default:
          reasonStr = "unavailable (unknown reason). Supported languages: \(langs)"
        }
        result([
          "available": false,
          "platform": "ios",
          "reason": reasonStr,
        ] as [String: Any])
      }
    } else {
      result([
        "available": false,
        "platform": "ios",
        "reason": "Requires iOS 26.0 or later.",
      ] as [String: Any])
    }
    #else
    result([
      "available": false,
      "platform": "ios",
      "reason": "FoundationModels framework not present in this build.",
    ] as [String: Any])
    #endif
  }

  // MARK: - Non-streaming generation

  private func handleGenerate(args: [String: Any], result: @escaping FlutterResult) {
    #if targetEnvironment(simulator)
    result(FlutterError(code: "UNAVAILABLE", message: "Not available in simulator.", details: nil))
    #elseif canImport(FoundationModels)
    guard #available(iOS 26.0, *) else {
      result(FlutterError(code: "UNAVAILABLE", message: "Requires iOS 26+.", details: nil))
      return
    }
    let messages  = args["messages"]  as? [[String: Any]] ?? []
    let maxTokens = args["max_tokens"] as? Int    ?? 1024
    let temperature = args["temperature"] as? Double ?? 0.7
    let prompt = buildPrompt(from: messages)

    Task {
      do {
        var options = GenerationOptions()
        options.maximumResponseTokens = maxTokens
        options.temperature = temperature
        let session  = LanguageModelSession()
        let response = try await session.respond(to: prompt, options: options)
        let content  = stripPromptEcho(response.content)
        let ptoks    = estimateTokens(prompt)
        let ctoks    = estimateTokens(content)
        DispatchQueue.main.async {
          result([
            "content": content,
            "finish_reason": "stop",
            "usage": ["prompt_tokens": ptoks, "completion_tokens": ctoks, "total_tokens": ptoks + ctoks],
          ] as [String: Any])
        }
      } catch {
        DispatchQueue.main.async {
          result(FlutterError(code: "GENERATION_FAILED", message: error.localizedDescription, details: nil))
        }
      }
    }
    #else
    result(FlutterError(code: "UNAVAILABLE", message: "FoundationModels not available.", details: nil))
    #endif
  }

  // MARK: - FlutterStreamHandler

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    #if targetEnvironment(simulator)
    events(["type": "error", "message": "Not available in simulator."] as [String: Any])
    events(FlutterEndOfEventStream)
    #elseif canImport(FoundationModels)
    guard #available(iOS 26.0, *) else {
      events(FlutterError(code: "UNAVAILABLE", message: "Requires iOS 26+.", details: nil))
      events(FlutterEndOfEventStream)
      return nil
    }
    guard let args = arguments as? [String: Any] else {
      events(FlutterError(code: "INVALID_ARG", message: "Expected Map args.", details: nil))
      events(FlutterEndOfEventStream)
      return nil
    }
    let messages    = args["messages"]    as? [[String: Any]] ?? []
    let maxTokens   = args["max_tokens"]  as? Int    ?? 1024
    let temperature = args["temperature"] as? Double ?? 0.7
    let prompt      = buildPrompt(from: messages)
    let sink        = events

    streamTask = Task {
      do {
        var options = GenerationOptions()
        options.maximumResponseTokens = maxTokens
        options.temperature = temperature
        let session = LanguageModelSession()
        var previousContent = ""
        for try await snapshot in session.streamResponse(to: prompt, options: options) {
          let accumulated = snapshot.content
          let delta = String(accumulated.dropFirst(previousContent.count))
          previousContent = accumulated
          if !delta.isEmpty {
            DispatchQueue.main.async { sink(["type": "delta", "content": delta] as [String: Any]) }
          }
          if Task.isCancelled { break }
        }
        let ptoks = estimateTokens(prompt)
        let ctoks = estimateTokens(previousContent)
        DispatchQueue.main.async {
          sink(["type": "done", "finish_reason": "stop",
                "usage": ["prompt_tokens": ptoks, "completion_tokens": ctoks, "total_tokens": ptoks + ctoks]] as [String: Any])
          sink(FlutterEndOfEventStream)
        }
      } catch {
        DispatchQueue.main.async {
          sink(["type": "error", "message": error.localizedDescription] as [String: Any])
          sink(FlutterEndOfEventStream)
        }
      }
    }
    #else
    events(["type": "error", "message": "FoundationModels not available."] as [String: Any])
    events(FlutterEndOfEventStream)
    #endif
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    streamTask?.cancel()
    streamTask = nil
    return nil
  }

  // MARK: - Helpers

  /// Converts the messages array into a plain-text prompt.
  /// Uses a compact format optimised for small on-device models (~4K context).
  private func buildPrompt(from messages: [[String: Any]]) -> String {
    var parts: [String] = []
    for msg in messages {
      let role    = msg["role"]    as? String ?? "user"
      let content = msg["content"] as? String ?? ""
      guard !content.isEmpty else { continue }
      switch role {
      case "system":    parts.append("[System]\n\(content)")
      case "user":      parts.append("User: \(content)")
      case "assistant": parts.append("AI: \(content)")
      case "tool":      parts.append("Tool result: \(content)")
      default:          parts.append("\(role): \(content)")
      }
    }
    parts.append("AI:")
    return parts.joined(separator: "\n\n")
  }

  /// Strips echoed prompt content from the model's response.
  /// Some on-device models reproduce the conversation history instead of
  /// generating a new reply — especially when the context window is tight.
  private func stripPromptEcho(_ response: String) -> String {
    var cleaned = response.trimmingCharacters(in: .whitespacesAndNewlines)
    // Remove leading "AI:" prefix the model may echo.
    if cleaned.hasPrefix("AI:") {
      cleaned = String(cleaned.dropFirst(3)).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // Detect full echo: if the response contains multiple role markers
    // (User:/AI:/[System]) it is echoing the conversation.
    let hasMultipleRoles = cleaned.contains("User:") && cleaned.contains("AI:")
    let hasSystemEcho = cleaned.contains("[System]")
    if hasMultipleRoles || hasSystemEcho {
      if let range = cleaned.range(of: "AI:", options: .backwards) {
        cleaned = String(cleaned[range.upperBound...]).trimmingCharacters(in: .whitespacesAndNewlines)
      }
    }
    return cleaned
  }

  private func estimateTokens(_ text: String) -> Int { max(1, text.count / 4) }
}
