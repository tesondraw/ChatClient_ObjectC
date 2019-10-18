//
//  NSFileManager+Category.h
//  FrameworkProject
//
//  Created by Teson Draw on 2017/5/11.
//  Copyright © 2017年 Teson Draw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Category)



/**
 *  @author Teson Draw, 16-03-24 16:03:22
 *
 *  @brief 删除文件
 *
 *  @param file 文件路径名
 *
 *  @return YES:操作成功    NO:操作失败
 */
+ (BOOL)deleteFile:(NSString *)file;

/**
 *  @author Teson Draw, 16-03-24 16:03:50
 *
 *  @brief 删除文件夹
 *
 *  @param directory 文件夹路径
 *
 *  @return YES:操作成功    NO:操作失败
 */
+ (BOOL)deleteDirectory:(NSString *)directory;

/**
 *  @author Teson Draw, 16-03-24 16:03:38
 *
 *  @brief 文件是否存在
 *
 *  @param path 文件路径
 *
 *  @return YES:操作成功    NO:操作失败
 */
+ (BOOL)fileExistsAtPath:(NSString *)path;


/*!
 *  @author Teson Draw, 17-05-10 15:05:44
 *
 *  @brief 获取文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 文件大小
 */
+ (long long)fileSizeAtPath:(NSString *)filePath;


/*!
 *  @author Teson Draw, 2018-08-20 11:33:44
 *
 *  @brief 创建文件夹，不需要创建中间文件夹
 *
 */
+ (BOOL)createDirectoryWithPath:(NSString *)path;


/*!
 *  @author Teson Draw, 2018-08-20 11:33:44
 *
 *  @brief 创建文件夹，需要创建中间文件夹
 *
 */
+ (BOOL)createDirectoryWithIntermediateDirAtPath:(NSString *)path;

@end
