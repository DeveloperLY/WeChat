//
//  UIView+LY.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LY)

@property (nonatomic, assign) CGFloat ly_centerX;
@property (nonatomic, assign) CGFloat ly_centerY;

@property (nonatomic, assign) CGFloat ly_x;
@property (nonatomic, assign) CGFloat ly_y;

@property (nonatomic, assign) CGFloat ly_width;
@property (nonatomic, assign) CGFloat ly_height;

@property (nonatomic, assign) CGSize ly_size;
@property (nonatomic, assign) CGPoint ly_origin;

@property (nonatomic, assign) CGFloat frameRight;
@property (nonatomic, assign) CGFloat frameBottom;

- (NSString *)getNametag;

- (void)setNametag:(NSString *)theNametag;

- (UIView *)viewNamed:(NSString *)aName;

- (BOOL)containsSubView:(UIView *)subView;

- (BOOL)containsSubViewOfClassType:(Class)aClass;

@end
