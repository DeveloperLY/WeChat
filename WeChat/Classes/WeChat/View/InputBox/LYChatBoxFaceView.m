//
//  LYChatBoxFaceView.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYChatBoxFaceView.h"
#import "LYChatBoxFaceMenuView.h"
#import "LYChatBoxFacePageView.h"
#import "LYFaceHelper.h"

#define     HEIGHT_BOTTOM_VIEW          36.0f

@interface LYChatBoxFaceView () <LYChatBoxFaceMenuViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) LYFaceGroup *curGroup;
@property (nonatomic, assign) NSInteger curPage;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) LYChatBoxFaceMenuView *faceMenuView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *facePageViewArray;

@end

@implementation LYChatBoxFaceView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        [self addSubview:self.topLine];
        [self addSubview:self.faceMenuView];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.scrollView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - HEIGHT_BOTTOM_VIEW - 18)];
    [self.pageControl setFrame:CGRectMake(0, self.scrollView.ly_height + 3, frame.size.width, 8)];
    for (LYChatBoxFacePageView *pageView in self.facePageViewArray) {
        [self.scrollView addSubview:pageView];
    }
}

#pragma mark - TLChatBoxFaceMenuViewDelegate
- (void)chatBoxFaceMenuView:(LYChatBoxFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index {
    _curGroup = [[[LYFaceHelper shareFaceHelper] faceGroupArray] objectAtIndex:index];
    if (_curGroup.facesArray == nil) {
        _curGroup.facesArray = [[LYFaceHelper shareFaceHelper] getFaceArrayByGroupID:_curGroup.groupID];
    }
    [self reloadScrollView];
}

- (void)chatBoxFaceMenuViewSendButtonDown {
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

- (void)chatBoxFaceMenuViewAddButtonDown {
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewSendButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / self.ly_width;
    if (page > _curPage && (page * LYScreenWidth - scrollView.contentOffset.x) < LYScreenWidth * 0.2) {       // 向右翻
        [self showFaceFageAtIndex:page];
    } else if (page < _curPage && (scrollView.contentOffset.x - page * LYScreenWidth) < LYScreenWidth * 0.2) {
        [self showFaceFageAtIndex:page];
    }
}

#pragma mark - Event Response
- (void)didSelectedFace:(UIButton *)sender {
    if (sender.tag == -1) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
            [_delegate chatBoxFaceViewDeleteButtonDown];
        }
    } else {
        LYFace *face = [_curGroup.facesArray objectAtIndex:sender.tag];
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDidSelectedFace:type:)]) {
            [_delegate chatBoxFaceViewDidSelectedFace:face type:_curGroup.faceType];
        }
    }
}

- (void)pageControlClicked:(UIPageControl *)pageControl {
    [self showFaceFageAtIndex:pageControl.currentPage];
    [self.scrollView scrollRectToVisible:CGRectMake(pageControl.currentPage * LYScreenWidth, 0, LYScreenWidth, self.scrollView.ly_height) animated:YES];
}

#pragma mark - Private Methods
- (void)reloadScrollView {
    NSInteger page = (int)(self.curGroup.facesArray.count / (self.curGroup.faceType == LYFaceTypeEmoji ? 20 : 8)) + (int)(self.curGroup.facesArray.count % (self.curGroup.faceType == LYFaceTypeEmoji ? 20 : 8));
    [self.pageControl setNumberOfPages:page];
    [self.scrollView setContentSize:CGSizeMake(LYScreenWidth * page, self.scrollView.ly_height)];
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, LYScreenWidth, self.scrollView.ly_height) animated:NO];
    _curPage = -1;
    [self showFaceFageAtIndex:0];
}

- (void)showFaceFageAtIndex:(NSUInteger)index {
    if (index == _curPage) {
        return;
    }
    [self.pageControl setCurrentPage:index];
    NSInteger count = _curGroup.faceType == LYFaceTypeEmoji ? 20 : 8;
    if (_curPage == -1) {
        LYChatBoxFacePageView *pageView1 = [self.facePageViewArray objectAtIndex:0];
        [pageView1 showFaceGroup:_curGroup formIndex:0 count:0];
        [pageView1 setLy_origin:CGPointMake(-LYScreenWidth, 0)];
        [pageView1 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        LYChatBoxFacePageView *pageView2 = [self.facePageViewArray objectAtIndex:1];
        [pageView2 showFaceGroup:_curGroup formIndex:0 count:count];
        [pageView2 setLy_origin:CGPointMake(0, 0)];
        [pageView2 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        LYChatBoxFacePageView *pageView3 = [self.facePageViewArray objectAtIndex:2];
        [pageView3 showFaceGroup:_curGroup formIndex:count count:count];
        [pageView3 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        [pageView3 setLy_origin:CGPointMake(LYScreenWidth, 0)];
    } else {
        if (_curPage < index) {
            LYChatBoxFacePageView *pageView1 = [self.facePageViewArray objectAtIndex:0];
            [pageView1 showFaceGroup:_curGroup formIndex:(index + 1) * count count:count];
            [pageView1 setLy_origin:CGPointMake((index + 1) * LYScreenWidth, 0)];
            [self.facePageViewArray removeObjectAtIndex:0];
            [self.facePageViewArray addObject:pageView1];
        } else {
            LYChatBoxFacePageView *pageView3 = [self.facePageViewArray objectAtIndex:2];
            [pageView3 showFaceGroup:_curGroup formIndex:(index - 1) * count count:count];
            [pageView3 setLy_origin:CGPointMake((index - 1) * LYScreenWidth, 0)];
            [self.facePageViewArray removeObjectAtIndex:2];
            [self.facePageViewArray insertObject:pageView3 atIndex:0];
        }
    }
    _curPage = (int)index;
}

#pragma mark - Getter
- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LYScreenWidth, 0.5)];
        [_topLine setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    }
    return _topLine;
}

- (LYChatBoxFaceMenuView *)faceMenuView {
    if (!_faceMenuView) {
        _faceMenuView = [[LYChatBoxFaceMenuView alloc] initWithFrame:CGRectMake(0, self.ly_height - HEIGHT_BOTTOM_VIEW, LYScreenWidth, HEIGHT_BOTTOM_VIEW)];
        [_faceMenuView setDelegate:self];
        [_faceMenuView setFaceGroupArray:[[LYFaceHelper shareFaceHelper] faceGroupArray]];
    }
    return _faceMenuView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.pageIndicatorTintColor = DEFAULT_LINE_GRAY_COLOR;
        [_pageControl addTarget:self action:@selector(pageControlClicked:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setScrollsToTop:NO];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
    }
    return _scrollView;
}

- (NSMutableArray *)facePageViewArray {
    if (!_facePageViewArray) {
        _facePageViewArray = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i < 3; i ++) {
            LYChatBoxFacePageView *view = [[LYChatBoxFacePageView alloc] initWithFrame:self.scrollView.bounds];
            [_facePageViewArray addObject:view];
        }
    }
    return _facePageViewArray;
}

@end
