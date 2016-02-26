//
//  LYFriendHeaderView.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYFriendHeaderView.h"

@interface LYFriendHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LYFriendHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
        self.backgroundView = bgView;
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(10, 0, self.ly_width - 15, self.ly_height);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.5f];
        _titleLabel.textColor = [UIColor grayColor];
    }
    return _titleLabel;
}

@end
