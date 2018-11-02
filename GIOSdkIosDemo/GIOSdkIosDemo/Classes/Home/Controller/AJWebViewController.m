//
//  AJWebViewController.m
//  GIOSdkIosDemo
//
//  Created by ArJun on 16/6/8.
//  Copyright © 2016年 GrowingIO. All rights reserved.
//

#import "AJWebViewController.h"

#import "AJFlashViewController.h"

@interface AJWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) AJActivity *activity;
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation AJWebViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    [[BaseTabBarViewController sharedController]hidesTabBar:YES animated:YES];
}
- (instancetype)initWithActivity:(AJActivity *)activity
{
    self = [super init];
    self.activity = activity;
    return self;
}
/**
 *  控制器 view 显示完毕调用
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addSubview:self.webView];
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSString *urlStr=@"";
    int aid=[self.activity.aid intValue];
    switch (aid) {
        case 20206:
            urlStr=@"https://www.growingio.com/";
            break;
        case 20867:
            urlStr=@"https://www.growingio.com/growth-conference";
            break;
        case 20382:
            urlStr=@"https://www.growingio.com/ebook";
            break;
        case 20959:
            urlStr=@"https://www.growingio.com/about";
            break;
        case 20824:
            urlStr=@"https://mo.m.tmall.com/page/1741388?shop_id=73402183&item_id=539090524010&ts=20180913165922&checksum=697c00bc25f962044ccf50e3ee223bbe&sk=CAIYACAAKhxtbV8xMjg1MjU2Ml8xNzc4MDY0XzIyMzA2MTU1MM7DzA86IDA1YmJlNjBiMGU4MTM3MDA1YmQyYzI1NTAwMTY1YzE2YMeOgCNo0KWLaXCL055peMHp04HpXooBF2Jhbm5lcl9pdGVtc19jb2xsZWN0aW9u&ali_trackid=17_a283086ebe02aff4fbdf22bc2df23ad5&spm=a215s.7406091/A.home.2.";
            break;
        case 20979:
            urlStr=@"https://pages.tmall.com/wow/a/act/20548/upr?spm=a215s.7406091/A.home.5&utparam=%7B%22ranger_buckets_native%22%3A%225555%22%7D&wh_pid=industry-153254&wh_weex=true&wh_biz=tm&scm=20140664.1007_12948_104098_100200300000000_849_5_205672_56068.56068.96949&itemIds=570512143563&activityId=205672&item_id=570512143563&activity_id=205672";
            break;
        default:
            urlStr = [NSString stringWithFormat:@"http://m.beequick.cn/show/active?id=%@&locationHash=dd89f1dQaciSSWjOXvfrV0V7EqgKmdGLU0/YJceSpQ5LLiEVS8oMovWAQ&zchtid=5624&location_time=1458523110&cityid=2&hide_cart=0&show_reload=1&activitygroup=%@&bigids=%@&__v=ios4.13",self.activity.aid,self.activity.ext_params.activitygroup,self.activity.ext_params.bigids];
            break;
    }

    NSLog(@"urlStr  = %@",urlStr);
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = self.activity.name;
    self.webView = [[UIWebView alloc]init];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@",error);
}


@end
