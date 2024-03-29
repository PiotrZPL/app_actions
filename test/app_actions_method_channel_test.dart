import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_actions/app_actions_method_channel.dart';

void main() {
  MethodChannelAppActions platform = MethodChannelAppActions();
  const MethodChannel channel = MethodChannel('hello');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
