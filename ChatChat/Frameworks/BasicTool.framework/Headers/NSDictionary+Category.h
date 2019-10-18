//
//  NSDictionary+Category.h
//  FrameworkProject
//
//  Created by Teson Draw on 2017/5/15.
//  Copyright © 2017年 Teson Draw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)


/**
 根据服务器反馈的错误码转换为本地的提示消息

 @param code 服务器错误码
 @param message 本地需要显示的消息
 @return 错误和错误消息字典
 */
+ (NSDictionary *)dictionaryWithCode:(NSInteger)code message:(NSString *)message;


/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param JSONString JSON格式的字符串
 
 * @return 返回字典
 
 */

+ (NSDictionary *)dictionaryWithJSONString:(NSString *)JSONString;

@end
