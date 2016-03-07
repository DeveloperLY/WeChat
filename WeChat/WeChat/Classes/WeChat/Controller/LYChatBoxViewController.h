//
//  LYChatBoxViewController.h
//  WeChat
//
//  Created by Y Liu on 16/3/3.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYMessage.h"

@class LYChatBoxViewController;

@protocol LYChatBoxViewControllerDelegate <NSObject>

- (void) chatBoxViewController:(LYChatBoxViewController *)chatboxViewController didChangeChatBoxHeight:(CGFloat)height;

- (void) chatBoxViewController:(LYChatBoxViewController *)chatboxViewController sendMessage:(LYMessage *)message;

@end


@interface LYChatBoxViewController : UIViewController

@property (nonatomic, weak) id<LYChatBoxViewControllerDelegate> delegate;


@end
