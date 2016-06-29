//
//  ColumnViewController.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ColumnViewController.h"
#import "WebUtils.h"
#import "ColumnCollectionViewCell.h"
#import "ColumnDetailViewController.h"

@interface ColumnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIWebViewDelegate>
@property (nonatomic,strong)NSArray *allCategories;
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [WebUtils requestColumnAndCallback:^(id obj) {
        self.allCategories = obj;
        [self.collectionView reloadData];
    }];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    float w = (kScreenWidth-20-20)/3;
//    flowLayout.itemSize = CGSizeMake(w,w * 2);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ColumnCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ColumnCollectionViewCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.allCategories.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ColumnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ColumnCollectionViewCell" forIndexPath:indexPath];
    cell.categorie = self.allCategories[indexPath.item];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GameCategorie *categorie = self.allCategories[indexPath.item];
    
    ColumnDetailViewController *detai = [[ColumnDetailViewController alloc]init];
    detai.slug = categorie.slug;
    
    [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:detai] animated:YES completion:nil];
}
#pragma mark UIWebViewDelegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}
#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float w = (kScreenWidth-20-20)/3;
    
    return CGSizeMake(w,3*w/2.0);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin);
}
@end
