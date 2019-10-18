//
//  ChatViewController.h
//  ChatChat
//
//  Created by 卓天成 on 2019/3/22.
//  Copyright © 2019 caokun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : TDViewController

@property (nonatomic, assign) NSInteger chatStyle;///<1、单聊 2、群聊 3、公众号

@property (nonatomic, strong) NSString *peerAccount;

@end

NS_ASSUME_NONNULL_END
