//
//  RFModel.h
//  Mavic
//
//  Created by XiaoQiang on 2017/4/28.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;
typedef enum : NSUInteger {
    MeasureStep_Advance,
    MeasureStep_Normal,
    MeasureStep_Result
} MeasureStep;

@interface RFModel : NSObject

@property (nonatomic, strong) Patient *patient;
@property (nonatomic, assign) BOOL isMale;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger height;

/*
 ** 加载数据
 */
- (void)reloadData;

/*
 ** 获取患者 全部信息
 */
- (NSString *)getPatientInfoWithStep:(MeasureStep)step;

@end
