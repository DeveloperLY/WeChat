//
//  LYMessage.m
//  WeChat
//
//  Created by Y Liu on 16/3/2.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYMessage.h"
#import "LYChatHelper.h"

static UILabel *label = nil;

@implementation LYMessage

- (instancetype)init {
    self = [super init];
    if (self) {
        if (!label) {
            label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            label.font = [UIFont systemFontOfSize:16.0f];
        }
    }
    return self;
}

#pragma mark - Setter and Getter
- (void)setText:(NSString *)text {
    _text = text;
    if (text.length > 0) {
        _attrText = [LYChatHelper formatMessageString:text];
    }
}

- (void)setMessageType:(LYMessageType)messageType {
    _messageType = messageType;
    switch (messageType) {
        case LYMessageTypeUnknown: {
            self.cellIndentify = @"UnknownMessageCell";
            break;
        }
        case LYMessageTypeSystem: {
            self.cellIndentify = @"SystemMessageCell";
            break;
        }
        case LYMessageTypeText: {
            self.cellIndentify = @"TextMessageCell";
            break;
        }
        case LYMessageTypeImage: {
            self.cellIndentify = @"ImageMessageCell";
            break;
        }
        case LYMessageTypeVoice: {
            self.cellIndentify = @"VoiceMessageCell";
            break;
        }
        case LYMessageTypeVideo: {
            self.cellIndentify = @"VideoMessageCell";
            break;
        }
        case LYMessageTypeFile: {
            self.cellIndentify = @"FileMessageCell";
            break;
        }
        case LYMessageTypeLocation: {
            self.cellIndentify = @"LocationMessageCell";
            break;
        }
        case LYMessageTypeShake: {
            self.cellIndentify = @"ShakeMessageCell";
            break;
        }
    }
}

- (CGSize)messageSize {
    switch (self.messageType) {
        case LYMessageTypeUnknown: {
            
            break;
        }
        case LYMessageTypeSystem: {
            
            break;
        }
        case LYMessageTypeText: {
            [label setAttributedText:self.attrText];
            _messageSize = [label sizeThatFits:CGSizeMake(LYScreenWidth * 0.58, CGFLOAT_MAX)];
            break;
        }
        case LYMessageTypeImage: {
            NSString *path = [NSString stringWithFormat:@"%@/%@", PATH_CHATREC_IMAGE, self.imagePath];
            _image = [UIImage imageNamed:path];
            if (_image != nil) {
                _messageSize = (_image.size.width > LYScreenWidth * 0.5 ? CGSizeMake(LYScreenWidth * 0.5, LYScreenWidth * 0.5 / _image.size.width * _image.size.height) : _image.size);
                _messageSize = (_messageSize.height > 60 ? (_messageSize.height < 200 ? _messageSize : CGSizeMake(_messageSize.width, 200)) : CGSizeMake(60.0 / _messageSize.height * _messageSize.width, 60));
            } else {
                _messageSize = CGSizeMake(0, 0);
            }
            break;
        }
        case LYMessageTypeVoice: {
            
            break;
        }
        case LYMessageTypeVideo: {
            
            break;
        }
        case LYMessageTypeFile: {
            
            break;
        }
        case LYMessageTypeLocation: {
            
            break;
        }
        case LYMessageTypeShake: {
            
            break;
        }
    }
    return _messageSize;
}

- (CGFloat)cellHeight {
    switch (self.messageType) {
        case LYMessageTypeUnknown: {
            
            break;
        }
        case LYMessageTypeSystem: {
            
            break;
        }
        case LYMessageTypeText: {
            return self.messageSize.height + 40 > 60 ? self.messageSize.height + 40 : 60;
            break;
        }
        case LYMessageTypeImage: {
            return self.messageSize.height + 20;
            break;
        }
        case LYMessageTypeVoice: {
            
            break;
        }
        case LYMessageTypeVideo: {
            
            break;
        }
        case LYMessageTypeFile: {
            
            break;
        }
        case LYMessageTypeLocation: {
            
            break;
        }
        case LYMessageTypeShake: {
            
            break;
        }
    }
    return 0;
}

@end
