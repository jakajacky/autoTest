//
//  DevicesManager.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "DevicesApi.h"

@interface DevicesApi ()

@property (nonatomic, strong) DCDatabase *mainDatabase;

@end

@implementation DevicesApi

- (void)saveCurrentPeripheral:(Peripheral *)peripheral {
    self.mainDatabase.allowsLogError = YES;
    self.mainDatabase.allowsLogStatement = YES;
    [self.mainDatabase updateObjects:@[peripheral]];
}

- (NSArray *)getCurrentPeripheralsFormMainDB {
    NSString *sql = [NSString stringWithFormat:
                     @"SELECT * FROM %@",
                     [Peripheral tableName]];
    
    NSArray *result = [self.mainDatabase query:sql withArguments:@[] convertTo:[Peripheral class]];
    
    return result;

}

- (Peripheral *)getCurrentPeripheralWithLocation:(Location)loc {
    NSString *sql = [NSString stringWithFormat:
                     @"SELECT * FROM %@ WHERE location = ?",
                     [Peripheral tableName]];
    
    NSArray *result = [self.mainDatabase query:sql withArguments:@[@(loc)] convertTo:[Peripheral class]];
    
    return result.firstObject;
    
}

- (void)removePeripheral:(Peripheral *)peripheral {
    NSString *sql = [NSString stringWithFormat:
                     @"DELETE FROM %@ WHERE location = ? AND identifier = ?",
                     [Peripheral tableName]];
    
    [self.mainDatabase update:sql withArguments:@[@(peripheral.location), peripheral.identifier]];
}

- (DCDatabase *)mainDatabase {
    return [self database:@"main.db" withKey:@"1234567890ABCDEF"];
}

@end
