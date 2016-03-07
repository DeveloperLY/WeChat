//
//  LYChatBoxMoreView.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYChatBoxMoreView.h"

@interface LYChatBoxMoreView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topLine;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation LYChatBoxMoreView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        [self addSubview:self.topLine];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    [self.scrollView setFrame:CGRectMake(0, 0.5, frame.size.width, frame.size.height - 18)];
    [self.pageControl setFrame:CGRectMake(0, self.ly_height - 18, frame.size.width, 8)];
}

#pragma mark - Public Methods
- (void)setItems:(NSMutableArray *)items {
    _items = items;
    self.pageControl.numberOfPages = items.count / 8 + 1;
    self.scrollView.contentSize = CGSizeMake(LYScreenWidth * (items.count / 8 + 1), _scrollView.ly_height);
    
    float w = self.ly_width * 20 / 21 / 4 * 0.8;
    float space = w / 4;
    float h = (self.ly_height - 20 - space * 2) / 2;
    
    float x = space, y = space;
    int i = 0, page = 0;
    for (LYChatBoxMoreItem * item in _items) {
        [self.scrollView addSubview:item];
        [item setFrame:CGRectMake(x, y, w, h)];
        [item setTag:i];
        [item addTarget:self action:@selector(didSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
        i ++;
        page = i % 8 == 0 ? page + 1 : page;
        x = (i % 4 ? x + w : page * self.ly_width) + space;
        y = (i % 8 < 4 ? space : h + space * 1.5);
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x / self.ly_width;
    [_pageControl setCurrentPage:page];
}

#pragma Event Response
- (void)pageControlClicked:(UIPageControl *)pageControl {
    [self.scrollView scrollRectToVisible:CGRectMake(pageControl.currentPage * LYScreenWidth, 0, LYScreenWidth, self.scrollView.ly_height) animated:YES];
}

- (void)didSelectedItem:(LYChatBoxMoreItem *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxMoreView:didSelectItem:)]) {
        [_delegate chatBoxMoreView:self didSelectItem:(int)sender.tag];
    }
}

#pragma mark - Getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setScrollsToTop:NO];
        [_scrollView setDelegate:self];
    }
    return _scrollView;
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

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LYScreenWidth, 0.5)];
        [_topLine setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    }
    return _topLine;
}

@end
