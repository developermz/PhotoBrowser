//
//  NetworkComponent.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^RequestSuccessBlock)(NSURLSessionDataTask *_Nonnull task, id  _Nullable responseObject);
typedef void(^RequestFailureBlock)(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error);
typedef void(^ProgressBlock)(NSProgress * _Nonnull progress);

@interface NetworkComponent : NSObject

/**
 单例AFHTTPSessionManager对象
 
 @return 单例对象
 */
+ (AFHTTPSessionManager *_Nonnull)shareManager;

/**
 *  http的GET请求
 *
 *  @param urlString            请求网址路径
 *  @param httpHeader           Header请求参数
 *  @param httpBody             Body请求参数
 *  @param success              成功回调
 *  @param failure              失败回调
 *
 *  @return 返回NSURLSessionDataTask实例
 */
+ (NSURLSessionDataTask *_Nullable)getWithUrl:(NSString *_Nonnull)urlString
                                   httpHeader:(NSDictionary * _Nullable)httpHeader
                                     httpBody:(NSDictionary *_Nullable)httpBody
                                     progress:(ProgressBlock _Nullable)progress
                                      success:(RequestSuccessBlock _Nullable)success
                                      failure:(RequestFailureBlock _Nullable)failure;

@end
