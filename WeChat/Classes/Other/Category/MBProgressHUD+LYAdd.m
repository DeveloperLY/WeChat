//
//  MBProgressHUD+LYAdd.m
//  LYWeChat
//
//  Created by LiuY on 2017/4/2.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "MBProgressHUD+LYAdd.h"

NSString * const kMBProgressHUDMsgLoading = @"正在加载...";
NSString * const kMBProgressHUDMsgLoadError = @"加载失败";
NSString * const kMBProgressHUDMsgLoadSuccessful = @"加载成功";
NSString * const kMBProgressHUDMsgNoMoreData = @"没有更多数据了";
NSTimeInterval kMBProgressHUDHideTimeInterval = 1.2f;

static CGFloat FONT_SIZE = 14.0f;
static CGFloat OPACITY = 0.85;

@implementation MBProgressHUD (LYAdd)

+ (MBProgressHUD *)ly_showHUDAddedTo:(UIView *)view title:(NSString *)title animated:(BOOL)animated {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:animated];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.labelText = title;
    HUD.opacity = OPACITY;
    return HUD;
}

+ (MBProgressHUD *)ly_showHUDAddedTo:(UIView *)view title:(NSString *)title {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.labelText = title;
    HUD.opacity = OPACITY;
    return HUD;
}

- (void)ly_hideWithTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond {
    if (title) {
        self.labelText = title;
        self.mode = MBProgressHUDModeText;
    }
    [self hide:YES afterDelay:afterSecond];
}

- (void)ly_hideAfter:(NSTimeInterval)afterSecond {
    [self hide:YES afterDelay:afterSecond];
}

- (void)ly_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(MBProgressHUDMsgType)msgType {
    self.labelText = title;
    self.mode = MBProgressHUDModeCustomView;
    self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[self class ]p_imageNamedWithMsgType:msgType]]];
    [self hide:YES afterDelay:afterSecond];
}

+ (MBProgressHUD *)ly_showTitle:(NSString *)title toView:(UIView *)view hideAfter:(NSTimeInterval)afterSecond {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.labelText = title;
    HUD.opacity = OPACITY;
    [HUD hide:YES afterDelay:afterSecond];
    return HUD;
}

+ (MBProgressHUD *)ly_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond
                         msgType:(MBProgressHUDMsgType)msgType {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    
    NSString *imageNamed = [self p_imageNamedWithMsgType:msgType];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    HUD.labelText = title;
    HUD.opacity = OPACITY;
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD hide:YES afterDelay:afterSecond];
    return HUD;
    
}

+ (NSString *)p_imageNamedWithMsgType:(MBProgressHUDMsgType)msgType {
    NSString *imageNamed = nil;
    if (msgType == MBProgressHUDMsgTypeSuccessful) {
        imageNamed = @"ly_hud_success";
    } else if (msgType == MBProgressHUDMsgTypeError) {
        imageNamed = @"ly_hud_error";
    } else if (msgType == MBProgressHUDMsgTypeWarning) {
        imageNamed = @"ly_hud_warning";
    } else if (msgType == MBProgressHUDMsgTypeInfo) {
        imageNamed = @"ly_hud_info";
    }
    return imageNamed;
}

+ (MBProgressHUD *)ly_showDeterminateHUDTo:(UIView *)view {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    HUD.animationType = MBProgressHUDAnimationZoom;
    HUD.labelText = kMBProgressHUDMsgLoading;
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    return HUD;
}

+ (void)ly_setHideTimeInterval:(NSTimeInterval)second fontSize:(CGFloat)fontSize opacity:(CGFloat)opacity {
    kMBProgressHUDHideTimeInterval = second;
    FONT_SIZE = fontSize;
    OPACITY = opacity;
}

@end
