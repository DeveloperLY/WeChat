//
//  LYDiscoverViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYDiscoverViewController.h"

#import "LYUIHelper.h"

@interface LYDiscoverViewController ()

@end

@implementation LYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
    
    // data
    self.data = [LYUIHelper getDiscoverItems];
}

/**
 *  设置导航条
 */
- (void)setUpNavBar {
    // title
    self.navigationItem.title = @"发现";
    
}

@end
