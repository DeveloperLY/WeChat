//
//  LYCellItem.h
//  WeChat
//
//  Created by Y Liu on 16/2/25.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LYCellItemAlignment) {
    LYCellItemAlignmentLeft,
    LYCellItemAlignmentRight,
    LYCellItemAlignmentMiddle
};

typedef NS_ENUM(NSUInteger, LYCellItemType) {
    LYCellItemTypeDefault, // image, title, rightTitle, rightImage
    LYCellItemTypeButton, // button
    LYCellItemTypeSwitch // title, Switch
};

#pragma mark - LYCellItem
@interface LYCellItem : NSObject

/** 对齐方式 */
@property (nonatomic, assign) LYCellItemAlignment alignment;

/** cell类型 */
@property (nonatomic, assign) LYCellItemType type;

/************************ 数据 ************************/
/** 主图片， 左边 */
@property (nonatomic, copy) NSString *imageName;
/** 图片URL */
@property (nonatomic, strong) NSURL *imageURL;

/** 主标题 */
@property (nonatomic, copy) NSString *title;

/** 中间图片 */
@property (nonatomic, copy) NSString *middleImageName;
/** 图片URL */
@property (nonatomic, strong) NSURL *middlerImageURL;
/** 图片集 */
@property (nonatomic, strong) NSArray *subImages;

/** 副标题 */
@property (nonatomic, copy) NSString *subTitle;

/** 右图片 */
@property (nonatomic, copy) NSString *rightImageName;
/** 图片URL */
@property (nonatomic, strong) NSURL *rightImageUrl;

/************************ 样式 ************************/
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *btnBGColor;
@property (nonatomic, strong) UIColor *btnTitleColor;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, strong) UIFont *subTitleFont;

@property (nonatomic, assign) CGFloat rightImageHeightOfCell;
@property (nonatomic, assign) CGFloat middleImageHeightOfCell;

/************************ 类方法 ************************/
+ (LYCellItem *)createWithTitle:(NSString *)title;
+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title;
+ (LYCellItem *)createWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle;
+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName;
+ (LYCellItem *)createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName;

@end

#pragma mark - LYCellGrounp
@interface LYCellGrounp : NSObject

/** 组头部标题 */
@property (nonatomic, copy) NSString *headerTitle;

/** 组尾部说明 */
@property (nonatomic, copy) NSString *footerTitle;

/** 组元素 */
@property (nonatomic, strong) NSMutableArray *items;

/** 组元素数 */
@property (nonatomic, assign, readonly) NSUInteger itemsCount;


- (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle cellItems:(LYCellItem *)firstObject, ...;

- (LYCellItem *)itemAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfItem:(LYCellItem *)item;

@end

