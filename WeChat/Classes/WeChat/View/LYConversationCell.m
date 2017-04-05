//
//  LYConversationCell.m
//  WeChat
//
//  Created by Y Liu on 16/2/23.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYConversationCell.h"
#import "LYConversation.h"

@interface LYConversationCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LYConversationCell

- (void)layoutSubviews {
    self.leftFreeSpace = self.ly_height * 0.14;
    [super layoutSubviews];
    
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 5.0f;
}

- (void)setConversation:(EMConversation *)conversation {
    _conversation = conversation;
    EMMessage *lastMessage = [conversation latestMessage];
    
    self.avatarImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", @"user"]];
    self.usernameLabel.text = lastMessage.from;
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    // 毫秒值转化为秒
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lastMessage.timestamp/ 1000.0];
    NSString *dateString = [formatter stringFromDate:date];
    self.dateLabel.text = dateString;
    
    EMMessageBody *msgBody = lastMessage.body;
    switch (msgBody.type) {
        case EMMessageBodyTypeText: {
            // 收到的文字消息
            EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
            NSString *txt = textBody.text;
            NSLog(@"收到的文字是 txt -- %@",txt);
            self.messageLabel.text = txt;
        }
        break;
        case EMMessageBodyTypeImage: {
            // 得到一个图片消息body
            EMImageMessageBody *body = ((EMImageMessageBody *)msgBody);
            NSLog(@"大图remote路径 -- %@"   ,body.remotePath);
            NSLog(@"大图local路径 -- %@"    ,body.localPath); // // 需要使用sdk提供的下载方法后才会存在
            NSLog(@"大图的secret -- %@"    ,body.secretKey);
            NSLog(@"大图的W -- %f ,大图的H -- %f",body.size.width,body.size.height);
            NSLog(@"大图的下载状态 -- %lu",body.downloadStatus);
            
            
            // 缩略图sdk会自动下载
            NSLog(@"小图remote路径 -- %@"   ,body.thumbnailRemotePath);
            NSLog(@"小图local路径 -- %@"    ,body.thumbnailLocalPath);
            NSLog(@"小图的secret -- %@"    ,body.thumbnailSecretKey);
            NSLog(@"小图的W -- %f ,大图的H -- %f",body.thumbnailSize.width,body.thumbnailSize.height);
            NSLog(@"小图的下载状态 -- %lu",body.thumbnailDownloadStatus);
            self.messageLabel.text = @"[图片]";
        }
        break;
        case EMMessageBodyTypeLocation: {
            EMLocationMessageBody *body = (EMLocationMessageBody *)msgBody;
            NSLog(@"纬度-- %f",body.latitude);
            NSLog(@"经度-- %f",body.longitude);
            NSLog(@"地址-- %@",body.address);
            self.messageLabel.text = @"[位置]";
        }
        break;
        case EMMessageBodyTypeVoice: {
            // 音频sdk会自动下载
            EMVoiceMessageBody *body = (EMVoiceMessageBody *)msgBody;
            NSLog(@"音频remote路径 -- %@"      ,body.remotePath);
            NSLog(@"音频local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在（音频会自动调用）
            NSLog(@"音频的secret -- %@"        ,body.secretKey);
            NSLog(@"音频文件大小 -- %lld"       ,body.fileLength);
            NSLog(@"音频文件的下载状态 -- %lu"   ,body.downloadStatus);
            NSLog(@"音频的时间长度 -- %lu"      ,body.duration);
            self.messageLabel.text = @"[语音]";
        }
        break;
        case EMMessageBodyTypeVideo: {
            EMVideoMessageBody *body = (EMVideoMessageBody *)msgBody;
            
            NSLog(@"视频remote路径 -- %@"      ,body.remotePath);
            NSLog(@"视频local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
            NSLog(@"视频的secret -- %@"        ,body.secretKey);
            NSLog(@"视频文件大小 -- %lld"       ,body.fileLength);
            NSLog(@"视频文件的下载状态 -- %lu"   ,body.downloadStatus);
            NSLog(@"视频的时间长度 -- %lu"      ,body.duration);
            NSLog(@"视频的W -- %f ,视频的H -- %f", body.thumbnailSize.width, body.thumbnailSize.height);
            
            // 缩略图sdk会自动下载
            NSLog(@"缩略图的remote路径 -- %@"     ,body.thumbnailRemotePath);
            NSLog(@"缩略图的local路径 -- %@"      ,body.thumbnailLocalPath);
            NSLog(@"缩略图的secret -- %@"        ,body.thumbnailSecretKey);
            NSLog(@"缩略图的下载状态 -- %lu"      ,body.thumbnailDownloadStatus);
            self.messageLabel.text = @"[视频]";
        }
        break;
        case EMMessageBodyTypeFile: {
            EMFileMessageBody *body = (EMFileMessageBody *)msgBody;
            NSLog(@"文件remote路径 -- %@"      ,body.remotePath);
            NSLog(@"文件local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
            NSLog(@"文件的secret -- %@"        ,body.secretKey);
            NSLog(@"文件文件大小 -- %lld"       ,body.fileLength);
            NSLog(@"文件文件的下载状态 -- %lu"   ,body.downloadStatus);
            self.messageLabel.text = @"[文件]";
        }
        break;
        default:
        break;
    }
}

@end
