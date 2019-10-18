//
//  SendDataModel.m
//  ChatChat
//
//  Created by Teson on 2018/8/17.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "SendDataModel.h"

@implementation SendDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isStartedRecv = false;
        _isSentFirstBlock = false;
        
        _sentLen = 0;
        _shouldRecvAttachmentLen = 0;
        _receivedAttachmentLen = 0;
        
        _responseAttachmentData = [[NSMutableData alloc] initWithCapacity:0];
    }
    return self;
}

@end
