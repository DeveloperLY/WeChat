//
//  LYBaseCell.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYCommonCell.h"

@class LYCellItem;

@interface LYBaseCell : LYCommonCell

@property (nonatomic, strong) LYCellItem *item;

+ (CGFloat)getHeightForText:(LYCellItem *)item;

@end
