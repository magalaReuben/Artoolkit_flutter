import 'package:flutter_test/flutter_test.dart';
import 'package:artoolkit_flutter/artoolkit_flutter.dart';
import 'package:artoolkit_flutter/artoolkit_flutter_platform_interface.dart';
import 'package:artoolkit_flutter/artoolkit_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockArtoolkitFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements ArtoolkitFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ArtoolkitFlutterPlatform initialPlatform = ArtoolkitFlutterPlatform.instance;

  test('$MethodChannelArtoolkitFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelArtoolkitFlutter>());
  });

  test('getPlatformVersion', () async {
    ArtoolkitFlutter artoolkitFlutterPlugin = ArtoolkitFlutter();
    MockArtoolkitFlutterPlatform fakePlatform = MockArtoolkitFlutterPlatform();
    ArtoolkitFlutterPlatform.instance = fakePlatform;
  
    expect(await artoolkitFlutterPlugin.getPlatformVersion(), '42');
  });
}
