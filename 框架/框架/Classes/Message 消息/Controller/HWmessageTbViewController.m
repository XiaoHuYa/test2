 //
//  HWmessageTbViewController.m
//  XLWB
//
//  Created by 陈迪 on 15/9/15.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "HWmessageTbViewController.h"
#import "SecondViewController.h"

@interface HWmessageTbViewController ()

@end

@implementation HWmessageTbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"test - message - %ld",indexPath.row];
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *test = [[SecondViewController alloc] init];
    //当test被push过来的时候 ，test所在的tabBarcontroller 的tabBar会自动隐藏
    //    test.hidesBottomBarWhenPushed = YES;
    
    test.title = @"测试控制器test1";
    [self.navigationController pushViewController:test animated:YES];
}
@end
