//
//  RefreshNormalFooter.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "RefreshNormalFooter.h"

@implementation RefreshNormalFooter

+ (MJRefreshAutoNormalFooter *)refreshNormalFooterWithRefreshingBlock:(RefreshBlock)refreshBlock {
    MJRefreshAutoNormalFooter *refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (refreshBlock) {
            refreshBlock();
        }
    }];
    
    [refreshFooter setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [refreshFooter setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [refreshFooter setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    refreshFooter.stateLabel.font = [UIFont systemFontOfSize:14];
    refreshFooter.stateLabel.textColor = UIColorFromRGB(0xC2C7CE);
    
    return refreshFooter;
}

@end
