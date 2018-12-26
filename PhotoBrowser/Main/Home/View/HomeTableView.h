//
//  HomeTableView.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"

@interface HomeTableView : UITableView

@property (nonatomic, strong) HomeViewModel *viewModel;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style viewModel:(HomeViewModel *)viewModel;

@end
