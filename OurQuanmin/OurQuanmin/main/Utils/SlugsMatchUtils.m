//
//  SlugsMatchUtils.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/7/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SlugsMatchUtils.h"

@implementation SlugsMatchUtils
+ (NSString *)slugsWithString:(NSString *)key
{
    NSArray *slugs = @[@"lol",@"beauty",@"heartstone",@"huwai",@"overwatch",@"dota2",@"tvgame",@"blizzard",@"sport",@"webgame",@"dnf",@"minecraft"];
    NSArray *des = @[@"英雄联盟",@"全明星秀",@"炉石传说",@"全民户外",@"守望先锋",@"DOTA2",@"单机主机",@"暴雪经典",@"体育频道",@"网络游戏",@"DNF",@"我的世界"];
   
    NSMutableDictionary *matchData = [NSMutableDictionary dictionary];
    
    if (slugs.count != des.count) {
        return @"源数据个数不匹配";
    }
    
    for (int i = 0; i < slugs.count; i++) {
        [matchData setObject:slugs[i] forKey:des[i]];
    }

    return [matchData objectForKey:key];
}
@end
