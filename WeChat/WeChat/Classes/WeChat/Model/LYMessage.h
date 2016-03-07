//
//  LYMessage.h
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "LYUser.h"

/**
 *  消息拥有者
 */
typedef NS_ENUM(NSUInteger, LYMessageOwnerType) {
    /** 未知的消息拥有者 */
    LYMessageOwnerTypeUnknown,
    /** 系统消息 */
    LYMessageOwnerTypeSystem,
    /** 自己发送的消息 */
    LYMessageOwnerTypeSelf,
    /** 接收的他人消息 */
    LYMessageOwnerTypeOther,
};

/**
 *  消息类型
 */
typedef NS_ENUM(NSUInteger, LYMessageType) {
    /** 未知 */
    LYMessageTypeUnknown,
    /** 系统 */
    LYMessageTypeSystem,
    /** 文字 */
    LYMessageTypeText,
    /** 图片 */
    LYMessageTypeImage,
    /** 语音 */
    LYMessageTypeVoice,
    /** 视频 */
    LYMessageTypeVideo,
    /** 文件 */
    LYMessageTypeFile,
    /** 位置 */
    LYMessageTypeLocation,
    /** 抖动 */
    LYMessageTypeShake,
};

/**
 *  消息发送状态
 */
typedef NS_ENUM(NSUInteger, LYMessageSendState) {
    /** 消息发送成功 */
    LYMessageSendSuccess,
    /** 消息发送失败 */
    LYMessageSendFail,
};

/**
 *  消息读取状态
 */
typedef NS_ENUM(NSUInteger, LYMessageReadState) {
    /** 消息未读 */
    LYMessageUnRead,
    /** 消息已读 */
    LYMessageReaded,
};

@interface LYMessage : NSObject

/** 发送者信息 */
@property (nonatomic, strong) LYUser *sender;
/** 发送时间 */
@property (nonatomic, strong) NSDate *sendDate;
/** 格式化得发送时间 */
@property (nonatomic, copy) NSString *sendDateString;
/** 消息类型 */
@property (nonatomic, assign) LYMessageType messageType;
/** 发送者类型 */
@property (nonatomic, assign) LYMessageOwnerType ownerType;
/** 消息读取状态 */
@property (nonatomic, assign) LYMessageReadState readState;
/** 消息发送状态 */
@property (nonatomic, assign) LYMessageSendState *sendState;

/** 消息大小 */
@property (nonatomic, assign) CGSize messageSize;
/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
/** cellIndentify */
@property (nonatomic, copy) NSString *cellIndentify;

#pragma mark - 文字消息
/** 文字信息 */
@property (nonatomic, copy) NSString *text;
/** 格式化的文字信息 */
@property (nonatomic, strong) NSAttributedString *attrText;

#pragma mark - 图片消息
/** 本地图片Path */
@property (nonatomic, copy) NSString *imagePath;
/** 图片缓存 */
@property (nonatomic, strong) UIImage *image;
/** 网络图片URL */
@property (nonatomic, copy) NSString *imageURL;

#pragma mark - 位置消息
/** 经纬度 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/** 地址 */
@property (nonatomic, copy) NSString *address;

#pragma mark - 语音消息
/** 语音时间 */
@property (nonatomic, assign) NSUInteger voiceSeconds;
/** 网络语音URL */
@property (nonatomic, copy) NSString *voiceUrl;
/** 本地语音Path */
@property (nonatomic, copy) NSString *voicePath;

@end
