//
//  ResultModel.h
//  Mavic
//
//  Created by XiaoQiang on 2017/5/8.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject

@property (nonatomic, assign) CGFloat l_pwv;
@property (nonatomic, assign) CGFloat r_pwv;

@property (nonatomic, assign) CGFloat l_ptt;
@property (nonatomic, assign) CGFloat r_ptt;

@property (nonatomic, assign) NSInteger signalQuality_leftHand;
@property (nonatomic, assign) NSInteger signalQuality_rightHand;
@property (nonatomic, assign) NSInteger signalQuality_leftFoot;
@property (nonatomic, assign) NSInteger signalQuality_rightFoot;

- (void)reloadDataWith:(id)result;

/*
 ** 获取历史PWV数据
 */
- (void)getHistoryPWVResultWithUserId:(NSString *)Id completion:(void(^)(BOOL success))complete;

@end
