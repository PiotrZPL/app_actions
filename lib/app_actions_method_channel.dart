import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_actions_platform_interface.dart';

/// An implementation of [AppActionsPlatform] that uses method channels.
class MethodChannelAppActions extends AppActionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_actions');

  @override
  Future<void> openApp({
    required String appName
  }) async {
    bool success = await methodChannel.invokeMethod(
      "openApp",
      {
        "package_name": appName
      }
    );
    if (!success) {
      throw Exception("Could not open $appName!");
    }
  }

  @override
  Future<void> openAppSettings({
    required String appName
  }) async {
    bool success = await methodChannel.invokeMethod(
      "openAppSettings",
      {
        "package_name": appName
      }
    );
    if (!success) {
      throw Exception("Could not open settings for $appName!");
    }
  }
}
