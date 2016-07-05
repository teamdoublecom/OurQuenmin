//
//  UserInfoViewController.m
//  OurQuanmin
//
//  Created by 王建峰 on 16/6/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SectionHeadView.h"
#import "FeedbackViewController.h"
#import "SettingsTableViewController.h"
#import "LoginViewController.h"
@interface UserInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *groups;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = nil;
    
    self.groups = [NSMutableArray array];
    
    self.groups = @[@[@"房间管理",@"6"],@[@"我的关注",@"5"],@[@"观看历史",@"4"],@[@"开播提醒",@"3"],@[@"新手任务",@"2"],@[@"游戏中心",@"1"]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate  = self;
    [self.view addSubview:self.tableView];
    
    
    UIBarButtonItem *opinionBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"05侧滑分栏_10"] style:UIBarButtonItemStyleDone target:self action:@selector(opinionAction)];
    self.navigationItem.leftBarButtonItem = opinionBtn;
    UIBarButtonItem *settingsBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"01全部话题_14"] style:UIBarButtonItemStylePlain target:self action:@selector(settingsAction)];
    
    self.navigationItem.rightBarButtonItem = settingsBtn;
    
    self.headView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    
    tap.numberOfTouchesRequired = 1;
    [self.headView addGestureRecognizer:tap];
    
}

- (void)tapAction{
    
    LoginViewController *vc = [LoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (void)opinionAction{
    
    FeedbackViewController *vc = [FeedbackViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)settingsAction{
    
    SettingsTableViewController *vc = [SettingsTableViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar.subviews firstObject].hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar.subviews firstObject].hidden = NO;
    
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
    
    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }

    
    NSArray *item = self.groups[indexPath.row];
    
    cell.textLabel.text = item[0];
    
    cell.imageView.image = [UIImage imageNamed:item[1]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 40;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
    
    
    SectionHeadView *headView = [[NSBundle mainBundle]loadNibNamed:@"SectionHeadView" owner:self options:nil].lastObject;

    return headView;
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


//代理方法，点击cell时调用

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LoginViewController *vc = [LoginViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
