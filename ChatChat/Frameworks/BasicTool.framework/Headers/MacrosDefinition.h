//
//  MacrosDefinition.h
//  CodeRepository
//
//  Created by apple on 4/28/15.
//  Copyright (c) 2015 Teson Draw. All rights reserved.
//

#ifndef MacrosDefinition_h
#define MacrosDefinition_h

//屏幕高度和宽度
#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#endif

#ifndef SCREEN_BOUNDS
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#endif

//机型定义
#ifndef iPhone4s
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

#ifndef iPhone5s
#define iPhone5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

#ifndef iPhone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

#ifndef iPhone6Plus
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

//获取RGB颜色函数
#ifndef COLOR
#define COLOR(Red, Green, Blue) [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:1.0] 
#endif

#ifndef RGB
#define RGB(Red, Green, Blue) [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:1.0]
#endif

#ifndef ColorWithHex
#define ColorWithHex(var) [UIColor colorWithRed:((var & 0xff0000) >> 16) / 255.0 green:((var & 0xff00) >> 8) / 255.0 blue:(var & 0xff) / 255.0 alpha:1]
#endif


//iOS版本
#ifndef iOS6
#define iOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#endif

#ifndef iOS8
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#endif

#ifndef CurrentDeviceVersionFloat
#define CurrentDeviceVersionFloat [[[UIDevice currentDevice] systemVersion] floatValue]
#endif


#define NULL_CHAR @""


#ifdef DEBUG
#define TDLog(fmt, ...) NSLog((@"\n[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" "[打印结果]\n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define TDLog(...)
#endif

#endif
