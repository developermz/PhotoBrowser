//
//  AppDelegate+LaunchAndRoot.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "AppDelegate+LaunchAndRoot.h"
#import "MainTabBarController.h"

@implementation AppDelegate (LaunchAndRoot)

- (void)loadMainView {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = kWhiteColor;
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[MainTabBarController alloc] init];
}

@end
