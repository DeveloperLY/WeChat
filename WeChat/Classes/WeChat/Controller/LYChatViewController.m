//
//  LYChatViewController.m
//  WeChat
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYChatViewController.h"
#import "LYChatMessageViewController.h"
#import "LYChatBoxViewController.h"
#import "LYUserHelper.h"

@interface LYChatViewController () <LYChatMessageViewControllerDelegate, LYChatBoxViewControllerDelegate, EMChatManagerDelegate>
{
    CGFloat viewHeight;
}

@property (nonatomic, strong) LYChatMessageViewController *chatMessageVC;
@property (nonatomic, strong) LYChatBoxViewController *chatBoxVC;

@end

@implementation LYChatViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    viewHeight = LYScreenHeight - LYNavBarHeight - LYStatusBarHeight;
    
    [self.view addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
    
    [self setUpMessageArray];
    
    // 注册消息回调
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
}

- (void)dealloc {
    // 移除消息回调
    [[EMClient sharedClient].chatManager removeDelegate:self];
}

- (void)setUpMessageArray {
    EMMessage *lastMessage = [self.conversation latestMessage];
    [self.navigationItem setTitle:lastMessage.from];
    [self.conversation loadMessagesFrom:lastMessage.timestamp - 1000 * 60 * 60 * 24 to:lastMessage.timestamp count:50 completion:^(NSArray *aMessages, EMError *aError) {
        if (!aError) {
            for (EMMessage *message in aMessages) {
                LYMessage *recMessage = [[LYMessage alloc] init];
                recMessage.messageType = LYMessageTypeText;
                recMessage.ownerType = message.direction == EMMessageDirectionSend ? LYMessageOwnerTypeSelf : LYMessageOwnerTypeOther;
                recMessage.sendDate = [NSDate dateWithTimeIntervalSince1970:message.localTime/ 1000.0];
                LYUser *sender = [[LYUser alloc] init];
                sender.userID = message.from;
                sender.avatarURL = @"user";
                recMessage.sender = sender;
                EMMessageBody *msgBody = message.body;
                switch (msgBody.type) {
                    case EMMessageBodyTypeText: {
                        // 收到的文字消息
                        EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
                        NSString *txt = textBody.text;
                        NSLog(@"收到的文字是 txt -- %@",txt);
                        recMessage.text = txt;
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
                        
                        recMessage.imagePath = body.thumbnailRemotePath;
                    }
                        break;
                    case EMMessageBodyTypeLocation: {
                        EMLocationMessageBody *body = (EMLocationMessageBody *)msgBody;
                        NSLog(@"纬度-- %f",body.latitude);
                        NSLog(@"经度-- %f",body.longitude);
                        NSLog(@"地址-- %@",body.address);
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
                    }
                        break;
                    case EMMessageBodyTypeFile: {
                        EMFileMessageBody *body = (EMFileMessageBody *)msgBody;
                        NSLog(@"文件remote路径 -- %@"      ,body.remotePath);
                        NSLog(@"文件local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
                        NSLog(@"文件的secret -- %@"        ,body.secretKey);
                        NSLog(@"文件文件大小 -- %lld"       ,body.fileLength);
                        NSLog(@"文件文件的下载状态 -- %lu"   ,body.downloadStatus);
                    }
                        break;
                    default:
                        break;
                }
                [self.chatMessageVC addNewMessage:recMessage];
                
                [self.chatMessageVC scrollToBottom];
            }
        } else {
            NSLog(@"---%@", aError.errorDescription);
        }
    }];
}

#pragma mark - EMChatManagerDelegate
// 接收到一条及以上非cmd消息
- (void)messagesDidReceive:(NSArray *)aMessages {
    for (EMMessage *message in aMessages) {
        LYMessage *recMessage = [[LYMessage alloc] init];
        recMessage.messageType = LYMessageTypeText;
        recMessage.ownerType = message.direction == EMMessageDirectionSend ? LYMessageOwnerTypeSelf : LYMessageOwnerTypeOther;
        recMessage.sendDate = [NSDate dateWithTimeIntervalSince1970:message.localTime/ 1000.0];
        LYUser *sender = [[LYUser alloc] init];
        sender.userID = message.from;
        sender.avatarURL = @"user";
        recMessage.sender = sender;
        EMMessageBody *msgBody = message.body;
        switch (msgBody.type) {
            case EMMessageBodyTypeText: {
                // 收到的文字消息
                EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
                NSString *txt = textBody.text;
                NSLog(@"收到的文字是 txt -- %@",txt);
                recMessage.text = txt;
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
                
                recMessage.imagePath = body.localPath;
            }
                break;
            case EMMessageBodyTypeLocation: {
                EMLocationMessageBody *body = (EMLocationMessageBody *)msgBody;
                NSLog(@"纬度-- %f",body.latitude);
                NSLog(@"经度-- %f",body.longitude);
                NSLog(@"地址-- %@",body.address);
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
            }
                break;
            case EMMessageBodyTypeFile: {
                EMFileMessageBody *body = (EMFileMessageBody *)msgBody;
                NSLog(@"文件remote路径 -- %@"      ,body.remotePath);
                NSLog(@"文件local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
                NSLog(@"文件的secret -- %@"        ,body.secretKey);
                NSLog(@"文件文件大小 -- %lld"       ,body.fileLength);
                NSLog(@"文件文件的下载状态 -- %lu"   ,body.downloadStatus);
            }
                break;
            default:
                break;
        }
        [self.chatMessageVC addNewMessage:recMessage];
        
        [self.chatMessageVC scrollToBottom];
    }
}

// 接收到一条及以上cmd消息
- (void)cmdMessagesDidReceive:(NSArray *)aCmdMessages {
    NSLog(@"aCmdMessages = %@", aCmdMessages);
}

#pragma mark - LYChatMessageViewControllerDelegate
- (void)didTapChatMessageView:(LYChatMessageViewController *)chatMessageViewController {
    [self.chatBoxVC resignFirstResponder];
}

#pragma mark - LYChatBoxViewControllerDelegate
- (void)chatBoxViewController:(LYChatBoxViewController *)chatboxViewController sendMessage:(LYMessage *)message {
    message.sender = [LYUserHelper sharedUserHelper].user;
    [self.chatMessageVC addNewMessage:message];
    
    LYMessage *recMessage = [[LYMessage alloc] init];
    recMessage.messageType = message.messageType;
    recMessage.ownerType = LYMessageOwnerTypeOther;
    recMessage.sendDate = [NSDate date];
    recMessage.text = message.text;
    recMessage.imagePath = message.imagePath;
    recMessage.sender = message.sender;
    [self.chatMessageVC addNewMessage:recMessage];
    
    [self.chatMessageVC scrollToBottom];
}

- (void)chatBoxViewController:(LYChatBoxViewController *)chatboxViewController didChangeChatBoxHeight:(CGFloat)height {
    self.chatMessageVC.view.ly_height = viewHeight - height;
    self.chatBoxVC.view.ly_y = self.chatMessageVC.view.ly_y + self.chatMessageVC.view.ly_height;
    [self.chatMessageVC scrollToBottom];
}

#pragma mark - Getter and Setter
- (void)setConversation:(EMConversation *)conversation {
    _conversation = conversation;
    EMMessage *lastMessage = [conversation latestMessage];
    [self.navigationItem setTitle:lastMessage.from];
}

- (LYChatMessageViewController *)chatMessageVC {
    if (!_chatMessageVC) {
        _chatMessageVC = [[LYChatMessageViewController alloc] init];
        [_chatMessageVC.view setFrame:CGRectMake(0, LYStatusBarHeight + LYNavBarHeight, LYScreenWidth, viewHeight - LYTabBarHeight)];
        [_chatMessageVC setDelegate:self];
    }
    return _chatMessageVC;
}

- (LYChatBoxViewController *)chatBoxVC {
    if (!_chatBoxVC) {
        _chatBoxVC = [[LYChatBoxViewController alloc] init];
        [_chatBoxVC.view setFrame:CGRectMake(0, LYScreenHeight - LYTabBarHeight, LYScreenWidth, LYScreenHeight)];
        [_chatBoxVC setDelegate:self];
    }
    return _chatBoxVC;
}

@end
