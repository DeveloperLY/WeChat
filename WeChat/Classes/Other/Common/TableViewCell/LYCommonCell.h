//
//  LYCommonCell.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LYCellLineStyle) {
    LYCellLineStyleDefault,
    LYCellLineStyleFill,
    LYCellLineStyleNone
};

@interface LYCommonCell : UITableViewCell

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, assign) CGFloat leftFreeSpace;

@property (nonatomic, assign) LYCellLineStyle bottomLineStyle;
@property (nonatomic, assign) LYCellLineStyle topLineStyle;

@end
