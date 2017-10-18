//
//  HWNewfeatureViewController.m
//  XLWB
//
//  Created by 陈迪 on 15/9/21.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "HWNewfeatureViewController.h"
#import "TabBarViewController.h"


#define HWNewfeatureCount 4

@interface HWNewfeatureViewController () <UIScrollViewDelegate>

@property (nonatomic,retain) UIPageControl *pageControll;

@end

@implementation HWNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建一个scrollView,
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self; // pageController
    [self.view addSubview:scrollView];
    
    //2.添加图片到scrollerView
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.heigh;
    for (int i=0; i<HWNewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.width = scrollW;
        imageView.heigh = scrollH;
        imageView.x = i * scrollW;
        imageView.y = 0;
        //显示图片
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 如果是最后一个imageView,就在其添加其他内容
        if (i == HWNewfeatureCount - 1) {
            //初始化最后一个imageView
            [self setUpLastImageView:imageView];
        }
        
    }
    
    //3.ScrollView 其他属性
    scrollView.contentSize = CGSizeMake( HWNewfeatureCount * scrollW, 0);//内容大小
    scrollView.bounces = NO; //弹簧效果
    scrollView.pagingEnabled = YES; //分页
    scrollView.showsHorizontalScrollIndicator = NO; //水平滚动条
    
    
    //4.添加pageController；分页 展示第几页
    UIPageControl *pageControll = [[UIPageControl alloc]init];
    pageControll.numberOfPages = HWNewfeatureCount;
    pageControll.currentPageIndicatorTintColor = CDColor(253, 98, 42);
    pageControll.pageIndicatorTintColor = CDColor(189,189,189);
    pageControll.centerX = scrollW * 0.5;
    pageControll.centerY = scrollH - 50;
    [self.view addSubview:pageControll];
    self.pageControll = pageControll;
    
    //pageControll没有设置宽高 相当于无法响应点击事件 .userInteractionEnable = NO;
//    pageControll.width = 100;
//    pageControll.heigh  = 50;
//    pageCotroll.userInteractionEnable = NO;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControll.currentPage = (int)(page + 0.5);
    
}

//初始化最后一个imageView
-(void)setUpLastImageView:(UIImageView *)imageview
{
    imageview.userInteractionEnabled = YES;
    
    //1. 分享给大家
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.heigh = 30;
    shareBtn.center = CGPointMake(imageview.width * 0.5, imageview.heigh * 0.65);
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageview addSubview:shareBtn];
    
//    shareBtn.backgroundColor = [UIColor redColor];
//    shareBtn.titleLabel.backgroundColor = [UIColor yellowColor];
//    shareBtn.imageView.backgroundColor = [UIColor blueColor];
    //内边距：自切
//    shareBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 100, 20, 0);
//    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    
    
    //2.开始微博
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];

    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageview.heigh * 0.75;
    
    [startBtn addTarget:self action:@selector(startBtn:) forControlEvents:UIControlEventTouchUpInside];
    [imageview addSubview:startBtn];

    
}

-(void)shareClick:(UIButton *)btn
{
    //状态取反
    btn.selected  = ! btn.isSelected;
}

-(void)startBtn:(UIButton *)btn
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[TabBarViewController alloc]init];
//    self.view.window.rootViewController = [[HWTabBarViewController alloc ]init];
}



#pragma mark - 当window的根控制器从newfeature改为HWTabBarCountro时 因为没有window引用着它，所以HWNewfeatureViewController就会被销毁
-(void)dealloc
{
    CLog(@"HWNewfeatureViewController--dealloc");
}



@end
