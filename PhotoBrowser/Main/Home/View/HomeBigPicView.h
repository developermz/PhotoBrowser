//
//  HomeBigPicView.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "BaseView.h"

@interface HomeBigPicView : BaseView

@property (nonatomic, copy) NSString *picUrl;

/** 动画变大前的中心点 */
@property (nonatomic, assign) CGPoint originCenter;

- (void)show;

- (void)hide;

@end
