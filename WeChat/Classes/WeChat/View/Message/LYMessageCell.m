//
//  LYMessageCell.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYMessageCell.h"

@implementation LYMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.avatarImageView];
        [self addSubview:self.messageBackgroundImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_message.ownerType == LYMessageOwnerTypeSelf) {
        self.avatarImageView.ly_origin = CGPointMake(self.ly_width - 10 - self.avatarImageView.ly_width, 10);
    } else if (_message.ownerType == LYMessageOwnerTypeOther) {
        self.avatarImageView.ly_origin = CGPointMake(10, 10);
    }
    
}

#pragma mark - Getter and Setter
- (void)setMessage:(LYMessage *)message {
    _message = message;
    switch (message.ownerType) {
        case LYMessageOwnerTypeUnknown: {
            
            break;
        }
        case LYMessageOwnerTypeSystem: {
            self.avatarImageView.hidden = YES;
            self.messageBackgroundImageView.hidden = YES;
            break;
        }
        case LYMessageOwnerTypeSelf: {
            self.avatarImageView.hidden = NO;
            self.avatarImageView.image = [UIImage imageNamed:message.sender.avatarURL];
            self.messageBackgroundImageView.hidden = NO;
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_sender_background_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            self.messageBackgroundImageView.highlightedImage = [[UIImage imageNamed:@"message_sender_background_highlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        }
        case LYMessageOwnerTypeOther: {
            self.avatarImageView.hidden = NO;
            self.avatarImageView.image = [UIImage imageNamed:message.sender.avatarURL];
            self.messageBackgroundImageView.hidden = NO;
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_receiver_background_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            self.messageBackgroundImageView.highlightedImage = [[UIImage imageNamed:@"message_receiver_background_highlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        }
    }
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        CGFloat imageWH = 40;
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
        _avatarImageView.hidden = YES;
    }
    return _avatarImageView;
}

- (UIImageView *)messageBackgroundImageView {
    if (!_messageBackgroundImageView) {
        _messageBackgroundImageView = [[UIImageView alloc] init];
        _messageBackgroundImageView.hidden = YES;
    }
    return _messageBackgroundImageView;
}

@end
