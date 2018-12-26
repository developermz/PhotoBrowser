//
//  RefreshManager.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "RefreshManager.h"

@implementation RefreshManager

+ (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollView footerRefreshingBlock:(void (^)(void))refreshingBlock {
    switch (state) {
        case HeaderRefresh_HasMoreData: {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer resetNoMoreData];
            if (scrollView.mj_footer == nil) {
                scrollView.mj_footer = [RefreshNormalFooter refreshNormalFooterWithRefreshingBlock:^{
                    if (refreshingBlock) {
                        refreshingBlock();
                    }
                }];
            }
        }
            break;
        case HeaderRefresh_HasNoMoreData: {
            [scrollView.mj_header endRefreshing];
            if (scrollView.mj_footer == nil) {
                scrollView.mj_footer = [RefreshNormalFooter refreshNormalFooterWithRefreshingBlock:nil];
            }
            [scrollView.mj_footer endRefreshingWithNoMoreData];
        }
            break;
        case HeaderRefresh_HasNoData: {
            [scrollView.mj_header endRefreshing];
            scrollView.mj_footer = nil;
        }
            break;
        case FooterRefresh_HasMoreData: {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer resetNoMoreData];
            [scrollView.mj_footer endRefreshing];
        }
            break;
        case FooterRefresh_HasNoMoreData: {
            [scrollView.mj_header endRefreshing];
            [scrollView.mj_footer endRefreshingWithNoMoreData];
        }
            break;
        case RefreshError: {
            [scrollView.mj_header endRefreshing];
            if (scrollView.mj_footer.state == MJRefreshStateNoMoreData) {
                [scrollView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [scrollView.mj_footer endRefreshing];
            }
        }
            break;
        default:
            break;
    };
}

@end
