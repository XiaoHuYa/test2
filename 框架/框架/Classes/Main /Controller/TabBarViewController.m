//
//  TabBarViewController.m
//  框架
//
//  Created by 陈迪 on 16/3/1.
//  Copyright (c) 2016年 chenDi. All rights reserved.
//

#import "TabBarViewController.h"

#import "HWhomeTbViewController.h"
#import "HWdiscoverTbViewController.h"
#import "HWmessageTbViewController.h"
#import "HWprofileTbViewController.h"
#import "TestViewController.h" //测试控制器

#import "NavigationController.h"
#import "HWTabBar.h"//自定义tabBar 中间的按钮(+)

@interface TabBarViewController ()<HWTabBardelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //3.设置子控制器
    HWhomeTbViewController *home  = [[HWhomeTbViewController alloc ] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectediImage:@"tabbar_home_selected"];
    
    HWmessageTbViewController *message  = [[HWmessageTbViewController alloc ] init];
    [self addChildVc:message title:@"消息" image:@"tabbar_message_center" selectediImage:@"tabbar_message_center_selected"];
    
    HWdiscoverTbViewController *discover  = [[HWdiscoverTbViewController alloc ] init];
    [self addChildVc:discover title:@"广场" image:@"tabbar_discover" selectediImage:@"tabbar_discover_selected"];
    
    HWprofileTbViewController *profile  = [[HWprofileTbViewController alloc ] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectediImage:@"tabbar_profile_selected"];
    
    
    
    //自定义tabBar 中间的按钮(+)
//    // 更换系统自带的tabBar
//    //    self.tabBar = [[HWTabBar alloc]init];    //self.tabBar 是只读的 取不到
//    HWTabBar *tabBar= [[HWTabBar alloc] init];
//    tabBar.delegate = self;
//    [self setValue:tabBar forKeyPath:@"tabBar"]; //kvc 可以取到
    
}

// 3. 设置子控制器 封装
-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectediImage:(NSString *)selectedImage
{
    childVc.view.backgroundColor = CDRandomColor;
    
    //1.设置自控器的 文字
    // tabBar的文字
//    childVc.navigationItem.title = title;
    //navigationBar的文字
//    childVc.tabBarItem.title = title;
    // 等价上面两句之和
    childVc.title = title;
    
    //2.设置自控器的 图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if (IOS7) {
        //声明：这张图片按照原来的样子显示，不要自动渲染成其他颜色
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
    {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    
    //3.设置文字样式（颜色）
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = CDColor(123,123,123);//pch文件
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName]= [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    //4. 包装导航控制器
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVc];
    
    //5.添加子控制器到tabBarControl
    //    self.viewControllers = @[childVc];
    [self addChildViewController:nav];// 与上等价
    
    //tabbarVc.viewControllers = @[home,message,discover,profile];
    //    [tabbarVc addChildViewController:vc1];//与上等价
    //    [tabbarVc addChildViewController:vc2];//与上等价
    //    [tabbarVc addChildViewController:vc3];
    //    [tabbarVc addChildViewController:vc4];
}



#pragma mark - 实现HWTabBar代理方法
-(void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
{
    TestViewController *vc = [[TestViewController alloc]init];
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:vc];
    
    vc.view.backgroundColor = [UIColor greenColor];
    [self presentViewController:nav animated:YES completion:nil];
    
}




@end
