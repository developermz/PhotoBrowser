//
//  ServiceManager.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ServiceManager.h"
#import "NetworkComponent.h"

@implementation ServiceManager

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
               failure:(void (^)(NSError *error))failure {
    //    NSDictionary *httpHeader = [self builderHttpHeader];
    //    NSDictionary *httpBody = [self builderHttpBody:urlString parameters:parameters];
    [self requestLogPrint:urlString httpHeader:nil parameters:parameters];
    [self httpRequestWithUrl:urlString
                     httpMethod:httpMethod
                     httpHeader:nil
                       httpBody:parameters
                       progress:nil
                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                            [self responseLogPrint:task.response.URL.absoluteString responseData:responseObject];
                            
                            if (![responseObject isKindOfClass:[NSDictionary class]]) {
                                [ProgressHUD showTextAlert:@"服务器数据错误"];
                                return;
                            }
                            
                            if (needExtraProcess) {
                                if (success) {
                                    success(responseObject);
                                }
                            }else {
                                NSDictionary *dic = (NSDictionary *)responseObject;
                                int code = [dic[@"code"] intValue];
                                if (code == 200) {
                                    if (success) {
                                        success(dic[@"result"]);
                                    }
                                }else {
                                    [ProgressHUD showTextAlert:dic[@"msg"]];
                                    
                                    if (failure) {
                                        failure(nil);
                                    }
                                }
                            }
                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                            [self errorLogPrint:error];
                            
                            if (failure) {
                                failure(error);
                            }
                        }];
}
+ (void)requestWithUrl:(NSString *)urlString
            httpMethod:(HttpMethod)httpMethod
            parameters:(NSDictionary *)parameters
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure {
    [self requestWithUrl:urlString httpMethod:httpMethod parameters:parameters needExtraProcess:NO success:success failure:failure];
}
+ (void)httpRequestWithUrl:(NSString *)urlString
                httpMethod:(HttpMethod)httpMethod
                httpHeader:(NSDictionary *)httpHeader
                  httpBody:(NSDictionary *)httpBody
                  progress:(void (^)(NSProgress *))progress
                   success:(RequestSuccessBlock)success
                   failure:(RequestFailureBlock)failure {
    switch(httpMethod){
        case HttpMethodGET:
            [NetworkComponent getWithUrl:urlString httpHeader:httpHeader httpBody:httpBody progress:progress success:success failure:failure];
            break;
        case HttpMethodPOST:
            
            break;
        case HttpMethodPUT:
            
            break;
        case HttpMethodDELETE:
            
            break;
            
        default:
            break;
    }
}

#pragma mark - 打印url、请求及响应参数、error
+ (void)requestLogPrint:(NSString *)urlString httpHeader:(NSDictionary *)httpHeader parameters:(NSDictionary *)parameters {
    DLog(@"\ncurrent Thread: %@  \nRequest URL: %@  \nHttp Header: %@  \nparameters: %@", [NSThread currentThread], urlString, httpHeader, parameters);
}

+ (void)responseLogPrint:(NSString *)urlString responseData:(NSDictionary *)responseData {
    DLog(@"\ncurrent Thread: %@  \nResponse URL: %@  \nResponse Data: %@", [NSThread currentThread], urlString, responseData);
}

+ (void)errorLogPrint:(NSError *)error {
    DLog(@"\ncurrent Thread: %@  \nURL: %@  \nerror code: %zd  \ndescription: %@", [NSThread currentThread], error.userInfo[NSURLErrorFailingURLErrorKey], error.code, error.localizedDescription);
}

@end
