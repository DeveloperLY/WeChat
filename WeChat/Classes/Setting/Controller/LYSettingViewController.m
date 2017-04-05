//
//  LYSettingViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYSettingViewController.h"
#import "LYNewNotiViewController.h"
#import "LYLoginAndRegisterViewController.h"

#import "LYCellItem.h"
#import "LYUIHelper.h"

@interface LYSettingViewController ()

@end

@implementation LYSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    
    // data
    self.data = [LYUIHelper getSettingVCItems];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id vc = nil;
    LYCellGrounp *group = [self.data objectAtIndex:indexPath.section];
    LYCellItem *item = [group itemAtIndex: indexPath.row];
    if ([item.title isEqualToString:@"新消息通知"]) {
        vc = [[LYNewNotiViewController alloc] init];
    } else if ([item.title isEqualToString:@"退出登录"]) {
        WeakSelf
        [[EMClient sharedClient] logout:YES completion:^(EMError *aError) {
            if (!aError) {
                [[LYIdentityManager manager] logOut];
                weakSelf.view.window.rootViewController = [[LYLoginAndRegisterViewController alloc] init];
                [SVProgressHUD showSuccessWithStatus:@"退出成功"];
            } else {
                [SVProgressHUD showErrorWithStatus:aError.errorDescription];
            }
        }];
    }
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
