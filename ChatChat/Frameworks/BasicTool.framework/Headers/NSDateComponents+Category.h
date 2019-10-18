//
//  NSDateComponents+Category.h
//  AHCResidentClient
//
//  Created by Teson Draw on 7/4/16.
//  Copyright © 2016 arrcen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (Category)

/**
 *  @author Teson Draw, 16-07-04 09:07:01
 *
 *  @brief 生成一个以当前时间的NSDateComponents对象
 *
 *  @return 生成一个以当前时间的NSDateComponents对象
 */
+ (NSDateComponents *)now;


///**
 //*  @author Teson Draw, 16-07-04 09:07:27
 //*
 //*  @brief 生成一个指定年月日的NSDateComponents对象
 //*
 //*  @param year  年
 //*  @param month 月
 //*  @param day   日
 //*
 //*  @return 生成一个指定年月日的NSDateComponents对象
 //*/
//+ (NSDateComponents *)dateComponentsWithYear:(NSInteger)year
                                       //month:(NSInteger)month
                                         //day:(NSInteger)day;


///**
 //*  @author Teson Draw, 16-07-04 09:07:06
 //*
 //*  @brief 生成一个指定年月日的NSDateComponents对象
 //*
 //*  @param string 时间格式字符串，年月日以“/”符号分隔
 //*
 //*  @return 生成一个指定年月日的NSDateComponents对象
 //*/
//+ (NSDateComponents *)dateComponentsFromString:(NSString *)string;


@end
