//
//  AJHomeViewController.m
//  GIOSdkIosDemo
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJHomeViewController.h"
#import "AJWebViewController.h"
#import "AJGoods.h"
#import "AJHomeCell.h"
#import "AJHomeCategoryCell.h"
#import "AJHomeHeadData.h"
#import "AJHomeHeadView.h"
#import <UIImageView+WebCache.h>

#import "RecommandHeadView.h"


#import "AJShowDetailViewController.h"
#import "AJFlashViewController.h"
#import "AJHomeCellTitleView.h"

//引入GrowingIO SDK,对详情页操作进行监控
#import "Growing.h"

@interface AJHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) AJHomeHeadData *homeHeadData;
@property (nonatomic, strong) AJHomeHeadView *homeheadView;
@property (nonatomic, strong) NSArray<AJGoods *> *freshHots;


@end

@implementation AJHomeViewController
static NSString  *homeCell = @"homeCell";
static NSString  *expandCell = @"expandCell";


#define ScreenW [UIScreen mainScreen].bounds.size.width

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[BaseTabBarViewController sharedController] hidesTabBar:NO animated:YES];
}
#pragma life sycle method
- (void)viewDidLoad{
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1];
    [self addNotification];
    [self buildCollectionView];
    [self buildTableHeadView];
    [self bulidTableViewRefresh];
    
}
- (void)addNotification{
    [AJNotification addObserver:self selector:@selector(homeTableHeadViewHeightDidChange:) name:HomeTableHeadViewHeightDidChange object:nil];
}
- (void)homeTableHeadViewHeightDidChange:(NSNotification *)notification{
    NSLog(@"height = %lf",[notification.object floatValue]);
    CGFloat height = [notification.object floatValue];
    CGFloat room = 10;
    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = height+10;
    self.homeheadView.frame = CGRectMake(0, -height-room, Width, height);
    
    self.collectionView.contentInset = UIEdgeInsetsMake(height+room, 0, 100, 0);
    self.collectionView.contentOffset = CGPointMake(0, -height-room);
    

}


- (void)buildCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 8;
    layout.minimumLineSpacing = 8;
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
   
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [_collectionView registerClass:[AJHomeCategoryCell class] forCellWithReuseIdentifier:homeCell];
    [_collectionView registerClass:[AJHomeCell class] forCellWithReuseIdentifier:expandCell];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //注册为你推荐head
    [_collectionView registerClass:[RecommandHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"recommendHeadViewID"];
    
 
    
}

- (void)buildTableHeadView{
    __weak typeof (self) weakSelf = self;
    [AJHomeHeadData loadHeadData:^(AJHomeHeadData *data, NSError *error) {
        weakSelf.homeHeadData = data;
        NSLog(@"data = %@",data);
        self.homeheadView = [[AJHomeHeadView alloc]initWithHeadData:data];
        self.homeheadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [weakSelf showActityDetail:type tag:tag];
        };
        [self.collectionView addSubview:self.homeheadView];
        NSLog(@"self.subviews = %@",self.view.subviews);
    }];
    
    [GoodsData loadGoodsData:^(NSArray<AJGoods *> *data, NSError *error) {
        weakSelf.freshHots = data;
        [self.collectionView reloadData];
    }];
}
- (void)bulidTableViewRefresh{
//    AJAnimationRefreshHeader *header = [AJAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefeshData)];
//    header.gifView.frame = CGRectMake(0, 0, 100, 100);
//    _collectionView.mj_header = header;
//    [_collectionView.mj_header beginRefreshing];
}
- (void)headerRefeshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collectionView.mj_header endRefreshing];
    });
}
//打开活动详情页
- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    AJActivity *cativity = actInfo.act_rows[tag].activity;
    //打开活动详情页统计
    NSLog(@"执行GrowingIO 打点操作，设置pvar变量：OpenActivityPage:%@，具体的打点方法请参照文档：https://docs.growingio.com/docs/sdk-integration/ios-sdk/#setpagevariable",cativity.name);
    [Growing setPageVariable:@{@"OpenActivityPage":cativity.name} toViewController:self];
    
    [self.navigationController pushViewController:[[AJWebViewController alloc]initWithActivity:cativity ] animated:YES];
    
}

//打开商品详情页
-(void)showGoodsDetail:(AJGoods *)goods{
    NSLog(@"打开商品详情页：%@",goods.name);
    //打开活动详情页统计
    NSLog(@"执行GrowingIO 打点操作，设置pvar变量：OpenDetailPage:%@，具体的打点方法请参照文档：https://docs.growingio.com/docs/sdk-integration/ios-sdk/#setpagevariable",goods.name);
    [Growing setPageVariable:@{@"OpenDetailPage":goods.name} toViewController:self];
    [self.navigationController pushViewController:[[AJShowDetailViewController alloc]initGoods:goods] animated:YES];
}



#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return self.homeHeadData.category.act_rows.count;
    }else{
        return self.freshHots.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AJHomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCell forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        cell.cellback = ^(AJGoods *goods){
        //打开详情页部分
        [weakSelf showGoodsDetail:goods];
            
        };
        cell.cellInfo = self.homeHeadData.category.act_rows[indexPath.row];
        return cell;
    }
    //为你推荐列表中打开详情页
    AJHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:expandCell forIndexPath:indexPath];
    NSLog(@"self.freshHots[indexPath.row] = %@",self.freshHots[indexPath.row]);
    AJGoods *goods = self.freshHots[indexPath.row];
    cell.goods = goods;
     //打开详情页部分
    __weak typeof(self) weakSelf = self;
    cell.cellback=^(AJGoods *goods){
        [weakSelf showGoodsDetail:goods];
    };
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeZero;
    if (indexPath.section == 0) {
        itemSize = CGSizeMake(Width, 330);
    }else if (indexPath.section == 1){
        itemSize = CGSizeMake((Width - HomeCollectionViewCellMargin * 2) * 0.5 - 4, 260);
    }
    return itemSize;
}

//尝试着为collectview添加头标识
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    //头部
    if(kind == UICollectionElementKindSectionHeader){
        if(indexPath.section == 1){
            RecommandHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"recommendHeadViewID" forIndexPath:indexPath];
            headerView.titleImgaeView.image = [UIImage imageNamed:@"SYwntj_title"];
            headerView.backgroundColor = [UIColor colorWithRed:255/255.0 green:211/255.0 blue:69/255.0 alpha:1.0];
            
            reusableview = headerView;
        }
    }
    return reusableview;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if(section == 1){//为你推荐标题宽度和高度
        return CGSizeMake(ScreenW, 50);
    }
    return CGSizeZero;
}


@end


