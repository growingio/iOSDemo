//
//  AJOrderListView.m
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/30.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import "AJOrderListView.h"

@interface AJOrderListView ()
/** 订单列表名称 */
@property (nonatomic,strong) UIImageView *showpic;

@end

@implementation AJOrderListView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=NO;
    
    //self.navigationItem.title=@"订单列表";
    //[self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0 green:211/255.0 blue:69/255.0 alpha:1.0]];
    
    [self CreateOrderList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initTagId:(long)vtag{
    self = [super init];
    _viewtag=vtag;
    return self;
    
}
//创建订单列表页
-(void) CreateOrderList{
    NSLog(@"判断订单类型：%ld",_viewtag);
    switch (_viewtag) {
        case 0:
            self.navigationItem.title=@"待支付";
            _showpic= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zhifu.jpg"]];
            break;
        case 1:
            self.navigationItem.title=@"待收货";
            _showpic= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"daishouhuo.jpg"]];
            break;
        case 2:
            self.navigationItem.title=@"待评价";
            _showpic= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pingjia.jpg"]];
            break;
        case 3:
            self.navigationItem.title=@"退款/售后";
            _showpic= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shouhou.jpg"]];
            break;
        default:
            break;
    }
    
     [self.view addSubview:_showpic];
    
    
    [_showpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(-10);
        make.centerX.equalTo(self.view);
        make.height.equalTo(self.view.mas_height);
        make.width.equalTo(self.view.mas_width);
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}
@end
