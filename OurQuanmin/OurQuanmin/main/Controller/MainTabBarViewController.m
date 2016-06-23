//
//  MainTabBarViewController.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
#import "UserInfoTableViewController.h"
#import "LiveTVViewController.h"
#import "ColumnViewController.h"
#import "QuanminTabbar.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.view.backgroundColor = [UIColor whiteColor];
    homeVC.title = @"首页";
    ColumnViewController *columnVC = [ColumnViewController new];
    columnVC.view.backgroundColor = [UIColor whiteColor];
    columnVC.title = @"栏目";
    LiveTVViewController *livetvVC = [LiveTVViewController new];
    livetvVC.view.backgroundColor = [UIColor whiteColor];
    livetvVC.title = @"直播";
    UserInfoTableViewController *userVC = [UserInfoTableViewController new];
    userVC.title = @"我的";
    
    self.viewControllers = @[
                             [[UINavigationController alloc]initWithRootViewController:homeVC],
                             [[UINavigationController alloc]initWithRootViewController:columnVC],
                             [[UINavigationController alloc]initWithRootViewController:livetvVC],
                             [[UINavigationController alloc]initWithRootViewController:userVC],
                            ];
    //设置tabbar图片
    homeVC.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    
    //自定义Tabbar
    QuanminTabbar *tabbar = [[QuanminTabbar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabbar forKey:@"tabBar"];
    self.tabBar.tintColor = [UIColor redColor];
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
