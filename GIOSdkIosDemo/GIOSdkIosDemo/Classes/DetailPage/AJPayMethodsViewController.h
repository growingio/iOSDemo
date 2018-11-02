//
//  AJPayMethodsViewController.h
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/29.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJPayMethodsViewController : UIViewController

@property (nonatomic, strong) NSString *mCount;

@property (nonatomic, strong) UILabel *money;
@property (nonatomic, strong) UIImageView *paymethods;

- (instancetype)initMoney:(NSString *)sendMoney;
@end
