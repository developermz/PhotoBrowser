//
//  AccountManager.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

/** 用户id */
@property (nonatomic,copy) NSString *userid;

@property (nonatomic, copy) NSString *token;

@end
