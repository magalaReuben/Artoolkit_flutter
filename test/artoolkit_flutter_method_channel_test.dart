import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:artoolkit_flutter/artoolkit_flutter_method_channel.dart';

void main() {
  MethodChannelArtoolkitFlutter platform = MethodChannelArtoolkitFlutter();
  const MethodChannel channel = MethodChannel('artoolkit_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
