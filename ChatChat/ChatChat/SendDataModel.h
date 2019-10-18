//
//  SendDataModel.h
//  ChatChat
//
//  Created by Teson on 2018/8/17.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PublicUse.pbobjc.h"
//#import "Error.pbobjc.h"

typedef void(^BasicRequestWithSuccessResponseBlock)(GeneralResponse *response);
typedef void(^BasicRequestWithFailureResponseBlock)(NSError *error);

//typedef void(^TestRequestWithSuccessResponseBlock)(id message);



@interface SendDataModel : NSObject

/* 发送和接收都可以使用 */
@property (nonatomic, assign) int CMD;
@property (nonatomic, assign) int ACK;


/* 发送时使用 */
@property (nonatomic, strong) NSData *sendData;
@property (nonatomic, assign) int sentLen;///<有附件时，计算已发送附件的长度
@property (nonatomic, assign) NSUInteger attachmentLen;
@property (nonatomic, strong) NSArray <NSString *> *uploadFilesArray;
@property (nonatomic, assign) bool isSentFirstBlock;

/* 接收回应时使用的参数 */
@property (nonatomic, assign) Class parseClass;
@property (nonatomic, strong) GPBMessage *message;
@property (nonatomic, assign) bool isStartedRecv;///<是否已开始接收
@property (nonatomic, assign) NSUInteger shouldRecvAttachmentLen;///<需要接收的附件长度
@property (nonatomic, assign) NSUInteger receivedAttachmentLen;///<已接收附件长度

@property (nonatomic, strong) NSData *responseProtoBufData;
@property (nonatomic, strong) NSMutableData *responseAttachmentData;///<附件缓冲
@property (nonatomic, strong) NSArray *downloadFilesArray;

@property (nonatomic, copy) BasicRequestWithSuccessResponseBlock successBlock;
@property (nonatomic, copy) BasicRequestWithFailureResponseBlock failureBlock;

//@property (nonatomic, copy) TestRequestWithSuccessResponseBlock successBlockEx;

@end
