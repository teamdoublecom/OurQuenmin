//
//  AnchorCollectionViewCell.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AnchorCollectionViewCell.h"
@interface AnchorCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbIV;
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UILabel *viewCountLB;
@property (weak, nonatomic) IBOutlet UILabel *nickLB;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@end
@implementation AnchorCollectionViewCell
- (void)setAnchor:(Anchor *)anchor
{
    _anchor = anchor;
    [self.thumbIV setImageWithURL:[NSURL URLWithString:anchor.thumb]];
    [self.headIV setImageWithURL:[NSURL URLWithString:anchor.avatar]];
    self.titleLB.text = anchor.title;
    self.nickLB.text = anchor.nick;
    self.viewCountLB.text = anchor.view;
}
- (void)awakeFromNib {
    self.headIV.layer.cornerRadius = self.headIV.frame.size.width / 2.0;
    self.headIV.layer.masksToBounds = YES;
}

@end
