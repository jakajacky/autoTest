//
//  BLEBatteryService.h
//  iBridgeLib
//
//  Created by qiuwenqing on 15/11/23.
//  Copyright © 2015年 IVT. All rights reserved.
//

#import "BLEService.h"

@interface BLEBatteryService : BLEService

@property (readonly,nonatomic) unsigned char batteryLevel;

@end
