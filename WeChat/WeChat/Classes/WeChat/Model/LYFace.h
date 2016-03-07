//
//  LYFace.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LYFaceType) {
    LYFaceTypeEmoji,
    LYFaceTypeGIF,
};

@interface LYFace : NSObject

/** faceID */
@property (nonatomic, copy) NSString *faceID;
/** face名称 */
@property (nonatomic, copy) NSString *faceName;

@end

@interface LYFaceGroup : NSObject

/** 表情类型 */
@property (nonatomic, assign) LYFaceType faceType;
/** 组ID */
@property (nonatomic, copy) NSString *groupID;
/** 组图片名称 */
@property (nonatomic, copy) NSString *groupImageName;
/** 表情数组 */
@property (nonatomic, strong) NSArray *facesArray;

@end