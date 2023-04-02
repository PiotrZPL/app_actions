import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:app_actions/app_actions.dart';
import 'package:app_actions/app_actions_platform_interface.dart';
import 'package:app_actions/app_actions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHelloPlatform
    with MockPlatformInterfaceMixin
    implements HelloPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  void openApp({required String appName}) => {};
}

void main() {
  final HelloPlatform initialPlatform = HelloPlatform.instance;

  test('$MethodChannelHello is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHello>());
  });

  test('getPlatformVersion', () async {
    Hello helloPlugin = Hello();
    MockHelloPlatform fakePlatform = MockHelloPlatform();
    HelloPlatform.instance = fakePlatform;

    expect(await helloPlugin.getPlatformVersion(), '42');
  });
}
