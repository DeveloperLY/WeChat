//
//  LYFriendCell.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYCommonCell.h"

@class LYUser;

@interface LYFriendCell : LYCommonCell

/** 模型 */
@property (nonatomic, strong) LYUser *user;

@end
