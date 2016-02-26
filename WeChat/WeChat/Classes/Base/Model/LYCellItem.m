//
//  LYCellItem.m
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYCellItem.h"

@implementation LYCellItem

#pragma mark - init
- (instancetype)init {
    if (self = [super init]) {
        _alignment = LYCellItemAlignmentRight;
        _bgColor = [UIColor whiteColor];
        _titleColor = [UIColor blackColor];
        _titleFont = [UIFont systemFontOfSize:15.5f];
        _subTitleColor = [UIColor grayColor];
        _subTitleFont = [UIFont systemFontOfSize:15.0f];
        
        _accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _selectionStyle = UITableViewCellSelectionStyleDefault;
        _rightImageHeightOfCell = 0.72;
        _middleImageHeightOfCell = 0.35;
    }
    return self;
}

#pragma mark - class Method
+ (LYCellItem *)createWithTitle:(NSString *)title {
    return [LYCellItem createWithImageName:nil title:title];
}

+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title {
    return [LYCellItem createWithImageName:imageName title:title subTitle:nil rightImageName:nil];
}

+ (LYCellItem *)createWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    return [LYCellItem createWithImageName:nil title:title subTitle:subTitle rightImageName:nil];
}

+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle {
    return [LYCellItem createWithImageName:imageName title:title middleImageName:middleImageName subTitle:subTitle rightImageName:nil];
}

+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName {
    return [LYCellItem createWithImageName:imageName title:title middleImageName:nil subTitle:subTitle rightImageName:rightImageName];
}

+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName {
    LYCellItem *item = [[LYCellItem alloc] init];
    item.imageName = imageName;
    item.imageName = imageName;
    item.middleImageName = middleImageName;
    item.rightImageName = rightImageName;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

#pragma mark - Setting or Getting
- (void)setAlignment:(LYCellItemAlignment)alignment {
    _alignment = alignment;
    if (alignment == LYCellItemAlignmentMiddle) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)setType:(LYCellItemType)type {
    _type = type;
    if (type == LYCellItemTypeSwitch) {
        self.accessoryType = UITextAutocapitalizationTypeNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if (type == LYCellItemTypeButton) {
        self.btnBGColor = DEFAULT_GREEN_COLOR;
        self.btnTitleColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgColor = [UIColor clearColor];
    }
}

@end

@implementation LYCellGrounp

- (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle cellItems:(LYCellItem *)firstObject, ... {
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObject) {
            [_items addObject:firstObject];
            va_start(argList, firstObject);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

- (LYCellItem *)itemAtIndex:(NSUInteger)index {
    return [_items objectAtIndex:index];
}

- (NSUInteger)indexOfItem:(LYCellItem *)item {
    return [_items indexOfObject:item];
}

- (NSUInteger)itemsCount {
    return self.items.count;
}

@end