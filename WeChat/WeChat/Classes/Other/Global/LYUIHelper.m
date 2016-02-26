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

+ (LYCellGrounp *)getFriendsListItemsGroup {
    LYCellItem *notify = [LYCellItem createWithImageName:@"plugins_FriendNotify" title:@"新的朋友"];
    LYCellItem *friendGroup = [LYCellItem createWithImageName:@"add_friend_icon_addgroup" title:@"群聊"];
    LYCellItem *tag = [LYCellItem createWithImageName:@"Contact_icon_ContactTag" title:@"标签"];
    LYCellItem *offical = [LYCellItem createWithImageName:@"add_friend_icon_offical" title:@"公众号"];
    LYCellGrounp *group = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:notify, friendGroup, tag, offical, nil];
    return group;
}

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

+ (NSMutableArray *)getDiscoverItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    LYCellItem *friendsAlbum = [LYCellItem createWithImageName:@"ff_IconShowAlbum" title:@"朋友圈" subTitle:nil rightImageName:@"2.jpg"];
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:friendsAlbum, nil];
    [items addObject:group1];
    
    LYCellItem *qrCode = [LYCellItem createWithImageName:@"ff_IconQRCode" title:@"扫一扫"];
    LYCellItem *shake = [LYCellItem createWithImageName:@"ff_IconShake" title:@"摇一摇"];
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:qrCode, shake, nil];
    [items addObject:group2];
    
    LYCellItem *loacation = [LYCellItem createWithImageName:@"ff_IconLocationService" title:@"附近的人" subTitle:nil rightImageName:@"FootStep"];
    loacation.rightImageHeightOfCell = 0.43;
    LYCellItem *bottle = [LYCellItem createWithImageName:@"ff_IconBottle" title:@"漂流瓶"];
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:loacation, bottle, nil];
    [items addObject:group3];
    
    LYCellItem *shopping = [LYCellItem createWithImageName:@"CreditCard_ShoppingBag" title:@"购物"];
    LYCellItem *game = [LYCellItem createWithImageName:@"MoreGame" title:@"游戏" subTitle:@"超火力新枪战" rightImageName:@"game_tag_icon"];
    LYCellGrounp *group4 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:shopping, game, nil];
    [items addObject:group4];
    
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
