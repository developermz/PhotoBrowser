//
//  ThemeMacro.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

/** 颜色相关 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0]
#define UIColorFromRGBWithAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:a]

#define kTitleColor [UIColor blackColor]//标题颜色
#define kMainColor UIColorFromRGB(0xF98B1B)//主题景色
#define kBgColor UIColorFromRGB(0xF7F7F7)//背景颜色

#define kWhiteColor [UIColor whiteColor]//白色
