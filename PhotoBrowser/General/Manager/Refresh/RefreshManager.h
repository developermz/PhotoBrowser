//
//  RefreshManager.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RefreshNormalHeader.h"
#import "RefreshNormalFooter.h"

@interface RefreshManager : NSObject

+ (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollView footerRefreshingBlock:(void (^)(void))refreshingBlock;

@end
