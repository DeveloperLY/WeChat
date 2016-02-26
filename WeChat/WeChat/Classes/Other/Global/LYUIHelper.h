//
//  LYUIHelper.h
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYCellGrounp;

@interface LYUIHelper : NSObject

+ (LYCellGrounp *)getFriendsListItemsGroup;

+ (NSMutableArray *)getDiscoverItems;

+ (NSMutableArray *)getMineVCItems;

+ (NSMutableArray *)getMineDetailVCItems;

@end
