//
//  DevicesManager.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DCBiz.h"
#import "CommonEntities.h"
@interface DevicesApi : DCBiz

- (void)saveCurrentPeripheral:(Peripheral *)peripheral;
- (void)removePeripheral:(Peripheral *)peripheral;
- (NSArray *)getCurrentPeripheralsFormMainDB;
- (Peripheral *)getCurrentPeripheralWithLocation:(Location)loc;
@end
