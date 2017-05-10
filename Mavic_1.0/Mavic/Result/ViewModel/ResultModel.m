//
//  ResultModel.m
//  Mavic
//
//  Created by XiaoQiang on 2017/5/8.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "ResultModel.h"
#import "ResultAPI.h"

@interface ResultModel ()

@property (nonatomic, strong) ResultAPI *resultApi;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ResultModel

- (void)reloadDataWith:(id)result {
    _l_pwv = [result[@"l_pwv"] floatValue];
    _r_pwv = [result[@"r_pwv"] floatValue];
    
    _signalQuality_leftHand  = [result[@"signalQuality_leftHand"] integerValue];
    _signalQuality_rightHand = [result[@"signalQuality_rightHand"] integerValue];
    _signalQuality_leftFoot  = [result[@"signalQuality_leftFoot"] integerValue];
    _signalQuality_rightFoot = [result[@"signalQuality_rightFoot"] integerValue];
    
    _l_ptt = [result[@"lPTT"] floatValue];
    _r_ptt = [result[@"rPTT"] floatValue];
    
}

- (void)getHistoryPWVResultWithUserId:(NSString *)Id completion:(void(^)(BOOL success))complete {
    _dataSource = [NSMutableArray array];
    [self.resultApi getHistoryPWVResultWithUserId:Id completion:^(BOOL success, id result, NSString *msg) {
        if (success) {
            
        }
        else {
            
        }
    }];
}

- (ResultAPI *)resultApi {
    if (!_resultApi) {
        _resultApi = [ResultAPI biz];
    }
    return _resultApi;
}

@end
