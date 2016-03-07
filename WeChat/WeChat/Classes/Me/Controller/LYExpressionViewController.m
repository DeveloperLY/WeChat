//
//  LYExpressionViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYExpressionViewController.h"

@interface LYExpressionViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;

@end

@implementation LYExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    [self setHidesBottomBarWhenPushed:YES];
    
    self.navigationItem.titleView = self.segmentedControl;
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
}

#pragma mark - Event Response
- (void)rightBarButtonDown {
    NSLog(@"%s", __func__);
}

- (void)segmentedControlChanged:(UISegmentedControl *)segmentedControl {
    NSLog(@"%s", __func__);
}

#pragma mark - Getter and Setter
- (UISegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"精选表情", @"投稿表情"]];
        _segmentedControl.ly_width = LYScreenWidth * 0.6;
        _segmentedControl.selectedSegmentIndex = 0;
        [_segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (UIBarButtonItem *)rightBarButtonItem {
    if (!_rightBarButtonItem) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}

@end
