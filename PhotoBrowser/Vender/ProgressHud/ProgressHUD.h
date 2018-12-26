//
//  ProgressHud.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "MBProgressHUD.h"

@interface ProgressHUD : MBProgressHUD

// text提示
+ (void)showTextAlert:(NSString *)text;
+ (void)showTextAlert:(NSString *)text afterDismiss:(CGFloat)secs;

// 加载hud
+ (ProgressHUD *)showHudInView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;

@end
