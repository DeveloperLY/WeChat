//
//  LYIdentityManager.m
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYIdentityManager.h"
#import "LYIdentityObject.h"
#import "LYDataCache.h"

@implementation LYIdentityManager

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

+ (instancetype)manager {
    static LYIdentityManager *identityManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        identityManager = [[LYIdentityManager alloc] init];
    });
    return identityManager;
}

// 本地读取登录缓存信息,没有则创建
- (void)readAuthorizeData {
    self.identityObject = [LYDataCache loadCacheData:@"IdentityObjectLocalCache"];
    if (!self.identityObject) {
        self.identityObject = [[LYIdentityObject alloc] init];
    }
    
}

//  本地存入登录信息
- (void) saveAuthorizeData {
    [LYDataCache setCacheData:self.identityObject forKey:@"IdentityObjectLocalCache"];
}

// 退出登录,登录重新初始化
-(void) logOut{
    self.identityObject = [[LYIdentityObject alloc] init];
    self.identityObject.firstUseSoft = NO;
    [self saveAuthorizeData];
}

@end
