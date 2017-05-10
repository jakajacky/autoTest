//
//  MeasureManager.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/7.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "MeasureManager.h"

@implementation MeasureManager

static MeasureManager *meaM = nil;

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        meaM = [[self alloc] init];
        meaM.lt_rf_list = [NSMutableArray array];
        meaM.lt_ecg_list = [NSMutableArray array];
        meaM.rt_rf_list = [NSMutableArray array];
        meaM.rt_ecg_list = [NSMutableArray array];
        
        meaM.lb_rf_list = [NSMutableArray array];
        meaM.lb_ecg_list = [NSMutableArray array];
        meaM.rb_rf_list = [NSMutableArray array];
        meaM.rb_ecg_list = [NSMutableArray array];
        
        meaM.lt_i_str = [NSMutableString string];
        meaM.lt_q_str = [NSMutableString string];
        
        meaM.lb_i_str = [NSMutableString string];
        meaM.lb_q_str = [NSMutableString string];
        
        meaM.rt_i_str = [NSMutableString string];
        meaM.rt_q_str = [NSMutableString string];
        
        meaM.rb_i_str = [NSMutableString string];
        meaM.rb_q_str = [NSMutableString string];
        
        meaM.lt_logs       = [NSMutableArray array];
        meaM.lb_logs       = [NSMutableArray array];
        meaM.rt_logs       = [NSMutableArray array];
        meaM.rb_logs       = [NSMutableArray array];
    });
    return meaM;
}

- (void)clearAllCache {
    // 清空可变字符串
    [self.lb_q_str deleteCharactersInRange:NSMakeRange(0, self.lb_q_str.length)];
    [self.lb_i_str deleteCharactersInRange:NSMakeRange(0, self.lb_i_str.length)];
    [self.lt_q_str deleteCharactersInRange:NSMakeRange(0, self.lt_q_str.length)];
    [self.lt_i_str deleteCharactersInRange:NSMakeRange(0, self.lt_i_str.length)];
    [self.rb_q_str deleteCharactersInRange:NSMakeRange(0, self.rb_q_str.length)];
    [self.rb_i_str deleteCharactersInRange:NSMakeRange(0, self.rb_i_str.length)];
    [self.rt_q_str deleteCharactersInRange:NSMakeRange(0, self.rt_q_str.length)];
    [self.rt_i_str deleteCharactersInRange:NSMakeRange(0, self.rt_i_str.length)];
    // 清空可变字典
    [self.lt_rf_list removeAllObjects];
    [self.lb_rf_list removeAllObjects];
    [self.rt_rf_list removeAllObjects];
    [self.rb_rf_list removeAllObjects];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        if (!meaM) {
            meaM = [super allocWithZone:zone];
        }
        return meaM;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
