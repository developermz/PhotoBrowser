//
//  HomeController.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "HomeController.h"
#import "HomeTableView.h"

@interface HomeController ()

@property (nonatomic, strong) HomeTableView *homeTV;

@property (nonatomic, strong) HomeViewModel *homeVM;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
}

- (void)setupViews {
    [self.view addSubview:self.homeTV];
    
    [self.homeTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
}

- (void)bindViewModel {
    @weakify(self);
    //获取非置顶资讯
    [self.homeVM.homeListCommand.executionSignals.switchToLatest subscribeNext:^(NSArray *x) {
        @strongify(self);
        [self.homeTV reloadData];
        
        //防止服务端数据结构出错
        if (![x isKindOfClass:[NSArray class]]) {
            x = @[];
        }
        
        RefreshState state;
        if (self.homeVM.currentPage == 1) {
            if (x.count >= kPageSize) {
                state = HeaderRefresh_HasMoreData;
            }else if (x.count > 0 && x.count < kPageSize) {
                state = HeaderRefresh_HasNoMoreData;
            }else {
                state = HeaderRefresh_HasNoData;
            }
        }else {
            state = x.count >= kPageSize ? FooterRefresh_HasMoreData : FooterRefresh_HasNoMoreData;
        }
        [self endRefreshingWithState:state];
    }];
    [self.homeVM.homeListCommand.errors subscribeNext:^(NSError * _Nullable x) {
        @strongify(self);
        [self endRefreshingWithState:RefreshError];
    }];
    
    [[self.homeVM.homeListCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        if ([x boolValue]) {
            [ProgressHUD showHudInView:self.homeTV];
        } else {
            [ProgressHUD hideHUDForView:self.homeTV];
        }
    }];
}

- (void)requestData {
    [self.homeVM.homeListCommand execute:nil];
}

//下拉刷新和上拉加载更多的结果处理
- (void)endRefreshingWithState:(RefreshState)state {
    @weakify(self);
    [RefreshManager endRefreshingWithState:state scrollView:self.homeTV footerRefreshingBlock:^{
        @strongify(self);
        self.homeVM.currentPage++;
        [self requestData];
    }];
}

#pragma mark - lazy
- (HomeTableView *)homeTV {
    if (!_homeTV) {
        _homeTV = [[HomeTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain viewModel:self.homeVM];
        @weakify(self);
        _homeTV.mj_header = [RefreshNormalHeader refreshHeaderWithRefreshingBlock:^{
            @strongify(self);
            self.homeVM.currentPage = 1;
            [self requestData];
        }];
    }
    
    return _homeTV;
}

- (HomeViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [[HomeViewModel alloc] init];
    }
    
    return _homeVM;
}

@end
