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
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.concurrent.Executors

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "ai.flutterclaw/ui_automation"
        private const val SANDBOX_CHANNEL = "ai.flutterclaw/sandbox"
        private const val OVERLAY_CHANNEL = "ai.flutterclaw/overlay"
    }

    private var sandboxHandler: SandboxHandler? = null
    private var onDeviceLlmHandler: OnDeviceLlmHandler? = null
    private var overlayView: OverlayStatusView? = null

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
                    "ui_device_info" -> handleDeviceInfo(result)
                    "ui_launch_app" -> handleLaunchApp(call, result)
                    "ui_launch_intent" -> handleLaunchIntent(call, result)
                    "ui_list_apps" -> handleListApps(call, result)
                    "ui_app_intents" -> handleAppIntents(call, result)
                    else -> result.notImplemented()
                }
            }

        // On-device LLM (Gemini Nano via AICore)
        onDeviceLlmHandler = OnDeviceLlmHandler(applicationContext)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "ai.flutterclaw/on_device_llm")
            .setMethodCallHandler { call, result ->
                onDeviceLlmHandler?.handleMethodCall(call, result) ?: result.notImplemented()
            }
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "ai.flutterclaw/on_device_llm_stream")
            .setStreamHandler(onDeviceLlmHandler)

        // Sandbox shell (PRoot + Alpine rootfs)
        sandboxHandler = SandboxHandler(applicationContext)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SANDBOX_CHANNEL)
            .setMethodCallHandler { call, result ->
                sandboxHandler?.handleMethodCall(call, result) ?: result.notImplemented()
            }
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "ai.flutterclaw/sandbox_stream")
            .setStreamHandler(sandboxHandler)

        // Overlay status chip (floating on top of all apps) — singleton so the
        // background-service engine shares the same instance.
        overlayView = OverlayStatusView.getInstance(applicationContext)
        val overlayChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, OVERLAY_CHANNEL)
        overlayView?.setResponseChannel(overlayChannel)
        overlayChannel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "overlay_check_permission" -> result.success(overlayView?.canShow() == true)
                    "overlay_request_permission" -> {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            val intent = Intent(
                                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                                android.net.Uri.parse("package:$packageName"),
                            ).apply { flags = Intent.FLAG_ACTIVITY_NEW_TASK }
                            startActivity(intent)
                            result.success(true)
                        } else {
                            result.success(false)
                        }
                    }
                    "overlay_set_agent" -> {
                        val name = call.argument<String>("name") ?: "Agent"
                        val emoji = call.argument<String>("emoji") ?: "\uD83E\uDD16"
                        overlayView?.setAgent(name, emoji)
                        result.success(true)
                    }
                    "overlay_show" -> {
                        val text = call.argument<String>("text") ?: ""
                        android.util.Log.d("MainActivity", "overlay_show: '$text' (overlayView=${overlayView != null})")
                        overlayView?.show(text)
                        result.success(true)
                    }
                    "overlay_hide" -> {
                        overlayView?.hide()
                        result.success(true)
                    }
                    "overlay_show_done" -> {
                        val text = call.argument<String>("text") ?: "Done"
                        overlayView?.showDone(text)
                        result.success(true)
                    }
                    "overlay_show_message" -> {
                        val text = call.argument<String>("text") ?: ""
                        val inputType = call.argument<String>("inputType") ?: "buttons"
                        val requestId = call.argument<String>("requestId") ?: ""
                        @Suppress("UNCHECKED_CAST")
                        val buttons = (call.argument<List<Map<String, String>>>("buttons"))
                        overlayView?.showMessage(text, buttons, inputType, requestId)
                        result.success(true)
                    }
                    "overlay_hide_message" -> {
                        overlayView?.hideMessage()
                        result.success(true)
                    }
                    "overlay_touch_tap" -> {
                        val x = (call.argument<Number>("x") ?: 0).toFloat()
                        val y = (call.argument<Number>("y") ?: 0).toFloat()
                        TouchFeedbackOverlay.getInstance(applicationContext).showTap(x, y)
                        result.success(true)
                    }
                    "overlay_touch_swipe" -> {
                        val x1 = (call.argument<Number>("x1") ?: 0).toFloat()
                        val y1 = (call.argument<Number>("y1") ?: 0).toFloat()
                        val x2 = (call.argument<Number>("x2") ?: 0).toFloat()
                        val y2 = (call.argument<Number>("y2") ?: 0).toFloat()
                        TouchFeedbackOverlay.getInstance(applicationContext).showSwipe(x1, y1, x2, y2)
                        result.success(true)
                    }
                    "overlay_touch_type" -> {
                        val text = call.argument<String>("text") ?: ""
                        TouchFeedbackOverlay.getInstance(applicationContext).showType(text)
                        result.success(true)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onDestroy() {
        // Do NOT hide the overlay here — it should persist when the Activity is
        // destroyed (e.g. user pressed Home while the agent is still running tools).
        // The overlay auto-hides after 30s, or when the agent fires isDone.
        onDeviceLlmHandler?.cleanup()
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
            // Hide the overlay so it doesn't appear in the screenshot
            val overlay = OverlayStatusView.getInstance(applicationContext)
            overlay.hideForCapture()
            // Wait one frame for the compositor to process the visibility change
            Handler(Looper.getMainLooper()).postDelayed({
                try {
                    svc.takeScreenshotApi30 { bytes ->
                        Handler(Looper.getMainLooper()).post {
                            overlay.showAfterCapture()
                            if (bytes != null) {
                                result.success(mapOf(
                                    "data" to Base64.encodeToString(bytes, Base64.NO_WRAP),
                                    "mimeType" to "image/jpeg",
                                ))
                            } else {
                                pixelCopyFallback(result)
                            }
                        }
                    }
                } catch (e: Exception) {
                    // Always restore overlay even if screenshot throws
                    overlay.showAfterCapture()
                    pixelCopyFallback(result)
                }
            }, 50)
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
        // PixelCopy requires a backing surface; when the app is in the
        // background (normal during UI automation) the window has none.
        if (!decorView.isAttachedToWindow) {
            result.error("SCREENSHOT_FAILED",
                "Screenshot failed: app window is not in the foreground. " +
                "Ensure Accessibility Service is enabled for full-screen capture.",
                null)
            return
        }
        val bitmap = Bitmap.createBitmap(decorView.width, decorView.height, Bitmap.Config.ARGB_8888)
        try {
            PixelCopy.request(win, bitmap, { copyResult ->
                if (copyResult == PixelCopy.SUCCESS) {
                    val scaled = FlutterClawAccessibilityService.scaleDown(bitmap, 1080)
                    if (scaled !== bitmap) bitmap.recycle()
                    val baos = ByteArrayOutputStream()
                    scaled.compress(Bitmap.CompressFormat.JPEG, 60, baos)
                    scaled.recycle()
                    result.success(mapOf(
                        "data" to Base64.encodeToString(baos.toByteArray(), Base64.NO_WRAP),
                        "mimeType" to "image/jpeg",
                        "note" to "App surface only (PixelCopy fallback)",
                    ))
                } else {
                    bitmap.recycle()
                    result.error("SCREENSHOT_FAILED", "PixelCopy failed with code $copyResult", null)
                }
            }, Handler(Looper.getMainLooper()))
        } catch (e: Exception) {
            bitmap.recycle()
            result.error("SCREENSHOT_FAILED",
                "Screenshot failed: ${e.message ?: "Window doesn't have a backing surface"}",
                null)
        }
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

    // ─── Device info ────────────────────────────────────────────────────────

    private fun handleDeviceInfo(result: MethodChannel.Result) {
        val dm = resources.displayMetrics
        val locale = resources.configuration.locales[0]
        result.success(mapOf(
            "manufacturer" to Build.MANUFACTURER,
            "brand" to Build.BRAND,
            "model" to Build.MODEL,
            "device" to Build.DEVICE,
            "product" to Build.PRODUCT,
            "androidVersion" to Build.VERSION.RELEASE,
            "sdkInt" to Build.VERSION.SDK_INT,
            "securityPatch" to (if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) Build.VERSION.SECURITY_PATCH else "unknown"),
            "screenWidthPx" to dm.widthPixels,
            "screenHeightPx" to dm.heightPixels,
            "densityDpi" to dm.densityDpi,
            "language" to locale.language,
            "country" to locale.country,
            "displayLanguage" to locale.displayLanguage,
            "locale" to locale.toLanguageTag(),
        ))
    }

    // ─── Launch app / intent ────────────────────────────────────────────────

    private fun handleLaunchApp(call: MethodCall, result: MethodChannel.Result) {
        val packageName = call.argument<String>("package")
        val search = call.argument<String>("search")

        if (packageName != null) {
            // Launch by exact package name
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                startActivity(intent)
                result.success(mapOf("success" to true, "package" to packageName))
            } else {
                result.success(mapOf("success" to false, "message" to "App not found or has no launch activity: $packageName"))
            }
            return
        }

        if (search != null) {
            // Search installed apps by label
            val pm = packageManager
            val allApps = pm.getInstalledApplications(0)
            val lowerSearch = search.lowercase()
            for (app in allApps) {
                val label = pm.getApplicationLabel(app).toString()
                if (label.lowercase().contains(lowerSearch)) {
                    val intent = pm.getLaunchIntentForPackage(app.packageName)
                    if (intent != null) {
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        startActivity(intent)
                        result.success(mapOf("success" to true, "package" to app.packageName, "label" to label))
                        return
                    }
                }
            }
            result.success(mapOf("success" to false, "message" to "No launchable app matching '$search'"))
            return
        }

        result.error("INVALID_ARG", "Either 'package' or 'search' is required", null)
    }

    private fun handleLaunchIntent(call: MethodCall, result: MethodChannel.Result) {
        try {
            val action = call.argument<String>("action")
            val uri = call.argument<String>("uri")
            val type = call.argument<String>("type")
            val pkg = call.argument<String>("package")
            @Suppress("UNCHECKED_CAST")
            val extras = call.argument<Map<String, Any>>("extras")

            val intent = when {
                action != null && uri != null -> Intent(action, android.net.Uri.parse(uri))
                action != null -> Intent(action)
                uri != null -> Intent(Intent.ACTION_VIEW, android.net.Uri.parse(uri))
                else -> {
                    result.error("INVALID_ARG", "At least 'action' or 'uri' is required", null)
                    return
                }
            }

            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            if (type != null) intent.type = type
            if (pkg != null) intent.setPackage(pkg)
            extras?.forEach { (k, v) ->
                when (v) {
                    is String -> intent.putExtra(k, v)
                    is Int -> intent.putExtra(k, v)
                    is Long -> intent.putExtra(k, v)
                    is Double -> intent.putExtra(k, v)
                    is Boolean -> intent.putExtra(k, v)
                }
            }

            if (intent.resolveActivity(packageManager) != null) {
                startActivity(intent)
                result.success(mapOf("success" to true, "action" to (action ?: "VIEW"), "uri" to uri))
            } else {
                // Try anyway — some intents resolve dynamically
                startActivity(intent)
                result.success(mapOf("success" to true, "action" to (action ?: "VIEW"), "uri" to uri, "note" to "No explicit resolver; launched anyway"))
            }
        } catch (e: Exception) {
            result.success(mapOf("success" to false, "message" to (e.message ?: "Failed to launch intent")))
        }
    }

    private fun handleListApps(call: MethodCall, result: MethodChannel.Result) {
        val launchableOnly = call.argument<Boolean>("launchable_only") ?: true
        val search = call.argument<String>("search")?.lowercase()
        val pm = packageManager
        val allApps = pm.getInstalledApplications(0)
        val apps = mutableListOf<Map<String, Any>>()

        for (app in allApps) {
            val label = pm.getApplicationLabel(app).toString()
            if (search != null && !label.lowercase().contains(search) && !app.packageName.lowercase().contains(search)) {
                continue
            }
            if (launchableOnly && pm.getLaunchIntentForPackage(app.packageName) == null) {
                continue
            }
            val isSystem = (app.flags and android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0
            apps.add(mapOf(
                "package" to app.packageName,
                "label" to label,
                "isSystem" to isSystem,
            ))
        }

        apps.sortBy { (it["label"] as String).lowercase() }
        result.success(mapOf("apps" to apps, "count" to apps.size))
    }

    private fun handleAppIntents(call: MethodCall, result: MethodChannel.Result) {
        val pkg = call.argument<String>("package") ?: run {
            result.error("INVALID_ARG", "package is required", null); return
        }
        val pm = packageManager
        try {
            val pkgInfo = pm.getPackageInfo(
                pkg,
                android.content.pm.PackageManager.GET_ACTIVITIES or
                    android.content.pm.PackageManager.GET_INTENT_FILTERS,
            )
            val activities = mutableListOf<Map<String, Any?>>()
            for (ai in pkgInfo.activities ?: emptyArray()) {
                if (!ai.exported) continue
                val entry = mutableMapOf<String, Any?>(
                    "name" to ai.name,
                    "label" to (ai.loadLabel(pm)?.toString() ?: ai.name),
                    "exported" to true,
                )
                // Try to get intent filters via queryIntentActivities
                val probeIntent = Intent().apply { setClassName(pkg, ai.name) }
                val resolveList = pm.queryIntentActivities(probeIntent, android.content.pm.PackageManager.GET_RESOLVED_FILTER)
                val filters = mutableListOf<Map<String, Any?>>()
                for (ri in resolveList) {
                    val f = ri.filter ?: continue
                    val actions = mutableListOf<String>()
                    for (i in 0 until f.countActions()) actions.add(f.getAction(i))
                    val categories = mutableListOf<String>()
                    for (i in 0 until f.countCategories()) categories.add(f.getCategory(i))
                    val schemes = mutableListOf<String>()
                    for (i in 0 until f.countDataSchemes()) schemes.add(f.getDataScheme(i))
                    val types = mutableListOf<String>()
                    for (i in 0 until f.countDataTypes()) types.add(f.getDataType(i))
                    filters.add(mapOf(
                        "actions" to actions,
                        "categories" to categories,
                        "schemes" to schemes,
                        "types" to types,
                    ))
                }
                if (filters.isNotEmpty()) entry["intentFilters"] = filters
                activities.add(entry)
            }
            result.success(mapOf(
                "package" to pkg,
                "label" to pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0)).toString(),
                "activities" to activities,
                "count" to activities.size,
            ))
        } catch (e: android.content.pm.PackageManager.NameNotFoundException) {
            result.success(mapOf("error" to true, "message" to "Package not found: $pkg"))
        } catch (e: Exception) {
            result.success(mapOf("error" to true, "message" to (e.message ?: "Failed to query intents")))
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
