//
//  LineView.h
//  Demo
//
//  Created by liuxingyu on 2017/4/11.
//  Copyright © 2017年 zhumengjiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AidPosition_LT,
    AidPosition_RT,
    AidPosition_LB,
    AidPosition_RB
} AidPosition;

@interface LineView : UIView


@property (nonatomic, strong) UIImageView *signalImg;

- (instancetype)initWithFrame:(CGRect)frame position:(AidPosition)position;
- (void)drawLines:(NSArray *)points;
- (void)startDrawWithOriginalData:(NSMutableArray *)data;
@end
