//
//  LYTextMessageCell.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYTextMessageCell.h"

@implementation LYTextMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.messageTextLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat y = self.avatarImageView.ly_y + 11;
    CGFloat x = self.avatarImageView.ly_x + (self.message.ownerType == LYMessageOwnerTypeSelf ? - self.messageTextLabel.ly_width - 27 : self.avatarImageView.ly_width + 23);
    self.messageTextLabel.ly_origin = CGPointMake(x, y);
    
    x -= 18;                                    // 左边距离头像 5
    y = self.avatarImageView.ly_y - 5;       // 上边与头像对齐 (背景图像有5个像素偏差)
    CGFloat h = MAX(self.messageTextLabel.ly_height + 30, self.avatarImageView.ly_height + 10);
    self.messageBackgroundImageView.frame = CGRectMake(x, y, self.messageTextLabel.ly_width + 40, h);
}

#pragma mark - Getter and Setter
- (void)setMessage:(LYMessage *)message {
    [super setMessage:message];
    [_messageTextLabel setAttributedText:message.attrText];
    _messageTextLabel.ly_size = message.messageSize;
}

- (UILabel *)messageTextLabel {
    if (!_messageTextLabel) {
        _messageTextLabel = [[UILabel alloc] init];
        _messageTextLabel.font = [UIFont systemFontOfSize:16.0f];
        _messageTextLabel.numberOfLines = 0;
    }
    return _messageTextLabel;
}

@end
