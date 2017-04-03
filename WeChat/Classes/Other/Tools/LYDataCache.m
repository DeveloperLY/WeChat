//
//  LYDataCache.m
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYDataCache.h"

@implementation LYDataCache

// 对象的序列化归档存储
+ (void)setCacheData:(id)data forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setValue:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 解归档取出本地缓存数据
+ (id)loadCacheData:(NSString *)key {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] valueForKey:key]];
}

@end
