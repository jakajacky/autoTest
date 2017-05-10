//
//  MNaviView.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/17.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "MNaviView.h"
#import "YYKit.h"
@implementation MNaviView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"MNaviView" owner:self options:nil] lastObject];
    self.contentView.frame = self.bounds;
    self.contentView.layer.cornerRadius  = 8.0;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.clipsToBounds       = NO;
    self.contentView.layer.borderColor   = UIColorHex(cccccc).CGColor;
    self.contentView.layer.shadowColor   = UIColorHex(000000).CGColor;
    self.contentView.layer.shadowOffset  = CGSizeMake(0, 2);
    self.contentView.layer.shadowRadius  = 1;
    self.contentView.layer.shadowOpacity = 0.09;
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    
    self.timerLabel.textColor = UIColorHex(ff8a00);
    
    self.sigImg.layer.cornerRadius = 6;
    self.sigImg.layer.masksToBounds = YES;
    self.sigImg.backgroundColor = UIColorHex(32d250);
    self.sigImg.hidden = YES;
}

@end
