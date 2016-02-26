//
//  LYUserHelper.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYUserHelper.h"
#import "LYUser.h"

@implementation LYUserHelper

#pragma mark - 单例模式
static LYUserHelper *_instance = nil;

+ (instancetype)sharedUserHelper {
    if (!_instance) {
        _instance = [[self alloc] init];
    }
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

- (LYUser *)user {
    if (!_user) {
        _user = [[LYUser alloc] init];
        _user.username = @"冰晨";
        _user.userID = @"WX774136501";
        _user.avatarURL = @"bc.jpg";
    }
    return _user;
}

@end
