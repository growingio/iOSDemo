//
//  AJUserShopCarTool.h
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/7/30.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJGoods.h"

@interface AJUserShopCarTool : NSObject
@property (nonatomic, strong) NSMutableArray <AJGoods *> *shopCar;

+ (instancetype)sharedInstance;
- (void)addSupermarkProductToShopCar:(AJGoods *)goods;
- (void)removeFromProductShopCar:(AJGoods*)goods;
- (CGFloat)getShopCarGoodsPrice ;
- (NSInteger)getShopCarGoodsNumber;
- (BOOL)isEmpty;

@end
