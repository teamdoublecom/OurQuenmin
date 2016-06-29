//
//  Anchor.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Anchor.h"

@implementation Anchor
- (void)setView:(NSString *)view
{
     _view = view;
    
    NSInteger count = view.integerValue;
    if (count > 9999) {
        _view = [NSString stringWithFormat:@"%.02f万",count*1.0/10000];
        //[@(count*1.0/10000).stringValue stringByAppendingString:@"万"];
        
    }
}
@end
