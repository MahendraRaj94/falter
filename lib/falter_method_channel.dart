import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'falter_platform_interface.dart';

/// An implementation of [FalterPlatform] that uses method channels.
class MethodChannelFalter extends FalterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('falter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> showAlter() async {
    await methodChannel.invokeMethod<String>('showAlter');
    return "Success";
  }
}
