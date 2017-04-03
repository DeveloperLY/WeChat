//
//  LYMeDetailViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYMeDetailViewController.h"
#import "LYUIHelper.h"

@interface LYMeDetailViewController ()

@end

@implementation LYMeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"个人信息"];
    self.data = [LYUIHelper getMineDetailVCItems];
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
