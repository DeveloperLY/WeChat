//
//  LYImageMessageCell.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYImageMessageCell.h"

@implementation LYImageMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self insertSubview:self.messageImageView belowSubview:self.messageBackgroundImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat y = self.avatarImageView.ly_y - 3;
    if (self.message.ownerType == LYMessageOwnerTypeSelf) {
        CGFloat x = self.avatarImageView.ly_x - self.messageImageView.ly_width - 5;
        self.messageImageView.ly_origin = CGPointMake(x, y);
        self.messageBackgroundImageView.frame = CGRectMake(x, y, self.message.messageSize.width+ 15, self.message.messageSize.height + 15);
    } else if (self.message.ownerType == LYMessageOwnerTypeOther) {
        CGFloat x = self.avatarImageView.ly_x + self.avatarImageView.ly_width + 5;
        self.messageImageView.ly_origin = CGPointMake(x, y);
        self.messageBackgroundImageView.frame = CGRectMake(x, y, self.message.messageSize.width+ 15, self.message.messageSize.height + 15);
    }
}

#pragma mark - Getter and Setter
- (void)setMessage:(LYMessage *)message {
    [super setMessage:message];
    if (message.imagePath != nil) {
        if (message.imagePath.length > 0) {
            self.messageImageView.image = message.image;
        } else {
            // network Image
        }
        self.messageImageView.ly_size = CGSizeMake(message.messageSize.width + 10, message.messageSize.height + 10);
    }
    switch (self.message.ownerType) {
        case LYMessageOwnerTypeUnknown: {
            
            break;
        }
        case LYMessageOwnerTypeSystem: {
            
            break;
        }
        case LYMessageOwnerTypeSelf: {
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_sender_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        }
        case LYMessageOwnerTypeOther: {
            [self.messageBackgroundImageView setImage:[[UIImage imageNamed:@"message_receiver_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch]];
            break;
        }
    }
}

- (UIImageView *)messageImageView {
    if (!_messageImageView) {
        _messageImageView = [[UIImageView alloc] init];
        _messageImageView.contentMode = UIViewContentModeScaleAspectFill;
        _messageImageView.clipsToBounds = YES;
    }
    return _messageImageView;
}

@end
