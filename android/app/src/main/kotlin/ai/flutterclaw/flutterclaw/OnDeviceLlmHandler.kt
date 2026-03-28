package ai.flutterclaw.flutterclaw

import android.content.Context
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/// On-device LLM platform channel bridge — Android side.
///
/// Delegates to Gemini Nano via the Google AI Edge SDK (AICore).
/// Returns available=false gracefully on unsupported hardware so the Dart
/// layer can fall back to cloud providers.
///
/// Availability: Android 14+ (API 34) with compatible hardware
/// (Pixel 8+, Samsung Galaxy S24+, etc.). minSdk 26 is already satisfied.
///
/// Dependency (build.gradle.kts):
///   implementation("com.google.ai.edge.aicore:aicore:0.0.3-alpha01")
class OnDeviceLlmHandler(private val context: Context) :
    MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

    private val mainHandler = Handler(Looper.getMainLooper())
    private val scope = CoroutineScope(Dispatchers.IO)
    private var streamJob: Job? = null

    // ── MethodChannel ────────────────────────────────────────────────────────

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "check_availability" -> handleCheckAvailability(result)
            "generate" -> handleGenerate(call, result)
            else -> result.notImplemented()
        }
    }

    // ── Availability ─────────────────────────────────────────────────────────

    private fun handleCheckAvailability(result: MethodChannel.Result) {
        scope.launch {
            val info = checkAvailabilityInternal()
            withContext(Dispatchers.Main) { result.success(info) }
        }
    }

    private fun checkAvailabilityInternal(): Map<String, Any> {
        return try {
            val model = createModel(maxOutputTokens = 256, temperature = 0.0f)
            model.close()
            mapOf(
                "available" to true,
                "platform" to "android",
                "model_name" to "gemini-nano",
                "context_window" to 4096,
                "supports_streaming" to true,
                "supports_tool_calling" to false,
            )
        } catch (e: Exception) {
            mapOf(
                "available" to false,
                "platform" to "android",
                "reason" to (e.message ?: "Gemini Nano not available on this device"),
            )
        }
    }

    // ── Non-streaming generation ──────────────────────────────────────────────

    private fun handleGenerate(call: MethodCall, result: MethodChannel.Result) {
        @Suppress("UNCHECKED_CAST")
        val messages = call.argument<List<Map<String, Any>>>("messages") ?: emptyList()
        val maxTokens = call.argument<Int>("max_tokens") ?: 1024
        val temperature = (call.argument<Double>("temperature") ?: 0.7).toFloat()
        val prompt = buildPrompt(messages)

        scope.launch {
            try {
                val model = createModel(maxOutputTokens = maxTokens, temperature = temperature)
                val response = model.generateContent(prompt)
                model.close()
                val content = stripPromptEcho(response.text ?: "")
                val promptTokens = estimateTokens(prompt)
                val completionTokens = estimateTokens(content)
                withContext(Dispatchers.Main) {
                    result.success(mapOf(
                        "content" to content,
                        "finish_reason" to "stop",
                        "usage" to mapOf(
                            "prompt_tokens" to promptTokens,
                            "completion_tokens" to completionTokens,
                            "total_tokens" to promptTokens + completionTokens,
                        ),
                    ))
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    result.error("GENERATION_FAILED", e.message ?: "Generation failed", null)
                }
            }
        }
    }

    // ── EventChannel (streaming) ──────────────────────────────────────────────

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        @Suppress("UNCHECKED_CAST")
        val args = arguments as? Map<String, Any> ?: emptyMap()
        @Suppress("UNCHECKED_CAST")
        val messages = args["messages"] as? List<Map<String, Any>> ?: emptyList()
        val maxTokens = (args["max_tokens"] as? Int) ?: 1024
        val temperature = ((args["temperature"] as? Double) ?: 0.7).toFloat()
        val prompt = buildPrompt(messages)

        streamJob = scope.launch {
            try {
                val model = createModel(maxOutputTokens = maxTokens, temperature = temperature)
                var totalContent = ""
                model.generateContentStream(prompt).collect { chunk ->
                    val delta = chunk.text ?: ""
                    totalContent += delta
                    withContext(Dispatchers.Main) {
                        events.success(mapOf("type" to "delta", "content" to delta))
                    }
                }
                model.close()
                val promptTokens = estimateTokens(prompt)
                val completionTokens = estimateTokens(totalContent)
                withContext(Dispatchers.Main) {
                    events.success(mapOf(
                        "type" to "done",
                        "finish_reason" to "stop",
                        "usage" to mapOf(
                            "prompt_tokens" to promptTokens,
                            "completion_tokens" to completionTokens,
                            "total_tokens" to promptTokens + completionTokens,
                        ),
                    ))
                    events.endOfStream()
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    events.success(mapOf("type" to "error", "message" to (e.message ?: "Stream failed")))
                    events.endOfStream()
                }
            }
        }
    }

    override fun onCancel(arguments: Any?) {
        streamJob?.cancel()
        streamJob = null
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    /// Creates an AICore GenerativeModel instance.
    /// Throws if the model is not available on this device.
    private fun createModel(maxOutputTokens: Int, temperature: Float): com.google.ai.edge.aicore.GenerativeModel {
        val config = com.google.ai.edge.aicore.generationConfig {
            this.maxOutputTokens = maxOutputTokens
            this.temperature = temperature
            this.topK = 40
        }
        return com.google.ai.edge.aicore.GenerativeModel(
            generationConfig = config,
            downloadCondition = com.google.ai.edge.aicore.DownloadCondition.Builder()
                .setMinimumBatteryLevelPercent(0)
                .build(),
        )
    }

    /// Converts the messages array into a plain-text prompt.
    /// Uses a compact format optimised for small on-device models (~4K context).
    private fun buildPrompt(messages: List<Map<String, Any>>): String {
        val parts = mutableListOf<String>()
        for (msg in messages) {
            val role = msg["role"] as? String ?: "user"
            val content = msg["content"] as? String ?: ""
            if (content.isEmpty()) continue
            when (role) {
                "system" -> parts.add("[System]\n$content")
                "user" -> parts.add("User: $content")
                "assistant" -> parts.add("AI: $content")
                "tool" -> parts.add("Tool result: $content")
                else -> parts.add("$role: $content")
            }
        }
        parts.add("AI:")
        return parts.joinToString("\n\n")
    }

    /// Strips echoed prompt content from the model's response.
    /// Some on-device models reproduce the conversation history instead of
    /// generating a new reply — especially when the context window is tight.
    private fun stripPromptEcho(response: String): String {
        var cleaned = response.trim()
        // Remove leading "AI:" prefix the model may echo.
        if (cleaned.startsWith("AI:")) {
            cleaned = cleaned.removePrefix("AI:").trim()
        }
        // Detect full echo: if the response contains multiple role markers
        // (User:/AI:/[System]) it is echoing the conversation. Extract only
        // the text after the very last "AI:" marker.
        val hasMultipleRoles = cleaned.contains("User:") && cleaned.contains("AI:")
        val hasSystemEcho = cleaned.contains("[System]")
        if (hasMultipleRoles || hasSystemEcho) {
            val lastAI = cleaned.lastIndexOf("AI:")
            if (lastAI >= 0) {
                cleaned = cleaned.substring(lastAI + "AI:".length).trim()
            }
        }
        return cleaned
    }

    /// Rough token estimate: ~4 chars per token.
    private fun estimateTokens(text: String): Int = maxOf(1, text.length / 4)

    fun cleanup() {
        streamJob?.cancel()
        scope.cancel()
    }
}
