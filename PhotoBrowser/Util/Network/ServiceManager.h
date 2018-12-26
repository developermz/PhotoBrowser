//
//  ServiceManager.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject

/**
 *  http网络请求
 *
 *  @param urlString        请求网址路径
 *  @param httpMethod       请求方式
 *  @param parameters       请求参数
 *  @param needExtraProcess 值为YES，多业务逻辑处理
 *  @param success          成功回调
 *  @param failure          失败回调
 */
+ (void)requestWithUrl:(NSString *)urlString
            httpMethod:(HttpMethod)httpMethod
            parameters:(NSDictionary *)parameters
      needExtraProcess:(BOOL)needExtraProcess
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

/**
 * 默认网络请求，返回数据不做更多逻辑处理
 */
+ (void)requestWithUrl:(NSString *)urlString
            httpMethod:(HttpMethod)httpMethod
            parameters:(NSDictionary *)parameters
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

@end
