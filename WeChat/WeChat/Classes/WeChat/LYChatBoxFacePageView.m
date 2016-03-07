//
//  LYChatBoxFacePageView.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYChatBoxFacePageView.h"

@interface LYChatBoxFacePageView ()

@property (nonatomic, strong) UIButton *delButton;

@property (nonatomic, strong) NSMutableArray *faceViewArray;

@end

@implementation LYChatBoxFacePageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.delButton];
    }
    return self;
}

#pragma mark - Public Methods
- (void)showFaceGroup:(LYFaceGroup *)group formIndex:(NSInteger)fromIndex count:(NSInteger)count {
    NSInteger index = 0;
    CGFloat spaceX = 12;
    CGFloat spaceY = 10;
    NSInteger row = (group.faceType == LYFaceTypeEmoji ? 3 : 2);
    NSInteger col = (group.faceType == LYFaceTypeEmoji ? 7 : 4);
    CGFloat w = (LYScreenWidth - spaceX * 2) / col;
    CGFloat h = (self.ly_height - spaceY * (row - 1)) / row;
    CGFloat x = spaceX;
    CGFloat y = spaceY;
    for (NSInteger i = fromIndex; i < fromIndex + count; i ++) {
        UIButton *button;
        if (index < self.faceViewArray.count) {
            button = [self.faceViewArray objectAtIndex:index];
        } else {
            button = [[UIButton alloc] init];
            [button addTarget:_target action:_action forControlEvents:_controlEvents];
            [self addSubview:button];
            [self.faceViewArray addObject:button];
        }
        index ++;
        
        if (i >= group.facesArray.count || i < 0) {
            [button setHidden:YES];
        } else {
            LYFace *face = [group.facesArray objectAtIndex:i];
            button.tag = i;
            [button setImage:[UIImage imageNamed:face.faceName] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(x, y, w, h)];
            [button setHidden:NO];
            x = (index % col == 0 ? spaceX: x + w);
            y = (index % col == 0 ? y + h : y);
        }
    }
    [_delButton setHidden:fromIndex >= group.facesArray.count];
    [_delButton setFrame:CGRectMake(x, y, w, h)];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    _target = target;
    _action = action;
    _controlEvents = controlEvents;
    [self.delButton addTarget:_target action:_action forControlEvents:_controlEvents];
    for (UIButton *button in self.faceViewArray) {
        [button addTarget:target action:action forControlEvents:controlEvents];
    }
}

#pragma mark - Getter
- (NSMutableArray *)faceViewArray {
    if (!_faceViewArray) {
        _faceViewArray = [[NSMutableArray alloc] init];
    }
    return _faceViewArray;
}

- (UIButton *)delButton {
    if (!_delButton) {
        _delButton = [[UIButton alloc] init];
        _delButton.tag = -1;
        [_delButton setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
    }
    return _delButton;
}


@end
