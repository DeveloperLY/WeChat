//
//  LYNavigationController.m
//  WeChat
//
//  Created by Y Liu on 16/2/22.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYNavigationController.h"

@interface LYNavigationController ()

@end

@implementation LYNavigationController

+ (void)initialize
{
    // 获取当前导航控制器下的导航条
    //    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    // 统一设置导航条主题颜色
    navBar.barTintColor = DEFAULT_NAVBAR_COLOR;
    navBar.tintColor = [UIColor whiteColor];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:dict];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    
}

@end
