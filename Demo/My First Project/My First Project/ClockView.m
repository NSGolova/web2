//
//  ClockView.m
//  MyFirstProject
//
//  Created by StudentCamp on 7/10/16.
//  Copyright © 2016 Alexander Gomenyuk. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

@synthesize time;

- (void)setTime:(NSTimeInterval)aTime
{
    time = aTime;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSRect drawingBounds = NSInsetRect(self.bounds, 1.0, 1.0);
    NSBezierPath *circle = [NSBezierPath bezierPath];
    [circle moveToPoint:NSMakePoint(NSMidX(drawingBounds), NSMaxY(drawingBounds))];
                                     
    CGFloat endAngle = 90.0 - 6.0 * self.time;
    [circle appendBezierPathWithArcWithCenter:NSMakePoint(NSMidX(drawingBounds), NSMidY(drawingBounds)) radius:NSWidth(drawingBounds)/2 startAngle:90.0 endAngle:endAngle clockwise:YES];
    [circle stroke];
}

@end
