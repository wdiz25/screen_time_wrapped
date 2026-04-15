package edu.kent.honors.screen_time_synopsis

import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {

    private val CHANNEL = "edu.kent.honors.screen_time_synopsis/app_info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInstalledApps" -> {
                    try {
                        val pm = packageManager
                        val apps = pm.getInstalledApplications(PackageManager.GET_META_DATA)
                        val appList = apps
                            .filter { appInfo ->
                                val isSystemApp = (appInfo.flags and ApplicationInfo.FLAG_SYSTEM) != 0
                                val isUpdatedSystemApp = (appInfo.flags and ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0
                                !isSystemApp || isUpdatedSystemApp
                            }
                            .mapNotNull { appInfo ->
                                try {
                                    val name = pm.getApplicationLabel(appInfo).toString()
                                    mapOf(
                                        "packageName" to appInfo.packageName,
                                        "appName" to name
                                    )
                                } catch (e: Exception) {
                                    null
                                }
                            }
                            .sortedBy { it["appName"] as String }
                        result.success(appList)
                    } catch (e: Exception) {
                        result.error("GET_APPS_ERROR", e.message, null)
                    }
                }
                "getAppIcon" -> {
                    val packageName = call.argument<String>("packageName")
                    if (packageName == null) {
                        result.error("INVALID_ARGS", "packageName required", null)
                        return@setMethodCallHandler
                    }
                    try {
                        val pm = packageManager
                        val drawable = pm.getApplicationIcon(packageName)
                        val bytes = drawableToBytes(drawable)
                        result.success(bytes)
                    } catch (e: Exception) {
                        result.error("ICON_ERROR", e.message, null)
                    }
                }
                "getAppName" -> {
                    val packageName = call.argument<String>("packageName")
                    if (packageName == null) {
                        result.error("INVALID_ARGS", "packageName required", null)
                        return@setMethodCallHandler
                    }
                    try {
                        val pm = packageManager
                        val appInfo = pm.getApplicationInfo(packageName, 0)
                        result.success(pm.getApplicationLabel(appInfo).toString())
                    } catch (e: Exception) {
                        result.success(packageName)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun drawableToBytes(drawable: Drawable): ByteArray {
        val bitmap = Bitmap.createBitmap(
            drawable.intrinsicWidth.coerceAtLeast(1),
            drawable.intrinsicHeight.coerceAtLeast(1),
            Bitmap.Config.ARGB_8888
        )
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, canvas.width, canvas.height)
        drawable.draw(canvas)
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        return stream.toByteArray()
    }
}
