//
//  MyTimerViewController.h
//  MyFirstProject
//
//  Created by Alexander Gomenyuk on 6/30/16.
//  Copyright © 2016 Alexander Gomenyuk. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface MyTimerViewController : NSViewController
{
@private
	NSTimer *_timer;
}

- (void)startTimer;
- (void)stopTimer;
- (BOOL)isRunning;

@end
