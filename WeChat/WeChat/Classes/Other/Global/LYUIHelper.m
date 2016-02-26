//
//  LYUIHelper.m
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYUIHelper.h"
#import "LYCellItem.h"

@implementation LYUIHelper

+ (NSMutableArray *)getMineVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    LYCellItem *album = [LYCellItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    LYCellItem *favorite = [LYCellItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    LYCellItem *bank = [LYCellItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    LYCellItem *card = [LYCellItem createWithImageName:@"MyCardPackageIcon" title:@"优惠劵"];
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:album, favorite, bank, card, nil];
    [items addObject:group1];
    
    LYCellItem *expression = [LYCellItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:expression, nil];
    [items addObject:group2];
    
    LYCellItem *setting = [LYCellItem createWithImageName:@"MoreSetting" title:@"设置"];
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:setting, nil];
    [items addObject:group3];
    return items;
}


@end
