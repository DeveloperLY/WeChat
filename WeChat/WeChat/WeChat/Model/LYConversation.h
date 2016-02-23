//
//  LYConversation.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYConversation : NSObject

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) NSUInteger messageCount;
@property (nonatomic, strong) NSURL *avatarURL;

@end
