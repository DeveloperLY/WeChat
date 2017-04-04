//
//  LYIdentityObject.h
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

// 用来判断用户是否登录，没有存放在数据库，归档处理
@interface LYIdentityObject : NSObject

// 当前登录的用户ID
@property (nonatomic, copy) NSString *userName;
// 是不是第一次使用此软件
@property (assign,nonatomic, getter=isFirstUseSoft) BOOL firstUseSoft;
// 当前安装的软件版本号
@property (strong,nonatomic) NSString *currentSoftVersion;

@end
