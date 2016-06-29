//
//  GameCategories.h
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface GameCategorie : JSONModel
@property (nonatomic,copy)NSString *Categories_id;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *slug;
@property (nonatomic,copy)NSString *first_letter;
@property (nonatomic,copy)NSURL *imageUrl;
@property (nonatomic,copy)NSURL *thumbUrl;
@end
