//
//  LYChatBoxMoreView.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYChatBoxMoreItem.h"

typedef NS_ENUM(NSInteger, LYChatBoxItem) {
    LYChatBoxItemAlbum = 0,
    LYChatBoxItemCamera,
};


@class LYChatBoxMoreView;

@protocol LYChatBoxMoreViewDelegate <NSObject>

- (void)chatBoxMoreView:(LYChatBoxMoreView *)chatBoxMoreView didSelectItem:(LYChatBoxItem)itemType;

@end

@interface LYChatBoxMoreView : UIView

@property (nonatomic, weak) id<LYChatBoxMoreViewDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *items;

@end
