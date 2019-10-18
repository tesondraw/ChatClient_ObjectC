//
//  UserSingleton.m
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/10.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (UserInfo *)sharedInstance {
    static UserInfo *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[UserInfo alloc] init];
    });
    
    return instance;
}


@end
