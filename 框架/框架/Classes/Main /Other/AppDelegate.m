//
//  AppDelegate.m
//  框架
//
//  Created by 陈迪 on 16/3/1.
//  Copyright (c) 2016年 chenDi. All rights reserved.
//

#import "AppDelegate.h"

#import "TabBarViewController.h" //分栏控制器
#import "HWNewfeatureViewController.h" //版本新特性

#import "UMSocial.h" //友盟分享
#import "UMSocialWechatHandler.h" //微信分享头文件
#import "UMSocialSinaSSOHandler.h" //新浪微博头文件
#import "UMSocialQQHandler.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

//////-------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //2.设置跟控制器
    
    //新特性和 主界面的 控制器
    //        [UIWindow switchRootViewController];
    [self.window switchRootViewController];
    
    
    //4.显示窗口
    [self.window makeKeyAndVisible];
    
#warning 我们本例中只是badge，但是还有alert和sound都属于通知类型，所以我们“多此一举”，把所有的通知类型都囊括进来，这样，我们就不需要以后一个一个的去设置alert和sound了。
//    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
//    if (sysVersion>=8.0) {
//        UIUserNotificationType type=UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
//        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
//        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
//    }
    
    
    //5.友盟分享
    [self LibShare];
    
    return YES;
}

-(void)LibShare
{
    //1.设置友盟社会化组件appkey
    [UMSocialData setAppKey:@"5719fd2667e58e7ca20004b5"];

    
#warning  这里需要填写 不同平台的 appid等是因为 将分享、授权来源、分享到QQ、Qzone的icon更改为自己APP的应用
    //2.设置 微信 AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wx88151db0acea5ebd" appSecret:@"f20c5c5a6c7c88c2cd29423db0d4dc96" url:@""];
    
    //3.设置手机 QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    //4.打开 新浪微博 的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954" secret:@"04b48b094faeb16683c32669824ebdad" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

}



/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
//}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    CLog(@"openURL:url = %@",url);
    //注意如果同时使用微信支付、支付宝等其他需要改写回调代理的SDK，请在if分支下做区分，否则会影响 分享、登录的回调
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    
//    if ([url.description hasPrefix:@"xxxx"]) {
//        //你的处理逻辑
//    }
//    else {
//        return [UMSocialSnsService handleOpenURL:url];
//    }
    
    return result;
}

/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
