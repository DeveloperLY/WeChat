//
//  LYMessageCell.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYMessage.h"

@interface LYMessageCell : UITableViewCell

/** 消息 */
@property (nonatomic, strong) LYMessage *message;

/** 头像 */
@property (nonatomic, strong) UIImageView *avatarImageView;
/** 消息背景 */
@property (nonatomic, strong) UIImageView *messageBackgroundImageView;
/** 消息发送状态 */
@property (nonatomic, strong) UIImageView *messageSendStatusImageView;

@end
