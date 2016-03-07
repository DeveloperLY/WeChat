//
//  LYWeChatViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYWeChatViewController.h"

#import "LYConversationCell.h"
#import "LYConversation.h"
#import "LYUser.h"

#import "LYWeChatSearchViewController.h"
#import "LYChatViewController.h"

static NSString * const ID = @"WeChatCell";

@interface LYWeChatViewController () <UISearchBarDelegate>

/** 消息列表数据 */
@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) UIBarButtonItem *navRightButton;


@property (nonatomic, strong) LYWeChatSearchViewController *searchVC;
@property (nonatomic, strong) LYChatViewController *chatVC;

@end

@implementation LYWeChatViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
    
    // 设置TableView
    [self setUpTableView];
    
    // data
    [self loadNewData];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
}

/**
 *  设置TableView
 */
- (void)setUpTableView {
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LYConversationCell class]) bundle:nil] forCellReuseIdentifier:ID];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    
    self.tableView.rowHeight = 63;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
}

/**
 *  设置导航条
 */
- (void)setUpNavBar {
    // title
    self.navigationItem.title = @"微信";
    
    // nav菜单
    self.navigationItem.rightBarButtonItem = self.navRightButton;
    
    
}

#pragma mark - load Data
- (void) loadNewData {
    // 测试数据
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:10];
    LYConversation *item1 = [[LYConversation alloc] init];
    item1.from = [NSString stringWithFormat:@"项少羽"];
    item1.message = @"阳哥，天明又闯祸了！！";
    item1.avatarURL = [NSURL URLWithString:@"xsy.jpg"];
    item1.messageCount = 0;
    item1.date = [NSDate date];
    [models addObject:item1];
    self.data = models;
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    LYConversation *conversation = self.data[indexPath.row];
    
    cell.conversation = conversation;
    cell.topLineStyle = LYCellLineStyleNone;
    
    if (indexPath.row == self.data.count - 1) {
        cell.bottomLineStyle = LYCellLineStyleFill;
    } else {
        cell.bottomLineStyle = LYCellLineStyleDefault;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!_chatVC) {
        _chatVC = [[LYChatViewController alloc] init];
    }
    LYUser *user7 = [[LYUser alloc] init];
    user7.username = @"项少羽";
    user7.userID = @"xiangshaoyu";
    user7.nickname = @"少羽";
    user7.avatarURL = @"xsy.jpg";
    _chatVC.user = user7;
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_chatVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Event Response
- (void)navRightButtonDown {
    NSLog(@"%s", __func__);
}

#pragma mark - <UISearchBarDelegate>
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.tabBarController.tabBar.hidden = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - Getter and Setter
- (UIBarButtonItem *)navRightButton {
    if (!_navRightButton) {
        _navRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(navRightButtonDown)];
    }
    return _navRightButton;
}

- (LYWeChatSearchViewController *)searchVC {
    if (!_searchVC) {
        _searchVC = [[LYWeChatSearchViewController alloc] init];
    }
    return _searchVC;
}

- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater: self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:LYColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

@end
