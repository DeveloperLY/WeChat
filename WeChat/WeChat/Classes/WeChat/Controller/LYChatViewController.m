//
//  LYChatViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYChatViewController.h"
#import "LYChatMessageViewController.h"
#import "LYChatBoxViewController.h"
#import "LYUserHelper.h"

@interface LYChatViewController () <LYChatMessageViewControllerDelegate, LYChatBoxViewControllerDelegate>
{
    CGFloat viewHeight;
}

@property (nonatomic, strong) LYChatMessageViewController *chatMessageVC;
@property (nonatomic, strong) LYChatBoxViewController *chatBoxVC;

@end

@implementation LYChatViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    viewHeight = LYScreenHeight - LYNavBarHeight - LYStatusBarHeight;
    
    [self.view addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
    
}

#pragma mark - LYChatMessageViewControllerDelegate
- (void)didTapChatMessageView:(LYChatMessageViewController *)chatMessageViewController {
    [self.chatBoxVC resignFirstResponder];
}

#pragma mark - LYChatBoxViewControllerDelegate
- (void)chatBoxViewController:(LYChatBoxViewController *)chatboxViewController sendMessage:(LYMessage *)message {
    message.sender = [LYUserHelper sharedUserHelper].user;
    [self.chatMessageVC addNewMessage:message];
    
    LYMessage *recMessage = [[LYMessage alloc] init];
    recMessage.messageType = message.messageType;
    recMessage.ownerType = LYMessageOwnerTypeOther;
    recMessage.sendDate = [NSDate date];
    recMessage.text = message.text;
    recMessage.imagePath = message.imagePath;
    recMessage.sender = message.sender;
    [self.chatMessageVC addNewMessage:recMessage];
    
    [self.chatMessageVC scrollToBottom];
}

- (void)chatBoxViewController:(LYChatBoxViewController *)chatboxViewController didChangeChatBoxHeight:(CGFloat)height {
    self.chatMessageVC.view.ly_height = viewHeight - height;
    self.chatBoxVC.view.ly_y = self.chatMessageVC.view.ly_y + self.chatMessageVC.view.ly_height;
    [self.chatMessageVC scrollToBottom];
}

#pragma mark - Getter and Setter
- (void)setUser:(LYUser *)user {
    _user = user;
    [self.navigationItem setTitle:user.username];
}

- (LYChatMessageViewController *)chatMessageVC {
    if (!_chatMessageVC) {
        _chatMessageVC = [[LYChatMessageViewController alloc] init];
        [_chatMessageVC.view setFrame:CGRectMake(0, LYStatusBarHeight + LYNavBarHeight, LYScreenWidth, viewHeight - LYTabBarHeight)];
        [_chatMessageVC setDelegate:self];
    }
    return _chatMessageVC;
}

- (LYChatBoxViewController *)chatBoxVC {
    if (!_chatBoxVC) {
        _chatBoxVC = [[LYChatBoxViewController alloc] init];
        [_chatBoxVC.view setFrame:CGRectMake(0, LYScreenHeight - LYTabBarHeight, LYScreenWidth, LYScreenHeight)];
        [_chatBoxVC setDelegate:self];
    }
    return _chatBoxVC;
}

@end
