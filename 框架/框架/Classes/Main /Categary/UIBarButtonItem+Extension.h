//
//  UIBarButtonItem+Extension.h
//  XLWB
//
//  Created by 陈迪 on 15/9/16.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

//  导航控制器 添加左右按钮 类别自己增加的方法

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end

