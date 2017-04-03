//
//  LYUIHelper.m
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
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

+ (NSMutableArray *)getDetailVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    LYCellItem *tag = [LYCellItem createWithTitle:@"设置备注和标签"];
    LYCellItem *phone = [LYCellItem createWithTitle:@"电话号码" subTitle:@"18888888888"];
    phone.alignment = LYCellItemAlignmentLeft;
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:tag, phone, nil];
    [items addObject:group1];
    LYCellItem *position = [LYCellItem createWithTitle:@"地区" subTitle:@"广东 珠海"];
    position.alignment = LYCellItemAlignmentLeft;
    LYCellItem *album = [LYCellItem createWithTitle:@"个人相册"];
    album.subImages = @[@"1.jpg", @"2.jpg", @"8.jpg", @"0.jpg"];
    album.alignment = LYCellItemAlignmentLeft;
    LYCellItem *more = [LYCellItem createWithTitle:@"更多"];
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:position, album, more, nil];
    [items addObject:group2];
    
    LYCellItem *chatButton = [LYCellItem createWithTitle:@"发消息"];
    chatButton.type = LYCellItemTypeButton;
    LYCellItem *videoButton = [LYCellItem createWithTitle:@"视频聊天"];
    videoButton.type = LYCellItemTypeButton;
    videoButton.btnBGColor = [UIColor whiteColor];
    videoButton.btnTitleColor = [UIColor blackColor];
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:chatButton, videoButton, nil];
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

+ (NSMutableArray *)getSettingVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    LYCellItem *safe = [LYCellItem createWithImageName:nil title:@"账号和安全" middleImageName:@"ProfileLockOn" subTitle:@"已保护"];
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:safe, nil];
    [items addObject:group1];
    
    LYCellItem *noti = [LYCellItem createWithTitle:@"新消息通知"];
    LYCellItem *privacy = [LYCellItem createWithTitle:@"隐私"];
    LYCellItem *normal = [LYCellItem createWithTitle:@"通用"];
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:noti, privacy, normal, nil];
    [items addObject:group2];
    
    LYCellItem *feedBack = [LYCellItem createWithTitle:@"帮助与反馈"];
    LYCellItem *about = [LYCellItem createWithTitle:@"关于微信"];
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:feedBack, about, nil];
    [items addObject:group3];
    
    LYCellItem *exit = [LYCellItem createWithTitle:@"退出登陆"];
    [exit setAlignment:LYCellItemAlignmentMiddle];
    LYCellGrounp *group4 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:exit, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *)getDetailSettingVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    LYCellItem *tag = [LYCellItem createWithTitle:@"设置备注及标签"];
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:tag, nil];
    [items addObject:group1];
    
    LYCellItem *recommend = [LYCellItem createWithTitle:@"把他推荐给好友"];
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:recommend, nil];
    [items addObject:group2];
    
    LYCellItem *starFriend = [LYCellItem createWithTitle:@"把它设为星标朋友"];
    starFriend.type = LYCellItemTypeSwitch;
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:starFriend, nil];
    [items addObject:group3];
    
    LYCellItem *prohibit = [LYCellItem createWithTitle:@"不让他看我的朋友圈"];
    prohibit.type = LYCellItemTypeSwitch;
    LYCellItem *ignore = [LYCellItem createWithTitle:@"不看他的朋友圈"];
    ignore.type = LYCellItemTypeSwitch;
    LYCellGrounp *group4 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:prohibit, ignore, nil];
    [items addObject:group4];
    
    LYCellItem *addBlacklist = [LYCellItem createWithTitle:@"加入黑名单"];
    addBlacklist.type = LYCellItemTypeSwitch;
    LYCellItem *report = [LYCellItem createWithTitle: @"举报"];
    LYCellGrounp *group5 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:addBlacklist, report, nil];
    [items addObject:group5];
    
    LYCellItem *delete = [LYCellItem createWithTitle:@"删除好友"];
    delete.type = LYCellItemTypeButton;
    LYCellGrounp *group6 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:nil cellItems:delete, nil];
    [items addObject:group6];
    
    return items;
}

+ (NSMutableArray *)getNewNotiVCItems {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    LYCellItem *recNoti = [LYCellItem createWithTitle:@"接受新消息通知" subTitle:@"已开启"];
    LYCellGrounp *group1 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:@"如果你要关闭或开启微信的新消息通知，请在iPhone的“设置” - “通知”功能中，找到应用程序“微信”更改。" cellItems:recNoti, nil];
    [items addObject:group1];
    
    LYCellItem *showDetail = [LYCellItem createWithTitle:@"通知显示详情信息"];
    showDetail.type = LYCellItemTypeSwitch;
    LYCellGrounp *group2 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。" cellItems:showDetail, nil];
    [items addObject:group2];
    
    LYCellItem *disturb = [LYCellItem createWithTitle:@"功能消息免打扰"];
    LYCellGrounp *group3 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:@"设置系统功能消息提示声音和振动时段。" cellItems:disturb, nil];
    [items addObject:group3];
    
    LYCellItem *voice = [LYCellItem createWithTitle:@"声音"];
    voice.type = LYCellItemTypeSwitch;
    LYCellItem *shake = [LYCellItem createWithTitle:@"震动"];
    shake.type = LYCellItemTypeSwitch;
    LYCellGrounp *group4 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:@"当微信在运行时，你可以设置是否需要声音或者振动。" cellItems:voice, shake, nil];
    [items addObject:group4];
    
    LYCellItem *friends = [LYCellItem createWithTitle:@"朋友圈照片更新"];
    friends.type = LYCellItemTypeSwitch;
    LYCellGrounp *group5 = [[LYCellGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。" cellItems:friends, nil];
    [items addObject:group5];
    
    return items;
}

@end
