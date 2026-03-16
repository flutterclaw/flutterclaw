package ai.flutterclaw.flutterclaw

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Base64
import android.view.accessibility.AccessibilityManager
import android.view.PixelCopy
import android.accessibilityservice.AccessibilityServiceInfo
import com.pravera.flutter_foreground_task.FlutterForegroundTaskPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.concurrent.Executors

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "ai.flutterclaw/ui_automation"
        private const val SANDBOX_CHANNEL = "ai.flutterclaw/sandbox"
    }

    private var sandboxHandler: SandboxHandler? = null

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        FlutterForegroundTaskPlugin.addTaskLifecycleListener(
            GatewayNotificationListener(applicationContext)
        )
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "ui_check_permission" -> handleCheckPermission(result)
                    "ui_request_permission" -> handleRequestPermission(result)
                    "ui_tap" -> handleTap(call, result)
                    "ui_swipe" -> handleSwipe(call, result)
                    "ui_type_text" -> handleTypeText(call, result)
                    "ui_find_elements" -> handleFindElements(call, result)
                    "ui_click_element" -> handleClickElement(call, result)
                    "ui_screenshot" -> handleScreenshot(result)
                    "ui_global_action" -> handleGlobalAction(call, result)
                    else -> result.notImplemented()
                }
            }

        // Sandbox shell (PRoot + Alpine rootfs)
        sandboxHandler = SandboxHandler(applicationContext)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SANDBOX_CHANNEL)
            .setMethodCallHandler { call, result ->
                sandboxHandler?.handleMethodCall(call, result) ?: result.notImplemented()
            }
    }

    override fun onDestroy() {
        sandboxHandler?.cleanup()
        super.onDestroy()
    }

    // ─── Permission ───────────────────────────────────────────────────────────

    private fun handleCheckPermission(result: MethodChannel.Result) {
        val granted = isAccessibilityServiceEnabled()
        result.success(mapOf("granted" to granted, "platform" to "android"))
    }

    private fun handleRequestPermission(result: MethodChannel.Result) {
        try {
            val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK
            }
            startActivity(intent)
            result.success(mapOf("launched_settings" to true))
        } catch (e: Exception) {
            result.success(mapOf("launched_settings" to false, "message" to e.message))
        }
    }

    // ─── Tap ──────────────────────────────────────────────────────────────────

    private fun handleTap(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            result.error("UNSUPPORTED_API", "ui_tap requires Android API 24+", null)
            return
        }
        val x = (call.argument<Number>("x") ?: run {
            result.error("INVALID_ARG", "x is required", null); return
        }).toFloat()
        val y = (call.argument<Number>("y") ?: run {
            result.error("INVALID_ARG", "y is required", null); return
        }).toFloat()

        svc.performTap(x, y) { ok ->
            Handler(Looper.getMainLooper()).post { result.success(mapOf("success" to ok)) }
        }
    }

    // ─── Swipe ────────────────────────────────────────────────────────────────

    private fun handleSwipe(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            result.error("UNSUPPORTED_API", "ui_swipe requires Android API 24+", null)
            return
        }
        val x1 = (call.argument<Number>("x1") ?: run { result.error("INVALID_ARG", "x1 required", null); return }).toFloat()
        val y1 = (call.argument<Number>("y1") ?: run { result.error("INVALID_ARG", "y1 required", null); return }).toFloat()
        val x2 = (call.argument<Number>("x2") ?: run { result.error("INVALID_ARG", "x2 required", null); return }).toFloat()
        val y2 = (call.argument<Number>("y2") ?: run { result.error("INVALID_ARG", "y2 required", null); return }).toFloat()
        val durationMs = (call.argument<Number>("duration_ms") ?: 300).toLong()

        svc.performSwipe(x1, y1, x2, y2, durationMs) { ok ->
            Handler(Looper.getMainLooper()).post { result.success(mapOf("success" to ok)) }
        }
    }

    // ─── Type text ────────────────────────────────────────────────────────────

    private fun handleTypeText(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        val text = call.argument<String>("text") ?: run {
            result.error("INVALID_ARG", "text is required", null); return
        }
        result.success(svc.typeText(text))
    }

    // ─── Find elements ────────────────────────────────────────────────────────

    private fun handleFindElements(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        val query = call.argument<String>("query")
        val by = call.argument<String>("by") ?: "all"
        result.success(svc.findElements(query, by))
    }

    // ─── Click element ────────────────────────────────────────────────────────

    private fun handleClickElement(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        val query = call.argument<String>("query") ?: run {
            result.error("INVALID_ARG", "query is required", null); return
        }
        val by = call.argument<String>("by") ?: "text"
        result.success(svc.clickElement(query, by))
    }

    // ─── Screenshot ───────────────────────────────────────────────────────────

    private fun handleScreenshot(result: MethodChannel.Result) {
        val svc = FlutterClawAccessibilityService.instance
        if (svc != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            svc.takeScreenshotApi30 { bytes ->
                Handler(Looper.getMainLooper()).post {
                    if (bytes != null) {
                        result.success(mapOf(
                            "data" to Base64.encodeToString(bytes, Base64.NO_WRAP),
                            "mimeType" to "image/png",
                        ))
                    } else {
                        pixelCopyFallback(result)
                    }
                }
            }
        } else {
            pixelCopyFallback(result)
        }
    }

    private fun pixelCopyFallback(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            result.error("UNSUPPORTED", "Screenshot requires Android API 26+", null)
            return
        }
        val win = window ?: run { result.error("SCREENSHOT_FAILED", "No window available", null); return }
        val decorView = win.decorView
        if (decorView.width == 0 || decorView.height == 0) {
            result.error("SCREENSHOT_FAILED", "Window has zero size", null)
            return
        }
        val bitmap = Bitmap.createBitmap(decorView.width, decorView.height, Bitmap.Config.ARGB_8888)
        PixelCopy.request(win, bitmap, { copyResult ->
            if (copyResult == PixelCopy.SUCCESS) {
                val baos = ByteArrayOutputStream()
                bitmap.compress(Bitmap.CompressFormat.PNG, 90, baos)
                bitmap.recycle()
                result.success(mapOf(
                    "data" to Base64.encodeToString(baos.toByteArray(), Base64.NO_WRAP),
                    "mimeType" to "image/png",
                    "note" to "App surface only (PixelCopy fallback — Accessibility Service screenshot requires API 30+)",
                ))
            } else {
                bitmap.recycle()
                result.error("SCREENSHOT_FAILED", "PixelCopy failed with code $copyResult", null)
            }
        }, Handler(Looper.getMainLooper()))
    }

    // ─── Global action ────────────────────────────────────────────────────────

    private fun handleGlobalAction(call: MethodCall, result: MethodChannel.Result) {
        val svc = requireService(result) ?: return
        val action = call.argument<String>("action") ?: run {
            result.error("INVALID_ARG", "action is required", null); return
        }
        val ok = svc.doGlobalAction(action)
        if (!ok) {
            result.error("UNKNOWN_ACTION", "Unknown global action: $action. Valid: back, home, recents, notifications, quick_settings", null)
        } else {
            result.success(mapOf("success" to true))
        }
    }

    // ─── Helpers ──────────────────────────────────────────────────────────────

    private fun requireService(result: MethodChannel.Result): FlutterClawAccessibilityService? {
        val svc = FlutterClawAccessibilityService.instance
        if (svc == null) {
            result.error(
                "PERMISSION_DENIED",
                "Accessibility Service not enabled. Call ui_request_permission to open Settings > Accessibility.",
                null,
            )
        }
        return svc
    }

    private fun isAccessibilityServiceEnabled(): Boolean {
        val am = getSystemService(Context.ACCESSIBILITY_SERVICE) as? AccessibilityManager ?: return false
        val enabledList = am.getEnabledAccessibilityServiceList(AccessibilityServiceInfo.FEEDBACK_ALL_MASK)
        val ourComponent = ComponentName(this, FlutterClawAccessibilityService::class.java)
        for (info in enabledList) {
            val component = info.resolveInfo?.serviceInfo?.let {
                ComponentName(it.packageName, it.name)
            } ?: continue
            if (component == ourComponent) return true
        }
        // Fallback: check raw setting (format can be "pkg/.Service" or "pkg/pkg.Service")
        val enabledServices = Settings.Secure.getString(
            contentResolver,
            Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES,
        ) ?: return false
        val flat = ourComponent.flattenToString()
        val shortName = "$packageName/.FlutterClawAccessibilityService"
        return enabledServices.split(':').any {
            it.equals(flat, ignoreCase = true) ||
                it.equals(shortName, ignoreCase = true) ||
                it.contains("FlutterClawAccessibilityService", ignoreCase = true) && it.startsWith("$packageName/")
        }
    }
}
