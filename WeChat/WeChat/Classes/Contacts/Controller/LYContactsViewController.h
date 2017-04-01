//
//  LYContactsViewController.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYContactsViewController : UITableViewController

/** 好友列表数据 */
@property (nonatomic, strong) NSMutableArray *friendsArray;
/** 格式化的好友列表数据 */
@property (nonatomic, strong) NSMutableArray *data;
/** 拼音首字母列表 */
@property (nonatomic, strong) NSMutableArray *section;

@end
