//
//  NSObject+Category.h
//  FrameworkProject
//
//  Created by Teson Draw on 2017/3/21.
//  Copyright © 2017年 Teson Draw. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface NSObject (Category)


+ (CGSize)rectSizeWithGreatCircleRadius:(CGFloat)greatCircleRadius
                      smallCircleRadius:(CGFloat)smallCircleRadius
                               interval:(CGFloat)interval;

//+ (NSDictionary *)dictionaryWithErrorCode:(NSInteger)errorCode message:(NSString *)message;
//
//+ (NSDictionary *)dictionaryWithSuccessCode:(NSInteger)successCode message:(NSString *)message;
//
//
//+ (NSDictionary *)dictionaryWithCode:(NSInteger)code message:(NSString *)message;

@end
