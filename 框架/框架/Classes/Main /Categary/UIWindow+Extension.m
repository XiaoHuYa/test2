
//
//  UIWindow+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/9/28.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "TabBarViewController.h"// 分栏控制器
#import "HWNewfeatureViewController.h" //版本新特性

@implementation UIWindow (Extension)

/**
 *  封装
 */
+(void)switchRootViewController{
    
    NSString *key = @"CFBundleVersion";
    //2.1 拿到上次存储在沙盒的版本号（bundle verson）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //2.2 最新软件的版本号（从info，plist中获取)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    if ([currentVersion isEqualToString:lastVersion]) {
        //    sleep(2);
        
        //和上次版本号相同： 直接进去
        window.rootViewController = [[TabBarViewController alloc ]init];
    }else
    {
        //否则 就是新版本号  进新特性
        window.rootViewController = [[HWNewfeatureViewController alloc]init];
        
        //2.3 将新版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}



/**
 *  封装
 */
-(void)switchRootViewController{
    
    NSString *key = @"CFBundleVersion";
    //2.1 拿到上次存储在沙盒的版本号（bundle verson）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //2.2 最新软件的版本号（从info，plist中获取)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];

//    if ([currentVersion isEqualToString:lastVersion]) {
        //    sleep(2);
        
        //和上次版本号相同： 直接进去
        self.rootViewController = [[TabBarViewController alloc ]init];
//    }else
//    {
//        //否则 就是新版本号  进新特性
//        self.rootViewController = [[HWNewfeatureViewController alloc]init];
//        
//        //2.3 将新版本号存进沙盒
//        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
    
}


@end
