//
//  AppDelegate.m
//  WeChat
//
//  Created by Y Liu on 16/2/22.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "AppDelegate.h"
#import "LYTabBarController.h"
#import "LYLoginAndRegisterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createDefaultDocumentIfNeed];
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"1103170402178540#lywechat"];
    options.apnsCertName = @"APNs_development";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    // 加载窗口
    [self setUpRootViewController];
    
    return YES;
}

- (void)setUpRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 判断用户是否登录
    if (![[EMClient sharedClient] isLoggedIn] && !kStringIsEmpty(self.identityManager.identityObject.userName)) {
        self.window.rootViewController = [[LYLoginAndRegisterViewController alloc] init];
    } else {
        self.window.rootViewController = [[LYTabBarController alloc] init];
    }
    
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private Methods
- (void)createDefaultDocumentIfNeed {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    if (![fileManager isExecutableFileAtPath:PATH_CHATREC_IMAGE]) {
        [fileManager createDirectoryAtPath:PATH_CHATREC_IMAGE withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog([self class], @"createDefaultDocumentIfNeed", error);
        }
    }
}

#pragma mark - Setter And Getter
- (LYIdentityManager *)identityManager {
    if (!_identityManager) {
        _identityManager = [LYIdentityManager manager];
        [_identityManager readAuthorizeData];
        //保存当前的版本号
        _identityManager.identityObject.currentSoftVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        [_identityManager saveAuthorizeData];
    }
    return _identityManager;
}

@end
