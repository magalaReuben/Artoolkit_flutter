import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'artoolkit_flutter_platform_interface.dart';

/// An implementation of [ArtoolkitFlutterPlatform] that uses method channels.
class MethodChannelArtoolkitFlutter extends ArtoolkitFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('artoolkit_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
