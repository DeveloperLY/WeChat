//
//  LYConst.h
//  Gank.io
//
//  Created by LiuY on 2017/3/23.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

/******************** 全局常量 ********************/

/** 全局统一的间距 */
UIKIT_EXTERN CGFloat const LYMargin;

/** 统一较小的间距 */
UIKIT_EXTERN CGFloat const LYCommonSmallMargin;

/** 导航栏最大的Y值 */
UIKIT_EXTERN CGFloat const LYNavMaxY;

/** Tabbar高度 */
UIKIT_EXTERN CGFloat const LYTabBarH;

/** StatusBar高度 */
UIKIT_EXTERN CGFloat const LYStatusBarH;

/** 导航栏高度 */
UIKIT_EXTERN CGFloat const LYNavBarH;

/** 性别-未知 */
UIKIT_EXTERN NSString * const LYUserSexUnknown;

/** 性别-男 */
UIKIT_EXTERN NSString * const LYUserSexMale;

/** 性别-女 */
UIKIT_EXTERN NSString * const LYUserSexFemale;

/** 时间格式 */
UIKIT_EXTERN NSString * const LYDateFormat;

/******************** 网络状态 ********************/
typedef NS_ENUM(NSInteger, LYNetWorkStatus) {
    LYNetWorkStatusUnknown            = -1,   // 未知
    LYNetWorkStatusNotReachable       = 0,    // 无连接
    LYNetWorkStatusReachableViaWWAN   = 1,    // 蜂窝网络
    LYNetWorkStatusReachableViaWiFi   = 2,    // WiFi
};

/******************** 分享后留在微信后面返回结果通知 ********************/
UIKIT_EXTERN NSString * const LYShareResultNotification;
