//
//  UIBarButtonItem+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/9/16.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

//  导航控制器 添加左右按钮 类别自己增加的方法


#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  创建一个navigationItem 左右
 *
 *  @param action    点击Item调用的方法
 *  @param image     图片
 *  @param highImage 高亮
 *
 *  @return 返回 左右Item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    //自定义一个（view）放在导航栏的rightBarbuttonItem上
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [Btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置尺寸
    Btn.size = Btn.currentImage.size;//分类Extension的方法
    //监听
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:Btn];
}
@end
