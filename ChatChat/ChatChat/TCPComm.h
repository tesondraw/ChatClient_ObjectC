//
//  TCPClient.h
//  ChatChat
//
//  Created by 卓天成 on 2018/8/15.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SendDataModel.h"


@interface TCPComm : NSObject


- (void)connectToHost:(NSString *)host onPort:(uint16_t)port;

- (void)sendDataModel:(SendDataModel *)dataModel;

@end
