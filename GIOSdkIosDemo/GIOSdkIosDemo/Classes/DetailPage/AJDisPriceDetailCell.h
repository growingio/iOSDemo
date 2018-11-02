//
//  AJDisPriceDetailCell.h
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/27.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"

@interface AJDisPriceDetailCell : UIView

@property (nonatomic, strong) AJGoods *goods;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) UIView *lines;

@end
