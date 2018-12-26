//
//  RefreshNormalHeader.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "MJRefreshNormalHeader.h"

typedef void(^RefreshBlock)(void);

@interface RefreshNormalHeader : MJRefreshNormalHeader

+ (MJRefreshNormalHeader *)refreshHeaderWithRefreshingBlock:(RefreshBlock)refreshBlock;

@end
