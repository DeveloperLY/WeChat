//
//  UIDevice+LY.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "UIDevice+LY.h"

@implementation UIDevice (LY)

+ (LYDeviceVerType)deviceVerType {
    if (LYScreenWidth == 375) {
        return LYDeviceVer6;
    }else if (LYScreenWidth == 414){
        return LYDeviceVer6P;
    }else if(LYScreenHeight == 480){
        return LYDeviceVer4;
    }else if (LYScreenHeight == 568){
        return LYDeviceVer5;
    }
    return LYDeviceVer4;
}

@end
