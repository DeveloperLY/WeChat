//
//  LYTabBarController.m
//  WeChat
//
//  Created by Y Liu on 16/2/22.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYNavigationController.h"

#import "LYWeChatViewController.h"
#import "LYContactsViewController.h"
#import "LYDiscoverViewController.h"
#import "LYMeViewController.h"

#import "UIImage+LY.h"

@interface LYTabBarController ()

@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    
    // 添加所有的子控件
    [self setUpAllChildViewController];
    
}

#pragma mark - setUpAllChildViewController
/**
 *  添加所有的子控制器方法
 */
- (void)setUpAllChildViewController {
    // 微信
    LYWeChatViewController *weChatVC = [[LYWeChatViewController alloc] init];
    [self setUpOneChildViewController:weChatVC image:[UIImage imageWithOriginalImageName:@"tabbar_mainframe"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_mainframeHL"] title:@"微信"];
    
    // 通讯录
    LYContactsViewController *contactsVC = [[LYContactsViewController alloc] init];
    [self setUpOneChildViewController:contactsVC image:[UIImage imageWithOriginalImageName:@"tabbar_contacts"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_contactsHL"] title:@"通讯录"];
    
    // 发现
    LYDiscoverViewController *discoverVC = [[LYDiscoverViewController alloc] init];
    [self setUpOneChildViewController:discoverVC image:[UIImage imageWithOriginalImageName:@"tabbar_discover"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_discoverHL"] title:@"发现"];
    
    // 我
    LYMeViewController *meVC = [[LYMeViewController alloc] init];
    [self setUpOneChildViewController:meVC image:[UIImage imageWithOriginalImageName:@"tabbar_me"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_meHL"] title:@"我"];
}

/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title {
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectImage;
    viewController.tabBarItem.title = title;
    
    LYNavigationController *navC = [[LYNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navC];
}

@end
