//
//  SignalQualityView.m
//  Mavic
//
//  Created by XiaoQiang on 2017/5/4.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "SignalQualityView.h"
#import "YYKit.h"

@interface SignalQualityView ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation SignalQualityView

- (void)awakeFromNib {
    [super awakeFromNib];
    _progressLayer = [[CAShapeLayer alloc] init];
    
    _progressLayer.backgroundColor = UIColorHex(32d250).CGColor;
    _progressLayer.fillColor   = _progressLayer.backgroundColor;
    _progressLayer.strokeColor = _progressLayer.backgroundColor;
    _progressLayer.borderWidth = 0;
    [self.layer addSublayer:_progressLayer];
}

- (void)drawRect:(CGRect)rect {
    
    CGPathRef oldPath = _progressLayer.path;
    
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, _progress*10, self.height), nil);
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.fromValue = (__bridge id _Nullable)(oldPath);
    anim.toValue   = (__bridge id _Nullable)(path);
    anim.duration = 0;
    _progressLayer.path = path;
    [_progressLayer addAnimation:anim forKey:@"path"];
    
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    [self setNeedsDisplay];
}

@end
