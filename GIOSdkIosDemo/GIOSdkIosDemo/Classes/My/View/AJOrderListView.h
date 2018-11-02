//
//  AJOrderListView.h
//  GIOSdkIosDemo
//
//  Created by GrowingIO on 2018/10/30.
//  Copyright © 2018年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJOrderListView : UIViewController
//view tag index
@property (nonatomic, assign) long viewtag;

- (instancetype)initTagId:(long)vtag;
@end
