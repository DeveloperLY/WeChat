//
//  LYMeViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYMeViewController.h"

@interface LYMeViewController ()

@end

@implementation LYMeViewController

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
    self.navigationItem.title = @"我";

}

@end
