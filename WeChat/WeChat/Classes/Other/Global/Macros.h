//
//  Macros.h
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#ifndef WeChat_Macros_h
#define WeChat_Macros_h

#define APPDELEGETE         ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define LYColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

/** ----- Frame ----- */
#define LYScreenWidth        [UIScreen mainScreen].bounds.size.width
#define LYScreenHeight       [UIScreen mainScreen].bounds.size.height

#define LYStatusBarHeight    20
#define LYTabBarHeight       49
#define LYNavBarHeight       44
#define LYChatBoxViewHeight  215

/** ----- Color ----- */
#define     DEFAULT_NAVBAR_COLOR             LYColor(20.0, 20.0, 20.0, 0.9)
#define     DEFAULT_BACKGROUND_COLOR         LYColor(239.0, 239.0, 244.0, 1.0)

#define     DEFAULT_CHAT_BACKGROUND_COLOR    LYColor(235.0, 235.0, 235.0, 1.0)
#define     DEFAULT_CHATBOX_COLOR            LYColor(244.0, 244.0, 246.0, 1.0)
#define     DEFAULT_SEARCHBAR_COLOR          LYColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_GREEN_COLOR              LYColor(2.0, 187.0, 0.0, 1.0f)
#define     DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR          LYColor(188.0, 188.0, 188.0, 0.6f)

/** ----- Path ----- */
#define     PATH_DOCUMENT                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define     PATH_CHATREC_IMAGE              [PATH_DOCUMENT stringByAppendingPathComponent:@"ChatRecs/Images"]


#endif /* WeChat_Macros_h */
