//
//  Anchor.h
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface Anchor : JSONModel
@property (nonatomic,copy)NSString *category_name;
@property (nonatomic,copy)NSString *category_id;
@property (nonatomic,copy)NSString *category_slug;
@property (nonatomic,copy)NSString *follow;
@property (nonatomic,copy)NSString<Optional> *slug;
@property (nonatomic,copy)NSString <Optional> *recommend_image;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *view;//在线观看人数
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *nick;
@property (nonatomic,copy)NSString *thumb;
@property (nonatomic,copy)NSString<Optional> *intro;//简介
@property (nonatomic,copy)NSString<Optional> *coin; //货币
@property (nonatomic,copy)NSString<Optional> *source;
@property (nonatomic,copy)NSString<Optional> *announcement;
@end
