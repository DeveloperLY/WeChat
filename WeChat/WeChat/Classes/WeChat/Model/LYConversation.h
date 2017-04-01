//
//  LYConversation.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYConversation : NSObject

@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSUInteger messageCount;
@property (nonatomic, copy) NSURL *avatarURL;

@end
