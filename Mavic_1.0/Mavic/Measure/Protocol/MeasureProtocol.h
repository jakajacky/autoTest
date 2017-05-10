//
//  MeasureProtocol.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLEManager.h"
#import "CommonEntities.h"

typedef void(^DidFoundPeraipheralBlock)(CBPeripheral *, Location);

@interface MeasureProtocol : NSObject<BLEManagerDelegate>

@property (nonatomic, strong) Peripheral *L_B_Peripheral;
@property (nonatomic, strong) Peripheral *R_B_Peripheral;
@property (nonatomic, strong) Peripheral *L_T_Peripheral;
@property (nonatomic, strong) Peripheral *R_T_Peripheral;

@property (nonatomic, copy)   DidFoundPeraipheralBlock didFoundPeripheral;

@end
