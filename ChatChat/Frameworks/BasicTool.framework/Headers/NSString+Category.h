//
//  NSString+Category.h
//  AHCResidentClient
//
//  Created by Teson Draw on 6/30/16.
//  Copyright © 2016 arrcen. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 *  @author Teson Draw, 16-06-30 10:06:51
 *
 *  @brief 获取当前时间
 *
 *  @return 返回当前时间，格式为"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)currentTimeWithSeconds;


/**
 *  @author Teson Draw, 16-06-30 10:06:58
 *
 *  @brief 以当前时间作为格式的序列号，并且时间格式中带毫秒。（毫秒格式为3位)
 *
 *  @return 返回当前时间的序列号，例如：20160630102630058
 */
+ (NSString *)currentTimeWithMilliseconds;


/**
 *  @author Teson Draw, 16-06-30 10:06:33
 *
 *  @brief 当前时间与给定的时间相差多久的方法，以中文时间表示，例如“1分钟前”、“1天前”
 *
 *  @param formatTime 指定的格式化时间，格式为“YYYY-MM-dd HH:mm”或“YYYY-MM-dd HH:mm:ss”
 *
 *  @return 返回中文时间，格式为“1分钟前”、“1小时前”、“昨天”、“2天前”等等
 */
+ (NSString *)chineseTimeWithFormatTime:(NSString *)formatTime;


/**
 *  @author Teson Draw, 16-07-04 10:07:35
 *
 *  @brief 获取文本高度
 *
 *  @param font  字体
 *  @param width 显示文本的控件宽度（例如：UILabel, UITextView）
 *  @param text  需要显示的文本
 *
 *  @return 文本高度
 */
+ (CGFloat)textHeightWithFont:(UIFont *)font width:(CGFloat)width text:(NSString *)text;



/*!
 *  @author Teson Draw, 17-05-08 16:05:26
 *
 *  @brief 获取identifier for vendor(软件提供商标识符)
 *
 *  @return 跟App BudleID相关的标识符，唯一
 */
+ (NSString *)getIDFV;



/**
 获取广告标识符

 @return 广告标识符
 */
+ (NSString *)getIDFA;


/**
 时间戳转换为格式化时间
 
 @param timestamp 时间戳
 @return 格式化时间
 */
+ (NSString *)formatTimeFromTimestamp:(long long)timestamp;


/**
 把字典转换为JSON字符串

 @param dictionary 需要转换的字典
 @return JSON字符串
 */
+ (NSString *)JSONWithDictionary:(NSDictionary *)dictionary;


/**
 *  @author Teson Draw, 16-04-12 10:04:57
 *
 *  @brief 判断是否是整型字符串
 *
 *  @return YES:是整型字符串，NO:非整型字符串
 */
- (BOOL)isInteger;


/**
 *  @author Teson Draw, 16-04-12 10:04:57
 *
 *  @brief 判断是否是浮点型字符串
 *
 *  @return YES:是浮点型字符串，NO:非浮点型字符串
 */
- (BOOL)isFloat;


/*!
 *  @author Teson Draw, 16-09-01 18:09:22
 *
 *  @brief 获取字符串的MD5值
 *
 *  @return MD5值
 */
- (NSString *)MD5;

/*!
 *  @author Teson Draw, 17-03-01 10:59:22
 *
 *  @brief 获取XML节点值
 *
 *  @return tag value
 */
- (NSString *)nodeValueFromXMLStringWithTag:(NSString *)tag;


/*!
 *  @author Teson Draw, 2018-08-15 17:28:35
 *
 *  @brief 获取沙盒文档文件夹路径
 *
 */
+ (NSString *)documentDirectoryPath;

@end
