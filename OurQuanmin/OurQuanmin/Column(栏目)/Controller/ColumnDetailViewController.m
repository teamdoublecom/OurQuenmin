//
//  ColumnDetailViewController.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnDetailViewController.h"
#import "AnchorCollectionViewCell.h"


@interface ColumnDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *allAchors;
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ColumnDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [WebUtils requestColumnAnchorsWithSlug:self.slug andCallback:^(id obj) {
        self.allAchors = obj;
        [self.collectionView reloadData];
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AnchorCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"AnchorCollectionViewCell"];
    
}
- (void)backAction:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.allAchors.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AnchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AnchorCollectionViewCell" forIndexPath:indexPath];
    cell.anchor = self.allAchors[indexPath.item];
    
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float w = (kScreenWidth-2*20)/2 ;
    
    return CGSizeMake(w,170);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kMargin;
}
@end
