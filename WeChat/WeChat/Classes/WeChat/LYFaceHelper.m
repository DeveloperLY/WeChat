//
//  LYFaceHelper.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYFaceHelper.h"

static LYFaceHelper *_instance = nil;

@implementation LYFaceHelper

#pragma mark - 单例
+ (instancetype)shareFaceHelper
{
    if (!_instance) {
        _instance = [[self alloc] init];
    }
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark - Public Methods
- (NSArray *)getFaceArrayByGroupID:(NSString *)groupID {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:groupID ofType:@"plist"]];
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *dic in array) {
        LYFace *face = [[LYFace alloc] init];
        face.faceID = [dic objectForKey:@"face_id"];
        face.faceName = [dic objectForKey:@"face_name"];
        [data addObject:face];
    }
    return data;
}

#pragma mrak - Getter
- (NSMutableArray *)faceGroupArray {
    if (!_faceGroupArray) {
        _faceGroupArray = [[NSMutableArray alloc] init];
        LYFaceGroup *group = [[LYFaceGroup alloc] init];
        group.faceType = LYFaceTypeEmoji;
        group.groupID = @"normal_face";
        group.groupImageName = @"EmotionsEmojiHL";
        group.facesArray = nil;
        [_faceGroupArray addObject:group];
    }
    return _faceGroupArray;
}

@end
