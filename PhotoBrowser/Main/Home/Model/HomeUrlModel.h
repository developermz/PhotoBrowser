//
//  HomeUrlModel.h
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "BaseModel.h"

@interface HomeUrlModel : BaseModel

@property (nonatomic, copy) NSString *raw;
@property (nonatomic, copy) NSString *full;
@property (nonatomic, copy) NSString *regular;
@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *thumb;

@end
