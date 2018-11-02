//
//  AJScrollerPageView.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/6/8.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJScrollerPageView : UIView

@property (nonatomic, copy) ClikedCallback clikeCall;
+ (instancetype)pageScroller:(NSArray <NSString *>*)images placeHolderImage:(UIImage *)placeHolderImage;

@end
