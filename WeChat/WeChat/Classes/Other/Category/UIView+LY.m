//
//  UIView+LY.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "UIView+LY.h"

#import <objc/runtime.h>

static char nametag_key;

@implementation UIView (LY)

#pragma mark - setter
- (void)setLy_centerX:(CGFloat)ly_centerX {
    CGPoint center = self.center;
    center.x = ly_centerX;
    self.center = center;
}

- (void)setLy_centerY:(CGFloat)ly_centerY {
    CGPoint center = self.center;
    center.y = ly_centerY;
    self.center = center;
}

- (void)setLy_x:(CGFloat)ly_x {
    CGRect tempFram = self.frame;
    tempFram.origin.x = ly_x;
    self.frame = tempFram;
}

- (void)setLy_y:(CGFloat)ly_y {
    CGRect tempFram = self.frame;
    tempFram.origin.y = ly_y;
    self.frame = tempFram;
}

- (void)setLy_width:(CGFloat)ly_width {
    CGRect tempFrame = self.frame;
    tempFrame.size.width = ly_width;
    self.frame = tempFrame;
}

- (void)setLy_height:(CGFloat)ly_height {
    CGRect tempFrame = self.frame;
    tempFrame.size.height = ly_height;
    self.frame = tempFrame;
}

- (void)setLy_origin:(CGPoint)ly_origin {
    CGRect tempFrame = self.frame;
    tempFrame.origin = ly_origin;
    self.frame = tempFrame;
}

- (void)setLy_size:(CGSize)ly_size {
    CGRect tempFrame = self.frame;
    tempFrame.size = ly_size;
    self.frame = tempFrame;
}

- (void)setFrameRight:(CGFloat)frameRight {
    self.frame = CGRectMake(frameRight - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameBottom:(CGFloat)frameBottom {
    self.frame = CGRectMake(self.frame.origin.x, frameBottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

#pragma mark - getter
- (CGFloat)ly_centerX {
    return  self.center.x;
}

- (CGFloat)ly_centerY {
    return self.center.y;
}

- (CGFloat)ly_x {
    return self.frame.origin.x;
}

- (CGFloat)ly_y {
    return self.frame.origin.y;
}

- (CGFloat)ly_width {
    return self.frame.size.width;
}

- (CGFloat)ly_height {
    return self.frame.size.height;
}

- (CGPoint)ly_origin {
    return self.frame.origin;
}

- (CGSize)ly_size {
    return self.frame.size;
}

- (CGFloat)frameRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)frameBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setNametag:(NSString *)theNametag {
    objc_setAssociatedObject(self, &nametag_key, theNametag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)getNametag {
    return objc_getAssociatedObject(self, &nametag_key);
}

- (UIView *)viewWithNameTag:(NSString *)aName {
    if (!aName) return nil;
    
    // Is this the right view?
    if ([[self getNametag] isEqualToString:aName])
        return self;
    // Recurse depth first on subviews;
    for (UIView *subview in self.subviews) {
        UIView *resultView = [subview viewNamed:aName];
        if (resultView) return  resultView;
    }
    // Not found
    return nil;
}

- (UIView *)viewNamed:(NSString *)aName {
    if (!aName) return nil;
    return [self viewWithNameTag:aName];
}

- (BOOL) containsSubView:(UIView *)subView {
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL) containsSubViewOfClassType:(Class)aClass {
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:aClass]) {
            return YES;
        }
    }
    return NO;
}

@end
