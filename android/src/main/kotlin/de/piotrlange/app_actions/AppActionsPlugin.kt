package de.piotrlange.app_actions

import androidx.annotation.NonNull
import android.content.pm.PackageManager
import android.content.Context
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.net.Uri
import android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class AppActionsPlugin: MethodCallHandler, FlutterPlugin, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  companion object {

    var context: Context? = null

    @JvmStatic
    fun registerWith(registrar: Registrar) {
        context = registrar.context()
        register(registrar.messenger())
    }

    @JvmStatic
    fun register(messenger: BinaryMessenger) {
        val channel = MethodChannel(messenger, "app_actions")
        channel.setMethodCallHandler(AppActionsPlugin())
    }
  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    AppActionsPlugin.register(binding.getBinaryMessenger())
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun onAttachedToActivity(activityPluginBinding: ActivityPluginBinding) {
      context = activityPluginBinding.getActivity()
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onReattachedToActivityForConfigChanges(activityPluginBinding: ActivityPluginBinding) {
      context = activityPluginBinding.getActivity()
  }

  override fun onDetachedFromActivity() {}

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "openApp") {
      val packageName: String? = call.argument("package_name")
      result.success(openApp(packageName))
    }
    else if (call.method == "openAppSettings") {
      val packageName: String? = call.argument("package_name")
      result.success(openAppSettings(packageName))
    }
    else {
      result.notImplemented()
    }
  }

  private fun openApp(packageName: String?): Boolean {
    if (packageName.isNullOrBlank()) return false
    return try {
        val launchIntent = context!!.packageManager.getLaunchIntentForPackage(packageName)
        context!!.startActivity(launchIntent)
        true
    } catch (e: Exception) {
        print(e)
        false
    }
  }

  private fun openAppSettings(packageName: String?): Boolean {
    if (packageName.isNullOrBlank()) return false
    return try {
      val intent = Intent()
      intent.flags = FLAG_ACTIVITY_NEW_TASK
      intent.action = ACTION_APPLICATION_DETAILS_SETTINGS
      val uri = Uri.fromParts("package", packageName, null)
      intent.data = uri
      context!!.startActivity(intent)
      true
    } catch (e: Exception) {
      print(e)
      false
    }
  }
}
