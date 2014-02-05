#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, copy) NSStatusItem* theItem;
@property(nonatomic, assign) BOOL rubyStarted;

@end
