#import "AppDelegate.h"

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self) {
        _rubyStarted = NO;
    }
    return self;
}

#pragma mark NSApplicationDelegate

- (void)applicationDidBecomeActive:(NSNotification *)notification {
}
    
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString* appName = [[NSRunningApplication currentApplication] localizedName];
    [self setupMenu:appName];
    [self runRubyTask:@"main.rb"];
}

#pragma mark - Menu

- (void)setupMenu:(NSString*) appName {
    id menubar = [[NSMenu new] autorelease];
    id appMenuItem = [[NSMenuItem new] autorelease];
    [menubar addItem:appMenuItem];
    [NSApp setMainMenu:menubar];
    id appMenu = [[NSMenu new] autorelease];

    NSString* relaunchTitle = [@"Relaunch " stringByAppendingString:appName];
    NSMenuItem* relaunchMenuItem = [[[NSMenuItem alloc] initWithTitle:relaunchTitle
                                                               action:@selector(relaunch:)
                                                       keyEquivalent:@"r"]
                                    autorelease];
    [appMenu addItem:relaunchMenuItem];

    NSString* quitTitle = [@"Quit " stringByAppendingString:appName];
    NSMenuItem* quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle
                                                 action:@selector(terminate:)
                                          keyEquivalent:@"q"]
                                autorelease];
    [appMenu addItem:quitMenuItem];

    [appMenuItem setSubmenu:appMenu];
}

#pragma mark - Running Ruby

- (IBAction)relaunch:(id)sender {
    [self runRubyTask:@"relaunch.rb"];
}

- (void) runRubyTask:(NSString*) script {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    chdir([resourcePath UTF8String]);

    NSString *mainPath = [[resourcePath stringByAppendingPathComponent:script] retain];
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

    [task setArguments:[NSArray arrayWithObjects:script, nil]];

    [task launch];
}

@end

