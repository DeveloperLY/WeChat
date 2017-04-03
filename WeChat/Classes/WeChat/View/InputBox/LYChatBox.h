//
//  LYChatBox.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFace.h"

typedef NS_ENUM(NSUInteger, LYChatBoxStatus) {
    LYChatBoxStatusNothing,
    LYChatBoxStatusShowVoice,
    LYChatBoxStatusShowFace,
    LYChatBoxStatusShowMore,
    LYChatBoxStatusShowKeyboard,
};

@class LYChatBox;

@protocol LYChatBoxDelegate <NSObject>

@optional
- (void)chatBox:(LYChatBox *)chatBox changeStatusForm:(LYChatBoxStatus)fromStatus to:(LYChatBoxStatus)toStatus;

- (void)chatBox:(LYChatBox *)chatBox sendTextMessage:(NSString *)textMessage;

- (void)chatBox:(LYChatBox *)chatBox changeChatBoxHeight:(CGFloat)height;

@end

@interface LYChatBox : UIView

/** 代理 */
@property (nonatomic, weak) id <LYChatBoxDelegate> delegate;

/** 状态 */
@property (nonatomic, assign) LYChatBoxStatus status;

@property (nonatomic, assign) CGFloat curHeight;

- (void)addEmojiFace:(LYFace *)face;
- (void)sendCurrentMessage;
- (void)deleteButtonDown;

@end
