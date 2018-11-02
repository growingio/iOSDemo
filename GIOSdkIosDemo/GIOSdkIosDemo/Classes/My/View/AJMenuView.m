//
//  AJMenuView.m
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import "AJMenuView.h"
#import "AJTitleIconView.h"

#import "AJOrderListView.h"

@interface AJMenuView ()
@property (nonatomic, strong) NSArray *mens;
@end

@implementation AJMenuView

static const NSInteger DefaultRowNumbers = 4;

- (instancetype)initMenu:(NSArray <AJTitleIconAction *>*)mens WithLine:(BOOL)line{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.mens = mens;
        for (AJTitleIconAction *title in mens) {
            AJTitleIconView *titleIconView = [[AJTitleIconView alloc]initWithTitleLabel:title.title icon:title.icon boder:line];
            titleIconView.tag = title.tag;
            titleIconView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleIconViewClick:)];
            [titleIconView addGestureRecognizer:tap];
            [self addSubview:titleIconView];
        }
    }
    return self;
}

- (void)titleIconViewClick:(id)sender{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    
    long tagid=tap.view.tag;
    if ([self.delegate respondsToSelector:@selector(ShowOrderListPage:)] ) {
        [self.delegate ShowOrderListPage:tagid];
        NSLog(@"***你单击了:%ld ***",tagid);
    }
    else
    {
        NSLog(@"代理出错！！！");
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / DefaultRowNumbers;
    CGFloat height = self.bounds.size.height / (self.mens.count / DefaultRowNumbers);
    
    for (int i = 0; i < self.subviews.count; ++i) {
        AJTitleIconView *titleIconView = self.subviews[i];
        CGFloat viewX = (i % DefaultRowNumbers) * width;
        CGFloat viewY = (i / DefaultRowNumbers) * height;
        titleIconView.frame = CGRectMake(viewX, viewY, width, height);
    }
    
}


@end
