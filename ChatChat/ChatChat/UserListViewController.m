//
//  UserListViewController.m
//  ChatChat
//
//  Created by 卓天成 on 2019/3/22.
//  Copyright © 2019 caokun. All rights reserved.
//

#import "UserListViewController.h"
#import "ChatViewController.h"



#import "UserInfo.h"

@interface UserListViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *friendsArray;
}

@property (nonatomic, strong) NavigationBarView *navigationBarView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:self.navigationBarView];
    [self.view addSubview:self.tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccessfulNotification) name:LoginSuccessfulNotification object:nil];
}

- (NavigationBarView *)navigationBarView {
    if (!_navigationBarView) {
        _navigationBarView = [[NavigationBarView alloc] initWithTitle:@"好友列表" titleColor:[UIColor blackColor] backgroundColor:[UIColor colorWithRed:237 green:237 blue:237] leftButtonImageName:nil rightButtonImageName:nil];
    }
    
    return _navigationBarView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 20) style:UITableViewStylePlain];

        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        /* 去掉多余的下划线 */
        _tableView.tableFooterView = [[UIView alloc] init];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.layer.borderWidth = 1;
//        _tableView.layer.borderColor = [UIColor blueColor].CGColor;
    }
    
    return _tableView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self->friendsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"reuseIdentifier";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self->friendsArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)loginSuccessfulNotification {
    NSString *friendName;
    
    if ([[UserInfo sharedInstance].loginedAccount isEqualToString:@"13980557234"]) {
        friendName = @"18008002698";
    } else {
        friendName = @"13980557234";
    }
    
    self->friendsArray = @[friendName];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"didSelectRowAtIndexPath:%ld", indexPath.row);
    
    ChatViewController *vc = [[ChatViewController alloc] init];
    vc.chatStyle = 1;
    vc.peerAccount = self->friendsArray[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
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
