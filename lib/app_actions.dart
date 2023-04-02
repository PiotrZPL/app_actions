
import 'app_actions_platform_interface.dart';

class Hello {
  Future<String?> getPlatformVersion() {
    return HelloPlatform.instance.getPlatformVersion();
  }

  Future<void> openApp({
    required String appName
  }) async {
    HelloPlatform.instance.openApp(appName: appName);
  }
}
