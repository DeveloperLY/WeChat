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

+ (NSMutableArray *)getMineDetailVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    LYCellItem *avatar = [LYCellItem createWithImageName:nil title:@"头像" subTitle:nil rightImageName:@"bc.jpg"];
    LYCellItem *name = [LYCellItem createWithTitle:@"名字" subTitle:@"冰晨"];
    LYCellItem *num = [LYCellItem createWithTitle:@"微信号" subTitle:@"WX774136501"];
    LYCellItem *code = [LYCellItem createWithTitle:@"我的二维码"];
    LYCellItem *address = [LYCellItem createWithTitle:@"我的地址"];
    LYCellGrounp *frist = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:avatar, name, num, code, address, nil];
    [items addObject:frist];
    
    LYCellItem *sex = [LYCellItem createWithTitle:@"性别" subTitle:@"男"];
    LYCellItem *pos = [LYCellItem createWithTitle:@"地址" subTitle:@"广东 广州"];
    LYCellItem *proverbs = [LYCellItem createWithTitle:@"个性签名" subTitle:@"一枚单线程程序猿!"];
    LYCellGrounp *second = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:sex, pos, proverbs, nil];
    [items addObject:second];
    
    return items;
}

@end
