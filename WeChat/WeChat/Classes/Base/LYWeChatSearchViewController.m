//
//  LYWeChatSearchViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYWeChatSearchViewController.h"

#import "LYFriendCell.h"
#import "LYUser.h"

static NSString * const ID = @"friendCell";

@interface LYWeChatSearchViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation LYWeChatSearchViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[LYFriendCell class] forCellReuseIdentifier:ID];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.data = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.ly_y = LYNavBarHeight + LYStatusBarHeight;
    self.tableView.ly_height = LYScreenHeight - self.tableView.ly_y;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"联系人";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    LYUser *user = [self.data objectAtIndex:indexPath.row];
    cell.user = user;
    indexPath.row == 0 ? [cell setTopLineStyle:LYCellLineStyleFill] : [cell setTopLineStyle:LYCellLineStyleNone];
    indexPath.row == self.data.count - 1 ? [cell setBottomLineStyle:LYCellLineStyleFill] : [cell setBottomLineStyle:LYCellLineStyleDefault];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54.5f;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    [self.data removeAllObjects];
    for (LYUser *user in self.friendsArray) {
        if ([user.userID containsString:searchText] || [user.username containsString:searchText] || [user.nickname containsString:searchText] || [user.pinyin containsString:searchText] || [user.initial containsString:searchText]) {
            [self.data addObject:user];
        }
    }
    [self.tableView reloadData];
}

@end
