//
//  AppDelegate.m
//  UDPClient
//
//  Created by caokun on 16/8/25.
//  Copyright © 2016年 caokun. All rights reserved.
//

#import "AppDelegate.h"

#import "RootViewController.h"

#import "UserInfo.h"
#import "SVProgressHUD.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];


    [UserInfo sharedInstance].errorInfo = [self loadErrorInfo];
    
    if ([UserInfo sharedInstance].errorInfo) {
        NSLog(@"读取ErrorInfo成功");
        NSLog(@"%@", [UserInfo sharedInstance].errorInfo);
    }
    
    [UserInfo sharedInstance].comm = [[BusinessComm alloc] init];

    [self initWindow];
    
    return YES;
}

- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Root" bundle:nil];
    RootViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RootViewController"];

//    [self.navigationController presentViewController:vc animated:YES completion:nil];
//    [self.navigationController pushViewController:vc animated:YES];

//    RootViewController *vc = [[RootViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [nc setNavigationBarHidden:YES];
    
    self.window.rootViewController = nc;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSDictionary *)loadErrorInfo {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ErrorInfo" ofType:@"json"];

    NSData *jsonFileData = [[NSData alloc] initWithContentsOfFile:filePath];

    NSError *error;
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonFileData options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"读取ErrorInfo.json文件失败");
        return nil;
    }
    
    if (![jsonObject isKindOfClass:[NSDictionary class]]) {
        NSLog(@"ErrorInfo.json -> 非字典数据");
        
        return nil;
    }
    
    NSDictionary *dic = (NSDictionary *)jsonObject;

    return dic;
}

@end
