//
//  UIColor+Category.h
//  Pocketbook
//
//  Created by Teson Draw on 6/7/16.
//  Copyright © 2016 Teson Draw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/**
 *  @author Teson Draw, 16-06-07 11:06:46
 *
 *  @brief 通过16进制数值获取颜色对象
 *
 *  @param hex 16进制值
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(long)hex;


/**
 *  @author Teson Draw, 16-06-07 11:06:31
 *
 *  @brief 通过16进制数值获取颜色对象，带透明度参数
 *
 *  @param hexColor 16进制值
 *  @param opacity  透明度(0 ~ 1)
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;


/**
 *  @author Teson Draw, 16-06-08 09:06:41
 *
 *  @brief 通过rgb值获取颜色对象，不用再除以255.f
 *
 *  @param red   红色值
 *  @param green 绿色值
 *  @param blue  蓝色值
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


/**
 *  @author Teson Draw, 16-06-08 09:06:30
 *
 *  @brief 通过RGB值和alpha值获取颜色对象，不用再除以255.f
 *
 *  @param red   红色值
 *  @param green 绿色值
 *  @param blue  蓝色值
 *  @param alpha alpha值
 *
 *  @return UIColor对象
 */
+ (UIColor *)colourWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  @author Teson Draw, 16-12-28 16:17:30
 *
 *  @brief 从十六进制字符串获取颜色
 *
 *  @nitice 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;///<从十六进制字符串获取颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
