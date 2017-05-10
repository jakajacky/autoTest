//
//  DeviceManager.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DeviceManager.h"
#import "DevicesApi.h"

@interface DeviceManager ()

@property (nonatomic, strong) DevicesApi *api;

@end

@implementation DeviceManager

static DeviceManager *deviceM = nil;

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceM = [[self alloc] init];
    });
    return deviceM;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        if (!deviceM) {
            deviceM = [super allocWithZone:zone];
        }
        return deviceM;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)getLastPeripheralsInfo {
    NSArray *peripherals = [self.api getCurrentPeripheralsFormMainDB];
    for (Peripheral *p in peripherals) {
        switch (p.location) {
            case L_T_Aid:
                _L_T_Aid = p;
                break;
            case L_B_Aid:
                _L_B_Aid = p;
                break;
            case R_T_Aid:
                _R_T_Aid = p;
                break;
            case R_B_Aid:
                _R_B_Aid = p;
                break;
            default:
                break;
        }
    }
}

- (void)getHardwareVersion:(void(^)(NSString *))complete {
    // 从本地查
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    __block NSString *hardware = [def objectForKey:@"hardware"];
    
    Byte byte[] = {0x0a,0x04,0x02,0x00,0x06,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xA5,0xf0};
    NSData *data = [NSData dataWithBytes:byte length:sizeof(byte)];
    
    if (_L_T_CB_Characteristic && _L_T_CB_Peripheral) {
        
        [_L_T_CB_Peripheral writeValue:data forCharacteristic:_L_T_CB_Characteristic type:1];
    }
    else if (_L_B_CB_Characteristic && _L_B_CB_Peripheral) {
        [_L_B_CB_Peripheral writeValue:data forCharacteristic:_L_B_CB_Characteristic type:1];
    }
    else if (_R_T_CB_Characteristic && _R_T_CB_Peripheral) {
        [_R_T_CB_Peripheral writeValue:data forCharacteristic:_R_T_CB_Characteristic type:1];
    }
    else if (_R_B_CB_Characteristic && _R_B_CB_Peripheral) {
        [_R_B_CB_Peripheral writeValue:data forCharacteristic:_R_B_CB_Characteristic type:1];
    }
    else {
        complete(hardware);
    }
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"GetVersionNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSData *data = note.object;
        Byte *testByte = (Byte *)[data bytes];
        hardware = [NSString stringWithFormat:@"%c", testByte[4]];
        for (int i = 5; i < 10; i++) {
            hardware = [NSString stringWithFormat:@"%@%c", hardware, testByte[i]];
        }
        NSString *firmware = [NSString stringWithFormat:@"%c", testByte[10]];
        for (int i = 11; i < 16; i++) {
            firmware = [NSString stringWithFormat:@"%@%c", firmware, testByte[i]];
        }
        
        // 存到本地
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:hardware forKey:@"hardware"];
        [def synchronize];
        
        complete(hardware);
    }];
    
}

#pragma mark - properties

- (Peripheral *)L_B_Aid {
    if (!_L_B_Aid) {
        _L_B_Aid = [self.api getCurrentPeripheralWithLocation:L_B_Aid];
    }
    return _L_B_Aid;
}

- (Peripheral *)L_T_Aid {
    if (!_L_T_Aid) {
        _L_T_Aid = [self.api getCurrentPeripheralWithLocation:L_T_Aid];
    }
    return _L_T_Aid;
}

- (Peripheral *)R_B_Aid {
    if (!_R_B_Aid) {
        _R_B_Aid = [self.api getCurrentPeripheralWithLocation:R_B_Aid];
    }
    return _R_B_Aid;
}

- (Peripheral *)R_T_Aid {
    if (!_R_T_Aid) {
        _R_T_Aid = [self.api getCurrentPeripheralWithLocation:R_T_Aid];
    }
    return _R_T_Aid;
}

- (DevicesApi *)api {
    if (!_api) {
        _api = [DevicesApi biz];
    }
    return _api;
}

@end
