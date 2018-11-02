//
//  AJShowDetailViewController.h
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/26.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJGoods.h"
typedef void(^ClikedCellback) (AJGoods *goods);


@interface AJShowDetailViewController : UIViewController

@property (nonatomic, strong) AJGoods *goods;
/*
 * 不显示减号
 */
@property (nonatomic, assign) BOOL zearNeverShow;
@property (nonatomic, copy) ClikedCellback cellback;
//声明函数
- (instancetype)initGoods:(AJGoods *)goods;

@end
