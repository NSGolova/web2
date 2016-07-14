//
//  AppDelegate.m
//  My First Project
//
//  Created by StudentCamp on 7/13/16.
//  Copyright © 2016 StudentCamp. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTimerViewController.h"

@interface AppDelegate ()

@property (assign) IBOutlet NSWindow *window;
@property (retain) MyTimerViewController *timerController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    MyTimerViewController *controller = [[MyTimerViewController alloc] initWithNibName:@"MyTimerViewController" bundle:nil];
    [self.window.contentView addSubview:controller.view];
    self.timerController = controller;
    [controller release];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)startTimer:(NSMenuItem *)sender {
    [self.timerController startTimer];
}

- (IBAction)stopTimer:(NSMenuItem *)sender {
    [self.timerController stopTimer];
}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem {
    if ([menuItem action] == @selector(startTimer:))
    {
        return ![self.timerController isRunning];
    }
    else if ([menuItem action] == @selector(stopTimer:))
    {
        return [self.timerController isRunning];
    }
    return YES;
}

@end
