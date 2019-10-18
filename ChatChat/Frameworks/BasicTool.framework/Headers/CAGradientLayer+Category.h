//
//  CAGradientLayer+Category.h
//  GradientColorTest
//
//  Created by Teson Draw on 9/20/16.
//  Copyright © 2016 Teson Draw. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CAGradientDirectionType)
{
    CAGradientDirectionFromTopToBottom,
    CAGradientDirectionFromLeftToRight,
    CAGradientDirectionFromBottomToTop,
    CAGradientDirectionFromRightToLeft
};

@interface CAGradientLayer (Category)

+ (CAGradientLayer *)initWithFrame:(CGRect)frame directionType:(CAGradientDirectionType)directionType startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end
