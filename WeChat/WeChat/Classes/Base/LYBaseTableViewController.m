//
//  LYBaseTableViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYBaseTableViewController.h"
#import "LYCellItem.h"
#import "LYBaseCell.h"
#import "LYBaseHeaderFooterView.h"

static NSString * const cellID = @"baseCell";
static NSString * const headerFooterID = @"headerFooterID";

@interface LYBaseTableViewController ()


@end

@implementation LYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    
    [self.tableView registerClass:[LYBaseCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LYBaseHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LYCellGrounp *group = [self.data objectAtIndex:section];
    return group.itemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYCellGrounp *group = [self.data objectAtIndex:indexPath.section];
    LYCellItem *item = [group itemAtIndex:indexPath.row];
    LYBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setItem:item];
    
    // cell分割线
    if (item.type != LYCellItemTypeButton) {
        indexPath.row == 0 ? [cell setTopLineStyle:LYCellLineStyleFill] : [cell setTopLineStyle:LYCellLineStyleNone];
        indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:LYCellLineStyleFill] : [cell setBottomLineStyle:LYCellLineStyleDefault];
    } else {
        [cell setTopLineStyle:LYCellLineStyleNone];
        [cell setBottomLineStyle:LYCellLineStyleNone];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LYBaseHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterID];
    if (self.data && self.data.count > section) {
        LYCellGrounp *group = [self.data objectAtIndex:section];
        [view setText:group.headerTitle];
    }
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    LYBaseHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterID];
    if (self.data && self.data.count > section) {
        LYCellGrounp *group = [self.data objectAtIndex:section];
        [view setText:group.footerTitle];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data && self.data.count > indexPath.section) {
        LYCellGrounp *group = [self.data objectAtIndex:indexPath.section];
        LYCellItem *item = [group itemAtIndex:indexPath.row];
        return [LYBaseCell getHeightForText:item];
    }
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.data && self.data.count > section) {
        LYCellGrounp *group = [self.data objectAtIndex:section];
        if (group.headerTitle == nil) {
            return section == 0 ? 15.0f : 10.0f;
        }
        return [LYBaseHeaderFooterView getHeightForText:group.headerTitle];
    }
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.data && self.data.count > section) {
        LYCellGrounp *group = [self.data objectAtIndex:section];
        if (group.footerTitle == nil) {
            return section == _data.count - 1 ? 30.0f : 10.0f;
        }
        return [LYBaseHeaderFooterView getHeightForText:group.footerTitle];
    }
    return 10.0f;
}

@end
