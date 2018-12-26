//
//  MainTabBarController.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMenuItems];
}

- (void)loadMenuItems {
    self.tabBar.translucent = NO;
    self.tabBar.backgroundImage = nil;
    self.tabBar.shadowImage = nil;
    self.tabBar.barTintColor = UIColorFromRGB(0xFFFFFF);
    
    NSArray *normalItems = @[@"tab_home_dim",@"tab_mine_dim"];
    NSArray *selectItmes = @[@"tab_home_light",@"tab_mine_light"];
    NSArray *controllClass = @[@"HomeController",@"MineController"];
    NSArray *itemTitles = @[@"首页",@"我的"];
    NSMutableArray * controllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < normalItems.count; i++) {
        UIViewController *controller = [[NSClassFromString(controllClass[i]) alloc] init];
        BaseNavigationController *navigation = [[BaseNavigationController alloc] initWithRootViewController:controller];
        [controllers addObject:navigation];
        
        //设置图片
        navigation.tabBarItem.image = [[UIImage imageNamed:normalItems[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navigation.tabBarItem.selectedImage = [[UIImage imageNamed:selectItmes[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 设置tabbaritem 的title
        navigation.tabBarItem.title = itemTitles[i];
    }
    self.viewControllers = controllers;
}

@end
