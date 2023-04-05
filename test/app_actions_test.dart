import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:app_actions/app_actions.dart';
import 'package:app_actions/app_actions_platform_interface.dart';
import 'package:app_actions/app_actions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHelloPlatform
    with MockPlatformInterfaceMixin
    implements AppActionsPlatform {

  @override
  Future<void> openApp({required String appName}) => Future<void>(() {
    
  },);
}

void main() {
  final AppActionsPlatform initialPlatform = AppActionsPlatform.instance;

  test('$MethodChannelAppActions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppActions>());
  });
}
