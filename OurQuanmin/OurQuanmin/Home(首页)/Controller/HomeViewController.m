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


@interface HomeViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSArray *allFocus;
@property (nonatomic,strong)UIView *focusView;
@property (nonatomic,strong)UIScrollView *focusScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [WebUtils requestHomePageAndCallback:^(id obj) {
        self.allFocus = obj;
        [self configFocus];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(focusScrollViewOffSize:) userInfo:nil repeats:YES];
        
    }];
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
@end
