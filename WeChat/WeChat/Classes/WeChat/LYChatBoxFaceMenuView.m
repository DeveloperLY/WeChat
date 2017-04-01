//
//  LYChatBoxFaceMenuView.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYChatBoxFaceMenuView.h"

@interface LYChatBoxFaceMenuView ()

@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *faceMenuViewArray;

@end

@implementation LYChatBoxFaceMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.addButton];
        [self addSubview:self.scrollView];
    }
    return self;
}

#pragma mark - Public Methods
- (void)setFaceGroupArray:(NSMutableArray *)faceGroupArray {
    _faceGroupArray = faceGroupArray;
    CGFloat w = self.ly_height * 1.25;
    [self.addButton setFrame:CGRectMake(0, 0, w, self.ly_height)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(w, 6, 0.5, self.ly_height - 12)];
    [line setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    [self addSubview:line];
    [self.sendButton setFrame:CGRectMake(self.ly_width - w * 1.2, 0, w * 1.2, self.ly_height)];
    
    [self.scrollView setFrame:CGRectMake(w + 0.5, 0, self.ly_width - self.addButton.ly_width, self.ly_height)];
    [self.scrollView setContentSize:CGSizeMake(w * (faceGroupArray.count + 3), self.scrollView.ly_height)];
    CGFloat x = 0;
    int i = 0;
    for (LYFaceGroup *group in faceGroupArray) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, w, self.ly_height)];
        [button.imageView setContentMode:UIViewContentModeCenter];
        [button setImage:[UIImage imageNamed:group.groupImageName] forState:UIControlStateNormal];
        [button setTag:i ++];
        [button addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
        [self.faceMenuViewArray addObject:button];
        [self.scrollView addSubview:button];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(button.ly_x + button.ly_width, 6, 0.5, self.ly_height - 12)];
        [line setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
        [self.scrollView addSubview:line];
        x += button.ly_width + 0.5;
    }
    [self buttonDown:[self.faceMenuViewArray firstObject]];
}

#pragma mark - Event Response
- (void)buttonDown:(UIButton *)sender {
    if (sender.tag == -1) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuViewAddButtonDown)]) {
            [_delegate chatBoxFaceMenuViewAddButtonDown];
        }
    } else if (sender.tag == -2) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuViewSendButtonDown)]) {
            [_delegate chatBoxFaceMenuViewSendButtonDown];
        }
    } else {
        for (UIButton *button in self.faceMenuViewArray) {
            [button setBackgroundColor:[UIColor whiteColor]];
        }
        [sender setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        if ([[_faceGroupArray objectAtIndex:sender.tag] faceType] == LYFaceTypeEmoji) {
            [self addSubview:self.sendButton];
            self.scrollView.ly_width = self.ly_width - self.addButton.ly_width - self.sendButton.ly_width - 1;
        } else {
            [self.sendButton removeFromSuperview];
            self.scrollView.ly_width = self.ly_width - self.addButton.ly_width - 0.5;
        }
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuView:didSelectedFaceMenuIndex:)]) {
            [_delegate chatBoxFaceMenuView:self didSelectedFaceMenuIndex:sender.tag];
        }
    }
}

#pragma mark - Getter
- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        _addButton.tag = -1;
        [_addButton setImage:[UIImage imageNamed:@"Card_AddIcon"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
    }
    return _addButton;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] init];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_sendButton setBackgroundColor:[UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:1.0]];
        _sendButton.tag = -2;
        [_sendButton addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
    }
    return _sendButton;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setScrollsToTop:NO];
    }
    return _scrollView;
}

- (NSMutableArray *)faceMenuViewArray {
    if (!_faceMenuViewArray) {
        _faceMenuViewArray = [[NSMutableArray alloc] init];
    }
    return _faceMenuViewArray;
}

@end
