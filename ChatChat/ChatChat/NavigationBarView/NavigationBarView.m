//
//  NavigationBarView.m
//
//
//  Created by Teson Draw on 14/12/11.
//  Copyright (c) 2014年 Teson Draw. All rights reserved.
//

#import "NavigationBarView.h"
//#import "MacrosDefinition.h"

#define TITLE_LABEL_FONT_SIZE 17
#define LEFT_OR_RIGHT_BUTTON_FONT_SIZE 16

#define TITLE_LABEL_FONT_COLOR [UIColor whiteColor]
#define DEFAULT_BUTTON_TITLE_COLOR [UIColor whiteColor]//按钮标题默认颜色
#define NAVIGATIONBAR_DEFAULT_COLOR [UIColor colorWithRed:68/255.f green:185/255.f blue:231/255.f alpha:1]

#define LEFT_BUTTON_ORIGIN_X 15

@interface NavigationBarView ()

//@property (strong, nonatomic) UIButton  *leftSecondButton;
//@property (strong, nonatomic) UIButton  *rightSecondButton;
//
//@property (nonatomic, strong) UIView    *leftButtonBackgroundView;
//
//@property (nonatomic, strong) UIImageView *leftButtonImageView;
//@property (nonatomic, strong) UIImageView *rightButtonImageView;

@end

@implementation NavigationBarView

//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//          backgroundImageName:(NSString *)backgroundImageName
//          leftButtonImageName:(NSString *)leftButtonImageName
//         rightButtonImageName:(NSString *)rightButtonImageName
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//    UIImageView *background = [[UIImageView alloc]initWithFrame:self.bounds];
//    background.image = [UIImage imageNamed:backgroundImageName];
//    [self addSubview:background];
//
//
//    if (leftButtonImageName) {
//
//        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 44, 44)];
//        [_leftButton setBackgroundImage:[UIImage imageNamed:leftButtonImageName] forState:UIControlStateNormal];
//        [self addSubview:_leftButton];
//
//        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//    if (rightButtonImageName) {
//        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 20, 44, 44)];
//        [_rightButton setBackgroundImage:[UIImage imageNamed:rightButtonImageName] forState:UIControlStateNormal];
//        [self addSubview:_rightButton];
//
//        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//
//    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//    _titleLabel.textAlignment = NSTextAlignmentCenter;
//    _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//    _titleLabel.text = title;
//    _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//    if (titleColor) {
//        _titleLabel.textColor = titleColor;
//    }
//
//    [self addSubview:_titleLabel];
//
//
//    return self;
//}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
          leftButtonImageName:(NSString *)leftButtonImageName
         rightButtonImageName:(NSString *)rightButtonImageName
{
    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    } else {
        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
    }

//    [self addEffectViewWithBackColor:backgroundColor];

    if (leftButtonImageName) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 44, 44)];

        [_leftButton setImage:[UIImage imageNamed:leftButtonImageName] forState:UIControlStateNormal];
        
        [self addSubview:_leftButton];
        
        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }

    if (rightButtonImageName) {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 44 - 10, 20, 44, 44)];
        [_rightButton setImage:[UIImage imageNamed:rightButtonImageName] forState:UIControlStateNormal];
        
        [self addSubview:_rightButton];
        
        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    

	_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
	_titleLabel.textAlignment = NSTextAlignmentCenter;
	_titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
	_titleLabel.text = title;
	_titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
	
	if (titleColor) {
		_titleLabel.textColor = titleColor;
	}
	
	[self addSubview:_titleLabel];

    
    return self;
}


- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
             buttonTitleColor:(UIColor *)buttonTitleColor
			  leftButtonTitle:(NSString *)leftButtonTitle
			 rightButtonTitle:(NSString *)rightButtonTitle
{
    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    } else {
        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
    }
    
    //    [self addEffectViewWithBackColor:backgroundColor];
    
    if (leftButtonTitle) {
        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 80, 44)];
        [_leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
        
        if (buttonTitleColor) {
            [_leftButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        } else {
            [_leftButton setTitleColor:DEFAULT_BUTTON_TITLE_COLOR forState:UIControlStateNormal];
        }
        
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:_leftButton];
        
        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (rightButtonTitle) {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 54, STATUS_BAR_HEIGHT, 44, 44)];
        
        NSInteger length = rightButtonTitle.length;
        [_rightButton setFrame:CGRectMake(SCREEN_WIDTH - 15 * length - 20, STATUS_BAR_HEIGHT, 15 * length + 10, 44)];
        [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
        
        if (buttonTitleColor) {
            [_rightButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        } else {
            [_rightButton setTitleColor:DEFAULT_BUTTON_TITLE_COLOR forState:UIControlStateNormal];
        }
        
        [self addSubview:_rightButton];
        
        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
	
	_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
	_titleLabel.textAlignment = NSTextAlignmentCenter;
	_titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
	_titleLabel.text = title;
	_titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
	
	if (titleColor) {
		_titleLabel.textColor = titleColor;
	}
	
	[self addSubview:_titleLabel];

    
    return self;
}

/*
- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
             buttonTitleColor:(UIColor *)buttonTitleColor
			  leftButtonTitle:(NSString *)leftButtonTitle
          leftButtonImageName:(NSString *)leftButtonImageName
			 rightButtonTitle:(NSString *)rightButtonTitle
         rightButtonImageName:(NSString *)rightButtonImageName
{
    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    

    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    } else {
        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
    }
    
//    [self addEffectViewWithBackColor:backgroundColor];
    
    if (leftButtonTitle || leftButtonImageName) {
        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 44, 44)];
        
        if (leftButtonTitle) {
            _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 80, 44)];
            [_leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
            
            if (buttonTitleColor) {
                [_leftButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
            } else {
                [_leftButton setTitleColor:DEFAULT_BUTTON_TITLE_COLOR forState:UIControlStateNormal];
            }
            
            _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        
        if (leftButtonImageName) {

            [_leftButton setImage:[UIImage imageNamed:leftButtonImageName] forState:UIControlStateNormal];
        }
        
        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_leftButton];
    }
    
    if (rightButtonImageName || rightButtonTitle) {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 54, STATUS_BAR_HEIGHT, 44, 44)];
        
        if (rightButtonTitle) {
            NSInteger length = rightButtonTitle.length;
            [_rightButton setFrame:CGRectMake(SCREEN_WIDTH - 15 * length - 20, STATUS_BAR_HEIGHT, 15 * length + 10, 44)];
            [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
            
            if (buttonTitleColor) {
                [_rightButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
            } else {
                [_rightButton setTitleColor:DEFAULT_BUTTON_TITLE_COLOR forState:UIControlStateNormal];
            }
        }
        
        if (rightButtonImageName) {
            [_rightButton setBackgroundImage:[UIImage imageNamed:rightButtonImageName] forState:UIControlStateNormal];
        }

        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_rightButton];
    }
    
    //标题

	_titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
	_titleLabel.textAlignment = NSTextAlignmentCenter;
	_titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
	_titleLabel.text = title;
	_titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
	
	if (titleColor) {
		_titleLabel.textColor = titleColor;
	}
	
	[self addSubview:_titleLabel];

    
    return self;
}*/


//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//              backgroundColor:(UIColor *)backgroundColor
//             buttonTitleColor:(UIColor *)buttonTitleColor
//      leftButtonBgViewOriginX:(CGFloat)leftButtonBgViewOriginX
//         leftButtonImageWidth:(CGFloat)leftButtonImageWidth
//               leftButtonTitle:(NSString *)leftButtonTitle
//          leftButtonImageName:(NSString *)leftButtonImageName
//              rightButtonTitle:(NSString *)rightButtonTitle
//         rightButtonImageName:(NSString *)rightButtonImageName
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//
//    if (backgroundColor) {
//        self.backgroundColor = backgroundColor;
//    } else {
//        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//    }
//
////    [self addEffectViewWithBackColor:backgroundColor];
//
//    _leftButtonBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(leftButtonBgViewOriginX, STATUS_BAR_HEIGHT, 100, 44)];
//    _leftButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, leftButtonImageWidth, 44)];
//    _leftButtonImageView.image = [UIImage imageNamed:leftButtonImageName];
//
//    _leftButtonLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftButtonImageView.frame) - 4, 0, 100 - 22 - 2, 44)];
//    [_leftButtonLabel setFont:[UIFont systemFontOfSize:LEFT_OR_RIGHT_BUTTON_FONT_SIZE]];
//    [_leftButtonLabel setTextColor:[UIColor whiteColor]];
//
//    if (buttonTitleColor) {
//        [_leftButtonLabel setTextColor:buttonTitleColor];
//    } else {
//        [_leftButtonLabel setTextColor:DEFAULT_BUTTON_TITLE_COLOR];
//    }
//
//    _leftButtonLabel.text = leftButtonTitle;
//
//    _leftButton = [[UIButton alloc]initWithFrame:_leftButtonBackgroundView.bounds];
//    [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:LEFT_OR_RIGHT_BUTTON_FONT_SIZE]];
//
//    [_leftButtonBackgroundView addSubview:_leftButtonImageView];
//    [_leftButtonBackgroundView addSubview:_leftButtonLabel];
//    [_leftButtonBackgroundView addSubview:_leftButton];
//
//    [self addSubview:_leftButtonBackgroundView];
//
//    //标题
////    if (title) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//        _titleLabel.text = title;
//        _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//        if (titleColor) {
//            _titleLabel.textColor = titleColor;
//        }
//
//        [self addSubview:_titleLabel];
////    }
//
//    if (rightButtonImageName || rightButtonTitle) {
//        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 54, STATUS_BAR_HEIGHT, 44, 44)];
//
//        if (rightButtonTitle) {
//            NSInteger length = rightButtonTitle.length;
//            [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:LEFT_OR_RIGHT_BUTTON_FONT_SIZE]];
//            [_rightButton setFrame:CGRectMake(SCREEN_WIDTH - 15 * length - 20, STATUS_BAR_HEIGHT, 15 * length + 10, 44)];
//            [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
//
//            if (buttonTitleColor) {
//                [_rightButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
//            } else {
//                [_rightButton setTitleColor:DEFAULT_BUTTON_TITLE_COLOR forState:UIControlStateNormal];
//            }
//
//        }
//
//        if (rightButtonImageName) {
//            [_rightButton setImage:[UIImage imageNamed:rightButtonImageName] forState:UIControlStateNormal];
//        }
//
//        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
//
//        [self addSubview:_rightButton];
//    }
//
//    return self;
//}
//
//
//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//              backgroundColor:(UIColor *)backgroundColor
//            leftButtonOriginX:(CGFloat)leftButtonOriginX
//          leftButtonImageName:(NSString *)leftButtonImageName
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//
//    if (backgroundColor) {
//        self.backgroundColor = backgroundColor;
//    } else {
//        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//    }
//
//    //    [self addEffectViewWithBackColor:backgroundColor];
//
//    /**
//     *  标题
//     */
//    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//    _titleLabel.textAlignment = NSTextAlignmentCenter;
//    _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//    _titleLabel.text = title;
//    _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//    if (titleColor) {
//        _titleLabel.textColor = titleColor;
//    }
//
//    [self addSubview:_titleLabel];
//
//    if (leftButtonOriginX < 1) {
//        leftButtonOriginX = LEFT_BUTTON_ORIGIN_X;
//    }
//
//    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(leftButtonOriginX, 20, 44, 44)];
//
//
//    [_leftButton setImage:[UIImage imageNamed:leftButtonImageName] forState:UIControlStateNormal];
//
//    [self addSubview:_leftButton];
//
//    return self;
//}
//
//
//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//              backgroundColor:(UIColor *)backgroundColor
//            leftButtonOriginX:(CGFloat)leftButtonOriginX
//               leftButtonTitle:(NSString *)leftButtonTitle
//         leftButtonTitleColor:(UIColor *)leftButtonTitleColor
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//
//    if (backgroundColor) {
//        self.backgroundColor = backgroundColor;
//    } else {
//        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//    }
//
//    //    [self addEffectViewWithBackColor:backgroundColor];
//
//    /**
//     *  标题
//     */
////    if (title) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//        _titleLabel.text = title;
//        _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//        if (titleColor) {
//            _titleLabel.textColor = titleColor;
//        }
//
//        [self addSubview:_titleLabel];
////    }
//
//    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(leftButtonOriginX, 20, 60, 44)];
//    [_leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
//
//    if (leftButtonTitleColor) {
//        [_leftButton setTitleColor:leftButtonTitleColor forState:UIControlStateNormal];
//    } else {
//        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    }
//
//    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
//
//    [self addSubview:_leftButton];
//
//    return self;
//}
//
//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//              backgroundColor:(UIColor *)backgroundColor
//          leftButtonImageName:(NSString *)leftButtonImageName
//       leftButtonImageOriginX:(CGFloat)leftButtonImageOriginX
//        leftButtonImageHeight:(CGFloat)leftButtonImageHeight
//            leftButtonOriginX:(CGFloat)leftButtonOriginX
//               leftButtonTitle:(NSString *)leftButtonTitle
//         leftButtonTitleColor:(UIColor *)leftButtonTitleColor
//         rightButtonImageName:(NSString *)rightButtonImageName
//      rightButtonImageOriginX:(CGFloat)rightButtonImageOriginX
//       rightButtonImageHeight:(CGFloat)rightButtonImageHeight
//           rightButtonOriginX:(CGFloat)rightButtonOriginX
//              rightButtonTitle:(NSString *)rightButtonTitle
//        rightButtonTitleColor:(UIColor *)rightButtonTitleColor
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//
//    if (backgroundColor) {
//        self.backgroundColor = backgroundColor;
//    } else {
//        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//    }
//
//    [self addEffectViewWithBackColor:backgroundColor];
//
//    /**
//     *  标题
//     */
////    if (title) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//        _titleLabel.text = title;
//        _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//        if (titleColor) {
//            _titleLabel.textColor = titleColor;
//        }
//
//        [self addSubview:_titleLabel];
////    }
//
//    /**
//     *  左部按钮图片
//     */
//    if (leftButtonImageName) {
//        _leftButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftButtonImageOriginX, 20 + (44 - leftButtonImageHeight) / 2, leftButtonImageHeight, leftButtonImageHeight)];
//        _leftButtonImageView.image = [UIImage imageNamed:leftButtonImageName];
//        _leftButtonImageView.layer.cornerRadius = 5;
//
//        [self addSubview:self.leftButtonImageView];
//    }
//
//
//    /**
//     *  左部文字按钮
//     */
//    if (leftButtonTitle || leftButtonImageName) {
//        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(leftButtonOriginX, 20, 60, 44)];
//
//        [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:LEFT_OR_RIGHT_BUTTON_FONT_SIZE]];
//        [_leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
//        [_leftButton setTitleColor:leftButtonTitleColor forState:UIControlStateNormal];
//        [self addSubview:_leftButton];
//
//        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//
//    /**
//     *  右部按钮图片
//     */
//    if (rightButtonImageName) {
//        _rightButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(rightButtonImageOriginX, 20 + (44 - rightButtonImageHeight) / 2, rightButtonImageHeight, rightButtonImageHeight)];
//        _rightButtonImageView.image = [UIImage imageNamed:rightButtonImageName];
//
//        [self addSubview:self.rightButtonImageView];
//    }
//
//
//    /**
//     *  右部文字按钮
//     */
//    if (rightButtonTitle || rightButtonImageName) {
//        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(rightButtonOriginX, 20, 60, 44)];
//
//        [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:LEFT_OR_RIGHT_BUTTON_FONT_SIZE]];
//        [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
//        [_rightButton setTitleColor:rightButtonTitleColor forState:UIControlStateNormal];
//        [self addSubview:_rightButton];
//
//        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//
//    return self;
//}

//- (void)addEffectViewWithBackColor:(UIColor *)backgroundColor {
//
//    if (iOS8) {
//        self.backgroundColor = [UIColor clearColor];
//
//        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//        UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        [effectView setFrame:self.bounds];
//
//        [self addSubview:effectView];
//        UIView * backView = [[UIView alloc] initWithFrame:self.bounds];
//        [backView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
//        [effectView.contentView addSubview:backView];
//
//        if (backgroundColor) {
//            [backView setBackgroundColor:backgroundColor];
//        }
//    } else {
//        if (backgroundColor) {
//            self.backgroundColor = backgroundColor;
//        } else {
//            self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//        }
//    }
//}

//- (instancetype)initWithTitle:(NSString *)title
//                   titleColor:(UIColor *)titleColor
//              backgroundColor:(UIColor *)backgroundColor
//               leftButtonTitle:(NSString *)leftButtonTitle
//          leftButtonImageName:(NSString *)leftButtonImageName
//         leftSecondButtonTitle:(NSString *)leftSecondButtonTitle
//    leftSecondButtonImageName:(NSString *)leftSecondButtonImageName
//              rightButtonTitle:(NSString *)rightButtonTitle
//         rightButtonImageName:(NSString *)rightButtonImageName
//        rightSecondButtonTitle:(NSString *)rightSecondButtonTitle
//   rightSecondButtonImageName:(NSString *)rightSecondButtonImageName
//{
//    self  = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//
//
//    if (backgroundColor) {
//        self.backgroundColor = backgroundColor;
//    } else {
//        self.backgroundColor = NAVIGATIONBAR_DEFAULT_COLOR;
//    }
//
//    /**
//     *  左一按钮
//     */
//    if (leftButtonTitle || leftButtonImageName) {
//        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFT_BUTTON_ORIGIN_X, STATUS_BAR_HEIGHT, 44, 44)];
//
//        if (leftButtonTitle) {
//            [_leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
//            [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//            _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        }
//
//        if (leftButtonImageName) {
//            [_leftButton setImage:[UIImage imageNamed:leftButtonImageName] forState:UIControlStateNormal];
//        }
//
//        [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
//
//        [self addSubview:_leftButton];
//    }
//
//    /**
//     *  左二按钮
//     */
//    if (leftSecondButtonTitle || leftSecondButtonImageName) {
//        _leftSecondButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftButton.frame) + 4, STATUS_BAR_HEIGHT, 60, 44)];
//
//        if (leftSecondButtonTitle) {
////            _leftSecondButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftButton.frame) + 4, STATUS_BAR_HEIGHT, 80, 44)];
//            [_leftSecondButton setTitle:leftSecondButtonTitle forState:UIControlStateNormal];
//            [_leftSecondButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        }
//
//        if (leftSecondButtonImageName) {
//            [_leftSecondButton setImage:[UIImage imageNamed:leftSecondButtonImageName] forState:UIControlStateNormal];
//        }
//
//        [self addSubview:_leftSecondButton];
//    }
//
//    /**
//     *  右一按钮
//     */
//    if (rightButtonImageName || rightButtonTitle) {
//        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 54, STATUS_BAR_HEIGHT, 44, 44)];
//
//        if (rightButtonTitle) {
//            [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
//            [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        }
//
//        if (rightButtonImageName) {
//            [_rightButton setBackgroundImage:[UIImage imageNamed:rightButtonImageName] forState:UIControlStateNormal];
//        }
//
//        [self addSubview:_rightButton];
//
//        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//    /**
//     *  右二按钮
//     */
//    if (rightSecondButtonTitle || rightSecondButtonImageName) {
//        _rightSecondButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 54 - 60 - 4, STATUS_BAR_HEIGHT, 60, 44)];
//
//        if (rightSecondButtonTitle) {
//            [_rightSecondButton setTitle:rightSecondButtonTitle forState:UIControlStateNormal];
//            [_rightSecondButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        }
//
//        if (rightSecondButtonImageName) {
//            [_rightSecondButton setBackgroundImage:[UIImage imageNamed:rightSecondButtonImageName] forState:UIControlStateNormal];
//        }
//
//        [self addSubview:_rightSecondButton];
//    }
//
////    if (title) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 44)];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_LABEL_FONT_SIZE];
//        _titleLabel.text = title;
//        _titleLabel.textColor = TITLE_LABEL_FONT_COLOR;
//
//        if (titleColor) {
//            _titleLabel.textColor = titleColor;
//        }
//
//        [self addSubview:_titleLabel];
////    }
//
//    return self;
//}

- (void)leftButtonAction {
    
    if (_delegate && [_delegate respondsToSelector:@selector(navigationBarLeftButtonAction)]) {
        [_delegate navigationBarLeftButtonAction];
    }
}

- (void)rightButtonAction {
    
    if (_delegate && [_delegate respondsToSelector:@selector(navigationBarRightButtonAction)]) {
        [_delegate navigationBarRightButtonAction];
    }
}


@end
