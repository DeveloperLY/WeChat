//
//  LYChatMessageViewController.h
//  WeChat
//
//  Created by Y Liu on 16/3/3.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYMessage.h"

@class LYChatMessageViewController;

@protocol LYChatMessageViewControllerDelegate <NSObject>

- (void) didTapChatMessageView:(LYChatMessageViewController *)chatMessageViewController;

@end

@interface LYChatMessageViewController : UITableViewController

@property (nonatomic, weak) id<LYChatMessageViewControllerDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *data;

- (void)addNewMessage:(LYMessage *)message;

- (void)scrollToBottom;

@end
