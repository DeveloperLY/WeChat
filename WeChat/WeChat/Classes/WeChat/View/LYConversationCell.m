//
//  LYConversationCell.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYConversationCell.h"
#import "LYConversation.h"

@interface LYConversationCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LYConversationCell

- (void)layoutSubviews {
    self.leftFreeSpace = self.ly_height * 0.14;
    [super layoutSubviews];
    
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 5.0f;
}

- (void)setConversation:(LYConversation *)conversation {
    _conversation = conversation;
    self.avatarImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _conversation.avatarURL]];
    self.usernameLabel.text = _conversation.from;
    self.messageLabel.text = _conversation.message;
    self.dateLabel.text = @"09:19";
}

@end
