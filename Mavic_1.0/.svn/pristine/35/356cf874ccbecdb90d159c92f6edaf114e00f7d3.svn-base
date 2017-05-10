//
//  DeviceManager.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonEntities.h"
@interface DeviceManager : NSObject

@property (nonatomic, strong) Peripheral *L_T_Aid;
@property (nonatomic, strong) Peripheral *L_B_Aid;
@property (nonatomic, strong) Peripheral *R_T_Aid;
@property (nonatomic, strong) Peripheral *R_B_Aid;

@property (nonatomic, strong) CBPeripheral   *L_B_CB_Peripheral;
@property (nonatomic, strong) CBPeripheral   *R_B_CB_Peripheral;
@property (nonatomic, strong) CBPeripheral   *L_T_CB_Peripheral;
@property (nonatomic, strong) CBPeripheral   *R_T_CB_Peripheral;

@property (nonatomic, strong) CBCharacteristic   *L_B_CB_Characteristic;
@property (nonatomic, strong) CBCharacteristic   *R_B_CB_Characteristic;
@property (nonatomic, strong) CBCharacteristic   *L_T_CB_Characteristic;
@property (nonatomic, strong) CBCharacteristic   *R_T_CB_Characteristic;


/**
 * 单例
 */

+ (instancetype)defaultManager;

/**
 * 数据库中 获取上一次 已绑定的外设
 */
- (void)getLastPeripheralsInfo;

/**
 * 查询硬件版本
 */
- (void)getHardwareVersion:(void(^)(NSString *))complete;

@end
