//
//  ResultAPI.h
//  Mavic
//
//  Created by XiaoQiang on 2017/5/10.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DCBiz.h"

@interface ResultAPI : DCBiz

/*
 ** 获取历史PWV数据
 */
- (void)getHistoryPWVResultWithUserId:(NSString *)Id completion:(void(^)(BOOL success,id result, NSString *msg))complete;

@end
