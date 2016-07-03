//
//  ColumnCollectionViewCell.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnCollectionViewCell.h"
#import "GameCategorie.h"
@interface ColumnCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@end

@implementation ColumnCollectionViewCell
- (void)setCategorie:(GameCategorie *)categorie
{
    //
    _categorie = categorie;
    
    self.titleLB.text = categorie.name;
    [self.thumbIV setImageWithURL:categorie.thumbUrl];
    
}
- (void)awakeFromNib {
    self.thumbIV.layer.cornerRadius = 2.0;
    self.thumbIV.layer.masksToBounds = YES;
}
@end
