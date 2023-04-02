import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_actions_platform_interface.dart';

/// An implementation of [HelloPlatform] that uses method channels.
class MethodChannelHello extends HelloPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_actions');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

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
}
