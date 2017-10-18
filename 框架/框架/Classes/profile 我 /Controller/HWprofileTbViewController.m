//
//  HWprofileTbViewController.m
//  XLWB
//
//  Created by 陈迪 on 15/9/15.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "HWprofileTbViewController.h"
#import "TestViewController.h"

@interface HWprofileTbViewController ()

@end

@implementation HWprofileTbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏 右按钮（可以覆盖自定义的navigationContrller设置的 rightBarButtonItem ）
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
    
    
    
    //测试 代码实现图片拉伸
    /*
    //自定义 HWSearchBar(继承UITextfiled) 封装
    UITextField *searchBar = [[UITextField alloc]init ];
    //    searchBar.backgroundColor = [UIColor redColor];
    searchBar.x = 10;
    searchBar.y = 100;
    searchBar.width = 300;
    searchBar.heigh =300;
    searchBar.font = [UIFont systemFontOfSize:15];
    searchBar.placeholder = @"请输入搜索条件";
    
    UIImage *image1 = [UIImage imageNamed:@"searchbar_textfield_background"];
    image1 = [image1 stretchableImageWithLeftCapWidth:image1.size.width * 0.5 topCapHeight:image1.size.width * 0.5];
    searchBar.background = image1;
    
    //    searchBar.background = [[UIImage imageNamed:@"searchbar_textfield_background"] stretchableImageWithLeftCapWidth:9 topCapHeight:32];
    //左边放大镜图标
    UIImage *image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    UIImageView *searchIcon = [[UIImageView alloc]initWithImage:image];//此方法创建imageview的尺寸为image的
    //    UIImageView *searchIcon = [[UIImageView alloc]init];
    //    searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    searchIcon.width = 30;
    searchIcon.heigh = 30;
    searchIcon.contentMode = UIViewContentModeCenter; //放大镜居中
    //    searchIcon.backgroundColor = [UIColor blueColor];
    searchBar.leftView = searchIcon;
    searchBar.leftViewMode = UITextFieldViewModeAlways; //leftView默认是不会显示，所以改变mode
    
    [self.view addSubview:searchBar];
    
     */
    
}


-(void)setting
{
    TestViewController *test = [[TestViewController alloc]init];
    test.title = @"测试控制器test2";
    [self.navigationController pushViewController:test animated:YES];
}

@end
