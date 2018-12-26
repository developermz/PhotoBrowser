//
//  HomeTableView.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeCell.h"
#import "HomeBigPicView.h"

@interface HomeTableView ()<UITableViewDataSource, UITableViewDelegate>

/** 点击显示的大图 */
@property (nonatomic, strong) HomeBigPicView *bigPicView;

@end

@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style viewModel:(HomeViewModel *)viewModel {
    if (self = [super initWithFrame:frame style:style]) {
        _viewModel = viewModel;
        [self initialize];
        [self setupViews];
        [self bindViewModel];
    }
    
    return self;
}

- (void)initialize {
    self.backgroundColor = kWhiteColor;
    self.showsVerticalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
    self.tableFooterView = [UIView new];
}
- (void)setupViews {
}
- (void)bindViewModel {
}

#pragma mark -UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.homeListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"homeCell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.model = self.viewModel.homeListArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdjustByWidth(220);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGPoint center = [tableView convertPoint:cell.center toView:[UIApplication sharedApplication].keyWindow];
    self.bigPicView.originCenter = center;
    [self.bigPicView show];
    self.bigPicView.picUrl = cell.model.urls.regular;
}

#pragma mark - lazy
- (HomeBigPicView *)bigPicView {
    if (!_bigPicView) {
        _bigPicView = [[HomeBigPicView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:_bigPicView];
    }
    
    return _bigPicView;
}

@end
