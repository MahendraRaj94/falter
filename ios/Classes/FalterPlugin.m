#import "FalterPlugin.h"
#if __has_include(<falter/falter-Swift.h>)
#import <falter/falter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "falter-Swift.h"
#endif

@implementation FalterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFalterPlugin registerWithRegistrar:registrar];
}
@end
