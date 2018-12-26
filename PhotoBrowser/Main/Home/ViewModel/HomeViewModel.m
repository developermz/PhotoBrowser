//
//  HomeViewModel.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeModel.h"

#define kHomeCachePath [kPathCache stringByAppendingString:@"homeData.plist"]

@implementation HomeViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
    self.currentPage = 1;
}

- (RACCommand *)homeListCommand {
    if (!_homeListCommand) {
        @weakify(self);
        _homeListCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                @strongify(self);
                NSMutableDictionary *params  = [NSMutableDictionary dictionary];
                params[@"page"] = @(self.currentPage);
                params[@"per_page"] = @(kPageSize);
                
                [ServiceManager requestWithUrl:kRequestGetPhotoList httpMethod:HttpMethodGET parameters:params success:^(id responseObject) {
                    NSMutableArray *dataArr = [HomeModel mj_objectArrayWithKeyValuesArray:responseObject];
                    if (self.currentPage == 1) {
                        self.homeListArr = dataArr;
                        [self cacheHomeData:responseObject];
                    }else {
                        [self.homeListArr addObjectsFromArray:dataArr];
                    }
                    
                    [subscriber sendNext:responseObject];
                    [subscriber sendCompleted];
                } failure:^(NSError *error) {
                    [ProgressHUD showTextAlert:error.localizedDescription];
                    if (self.currentPage == 1 && !self.homeListArr.count) {
                        NSArray *cacheData = [self getHomeCacheData];
                        if (cacheData) {
                            self.homeListArr = [HomeModel mj_objectArrayWithKeyValuesArray:cacheData];
                            [subscriber sendNext:cacheData];
                        }else {
                            NSArray *response = [self getHomeData];
                            self.homeListArr = [HomeModel mj_objectArrayWithKeyValuesArray:response];
                            [self cacheHomeData:response];
                            [subscriber sendNext:response];
                        }
                        [subscriber sendCompleted];
                    }else {
                        [subscriber sendError:error];
                    }
                }];
                
                return nil;
            }];
        }];
    }
    return _homeListCommand;
}

- (NSMutableArray *)homeListArr {
    if (!_homeListArr) {
        _homeListArr = [NSMutableArray array];
    }
    
    return _homeListArr;
}

//获取虚拟数据
- (NSArray *)getHomeData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"HomeData" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonDataArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    return jsonDataArr;
}

#pragma mark - 缓存
- (void)cacheHomeData:(NSArray *)dataArr {
    if (dataArr) {
        [dataArr writeToFile:kHomeCachePath atomically:YES];
    }
}

- (NSArray *)getHomeCacheData {
    NSArray *arr = [NSArray arrayWithContentsOfFile:kHomeCachePath];
    return arr;
}

@end
