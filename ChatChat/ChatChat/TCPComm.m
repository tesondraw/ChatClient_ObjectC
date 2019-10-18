//
//  TCPClient.m
//  ChatChat
//
//  Created by 卓天成 on 2018/8/15.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "TCPComm.h"

#import "GCDAsyncSocket.h"


//#define SERVER_IP @"192.168.120.169"
//#define SERVER_IP @"192.168.3.6"

//#define SERVER_PORT 9528

@interface TCPComm() <GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *socket;
    NSMutableArray <SendDataModel *> *sendTaskArray;
}

@end


@implementation TCPComm

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->sendTaskArray = [[NSMutableArray alloc] init];
        [self initGCDAsyncSocket];
    }
    return self;
}

- (void)initGCDAsyncSocket {
    self->socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
}

#pragma mark - Async Socket Delegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"%s:socket成功建立。host:%@, port:%ud", __FUNCTION__, host, port);
    
    [sock readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    int32_t cmd = 0;
    {
        [data getBytes:&cmd range:NSMakeRange(0, 4)];
        NSLog(@"cmd:%u", cmd);
    }
    
    int32_t ACK = 0;
    {
        [data getBytes:&ACK range:NSMakeRange(4, 4)];
        NSLog(@"ACK:%u", ACK);
    }
    
    int32_t protoBufLen = 0;
    {
        [data getBytes:&protoBufLen range:NSMakeRange(8, 4)];
        NSLog(@"protobuf len:%u", protoBufLen);
    }
    
    int32_t attachmentLen = 0;
    {
        [data getBytes:&attachmentLen range:NSMakeRange(12, 4)];
        NSLog(@"attachment len:%u", attachmentLen);
    }
    
    if (data.length - 12 < protoBufLen) {
        NSLog(@"protobuf数据不够");
        return;
    }
    
    NSData *protoBufData = [data subdataWithRange:NSMakeRange(16, protoBufLen)];
    if (protoBufData.length < protoBufLen) {
        NSLog(@"接收数据 proto buffer 有错");
        return;
    }
    
    if (self->sendTaskArray.count > 0) {
        SendDataModel *model = self->sendTaskArray[0];
        
        if (model.ACK == ACK) {
            
            switch (cmd) {
                case CMD_Register:
                {
                    NSError *error = nil;
                    GeneralResponse *message = [[model.parseClass alloc] initWithData:protoBufData error:&error];
                    
                    if (error) {
                        
                        if (model.successBlock) {
                            GeneralResponse *response = [[GeneralResponse alloc] init];
                            response.code = ErrorCode_ParseData;
                            model.successBlock(response);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                        TDLog("parse data error:%@", error.localizedDescription);
                    } else {
                        if (model.successBlock) {
                            model.successBlock(message);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                    }
                }
                    break;
                    
                
                case CMD_Login:
                {
                    NSError *error = nil;
                    GeneralResponse *message = [[model.parseClass alloc] initWithData:protoBufData error:&error];
                    
                    if (error) {
                    
                        if (model.successBlock) {
                            GeneralResponse *response = [[GeneralResponse alloc] init];
                            response.code = ErrorCode_ParseData;
                            model.successBlock(response);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                        TDLog("parse data error:%@", error.localizedDescription);
                    } else {
                        if (model.successBlock) {
                            model.successBlock(message);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                    }
                }
                    break;
                    
                case CMD_MessageSend:
                {
                    NSError *error = nil;
                    GeneralResponse *response = [[model.parseClass alloc] initWithData:protoBufData error:&error];
                    
                    if (error) {
                        
                        if (model.successBlock) {
                            GeneralResponse *responseError = [[GeneralResponse alloc] init];
                            responseError.code = ErrorCode_ParseData;
                            model.successBlock(responseError);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                        TDLog("parse data error:%@", error.localizedDescription);
                    } else {
                        if (model.successBlock) {
                            model.successBlock(response);
                        }
                        
                        [self->sendTaskArray removeObjectAtIndex:0];
                    }
                }
                    break;

                default:

                    break;
            }
        } else {
            NSLog(@"返回的ACK不一致");
        }
    } else {

        NSLog(@"content cmd:%d", cmd);
        
        switch (cmd) {
            case CMD_MessageRecv:
            {
                NSError *error = nil;
                MessageContent *response = [[MessageContent alloc] initWithData:protoBufData error:&error];

                if (error) {

//                    if (model.successBlock) {
//                        GeneralResponse *responseError = [[GeneralResponse alloc] init];
//                        responseError.code = ErrorCode_ParseData;
//                        model.successBlock(responseError);
//                    }

//                    [self->sendTaskArray removeObjectAtIndex:0];
                    TDLog("MessageContent parse data error:%@", error.localizedDescription);
                } else {
                    [[NSNotificationCenter defaultCenter] postNotificationName:ReceivedMessageNotification object:response];
                }
            }
            break;
            
            default:
            break;
        }

    }
    
    [sock readDataWithTimeout:-1 tag:0];
}


- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)error
{
    NSLog(@"%s:断开连接：error：%@", __FUNCTION__, error.localizedDescription);
}


- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"sock:%@, didWriteDataWithTag:%ld", sock, tag);
}


- (void)connectToHost:(NSString *)host onPort:(uint16_t)port {
    NSError *error = nil;
    
    if (![self->socket connectToHost:host onPort:port withTimeout:-1 error:&error])
    {
        NSLog(@"socket连接服务器错误：%@", error);
    }
}

- (void)sendDataModel:(SendDataModel *)dataModel {
    [self->sendTaskArray addObject:dataModel];
    
    [self->socket writeData:dataModel.sendData withTimeout:-1 tag:1];
}

@end
