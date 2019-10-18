//
//  ChatViewController.m
//  ChatChat
//
//  Created by 卓天成 on 2019/3/22.
//  Copyright © 2019 caokun. All rights reserved.
//

#import "ChatViewController.h"

#import "ChatKeyBoard.h"
#import "FaceSourceManager.h"

#import "PublicUse.pbobjc.h"

#import "UserInfo.h"
#import "Public.h"

#define kLines 20

@interface ChatViewController () <TDNavigationBarDelegate, ChatKeyBoardDelegate, ChatKeyBoardDataSource>

@property (nonatomic, strong) NavigationBarView *navigationBarView;
@property (nonatomic, strong) UITextView *textView;

/** 聊天键盘 */
@property (nonatomic, strong) ChatKeyBoard *chatKeyBoard;
//@property (nonatomic, weak) UITableView *messageTableView

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.navigationBarView];
    
    self.navigationBarView.titleLabel.text = self.peerAccount;
    
    [self.view addSubview:self.textView];
    

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = NO;
    
    self.chatKeyBoard = [ChatKeyBoard keyBoard];
    
    self.chatKeyBoard.delegate = self;
    self.chatKeyBoard.dataSource = self;
    
    self.chatKeyBoard.placeHolder = @"请输入消息";
    [self.view addSubview:self.chatKeyBoard];
    
    UIView *seperatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 0.5)];
    seperatorView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:seperatorView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedMessageNotification:) name:ReceivedMessageNotification object:nil];
}

- (NavigationBarView *)navigationBarView {
    if (!_navigationBarView) {
        _navigationBarView = [[NavigationBarView alloc] initWithTitle:@"" titleColor:[UIColor blackColor] backgroundColor:[UIColor colorWithRed:237 green:237 blue:237] leftButtonImageName:nil rightButtonImageName:nil];
        
        _navigationBarView = [[NavigationBarView alloc] initWithTitle:@"" titleColor:[UIColor blackColor] backgroundColor:[UIColor colorWithRed:237 green:237 blue:237] buttonTitleColor:[UIColor blackColor] leftButtonTitle:@"< 戻る" rightButtonTitle:nil];
        
        _navigationBarView.delegate = self;
    }
    
    return _navigationBarView;
}

- (void)navigationBarLeftButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 200)];
        
        _textView.backgroundColor = [UIColor colorWithRed:237 green:237 blue:237];
    }
    
    return _textView;
}

- (void)chatKeyBoardSendText:(NSString *)text {
    NSString *lineContent = [NSString stringWithFormat:@"我：%@\n", text];
    
    self.textView.text = [self.textView.text stringByAppendingString:lineContent];

    [[UserInfo sharedInstance].comm sendMessage:text targetID:self.peerAccount senderID:[UserInfo sharedInstance].loginedAccount success:^(GeneralResponse *response) {
        if (response.code == 0) {
            NSLog(@"%@ send message to %@ success:%@", [UserInfo sharedInstance].loginedAccount, self.peerAccount, text);
        } else {
            NSString *errorMsg = [Public errorInfoWithCode:response.code];
            NSLog(@"chatKeyBoardSendText:%@", errorMsg);
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.localizedDescription);
    }];
}


#pragma mark -- ChatKeyBoardDataSource
- (NSArray<MoreItem *> *)chatKeyBoardMorePanelItems
{
    MoreItem *item1 = [MoreItem moreItemWithPicName:@"sharemore_location" highLightPicName:nil itemName:@"位置"];
    MoreItem *item2 = [MoreItem moreItemWithPicName:@"sharemore_pic" highLightPicName:nil itemName:@"图片"];
    MoreItem *item3 = [MoreItem moreItemWithPicName:@"sharemore_video" highLightPicName:nil itemName:@"拍照"];
    MoreItem *item4 = [MoreItem moreItemWithPicName:@"sharemore_location" highLightPicName:nil itemName:@"位置"];
    MoreItem *item5 = [MoreItem moreItemWithPicName:@"sharemore_pic" highLightPicName:nil itemName:@"图片"];
    MoreItem *item6 = [MoreItem moreItemWithPicName:@"sharemore_video" highLightPicName:nil itemName:@"拍照"];
    MoreItem *item7 = [MoreItem moreItemWithPicName:@"sharemore_location" highLightPicName:nil itemName:@"位置"];
    MoreItem *item8 = [MoreItem moreItemWithPicName:@"sharemore_pic" highLightPicName:nil itemName:@"图片"];
    MoreItem *item9 = [MoreItem moreItemWithPicName:@"sharemore_video" highLightPicName:nil itemName:@"拍照"];
    return @[item1, item2, item3, item4, item5, item6, item7, item8, item9];
}

- (NSArray<ChatToolBarItem *> *)chatKeyBoardToolbarItems
{
    ChatToolBarItem *item1 = [ChatToolBarItem barItemWithKind:kBarItemFace normal:@"face" high:@"face_HL" select:@"keyboard"];
    
    ChatToolBarItem *item2 = [ChatToolBarItem barItemWithKind:kBarItemVoice normal:@"voice" high:@"voice_HL" select:@"keyboard"];
    
    ChatToolBarItem *item3 = [ChatToolBarItem barItemWithKind:kBarItemMore normal:@"more_ios" high:@"more_ios_HL" select:nil];
    
    ChatToolBarItem *item4 = [ChatToolBarItem barItemWithKind:kBarItemSwitchBar normal:@"switchDown" high:nil select:nil];
    
    return @[item1, item2, item3, item4];
}

- (NSArray<FaceThemeModel *> *)chatKeyBoardFacePanelSubjectItems
{
    return [FaceSourceManager loadFaceSource];
}


- (void)receivedMessageNotification:(NSNotification *)notify {
    
    MessageContent *content = notify.object;
    
    NSLog(@"content:%@", content.message);
    
    NSLog(@"main thread:%@", [NSThread mainThread]);
    NSLog(@"current thread:%@", [NSThread currentThread]);
    
    
    if ([content.targetId isEqualToString:[UserInfo sharedInstance].loginedAccount]) {
        NSString *displayMsg = [NSString stringWithFormat:@"%@：%@\n", content.senderId, content.message];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = [self.textView.text stringByAppendingString:displayMsg];
        });
    }
    
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
