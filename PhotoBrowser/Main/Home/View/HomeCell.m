//
//  HomeCell.m
//  PhotoBrowser
//
//  Created by meizhu on 2018/12/26.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initialize];
        [self setupViews];
    }
    
    return self;
}

- (void)initialize {
    self.backgroundColor = kWhiteColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupViews {
    [self addSubview:self.picImageView];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(15);
        make.trailing.equalTo(-15);
        make.top.equalTo(5);
        make.bottom.equalTo(-10);
    }];
}

- (void)setModel:(HomeModel *)model {
    _model = model;
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.urls.small] placeholderImage:[UIImage imageNamed:@"general_home_default"]];
}

#pragma mark - lazy
- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.userInteractionEnabled = YES;
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
        _picImageView.layer.cornerRadius = 5;
        _picImageView.layer.masksToBounds = YES;
    }
    
    return _picImageView;
}

@end
