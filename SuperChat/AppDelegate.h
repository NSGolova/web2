//
//  AppDelegate.h
//  SuperChat
//
//  Created by Виктор Радулов on 7/13/16.
//  Copyright © 2016 golova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VRDChatControllerDelegate.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) id<VRDChatControllerDelegate> delegate;


@end

