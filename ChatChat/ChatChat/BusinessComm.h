//
//  BusinessComm.h
//  ChatChat
//
//  Created by Teson on 2018/8/17.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SendDataModel.h"

@protocol BusinessCommDelegate <NSObject>



@end


@interface BusinessComm : NSObject

@property (nonatomic, assign) BOOL connected;
    
- (void)connectToHost:(NSString *)host onPort:(uint16_t)port;


- (void)registerWithAccount:(NSString *)account
                   password:(NSString *)password
                    success:(BasicRequestWithSuccessResponseBlock)success
                    failure:(BasicRequestWithFailureResponseBlock)failure;



- (void)loginWithAccount:(NSString *)account
                password:(NSString *)password
                 success:(BasicRequestWithSuccessResponseBlock)success
                 failure:(BasicRequestWithFailureResponseBlock)failure;


- (void)sendMessage:(NSString *)message
           targetID:(NSString *)targetID
           senderID:(NSString *)senderID
            success:(BasicRequestWithSuccessResponseBlock)success
            failure:(BasicRequestWithFailureResponseBlock)failure;

@end
