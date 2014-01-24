// Avoid inclusion of <CarbonCore/AIFF.h> which typedef's ID to a different size than ruby.h
#define __AIFF__

#include <Foundation/Foundation.h>
#include <unistd.h>

int main()
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    chdir([resourcePath UTF8String]);
    NSString *mainPath = [[resourcePath stringByAppendingPathComponent:@"main.rb"] retain];
    NSString* rubyExecutable = [[NSBundle mainBundle] pathForResource:@"ruby" ofType:nil];

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:rubyExecutable];

    NSString* gemHome = [NSString stringWithFormat:@"%@/%@", resourcePath, @"lib/ruby/gems/2.1.0"];
    NSString* gemPath = gemHome;
    NSDictionary* originalEnv = [[NSProcessInfo processInfo] environment];
    NSMutableDictionary* newEnv = [NSMutableDictionary dictionaryWithDictionary:originalEnv];
    NSDictionary* gemAttributes = @{@"GEM_HOME": gemHome,
                                    @"GEM_PATH": gemPath};
    [newEnv setValuesForKeysWithDictionary:gemAttributes];

    [task setEnvironment:newEnv];

    [task setArguments:[NSArray arrayWithObjects:@"main.rb", nil]];

    [task launch];
    [task waitUntilExit];
    [pool drain];
}
