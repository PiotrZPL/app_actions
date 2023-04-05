
import 'app_actions_platform_interface.dart';

class AppActions {
  void openApp({
    required String appName
  }) {
    AppActionsPlatform.instance.openApp(appName: appName);
  }
}
