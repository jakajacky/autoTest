//
//  L_T_MeasureProtocol.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/6.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#include <sys/time.h>
#import "L_T_MeasureProtocol.h"
#import <CoreBluetooth/CBService.h>
#import <CoreBluetooth/CBPeripheral.h>
#import "MeasureManager.h"
#import "DeviceManager.h"

@interface L_T_MeasureProtocol ()

@property (nonatomic, strong) MeasureManager *measureManager;

@end

@implementation L_T_MeasureProtocol

#pragma mark - 代理:BLEGATTServiceDelegate
#pragma mark 服务数据接收
-(void)bleGattService:(BLEGATTService *)bleGattService didDataReceived:(NSData *)revData {
    // 辨别设备
    CBCharacteristic *cb = [bleGattService getCharacteristics].firstObject;
//    NSLog(@"UUID：%@", cb.service.peripheral.identifier.UUIDString);
    if ([cb.service.peripheral.identifier.UUIDString isEqualToString:[DeviceManager defaultManager].L_T_Aid.identifier]) {
    
        Byte *testByte = (Byte *)[revData bytes];
        // Byte 转 10进制
        NSString *decStr = [NSString stringWithFormat:@"%d",testByte[0]];///10进制数
        NSMutableArray *by = [NSMutableArray array];
        for(int i=1;i<[revData length];i++) {
    //        printf("testByte = %d\n",testByte[i]);
            NSString *newDecStr = [NSString stringWithFormat:@"%d",testByte[i]];///10进制数
            if([newDecStr length]==1) {
                decStr = [NSString stringWithFormat:@"%@：0%@",decStr,newDecStr];
            }
            else {
                decStr = [NSString stringWithFormat:@"%@：%@",decStr,newDecStr];
            }
            if (i>1) {
                [by addObject:@(testByte[i])];
            }
        }
        EZLog(@"%@--%@", cb.service.peripheral.identifier.UUIDString, decStr);
        // 数据解析
        BOOL isEcg = YES;
        for(int i=0;i<[by count];i+=3) {
            int total = 0;
            total += [by[i] intValue]*256*256;
            if (i+1<by.count) {
                total += [by[i+1] intValue]*256;
            }
            if (i+2<by.count) {
                total += [by[i+2] intValue];
            }
            
            if (isEcg) {
                [self.measureManager.lt_ecg_list addObject:@(total)];
            }
            else {
                [self.measureManager.lt_rf_list addObject:@(total)];
            }
            isEcg = !isEcg;
            
        }
    }
    else if ([cb.service.peripheral.identifier.UUIDString isEqualToString:[DeviceManager defaultManager].R_T_Aid.identifier]) {
        Byte *testByte = (Byte *)[revData bytes];
        // Byte 转 10进制
        NSString *decStr = [NSString stringWithFormat:@"%d",testByte[0]];///10进制数
        NSMutableArray *by = [NSMutableArray array];
        for(int i=1;i<[revData length];i++) {
            //        printf("testByte = %d\n",testByte[i]);
            NSString *newDecStr = [NSString stringWithFormat:@"%d",testByte[i]];///10进制数
            if([newDecStr length]==1) {
                decStr = [NSString stringWithFormat:@"%@：0%@",decStr,newDecStr];
            }
            else {
                decStr = [NSString stringWithFormat:@"%@：%@",decStr,newDecStr];
            }
            if (i>1) {
                [by addObject:@(testByte[i])];
            }
        }
        EZLog(@"%@--%@", cb.service.peripheral.identifier.UUIDString, decStr);
        // 数据解析
        BOOL isEcg = YES;
        for(int i=0;i<[by count];i+=3) {
            int total = 0;
            total += [by[i] intValue]*256*256;
            if (i+1<by.count) {
                total += [by[i+1] intValue]*256;
            }
            if (i+2<by.count) {
                total += [by[i+2] intValue];
            }
            
            if (isEcg) {
                [self.measureManager.rt_ecg_list addObject:@(total)];
            }
            else {
                [self.measureManager.rt_rf_list addObject:@(total)];
            }
            isEcg = !isEcg;
            
        }

    }
    else if ([cb.service.peripheral.identifier.UUIDString isEqualToString:[DeviceManager defaultManager].L_B_Aid.identifier]) {
        Byte *testByte = (Byte *)[revData bytes];
        // Byte 转 10进制
        NSString *decStr = [NSString stringWithFormat:@"%d",testByte[0]];///10进制数
        NSMutableArray *by = [NSMutableArray array];
        for(int i=1;i<[revData length];i++) {
            //        printf("testByte = %d\n",testByte[i]);
            NSString *newDecStr = [NSString stringWithFormat:@"%d",testByte[i]];///10进制数
            if([newDecStr length]==1) {
                decStr = [NSString stringWithFormat:@"%@：0%@",decStr,newDecStr];
            }
            else {
                decStr = [NSString stringWithFormat:@"%@：%@",decStr,newDecStr];
            }
            if (i>1) {
                [by addObject:@(testByte[i])];
            }
        }
        EZLog(@"%@--%@", cb.service.peripheral.identifier.UUIDString, decStr);
        // 数据解析
        BOOL isEcg = YES;
        for(int i=0;i<[by count];i+=3) {
            int total = 0;
            total += [by[i] intValue]*256*256;
            if (i+1<by.count) {
                total += [by[i+1] intValue]*256;
            }
            if (i+2<by.count) {
                total += [by[i+2] intValue];
            }
            
            if (isEcg) {
                [self.measureManager.lb_ecg_list addObject:@(total)];
            }
            else {
                [self.measureManager.lb_rf_list addObject:@(total)];
            }
            isEcg = !isEcg;
            
        }
    }
    else if ([cb.service.peripheral.identifier.UUIDString isEqualToString:[DeviceManager defaultManager].R_B_Aid.identifier]) {
        Byte *testByte = (Byte *)[revData bytes];
        // Byte 转 10进制
        NSString *decStr = [NSString stringWithFormat:@"%d",testByte[0]];///10进制数
        NSMutableArray *by = [NSMutableArray array];
        for(int i=1;i<[revData length];i++) {
            //        printf("testByte = %d\n",testByte[i]);
            NSString *newDecStr = [NSString stringWithFormat:@"%d",testByte[i]];///10进制数
            if([newDecStr length]==1) {
                decStr = [NSString stringWithFormat:@"%@：0%@",decStr,newDecStr];
            }
            else {
                decStr = [NSString stringWithFormat:@"%@：%@",decStr,newDecStr];
            }
            if (i>1) {
                [by addObject:@(testByte[i])];
            }
        }
        EZLog(@"%@--%@", cb.service.peripheral.identifier.UUIDString, decStr);
        // 数据解析
        BOOL isEcg = YES;
        for(int i=0;i<[by count];i+=3) {
            int total = 0;
            total += [by[i] intValue]*256*256;
            if (i+1<by.count) {
                total += [by[i+1] intValue]*256;
            }
            if (i+2<by.count) {
                total += [by[i+2] intValue];
            }
            
            if (isEcg) {
                [self.measureManager.rb_ecg_list addObject:@(total)];
            }
            else {
                [self.measureManager.rb_rf_list addObject:@(total)];
            }
            isEcg = !isEcg;
            
        }
    }
    
}

