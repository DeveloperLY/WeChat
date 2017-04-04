//
//  LYIdentityObject.m
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYIdentityObject.h"

@implementation LYIdentityObject

MJExtensionCodingImplementation

// 初始化的时候设置第一次使用此软件
- (instancetype) init {
    if (self = [super init]) {
        _firstUseSoft = YES;
    }
    return self;
}

@end
