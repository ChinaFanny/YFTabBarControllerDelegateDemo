//
//  AppDelegate.m
//  YFTabBarControllerDelegateDemo
//
//  Created by MissYoung on 16/11/8.
//  Copyright © 2016年 Fanny. All rights reserved.
//

#import "AppDelegate.h"
#import "YXMainTabBarController.h"
#import "YFLoginViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property (nonatomic, strong) YXMainTabBarController *tabBarCtrl;
@property (nonatomic, assign) BOOL isLogin;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _tabBarCtrl = [storyboard instantiateInitialViewController];
    _tabBarCtrl.delegate = self;
    self.window.rootViewController = _tabBarCtrl;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

#pragma mark -- UITabBar Delegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        
        // 判断用户是否登录
        if (_isLogin) {
            _isLogin = NO;
            return YES;
        } else {
            [self presentLoginViewControllerWithComplationHandler:^(NSError *error) {
                if (!error) {
                    tabBarController.selectedIndex = 2; // 登录成功后进入我的模块
                    
                    [self.window makeKeyAndVisible];    // 同步一下
                    
                    _isLogin = YES;
                }
            }];
            return NO;
        }
    }
    else {
        return YES;
    }
}

- (void)presentLoginViewControllerWithComplationHandler:(void(^)(NSError* error))completionHandler {

    YFLoginViewController* vc = [[YFLoginViewController alloc] initWithNibName:@"YFLoginViewController" bundle:nil];
    [vc setLoginBlock:completionHandler];
    UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:vc];
    nc.navigationBar.tintColor = [UIColor blackColor];
//    [nc setNavigationBarHidden: YES];
    // TODO 设置一个登录成功delegate回调
    [self.window.rootViewController presentViewController:nc animated:YES completion:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
