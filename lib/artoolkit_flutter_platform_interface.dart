import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'artoolkit_flutter_method_channel.dart';

abstract class ArtoolkitFlutterPlatform extends PlatformInterface {
  /// Constructs a ArtoolkitFlutterPlatform.
  ArtoolkitFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ArtoolkitFlutterPlatform _instance = MethodChannelArtoolkitFlutter();

  /// The default instance of [ArtoolkitFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelArtoolkitFlutter].
  static ArtoolkitFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ArtoolkitFlutterPlatform] when
  /// they register themselves.
  static set instance(ArtoolkitFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
