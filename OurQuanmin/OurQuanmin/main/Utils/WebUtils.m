//
//  WebUtils.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebUtils.h"
#import <AFNetworking.h>
#import "APPFocus.h"
#import "GameCategories.h"

@implementation WebUtils
+ (void)requestHomePageAndCallback:(CallBack)callBack
{
    NSString *path = @"http://www.quanmin.tv/json/page/app-data/info.json";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *arrData = dic[@"ios-focus"];
        
        NSArray *allFocus = [APPFocus arrayOfModelsFromDictionaries:arrData error:nil];
        
        callBack(allFocus);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"数据返回失败.");
    }];
}
+ (void)requestColumnAndCallback:(CallBack)callBack
{
    NSString *path = @"http://www.quanmin.tv/json/categories/list.json";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *arrData = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *allCategories = [GameCategories arrayOfModelsFromDictionaries:arrData error:nil];
        
        callBack(allCategories);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"数据返回失败.");
    }];
}
@end
