//
//  DevicesView.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/6.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DevicesView.h"
#import "YYKit.h"

@interface DevicesView ()

@property (nonatomic, strong) YYImage             *image;
@property (nonatomic, strong) YYAnimatedImageView *loadingView;

@end

@implementation DevicesView

- (void)awakeFromNib {
    [super awakeFromNib];
    _naviView.backgroundColor = UIColorHex(ffffff);
    _lineView.backgroundColor = UIColorHex(aaaaaa);
    _researchBtn.backgroundColor = UIColorHex(32d350);
    _researchBtn.layer.cornerRadius = 6;
    _researchBtn.layer.masksToBounds = YES;
    
    // 搞一个蒙板动画
    _image              = [YYImage imageNamed:@"loading"];
    _loadingView        = [[YYAnimatedImageView alloc] initWithImage:_image];
    _loadingView.frame  = CGRectMake(0, 0, 76, 62);
    _loadingView.center = CGPointMake(320/2.0, 360/2.0);

    [self addSubview:_loadingView];
}

- (void)showLoaingView:(BOOL)isShow {
    if (isShow) {
        _loadingView.image  = _image;
        _loadingView.hidden = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            EZLog(@"__________");
        });
    }
    else {
        _loadingView.image  = nil;
        _loadingView.hidden = YES;
    }
}

@end
