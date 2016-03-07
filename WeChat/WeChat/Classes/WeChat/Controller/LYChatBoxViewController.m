//
//  LYChatBoxViewController.m
//  WeChat
//
//  Created by Y Liu on 16/3/3.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYChatBoxViewController.h"
#import "LYChatBox.h"
#import "LYChatBoxMoreView.h"
#import "LYChatBoxFaceView.h"

@interface LYChatBoxViewController () <LYChatBoxDelegate, LYChatBoxFaceViewDelegate, LYChatBoxMoreViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, assign) CGRect keyboardFrame;

@property (nonatomic, strong) LYChatBox *chatBox;
@property (nonatomic, strong) LYChatBoxMoreView *chatBoxMoreView;
@property (nonatomic, strong) LYChatBoxFaceView *chatBoxFaceView;

@end

@implementation LYChatBoxViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.chatBox];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self resignFirstResponder];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Public Methods
- (BOOL)resignFirstResponder {
    if (self.chatBox.status != LYChatBoxStatusNothing && self.chatBox.status != LYChatBoxStatusShowVoice) {
        [self.chatBox resignFirstResponder];
        self.chatBox.status = (self.chatBox.status == LYChatBoxStatusShowVoice ? self.chatBox.status : LYChatBoxStatusNothing);
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
            [UIView animateWithDuration:0.3 animations:^{
                [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight];
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        }
    }
    return [super resignFirstResponder];
}

#pragma mark - LYChatBoxDelegate
- (void)chatBox:(LYChatBox *)chatBox sendTextMessage:(NSString *)textMessage {
    LYMessage *message = [[LYMessage alloc] init];
    message.messageType = LYMessageTypeText;
    message.ownerType = LYMessageOwnerTypeSelf;
    message.text = textMessage;
    message.sendDate = [NSDate date];
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController: sendMessage:)]) {
        [_delegate chatBoxViewController:self sendMessage:message];
    }
}

- (void)chatBox:(LYChatBox *)chatBox changeChatBoxHeight:(CGFloat)height {
    self.chatBoxFaceView.ly_y = height;
    self.chatBoxMoreView.ly_y = height;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        float h = (self.chatBox.status == LYChatBoxStatusShowFace ? LYChatBoxViewHeight : self.keyboardFrame.size.height ) + height;
        [_delegate chatBoxViewController:self didChangeChatBoxHeight: h];
    }
}

- (void)chatBox:(LYChatBox *)chatBox changeStatusForm:(LYChatBoxStatus)fromStatus to:(LYChatBoxStatus)toStatus {
    if (toStatus == LYChatBoxStatusShowKeyboard) {      // 显示键盘
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.chatBoxFaceView removeFromSuperview];
            [self.chatBoxMoreView removeFromSuperview];
        });
        return;
    } else if (toStatus == LYChatBoxStatusShowVoice) {    // 显示语音输入按钮
        // 从显示更多或表情状态 到 显示语音状态需要动画
        if (fromStatus == LYChatBoxStatusShowMore || fromStatus == LYChatBoxStatusShowFace) {
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:LYTabBarHeight];
                }
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        } else {
            [UIView animateWithDuration:0.1 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:LYTabBarHeight];
                }
            }];
        }
    } else if (toStatus == LYChatBoxStatusShowFace) {     // 显示表情面板
        if (fromStatus == LYChatBoxStatusShowVoice || fromStatus == LYChatBoxStatusNothing) {
            [self.chatBoxFaceView setLy_y:self.chatBox.curHeight];
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + LYChatBoxViewHeight];
                }
            }];
        } else {
            // 表情高度变化
            self.chatBoxFaceView.ly_y = self.chatBox.curHeight + LYChatBoxViewHeight;
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxFaceView.ly_y = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxMoreView removeFromSuperview];
            }];
            // 整个界面高度变化
            if (fromStatus != LYChatBoxStatusShowMore) {
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + LYChatBoxViewHeight];
                    }
                }];
            }
        }
    } else if (toStatus == LYChatBoxStatusShowMore) {     // 显示更多面板
        if (fromStatus == LYChatBoxStatusShowVoice || fromStatus == LYChatBoxStatusNothing) {
            [self.chatBoxMoreView setLy_y:self.chatBox.curHeight];
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + LYChatBoxViewHeight];
                }
            }];
        } else {
            self.chatBoxMoreView.ly_y = self.chatBox.curHeight + LYChatBoxViewHeight;
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxMoreView.ly_y = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
            }];
            
            if (fromStatus != LYChatBoxStatusShowFace) {
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight + LYChatBoxViewHeight];
                    }
                }];
            }
        }
    }
}

#pragma mark - LYChatBoxFaceViewDelegate
- (void)chatBoxFaceViewDidSelectedFace:(LYFace *)face type:(LYFaceType)type {
    if (type == LYFaceTypeEmoji) {
        [self.chatBox addEmojiFace:face];
    }
}

- (void)chatBoxFaceViewDeleteButtonDown {
    [self.chatBox deleteButtonDown];
}

