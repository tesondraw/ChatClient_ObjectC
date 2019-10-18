//
//  BusinessComm.m
//  ChatChat
//
//  Created by Teson on 2018/8/17.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "BusinessComm.h"

#import "TCPComm.h"



@interface BusinessComm ()
{
    TCPComm *comm;
}


@end



@implementation BusinessComm

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->comm = [[TCPComm alloc] init];
        self.connected = NO;
    }
    return self;
}

- (void)connectToHost:(NSString *)host onPort:(uint16_t)port {
    [self->comm connectToHost:host onPort:port];
}

- (void)sendData:(NSData *)data {
    NSError *error = nil;

    if (error) {
        TDLog("parse data error:%@", error.localizedDescription);
    }
}

- (void)registerWithAccount:(NSString *)account
                   password:(NSString *)password
                    success:(BasicRequestWithSuccessResponseBlock)success
                    failure:(BasicRequestWithFailureResponseBlock)failure {
    
    SendDataModel *model = [[SendDataModel alloc] init];
    
    RegisterReq *req = [[RegisterReq alloc] init];
    req.account = account;
    req.password = password;
    
    NSData *protoBuf = [req data];
    Class parseClass = [GeneralResponse class];
    
    int ACK = CMD_Register + 1;
    
    NSData *sendData = [self dataWithCommand:CMD_Register ACK:ACK protoBufLen:(int)protoBuf.length protoBuf:protoBuf];
    
    model.CMD = CMD_Register;
    model.ACK = ACK;
    model.parseClass = parseClass;
    model.sendData = sendData;
    model.successBlock = success;
    model.failureBlock = failure;
    
    [self->comm sendDataModel:model];
}

- (void)loginWithAccount:(NSString *)account
                password:(NSString *)password
                 success:(BasicRequestWithSuccessResponseBlock)success
                 failure:(BasicRequestWithFailureResponseBlock)failure {
    
    SendDataModel *model = [[SendDataModel alloc] init];
    
    LoginReq *req = [[LoginReq alloc] init];
    req.account = account;
    req.password = password;
    
    NSData *protoBuf = [req data];
    Class parseClass = [GeneralResponse class];

    int ACK = CMD_Login + 1;
    
    NSData *sendData = [self dataWithCommand:CMD_Login ACK:ACK protoBufLen:(int)protoBuf.length protoBuf:protoBuf];
    
    model.CMD = CMD_Login;
    model.ACK = ACK;
    model.parseClass = parseClass;
    model.sendData = sendData;
    model.successBlock = success;
    model.failureBlock = failure;
    
    [self->comm sendDataModel:model];
}

- (void)sendMessage:(NSString *)message
           targetID:(NSString *)targetID
           senderID:(NSString *)senderID
            success:(BasicRequestWithSuccessResponseBlock)success
            failure:(BasicRequestWithFailureResponseBlock)failure {
    
    SendDataModel *model = [[SendDataModel alloc] init];
    
    MessageContent *req = [[MessageContent alloc] init];
    req.message = message;
    req.targetId = targetID;
    req.senderId = senderID;

    NSData *protoBuf = [req data];
    Class parseClass = [GeneralResponse class];
    
    int ACK = CMD_MessageSend + 1;
    
    NSData *sendData = [self dataWithCommand:CMD_MessageSend ACK:ACK protoBufLen:(int)protoBuf.length protoBuf:protoBuf];
    
    model.CMD = CMD_MessageSend;
    model.ACK = ACK;
    model.parseClass = parseClass;
    model.sendData = sendData;
    model.successBlock = success;
    model.failureBlock = failure;
    
    [self->comm sendDataModel:model];
}

- (NSData *)dataWithCommand:(int)command
                        ACK:(int)ACK
                protoBufLen:(NSUInteger)protoBufLen
                   protoBuf:(NSData *)protoBuf {
    
    return [self dataWithCommand:command ACK:ACK protoBufLen:protoBufLen attachmentLen:0 protoBuf:protoBuf attachment:[NSData data]];
}


- (NSData *)dataWithCommand:(int)command
                        ACK:(int)ACK
                protoBufLen:(NSUInteger)protoBufLen
              attachmentLen:(NSUInteger)attachmentLen
                   protoBuf:(NSData *)protoBuf
                 attachment:(NSData *)attachment {
    
    NSMutableData *retData = [[NSMutableData alloc] init];
    
    {
        NSData *data = [NSData dataWithBytes:&command length:4];
        [retData appendData:data];
    }
    
    {
        NSData *data = [NSData dataWithBytes:&ACK length:4];
        [retData appendData:data];
    }
    
    {
        int tmp = (int)protoBufLen;
        NSData *data = [NSData dataWithBytes:&tmp length:4];
        [retData appendData:data];
    }
    
    {
        int tmp = (int)attachmentLen;
        NSData *data = [NSData dataWithBytes:&tmp length:4];
        [retData appendData:data];
    }
    
    if (protoBuf.length > 0) {
        [retData appendData:protoBuf];
    }
    
    if (attachment.length > 0) {
        [retData appendData:attachment];
    }
    
    return retData;
}

@end
