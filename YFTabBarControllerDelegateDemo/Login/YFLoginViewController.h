//
//  YFLoginViewController.h
//  YFTabBarControllerDelegateDemo
//
//  Created by MissYoung on 16/11/8.
//  Copyright © 2016年 Fanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFLoginViewController : UIViewController

@property (nonatomic, strong) void(^loginBlock)(NSError* error);

@end
