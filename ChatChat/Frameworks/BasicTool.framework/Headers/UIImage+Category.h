//
//  UIImage+Category.h
//  AHCResidentClient
//
//  Created by Teson Draw on 6/17/16.
//  Copyright © 2016 arrcen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  @author Teson Draw, 16-06-17 02:06:07
 *
 *  @brief 生成二维码图片
 *
 *  @param url  url
 *  @param size 图片大小
 *
 *  @return 指定URL，指定大小的二维码图片
 */
+ (UIImage *)QRCodeImageWithURL:(NSString *)url size:(CGSize)size;


/**
 *  @author Teson Draw, 16-06-17 02:06:07
 *
 *  @brief 生成二维码图片
 *
 *  @param code   二维码字符串
 *  @param width  图片宽度
 *  @param height 图片高度
 *
 *  @return 指定URL，指定大小的二维码图片
 */
+ (UIImage *)generateQRCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;


/*!
 *  @author Teson Draw, 16-07-29 16:07:19
 *
 *  @brief 根据UIColor生成一张图片
 *
 *  @param color UIColor
 *
 *  @return 图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color;


/*!
 *  @author Teson Draw, 17-03-20 16:07:19
 *
 *  @brief 根据UIColor，半径生成一张圆形图片
 *
 *  @param color    颜色
 *  @param diameter 直径
 *
 *  @return 图片
 */
+ (UIImage *)roundImageWithColor:(UIColor *)color diameter:(CGFloat)diameter;


/*!
 *  @author Teson Draw, 17-03-20 16:07:19
 *
 *  @brief 根据UIColor，半径生成一张圆形图片
 *
 *  @param color    颜色
 *  @param arrowColor 直径
 *  @param greatCircleRadius 大圆半径
 *  @param smallCircleRadius 小圆半径
 *  @param interval 扇形图片间的间隔
 *  @return 扇形图片
 */
+ (UIImage *)fanshapedImageWithColor:(UIColor *)color
                          arrowColor:(UIColor *)arrowColor
                   greatCircleRadius:(CGFloat)greatCircleRadius
                   smallCircleRadius:(CGFloat)smallCircleRadius
                            interval:(CGFloat)interval;


/*!
 *  @author Teson Draw, 17-03-20 16:07:19
 *
 *  @brief 旋转图片
 *
 *  @param orientation 旋转方向(目前提供，左旋转90度，右旋转90度，旋转180度3种)
 *
 *  @return 旋转后的图片
 */
- (UIImage *)rotateWithOrientation:(UIImageOrientation)orientation;


/*!
 *  @author Teson Draw, 17-03-31 16:18:19
 *
 *  @brief 根据字符串参数，生成指定宽高的条码图片
 *
 *  @param code   字符串
 *  @param width  宽度
 *  @param height 高度
 *
 *  @return 条码图片
 */
+ (UIImage *)generateBarCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;



/*!
 *  @author Teson Draw, 17-05-02 15:05:53
 *
 *  @brief 改变图片的颜色
 *
 *  @param tintColor 色调
 *
 *  @return 生成指定颜色的新图片
 */
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;


/*!
 *  @author Teson Draw, 17-05-03 11:05:34
 *
 *  @brief 生成一张指定颜色的左箭头
 *
 *  @param color 颜色
 *
 *  @return 箭头图片
 */
+ (UIImage *)leftArrowWithColor:(UIColor *)color;

@end
