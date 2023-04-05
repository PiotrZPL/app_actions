import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_actions_method_channel.dart';

abstract class AppActionsPlatform extends PlatformInterface {
  /// Constructs a HelloPlatform.
  AppActionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppActionsPlatform _instance = MethodChannelAppActions();

  /// The default instance of [HelloPlatform] to use.
  ///
  /// Defaults to [MethodChannelHello].
  static AppActionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HelloPlatform] when
  /// they register themselves.
  static set instance(AppActionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> openApp({
    required String appName
  }) async {
    throw UnimplementedError('openApp() has not been implemented.');
  }
}
