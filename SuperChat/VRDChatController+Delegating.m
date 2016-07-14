//
//  VRDChatController+Delegating.m
//  SuperChat
//
//  Created by Виктор Радулов on 7/13/16.
//  Copyright © 2016 golova. All rights reserved.
//

#import "VRDChatController+Delegating.h"
#import "AppDelegate.h"
#import "VRDChatControllerDelegate.h"



@implementation VRDChatController (Delegating)

- (void)onApplicationOpen:(AppDelegate *)delegate
{
    [self.messageView setEditable:NO];
    NSData* newStringData = [NSData dataWithContentsOfFile:@"/Users/golova/log.txt"];
    if(newStringData)
    {
        [[self.messageView textStorage] appendAttributedString:[NSKeyedUnarchiver unarchiveObjectWithData:newStringData]];
    }
}

- (void)onApplicationClose:(AppDelegate *)delegate
{
    NSString *filePath = @"/Users/golova/log.txt";
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    NSData *stringData = [NSKeyedArchiver archivedDataWithRootObject:self.messageView.attributedString];
    [stringData writeToFile:filePath atomically:YES];
    
}



@end
