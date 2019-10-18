//
//  Public.m
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/11.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import "Public.h"

#import "UserInfo.h"

//NSString * const CenterServerAddress = @"http://192.168.120.111:8080/control/";
NSString * const CenterServerAddress = @"http://192.168.1.12:8080/control/";

/* User Defaults */
NSString * const KeySessionID = @"KeySessionID";
NSString * const KeyDeviceToken = @"KeyDeviceToken";


/* Notification */
NSString * const LoginCenterServerSuccessNotification = @"LoginCenterServerSuccessNotification";
NSString * const GetP2PTokenSuccessNotification = @"GetP2PTokenSuccessNotification";
NSString * const LoginP2PServerSuccessNotification = @"LoginP2PServerSuccessNotification";

NSString * const SendDataNotification = @"SendDataNotification";


NSString * const DisplayLogNotification = @"DisplayLogNotification";

NSString * const DownloadFileSuccessNotification = @"DownloadFileSuccessNotification";

@implementation Public

+ (NSString *)errorInfoWithCode:(int)code {
    NSString *codeStr = [NSString stringWithFormat:@"%d", code];
    
    NSString *result = [[UserInfo sharedInstance].errorInfo objectForKey:codeStr];
    
    return result;
}

@end
