//
//  LoginViewController.m
//  ChatChat
//
//  Created by Teson on 2018/8/15.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "LoginViewController.h"

#import "BusinessComm.h"
#import "PublicUse.pbobjc.h"

#import "RegisterViewController.h"
#import "SingleChatViewController.h"


#import "SVProgressHUD.h"

#import "Public.h"

#import "UserInfo.h"


#define SERVER_IP @"192.168.11.42"
//#define SERVER_IP @"192.168.120.169"

#define SERVER_PORT 9528

@interface LoginViewController ()
{
    BusinessComm *comm;
    
    NSString *info;
}

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *inputMsgTextField;
@property (weak, nonatomic) IBOutlet UITextField *peerAccountTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self->comm = [[BusinessComm alloc] init];
//    [self->comm connectToHost:SERVER_IP onPort:SERVER_PORT];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendDataNotification:) name:@"SendDataNotification" object:nil];
}

- (void)test:(NSString *)info {
    self->info = info;
}

//- (void)sendDataNotification:(NSNotification *)notif {
//
//}

- (IBAction)verificationCodeAction:(id)sender {
    
}

- (IBAction)registerAction:(id)sender {

    NSString *account = [_accountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [_passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
    
//    [self->comm registerWithAccount:account password:password success:^(GeneralResponse *response) {
//        if (response.code == 0) {
//            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
//        } else {
//            NSString *errorMsg = [Public errorInfoWithCode:response.code];
//
//            [SVProgressHUD showErrorWithStatus:errorMsg];
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"error:%@", error.localizedDescription);
//    }];
    
    [[UserInfo sharedInstance].comm registerWithAccount:account password:password success:^(GeneralResponse *response) {
        if (response.code == 0) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        } else {
            NSString *errorMsg = [Public errorInfoWithCode:response.code];
            
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.localizedDescription);
    }];
}


- (IBAction)loginAction:(id)sender {
    
    //Step 1 connect to server
    /**/
    
    NSString *account = [_accountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [_passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    __weak typeof(self)weakSelf = self;
    
//    [self->comm loginWithAccount:account password:password success:^(GeneralResponse *response) {
//        if (response.code == 0) {
//            /* 记录已登录账号、密码 */
//            [UserInfo sharedInstance].loginedAccount = account;
//            [UserInfo sharedInstance].loginedPassword = password;
//
//            [[NSNotificationCenter defaultCenter] postNotificationName:LoginSuccessfulNotification object:nil];
////            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
//
//            [weakSelf dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            NSString *errorMsg = [Public errorInfoWithCode:response.code];
//
//            [SVProgressHUD showErrorWithStatus:errorMsg];
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"error:%@", error.localizedDescription);
//    }];
    
    
    [[UserInfo sharedInstance].comm loginWithAccount:account password:password success:^(GeneralResponse *response) {
        if (response.code == 0) {
            /* 记录已登录账号、密码 */
            [UserInfo sharedInstance].loginedAccount = account;
            [UserInfo sharedInstance].loginedPassword = password;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:LoginSuccessfulNotification object:nil];
            //            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorMsg = [Public errorInfoWithCode:response.code];
            
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.localizedDescription);
    }];
}

- (IBAction)reconnectAction:(id)sender {
//    [comm connectToHost:SERVER_IP onPort:SERVER_PORT];
    
    [[UserInfo sharedInstance].comm connectToHost:SERVER_IP onPort:SERVER_PORT];
}

- (IBAction)sendMessageAction:(id)sender {
    NSString *msg = [self.inputMsgTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *account = [_accountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *peerAccount = [_peerAccountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    [self->comm sendMessage:msg targetID:peerAccount senderID:account success:^(GeneralResponse *response) {
        NSLog(@"send msg response:%@", response);
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.localizedDescription);
    }];
    
}

- (IBAction)switchAccountAction:(id)sender {
    NSString *account = _accountTextField.text;
    NSString *peerAccount = _peerAccountTextField.text;
    
    _accountTextField.text = peerAccount;
    _peerAccountTextField.text = account;
}


@end
