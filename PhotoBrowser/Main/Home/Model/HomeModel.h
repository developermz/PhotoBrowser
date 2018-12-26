//
//  HomeModel.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "BaseModel.h"
#import "HomeUrlModel.h"

@interface HomeModel : BaseModel

@property (nonatomic, strong) HomeUrlModel *urls;

@end
