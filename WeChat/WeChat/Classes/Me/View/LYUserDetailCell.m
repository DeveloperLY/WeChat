//
//  LYUserDetailCell.m
//  WeChat
//
//  Created by Y Liu on 16/2/24.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYUserDetailCell.h"
#import "LYUser.h"

@interface LYUserDetailCell ()

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *userIDLabel;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;

@end

@implementation LYUserDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.usernameLabel];
        [self addSubview:self.userIDLabel];
        [self addSubview:self.nicknameLabel];
        [self addSubview:self.avatarImageView];
    }
    return self;
}

- (void)layoutSubviews {
    self.leftFreeSpace = self.ly_width * 0.05;
    [super layoutSubviews];
    
    CGFloat spaceX = self.ly_width * 0.04;
    CGFloat spaceY = self.ly_height * 0.15;
    CGFloat imageWH = self.ly_height - spaceY * 2;
    self.avatarImageView.frame = CGRectMake(spaceX, spaceY, imageWH, imageWH);
    
    CGFloat labelX = imageWH + spaceX * 2;
    CGFloat labelWidth = self.ly_width - labelX - spaceX * 1.5;
    CGSize size = [self.userIDLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGFloat labelHeight = imageWH * 0.42;
    size.width = size.width > labelWidth ? labelWidth : size.width;
    CGFloat labelY = self.cellType == LYUserDetailCellTypeMine ? spaceY * 1.45 : spaceY;
    self.usernameLabel.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
    
    size = [self.userIDLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY += labelHeight + (_cellType == LYUserDetailCellTypeMine ? spaceY * 0.3 : spaceY * 0.2);
    self.userIDLabel.frame = CGRectMake(labelX, labelY, size.width, size.height);
    
    size = [self.nicknameLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY = self.userIDLabel.ly_y + self.userIDLabel.ly_height + spaceY * 0.15;
    self.nicknameLabel.frame = CGRectMake(labelX, labelY, size.width, size.height);
}

#pragma mark - Getter and Setter

- (void)setUser:(LYUser *)user {
    _user = user;
    self.avatarImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", user.avatarURL]];
    if (user.username && user.username.length > 0) {
        self.usernameLabel.text = user.username;
        if (user.nickname && user.nickname.length > 0) {
            self.nicknameLabel.text = [NSString stringWithFormat:@"昵称：%@", user.nickname];
        } else {
            self.nicknameLabel.text = @"";
        }
    } else if (user.nickname && user.nickname.length > 0) {
        self.usernameLabel.text = user.nickname;
    }
    
    if (user.userID && user.userID.length > 0) {
        self.userIDLabel.text = [NSString stringWithFormat:@"微信号：%@", user.userID];
    } else {
        self.userIDLabel.text = @"";
    }
}

- (void)setCellType:(LYUserDetailCellType)cellType {
    _cellType = cellType;
    switch (cellType) {
        case LYUserDetailCellTypeContacts: {
            _userIDLabel.textColor = DEFAULT_TEXT_GRAY_COLOR;
            _userIDLabel.font = [UIFont systemFontOfSize:13.0f];
            break;
        }
        case LYUserDetailCellTypeMine: {
            _userIDLabel.textColor = [UIColor blackColor];
            _userIDLabel.font = [UIFont systemFontOfSize:14.0f];
            _nicknameLabel.hidden = YES;
            break;
        }
    }
    [self sizeToFit];
}

- (UILabel *)usernameLabel {
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.font = [UIFont systemFontOfSize:17.0f];
    }
    return _usernameLabel;
}

- (UILabel *)userIDLabel {
    if (!_userIDLabel) {
        _userIDLabel = [[UILabel alloc] init];
        _userIDLabel.font = [UIFont systemFontOfSize:14.0f];
        _userIDLabel.textColor = DEFAULT_TEXT_GRAY_COLOR;
    }
    return _userIDLabel;
}

- (UILabel *)nicknameLabel {
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc] init];
        _nicknameLabel.font = [UIFont systemFontOfSize:13.0f];
        _nicknameLabel.textColor = DEFAULT_TEXT_GRAY_COLOR;
    }
    return _nicknameLabel;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 5.0f;
    }
    return _avatarImageView;
}

@end
