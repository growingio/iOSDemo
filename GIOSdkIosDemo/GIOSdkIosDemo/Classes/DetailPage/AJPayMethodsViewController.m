//
//  AJPayMethodsViewController.m
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/29.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import "AJPayMethodsViewController.h"

@interface AJPayMethodsViewController ()

@end

@implementation AJPayMethodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"支付帐单";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0 green:211/255.0 blue:69/255.0 alpha:1.0]];
    [self ShowPayMethods];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//显示支付方式选择页
-(void)ShowPayMethods{
    //获取帐单总额
    _money = [[UILabel alloc]init];
    _money.font = [UIFont systemFontOfSize:32];
    _money.textColor = [UIColor redColor];
    NSString *mdetail=[@"帐单总额:￥" stringByAppendingString:_mCount];
    _money.text=mdetail;
    
    //设置支付选择方式
    _paymethods=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pay"]];
    
    [self.view addSubview:_money];
    [self.view addSubview:_paymethods];
    
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.leading.equalTo(self.view).offset(5);
        //make.width.equalTo(self.mas_width).offset(-2);
        make.height.equalTo(@20);
    }];
    
    [_paymethods mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.mas_bottom).offset(20);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(350);
        
    }];
    
    
}

- (instancetype)initMoney:(NSString *)sendMoney{
    self = [super init];
    _mCount=sendMoney;
    return self;
}

@end
