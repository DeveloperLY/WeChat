//
//  LYWeChatSearchViewController.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYWeChatSearchViewController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *friendsArray;

@end
