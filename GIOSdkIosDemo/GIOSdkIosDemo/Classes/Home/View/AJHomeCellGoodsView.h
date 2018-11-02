//
//  AJHomeCellGoodsView.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"
#import "AJHomeCell.h"
@interface AJHomeCellGoodsView : UIView
@property (nonatomic, strong) ActRow *actRow;
@property (nonatomic, copy) ClikedCellback cellback;
@end
