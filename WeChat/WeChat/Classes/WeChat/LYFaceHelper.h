//
//  LYFaceHelper.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYFace.h"

@interface LYFaceHelper : NSObject

/** 表情组数组 */
@property (nonatomic, strong) NSMutableArray *faceGroupArray;

+ (instancetype)shareFaceHelper;

- (NSArray *)getFaceArrayByGroupID:(NSString *)groupID;

@end
