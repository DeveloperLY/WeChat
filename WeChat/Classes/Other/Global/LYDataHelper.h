//
//  LYDataHelper.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYDataHelper : NSObject

/**
 *  格式化好友列表
 */
+ (NSMutableArray *)getFriendListDataBy:(NSMutableArray *)array;
+ (NSMutableArray *)getFriendListSectionBy:(NSMutableArray *)array;

@end
