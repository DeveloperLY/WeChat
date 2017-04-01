//
//  LYUserDetailCell.h
//  WeChat
//
//  Created by Y Liu on 16/2/24.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYCommonCell.h"

@class LYUser;

typedef NS_ENUM(NSUInteger, LYUserDetailCellType) {
    LYUserDetailCellTypeContacts,
    LYUserDetailCellTypeMine
};

@interface LYUserDetailCell : LYCommonCell

@property (nonatomic, assign) LYUserDetailCellType cellType;

@property (nonatomic, strong) LYUser *user;

@end
