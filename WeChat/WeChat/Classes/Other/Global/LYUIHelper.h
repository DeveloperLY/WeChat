//
//  LYUIHelper.h
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYCellGrounp;

@interface LYUIHelper : NSObject

+ (LYCellGrounp *)getFriendsListItemsGroup;

+ (NSMutableArray *)getDiscoverItems;

+ (NSMutableArray *)getMineVCItems;

+ (NSMutableArray *)getDetailVCItems;

+ (NSMutableArray *)getDetailSettingVCItems;

+ (NSMutableArray *)getMineDetailVCItems;

+ (NSMutableArray *)getSettingVCItems;

+ (NSMutableArray *)getNewNotiVCItems;

@end
