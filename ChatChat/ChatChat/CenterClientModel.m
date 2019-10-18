//
//  CenterClientDataModel.m
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/11.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import "CenterClientModel.h"

//#import "Communal.pbobjc.h"
//#import "Exception.pbobjc.h"

@implementation CenterClientModel

+ (NSData *)dataWithCommand:(int)command bodyData:(NSData *)bodyData {
    NSMutableData *returnData = [[NSMutableData alloc] init];
    
    /* COMMAND */
    {
        command = htonl(command);
        NSData *data = [NSData dataWithBytes:&command length: sizeof(int)];
        
        [returnData appendData:data];
    }
    
    /* BODY DATA LENGTH */
    {
        int length = htonl(bodyData.length);
        NSData *data = [NSData dataWithBytes:&length length: sizeof(int)];
        
        [returnData appendData:data];
    }
    
     /* BODY DATA */
    if (bodyData.length != 0) {
        [returnData appendData:bodyData];
    }
    
    return [returnData copy];
}

+ (NSData *)parseResponseObject:(id)object {
    
    if (!object) {
        return nil;
    }
    
    if ([object isKindOfClass:[NSData class]]) {
        
        NSData *data = [NSData dataWithData:object];
        
        NSData *cmdData = [data subdataWithRange:NSMakeRange(0, 4)];
        NSData *lenData = [data subdataWithRange:NSMakeRange(4, 4)];
        
        int cmd = 0;
        {
            [cmdData getBytes:&cmd length:4];
            
            cmd = ntohl(cmd);
        }
        
        int len = 0;
        {
            [lenData getBytes:&len length:4];
            
            len = ntohl(len);
        }
        
        NSData *bodyData = [data subdataWithRange:NSMakeRange(8, len)];
        
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
