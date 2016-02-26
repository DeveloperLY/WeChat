//
//  LYBaseHeaderFooterView.h
//  WeChat
//
//  Created by Y Liu on 16/2/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYBaseHeaderFooterView : UITableViewHeaderFooterView

/** 文本 */
@property (nonatomic, copy) NSString *text;

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;

+ (CGFloat)getHeightForText:(NSString *)text;

@end
