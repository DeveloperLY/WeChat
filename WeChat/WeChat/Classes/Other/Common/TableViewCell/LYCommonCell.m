//
//  LYCommonCell.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYCommonCell.h"

@implementation LYCommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _topLineStyle = LYCellLineStyleNone;
        _bottomLineStyle = LYCellLineStyleDefault;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.topLine.ly_y = 0;
    self.bottomLine.ly_y = self.ly_height - self.bottomLine.ly_height;
    self.bottomLineStyle = self.bottomLineStyle;
    self.topLineStyle = self.topLineStyle;
}

- (void)setTopLineStyle:(LYCellLineStyle)topLineStyle {
    _topLineStyle = topLineStyle;
    if (topLineStyle == LYCellLineStyleDefault) {
        self.topLine.ly_x = self.leftFreeSpace;
        self.topLine.ly_width = self.ly_width - self.leftFreeSpace;
        self.topLine.hidden = NO;
        
    } else if (topLineStyle == LYCellLineStyleFill) {
        self.topLine.ly_x = 0;
        self.topLine.ly_width = self.ly_width;
        self.topLine.hidden = NO;
        
    } else if (topLineStyle == LYCellLineStyleNone) {
        self.topLine.hidden = YES;
    }
}

- (void)setBottomLineStyle:(LYCellLineStyle)bottomLineStyle {
    _bottomLineStyle = bottomLineStyle;
    if (bottomLineStyle == LYCellLineStyleDefault) {
        self.bottomLine.ly_x = self.leftFreeSpace;
        self.bottomLine.ly_width = self.ly_width - self.leftFreeSpace;
        self.bottomLine.hidden = NO;
        
    } else if (bottomLineStyle == LYCellLineStyleFill) {
        self.bottomLine.ly_x = 0;
        self.bottomLine.ly_width = self.ly_width;
        self.bottomLine.hidden = NO;
        
    } else if (bottomLineStyle == LYCellLineStyleNone) {
        self.bottomLine.hidden = YES;
    }
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.ly_height = 0.5f;
        _topLine.backgroundColor = [UIColor grayColor];
        _topLine.alpha = 0.4;
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.ly_height = 0.5f;
        _bottomLine.backgroundColor = [UIColor grayColor];
        _bottomLine.alpha = 0.4;
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

@end
