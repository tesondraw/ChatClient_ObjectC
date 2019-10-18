//
//  Public.h
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/11.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const CenterServerAddress;

/* User Defaults */
extern NSString * const KeySessionID;
extern NSString * const KeyDeviceToken;

/* Notification */
extern NSString * const LoginCenterServerSuccessNotification;
extern NSString * const GetP2PTokenSuccessNotification;
extern NSString * const LoginP2PServerSuccessNotification;
extern NSString * const DisplayLogNotification;

extern NSString * const SendDataNotification;


extern NSString * const DownloadFileSuccessNotification;


@interface Public : NSObject

+ (NSString *)errorInfoWithCode:(int)code;

@end
