//
//  ViewController.m
//  UDPClient
//
//  Created by caokun on 16/8/25.
//  Copyright © 2016年 caokun. All rights reserved.
//

#import "ViewController.h"

#import "TDNetworking.h"

#import "SingleChatViewController.h"


#import "CenterClientModel.h"

#import "Public.h"


#import "TCPComm.h"



#define ServerHeartbeatInterval 60



@interface ViewController ()
{
    TCPComm *client;
}


@property (strong, nonatomic) dispatch_queue_t delegateQueue;

@property (nonatomic, assign) bool bConnected;
@property (nonatomic, assign) bool bReceivingData;

@property (nonatomic, strong) NSThread *sendHeartbeatThread;

@property (nonatomic, assign) int32_t heartbeatIntervalStart;
@property (nonatomic, assign) int32_t lastRecvHeartbeatTime;


@property (weak, nonatomic) IBOutlet UILabel *downloadEclapsedTimeLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@property (nonatomic, strong) NSMutableData *recvData;


@property (weak, nonatomic) IBOutlet UIImageView *downloadFileImageView;

@property (nonatomic, copy) NSString *downloadFilesPath;

@property (nonatomic, assign) int32_t downloadFileStartTime;


@property (weak, nonatomic) IBOutlet UITextField *serverIPTextField;
@property (weak, nonatomic) IBOutlet UITextField *serverPortTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [_indicator setHidden:YES];
//
    [self initData];
//
//    [self addObserver];

}



- (void)initData {
    self->client = [[TCPComm alloc] init];
//    _buffer = [[NSMutableData alloc] initWithCapacity:10 * 1024 * 1024];
    _recvData = [[NSMutableData alloc] init];
    
    _bConnected = false;
    _bReceivingData = false;
    _heartbeatIntervalStart = [self currentTimeInSeconds];
    
    NSString * documentDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _downloadFilesPath = [NSString stringWithFormat:@"%@/%@", documentDirPath, @"download"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:_downloadFilesPath]) {
        
        NSError *error = nil;
        
        [[NSFileManager defaultManager] createDirectoryAtPath:_downloadFilesPath withIntermediateDirectories:NO attributes:nil error:&error];
        
        if (error) {
            TDLog("parse data error:%@", error.localizedDescription);
        }
    }
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadFileSuccessNotification:) name:DownloadFileSuccessNotification object:nil];
}


- (void)downloadFileSuccessNotification:(NSNotification *)notification {
    NSLog(@"current thread:%@", [NSThread currentThread]);
    

    NSString *filePath = notification.object;
    
    __block typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.indicator stopAnimating];
        weakSelf.downloadFileImageView.image = [UIImage imageWithContentsOfFile:filePath];//@"";
    });
}




#pragma mark -- 按钮事件

- (IBAction)connectToServerAction:(id)sender {

//    NSString *serverIP = [_serverIPTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//
//    NSString *serverPort = [_serverPortTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//
//    [self initGCDAsyncSocketWithIP:serverIP port:[serverPort intValue]];
}

- (IBAction)loginAction:(id)sender {
    
//    SingleChatViewController *vc = [[SingleChatViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)searchServerAction:(id)sender {
//    NSLog(@"xxxx");
//    NSString *str = @"谁是服务器？我在找你";
//    NSData  *data = [str dataUsingEncoding:NSUTF8StringEncoding];

//    [self.socket sendData:data
//                   toHost:@"255.255.255.255"
//                     port:9527
//              withTimeout:-1
//                      tag:0];
}

- (IBAction)writeFileAction:(id)sender {
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", _downloadFilesPath, @"1.jpg"];
    
    [_recvData writeToFile:filePath atomically:YES];
    
    [_recvData setLength:0];
    
    NSLog(@"write file end");
}


- (IBAction)sendContentAction:(id)sender {

}

- (void)sendHeartbeatAction {
    while (true) {
//        NSLog(@"");
        
        if (_bReceivingData) {
            int32_t now = [self currentTimeInSeconds];
            
            int32_t difference = now - _downloadFileStartTime;
            
            __block typeof(self)weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.downloadEclapsedTimeLabel.text = [NSString stringWithFormat:@"%d", difference];
            });
        }
        
        if (_bConnected) {
            int32_t now = [self currentTimeInSeconds];
            if ((now - _heartbeatIntervalStart) > ServerHeartbeatInterval) {
                
                /* 如果正在接收数据，不发送心跳包 */
                if (!_bReceivingData) {
//                    NSData *sendData = [self transmitDataWithCommand:Cmd_HeartBeat ACK:1 protoBufLen:0 attachmentLen:0 protoBuf:[NSData data] attachment:[NSData data]];
                    
//                    [_asyncSocket writeData:sendData withTimeout:-1 tag:10];
                }

                _heartbeatIntervalStart = [self currentTimeInSeconds];
            }
        }
        
        [NSThread sleepForTimeInterval:1];
    }
}

- (int64_t)currentTimeInMilliseconds {
    return (int64_t)([[NSDate date] timeIntervalSince1970] * 1000);
}

- (int32_t)currentTimeInSeconds {
    return (int32_t)([[NSDate date] timeIntervalSince1970]);
}

- (NSData *)transmitDataWithCommand:(int)command
                                ACK:(int)ACK
                        protoBufLen:(NSUInteger)protoBufLen
                      attachmentLen:(NSUInteger)attachmentLen
                           protoBuf:(NSData *)protoBuf
                         attachment:(NSData *)attachment {

    NSMutableData *retData = [[NSMutableData alloc] init];
    
    {
        int tmp = htonl(command);
        NSData *data = [NSData dataWithBytes:&tmp length:4];
        [retData appendData:data];
    }
    
    {
        int tmp = htonl(ACK);
        NSData *data = [NSData dataWithBytes:&tmp length:4];
        [retData appendData:data];
    }
    
    {
        int tmp = htonl(protoBufLen);
        NSData *data = [NSData dataWithBytes:&tmp length:4];
        [retData appendData:data];
    }
    
    {
        int tmp = htonl(attachmentLen);
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

- (NSData *)parseResponseObject:(id)object {
    
    if (!object) {
        return nil;
    }
    
    if ([object isKindOfClass:[NSData class]]) {
        
        NSData *data = [NSData dataWithData:object];
        
        NSData *cmdData = [data subdataWithRange:NSMakeRange(0, 4)];
//        NSData *lenData = [data subdataWithRange:NSMakeRange(4, 4)];
        
        int cmd = 0;
        {
            [cmdData getBytes:&cmd length:4];
            
            cmd = ntohl(cmd);
            NSLog(@"command is:%d", cmd);
        }
        
//        int len = 0;
//        {
//            [lenData getBytes:&len length:4];
//
//            len = ntohl(len);
//        }
        
        NSData *bodyData = [data subdataWithRange:NSMakeRange(4, data.length - 4)];
        
        if (bodyData.length > 0) {
            return bodyData;
        }
    } else {
        TDLog("not data");
        
        return nil;
    }
    
    return nil;
}

@end

