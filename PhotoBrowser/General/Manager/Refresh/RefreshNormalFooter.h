//
//  RefreshNormalFooter.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "MJRefreshAutoNormalFooter.h"

@interface RefreshNormalFooter : MJRefreshAutoNormalFooter

+ (MJRefreshAutoNormalFooter *)refreshNormalFooterWithRefreshingBlock:(RefreshBlock)refreshBlock;

@end
