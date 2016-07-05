//
//  FeedbackViewController.m
//  OurQuanmin
//
//  Created by 王建峰 on 16/7/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "FeedbackViewController.h"
#import "UIView+Toast.h"
@interface FeedbackViewController ()
@property (weak, nonatomic) IBOutlet UITextView *placeHolderTextView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FeedbackViewController




- (IBAction)submitAction:(UIButton *)sender {
    
    if (self.textView.text.length == 0) {
        
        [self.view makeToast:@"内容不能为空" duration:1.5 position:@"CSToastPositionCenter"];

        
    }else {
        
        [self.view makeToast:@"反馈成功" duration:1.5 position:@"CSToastPositionCenter"];
        
        
        self.textView.text = @"";
        self.placeHolderTextView.hidden = NO;
    }
  

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.placeHolderTextView.text = @"输入反馈意见，更多疑问请联系QQ客服:250668483";
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"08我的消息w_06"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    
  
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification  object:nil];
    
    
}

- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}
- (void)textDidChange{
    
   
        self.placeHolderTextView.hidden = YES;
    if (self.textView.text.length == 0) {
        self.placeHolderTextView.hidden= NO;
        self.placeHolderTextView.text = @"输入反馈意见，更多疑问请联系QQ客服:250668483";
    }

    NSString *toBeString = self.textView.text;
    NSString *lang = self.textView.textInputMode.primaryLanguage; //键盘输入模式
    if ([lang rangeOfString:@"zh-Hans"].location != NSNotFound || [lang rangeOfString:@"zh-Hant"].location != NSNotFound || [lang rangeOfString:@"zh-Hans-TW"].location != NSNotFound/*[lang containsString:@"zh-Hans"] || [lang containsString:@"zh-Hant"] || [lang containsString:@"zh-Hans-TW"]*/) {
        UITextRange *selectedRange = [self.textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self.textView positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制(PS:高亮的字，表示中文正在编辑)
        if (!position) {
            if (toBeString.length > 200) {
                self.textView.text = [toBeString substringToIndex:200];
                
                //插入  －－－弹出框
                
                [self.view makeToast:@"反馈字数应小于200字" duration:1.5 position:@"CSToastPositionCenter"];
            }
        }else{//有高亮选择的字符串，则暂时不对文字进行统计和限制
            
        }
    }else{//中文输入法以外的直接对其统计限制即可，
        if (toBeString.length > 200) {
            self.textView.text = [toBeString substringToIndex:200];
            
            //插入  －－－弹出框
            [self.view makeToast:@"反馈字数应小于200字" duration:1.5 position:@"CSToastPositionCenter"];
        }
    }
    

    
    
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
