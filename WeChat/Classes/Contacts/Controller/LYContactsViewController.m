//
//  LYContactsViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYContactsViewController.h"
#import "LYUIHelper.h"
#import "LYDataHelper.h"
#import "LYCellItem.h"
#import "LYUser.h"

#import "LYFriendCell.h"
#import "LYFriendHeaderView.h"

#import "LYWeChatSearchViewController.h"

static NSString * const cellID = @"friendCell";
static NSString * const headerID = @"friendHeader";

@interface LYContactsViewController () <UISearchBarDelegate>

/** 功能列表 */
@property (nonatomic, strong) LYCellGrounp *functionGroup;

/** 添加朋友 */
@property (nonatomic, strong) UIBarButtonItem *addFriendButton;
/** 搜索控制器 */
@property (nonatomic, strong) UISearchController *searchController;
/** 尾部Label */
@property (nonatomic, strong) UILabel *footerLabel;


@property (nonatomic, strong) LYWeChatSearchViewController *searchVC;

@end

@implementation LYContactsViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    // SubViews
    [self.tableView registerClass:[LYFriendCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LYFriendHeaderView class] forHeaderFooterViewReuseIdentifier:headerID];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView setTableFooterView:self.footerLabel];
    
    // data
    [self initData];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}

/**
 *  设置导航条
 */
- (void)setUpNavBar {
    // title
    self.navigationItem.title = @"通讯录";
    [self.navigationItem setRightBarButtonItem:self.addFriendButton];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.functionGroup.itemsCount;
    }
    NSArray *array = [self.data objectAtIndex:section - 1];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (indexPath.section == 0) {
        LYCellItem *item = [self.functionGroup itemAtIndex:indexPath.row];
        LYUser *user = [[LYUser alloc] init];
        user.username = item.title;
        user.avatarURL = item.imageName;
        cell.user = user;
        cell.topLineStyle = LYCellLineStyleNone;
        indexPath.row == self.functionGroup.itemsCount - 1 ? [cell setBottomLineStyle:LYCellLineStyleNone] : [cell setBottomLineStyle:LYCellLineStyleDefault];
    } else {
        NSArray *array = [self.data objectAtIndex:indexPath.section - 1];
        LYUser *user = [array objectAtIndex:indexPath.row];
        cell.user = user;
        cell.topLineStyle = LYCellLineStyleNone;
        if (indexPath.row == array.count - 1) {
            indexPath.section == self.data.count ? [cell setBottomLineStyle:LYCellLineStyleFill] :[cell setBottomLineStyle:LYCellLineStyleNone];
        } else {
            cell.bottomLineStyle = LYCellLineStyleDefault;
        }
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    LYFriendHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    view.title = [self.section objectAtIndex:section];
    return view;
}

// 拼音首字母检索
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.section;
}

// 检索时空出搜索框
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if(index == 0) {
        [self.tableView scrollRectToVisible:self.searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54.5f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.searchVC.friendsArray = self.friendsArray;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - Event Response
- (void)addFriendButtonDown {
    
}

#pragma mark - Private Methods
- (void)initData {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        LYUser *user1 = [[LYUser alloc] init];
        user1.username = @"荆天明";
        user1.nickname = @"天明";
        user1.userID = @"tianming";
        user1.avatarURL = @"jtm.jpg";
        [_friendsArray addObject:user1];
        LYUser *user2 = [[LYUser alloc] init];
        user2.username = @"项少羽";
        user2.userID = @"xiangshaoyu";
        user2.nickname = @"少羽";
        user2.avatarURL = @"xsy.jpg";
        [_friendsArray addObject:user2];
        LYUser *user3 = [[LYUser alloc] init];
        user3.username = @"盖聂";
        user3.userID = @"genie";
        user3.nickname = @"盖聂";
        user3.avatarURL = @"gn.jpg";
        [_friendsArray addObject:user3];
        LYUser *user4 = [[LYUser alloc] init];
        user4.username = @"少司命";
        user4.userID = @"shaosiming";
        user4.avatarURL = @"ssm.jpg";
        [_friendsArray addObject:user4];
        LYUser *user5 = [[LYUser alloc] init];
        user5.username = @"雪女";
        user5.userID = @"xuenv";
        user5.avatarURL = @"sym.jpg";
        [_friendsArray addObject:user5];
        LYUser *user6 = [[LYUser alloc] init];
        user6.username = @"卫庄";
        user6.userID = @"wz";
        user6.nickname = @"卫庄";
        user6.avatarURL = @"wz.jpg";
        [_friendsArray addObject:user6];
        LYUser *user7 = [[LYUser alloc] init];
        user7.username = @"高月";
        user7.userID = @"yueer";
        user7.nickname = @"月儿";
        user7.avatarURL = @"gy.jpg";
        [_friendsArray addObject:user7];
        
        self.functionGroup = [LYUIHelper getFriendsListItemsGroup];
        
        self.data = [LYDataHelper getFriendListDataBy:self.friendsArray];
        self.section = [LYDataHelper getFriendListSectionBy:self.data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.footerLabel setText:[NSString stringWithFormat:@"%lu位联系人", (unsigned long)self.friendsArray.count]];
        });
    });
}

#pragma mark - Getter and Setter
- (UIBarButtonItem *)addFriendButton {
    if (!_addFriendButton) {
        _addFriendButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriendButtonDown)];
    }
    return _addFriendButton;
}

- (UILabel *)footerLabel {
    if (!_footerLabel) {
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, LYScreenWidth, 49.0f)];
        _footerLabel.backgroundColor = [UIColor whiteColor];
        _footerLabel.textColor = [UIColor grayColor];
        _footerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _footerLabel;
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
        [_searchController.searchBar.layer setBorderColor:LYColorAlpha(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

@end
