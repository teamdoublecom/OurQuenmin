//
//  RegisterActionViewController.m
//  OurQuanmin
//
//  Created by 王建峰 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RegisterActionViewController.h"
#import "UserInfoViewController.h"
@interface RegisterActionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PNumberTf;
@property (weak, nonatomic) IBOutlet UITextField *AuthcodeTf;
@property (weak, nonatomic) IBOutlet UITextField *nickTf;
@property (weak, nonatomic) IBOutlet UITextField *PwdTf;

@end

@implementation RegisterActionViewController
- (IBAction)RegisterBtn:(id)sender {
    
    self.user =[BmobUser new];
    self.user.username =self.nickTf.text;

    [BmobUser signOrLoginInbackgroundWithMobilePhoneNumber:self.PNumberTf.text SMSCode:self.AuthcodeTf.text andPassword:self.PwdTf.text block:^(BmobUser *user, NSError *error) {
        
        if (error)
        {    NSLog(@"注册失败%@",error);
            
        }else if (!error)
        {
            UserInfoViewController *user = [UserInfoViewController new];
            
            [self.navigationController pushViewController:user animated:YES];
        
        }
        
    
        
        
        
        
    
    }];

    
////
//    [BmobSMS verifySMSCodeInBackgroundWithPhoneNumber:self.PNumberTf.text andSMSCode:self.AuthcodeTf.text resultBlock:^(BOOL isSuccessful, NSError *error) {
////       
////        NSLog(@"%@",error);
//        
//    }];
    
//    [BmobUser signOrLoginInbackgroundWithMobilePhoneNumber:self.PNumberTf.text andSMSCode:self.AuthcodeTf.text block:^(BmobUser *user, NSError *error) {
//       
//        NSLog(@"注册失败:%@",error);
//    }];
//    
    
}
- (IBAction)GetCode:(id)sender {

    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:self.PNumberTf.text andTemplate:@"全名TV" resultBlock:^(int number, NSError *error) {
        if (error)
        {
            
            NSLog(@"%@",error);
            
        }else
        {
    
            
            self.AuthcodeTf.text =@(number).stringValue;
            
            NSLog(@"获取成功");
        }
        
        
    }];
    
    
}

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
