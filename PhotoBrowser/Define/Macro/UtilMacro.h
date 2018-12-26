//
//  UtilMacro.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

/* App相关的宏定义 */

//状态栏高度
#define STATUS_BAR_HEIGHT (Is_Iphone_X ? 44 : 20)

//iphoneX navbar额外高度
#define NAVIGATION_BAR_HEIGHT_Extra (Is_Iphone_X ? 24 : 0)

//NavBar高度
#define NAVIGATION_BAR_HEIGHT 44

//状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT (STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)

//屏幕宽高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//标签栏高度
#define TABBAR_HEIGHT (Is_Iphone_X ? 83 : 49)
//iphoneX tabbar额外高度
#define TABBAR_HEIGHT_Extra (Is_Iphone_X ? 34 : 0)

//iphone适配比例
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_Iphone_X (Is_Iphone && (double)SCREEN_HEIGHT - (double)812 >= 0.0)

#define AdjustByWidth(x) ((x) * SCREEN_WIDTH / 375.0)
#define AdjustByHeight(x) ((x) * SCREEN_HEIGHT / 667.0)

//每页默认加载数量
#define kPageSize 10

//log
#if DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

// Masonry
#define MAS_SHORTHAND_GLOBALS
