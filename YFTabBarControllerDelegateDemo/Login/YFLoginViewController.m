//
//  YFLoginViewController.m
//  YFTabBarControllerDelegateDemo
//
//  Created by MissYoung on 16/11/8.
//  Copyright © 2016年 Fanny. All rights reserved.
//

#import "YFLoginViewController.h"

@interface YFLoginViewController ()

@end

@implementation YFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"登录";
    
    [self customBackButton];
}


-(void)customBackButton
{
    // 设置返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 50, 30);
    [backButton setImage:[UIImage imageNamed:@"icon_Return"] forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [backButton addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

-(void)goBackAction:(id)sender
{
    if (_loginBlock) {
        _loginBlock(nil);
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
