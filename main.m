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
    [pool drain];

    NSString* rubyExecutable = [[NSBundle mainBundle] pathForResource:@"ruby" ofType:nil];

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:rubyExecutable];
    NSString* gemHome = [[NSBundle mainBundle] pathForResource:@"lib/ruby/gems/2.1.0" ofType:nil];
    NSString* gemPath = [[NSBundle mainBundle] pathForResource:@"lib/ruby/gems/2.1.0" ofType:nil];
    [task setEnvironment:@{@"GEM_HOME": gemHome,
                           @"GEM_PATH": gemPath}];
    [task setArguments:[NSArray arrayWithObjects:@"main.rb", nil]];

    [task launch];
    [task waitUntilExit];
}
