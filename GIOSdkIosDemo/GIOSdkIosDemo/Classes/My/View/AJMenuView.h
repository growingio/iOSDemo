//
//  AJMenuView.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJTitleIconAction.h"

@protocol AJMenuViewDelegate <NSObject>
-(void) ShowOrderListPage:(long )vtid;
@end

@interface AJMenuView : UIView

@property (nonatomic, weak) id<AJMenuViewDelegate> delegate;
- (instancetype)initMenu:(NSArray <AJTitleIconAction *>*)mens WithLine:(BOOL)line;

@end
