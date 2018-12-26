//
//  ProgressHud.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ProgressHUD.h"

@implementation ProgressHUD

#pragma mark - text提示
+ (void)showTextAlert:(NSString *)text {
    [self showTextAlert:text afterDismiss:2.f];
}

+ (void)showTextAlert:(NSString *)text afterDismiss:(CGFloat)secs {
    if (![text isKindOfClass:[NSString class]] || !text.length) return;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    ProgressHUD *hud = [ProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.textAlignment = NSTextAlignmentCenter;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.label.numberOfLines = 0;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:.2 alpha:.8];
    [hud hideAnimated:YES afterDelay:secs];
}

#pragma mark - 加载hud
+ (ProgressHUD *)showHudInView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    
    ProgressHUD *hud = [ProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    return hud;
}

+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}

@end
