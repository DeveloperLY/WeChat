//
//  LYChatBoxMoreItem.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYChatBoxMoreItem.h"

@interface LYChatBoxMoreItem ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LYChatBoxMoreItem
+ (instancetype)createChatBoxMoreItemWithTitle:(NSString *)title imageName:(NSString *)imageName {
    LYChatBoxMoreItem *item = [[LYChatBoxMoreItem alloc] init];
    item.title = title;
    item.imageName = imageName;
    return item;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.button];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    CGFloat w = 59;
    [self.button setFrame:CGRectMake((self.ly_width - w) / 2, 0, w, w)];
    [self.titleLabel setFrame:CGRectMake(-5, self.button.ly_width + 5, self.ly_width + 10, 15)];
}

#pragma mark - Public Method
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [self.button addTarget:target action:action forControlEvents:controlEvents];
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    [self.button setTag:tag];
}

#pragma mark - Setter
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    [self.button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

#pragma mark - Getter
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:4.0f];
        [_button.layer setBorderWidth:0.5f];
        [_button.layer setBorderColor:[UIColor grayColor].CGColor];
    }
    return _button;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_titleLabel setTextColor:[UIColor grayColor]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

@end
