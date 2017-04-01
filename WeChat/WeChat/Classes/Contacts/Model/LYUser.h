//
//  LYUser.h
//  WeChat
//
//  Created by Y Liu on 16/2/24.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYUser : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *avatarURL;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *motto;

@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *initial;

@end
