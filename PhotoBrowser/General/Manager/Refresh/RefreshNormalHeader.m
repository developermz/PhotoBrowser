//
//  RefreshNormalHeader.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "RefreshNormalHeader.h"

@implementation RefreshNormalHeader

+ (MJRefreshNormalHeader *)refreshHeaderWithRefreshingBlock:(RefreshBlock)refreshBlock {
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (refreshBlock) {
            refreshBlock();
        }
    }];
    refreshHeader.ignoredScrollViewContentInsetTop = -10;
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    [refreshHeader setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [refreshHeader setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    [refreshHeader setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    
    return refreshHeader;
}

@end
