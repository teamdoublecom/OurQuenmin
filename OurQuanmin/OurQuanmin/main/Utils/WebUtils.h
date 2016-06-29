//
//  WebUtils.h
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^CallBack)(id obj);

@interface WebUtils : NSObject
+ (void)requestHomePageAndCallback:(CallBack)callBack;
+ (void)requestColumnAndCallback:(CallBack)callBack;
+ (void)requestColumnAnchorsWithSlug:(NSString *)slug andCallback:(CallBack)callBack;
@end
