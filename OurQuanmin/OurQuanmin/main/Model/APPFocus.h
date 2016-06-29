//
//  APPFocus.h
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "Anchor.h"

@interface APPFocus :JSONModel
@property (nonatomic,copy)NSString<Optional> *focus_id;//对应字典中的id
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *thumb;

@property (nonatomic,strong)Anchor<Optional> *achor;

@end