- (void)chatBoxFaceViewSendButtonDown {
    [self.chatBox sendCurrentMessage];
}

#pragma mark - LYChatBoxMoreViewDelegate
- (void)chatBoxMoreView:(LYChatBoxMoreView *)chatBoxMoreView didSelectItem:(LYChatBoxItem)itemType {
    if (itemType == LYChatBoxItemAlbum) {            // 相册
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    } else if (itemType == LYChatBoxItemCamera) {       // 拍摄
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];//初始化
            [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            [imagePicker setDelegate:self];
            [self presentViewController:imagePicker animated:YES completion:^{
                
            }];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前设备不支持拍照。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"Did Selected Index Of ChatBoxMoreView: %d", (int)itemType] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *imageName = [NSString stringWithFormat:@"%lf", [[NSDate date]timeIntervalSince1970]];
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", PATH_CHATREC_IMAGE, imageName];
    NSData *imageData = (UIImagePNGRepresentation(image) == nil ? UIImageJPEGRepresentation(image, 1) : UIImagePNGRepresentation(image));
    [[NSFileManager defaultManager] createFileAtPath:imagePath contents:imageData attributes:nil];
    LYMessage *message = [[LYMessage alloc] init];
    message.messageType = LYMessageTypeImage;
    message.ownerType = LYMessageOwnerTypeSelf;
    message.sendDate = [NSDate date];
    message.imagePath = imageName;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:sendMessage:)]) {
        [_delegate chatBoxViewController:self sendMessage:message];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Private Methods
- (void)keyboardWillHide:(NSNotification *)notification {
    self.keyboardFrame = CGRectZero;
    if (_chatBox.status == LYChatBoxStatusShowFace || _chatBox.status == LYChatBoxStatusShowMore) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.chatBox.curHeight];
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification {
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (_chatBox.status == LYChatBoxStatusShowKeyboard && self.keyboardFrame.size.height <= LYChatBoxViewHeight) {
        return;
    } else if ((_chatBox.status == LYChatBoxStatusShowFace || _chatBox.status == LYChatBoxStatusShowMore) && self.keyboardFrame.size.height <= LYChatBoxViewHeight) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight: self.keyboardFrame.size.height + self.chatBox.curHeight];
    }
}

#pragma mark - Getter
- (LYChatBox *)chatBox {
    if (!_chatBox) {
        _chatBox = [[LYChatBox alloc] initWithFrame:CGRectMake(0, 0, LYScreenWidth, LYTabBarHeight)];
        [_chatBox setDelegate:self];
    }
    return _chatBox;
}

- (LYChatBoxMoreView *)chatBoxMoreView {
    if (!_chatBoxMoreView) {
        _chatBoxMoreView = [[LYChatBoxMoreView alloc] initWithFrame:CGRectMake(0, LYTabBarHeight, LYScreenWidth, LYChatBoxViewHeight)];
        [_chatBoxMoreView setDelegate:self];
        
        LYChatBoxMoreItem *photosItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"照片"
                                                                                imageName:@"sharemore_pic"];
        LYChatBoxMoreItem *takePictureItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"拍摄"
                                                                                     imageName:@"sharemore_video"];
        LYChatBoxMoreItem *videoItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"小视频"
                                                                               imageName:@"sharemore_sight"];
        LYChatBoxMoreItem *videoCallItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"视频聊天"
                                                                                   imageName:@"sharemore_videovoip"];
        LYChatBoxMoreItem *giftItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"红包"
                                                                              imageName:@"barbuttonicon_Luckymoney"];
        LYChatBoxMoreItem *transferItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"转账"
                                                                                  imageName:@"sharemorePay"];
        LYChatBoxMoreItem *positionItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"位置"
                                                                                  imageName:@"sharemore_location"];
        LYChatBoxMoreItem *favoriteItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"收藏"
                                                                                  imageName:@"sharemore_myfav"];
        LYChatBoxMoreItem *businessCardItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"个人名片"
                                                                                    imageName:@"sharemore_friendcard" ];
        LYChatBoxMoreItem *voiceItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"语音输入"
                                                                               imageName:@"sharemore_voiceinput"];
        LYChatBoxMoreItem *cardsItem = [LYChatBoxMoreItem createChatBoxMoreItemWithTitle:@"卡券"
                                                                               imageName:@"sharemore_wallet"];
        [_chatBoxMoreView setItems:[[NSMutableArray alloc] initWithObjects:photosItem, takePictureItem, videoItem, videoCallItem, giftItem, transferItem, positionItem, favoriteItem, businessCardItem, voiceItem, cardsItem, nil]];
    }
    return _chatBoxMoreView;
}

- (LYChatBoxFaceView *)chatBoxFaceView {
    if (!_chatBoxFaceView) {
        _chatBoxFaceView = [[LYChatBoxFaceView alloc] initWithFrame:CGRectMake(0, LYTabBarHeight, LYScreenWidth, LYChatBoxViewHeight)];
        [_chatBoxFaceView setDelegate:self];
    }
    return _chatBoxFaceView;
}

@end
