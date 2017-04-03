//
//  UIImage+LY.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LY)

/**
 *  加载最原始的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 返回最原始图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

/**
 *  根据颜色生成图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
