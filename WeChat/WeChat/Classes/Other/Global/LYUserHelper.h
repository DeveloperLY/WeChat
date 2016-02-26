//
//  LYUserHelper.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYUser;

@interface LYUserHelper : NSObject

/** 用户 */
@property (nonatomic, strong) LYUser *user;

+ (instancetype)sharedUserHelper;

@end
