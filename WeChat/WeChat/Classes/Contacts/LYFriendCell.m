//
//  LYFriendCell.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYFriendCell.h"
#import "LYUser.h"

@interface LYFriendCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *usernameLabel;

@end

@implementation LYFriendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.avatarImageView];
        [self addSubview:self.usernameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    self.leftFreeSpace = self.ly_height * 0.18;
    [super layoutSubviews];
    
    CGFloat spaceX = self.ly_height * 0.18;
    CGFloat spaceY = self.ly_height * 0.17;
    CGFloat imageWidth = self.ly_height - spaceY * 2;
    self.avatarImageView.frame = CGRectMake(spaceX, spaceY, imageWidth, imageWidth);
    
    CGFloat labelX = imageWidth + spaceX * 2;
    CGFloat labelWidth = self.ly_width - labelX - spaceX * 1.5;
    self.usernameLabel.frame = CGRectMake(labelX, spaceY, labelWidth, imageWidth);
}

- (void)setUser:(LYUser *)user {
    self.avatarImageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@", user.avatarURL]];
    self.usernameLabel.text = user.username;
}

#pragma mark - Getter and Setter
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
    }
    return _avatarImageView;
}

- (UILabel *)usernameLabel {
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.font = [UIFont systemFontOfSize:17.0f];
    }
    return _usernameLabel;
}

@end
