//
//  UIDevice+LY.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LYDeviceVerType) {
    LYDeviceVer4,
    LYDeviceVer5,
    LYDeviceVer6,
    LYDeviceVer6P
};

@interface UIDevice (LY)

+ (LYDeviceVerType)deviceVerType;

@end
