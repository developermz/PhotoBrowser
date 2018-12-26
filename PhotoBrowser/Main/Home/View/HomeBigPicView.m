//
//  HomeBigPicView.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "HomeBigPicView.h"

@interface HomeBigPicView ()

@property (nonatomic, strong) UIImageView *bigPicImageView;

@end

@implementation HomeBigPicView

- (void)initialize {
    self.backgroundColor = [UIColor blackColor];
}

- (void)setupViews {
    [self addSubview:self.bigPicImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self addGestureRecognizer:tap];
}

- (void)setPicUrl:(NSString *)picUrl {
    _picUrl = picUrl;
    
    [self.bigPicImageView sd_setImageWithURL:[NSURL URLWithString:picUrl]];
}

- (void)setOriginCenter:(CGPoint)originCenter {
    _originCenter = self.center = originCenter;
}

- (void)show {
    self.hidden = NO;
    [UIView animateWithDuration:.25 animations:^{
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.bigPicImageView.frame = CGRectMake(0, 150, SCREEN_WIDTH, SCREEN_HEIGHT - 300);
    }];
}

- (void)hide {
    [UIView animateWithDuration:.25 animations:^{
        self.frame = CGRectMake(self.originCenter.x, self.originCenter.y, 0, 0);
        self.bigPicImageView.frame = CGRectZero;
    } completion:^(BOOL finished) {
        self.bigPicImageView.image = nil;
        self.hidden = YES;
    }];
}

#pragma mark - lazy
- (UIImageView *)bigPicImageView {
    if (!_bigPicImageView) {
        _bigPicImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bigPicImageView.userInteractionEnabled = YES;
        _bigPicImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bigPicImageView.backgroundColor = UIColorFromRGB(0xC2C7CE);
    }
    
    return _bigPicImageView;
}

@end
