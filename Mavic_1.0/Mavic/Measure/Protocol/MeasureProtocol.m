//
//  MeasureProtocol.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "MeasureProtocol.h"
#import "CommonEntities.h"

@interface MeasureProtocol ()

@property (strong, nonatomic) NSMutableArray *listDataPeripheral;
@property (strong, nonatomic) NSMutableArray *listDataSelectPeripherals;
@property (strong, nonatomic) NSMutableArray *listDataAdvertisement;
@property (strong, nonatomic) NSMutableArray *listDataRSSI;

@end

@implementation MeasureProtocol

- (instancetype)init {
    if (self = [super init]) {
    //用于保存peripheralTableView数据的数组
    _listDataPeripheral = [[NSMutableArray alloc] init];
    _listDataSelectPeripherals = [[NSMutableArray alloc] init];
    _listDataAdvertisement = [[NSMutableArray alloc] init];
    _listDataRSSI = [[NSMutableArray alloc] init];

    }
    return self;
}

#pragma mark - 代理:BTManagerDelegate

- (void) didUpdateState:(CBManagerState) state {
    NSLog(@"[MeasureProtocol]BLEManager state changed to %ld", (long)state);

}

#pragma mark 发现设备
- (void) didPeripheralFound:(CBPeripheral *)peripheral advertisementData:(BLEAdvertisementData *)advertisementData RSSI:(NSNumber *)RSSI {
    if ([peripheral.name isEqualToString:@"MI Band 2"]) {
        
    }
    NSLog(@"[MeasureProtocol]Device found:%@", peripheral.name);
    if ([_L_B_Peripheral.identifier isEqualToString:peripheral.identifier.UUIDString]) {
        self.didFoundPeripheral(peripheral, L_B_Aid);
    }
    if ([_L_T_Peripheral.identifier isEqualToString:peripheral.identifier.UUIDString]) {
        self.didFoundPeripheral(peripheral, L_T_Aid);
    }
    if ([_R_B_Peripheral.identifier isEqualToString:peripheral.identifier.UUIDString]) {
        self.didFoundPeripheral(peripheral, R_B_Aid);
    }
    if ([_R_T_Peripheral.identifier isEqualToString:peripheral.identifier.UUIDString]) {
        self.didFoundPeripheral(peripheral, R_T_Aid);
    }
}

#pragma mark 连接成功
- (void) didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"+++%@[MeasureProtocol]Connected", peripheral.name);
    for (int i = 0; i < _listDataPeripheral.count; i++) {
        if ([_listDataPeripheral objectAtIndex:i] == peripheral) {
            
            BLEAdvertisementData *bleAdvertisementData = (BLEAdvertisementData *)[_listDataAdvertisement objectAtIndex:i];
            NSData *data = bleAdvertisementData.manufacturerData;
            NSString *mac = [self convertToNSStringWithNSData:data];
            mac = [mac stringByReplacingOccurrencesOfString:@" " withString:@""];
            Peripheral *m_peripheral = [[Peripheral alloc] initWithCBPeripheral:peripheral];
            m_peripheral.macString   = mac;
            
            //            BLEServicesViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BLEServicesViewController"];
            //
            //            // 查找当前的外设，将没有连接的另一个外设建立连接
            //            for (CBPeripheral *p in _listDataSelectPeripherals) {
            //                if (p.state == CBPeripheralStateDisconnected) {
            //                    viewController.secondPeripheral = p;
            //                    NSInteger index = [_listDataPeripheral indexOfObject:p];
            //                    viewController.secondPeripheralData = [_listDataAdvertisement objectAtIndex:index];
            //                }
            //            }
            //            [self presentViewController:viewController animated:YES completion:nil];
            //
            //            [viewController setPeripheral:peripheral rssi:[_listDataRSSI objectAtIndex:i] advertisementData:[_listDataAdvertisement objectAtIndex:i]];
        }
    }
}

#pragma mark 连接失败
- (void) didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    NSLog(@"[MeasureProtocol]Fail to connect");
}

#pragma mark 连接断开
- (void) didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    NSLog(@"[MeasureProtocol]%@Disconnected", peripheral);
    for (int i = 0; i < _listDataPeripheral.count; i++) {
        if ([_listDataPeripheral objectAtIndex:i] == peripheral) {
            
        }
    }
}

#pragma mark 发现服务
- (void) didServicesFound:(CBPeripheral *)peripheral services:(NSArray<CBPeripheral *> *)services {
    NSLog(@"[MeasureProtocol]%lu services found", (unsigned long)services.count);
}

- (NSString *)convertToNSStringWithNSData:(NSData *)data
{
    NSMutableString *strTemp = [NSMutableString stringWithCapacity:[data length]*2];
    
    const unsigned char *szBuffer = [data bytes];
    
    for (NSInteger i=0; i < [data length]; ++i) {
        
        [strTemp appendFormat:@"%02lx",(unsigned long)szBuffer[i]];
        
    }
    
    return strTemp;
}

@end
