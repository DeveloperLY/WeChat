//
//  LYIdentityManager.h
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYIdentityObject;

@interface LYIdentityManager : NSObject

//  管理的身份属性对象
@property (strong,nonatomic) LYIdentityObject *identityObject;

//  类方法创建单例对象
+ (instancetype) manager;

//  本地读取登录缓存信息
- (void)readAuthorizeData;

//  本地存入登录信息
- (void)saveAuthorizeData;

//  退出登录
- (void)logOut;

@end
