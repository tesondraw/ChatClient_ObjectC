//
//  CenterClientDataModel.h
//  IAT_V3_TEST
//
//  Created by Teson on 2018/7/11.
//  Copyright © 2018年 Teson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CenterClientModel : NSObject

+ (NSData *)dataWithCommand:(int)command bodyData:(NSData *)bodyData;


+ (NSData *)parseResponseObject:(id)object;

@end
