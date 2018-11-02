//
//  AJDisPriceDetailCell.m
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/27.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import "AJDisPriceDetailCell.h"

@implementation AJDisPriceDetailCell

- (instancetype)init{
    if (self = [super init]) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = [UIFont systemFontOfSize:24];
        _moneyLabel.textColor = [UIColor redColor];
        [self addSubview:_moneyLabel];
        
        _discountLabel = [[UILabel alloc]init];
        _discountLabel.font = [UIFont systemFontOfSize:20];
        _discountLabel.textColor = [UIColor grayColor];
        [self addSubview:_discountLabel];
        
        _lines = [[UIView alloc]init];
        _lines.backgroundColor = [UIColor grayColor];
        [self addSubview:_lines];
        
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(5);
            make.centerY.equalTo(self);
        }];
        [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_moneyLabel.mas_trailing).offset(1);
            make.centerY.equalTo(self);
        }];
        [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_discountLabel);
            make.height.equalTo(@1);
            make.leading.equalTo(_discountLabel);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setGoods:(AJGoods *)goods{
    _goods = goods;
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    self.discountLabel.text = [NSString stringWithFormat:@"￥%@",goods.market_price];;
    [self.moneyLabel sizeToFit];
    [self.discountLabel sizeToFit];
    if ([goods.price isEqualToString:goods.market_price]) {
        self.discountLabel.hidden = YES;
        self.lines.hidden = YES;
    }else{
        self.discountLabel.hidden = NO;
        self.lines.hidden = NO;
    }
}

@end
