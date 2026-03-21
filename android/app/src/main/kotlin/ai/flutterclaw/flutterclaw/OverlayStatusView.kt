package ai.flutterclaw.flutterclaw

import android.content.Context
import android.graphics.PixelFormat
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView

class OverlayStatusView(private val context: Context) {

    companion object {
        private const val TAG = "OverlayStatusView"
    }

    private val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val handler = Handler(Looper.getMainLooper())
    private var overlayView: LinearLayout? = null
    private var hideRunnable: Runnable? = null

    fun canShow(): Boolean {
        val can = Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && Settings.canDrawOverlays(context)
        Log.d(TAG, "canShow=$can (SDK=${Build.VERSION.SDK_INT}, canDrawOverlays=${
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) Settings.canDrawOverlays(context) else "N/A"
        })")
        return can
    }

    fun show(text: String) {
        Log.d(TAG, "show() called: $text")
        handler.post { showInternal(text) }
    }

    fun hide() {
        handler.post { hideInternal() }
    }

    private fun showInternal(text: String) {
        if (!canShow()) {
            Log.w(TAG, "showInternal: canShow=false, skipping")
            return
        }

        // Cancel pending auto-hide
        hideRunnable?.let { handler.removeCallbacks(it) }

        if (overlayView != null) {
            // Update existing view
            Log.d(TAG, "showInternal: updating existing view")
            val tv = overlayView!!.getChildAt(1) as? TextView
            tv?.text = text
        } else {
            Log.d(TAG, "showInternal: creating new overlay")
            // Create new overlay
            val dp = { value: Float ->
                TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.resources.displayMetrics).toInt()
            }

            val pill = LinearLayout(context).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                setPadding(dp(12f), dp(6f), dp(16f), dp(6f))
                background = android.graphics.drawable.GradientDrawable().apply {
                    setColor(0xDD1A1A2E.toInt())
                    cornerRadius = dp(20f).toFloat()
                }
            }

            val spinner = ProgressBar(context, null, android.R.attr.progressBarStyleSmall).apply {
                val size = dp(16f)
                layoutParams = LinearLayout.LayoutParams(size, size).apply {
                    marginEnd = dp(8f)
                }
                indeterminateTintList = android.content.res.ColorStateList.valueOf(0xFFBB86FC.toInt())
            }

            val label = TextView(context).apply {
                this.text = text
                setTextColor(0xFFE0E0E0.toInt())
                textSize = 13f
                maxLines = 1
                ellipsize = android.text.TextUtils.TruncateAt.END
            }

            pill.addView(spinner)
            pill.addView(label)

            val type = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
            else
                @Suppress("DEPRECATION")
                WindowManager.LayoutParams.TYPE_PHONE

            val params = WindowManager.LayoutParams(
                WindowManager.LayoutParams.WRAP_CONTENT,
                WindowManager.LayoutParams.WRAP_CONTENT,
                type,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                        WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                PixelFormat.TRANSLUCENT,
            ).apply {
                gravity = Gravity.TOP or Gravity.CENTER_HORIZONTAL
                y = dp(48f)
            }

            try {
                windowManager.addView(pill, params)
                overlayView = pill
                Log.d(TAG, "showInternal: overlay added successfully")
            } catch (e: Exception) {
                Log.e(TAG, "showInternal: addView failed", e)
            }
        }

        // Auto-hide after 4 seconds
        hideRunnable = Runnable { hideInternal() }
        handler.postDelayed(hideRunnable!!, 4000)
    }

    private fun hideInternal() {
        hideRunnable?.let { handler.removeCallbacks(it) }
        hideRunnable = null
        overlayView?.let {
            try {
                windowManager.removeView(it)
            } catch (_: Exception) {}
        }
        overlayView = null
    }
}
