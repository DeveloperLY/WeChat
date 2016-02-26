//
//  LYUser.m
//  WeChat
//
//  Created by Y Liu on 16/2/24.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYUser.h"

@implementation LYUser

- (void)setUsername:(NSString *)username {
    _username = username;
    _pinyin = username.hanzi2pinyin;
    _initial = username.pinyinInitial;
}

@end
