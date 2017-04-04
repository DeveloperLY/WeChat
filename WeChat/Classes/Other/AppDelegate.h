//
//  AppDelegate.h
//  WeChat
//
//  Created by Y Liu on 16/2/22.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** 登录用户的管理 */
@property (strong,nonatomic) LYIdentityManager *identityManager;


@end

