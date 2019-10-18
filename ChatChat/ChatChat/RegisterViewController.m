//
//  RegisterViewController.m
//  ChatChat
//
//  Created by Teson on 2018/8/17.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "RegisterViewController.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getBackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)getVerificationCodeAction:(id)sender {
    
    
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
