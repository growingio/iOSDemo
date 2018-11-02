//
//  AppDelegate.m
//  GIOSdkIosDemo
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AppDelegate.h"
#import "AJAppConst.h"
#import "AJMainTabBarController.h"
//添加对GrowingIO SDK的头引用
#import "Growing.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setAppStyle];
    [self buildKeyWindow];
    //初始化SDK,详细步骤参照文档：https://docs.growingio.com/docs/sdk-integration/ios-sdk/
    // 启动GrowingIO
    [Growing startWithAccountId:@"0a1b4118dd954ec3bcc69da5138bdb96"];//此accountid为测试使用，请替换为您的项目ID
    //开启日志输出
    [Growing setEnableLog:YES];
    return YES;
}

- (void)buildKeyWindow{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    NSString *isFirestOpenApp = [[NSUserDefaults standardUserDefaults]objectForKey:IsFirstOpenApp];
    if (isFirestOpenApp == nil) {
    #warning mark - 这里正常是跳入到版本新特新界面
        [self showMainTabBarController];
        [[NSUserDefaults standardUserDefaults]setObject:IsFirstOpenApp forKey:IsFirstOpenApp];
    }else
    {
        [self showMainTabBarController];
    }
}

- (void)setAppStyle{
    UITabBar *item = [UITabBar appearance];
    item.tintColor = [UIColor orangeColor];
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 禁止透明度
    navigationBar.translucent = NO;
}

- (void)showMainTabBarController
{
    self.window.rootViewController = [[AJMainTabBarController alloc]init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([Growing handleUrl:url]) {
        return YES;
    }
    return NO;
}

@end
