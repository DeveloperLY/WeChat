//
//  LYMeViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYMeViewController.h"

#import "LYCellItem.h"
#import "LYUser.h"
#import "LYUserDetailCell.h"
#import "LYUIHelper.h"
#import "LYUserHelper.h"

static NSString * const ID = @"MineCell";

@interface LYMeViewController ()

@property (nonatomic, strong) LYUser *user;

@end

@implementation LYMeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
    
    [self.tableView registerClass:[LYUserDetailCell class] forCellReuseIdentifier:ID];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    // 加载cell 数据
    [self loadData];
}

/**
 *  设置导航条
 */
- (void)setUpNavBar {
    // title
    self.navigationItem.title = @"我";

}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data ? self.data.count + 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    LYCellGrounp *group = [self.data objectAtIndex:section - 1];
    return group.itemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LYUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.user = self.user;
        cell.cellType = LYUserDetailCellTypeMine;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.topLineStyle = LYCellLineStyleFill;
        cell.bottomLineStyle = LYCellLineStyleFill;
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

#pragma mark - <UITableViewDelegate>
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - load Data
- (void)loadData {
    self.data = [LYUIHelper getMineVCItems];
    self.user = [LYUserHelper sharedUserHelper].user;
    [self.tableView reloadData];
}


@end
