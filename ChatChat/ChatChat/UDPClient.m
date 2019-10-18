//
//  UDPClient.m
//  ChatChat
//
//  Created by 卓天成 on 2018/8/15.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "UDPClient.h"

#import "GCDAsyncUdpSocket.h"



#define LOCAL_PORT 9530


@interface UDPClient() <GCDAsyncUdpSocketDelegate>

@property (strong, nonatomic) GCDAsyncUdpSocket *socket;

@end

//[self initGCDAsyncUdpSocket];

@implementation UDPClient


- (void)initGCDAsyncUdpSocket {

    self.socket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    NSError *error = nil;
    
    
    [self.socket bindToPort:LOCAL_PORT error:&error];
    if(error)
    {
        NSLog(@"%s,%d, %s \n asyncUdpSocket bindToPort: error = %@",__FILE__,__LINE__,__FUNCTION__, error);
        error = nil;
    }
    
    if (![self.socket beginReceiving:&error]) {     // 开始监听
        NSLog(@"beginReceiving: %@", error);
        return ;
    }
    
    [self.socket enableBroadcast:YES error:&error];
    if(error)
    {
        NSLog(@"%s,%d, %s \n asyncUdpSocket enableBroadcast: error = %@",__FILE__,__LINE__,__FUNCTION__, error);
        error = nil;
    }
    //    [self.socket receiveWithTimeout:-1 tag:0];
    
    //"182.92.199.156", 9999
    // 服务器  127.0.0.1  6666
    //    if (![self.socket connectToHost:@"182.92.199.156" onPort:9999 error:&error]) {   // 连接服务器
    
    //    if (![self.socket connectToHost:SERVER_IP onPort:SERVER_PORT error:&error]) {   // 连接服务器
    //        NSLog(@"连接失败：%@", error);
    //        return ;
    //    }
}

#pragma mark - UDP Socket Delegate
- (void)udpSocket:(GCDAsyncUdpSocket *)sock didConnectToAddress:(NSData *)address {
    NSLog(@"连接成功");
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag {
    NSLog(@"发送成功");
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error {
    NSLog(@"发送失败 %@", error);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data
      fromAddress:(NSData *)address
withFilterContext:(nullable id)filterContext {
    NSString *dat = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"收到回复：%@", dat);
    
    NSLog(@"收到的原始数据：%@, 数据长度：%lu", data, (unsigned long)data.length);
    
//    NSError *error = nil;
//
//    FindLessonRes *message = [[FindLessonRes alloc] initWithData:[self parseResponseObject:data] error:&error];
//
//    if (error) {
//        TDLog("parse data error:%@", error.localizedDescription);
//    } else {
//        TDLog("response data is:%@", message);
//    }
    
    
    NSString *host = nil;
    uint16_t port = 0;
    [GCDAsyncUdpSocket getHost:&host port:&port fromAddress:address];
    NSLog(@"message from : %@:%hu", host, port);
    
    
}


@end
