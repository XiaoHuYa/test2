//
//  HWTabBar.h
//  XLWB
//
//  Created by 陈迪 on 15/9/19.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWTabBar;

#warning 因为HwtabBar继承UITabBar，所以称为HWTabBar的代理，也必须实现UITabBar的代理协议
//制定 协议
@protocol  HWTabBardelegate <UITabBarDelegate>

@optional
-(void) tabBarDidClickPlusButton:(HWTabBar *)tabBar;

@end



@interface HWTabBar : UITabBar

@property (nonatomic,assign) id<HWTabBardelegate> delegate ;

@end
