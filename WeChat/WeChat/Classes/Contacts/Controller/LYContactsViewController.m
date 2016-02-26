//
//  LYContactsViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYContactsViewController.h"

@interface LYContactsViewController ()

@end

@implementation LYContactsViewController

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
    self.navigationItem.title = @"通讯录";
    
}

@end
