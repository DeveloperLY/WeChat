//
//  LYBaseHeaderFooterView.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYBaseHeaderFooterView.h"

static UILabel *hLabel = nil;

@implementation LYBaseHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.userInteractionEnabled = NO;
        [self addSubview:self.titleLabel];
        self.backgroundView = [[UIView alloc] init];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = self.ly_width * 0.065;
    CGFloat w = self.ly_width * 0.89;
    CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(w, MAXFLOAT)];
    self.titleLabel.frame = CGRectMake(x, 6, w, size.height);
}

+ (CGFloat)getHeightForText:(NSString *)text {
    if (!text) {
        return 15.0f;
    }
    if (!hLabel) {
        hLabel = [[UILabel alloc] init];
        hLabel.numberOfLines = 0;
        hLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    hLabel.text = text;
    CGFloat w = LYScreenWidth * 0.92;
    return [hLabel sizeThatFits:CGSizeMake(w, MAXFLOAT)].height + 14;
}

#pragma mark - Setter or Getter
- (void)setText:(NSString *)text {
    _text = text;
    self.titleLabel.text = text;
    [self layoutSubviews];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:13.0f];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
@end
