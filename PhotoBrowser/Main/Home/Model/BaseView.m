//
//  BaseView.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
        [self setupViews];
        [self bindViewModel];
    }
    
    return self;
}

- (void)initialize {}

- (void)setupViews {}

- (void)bindViewModel {}

@end
