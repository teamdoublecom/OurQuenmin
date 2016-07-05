//
//  LoginViewController.m
//  OurQuanmin
//
//  Created by 王建峰 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterActionViewController.h"
#import "UserInfoViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PwdTf;
@property (weak, nonatomic) IBOutlet UITextField *UserTf;

@end

@implementation LoginViewController
- (IBAction)LoginButton:(id)sender {
    
[BmobUser loginInbackgroundWithAccount:self.UserTf.text andPassword:self.PwdTf.text block:^(BmobUser *user, NSError *error) {
   
    if (error)
    {
        NSLog(@"登录失败");
    }else if (!error)
    {
    
        UserInfoViewController *vc = [UserInfoViewController new]
        ;
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    
    
}];

    
    
}
- (IBAction)ForgetPwd:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    backItem.tintColor = [UIColor grayColor];
    
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerAction)];
    self.navigationItem.rightBarButtonItem = rightBar;
    rightBar.tintColor = [UIColor redColor];
    
}
- (void)backAction{
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)registerAction{
    RegisterActionViewController *vc = [RegisterActionViewController new];
    
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
