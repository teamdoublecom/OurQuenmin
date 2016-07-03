//
//  HomeViewController.m
//  OurQuanmin
//
//  Created by 陈文鹏 on 16/6/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomeViewController.h"
#import "WebUtils.h"
#import "APPFocus.h"
#import "GameCategorie.h"
#import "AnchorCollectionViewCell.h"
#import "HomeHearReusableView.h"
#import "SlugsMatchUtils.h"

@interface HomeViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSArray *allFocus;
@property (nonatomic,strong)NSArray *allColumns;
@property (nonatomic,strong)UIView *focusView;
@property (nonatomic,strong)UIScrollView *focusScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;


@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableDictionary *allData;
@property (nonatomic,strong)NSArray *allslugs;

@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.allslugs = @[@"英雄联盟",@"全明星秀",@"炉石传说",@"全民户外",@"守望先锋",@"DOTA2",@"单机主机",@"暴雪经典",@"体育频道",@"网络游戏",@"DNF",@"我的世界"];
    
    [WebUtils requestHomePageColumnAnchorsAndCallback:^(id obj) {
        self.allData = obj;
        
        [self.collectionView reloadData];
    }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [WebUtils requestHomePageAndCallback:^(id obj) {
        self.allFocus = obj;
        [self configFocus];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(focusScrollViewOffSize:) userInfo:nil repeats:YES];
        
    }];
    
    [WebUtils requestColumnAndCallback:^(id obj) {
        self.allColumns = obj;
        [self configColum];
    }];
    
    //创建collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 2 * 64 + kScreenHeight/4, kScreenWidth, kScreenHeight-(3 * 64 + kScreenHeight/4)) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AnchorCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"AnchorCollectionViewCell"];
    [self.collectionView registerClass:[HomeHearReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sactionHeard"];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    //不在显示当前页面是关掉定时器
    [self.timer invalidate];
}
- (void)focusScrollViewOffSize:(NSTimer *)timer
{
    [UIView animateWithDuration:.5 animations:^{
        self.focusScrollView.contentOffset = CGPointMake(++self.pageControl.currentPage%4*kScreenWidth, 0);
    }];
}
- (void)configColum
{
    UIScrollView *columSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64 + kScreenHeight/4, kScreenWidth, 64)];
    columSV.showsHorizontalScrollIndicator = NO;
    
    float w = (kScreenWidth - 2*kMargin)/6;
    for (int i = 0; i < 7;i++ ) {
        GameCategorie *catagorie = self.allColumns[i];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(i*w + 10,0,w,60)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kMargin,kMargin, 40, 40)];
        imageView.layer.cornerRadius = 40/2;
        imageView.layer.masksToBounds = YES;
        [imageView setImageWithURL:catagorie.thumbUrl];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        
        /*
         创建手势
         */
        UITapGestureRecognizer *tapColums = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapColumsAction:)];
        tapColums.numberOfTapsRequired = 1;
        tapColums.numberOfTouchesRequired = 1;
        //添加手势
        [imageView addGestureRecognizer:tapColums];
        
        [vi addSubview:imageView];
        
         UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x, CGRectGetMaxY(imageView.frame) + 2,imageView.frame.size.width,8)];
        lb.text = catagorie.name;
        lb.textColor = [UIColor lightGrayColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:8];
        [vi addSubview:lb];
        [columSV addSubview:vi];
    }
    columSV.contentSize = CGSizeMake(8*w, 0);
    
    UIView *otherVI = [[UIView alloc]initWithFrame:CGRectMake(7*w,0,w,60)];
    UIImageView *otherIV = [[UIImageView alloc]initWithFrame:CGRectMake(kMargin,kMargin, 40, 40)];
    otherIV.image = [UIImage imageNamed:@"more.jpg"];
    otherIV.layer.cornerRadius = 40/2;
    otherIV.layer.masksToBounds = YES;
    otherIV.userInteractionEnabled = YES;
    /*
     创建手势
     */
    UITapGestureRecognizer *tapColums = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapColumsAction:)];
    tapColums.numberOfTapsRequired = 1;
    tapColums.numberOfTouchesRequired = 1;
    [otherIV addGestureRecognizer:tapColums];
    
    UILabel *otherLB = [[UILabel alloc]initWithFrame:CGRectMake(otherIV.frame.origin.x, CGRectGetMaxY(otherIV.frame) + 2,otherIV.frame.size.width,8)];
    otherLB.text = @"全部分类";
    otherLB.textColor = [UIColor lightGrayColor];
    otherLB.textAlignment = NSTextAlignmentCenter;
    otherLB.font = [UIFont systemFontOfSize:8];
    
    [otherVI addSubview:otherLB];
    [otherVI addSubview:otherIV];
    [columSV addSubview:otherVI];
    [self.view addSubview:columSV];
}
- (void)configFocus
{
    self.focusView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight/4.0)];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.focusView.bounds.size.height)];
    self.focusScrollView = scrollView;
    self.focusScrollView.delegate = self;
    
    for (int i = 0; i< self.allFocus.count; i++) {
        APPFocus *focus = self.allFocus[i];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(i*kScreenWidth,0, kScreenWidth, scrollView.bounds.size.height);
        [imageView setImageWithURL:[NSURL URLWithString:focus.thumb]];//3843963

        UILabel *titleLabe = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height - 20, 200, 20)];
        [titleLabe setTextColor:[UIColor lightGrayColor]];
        [titleLabe setFont:[UIFont systemFontOfSize:12]];
        titleLabe.text = focus.title;
        [imageView addSubview:titleLabe];
        imageView.tag = focus.achor.uid.longLongValue;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTouchesRequired = 1;
        tap.numberOfTapsRequired = 1;
        //添加手势
        [imageView addGestureRecognizer:tap];
        
        [scrollView addSubview:imageView];
    }
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.allFocus.count * kScreenWidth, 0);
    
    [self.focusView addSubview:scrollView];
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth - 40 - kMargin*2, self.focusView.frame.size.height - 20, 40, 20)];
    pageControl.numberOfPages = self.allFocus.count;
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.userInteractionEnabled = 0;
    self.pageControl = pageControl;
    
    [self.focusView addSubview:pageControl];
    
    
    [self.view addSubview:self.focusView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageNum = round(self.focusScrollView.contentOffset.x / self.focusScrollView.frame.size.width);
    self.pageControl.currentPage = pageNum;
}
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"%ld",tap.view.tag);
    
//    http://www.quanmin.tv/v/
    /*
        待完善代码
     */
}
- (void)tapColumsAction:(UITapGestureRecognizer *)tap
{
    /*
     待完善代码
     */
    NSLog(@"%ld",tap.view.tag);
}
#pragma mark UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.allslugs.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //所有字典所有Key的个数
    return 4;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusaBleView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sactionHeard" forIndexPath:indexPath];
    
    if (!reusaBleView) {
        reusaBleView = [[UICollectionReusableView alloc]init];
    }
    
    UILabel *label = [reusaBleView subviews].firstObject;
    if (!label) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(kMargin,0 , reusaBleView.frame.size.width-2*kMargin, reusaBleView.frame.size.height)];
    }
    
    label.text = self.allslugs[indexPath.section];
    label.font = [UIFont systemFontOfSize:14];

    [reusaBleView addSubview:label];
    
    return reusaBleView;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AnchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AnchorCollectionViewCell" forIndexPath:indexPath];
    
    NSString *key = self.allslugs[indexPath.section];
    NSString *slug = [SlugsMatchUtils slugsWithString:key];
    Anchor *anchor = self.allData[slug][indexPath.item];
    cell.anchor = anchor;
    
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 20);
}
@end
