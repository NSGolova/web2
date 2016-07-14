//
//  MyTimer.m
//  MyFirstProject
//
//  Created by Alexander Gomenyuk on 6/30/16.
//  Copyright © 2016 Alexander Gomenyuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyTimerViewController.h"
#import "ClockView.h"

@interface MyTimerViewController()

@property (nonatomic, readwrite, retain) NSTimer *timer;
@property (assign) IBOutlet NSTextField *label;
@property (assign) IBOutlet NSProgressIndicator *progress;
@property (assign) IBOutlet NSButton *startStopButton;
@property (assign) IBOutlet ClockView *clockView;

@end

@implementation MyTimerViewController

@synthesize timer = _timer;

- (void)dealloc
{
	[_timer invalidate];
	[_timer release];
	[super dealloc];
}

- (IBAction)onStartStop:(NSButton *)sender
{
    if (self.timer)
    {
        [self stopTimer];
    }
    else
    {
        [self startTimer];
    }
}

- (void)awakeFromNib
{
	NSLog(@"Hi, I'm alive!");
}

- (void)viewDidLoad
{
    NSLog(@"View has been loaded.");
}

- (void)onTimerDidFire:(NSTimeInterval *)timer
{
dispatch_async(dispatch_get_main_queue(), ^{
    NSDate *startDate = _timer.userInfo;
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:startDate];
    self.label.stringValue = [NSString stringWithFormat:@"%.1f", interval];
    self.clockView.time = interval;
});
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimerDidFire:) userInfo:[NSDate date] repeats:YES];
    [self.startStopButton setTitle:@"Stop"];
    [self.progress startAnimation:nil];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
    [self.startStopButton setTitle:@"Start"];
    self.label.stringValue = @"0";
    [self.progress stopAnimation:nil];
}

- (BOOL)isRunning
{
    return (self.timer != nil);
}

@end
