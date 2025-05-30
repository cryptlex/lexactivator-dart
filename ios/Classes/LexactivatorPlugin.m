#import "LexactivatorPlugin.h"
#if __has_include(<lexactivator/lexactivator-Swift.h>)
#import <lexactivator/lexactivator-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lexactivator-Swift.h"
#endif

@implementation LexactivatorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLexactivatorPlugin registerWithRegistrar:registrar];
}
@end
