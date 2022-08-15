import 'falter_platform_interface.dart';

class Falter {
  Future<String?> getPlatformVersion() {
    return FalterPlatform.instance.getPlatformVersion();
  }

  Future<String?> showAlter() {
    return FalterPlatform.instance.showAlter();
  }
}
