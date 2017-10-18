//
//  HWTabBar.m
//  XLWB
//
//  Created by 陈迪 on 15/9/19.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//  自定义tabBar 中间的按钮(+)

#import "HWTabBar.h"
@interface HWTabBar ()

@property (nonatomic,weak) UIButton *btn;

@end


@implementation HWTabBar


-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame] ) {
        
        //添加一个+按钮到 tabBar中
        UIButton *btn = [[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        btn.size = btn.currentBackgroundImage.size;
        //监听
        [btn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        self.btn = btn;
    }
    return self;
}

-(void)plusClick
{
      //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

//重新布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
//    self.origin = CGPointMake(0, MainSH-100);
//    self.size = CGSizeMake(MainSW, 100);
//    self.backgroundColor = [UIColor redColor];

    
    //1.设置 +号 按钮位置
    self.btn.centerX = self.width * 0.5;
    self.btn.centerY = self.heigh * 0.5;

    //2.设置 四个控制器的btn的位置
    CGFloat tabbarBtnW = self.width /5;
    CGFloat tabbarBtnIndex = 0;
    NSInteger  count = self.subviews.count;
    for (int i=0; i<count; i++) {
        UIView *child = self.subviews[i];
       // UITabBarButton 是系统内部的类  供内部使用 我们取不到
        Class class = NSClassFromString(@"UITabBarButton");//将字符串变成一个类
        if ([child isKindOfClass:class]) {
            child.width = tabbarBtnW;
            child.x = tabbarBtnIndex * tabbarBtnW;
            
            tabbarBtnIndex ++;
            if (tabbarBtnIndex == 2) {
                tabbarBtnIndex ++;
            }
        }
    }
}

@end


