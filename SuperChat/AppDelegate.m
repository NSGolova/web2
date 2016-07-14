//
//  AppDelegate.m
//  SuperChat
//
//  Created by Виктор Радулов on 7/13/16.
//  Copyright © 2016 golova. All rights reserved.
//

#import "AppDelegate.h"
#import "VRDChatController.h"
#import "VRDChatControllerDelegate.h"

@interface AppDelegate ()

@property (assign) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.delegate onApplicationOpen:self];
    [self.window setStyleMask:[self.window styleMask] & ~NSResizableWindowMask];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    [self.delegate onApplicationClose:self];
}

@end
