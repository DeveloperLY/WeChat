//
//  MBProgressHUD+LYAdd.h
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LYAdd)

extern NSString * const kMBProgressHUDMsgLoading;
extern NSString * const kMBProgressHUDMsgLoadError;
extern NSString * const kMBProgressHUDMsgLoadSuccessful;
extern NSString * const kMBProgressHUDMsgNoMoreData;
extern NSTimeInterval kMBProgressHUDHideTimeInterval;

typedef NS_ENUM(NSUInteger, MBProgressHUDMsgType) {
    MBProgressHUDMsgTypeSuccessful,
    MBProgressHUDMsgTypeError,
    MBProgressHUDMsgTypeWarning,
    MBProgressHUDMsgTypeInfo
};

/**
 *  @brief  添加一个带菊花的HUD
 *
 *  @param view  目标view
 *  @param title 标题
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ly_showHUDAddedTo:(UIView *)view title:(NSString *)title;
/** 添加一个带菊花的HUD */
+ (MBProgressHUD *)ly_showHUDAddedTo:(UIView *)view
                                title:(NSString *)title
                             animated:(BOOL)animated;

/**
 *  @brief  隐藏指定的HUD
 *
 *  @param afterSecond 多少秒后
 */
- (void)ly_hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)ly_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)ly_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(MBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个自定的HUD
 *
 *  @param title       标题
 *  @param view        目标view
 *  @param afterSecond 持续时间
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ly_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond;
/** 显示一个自定的HUD */
+ (MBProgressHUD *)ly_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond
                         msgType:(MBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个渐进式的HUD
 *
 *  @param view 目标view
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ly_showDeterminateHUDTo:(UIView *)view;

/** 配置本扩展的默认参数 */
+ (void)ly_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity;

@end
