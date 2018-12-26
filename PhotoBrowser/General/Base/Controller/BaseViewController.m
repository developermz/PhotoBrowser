//
//  BaseViewController.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController *baseVC = [super allocWithZone:zone];
    @weakify(baseVC)
    [[baseVC rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(baseVC)
        [baseVC initialize];
        [baseVC setupViews];
        [baseVC bindViewModel];
        [baseVC requestData];
    }];
    
    return baseVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = kWhiteColor;
}

- (void)initialize {}

- (void)setupViews {}

- (void)bindViewModel {}

- (void)requestData {}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
