//
//  MineController.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "MineController.h"

@interface MineController ()

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 30)];
    textLabel.text = @"因布局而临时所用，暂不丰富内容";
    textLabel.font = [UIFont systemFontOfSize:20];
    textLabel.textColor = kTitleColor;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
}

@end
