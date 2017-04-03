//
//  LYNewsNotiViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYNewNotiViewController.h"
#import "LYUIHelper.h"

@interface LYNewNotiViewController ()

@end

@implementation LYNewNotiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新消息通知";
    
    self.data = [LYUIHelper getNewNotiVCItems];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
