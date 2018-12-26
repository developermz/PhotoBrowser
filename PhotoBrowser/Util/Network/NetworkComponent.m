//
//  NetworkComponent.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "NetworkComponent.h"

static NSTimeInterval kTimeOutInterval = 15.0f;
static AFHTTPSessionManager *_manager;

@implementation NetworkComponent

/**
 单例AFHTTPSessionManager对象
 
 @return 单例对象
 */
+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager =  [self managerWithBaseURL:kRequestServerDomain sessionConfiguration:NO];
    });
    
    return _manager;
}

#pragma mark -私有函数 配置sessionmanager
/**
 初始化AFHTTPSessionManager对象
 
 @param baseURL HTTP客户端的基础URL
 @param isconfiguration 是否创建托管会话配置。
 @return AFHTTPSessionManager对象
 */
+ (AFHTTPSessionManager *)managerWithBaseURL:(NSString *)baseURL sessionConfiguration:(BOOL)isconfiguration {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = nil;
    
    NSURL *url;
    if (baseURL) {
        url = [NSURL URLWithString:baseURL];
    }
    
    if (isconfiguration) {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
    } else {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    
    manager.operationQueue.maxConcurrentOperationCount = 4;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    return manager;
}

#pragma mark 网络请求方法调用
+ (NSURLSessionDataTask *_Nullable)getWithUrl:(NSString *_Nonnull)urlString
                                   httpHeader:(NSDictionary * _Nullable)httpHeader
                                     httpBody:(NSDictionary *_Nullable)httpBody
                                     progress:(ProgressBlock _Nullable)progress
                                      success:(RequestSuccessBlock _Nullable)success
                                      failure:(RequestFailureBlock _Nullable)failure {
    AFHTTPSessionManager *manager = [self shareManager];
    [self configRequestHttpHeader:httpHeader];
    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:httpBody progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:failure];
    
    return dataTask;
}

#pragma mark -私有函数 配置请求头以及响应参数处理
/**
 配置httpHeader参数
 @param httpHeader 配置httpHeader参数
 */
+ (void)configRequestHttpHeader:(NSDictionary *)httpHeader {
    if ([httpHeader isKindOfClass:[NSDictionary class]] && !httpHeader.count) {
        [httpHeader enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [[self shareManager].requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
}

@end
