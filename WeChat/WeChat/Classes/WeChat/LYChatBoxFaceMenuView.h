//
//  LYChatBoxFaceMenuView.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFace.h"

@class LYChatBoxFaceMenuView;

@protocol LYChatBoxFaceMenuViewDelegate <NSObject>

- (void) chatBoxFaceMenuViewAddButtonDown;

- (void) chatBoxFaceMenuViewSendButtonDown;

- (void) chatBoxFaceMenuView:(LYChatBoxFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index;

@end

@interface LYChatBoxFaceMenuView : UIView

@property (nonatomic, weak) id <LYChatBoxFaceMenuViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *faceGroupArray;

@end