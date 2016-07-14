//
//  VRDChatControllerDelegate.h
//  SuperChat
//
//  Created by Виктор Радулов on 7/14/16.
//  Copyright © 2016 golova. All rights reserved.
//

@class VRDChatController;
@class AppDelegate;

@protocol VRDChatControllerDelegate <NSObject>

- (void)onApplicationOpen:(AppDelegate *)delegate;
- (void)onApplicationClose:(AppDelegate *)delegate;

@end