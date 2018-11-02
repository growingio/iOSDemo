//
//  AJSelectedAdressViewController.m
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/5/23.
//  Copyright © 2016年 AJun. All rights reserved.
//  当前需要统一改变导航栏样式的控制器

#import "AJSelectedAdressViewController.h"
#import "UIBarButtonItem+Button.h"

@interface AJSelectedAdressViewController ()

@end

@implementation AJSelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildNavigationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(LeftItemButtonClicket) type:LeftItemButton];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(rightBarButtonClick) type:RightItemButton];
    
    self.navigationController.navigationBar.barTintColor = GeneralColor;
}

//改变导航栏
+ (void)changeNavigationBar{
    UILabel *btnChapter = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];//左边打开侧滑的按钮
    [btnChapter setText:@"返回"];
    btnChapter.userInteractionEnabled = YES;
    UITapGestureRecognizer *chapterTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftTouchUpInside:)];
    [btnChapter addGestureRecognizer:chapterTapGestureRecognizer];
    btnChapter.textColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1];
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btnChapter];
    AJSelectedAdressViewController *ajs=[[AJSelectedAdressViewController alloc]init];
    ajs.navigationItem.leftBarButtonItem = item;
    //隐藏右侧按钮
    ajs.navigationItem.rightBarButtonItem=nil;
    
}


/**
 *  将要显示进入控制器调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    
}

#pragma callBack method
- (void)LeftItemButtonClicket{
     NSLog(@"执行扫一扫操作。。。。");
}
- (void)rightBarButtonClick{
    NSLog(@"执行搜索操作。。。。");
}



@end
