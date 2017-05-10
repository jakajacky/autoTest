//
//  MeasureAPI.h
//  Mavic
//
//  Created by XiaoQiang on 2017/4/17.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DCBiz.h"

@interface MeasureAPI : DCBiz
- (void)uploadResultWithResult:(NSArray *)result completion:(void(^)(BOOL, id, NSString *))complete;
@end
