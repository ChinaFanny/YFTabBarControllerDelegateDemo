//
//  YXMainTabBarController.m
//  YFTabBarControllerDelegateDemo
//
//  Created by MissYoung on 16/11/8.
//  Copyright © 2016年 Fanny. All rights reserved.
//

#import "YXMainTabBarController.h"

@interface YXMainTabBarController ()

@end

@implementation YXMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //
    // init storyboard
    //
    UIStoryboard *homeStoryBoard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIStoryboard *messageStoryBoard = [UIStoryboard storyboardWithName:@"Message" bundle:nil];
    UIStoryboard *meStoryBoard = [UIStoryboard storyboardWithName:@"Me" bundle:nil];
    
    UIViewController *homeContrl = [homeStoryBoard instantiateInitialViewController];
    UIViewController *messageContrl = [messageStoryBoard instantiateInitialViewController];
    UIViewController *meContrl = [meStoryBoard instantiateInitialViewController];
    
    //
    // set title and image
    //
    [homeContrl setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_discoverHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [messageContrl setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"tabbar_mainframe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [meContrl setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    
    self.tabBar.tintColor = [UIColor colorWithRed:0/255.0f green:186.0f/255.0f blue:59.0f/255.0f alpha:1];
    [self setViewControllers:@[homeContrl,messageContrl,meContrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
