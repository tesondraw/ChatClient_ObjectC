//
//  UserSingleton.h
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/10.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BusinessComm.h"


@interface UserInfo : NSObject


@property (nonatomic, copy) NSString *deviceToken;

@property (nonatomic, copy) NSString *sessionID;

@property (nonatomic, copy) NSString *downloadPicPath;

@property (nonatomic, copy) NSString *attachmentPath;/* NSTemporaryDirectory()/attachment.tmp */

@property (nonatomic, strong) NSDictionary *errorInfo;

@property (nonatomic, strong) NSString *loginedAccount;///<已登录账号
@property (nonatomic, strong) NSString *loginedPassword;///<已登录账号的密码
    
@property (nonatomic, strong) BusinessComm *comm;

+ (UserInfo *)sharedInstance;

@end
