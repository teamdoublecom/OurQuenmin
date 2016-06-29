//
//  APPFocus.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "APPFocus.h"

@implementation APPFocus
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"focus_id",@"link_object":@"achor"}];
}
@end
