//
//  AJFlashCell.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/8/4.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJSupermarketSource.h"

@interface AJFlashCell : UITableViewCell

@property (nonatomic, strong) ProductCategory *categoryData;
+ (instancetype)cellWithTable:(UITableView *)tableView;
@end
