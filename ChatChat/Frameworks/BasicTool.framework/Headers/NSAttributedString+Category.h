//
//  NSAttributedString+Category.h
//  AHCResidentClient
//
//  Created by Teson Draw on 7/4/16.
//  Copyright © 2016 arrcen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Category)

/**
 *  标志字符串之后的文本为另外属性-固定颜色
 *
 *  @param string      全部文本
 *  @param indexString 标志字符串
 *
 *  @return 标志字符串之后的文本为另外属性字符串
 */
+ (NSAttributedString *)fromString:(NSString *)string
                       indexString:(NSString *)indexString;

/**
 *  标志字符串之后的文本为另外属性-指定颜色
 *
 *  @param string             全部文本
 *  @param forePartAttribute  全部文本属性
 *  @param indexString        标志字符串
 *  @param afterPartAttribute 标志字符串之后的文本属性
 *
 *  @return 标志字符串之后的文本为另外属性字符串
 */
+ (NSAttributedString *)fromString:(NSString *)string
                 forePartAttribute:(NSDictionary *)forePartAttribute
                       indexString:(NSString *)indexString
                afterPartAttribute:(NSDictionary *)afterPartAttribute;


/**
 *  前部文本和后部文本分别为两种属性-固定颜色
 *
 *  @param forePartString  前部文本
 *  @param afterPartString 后部文本
 *
 *  @return 前部文本和后部文本分别为两种属性字符串
 */
+ (NSAttributedString *)fromForePartString:(NSString *)forePartString
                           afterPartString:(NSString *)afterPartString;

/**
 *  前部文本和后部文本分别为两种属性-指定颜色
 *
 *  @param forePartString     前部文本
 *  @param forePartAttribute  前部文本属性
 *  @param afterPartString    后部文本
 *  @param afterPartAttribute 后部文本属性
 *
 *  @return 前部文本和后部文本分别为两种属性字符串
 */
+ (NSAttributedString *)forePartString:(NSString *)forePartString
                     forePartAttribute:(NSDictionary *)forePartAttribute
                       afterPartString:(NSString *)afterPartString
                    afterPartAttribute:(NSDictionary *)afterPartAttribute;

@end
