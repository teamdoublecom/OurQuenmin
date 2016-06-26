//
//  ColumnViewController.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnViewController.h"
#import "WebUtils.h"

@interface ColumnViewController ()
@property (nonatomic,strong)NSArray *allCategories;
@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [WebUtils requestColumnAndCallback:^(id obj) {
        self.allCategories = obj;
    }];
    
    
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
