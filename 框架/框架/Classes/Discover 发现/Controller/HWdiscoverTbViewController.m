//
//  HWdiscoverTbViewController.m
//  XLWB
//
//  Created by 陈迪 on 15/9/15.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "HWdiscoverTbViewController.h"

@interface HWdiscoverTbViewController ()

@end

@implementation HWdiscoverTbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.系统自带搜索框 不满足要求
//    UISearchBar *search = [[UISearchBar alloc] init];
//    //代码实现图片拉伸
//    [[UIImage imageNamed:@"searchbar_textfield_background"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
//    search.scopeBarBackgroundImage = [UIImage imageNamed:@"searchbar_textfield_background"];
//    self.navigationItem.titleView = search;
    
    
    
    //自定义 HWSearchBar(继承UITextfiled) 封装
    UITextField *searchBar = [[UITextField alloc]init ];
//    searchBar.backgroundColor = [UIColor redColor];
    searchBar.width = 300;
    searchBar.heigh =30;
    searchBar.font = [UIFont systemFontOfSize:15];
    searchBar.placeholder = @"请输入搜索条件";
    
    UIImage *BgImage = [UIImage imageNamed:@"searchbar_textfield_background"];
    BgImage = [BgImage stretchableImageWithLeftCapWidth:BgImage.size.width * 0.5 topCapHeight:BgImage.size.width * 0.5];
    searchBar.background = BgImage;

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

    self.navigationItem.titleView = searchBar;
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

@end
