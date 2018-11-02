//
//  AJHeadLineView.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/7/23.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"

@interface AJHeadLineView : UIView
@property (nonatomic, strong) ActInfo *headline;
@property (nonatomic, copy) ClikedCallback callback;
@end
