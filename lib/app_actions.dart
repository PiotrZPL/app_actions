
import 'app_actions_platform_interface.dart';

class AppActions {
  Future<void> openApp({
    required String appName
  }) async {
    AppActionsPlatform.instance.openApp(appName: appName);
  }
}
