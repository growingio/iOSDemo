//
//  AJShowDetailViewController.m
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/26.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import "AJShowDetailViewController.h"

#import "AJDisPriceDetailCell.h"
#import "AJBuyView.h"

#import "AJDrawLine.h"

@interface AJShowDetailViewController ()

/** 背景图 */
@property (nonatomic,strong) UIImageView *backImageView;
/** 商品的图片 */
@property (nonatomic,strong) UIImageView *goodsImageView;
/** 商品名字的图片 */
@property (nonatomic,strong) UILabel *nameLabel;
/** 精选的图片 */
@property (nonatomic,strong) UIImageView *fineImageView;
/** 买一赠一的图片 */
@property (nonatomic,strong) UIImageView *giveImageView;
/** 商品单位的图片 */
@property (nonatomic,strong) UILabel *specificsLabel;
/** 折扣 */
@property (nonatomic,strong) AJDisPriceDetailCell *discountPriceView;
/** 选择数量 */
@property (nonatomic,strong) AJBuyView *buyView;

/**分隔线****/
//商品图片下分隔线
@property (nonatomic,strong) UIImageView *LineImageView11;
@property (nonatomic,strong) UIImage *lineImage1;
@property (nonatomic,strong) UIImageView *LineImageView2;
//商品信息下分隔线
@property (nonatomic,strong) UIImageView *LineImageView;
@property (nonatomic,strong) UIImage *lineImage;
@property (nonatomic,strong) UIImageView *LineImageView1;

//添加GIO说明
@property (nonatomic,strong) UIImageView *GIOInfoPic;
@end

@implementation AJShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"商品详情";
    [self createpage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//构建详情页元素
-(void)createpage{
    
    _backImageView = [[UIImageView alloc]init];
    _backImageView.contentMode = UIViewContentModeCenter;
    
    _goodsImageView = [[UIImageView alloc]init];
    _goodsImageView.backgroundColor = [UIColor blackColor];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont boldSystemFontOfSize:24];
    
    _fineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jingxuan.png"]];
    
    _giveImageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"buyOne.png"]];
    
    _specificsLabel = [[UILabel alloc]init];
    _specificsLabel.font = [UIFont systemFontOfSize:20];
    _specificsLabel.textColor = [UIColor darkGrayColor];
    
    _discountPriceView = [[AJDisPriceDetailCell alloc]init];

    
    _buyView = [[AJBuyView alloc]init];
    
    //商品图片下分隔线
    _LineImageView11=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 10)];
    _lineImage1=[[[AJDrawLine alloc] init]drawLineOfDashByImageView:_LineImageView11];
    _LineImageView2=[[UIImageView alloc]initWithImage:_lineImage1];
    
    //商品信息下分隔线
    _LineImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 10)];
    _lineImage=[[[AJDrawLine alloc] init]drawLineOfDashByImageView:_LineImageView];
    _LineImageView1=[[UIImageView alloc]initWithImage:_lineImage];
    
    //详情页添加GIO介绍
    _GIOInfoPic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"GIO"]];
    
    [self.view addSubview:_backImageView];
    [self.view addSubview:_goodsImageView];
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_fineImageView];
    [self.view addSubview:_giveImageView];
    [self.view addSubview:_specificsLabel];
    [self.view addSubview:_buyView];
    [self.view addSubview:_discountPriceView];
    
    [self.view addSubview:_LineImageView1];
    [self.view addSubview:_LineImageView2];
    [self.view addSubview:_GIOInfoPic];
    
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(-10);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@250);
        make.width.equalTo(@200);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsImageView.mas_bottom).offset(2);
        make.leading.equalTo(self.view).offset(5);
        //make.width.equalTo(self.mas_width).offset(-2);
        make.height.equalTo(@12);
    }];
    [_fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_nameLabel.mas_bottom).offset(10);
                make.leading.equalTo(_nameLabel);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(26);
            }];
    [_giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel);
        make.leading.equalTo(_nameLabel.mas_trailing).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(25);
    }];
    [_specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_giveImageView.mas_bottom).offset(30);
        make.leading.equalTo(_nameLabel);

    }];

    [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.view).offset(-2);
                make.trailing.equalTo(self.view).offset(-2);
                make.width.mas_equalTo(65);
                make.height.mas_equalTo(25);
            }];
    
    [_discountPriceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_specificsLabel).offset(20);
        make.bottom.equalTo(self.view).offset(-100);
        make.trailing.equalTo(self.view).offset(-150);

    }];
    //添加分隔线
    [_LineImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_discountPriceView).offset(20);
        make.width.mas_equalTo(self.view);
        
    }];
    
    [_LineImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_nameLabel).offset(-15);
        //make.top.mas_equalTo(_nameLabel.top);
        make.width.mas_equalTo(self.view);
        
    }];
    
    //添加分隔线
    [_GIOInfoPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_discountPriceView).offset(150);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(250);
        
    }];
    
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:_goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
    _nameLabel.text = _goods.name;
    _specificsLabel.text = _goods.specifics;
    _discountPriceView.goods = _goods;
    if ([_goods.pm_desc isEqualToString:@"买一赠一"]) {
        self.giveImageView.hidden = NO;
    }else{
        self.giveImageView.hidden = YES;
    }
    

}

- (instancetype)initGoods:(AJGoods *)goods{
    self = [super init];
    _goods = goods;
    _buyView.goods = goods;
    return self;
    
}

@end
