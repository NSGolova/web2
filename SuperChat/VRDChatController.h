//
//  VRDChatController.h
//  SuperChat
//
//  Created by Виктор Радулов on 7/13/16.
//  Copyright © 2016 golova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


@interface VRDChatController : NSObject
@property (assign,nonatomic) IBOutlet NSTextField *aliceMessageField;
@property (assign,nonatomic) IBOutlet NSTextField *bobMessageField;
@property (assign,nonatomic) IBOutlet NSTextView *messageView;
@property (assign,nonatomic) IBOutlet NSColorWell *bobMessageColor;
@property (assign,nonatomic) IBOutlet NSColorWell *aliceMessageColor;
@property (retain, nonatomic) NSFont *aliceMessageFont;
@property (retain, nonatomic) NSFont *bobMessageFont;
@property (retain, nonatomic) NSString *senderIdentifier;






@end
