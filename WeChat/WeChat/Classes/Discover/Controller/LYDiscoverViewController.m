//
//  LYDiscoverViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYDiscoverViewController.h"

@interface LYDiscoverViewController ()

@end

@implementation LYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
}

/**
 *  设置导航条
 */
- (void)setUpNavBar {
    // title
    self.navigationItem.title = @"发现";
    
}

@end
