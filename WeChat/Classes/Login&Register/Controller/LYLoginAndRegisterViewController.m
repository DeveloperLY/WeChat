//
//  LYLogin&RegisterViewController.m
//  WeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYLoginAndRegisterViewController.h"
#import "LYTabBarController.h"

@interface LYLoginAndRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LYLoginAndRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerButtonDidTouch:(UIButton *)sender {
    NSString *account = self.accountTextField.text;
    NSString *password = self.passwordTextField.text;
    if (!kStringIsEmpty(account) && !kStringIsEmpty(password)) {
        [[EMClient sharedClient] registerWithUsername:account password:[NSString stringWithFormat:@"lywechat%@", password].md5String completion:^(NSString *aUsername, EMError *aError) {
            if (!aError) {
                [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            } else {
                [SVProgressHUD showErrorWithStatus:aError.errorDescription];
            }
        }];
    } else {
        [SVProgressHUD showInfoWithStatus:@"用户名或密码不能为空"];
    }
    [self.view endEditing:YES];
}

- (IBAction)loginButtonDidTouch:(UIButton *)sender {
    NSString *account = self.accountTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@", [NSString stringWithFormat:@"lywechat%@", password].md5String);
    WeakSelf
    if (!kStringIsEmpty(account) && !kStringIsEmpty(password)) {
        BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
        if (isAutoLogin) {
            return;
        }
        [[EMClient sharedClient] loginWithUsername:account password:[NSString stringWithFormat:@"lywechat%@", password].md5String completion:^(NSString *aUsername, EMError *aError) {
            if (!aError) {
                [[EMClient sharedClient] setApnsNickname:aUsername];
                [[EMClient sharedClient].options setIsAutoLogin:YES];
                //记录登录信息
                [LYIdentityManager manager].identityObject.userName = aUsername;
                [[LYIdentityManager manager] saveAuthorizeData];
                
                weakSelf.view.window.rootViewController = [[LYTabBarController alloc] init];
                
                [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            } else {
                [SVProgressHUD showErrorWithStatus:aError.errorDescription];
            }
        }];
    } else {
        [SVProgressHUD showInfoWithStatus:@"用户名或密码不能为空"];
    }
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
