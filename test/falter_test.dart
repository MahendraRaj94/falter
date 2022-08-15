import 'package:flutter_test/flutter_test.dart';
import 'package:falter/falter.dart';
import 'package:falter/falter_platform_interface.dart';
import 'package:falter/falter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFalterPlatform 
    with MockPlatformInterfaceMixin
    implements FalterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FalterPlatform initialPlatform = FalterPlatform.instance;

  test('$MethodChannelFalter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFalter>());
  });

  test('getPlatformVersion', () async {
    Falter falterPlugin = Falter();
    MockFalterPlatform fakePlatform = MockFalterPlatform();
    FalterPlatform.instance = fakePlatform;
  
    expect(await falterPlugin.getPlatformVersion(), '42');
  });
}
