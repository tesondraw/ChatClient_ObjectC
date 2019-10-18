//
//  RootViewController.m
//  ChatChat
//
//  Created by Teson Draw on 2018/9/4.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "RootViewController.h"

#import "LoginViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Root" bundle:nil];
    LoginViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    vc.save = @"save";
    [vc test:@"xxx"];

    [self.navigationController presentViewController:vc animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
