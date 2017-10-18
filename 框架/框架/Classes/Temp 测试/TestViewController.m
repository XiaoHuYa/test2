//
//  TestViewController.m
//  框架
//
//  Created by 陈迪 on 16/3/1.
//  Copyright (c) 2016年 chenDi. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = CDRandomColor;
    
    
    //1.设置导航栏
    [self setupNav];
    
}


#pragma mark - 1.设置导航栏
-(void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

//返回上一界面
-(void)cancel
{
//    [self.view endEditing:YES];
    //    [self.textView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
//发送 微博
-(void)send
{
//    if (self.photosView.photos.count) {
//        [self sendWithImage]; //有图片
//    }else {
//        [self sendWithOutImage]; //无图片
//    }
    //4.返回上一界面
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
