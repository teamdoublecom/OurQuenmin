//
//  RegisterActionViewController.m
//  OurQuanmin
//
//  Created by 王建峰 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RegisterActionViewController.h"

@interface RegisterActionViewController ()

@end

@implementation RegisterActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机注册";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"08我的消息w_06"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;

}


- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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
