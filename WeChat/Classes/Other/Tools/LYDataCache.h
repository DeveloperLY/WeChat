//
//  LYDataCache.h
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYDataCache : NSObject

// 本地数据缓存
+ (void)setCacheData:(id)data forKey:(NSString *)key;

// 取出本地缓存数据
+ (id)loadCacheData:(NSString *)key;

@end
