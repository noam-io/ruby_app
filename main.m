// Avoid inclusion of <CarbonCore/AIFF.h> which typedef's ID to a different size than ruby.h
#define __AIFF__

#include <Cocoa/Cocoa.h>
#include <Foundation/Foundation.h>
#include <unistd.h>
#include "AppDelegate.h"

static AppDelegate* _appDelegate;

int main()
{
    @autoreleasepool {
        _appDelegate = [[AppDelegate alloc] init];
        [NSApplication sharedApplication];
        [NSApp setDelegate:_appDelegate];
        [NSApp run];
    }
}
