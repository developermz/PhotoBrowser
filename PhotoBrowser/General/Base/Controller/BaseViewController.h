//
//  BaseViewController.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)initialize;

- (void)setupViews;

- (void)bindViewModel;

- (void)requestData;

@end
