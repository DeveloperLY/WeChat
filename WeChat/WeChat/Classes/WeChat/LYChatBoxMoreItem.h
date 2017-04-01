//
//  LYChatBoxMoreItem.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYChatBoxMoreItem : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;

+ (instancetype)createChatBoxMoreItemWithTitle:(NSString *)title imageName:(NSString *)imageName;

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