#pragma mark 服务状态改变
-(void)bleGattService:(BLEGATTService *)bleGattService didStart:(BOOL)result {
    if (result == TRUE) {
        NSLog(@"[L_T_MeasureProtocol]%@ Service started", bleGattService);
    } else {
        NSLog(@"[L_T_MeasureProtocol]Service start fail");
    }
}

#pragma mark 是否可发送，以及可发送的字节数
- (void)bleGattService:(nonnull BLEGATTService *)bleGattService didFlowControl:(int)credit withMtu:(int)mtu {
    NSLog(@"credit = %d, mtu = %d", credit, mtu);
}

#pragma mark - BLEManagerDelegate
- (void) didUpdateState:(CBManagerState) state {
    NSLog(@"[Meassure]BLEManager state changed to %ld", (long)state);
    //    [self rescanPeripherals];
}

#pragma mark 发现设备
- (void) didPeripheralFound:(CBPeripheral *)peripheral advertisementData:(BLEAdvertisementData *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"[Meassure]Device found:%@", peripheral.name);
}

#pragma mark 连接成功
- (void) didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"+++%@[Meassure]Connected", peripheral.name);
    
}

#pragma mark 连接失败
- (void) didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    NSLog(@"[Meassure]Fail to connect");
}

#pragma mark 连接断开
- (void) didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    NSLog(@"[Meassure]%@Disconnected", peripheral.name);
    
}

#pragma mark 发现服务
- (void) didServicesFound:(CBPeripheral *)peripheral services:(NSArray<CBPeripheral *> *)services {
    NSLog(@"[Meassure]%lu services found", (unsigned long)services.count);
    
    
}

#pragma mark - properties
- (MeasureManager *)measureManager {
    return [MeasureManager defaultManager];
}

@end
