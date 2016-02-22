//
//  UIImage+LY.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
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

@end
