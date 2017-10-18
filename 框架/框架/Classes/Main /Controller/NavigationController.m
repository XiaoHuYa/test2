//
//  NavigationController.m
//  框架
//
//  Created by 陈迪 on 16/3/1.
//  Copyright (c) 2016年 chenDi. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

//只调用一次
+(void)initialize
{
    //设置整个项目所有Item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //1.设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //2.设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning 怎么像safari一样滑动的时候隐藏navigationbar?
//    self.hidesBarsOnSwipe = YES ;
    
    //    self.hidesBarsWhenKeyboardAppears = YES ;
    
    //    self.hidesBarsWhenVerticallyCompact = YES ; //??
    //    hidesBarsWhenKeyboardAppears
    //    hidesBarsOnSwipe
    //    UIPanGestureRecognizer *barHideOnSwipeGestureRecognizer
    //    hidesBarsWhenVerticallyCompact
    //    hidesBarsOnTap
    
    
    // 系统默认会有 手势移除控制器的作用， 但是当我们将navigation的左按钮自定义时 就会失去这个功能，但是重新设置代理就可以了
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}


/**
 *  重写能够 拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 *  @param animated       动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) { //push 进来的控制器不是第一个（根控制器）
        
        //当test被push过来的时候 ，test所在的tabBarcontroller 的tabBar会自动隐藏
        viewController.hidesBottomBarWhenPushed = YES;
       
        
        // 此方法封装在 UIBarButtonItem+Extension.m里  应为在home控制器里也要用到此方法
        //1.导航栏 左按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backBtnClick) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        //设置返回按钮的图片
//            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        //设置去掉返回按钮的title
        //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
        //设置返回小箭头的颜色
        //        self.navigationBar.tintColor = [UIColor whiteColor];
        
        
        //2.导航栏 右按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(moreBtnClick) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
    
}
-(void)backBtnClick
{
    [self popViewControllerAnimated:YES];
}

-(void)moreBtnClick
{
    [self popToRootViewControllerAnimated:YES];
}

/*

    //1.导航栏 左按钮
    //自定义一个（view）放在导航栏的leftBarbuttonItem上
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
    //设置尺寸
    //    CGSize size = backBtn.currentImage.size;
    //    backBtn.frame = CGRectMake(0, 0, size.width, size.height);
    backBtn.size = backBtn.currentImage.size;//分类Extension的方法

    //监听
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];

    //1.导航栏 左按钮
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];

      //2.导航栏 右按钮
    //自定义一个（view）放在导航栏的rightBarbuttonItem上
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [moreBtn setImage:[UIImage imageNamed:@"navigationbar_more"] forState:UIControlStateNormal];
    [moreBtn setImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] forState:UIControlStateHighlighted];
    //设置尺寸
    //    CGSize size = backBtn.currentImage.size;
    //    backBtn.frame = CGRectMake(0, 0, size.width, size.height);
    moreBtn.size = moreBtn.currentImage.size;//分类Extension的方法

    //监听
    [moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];

    //2.导航栏 右按钮
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];


*/

@end
