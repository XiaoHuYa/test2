//
//  HWhomeTbViewController.m
//  XLWB
//
//  Created by 陈迪 on 15/9/15.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "HWhomeTbViewController.h"
#import "UMSocial.h" //友盟分享

@interface HWhomeTbViewController ()

@end

@implementation HWhomeTbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 此方法封装在 UIBarButtonItem+Extension.m里  应为在navigation控制器里也要用到此方法
    //1.导航栏 左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    //2.导航栏 右按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
}

-(void)friendSearch
{
    NSLog(@"friendSearch");
    
    
    //分享URL图片资源:  (注意当URL图片和UIImage同时存在时，只有URL图片生效)
//    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    //http://www.baidu.com/img/bdlogo.gif
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    // 点击分享消息后跳转的 链接 （有图片是有效）
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5719fd2667e58e7ca20004b5"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，h"
                                     shareImage:[UIImage imageNamed:@"new_feature_1"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
     //调用快速分享接口
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeMusic url:@"http://music.huoxing.com/upload/20130330/1364651263157_1085.mp3"];
    
    //调用快速分享接口
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeVideo url:@"http://v.youku.com/v_show/id_XNjQ1NjczNzEy.html?f=21207816&ev=2"];
   
}

 //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}



-(void)pop
{
    NSLog(@"pop");
}

@end
