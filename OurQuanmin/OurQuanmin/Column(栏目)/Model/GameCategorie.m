//
//  GameCategories.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "GameCategorie.h"

@implementation GameCategorie
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Categories_id",@"image":@"imageUrl",@"thumb":@"thumbUrl"}];
}
@end
