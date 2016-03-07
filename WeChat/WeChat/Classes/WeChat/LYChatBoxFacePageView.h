//
//  LYChatBoxFacePageView.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFace.h"

@interface LYChatBoxFacePageView : UIView

@property (nonatomic, weak) id target;

@property (nonatomic, assign) SEL action;

@property (nonatomic, assign) UIControlEvents controlEvents;

- (void) showFaceGroup:(LYFaceGroup *)group formIndex:(NSInteger)fromIndex count:(NSInteger)count;

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
