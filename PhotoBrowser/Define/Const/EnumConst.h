//
//  EnumConst.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

/* HTTP请求类别 */
typedef NS_ENUM(NSInteger, HttpMethod) {
    HttpMethodGET,
    HttpMethodPOST,
    HttpMethodPUT,
    HttpMethodDELETE
};

// 刷新结果
typedef NS_ENUM(NSUInteger, RefreshState) {
    HeaderRefresh_HasMoreData = 1,
    HeaderRefresh_HasNoMoreData,
    HeaderRefresh_HasNoData,
    FooterRefresh_HasMoreData,
    FooterRefresh_HasNoMoreData,
    RefreshError
};
