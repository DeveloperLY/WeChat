//
//  LYChatBoxFaceView.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFace.h"

@protocol LYChatBoxFaceViewDelegate <NSObject>

- (void) chatBoxFaceViewDidSelectedFace:(LYFace *)face type:(LYFaceType)type;

- (void) chatBoxFaceViewDeleteButtonDown;

- (void) chatBoxFaceViewSendButtonDown;

@end

@interface LYChatBoxFaceView : UIView

@property (nonatomic, weak) id <LYChatBoxFaceViewDelegate> delegate;

@end
