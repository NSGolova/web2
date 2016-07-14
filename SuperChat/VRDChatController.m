//
//  VRDChatController.m
//  SuperChat
//
//  Created by Виктор Радулов on 7/13/16.
//  Copyright © 2016 golova. All rights reserved.
//

#import "VRDChatController+Delegating.m"
#import "AppDelegate.h"


@implementation VRDChatController

{
@private
    NSTextField *_aliceMessageField;
    NSTextField *_bobMessageField;
    NSTextView *_messageView;
    NSColorWell *_bobMessageColor;
    NSColorWell *_aliceMessageColor;
    NSFont *_bobMessageFont;
    NSFont *_aliceMessageFont;
    NSString *_senderIdentifier;
}

- (IBAction)sendMessage:(NSButton *)sender
{
    @autoreleasepool
    {
        self.senderIdentifier = [sender identifier];
        NSString *senderMessage = nil;
        NSColor *messageColor = nil;
        NSFont *messageFont = nil;
        
        if([self.senderIdentifier isEqual:@"Alice"])
        {
            senderMessage = [self.aliceMessageField stringValue];
            self.aliceMessageField.stringValue = @"";
            messageColor = self.aliceMessageColor.color;
            messageFont = self.aliceMessageFont;
        } else
        {
            senderMessage = [self.bobMessageField stringValue];
            self.bobMessageField.stringValue = @"";
            messageColor = self.bobMessageColor.color;
            messageFont = self.bobMessageFont;
        }
       
        NSDateFormatter *formatter = [[NSDateFormatter new] autorelease];
        formatter.dateFormat = @"HH:mm:ss";
        
        NSString *infoMessage = [NSString stringWithFormat:@"%@ [%@]: ",[formatter stringFromDate:[NSDate date]],self.senderIdentifier];
        NSAttributedString *messageString = [[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n",senderMessage] attributes:@{NSForegroundColorAttributeName : messageColor, NSFontAttributeName:messageFont}] autorelease];
        NSAttributedString *infoString = [[[NSAttributedString alloc] initWithString:infoMessage attributes:@{NSFontFamilyAttribute : @"monospace"}] autorelease];
        
        [[self.messageView textStorage] appendAttributedString:infoString];
        [[self.messageView textStorage] appendAttributedString:messageString];
   
    }
    
}

- (IBAction)showFontMenu:(id)sender
{
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    [fontManager setTarget:self];
    self.senderIdentifier = [sender identifier];
    NSFontPanel *fontPanel = [fontManager fontPanel:YES];
    [fontPanel makeKeyAndOrderFront:sender];
}

- (void)changeFont:(NSFontManager *)sender
{
    NSFont *oldFont = [NSFont boldSystemFontOfSize:18];
    NSFont *newFont =  [sender convertFont:oldFont];
    
    if([self.senderIdentifier isEqual:@"Alice"]){
        self.aliceMessageFont = newFont;
    } else {
        self.bobMessageFont = newFont;
    }
}
-(void)changeAttributes:(NSFontManager *)sender{
    NSDictionary *oldAttributes = [NSDictionary dictionary];
    NSDictionary *newAttributes = [sender convertAttributes:oldAttributes];
    
}
-(void)setSenderIdentifier:(NSString *)senderIdentifier
{
    if(_senderIdentifier != senderIdentifier)
    {
        [_senderIdentifier release];
        _senderIdentifier = [senderIdentifier retain];
    }
}

-(NSString *)senderIdentifier
{
    return _senderIdentifier;
}

-(void)setAliceMessageFont:(NSFont *)aliceMessageFont
{
    if(_aliceMessageFont != aliceMessageFont)
    {
        [_aliceMessageFont release];
        _aliceMessageFont = [aliceMessageFont retain];
    }
    
}

-(NSFont *)aliceMessageFont
{
    return _aliceMessageFont;
}

-(void)setBobMessageFont:(NSFont *)bobMessageFont
{
    if(_bobMessageFont != bobMessageFont)
    {
        [_bobMessageFont release];
        _bobMessageFont = [bobMessageFont retain];
    }
    
}

-(NSFont *)bobMessageFont
{
    return _bobMessageFont;
}

-(void)setBobMessageColor:(NSColorWell *)bobMessageColor
{
    _bobMessageColor = bobMessageColor;
}

-(NSColorWell *)bobMessageColor
{
    return _bobMessageColor;
}

-(void)setBobMessageField:(NSTextField *)bobMessageField
{
    _bobMessageField = bobMessageField;
}

-(NSTextField *)bobMessageField
{
    return _bobMessageField;
}

-(void)setMessageView:(NSTextView *)messageView
{
    _messageView = messageView;
}

-(NSTextView *)messageView
{
    return _messageView;
}

-(void)setAliceMessageColor:(NSColorWell *)aliceMessageColor
{
    _aliceMessageColor = aliceMessageColor;
}

-(NSColorWell *)aliceMessageColor
{
    return _aliceMessageColor;
}

-(void)setAliceMessageField:(NSTextField *)aliceMessageField
{
    _aliceMessageField = aliceMessageField;
}

-(NSTextField *)aliceMessageField
{
    return _aliceMessageField;
}

-(void)awakeFromNib{
    self.aliceMessageFont = [NSFont boldSystemFontOfSize:12];
    self.bobMessageFont = [NSFont boldSystemFontOfSize:12];
    AppDelegate *delegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    delegate.delegate = self;
}


@end
